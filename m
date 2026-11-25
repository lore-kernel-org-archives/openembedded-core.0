Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2189.1795642650973392951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 13:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OZzewZnb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261125213729e800a9dd4e00020707-spngyt@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261125213729e800a9dd4e00020707
        for <openembedded-core@lists.openembedded.org>;
        Wed, 25 Nov 2026 22:37:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ngaegiahys/XzSFfPLaFmUnAT1qwW5BwMSMO2m3dWMo=;
 b=OZzewZnbvvYHAmZMMajw91rW50Zdd5OrxVt6SWpPCQgC5aUeIusW0mF6fwTLCJzWpblNUP
 D3wyExb2t0ib5KCXig12J8KdtqCaUFz5gV5n1nmmOCeIW3dzevqVmELhJjcE7INYskZ+k+VA
 IiTMW9wQrHxi1x2yVd7ztQMJ+M0JDE04DBLNG9jMkDwBuCdm89fRlPkIeqmIPM1opo/Aybbf
 XQaP8QrMKSy61Ev6RFRVDIIlMQF0QGOPPQxaoNCDcZTwfMmZ1zouhNjlV8OwmZJ0Mk9wSOgJ
 cs8+GpdwzYtGQupPtpKY9UrUKP4WlDWB7l20CwKGmHHZJhZiE/NKfUwg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 1/2] zip: patch CVE-2018-13410
Date: Wed, 25 Nov 2026 22:37:15 +0100
Message-ID: <20261125213716.3584941-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 21:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251261
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1].
This patch is a precondition for patching CVE-2026-130335.
Remove related CVE_STATUS entry.
Zip is not maintained anymore, so there is no upstream.

[1] https://salsa.debian.org/lts-team/packages/zip/-/blob/debian/3.0-12+deb11u1/debian/patches/15-buffer-overflow-cve-2018-13410.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../zip/zip-3.0/CVE-2018-13410.patch          | 24 +++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb          |  2 +-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/CVE-2018-13410.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/CVE-2018-13410.patch b/meta/recipes-extended/zip/zip-3.0/CVE-2018-13410.patch
new file mode 100644
index 00000000000..81c1f13286e
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/CVE-2018-13410.patch
@@ -0,0 +1,24 @@
+From: Florent 'Skia' Jacquet <florent.jacquet@canonical.com>
+Subject: Fix buffer overflow when using '-T -TT'
+Bug-Debian: https://bugs.debian.org/1093629
+Bug-Ubuntu: https://launchpad.net/bugs/2093024
+Forwarded: https://sourceforge.net/p/infozip/bugs/81/
+
+strlen(unzip_path) + strlen(zipname) + " " + "'" + "'" + '\0'
+The additional space required in the `cmd` buffer is 4, not 3.
+
+CVE: CVE-2018-13410
+Upstream-Status: Inactive-Upstream [lastrelease: 2008]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/zip.c
++++ b/zip.c
+@@ -1437,7 +1437,7 @@
+     /* Replace first {} with archive name.  If no {} append name to string. */
+     here = strstr(unzip_path, "{}");
+ 
+-    if ((cmd = malloc(strlen(unzip_path) + strlen(zipname) + 3)) == NULL) {
++    if ((cmd = malloc(strlen(unzip_path) + strlen(zipname) + 4)) == NULL) {
+       ziperr(ZE_MEM, "building command string for testing archive");
+     }
+ 
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index d1092551f7f..30d33654a77 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -19,12 +19,12 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch \
            file://0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch \
            file://0001-fileio.c-fix-a-buffer-overflow-detected-issue.patch \
+           file://CVE-2018-13410.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
 SRC_URI[sha256sum] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"
 
-CVE_STATUS[CVE-2018-13410] = "disputed: Disputed and also Debian doesn't consider a vulnerability"
 CVE_STATUS[CVE-2018-13684] = "cpe-incorrect: Not for zip but for smart contract implementation for it"
 
 # zip.inc sets CFLAGS, but what Makefile actually uses is
