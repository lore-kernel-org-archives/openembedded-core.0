Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51809C55174
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 02:10:18 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16979.1785636610798485460
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 19:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c5MAcygE;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8f1e274ccb9so11657516d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 19:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785636610; x=1786241410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UgWPidXP74zQ5n0m5hKJytlokF9xszWvyTo8UlW48bU=;
        b=c5MAcygEak08Z2yx8UXkcEN6mcSUs9kMw/FH0iNyo0yag7sugNwQzdp2LXdTXyQt9a
         Zpxi147/F1CNuSLkx2WWXjxQs0ezr1PJaiDi7WINLsw1IaHRdP7eIT+sW0gnxEGW6Ldz
         mIP+qiTbmO5RuV+VsI+nc2kWq3WHoqnfAWBPh/vpIrSvgs+qRQT20HGA6bTc3poZS1CG
         w52Hdl310sIAhNhsB7duD4XmithXV1r9uKHz/BfepA0wjU7sGCAmUq9cs18hF8di9yF/
         VI4ijZIeM0fzIiFt9cnEUplJ/iDp+j16Sknt7OIWszC0Ywqa8RGFrkxvxaSSl3IduUc5
         Z5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785636610; x=1786241410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UgWPidXP74zQ5n0m5hKJytlokF9xszWvyTo8UlW48bU=;
        b=LmucjFVPZumBgQnB9VElXuoRKfnRi3gzTSCj3RVlbEVDcPFZiCCFUhz9TsE1o3SphX
         7N0ICHRQKqTViQp5BGYm7ZPp3yk8gnZKgyt12LCGV+W3KW9TTGIiFqV4sLySVYdBq5VS
         vKDR9KxyX3dv0hYNmGB8hqS/v9aybqZzXi7LIpDTWMS1CQZmC6N2EGxHu8M1nbOvClxU
         3heUxZwveodAUxgPVa9DH3P93BC+WYLQpCoWr2dE6T7cCaVYtgNAO2Tp9DcHg3o93wNv
         iEw2NIHYO/rsEt07LYZZvCvG+pEIcNfck2jon/XWWVtdwHl9awORDF6F7zXTewcAbAL7
         r/Hg==
X-Gm-Message-State: AOJu0YzavDlmyLsyuEa3tl1Ebz7yKWwl2OEj8XcoCuekv32I3ZdqAq/B
	Kvw3UlBk6ZZzBdK2SUPzpWc6srBF98H1zB2MeZgKbUnic0uupQ2UZAVRmtKEyg==
X-Gm-Gg: AR+sD11M1wfBigUrOqHgm9zDRIPdEVrwu51/fF0ycsaf4VqHESlR75Y4Hro+bovegtw
	cMbYfEdlZt0MrbQrznfd92zXkAZt1ze/bq93ix/AvtJMFSPiCpq07w0GD6RHIGNBFSojLb+zl5x
	kPvHfZimtmGIUGwOVR0T41Uv8JUdnk3APkgqihdt0S3tfPyzpEPLvPOfOy/O5xhi4TyI8QPEH0g
	4b1FCW3ka+KwKKTy7nev9fS9B/pOSoYodWX/G6S6K7FXfzslKEYO80dnjaosDEeTUE/Xr5F/bPU
	kfOZIYbO0kO5l1zVtJhftraaYf/6vP3odzIRFk7g3RDGz87tW5yXzaW2iK5LXYP8zofqtLGQ/jc
	ZhDDcUpHqINF0ePEBmr1o2z8tvYnAUymlVFpdOxJ3q+2k8cU2d7h9sHKCXj650EkUiSKfteTk8T
	dipCjEUqPSZjdHwBF+vxEA9Hesbuz6VuLYHL8AINp19+SQr9cFKMdSqmAa1VeVJBFPKaLFY4RfU
	p/1L6DH2JurciJJh8NhSFZc35S8OnzHz+ioQcWLEw==
X-Received: by 2002:a05:6214:3d9d:b0:8f1:505c:1d3b with SMTP id 6a1803df08f44-9084966fdd1mr118307436d6.26.1785636609535;
        Sat, 01 Aug 2026 19:10:09 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908434a26basm44733566d6.12.2026.08.01.19.10.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 19:10:07 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 1/6] wic-tools: drop the target bootloader firmware
Date: Sat,  1 Aug 2026 22:09:55 -0400
Message-ID: <20260802021000.2886095-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260802021000.2886095-1-twoerner@gmail.com>
References: <20260802021000.2886095-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 02:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242510

wic-tools should stage only wic's host tools, but its arch-specific
appends also depended on target bootloader firmware (syslinux, grub-efi,
systemd-boot) solely for the wic oe-selftest. Which firmware is needed
depends on the plugins a .wks uses, so that firmware is the
responsibility of whoever supplies the .wks, not of wic-tools. Have the
oe-selftest bitbake those recipes itself instead.

Images already work that way through WKS_FILE_DEPENDS in
image_types_wic.bbclass, and the oe-selftest now does the equivalent,
adding syslinux to core-image-minimal's DEPENDS where the tests expect
it in the recipe sysroot.

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v6:
- none

changes in v5:
- trimmed the commit message and in-tree comments

changes in v4:
- new in v4
---
 meta/lib/oeqa/selftest/cases/wic.py | 33 +++++++++++++++++++++++------
 meta/recipes-core/meta/wic-tools.bb |  7 +++---
 2 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 4e94f4d39abd..f9b893fc8581 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -72,12 +72,23 @@ class WicTestCase(OESelftestTestCase):
             if self.td['USE_NLS'] != 'yes':
                 self.skipTest('wic-tools needs USE_NLS=yes')
 
-            bitbake('wic-tools core-image-minimal core-image-minimal-mtdutils')
+            targets = 'wic-tools core-image-minimal core-image-minimal-mtdutils'
+            targets += ' ' + ' '.join(self._firmware_recipes())
+            bitbake(targets)
             WicTestCase.image_is_ready = True
 
         os.environ['PATH'] = self._get_wic_path()
         rmtree(self.resultdir, ignore_errors=True)
 
+    def _firmware_recipes(self):
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
@@ -391,9 +402,13 @@ class Wic(WicTestCase):
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_build_artifacts(self):
         """Test wic create directdisk providing all artifacts."""
-        bb_vars = get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATIVE'],
-                              'wic-tools')
-        bb_vars.update(get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'],
+        # wic expects syslinux in core-image-minimal's recipe sysroot.
+        config = 'DEPENDS:pn-core-image-minimal += "syslinux"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
+        self.remove_config(config)
+        bb_vars = get_bb_vars(['RECIPE_SYSROOT_NATIVE'], 'wic-tools')
+        bb_vars.update(get_bb_vars(['STAGING_DATADIR', 'DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'],
                                    'core-image-minimal'))
         bbvars = {key.lower(): value for key, value in bb_vars.items()}
         bbvars['resultdir'] = self.resultdir
@@ -494,9 +509,13 @@ class Wic(WicTestCase):
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_rootfs_artifacts(self):
         """Test usage of rootfs plugin with rootfs paths"""
-        bb_vars = get_bb_vars(['STAGING_DATADIR', 'RECIPE_SYSROOT_NATIVE'],
-                              'wic-tools')
-        bb_vars.update(get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_ROOTFS'],
+        # wic expects syslinux in core-image-minimal's recipe sysroot.
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
index 823dbe6db643..c6e3d1b419dc 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -10,10 +10,9 @@ DEPENDS = "\
            e2fsprogs-native util-linux-native tar-native erofs-utils-native \
            virtual/cross-binutils \
            "
-DEPENDS:append:x86 = " syslinux-native syslinux grub-efi systemd-boot"
-DEPENDS:append:x86-64 = " syslinux-native syslinux grub-efi systemd-boot"
-DEPENDS:append:x86-x32 = " syslinux-native syslinux grub-efi"
-DEPENDS:append:aarch64 = " grub-efi systemd-boot"
+DEPENDS:append:x86 = " syslinux-native"
+DEPENDS:append:x86-64 = " syslinux-native"
+DEPENDS:append:x86-x32 = " syslinux-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
2.50.0.173.g8b6f19ccfc3a


