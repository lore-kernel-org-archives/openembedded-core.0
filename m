Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id EBC9960DEB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 17:35:58 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id q15so6378130qki.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 09:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C7qCNhjMxRF6QRGFtyOd0RtmJFDac3EE6TZfevXm6Tg=;
	b=WGPDDAx1e0uvXhxk20iDSGF04LMV2NQBxKvw7H+UO/ngyW5V+sCI0SCKpRJz0dCYoY
	LIHEcu5cmeoLK+mnnKg+EXxv+YrHpQ4d4futtgrmZqG5dpou6IlA484fjRVle+tNV9H7
	1Hq9kiCnWXvNeKHw7xnXIOkMqz7XlI8AGwxiLto5HmU/Bnau2qjlvtLza3HfXHEZDEIo
	FuWBgPuMPCeb5rDikMFEpeCIXsh1JCvwScJxefuzbmxA5gi5WofY5pK+y2+SEftJF0++
	oLtFLQM9Q7owmhKadoyLV9/8bnjTlCN5CQqqfDx5fvOIaLyId4X4GHS1VKN6lryQ1NZs
	ywDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C7qCNhjMxRF6QRGFtyOd0RtmJFDac3EE6TZfevXm6Tg=;
	b=ofxN/UOwWcVlDm/0oegYHRqpI9C7GdO70mr94dIGXQVWjj3LcntIPqJfQ/rviZSplw
	rTieLmpU9DJJ0c3TFaGA97G1hyhQiOERpD9FXi+qsv5RqGJICJE+7+zWStvH4CTzqPz3
	BFYwTb6UHVEkQAZJ0YTueENxQ7txyn0Ji0zRt4wm6J0qtF/u4hIcxQ5KR0ymSQsPsko4
	jh43roEOGeRMOguI7gD28LKCYzsgFa5cN7xqIMnUSYfTEylHhjsUw9BtvbK2mVpWON5U
	X5wD9fskBOxR1FrpNVIEXjBJbBAW95azuJd9WYakc8N4fCUmaPknU52OC0QQj+Rzz16N
	leZg==
X-Gm-Message-State: APjAAAWgpRsnRL+l00FLZtoW8q294ti1ztskSxXVIlsxZeL3FqQyQwD4
	CFF+vPFQWLLiU7Z5pxPf9kM=
X-Google-Smtp-Source: APXvYqxHGGCzfs2KYF+tQ7NIIFzWbevY4d9DPanflXxb7YWZeqKJiIFHi25Ttr5HPXE2bownQYOBew==
X-Received: by 2002:a37:c84:: with SMTP id 126mr3561211qkm.372.1581010559868; 
	Thu, 06 Feb 2020 09:35:59 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	e26sm1715138qkm.80.2020.02.06.09.35.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 06 Feb 2020 09:35:59 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu,  6 Feb 2020 12:35:47 -0500
Message-Id: <8cdfd5e7fd2571a9e7ecaab332dad336bceb711b.1581010425.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1581010425.git.bruce.ashfield@gmail.com>
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] kernel-yocto: Move defaults and tasks from linux-yocto.inc into bbclass
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
X-List-Received-Date: Thu, 06 Feb 2020 17:35:59 -0000
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

This allows the kernel-yocto bbclass to be inherited in a recipe without
needing to include linux-yocto.inc. The bbclass should stand on its own
and linux-yocto.inc does a few things which may not be desired in other
kernel recipes (such as modifying KERNEL_FEATURES).

The LINUX_VERSION_EXTENSION default is not moved as other kernel recipes
may not want this setting in place.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass         | 21 +++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc | 21 ---------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 141eeafeb9..a0362f6acb 100644
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
@@ -475,3 +491,8 @@ python () {
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
2.19.1


