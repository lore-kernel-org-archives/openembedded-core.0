Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF1ECAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:14:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.33488.1759756498402536079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 06:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hDdgPXup;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso3635904f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759756496; x=1760361296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dh1ys64E7ko2cMsQ0wU+tWqgDSnlzBTNdrqgVJLLepU=;
        b=hDdgPXupCaxQaYnbiVWo9DegVPg+pXqT/2rKwiwLCJ8DqXu2IC8WWWfEUPr4FKj3aW
         AzWxiAo+DQwtGXBL/8mn31U5kMtZbl3we/tBDYJQ15lBVRIDB5eiARoAgt7+sifsij5O
         ie/bu5OGYLF8RJLmDzPemJFdDvtl0EcXVkNcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759756496; x=1760361296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dh1ys64E7ko2cMsQ0wU+tWqgDSnlzBTNdrqgVJLLepU=;
        b=hFS3KbUGkred/T2eUfzR8dEuYl8IdemF9vYbhpACLO6AOul/7A/o88WmGEfEGP5zNV
         UyvF4Mu6QmhgH2pwqTCBWPHfQJnyuyHEVFWjx0c7KbbIRHATdJUIJXHxsCTw6GGwvhfG
         K+6Ta3Z+FCDYLdWvgA5ydFnh5bF9oab8/6Ot1WF+uX3hyyOtZW+onVVjfaOTpnZLHePF
         s7gdKiBhBjFH/ZRaO4rVqeu3rqNVbpTbjzDCOPwXXiFYxy3IB37J8gwY/fxJTMCGb8SL
         qnSyA6qXHPjP91wRw19To/apotAm0874MJZKN5HSPzCfDPXlUkC519EhAriOWKLoSleU
         jAkw==
X-Gm-Message-State: AOJu0Yw2FL+GW3yws4V5cGmPR1CznWowCRc4jvbqCe5SQ7/OWtpcOhdn
	SGVsFuZuMbfn6jsuZW42d5h3lHIcgOzJC85ucNAazuBU6+Dfqlbs1mmxdpjM+XFpFLSgpZOTF3x
	0Pj+k
X-Gm-Gg: ASbGncvM7n8ypFaFhS9Z5HgiiMg0LEasqv4lHAAh1XkdcqTSTcL95SqW8Xn29fCL4WY
	2Tbkyg6Dz6S0LeYWxEfEopeLjXCFTe63z/MGgPmthHHkJwYYWR2djEk4pHaoAIf3IyA8006nKm2
	JdAchBAuZudTlma7dgqZzsJpySZP4+WRQWbLAHdR07LDOA+Z8zuNMhJVMayLhXky4Cx0XnmTSF6
	3h8qGGwGIRNN/p4qiY1XyNn6JzyPh+ynyM0npZJ9rIgxp47gLPhHZTXc3ot5+O4g2Rnnv42RemD
	F4JN9mdM5EOYsrbbq8nfBSVF0GALp8OjjBe1+NweGy/maQzBm1OFYl906Uf8VtJl8id9uHcx2Si
	NgX0Q6MiTt7BrVuapBVeRQf17Nv9S++orbufHevlgX4PjConlOHSQMVfpGFKXbSDzkG4X/c5kkw
	==
X-Google-Smtp-Source: AGHT+IHqucPljbQAhRxAagPzNanYI23CM8W0PbpVrobW6jZL+jwhRts0pSG5DB3aP7GmAmbVcnLx6w==
X-Received: by 2002:a05:6000:2083:b0:3ea:fb3d:c4cb with SMTP id ffacd0b85a97d-425671c5e49mr9437073f8f.56.1759756496047;
        Mon, 06 Oct 2025 06:14:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3e9a:117:edd2:a796])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8abe49sm20994085f8f.21.2025.10.06.06.14.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:14:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oeqa/selftest/bblock/fitimage/sstatetests: Fix changing MACHINE during the test
Date: Mon,  6 Oct 2025 14:14:52 +0100
Message-ID: <20251006131454.846597-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 13:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224480

With config fragments, changing MACHINE in the test like this no
longer works. Use the forcevarable override to allow it to work.
This also needs a tweak to bitbake to work correctly, sent
seperately. Whilst ugly, this avoids the need to start changing
config fragments within oeqa right now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bblock.py      |  4 +--
 meta/lib/oeqa/selftest/cases/fitimage.py    | 26 ++++++++--------
 meta/lib/oeqa/selftest/cases/sstatetests.py | 34 ++++++++++-----------
 3 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblock.py b/meta/lib/oeqa/selftest/cases/bblock.py
index 2b62d2a0aa2..cb99d32bb5d 100644
--- a/meta/lib/oeqa/selftest/cases/bblock.py
+++ b/meta/lib/oeqa/selftest/cases/bblock.py
@@ -122,11 +122,11 @@ class BBLock(OESelftestTestCase):
         else:
             machine = "qemux86-64"
 
-        self.write_config('MACHINE = "%s"\n' % machine)
+        self.write_config('MACHINE:forcevariable = "%s"\n' % machine)
 
         self.lock_recipes(recipes, tasks)
 
-        self.write_config('MACHINE = "%s"\n' % self.td["MACHINE"])
+        self.write_config('MACHINE:forcevariable = "%s"\n' % self.td["MACHINE"])
         # modify quilt's do_compile task
         self.modify_tasks(recipes, tasks)
 
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 3c408577476..195b9ee8b59 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -787,7 +787,7 @@ FIT_CONF_PREFIX = "foo-"
 
         config = """
 DISTRO = "poky"
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 """
         self.write_config(config)
 
@@ -828,7 +828,7 @@ MACHINE = "beaglebone-yocto"
         """
         config = """
 # Enable creation of fitImage
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 # Add a devicetree overlay which does not need kernel sources
 PREFERRED_PROVIDER_virtual/dtb = "bbb-dtbs-as-ext"
 """
@@ -855,7 +855,7 @@ PREFERRED_PROVIDER_virtual/dtb = "bbb-dtbs-as-ext"
         # Generate a configuration section which gets included into the local.conf file
         config = """
 # Enable creation of fitImage
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "dev"
@@ -903,7 +903,7 @@ FIT_CONF_DEFAULT_DTB = "am335x-bonegreen.dtb"
         # Generate a configuration section which gets included into the local.conf file
         config = """
 # Enable creation of fitImage
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 UBOOT_SIGN_ENABLE = "1"
 FIT_GENERATE_KEYS = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
@@ -939,7 +939,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
 
         config = """
 DISTRO = "poky"
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 INITRAMFS_SCRIPTS = ""
 UBOOT_MACHINE = "am335x_evm_defconfig"
@@ -993,7 +993,7 @@ FIT_HASH_ALG = "sha256"
 
         config = """
 DISTRO = "poky"
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 INITRAMFS_IMAGE_BUNDLE = "1"
 INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 INITRAMFS_SCRIPTS = ""
@@ -1412,7 +1412,7 @@ class UBootFitImageTests(FitImageTestCase):
         """
         config = """
 # We need at least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
+MACHINE:forcevariable = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 SPL_BINARY = "MLO"
 
@@ -1451,7 +1451,7 @@ UBOOT_FIT_DESC = "A model description"
         config = """
 # There's no U-boot defconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
+MACHINE:forcevariable = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 SPL_BINARY = "MLO"
 # Enable creation and signing of the U-Boot fitImage
@@ -1498,7 +1498,7 @@ UBOOT_FIT_HASH_ALG = "sha256"
         config = """
 # There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
+MACHINE:forcevariable = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 SPL_BINARY = "MLO"
 # Enable creation and signing of the U-Boot fitImage
@@ -1546,7 +1546,7 @@ UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
         """
         config = """
 # We need at least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
+MACHINE:forcevariable = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 SPL_BINARY = "MLO"
 
@@ -1612,7 +1612,7 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
         config = """
 # There's no U-boot deconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
+MACHINE:forcevariable = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 SPL_BINARY = "MLO"
 # Enable creation and signing of the U-Boot fitImage
@@ -1676,7 +1676,7 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT = "0x80280000"
         """
         config = """
 # Enable creation of fitImage
-MACHINE = "beaglebone-yocto"
+MACHINE:forcevariable = "beaglebone-yocto"
 UBOOT_SIGN_ENABLE = "1"
 UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
 UBOOT_SIGN_KEYNAME = "the-kernel-config-key"
@@ -1715,7 +1715,7 @@ FIT_SIGN_INDIVIDUAL = "1"
         config = """
 # There's no U-boot defconfig with CONFIG_FIT_SIGNATURE yet, so we need at
 # least CONFIG_SPL_LOAD_FIT and CONFIG_SPL_OF_CONTROL set
-MACHINE = "qemuarm"
+MACHINE:forcevariable = "qemuarm"
 UBOOT_MACHINE = "am57xx_evm_defconfig"
 # Enable creation and signing of the U-Boot fitImage (no SPL)
 UBOOT_FITIMAGE_ENABLE = "1"
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 08f94b168a8..44dd674a325 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -336,20 +336,20 @@ class SStateCacheManagement(SStateBase):
     def test_sstate_cache_management_script_using_pr_3(self):
         global_config = []
         target_config = []
-        global_config.append('MACHINE = "qemux86-64"')
+        global_config.append('MACHINE:forcevariable = "qemux86-64"')
         target_config.append('PR = "0"')
         global_config.append(global_config[0])
         target_config.append('PR = "1"')
-        global_config.append('MACHINE = "qemux86"')
+        global_config.append('MACHINE:forcevariable = "qemux86"')
         target_config.append('PR = "1"')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
     def test_sstate_cache_management_script_using_machine(self):
         global_config = []
         target_config = []
-        global_config.append('MACHINE = "qemux86-64"')
+        global_config.append('MACHINE:forcevariable = "qemux86-64"')
         target_config.append('')
-        global_config.append('MACHINE = "qemux86"')
+        global_config.append('MACHINE:forcevariable = "qemux86"')
         target_config.append('')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
@@ -357,7 +357,7 @@ class SStateHashSameSigs(SStateBase):
     def sstate_hashtest(self, sdkmachine):
 
         self.write_config("""
-MACHINE = "qemux86"
+MACHINE:forcevariable = "qemux86"
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
 BUILD_ARCH = "x86_64"
 BUILD_OS = "linux"
@@ -368,7 +368,7 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         bitbake("core-image-weston -S none")
         self.write_config("""
-MACHINE = "qemux86"
+MACHINE:forcevariable = "qemux86"
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
 BUILD_ARCH = "i686"
 BUILD_OS = "linux"
@@ -454,13 +454,13 @@ class SStateHashSameSigs2(SStateBase):
 
         configA = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
-MACHINE = \"qemux86-64\"
+MACHINE:forcevariable = \"qemux86-64\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         #OLDEST_KERNEL is arch specific so set to a different value here for testing
         configB = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
-MACHINE = \"qemuarm\"
+MACHINE:forcevariable = \"qemuarm\"
 OLDEST_KERNEL = \"3.3.0\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 ERROR_QA:append = " somenewoption"
@@ -475,7 +475,7 @@ WARN_QA:append = " someotheroption"
 
         configA = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
-MACHINE = \"qemux86-64\"
+MACHINE:forcevariable = \"qemux86-64\"
 require conf/multilib.conf
 MULTILIBS = \"multilib:lib32\"
 DEFAULTTUNE:virtclass-multilib-lib32 = \"x86\"
@@ -483,7 +483,7 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         configB = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
-MACHINE = \"qemuarm\"
+MACHINE:forcevariable = \"qemuarm\"
 require conf/multilib.conf
 MULTILIBS = \"\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
@@ -500,7 +500,7 @@ class SStateHashSameSigs3(SStateBase):
 
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
-MACHINE = \"qemux86\"
+MACHINE:forcevariable = \"qemux86\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
@@ -510,7 +510,7 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
-MACHINE = \"qemux86copy\"
+MACHINE:forcevariable = \"qemux86copy\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
@@ -546,7 +546,7 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
 
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
-MACHINE = \"qemux86\"
+MACHINE:forcevariable = \"qemux86\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
@@ -556,7 +556,7 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         bitbake("binutils-native  -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
-MACHINE = \"qemux86copy\"
+MACHINE:forcevariable = \"qemux86copy\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
@@ -707,7 +707,7 @@ class SStateFindSiginfo(SStateBase):
         """
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstates-findsiginfo\"
-MACHINE = \"qemux86-64\"
+MACHINE:forcevariable = \"qemux86-64\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE:virtclass-multilib-lib32 = "x86"
@@ -957,13 +957,13 @@ class SStateMirrors(SStateCheckObjectPresence):
         if check_cdn:
             self.config_sstate(True)
             self.append_config("""
-MACHINE = "{}"
+MACHINE:forcevariable = "{}"
 BB_HASHSERVE_UPSTREAM = "hashserv.yoctoproject.org:8686"
 SSTATE_MIRRORS ?= "file://.* http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
 """.format(machine))
         else:
             self.append_config("""
-MACHINE = "{}"
+MACHINE:forcevariable = "{}"
 """.format(machine))
         result = bitbake("-DD -n {}".format(targets))
         bitbake("-S none {}".format(targets))

