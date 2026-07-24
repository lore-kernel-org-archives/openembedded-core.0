Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2632BC531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:02:07 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15477.1784883722304941228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e+NxYmI6;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8f0d6853360so1863886d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883721; x=1785488521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HBuDNL5YqR1BaQaS4POPPtlpNRoR7IMv1EH3pKhyMOI=;
        b=e+NxYmI676RE1S9bj7KW22OF44qoQuF53FFKfIo0EB8amo89tT4IMcbZH+01o6qfxO
         v1NpgnrJn+yPtZZvLJ5QG80P6kaiHSpGTgu5NUZ1M9NvUWfNbOMf7rx17R70+9QQWvoN
         9WNf6ERkwwgaNza6Ql/02yMOuj/9uEL72ZRUYyLettZ5O/Z4kyXiteQggjaxpc5gNagF
         cNOflQf1Nh7EJHWoJ+qNIZUrE3muQNFsUJz7oOPkp+8bnDSVUMDWE90yakzFR9zVFeo4
         HOFWgCVd6G/LQlSk4tyXM0h+AXW71o/RUa9qxGQruxUvk8uvM0S2cTo/5SUxvJ2lUTz6
         WJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883721; x=1785488521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HBuDNL5YqR1BaQaS4POPPtlpNRoR7IMv1EH3pKhyMOI=;
        b=o8DYFPrmavuy3C96hyYxsmGe3zAHgp1giWR52BfGsVO2ANTMRnRGBJziyLTay9VYcM
         OJ+1NoOEpliZBvA92uC64VsKa8pLnefFEcZuFzWEoumzzNGQstOokZOXMiudM96cUx4+
         BsDwXVf59YILZl8j+LG4Q9SLsKtNMpeQY0V1BMK+q+oMRV09MufirhysoMv3B1hQAEaZ
         pf2SEu+16YuuP5GFW05Vx3cwRyNVQULd1p4FbCLGHojGITjPzkbAgTcd7783bq1B/bZf
         vi/ktpT7v85jorGBWq/tTvhC09sg3N7pigya+djJkRa0Qij5TiFcsZtP0wS2X9B0pj9B
         w4lQ==
X-Gm-Message-State: AOJu0YxB6dw7We0M9NIbgOFKP86M8dWINi/f2gBUeGqbtabDmQ9nOkSz
	5eozh6CuiRc0QOTzM2X/03x0sH3ZJIK0sr2XOEOL/Wmel0I7HIeKU1celT+fRA==
X-Gm-Gg: AR+sD10DD74+tGN+xtBtpZ7dRQhK3KJc/dCwrAkIBYi9mjSKURZ8moujlOU9TSj8nns
	C80I12A15RIUicSJKwlMbxcRFuVl7PGDeWGVztgxPvfcF1yjaomsokVZrmMek9HVyt78BmGW2Mo
	MXWuwJ04ALXEGhGFP0fVOX41ejz6/HIM8AAh6e7RXKmHnNG2IXl2cQPo2T7ZJzuegCgdGAJhHpJ
	ef+jfU9PombWlGsZECRs6X9Qseg+z9tdBpcWhxPkvs4VS0j1O7fwfshsUhpploBpmrhGbR8QZ14
	rCe2oTP6ipzNhuGiAwZRFv9ufBH0yBOHRZZPAZlaANVYQxQKWXunKJj4GievMY6cR8LAY/W8tRM
	pqCINq7sugeGabBzpale5LYxcdpoZy2LD6WXtdErTHjGqf3n5FxQQWlFtwsIYEDc1xG8DfZ14cw
	bl+Io3/qB2iiG0ENLvUoFhYQWxzs+2YBP5iRT/o1TXHvPrw1/iE8JuHi0=
X-Received: by 2002:a05:6214:e6d:b0:8ed:a980:6b2c with SMTP id 6a1803df08f44-907ca5e8b9bmr64172816d6.30.1784883721050;
        Fri, 24 Jul 2026 02:02:01 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm63968326d6.46.2026.07.24.02.01.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:02:00 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 01/10] wic-tools: move bootloader firmware staging into the wic oe-selftest
Date: Fri, 24 Jul 2026 05:01:37 -0400
Message-ID: <20260724090146.19924-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260724090146.19924-1-twoerner@gmail.com>
References: <20260724090146.19924-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241911

wic-tools is a meta-recipe whose DEPENDS assemble a native sysroot of the
host tools wic runs. Over time it also accumulated target bootloader
firmware (syslinux, grub-efi, systemd-boot), which is a different kind of
thing: wic copies those artifacts into the images it builds, reading
grub-efi and systemd-boot from DEPLOY_DIR_IMAGE and syslinux from the
sysroot. They were listed in wic-tools only so that building wic-tools
would force the firmware to be built and deployed before the wic
oe-selftest ran.

That coupling makes wic-tools carry target recipes for the sole benefit
of the test suite. Move the firmware out of wic-tools and have the wic
oe-selftest build it directly in its setup, gated to the host
architectures where each loader is available, matching the arch
decorators already on the individual tests. wic-tools keeps
syslinux-native, which is the isohybrid host tool wic invokes rather
than firmware.

No image or SDK builds relied on wic-tools pulling in the firmware; only
the oe-selftest did, so this narrows wic-tools to its original purpose of
staging wic's host tools.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v4:
- new in v4
- update test_build_artifacts and test_rootfs_artifacts to build
  syslinux into the image and take the bootimg dir from there, since
  wic-tools no longer stages target syslinux
---
 meta/lib/oeqa/selftest/cases/wic.py | 44 ++++++++++++++++++++++++-----
 meta/recipes-core/meta/wic-tools.bb | 11 +++++---
 2 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 4e94f4d39abd..c4a1c7241bbc 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -72,12 +72,30 @@ class WicTestCase(OESelftestTestCase):
             if self.td['USE_NLS'] != 'yes':
                 self.skipTest('wic-tools needs USE_NLS=yes')
 
-            bitbake('wic-tools core-image-minimal core-image-minimal-mtdutils')
+            targets = 'wic-tools core-image-minimal core-image-minimal-mtdutils'
+            # wic copies target bootloader firmware into the images it builds:
+            # grub-efi and systemd-boot from DEPLOY_DIR_IMAGE and syslinux from
+            # the sysroot. Deploy/stage whatever is available on this host arch
+            # so the bootimg_efi / isoimage / pcbios plugins can find it. This
+            # used to be pulled in via wic-tools' DEPENDS, but firmware is a
+            # target artifact rather than a wic host tool, so it is built here.
+            targets += ' ' + ' '.join(self._firmware_recipes())
+            bitbake(targets)
             WicTestCase.image_is_ready = True
 
         os.environ['PATH'] = self._get_wic_path()
         rmtree(self.resultdir, ignore_errors=True)
 
+    def _firmware_recipes(self):
+        """Target bootloader firmware wic may copy into images, per host arch."""
+        arch = self.td['HOST_ARCH']
+        recipes = []
+        if arch in ('i586', 'i686', 'x86_64', 'x86-64'):
+            recipes += ['syslinux', 'grub-efi', 'systemd-boot']
+        elif arch == 'aarch64':
+            recipes += ['grub-efi', 'systemd-boot']
+        return recipes
+
     def tearDownLocal(self):
         """Remove resultdir as it may contain images."""
         if self._old_path is None:
@@ -391,9 +409,15 @@ class Wic(WicTestCase):
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
-        bb_vars = get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATIVE'],
-                              'wic-tools')
-        bb_vars.update(get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'],
+        # syslinux (the target bootloader data the bootimg_pcbios plugin
+        # copies from --bootimg-dir) is not staged by wic-tools; build it
+        # into the image and take the bootimg dir from there.
+        config = 'DEPENDS:pn-core-image-minimal += "syslinux"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
+        self.remove_config(config)
+        bb_vars = get_bb_vars(['RECIPE_SYSROOT_NATIVE'], 'wic-tools')
+        bb_vars.update(get_bb_vars(['STAGING_DATADIR', 'DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'],
                                    'core-image-minimal'))
         bbvars = {key.lower(): value for key, value in bb_vars.items()}
         bbvars['resultdir'] = self.resultdir
@@ -494,9 +518,15 @@ class Wic(WicTestCase):
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
-        bb_vars = get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATIVE'],
-                              'wic-tools')
-        bb_vars.update(get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'],
+        # syslinux (the target bootloader data the bootimg_pcbios plugin
+        # copies from --bootimg-dir) is not staged by wic-tools; build it
+        # into the image and take the bootimg dir from there.
+        config = 'DEPENDS:pn-core-image-minimal += "syslinux"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
+        self.remove_config(config)
+        bb_vars = get_bb_vars(['RECIPE_SYSROOT_NATIVE'], 'wic-tools')
+        bb_vars.update(get_bb_vars(['STAGING_DATADIR', 'DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'],
                                    'core-image-minimal'))
         bbvars = {key.lower(): value for key, value in bb_vars.items()}
         bbvars['wks'] = "directdisk-multi-rootfs"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index 823dbe6db643..c1da1739777e 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -10,10 +10,13 @@ DEPENDS = "\
            e2fsprogs-native util-linux-native tar-native erofs-utils-native \
            virtual/cross-binutils \
            "
-DEPENDS:append:x86 = " syslinux-native syslinux grub-efi systemd-boot"
-DEPENDS:append:x86-64 = " syslinux-native syslinux grub-efi systemd-boot"
-DEPENDS:append:x86-x32 = " syslinux-native syslinux grub-efi"
-DEPENDS:append:aarch64 = " grub-efi systemd-boot"
+# syslinux-native provides the isohybrid host tool that wic runs; it is only
+# available on x86. The target bootloader firmware (syslinux, grub-efi,
+# systemd-boot) that wic copies into an image is deployed by the wic selftest
+# instead, so it is not staged here.
+DEPENDS:append:x86 = " syslinux-native"
+DEPENDS:append:x86-64 = " syslinux-native"
+DEPENDS:append:x86-x32 = " syslinux-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
2.50.0.173.g8b6f19ccfc3a


