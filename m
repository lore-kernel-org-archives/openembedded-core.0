Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C58C54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 13:41:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.102016.1674826858034641449
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 05:40:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FF852B;
	Fri, 27 Jan 2023 05:41:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A5B33F64C;
	Fri, 27 Jan 2023 05:40:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] Revert "cve-update-db-native: show IP on failure"
Date: Fri, 27 Jan 2023 13:40:55 +0000
Message-Id: <20230127134055.1870465-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 13:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176445

The bug this was intended to find has been resolved, so we don't need
this extra noise in the logs.

This reverts commit bd1edfa3d5b1c24cd1192620f7085ee1df03e1af.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-core/meta/cve-update-db-native.bb
index e042e67b09a..079f062f79b 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -130,10 +130,7 @@ def update_db_file(db_tmp_file, d):
                 response =3D urllib.request.urlopen(meta_url, timeout=3D=
cve_socket_timeout)
             except urllib.error.URLError as e:
                 cve_f.write('Warning: CVE db update error, Unable to fet=
ch CVE data.\n\n')
-                bb.warn("Failed to fetch CVE data (%s)" % e)
-                import socket
-                result =3D socket.getaddrinfo("nvd.nist.gov", 443, proto=
=3Dsocket.IPPROTO_TCP)
-                bb.warn("Host IPs are %s" % (", ".join(t[4][0] for t in =
result)))
+                bb.warn("Failed to fetch CVE data (%s)" % e.reason)
                 return False
=20
             if response:
--=20
2.34.1


