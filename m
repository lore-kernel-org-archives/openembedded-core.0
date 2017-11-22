Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 88F9378650
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 16:04:18 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r68so11309629wmr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 08:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8sh5QGQfUJ4BwKz1TS2kb4UsFvJeJJ6se0J9LfxieFs=;
	b=gFoNH55qK/SVrgA5sWDgbcz1EFIZXxgu8XYYHjocn6BPZUYQj0DNjCFhVkHSOyzZw4
	CPtF8iX8/PJxRXz8/c3ffu+sY0viQrjQCfstq3Ragmmwiq2CTR/CJsqHnEh0qbcswYVM
	HgW4bGHwuJuKYn1GH+5LS8IBcDJ3ZdDZ8AFQEteWds6Zfg3CbfJWts3c9pxKe878Fr1c
	HxWss8HdadygFh/cQLFP0h3ZJx0AhFgmxYl+GmJNGsZFIfkIIkTGoQRVR7avqLcDP8Mu
	U9E94LWpVESjvw/yq5DHV2i7mMPAlb+H4ifQ4puh6ccq4yARUsps5osMxwuZLoOR53EI
	CO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8sh5QGQfUJ4BwKz1TS2kb4UsFvJeJJ6se0J9LfxieFs=;
	b=gUSHqDEw+xdqn8w8mMtky5bE3JzTuUOmxfFjcNeEIMy/dXOQ27TUliP3UU5p6BW6rP
	gWX5K66ZIDhcvty1tcAg5Fu8MYRa37ionsJQ7EcvzcNrQjaIH6ucAyGtFL4Mjvf05+Rw
	viB/7YuRp1+yryDAC/aJIrobffU1cAwdPw7YIGYsY9WUKSZyscyIBSPTNnt7bFRLyUik
	p/6eI/vhDYIvrzeNTPmCTwBTVN3EhLvpTAu9xKwjYHhWiVDkecHthKsoc7WnjQNiKcL5
	JdKwbpxcfpUXrxTLuHnx6KEGW2PQKAt5sioCDVmFNc0KquCbWJNaf5QfDTTrLlEmWyYi
	VAEw==
X-Gm-Message-State: AJaThX726kz9SNEQBo6a/oMQkGAGQ0Dpa9R+CEuU9AMS8z+9Kl2C913b
	325Lob4d3vriIn8K7oylpRlyafa6
X-Google-Smtp-Source: AGs4zMaZkSZMGVCaaO0RBiNLh5RGigWAVBcqK0VfqdJhbsLtlFsICZIjwNEYzbg0IKIPRU4K/tcJ6g==
X-Received: by 10.28.157.7 with SMTP id g7mr4132444wme.99.1511366658985;
	Wed, 22 Nov 2017 08:04:18 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	k30sm28923728wrf.63.2017.11.22.08.04.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Nov 2017 08:04:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 16:04:13 +0000
Message-Id: <20171122160414.14093-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20171122160414.14093-1-ross.burton@intel.com>
References: <20171122160414.14093-1-ross.burton@intel.com>
Subject: [PATCH 2/3] postinst: fix and simplify the postinst test recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Nov 2017 16:04:18 -0000

Reduce the number of packages, and fix some syntax and logic errors in the
scripts.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-test/postinst/postinst_1.0.bb          | 158 +++++++--------------
 1 file changed, 51 insertions(+), 107 deletions(-)

diff --git a/meta-selftest/recipes-test/postinst/postinst_1.0.bb b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
index 6d497342779..112aa08c80f 100644
--- a/meta-selftest/recipes-test/postinst/postinst_1.0.bb
+++ b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
@@ -1,126 +1,70 @@
+SUMMARY = "Packages to exercise postinstall functions"
 LICENSE = "MIT"
-ALLOW_EMPTY_${PN}-at-rootfs = "1"
+
+inherit allarch
+
+PACKAGES = "${PN}-rootfs ${PN}-delayed-a ${PN}-delayed-b"
+
+ALLOW_EMPTY_${PN}-rootfs = "1"
 ALLOW_EMPTY_${PN}-delayed-a = "1"
 ALLOW_EMPTY_${PN}-delayed-b = "1"
-ALLOW_EMPTY_${PN}-delayed-d = "1"
-ALLOW_EMPTY_${PN}-delayed-p = "1"
-ALLOW_EMPTY_${PN}-delayed-t = "1"
-
-PACKAGES += "${PN}-at-rootfs ${PN}-delayed-a ${PN}-delayed-b ${PN}-delayed-d ${PN}-delayed-p ${PN}-delayed-t"
-PROVIDES += "${PN}-at-rootfs ${PN}-delayed-a ${PN}-delayed-b ${PN}-delayed-d ${PN}-delayed-p ${PN}-delayed-t"
-FILES_${PN}-delayed-a = ""
-FILES_${PN}-delayed-b = ""
-FILES_${PN}-delayed-d = ""
-FILES_${PN}-delayed-p = ""
-FILES_${PN}-delayed-t = ""
-
-# Runtime dependencies
-RDEPENDS_${PN}-delayed-a = "${PN}-at-rootfs"
+
+RDEPENDS_${PN}-delayed-a = "${PN}-rootfs"
 RDEPENDS_${PN}-delayed-b = "${PN}-delayed-a"
-RDEPENDS_${PN}-delayed-d = "${PN}-delayed-b"
-RDEPENDS_${PN}-delayed-p = "${PN}-delayed-d"
-RDEPENDS_${PN}-delayed-t = "${PN}-delayed-p"
-
-# Main recipe post-install
-pkg_postinst_${PN}-at-rootfs () {
-    tfile="/etc/postinsta-test"
-    touch "$D"/this-was-created-at-rootfstime
-    if test "x$D" != "x" then
-        # Need to run on first boot
+
+TESTDIR = "${sysconfdir}/postinst-test"
+
+# At rootfs time touch $TESTDIR/rootfs.  Errors if the file already exists, or
+# if the function runs on first boot.
+pkg_postinst_${PN}-rootfs () {
+    set -e
+
+    if [ -z "$D" ]; then
+        echo "${PN}-rootfs should have finished at rootfs time"
+        exit 1
+    fi
+
+    if [ -e $D${TESTDIR}/rootfs ]; then
+        echo "$D${TESTDIR}/rootfs exists, but should not"
         exit 1
-    else
-        echo "lets write postinst" > $tfile
     fi
+
+    mkdir -p $D${TESTDIR}
+    touch $D${TESTDIR}/rootfs
 }
 
-# Dependency recipes post-installs
+# Depends on rootfs, delays until first boot, verifies that the rootfs file was
+# written.
 pkg_postinst_${PN}-delayed-a () {
-    efile="/etc/postinst-test"
-    tfile="/etc/postinsta-test"
-    rdeps="postinst"
-
-    if test "x$D" != "x"; then
-      # Need to run on first boot
-      exit 1
-    else
-      touch /etc/this-was-created-at-first-boot
-      if test -e $efile ; then
-        echo 'success' > $tfile
-      else
-        echo 'fail to install $rdeps first!' >&2
+    set -e
+
+    if [ -n "$D" ]; then
+        echo "Delaying ${PN}-delayed-a until first boot"
         exit 1
-      fi
-   fi
-}
+    fi
 
-pkg_postinst_${PN}-delayed-b () {
-    efile="/etc/postinsta-test"
-    tfile="/etc/postinstb-test"
-    rdeps="postinsta"
-
-    if test "x$D" != "x"; then
-      # Need to run on first boot
-      exit 1
-    else
-      if test -e $efile ; then
-        echo 'success' > $tfile
-      else
-        echo 'fail to install $rdeps first!' >&2
+    if [ ! -e ${TESTDIR}/rootfs ]; then
+        echo "${PN}-delayed-a: ${TESTDIR}/rootfs not found"
         exit 1
-      fi
-   fi
+    fi
+
+    touch ${TESTDIR}/delayed-a
 }
 
-pkg_postinst_${PN}-delayed-d () {
-    efile="/etc/postinstb-test"
-    tfile="/etc/postinstd-test"
-    rdeps="postinstb"
-
-    if test "x$D" != "x"; then
-      # Need to run on first boot
-      exit 1
-    else
-      if test -e $efile ; then
-        echo 'success' > $tfile
-      else
-        echo 'fail to install $rdeps first!' >&2
+# Depends on delayed-a, delays until first boot, verifies that the delayed-a file was
+# written. This verifies the ordering between delayed postinsts.
+pkg_postinst_${PN}-delayed-b () {
+    set -e
+
+    if [ -n "$D" ]; then
+        echo "Delaying ${PN}-delayed-b until first boot"
         exit 1
-      fi
-   fi
-}
+    fi
 
-pkg_postinst_${PN}-delayed-p () {
-    efile="/etc/postinstd-test"
-    tfile="/etc/postinstp-test"
-    rdeps="postinstd"
-
-    if test "x$D" != "x"; then
-      # Need to run on first boot
-      exit 1
-    else
-      if test -e $efile ; then
-        echo 'success' > $tfile
-      else
-        echo 'fail to install $rdeps first!' >&2
+    if [ ! -e ${TESTDIR}/delayed-a ]; then
+        echo "${PN}-delayed-b: ${TESTDIR}/delayed-a not found"
         exit 1
-      fi
-   fi
-}
+    fi
 
-pkg_postinst_${PN}-delayed-t () {
-    efile="/etc/postinstp-test"
-    tfile="/etc/postinstt-test"
-    rdeps="postinstp"
-
-    if test "x$D" != "x"; then
-      # Need to run on first boot
-      exit 1
-    else
-      if test -e $efile ; then
-          echo 'success' > $tfile
-      else
-          echo 'fail to install $rdeps first!' >&2
-          exit 1
-      fi
-   fi
+    touch ${TESTDIR}/delayed-b
 }
-- 
2.11.0


