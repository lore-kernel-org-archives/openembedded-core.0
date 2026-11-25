Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2177.1795642627094427062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 13:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=epXBWNxx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20261125213705aa217b11b400020724-gk_lje@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20261125213705aa217b11b400020724
        for <openembedded-core@lists.openembedded.org>;
        Wed, 25 Nov 2026 22:37:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ngaegiahys/XzSFfPLaFmUnAT1qwW5BwMSMO2m3dWMo=;
 b=epXBWNxxMwDoFDPo19s5Bulwf9bL/FzYWF12USy3WQMlf7k7hoYrmd7KchmL9Fj8rBvTC+
 63/nQIRAr8MApfCcdjL1bdEFMue0J98FzhhV6jkG2O293+14eISyUjtuHKcoY90t2911ViZd
 J0//KCinVdLJp9y3KfhfNPQcamnx81UzeOZiEYGqW+nrkdbAujhpQDwBZ4DOdMewi1HgUPNG
 F+dA1iFe7RP2THGsw+1Qjzl8yNlHQzMU3f2dViBpy4OEJc7ItkzOIpUoNl1r6KuliJX6Jov6
 HxL71YfmqNeAcrMeRLuR9XG81hnGy25aLo0vUEsODLc/dmRGgCh4AcQg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/2] zip: patch CVE-2018-13410
Date: Wed, 25 Nov 2026 22:36:50 +0100
Message-ID: <20261125213651.3584894-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 21:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251259
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
