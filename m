Received: from esa2.hc324-48.eu.iphmx.com (esa2.hc324-48.eu.iphmx.com [207.54.68.120])
 by mx.groups.io with SMTP id smtpd.web11.9812.1611651203751358219
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 00:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=U+X3bdC4;
 spf=pass (domain: bmw.de, ip: 207.54.68.120, mailfrom: prvs=6532865c5=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1611651204; x=1643187204;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=k9u5T311SWV2Qq6JljKpEj2rrAx9/mXAA06p4Olqh+0=;
  b=U+X3bdC4OLrd68I6IcRE8OeY204GfNo7mg0x+oznCmjz/6QPgpjo6H8k
   E17xciF2+diXzvk8TL0Hvaai69vADMxIboMrdA0w6cGJn8WoJjms/2wRs
   K5XPb7q8TGQD5ULrXR/PHqBAB9AKhhPYPW3pNf1XtT7FhAroIwbqB8G4b
   s=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa2.hc324-48.eu.iphmx.com with ESMTP/TLS; 26 Jan 2021 09:53:21 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw4.muc with ESMTP/TLS;
 26 Jan 2021 09:53:21 +0100
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb3.muc with ESMTP/TLS; 26 Jan 2021 09:53:18 +0100
Received: from michael-pcx.bmw-carit.intra (192.168.221.34) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Tue, 26 Jan 2021 09:53:16 +0100
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [pseudo][PATCH] pseudo_client.c: Rebuild passwd paths after chroot
Date: Tue, 26 Jan 2021 09:53:10 +0100
Message-ID: <1611651190-330622-1-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: SMUCM29L.europe.bmw.corp (160.46.167.43) To
 smucm09k.europe.bmw.corp (160.48.96.43)
Content-Type: text/plain

From: Michael Ho <Michael.Ho@bmw.de>

Pseudo will calculate the search paths used for passwd operations such
as lckpwdf and ulckpwdf using build_passwd_paths when it initiates. This
takes into account the chroot at the time.

The problem is that after a chroot is performed, pseudo continues to use
the search paths calculated from the start for lckpwdf and ulckpwdf.
This makes it write the pwd.lock files to a different sysroot if a chroot
is called during runtime.

This commit resolves that by calling build_passwd_paths again after
intercepting chroot calls so the search paths are up to date.

This bug manifests in Yocto when shadow is installed into an SDK target
rootfs. The postinst triggered will call shadow-native with -R to point
to the SDK target rootfs which in turn makes shadow call chroot to the
SDK target rootfs before it perform its actions including lckpwdf() and
ulckpwdf(). The lock files however will write instead to the normal image
target rootfs because it was specified in PSEUDO_PASSWD and was the first
path set when the pseudo environment was initiated. By rebuilding the
search path after chroot is applied, the lockfiles appear in the correct
rootfs.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 pseudo_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/pseudo_client.c b/pseudo_client.c
index 478e450..60cd0d1 100644
--- a/pseudo_client.c
+++ b/pseudo_client.c
@@ -822,6 +822,8 @@ pseudo_client_chroot(const char *path) {
 	}
 	memcpy(pseudo_chroot, path, pseudo_chroot_len + 1);
 	pseudo_set_value("PSEUDO_CHROOT", pseudo_chroot);
+	/* Rebuild passwd paths since we've done a chroot */
+	build_passwd_paths();
 	return 0;
 }
 
-- 
2.7.4

