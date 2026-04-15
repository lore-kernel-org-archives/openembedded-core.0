Return-Path: <michael@rndt.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04658F531E3
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 08:58:38 +0000 (UTC)
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14459.1776243510523380230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 01:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rndt.dev header.s=default header.b=XH6AGW8v;
 spf=pass (domain: rndt.dev, ip: 35.82.102.206, mailfrom: michael@rndt.dev)
Received: from titan.fritz.box (unknown [46.253.77.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: michael@rndt.dev)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id E63C6477282;
	Wed, 15 Apr 2026 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rndt.dev; s=default;
	t=1776243509; bh=uLK91/WPP1JH/YxPwe5/xqJY1yY9eZIbwosjzbt56P0=;
	h=From:To:Cc:Subject:Date;
	b=XH6AGW8vRCy9P2N8dUaFbR5eyTdIq0QAEXsruIxEzY3xojEjG5LhMFslc+NVU+lET
	 wli9+U6xkzrKM3oNsbKyJsV5zWnniSRmPxtqDaBWSJ3gpOecQAk5Rj1Rwq7uGGj32u
	 hp4AhDRcymCzvU7BMxnenj3spxf1e5IA3AFIP7Mo=
From: Michael Arndt <michael@rndt.dev>
To: openembedded-core@lists.openembedded.org
Cc: Michael Arndt <michael@rndt.dev>
Subject: [PATCH] sstate: Add fallback when hardlink fails
Date: Wed, 15 Apr 2026 10:58:24 +0200
Message-ID: <20260415085824.1730569-1-michael@rndt.dev>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 08:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235187

Previously the sstate didn't work on file systems that don't support hard=
links.
For example when using WebDAV to share the sstate. This change avoids the
problem by adding a fallback in case the hardlink fails.

Signed-off-by: Michael Arndt <michael@rndt.dev>
---
 meta/classes-global/sstate.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sst=
ate.bbclass
index 88449d19c7..2b18cafb60 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -795,6 +795,14 @@ python sstate_create_and_sign_package () {
         except:
             pass
=20
+    # Create hardlink with fallback to rename. Useful for file systems t=
hat
+    # don't support hardlinks.
+    def hardlink(src, dst):
+        try:
+            os.link(src, dst)
+        except:
+            src.rename(dst)
+
     def update_file(src, dst, force=3DFalse):
         if dst.is_symlink() and not dst.exists():
             force=3DTrue
@@ -804,7 +812,7 @@ python sstate_create_and_sign_package () {
             if force:
                 src.rename(dst)
             else:
-                os.link(src, dst)
+                hardlink(src, dst)
             return True
         except:
             pass
@@ -862,7 +870,7 @@ python sstate_create_and_sign_package () {
         with NamedTemporaryFile(prefix=3Dsstate_pkg.name, dir=3Dsstate_p=
kg.parent) as tmp_pkg_fd:
             tmp_pkg =3D tmp_pkg_fd.name
             sstate_archive_package(tmp_pkg, d)
-            update_file(tmp_pkg, sstate_pkg)
+            update_file(Path(tmp_pkg), sstate_pkg)
             # update_file() may have renamed tmp_pkg, which must exist w=
hen the
             # NamedTemporaryFile() context handler ends.
             touch(Path(tmp_pkg))

