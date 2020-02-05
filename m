Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1686360CED
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:12:56 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n17so3040883qtv.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=C7qCNhjMxRF6QRGFtyOd0RtmJFDac3EE6TZfevXm6Tg=;
	b=c4D4kcbnVef6lllt0oUokW23TvS1blm5GucNa9BFO9t6BiWKMdENOp5iWVbXpr8gh1
	9HOWk69KCfhmwXmTew9n547zYd9u3wUO7x0Fv5L5gFhjVMX35PwXaIw53gL18evZkS1T
	/DwTJCyA07UUioJwtfpPDo55ZW/5rwnAWPqfQCDUVxTHLDnak+aPwVSQpKa9IvlCQk0i
	EV4XWZqpwhBfrUeYJRqm4vE8jfFO+/0CQfmj2NxZ7nv3rHj3jfn1COgCppQqF/59c+hk
	YbAQESqn6x1p6wyFflHyYyfYT9yZrLjzVXeH5vn5cSPnUcm7OzfONnXc3+3YwJoU+F9M
	nICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=C7qCNhjMxRF6QRGFtyOd0RtmJFDac3EE6TZfevXm6Tg=;
	b=GU3lRM0/T/RI+8PJq8H4V4wRn+wcTCLHV9E++c68mh2Oi+s2F5bk6dz/oG0Oc+KqGW
	jU1HbyamE8XCgSMTf2EoPIsDsdYRbXBNzlBiD8INBNAge3U2Vr1WsqZxu2tgJr71kyXu
	kHHJ7ilsRP5rLTOmn7chcyKOxnYUG9JAf8xMko8/cN5QSls15pmcoBlvVKQJLray07/8
	aLfNqhrR8SSU9LZkaqlM1nA/mco0eo6Bm5gr96ZOsTWUoRDUubS2GJ0wzFC5I7kscvoh
	lO6cIaU3JPTJn7D5G1m0lzweY97EpJeK2vDgBLOFST38zgkq7j9cECFci2z6ODdF6m38
	Fcxg==
X-Gm-Message-State: APjAAAW08+5OnW9LSMRFZkSrQPmvfgPZng5RAwYWU8j6sHHgxP7JlSTh
	Xvi5qkOa/8cfqCAqBxvdu+ir9JkBGMrC+g==
X-Google-Smtp-Source: APXvYqznrjKE7aIrHjzAloWZ4rT+cQhyPgjfE4cG0vki2mpRnZhgEs+EaHY5ZyMLjY2pEoe+PmD7LA==
X-Received: by 2002:ac8:1194:: with SMTP id d20mr135869qtj.243.1580944377831; 
	Wed, 05 Feb 2020 15:12:57 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id o17sm696332qtj.80.2020.02.05.15.12.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 15:12:57 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  5 Feb 2020 18:12:45 -0500
Message-Id: <8cdfd5e7fd2571a9e7ecaab332dad336bceb711b.1580944129.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1580944129.git.bruce.ashfield@gmail.com>
References: <cover.1580944129.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] kernel-yocto: Move defaults and tasks from linux-yocto.inc into bbclass
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
X-List-Received-Date: Wed, 05 Feb 2020 23:12:57 -0000
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


