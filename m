Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.7135.1628073414958646207
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 03:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gs+9SOTw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id m12so1639579wru.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 03:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZLi3PtNIkI5t8eg9Feuz4XCdaS5hab7Lwa6eMLy7mlk=;
        b=gs+9SOTwN4FIGkUq7WDEOfAyMULuW/Q4skaasW7jOXydMRSP9zazMtq4I/+SdWR/Yy
         VNaEUap9h79/L6ZLgrwjMOrSTv33DwOFaP6QL1tLZx+yYasNzk0eHBoWrGhJxXuGSmpB
         OPlYnqF3pfEsNhXUFN9/Q28nMszdYphcdjKRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZLi3PtNIkI5t8eg9Feuz4XCdaS5hab7Lwa6eMLy7mlk=;
        b=efke5/75UMuxVfI5dwem8Ay91Sfahbkx2jq+xpyVcpnDCmVdoBPiNwTI+Fo+Xvxw+n
         1YT8MH16Qk29L3r/GeaCFZdod4tvK/cBXm2jxrJ/4n1Y2WvHHXxWw9jgywNEn9/HDiqT
         Hl1EgUMD/S3gLhsxS2LSr+TLxImURyR4UCeN4IL/c+pN4PMNFaBcVXgwvpFKrfUxQkyY
         uERO70uAv8QVArOJ+PkyuSailcMw6Kp0l+7OmHTVhB/AiIe4axuS0rG4bITOqW2iRDme
         dAkyt57s6teDcrFTSh0IRFY+esUhUhtOL0Tw07aAEyPpUqLi3LyMQ1rV5hcfrwDtnIOR
         PpNg==
X-Gm-Message-State: AOAM533cahh1D202xJFhDO3RNAA0GAB5WLBilX6A6MDN4Z4O57SALEbt
	cH0CDaOkmCGDhxEwVomSaYPaK5iqV/n6qQ==
X-Google-Smtp-Source: ABdhPJyqDtgjZbP+j+1HFY87jtcZRxwiviybiuJYEU0YIZ/ZBB0BoU1GBygDHklwNF8E6ji9NMeTyg==
X-Received: by 2002:a5d:40c6:: with SMTP id b6mr28066193wrq.222.1628073413390;
        Wed, 04 Aug 2021 03:36:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id k17sm5847043wmj.0.2021.08.04.03.36.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 03:36:53 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] meta: Convert IMAGE_TYPEDEP to use override syntax
Date: Wed,  4 Aug 2021 11:36:51 +0100
Message-Id: <20210804103652.3507412-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMAGE_TYPEDEP variable would make more sense to match the form of the
other image override variables, convert it to use the overrides format.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image-container.bbclass           | 2 +-
 meta/classes/image-live.bbclass                | 6 +++---
 meta/classes/image.bbclass                     | 4 ++--
 meta/classes/image_types.bbclass               | 4 ++--
 meta/lib/oeqa/selftest/cases/containerimage.py | 2 +-
 meta/lib/oeqa/selftest/cases/image_typedep.py  | 4 ++--
 scripts/contrib/convert-overrides.py           | 2 +-
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/classes/image-container.bbclass b/meta/classes/image-container.bbclass
index f002858bd24..3d1993576a0 100644
--- a/meta/classes/image-container.bbclass
+++ b/meta/classes/image-container.bbclass
@@ -1,6 +1,6 @@
 ROOTFS_BOOTSTRAP_INSTALL = ""
 IMAGE_TYPES_MASKED += "container"
-IMAGE_TYPEDEP_container = "tar.bz2"
+IMAGE_TYPEDEP:container = "tar.bz2"
 
 python __anonymous() {
     if "container" in d.getVar("IMAGE_FSTYPES") and \
diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index fd876ed8e1c..2c948190cfe 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -42,9 +42,9 @@ INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_
 LIVE_ROOTFS_TYPE ?= "ext4"
 ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${LIVE_ROOTFS_TYPE}"
 
-IMAGE_TYPEDEP_live = "${LIVE_ROOTFS_TYPE}"
-IMAGE_TYPEDEP_iso = "${LIVE_ROOTFS_TYPE}"
-IMAGE_TYPEDEP_hddimg = "${LIVE_ROOTFS_TYPE}"
+IMAGE_TYPEDEP:live = "${LIVE_ROOTFS_TYPE}"
+IMAGE_TYPEDEP:iso = "${LIVE_ROOTFS_TYPE}"
+IMAGE_TYPEDEP:hddimg = "${LIVE_ROOTFS_TYPE}"
 IMAGE_TYPES_MASKED += "live hddimg iso"
 
 python() {
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 45dd56b544c..0321b4f7ae0 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -382,8 +382,8 @@ python () {
         if t.startswith("debugfs_"):
             t = t[8:]
             debug = "debugfs_"
-        deps = (d.getVar('IMAGE_TYPEDEP_' + t) or "").split()
-        vardeps.add('IMAGE_TYPEDEP_' + t)
+        deps = (d.getVar('IMAGE_TYPEDEP:' + t) or "").split()
+        vardeps.add('IMAGE_TYPEDEP:' + t)
         if baset not in typedeps:
             typedeps[baset] = set()
         deps = [debug + dep for dep in deps]
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 3620931224e..6a88ac85adf 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -29,7 +29,7 @@ def imagetypes_getdepends(d):
         if d.getVar(var) is not None:
             deprecated.add(var)
 
-        for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype) or "").split():
+        for typedepends in (d.getVar("IMAGE_TYPEDEP:%s" % basetype) or "").split():
             base, rest = split_types(typedepends)
             resttypes += rest
 
@@ -197,7 +197,7 @@ IMAGE_CMD:multiubi () {
 IMAGE_CMD:ubi () {
 	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}"
 }
-IMAGE_TYPEDEP_ubi = "ubifs"
+IMAGE_TYPEDEP:ubi = "ubifs"
 
 IMAGE_CMD:ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
 
diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index b92e520bc2b..3068c9ba26e 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -22,7 +22,7 @@ from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
 #
 class ContainerImageTests(OESelftestTestCase):
 
-    # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
+    # Verify that when specifying a IMAGE_TYPEDEP: of the form "foo.bar" that
     # the conversion type bar gets added as a dep as well
     def test_expected_files(self):
 
diff --git a/meta/lib/oeqa/selftest/cases/image_typedep.py b/meta/lib/oeqa/selftest/cases/image_typedep.py
index 52e1080f130..5b182a8f940 100644
--- a/meta/lib/oeqa/selftest/cases/image_typedep.py
+++ b/meta/lib/oeqa/selftest/cases/image_typedep.py
@@ -9,7 +9,7 @@ from oeqa.utils.commands import bitbake
 
 class ImageTypeDepTests(OESelftestTestCase):
 
-    # Verify that when specifying a IMAGE_TYPEDEP_ of the form "foo.bar" that
+    # Verify that when specifying a IMAGE_TYPEDEP: of the form "foo.bar" that
     # the conversion type bar gets added as a dep as well
     def test_conversion_typedep_added(self):
 
@@ -22,7 +22,7 @@ LICENSE = "MIT"
 IMAGE_FSTYPES = "testfstype"
 
 IMAGE_TYPES_MASKED += "testfstype"
-IMAGE_TYPEDEP_testfstype = "tar.bz2"
+IMAGE_TYPEDEP:testfstype = "tar.bz2"
 
 inherit image
 
diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index 23f63a26e57..093318ddc12 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -64,7 +64,7 @@ skips = skips + ["get_appends_for_files", "test_doubleref_remove", "test_bitbake
 skips = skips + ["test_rpm_remove", "test_bitbakelayers_add_remove", "recipe_append_file", "log_data_removed", "recipe_append", "systemd_machine_unit_append"]
 skips = skips + ["recipetool_append", "changetype_remove", "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends", "tgz_removed"]
 
-imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD"]
+imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD", IMAGE_TYPEDEP"]
 packagevars = packagevars + imagevars
 
 vars_re = {}
-- 
2.30.2

