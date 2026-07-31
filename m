Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40646C5516F
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 15:28:19 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12.1785511696488408591
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 08:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F5SFPVOo;
 spf=pass (domain: gmail.com, ip: 209.85.222.53, mailfrom: twoerner@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-96723c7151eso273373241.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 08:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785511695; x=1786116495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0zJjBb6df65zdd6rH3XQfHwC7WrqgvpRMiWDyR8oMjw=;
        b=F5SFPVOoufw3ghwsS7U5RQ8GUmpgOvg6vH3/rJHcIZxEKHYLtjUoQM9gTei2E35EtZ
         N8Ww0KswoTZZfvX3m6nHSwC0jYZ9CFFPO8WGEPu18ZwgMPa/EmdCeF+yL1FN1NWRlWSt
         JNrul97VivfhoGe9Pwd58WhbR77SUIRdxwCPwcndS2ezH9aaB3mo6blrNI1Rj+5cqzYd
         PxAu3dObGb4p8WmXf1XcgUBZjrut9pVSI2W3/JPS3mDFwT5htIwahJ+qwvKWcmZnHsIR
         qNF+7tye6zCt2BvP8eIE91/q4XojIKpAWEOekNK/pnf4+VhxYxXN+jtHMnlKZPcGsaNf
         6mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511695; x=1786116495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0zJjBb6df65zdd6rH3XQfHwC7WrqgvpRMiWDyR8oMjw=;
        b=VGMbNiSfYjXVVZwgM/2Kw8wU3qH+NjQ9dTpevTu+E/PRF12jA2mEc5v+Ac+eSPDEPD
         Adjn3VrjGmOPDJaTu/RlrWpMrVIEQF3ktT0CZvJcBpmayGNuqm9GT/ilS7X1OCdedNsM
         9vWCYDx1YAy8/vej73J7ldLIYfz6l+eKwmcbqlzbulGmCh4zEc6FKUR842Fh83Q8iHmX
         UinYowZEnvdVWXBlKM95DleqtoLgR4otuPGeX18ZlWvBVKtkinHnrUeB8r3ybAll2vCJ
         htU8NlbLgFe5dFaKJinxiWuQd0p4pDtpa4XH9YlJXDSJD/kHb2hFF6Lr2J86RedQZJIz
         AnBA==
X-Gm-Message-State: AOJu0YytTrMUSe6vfgPcqZIRsoWxmx0l+3zt3671RapWIdGQp2hIgQaW
	fcKaxNCbnguEO/38LG5jpQxBQl7mIg2jSfqAQ7q+3+5e04dLLzialZ65Byxdqg==
X-Gm-Gg: AR+sD12yXgZ+3CNghJxZNfxSUcKJHNlEZUkuxxnY/DbUhd9WAnOJCV9U4LS2uNWBJSa
	jrP9CL0c7/PW9KPbn0cfsBczJseGcNRHCQRfDg1in+W7JU6BfTxy1qdkiCDW5ScMNkabEmO9tX0
	SA32PrH66n+fr7xVmLhpFO5leaTtv1DiBjYwQMYeKsF5Gh0un0OeePsm0bFu+H7PpEqdJuu8T60
	l2ypucnTA/JdsCU1kY7KUuDEF0RQ68+lzBGbnnxCTOhATMc1B0ahJ3jQVqtWpO82dDuU0MoOcLL
	gmewiZ9LsY/iATewS4rNdUTVeMAGuc4wcxParPUdt6EvB3DhHgkn0r3CsIg5dW06jUIhgp/2KIE
	v+QKODWWOaCMDzLKIZ4cVCazf7I8pe5tVxDporuwtC3IE+UV8Z+KReL94WfwWtzIpzDfFLEkbEe
	1PjBi4mBhdRRLi6uzclM0ch0Cd06AEAKGBuhK2LxoW39+rARSBhhQ/L+ASFo+ioe9U73JZoONFf
	W0N2BZlO2Fnz2HptYHaLxpTQ/1o/yE=
X-Received: by 2002:a05:6102:809c:b0:74a:992e:84f6 with SMTP id ada2fe7eead31-75b23b6aa90mr542223137.10.1785511695364;
        Fri, 31 Jul 2026 08:28:15 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-759c9559116sm837007137.11.2026.07.31.08.28.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:28:14 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 1/6] wic-tools: drop the target bootloader firmware
Date: Fri, 31 Jul 2026 11:28:05 -0400
Message-ID: <20260731152810.2641327-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260731152810.2641327-1-twoerner@gmail.com>
References: <20260731152810.2641327-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 15:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242447

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


