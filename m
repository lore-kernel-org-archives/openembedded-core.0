Return-Path: <michael@rndt.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C542F99C63
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 20:08:04 +0000 (UTC)
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54266.1776456476755708287
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 13:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rndt.dev header.s=default header.b=CZtDzd6/;
 spf=pass (domain: rndt.dev, ip: 35.82.102.206, mailfrom: michael@rndt.dev)
Received: from titan.fritz.box (unknown [46.253.78.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: michael@rndt.dev)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id EE3264758C5;
	Fri, 17 Apr 2026 20:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rndt.dev; s=default;
	t=1776456476; bh=L6BO7aG/KH6pbf+oya1v1JM+4EC1fkBw/QfCSQoNMXk=;
	h=From:To:Cc:Subject:Date;
	b=CZtDzd6/tzrJ58i16KQQ/keC/xsIS/1//JNf20OqocbMZCTGjxaLT81zE1584sC4F
	 v6zF+UGDmIQMpSn8xawnXElPhECALvPDfECZ2rsykWsr32S64/sk4MgAjV+QAwKw8M
	 xSk4ign1jIdHPUD7QKOGNFuwXIF65dbisqmySoyQ=
From: Michael Arndt <michael@rndt.dev>
To: openembedded-core@lists.openembedded.org
Cc: Michael Arndt <michael@rndt.dev>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] sstate: Fail on file systems without hard link support
Date: Fri, 17 Apr 2026 22:07:09 +0200
Message-ID: <20260417200709.96501-1-michael@rndt.dev>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 20:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235512

The sstate can only work reliably when the file system has support for ha=
rd
links. Previously this error was silenced, now the build fails and the us=
er is
informed about the problem.

Signed-off-by: Michael Arndt <michael@rndt.dev>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sst=
ate.bbclass
index 88449d19c7..1d41d9bc20 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -787,6 +787,7 @@ sstate_task_postfunc[dirs] =3D "${WORKDIR}"
 # and renamed in place once created.
 python sstate_create_and_sign_package () {
     from pathlib import Path
+    import errno
=20
     # Best effort touch
     def touch(file):
@@ -806,6 +807,9 @@ python sstate_create_and_sign_package () {
             else:
                 os.link(src, dst)
             return True
+        except OSError as e:
+            if e.errno =3D=3D errno.ENOSYS:
+                bb.fatal("sstate is only supported on file systems with =
hard link support: %s" % e)
         except:
             pass
=20

