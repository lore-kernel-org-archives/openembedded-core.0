Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6ABA76ACD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 02:31:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7R2VnNJ000645
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Aug 2015 19:31:49 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 26 Aug 2015 19:31:48 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Aug 2015 22:31:38 -0400
Message-ID: <b5fa9b3e6642db8d051c02bbd293acfec95371ab.1440642427.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440642427.git.bruce.ashfield@windriver.com>
References: <cover.1440642427.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] linux-yocto/3.14/4.1: fix ARM boot with gcc 5.x
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
X-List-Received-Date: Thu, 27 Aug 2015 02:31:50 -0000
Content-Type: text/plain

Booting qemuarm when the kernel was built with gcc 5.x would result in
a boot hang (or at least no visible output).

Updating the SRCREVs for the following change:

    Author: Jianchuan Wang
    Email: jianchuan.wang@windriver.com
    Subject: Omit to optimize vsprintf.c/kasprintf.c
    Date: Wed, 26 Aug 2015 13:54:57 +0800

    Add "-O0" for vsprintf.c/kasprintf.c

    Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>

While this may not be the final fix (it still has to go usptream and
be better explained), it gets us booting, so is good enough for the
time being.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb     | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index dfbf3a2b2c1a..06483c3ee8b9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -3,7 +3,7 @@ KBRANCH ?= "standard/preempt-rt"
 require recipes-kernel/linux/linux-yocto.inc
 
 SRCREV_machine ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
-SRCREV_meta ?= "92977854ff528bac281772dfb4823f4ca1513688"
+SRCREV_meta ?= "429f9e2ff0649b8c9341345622545d874d5e303a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index d085b0336d75..061205e92088 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
-SRCREV_meta ?= "92977854ff528bac281772dfb4823f4ca1513688"
+SRCREV_meta ?= "429f9e2ff0649b8c9341345622545d874d5e303a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index db77e9ead037..fc826a17c4ef 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -11,7 +11,7 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7e763688134a64b67f35af4f5a289be0b0c95126"
+SRCREV_machine_qemuarm ?= "9d0a4947dc7117e393dc3b8c07246d26e22ecdec"
 SRCREV_machine_qemuarm64 ?= "302ca233332fd364ecd028a0cf21b4cdc045e056"
 SRCREV_machine_qemumips ?= "9c6fdae47597756042a1d4ed613dff96e430e8e9"
 SRCREV_machine_qemuppc ?= "e4847afbb42583fa05e6a94c8d0c8f8e37ed5622"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index b1d4e5da8150..46d46165b359 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,7 +11,7 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "89601a6f23a7dd842f24911f0438d0b45c85aa00"
+SRCREV_machine_qemuarm ?= "3c1245d162ccb55de1af42bcf3dbf690457bf9e4"
 SRCREV_machine_qemuarm64 ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
 SRCREV_machine_qemumips ?= "4132a691d0908d10b8f07ce7ece02e6dc94e17bc"
 SRCREV_machine_qemuppc ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
 SRCREV_machine_qemux86-64 ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
 SRCREV_machine_qemumips64 ?= "033e1aa633465449edf544eb81adda0caf16ec60"
 SRCREV_machine ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
-SRCREV_meta ?= "92977854ff528bac281772dfb4823f4ca1513688"
+SRCREV_meta ?= "429f9e2ff0649b8c9341345622545d874d5e303a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.1.0


