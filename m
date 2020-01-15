Return-Path: <pbarker@konsulko.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 332C96D4B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 18:08:46 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d139so5340794wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 10:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Hto8gybIFydAH8mE65BjLxm+Q3NtYrIfGhkCE3+H1Ak=;
	b=KFxHkc2rCyvBnDChlDjFatuFIqYae1uywsMKXy1JZotJZoL7xI+K2GTsZ9o+LaQkfL
	zr+3X9GQlDR9zFvKxHPtXCj/kUc3JnxYuekY4w1dikmdxNxBfFFWuk4Qp1agQYauXnVI
	Mscz9q7p0yhf+14G1Y14vnQozXVUWzLdhMFOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Hto8gybIFydAH8mE65BjLxm+Q3NtYrIfGhkCE3+H1Ak=;
	b=Ck8wZaUntAU6xkUYzqiuhMlOtjtTjvcZ32KE8m78dT5wdqX33RQpV/ESH+xBQ2+ym4
	AR2UaPw+ozKjrMW3hHtf2+vpcnpQSsd1Duscmc/EJGV9aVtFMTek0OTjvzuYxk8cTz9C
	4t9Q3lb0qef/DdEGRs3XeXYHy52gmtBGJB52VZzxiEUFI3UP8SCaAAdCaO+u66fUiyu4
	3eh7Pra4XSGaioNhbrZCVlgsIR8DuAomPeHIaDdGKwzvBw0vyieUBOZze8gW8Uj+eLnm
	aKtKQ7QjBahaYlZn+UAVMEOM6HnriZHOGNoM0gHuP+ccEAqbm/eYf4C2qIO/0AdmUlhQ
	WtPA==
X-Gm-Message-State: APjAAAU8IOJqXF4j3EWOcMtF4uk5+A6sNRnmDULb8P1DsGuKI5eryljT
	u8qWWJxI3BYXXElY9kxwzdiBX/pjHM4EDVBF
X-Google-Smtp-Source: APXvYqy9uD/M/ul8KLQjeLbQqoDF1XJXDFwspgrgXFiE3ZlCXPIt1xiiBdiITso5g06pO15Kb8PmYw==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr1245778wmi.146.1579111726702; 
	Wed, 15 Jan 2020 10:08:46 -0800 (PST)
Received: from ub1910.Hitronhub.home
	(cpc86219-nott20-2-0-cust829.12-2.cable.virginm.net. [82.4.207.62])
	by smtp.gmail.com with ESMTPSA id
	s10sm25407454wrw.12.2020.01.15.10.08.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 10:08:46 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 18:08:26 +0000
Message-Id: <20200115180828.17399-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200115180828.17399-1-pbarker@konsulko.com>
References: <20200115180828.17399-1-pbarker@konsulko.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] kernel-yocto: Move defaults and tasks from linux-yocto.inc into bbclass
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
X-List-Received-Date: Wed, 15 Jan 2020 18:08:46 -0000
Content-Transfer-Encoding: 8bit

This allows the kernel-yocto bbclass to be inherited in a recipe without
needing to include linux-yocto.inc. The bbclass should stand on its own
and linux-yocto.inc does a few things which may not be desired in other
kernel recipes (such as modifying KERNEL_FEATURES).

The LINUX_VERSION_EXTENSION default is not moved as other kernel recipes
may not want this setting in place.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/classes/kernel-yocto.bbclass         | 21 +++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc | 21 ---------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 87c681f1c3..8b22c34243 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -3,6 +3,22 @@ SRCTREECOVEREDTASKS += "do_kernel_configme do_validate_branches do_kernel_config
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
 PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 
+# The distro or local.conf should set this, but if nobody cares...
+LINUX_KERNEL_TYPE ??= "standard"
+
+# KMETA ?= ""
+KBRANCH ?= "master"
+KMACHINE ?= "${MACHINE}"
+SRCREV_FORMAT ?= "meta_machine"
+
+# LEVELS:
+#   0: no reporting
+#   1: report options that are specified, but not in the final config
+#   2: report options that are not hardware related, but set by a BSP
+KCONF_AUDIT_LEVEL ?= "1"
+KCONF_BSP_AUDIT_LEVEL ?= "0"
+KMETA_AUDIT ?= "yes"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
@@ -474,3 +490,8 @@ python () {
     if 'do_diffconfig' in d:
         bb.build.addtask('do_diffconfig', None, 'do_kernel_configme', d)
 }
+
+# extra tasks
+addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
+addtask validate_branches before do_patch after do_kernel_checkout
+addtask kernel_configcheck after do_configure before do_compile
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index f191946f2a..91df9c1cd5 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -39,22 +39,6 @@ KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'fea
 # and it can be specific to the machine or shared
 # KMACHINE = "UNDEFINED"
 
-# The distro or local.conf should set this, but if nobody cares...
-LINUX_KERNEL_TYPE ??= "standard"
-
-# KMETA ?= ""
-KBRANCH ?= "master"
-KMACHINE ?= "${MACHINE}"
-SRCREV_FORMAT ?= "meta_machine" 
-
-# LEVELS:
-#   0: no reporting
-#   1: report options that are specified, but not in the final config
-#   2: report options that are not hardware related, but set by a BSP
-KCONF_AUDIT_LEVEL ?= "1"
-KCONF_BSP_AUDIT_LEVEL ?= "0"
-KMETA_AUDIT ?= "yes"
-
 LINUX_VERSION_EXTENSION ??= "-yocto-${LINUX_KERNEL_TYPE}"
 
 # Pick up shared functions
@@ -69,10 +53,5 @@ do_install_append(){
 	fi
 }
 
-# extra tasks
-addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
-addtask validate_branches before do_patch after do_kernel_checkout
-addtask kernel_configcheck after do_configure before do_compile
-
 # enable kernel-sample for oeqa/runtime/cases's ksample.py test
 KERNEL_FEATURES_append_qemuall=" features/kernel-sample/kernel-sample.scc"
-- 
2.20.1


