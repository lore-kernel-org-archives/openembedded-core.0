Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3147C76903
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 19:21:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8IJLenj017294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Sep 2015 12:21:40 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Fri, 18 Sep 2015 12:21:39 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 18 Sep 2015 15:21:37 -0400
Message-ID: <6a077bf431f024567be841a71b3fe5c26b3d7249.1442603150.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442603150.git.bruce.ashfield@windriver.com>
References: <cover.1442603150.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/4.1: aufs, yaffs2 and driver fixes
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
X-List-Received-Date: Fri, 18 Sep 2015 19:21:45 -0000
Content-Type: text/plain

Updating the 4.1 SRCREVs to integrate the following changes:

  f830ab33799d aufs: call mutex.owner only when DEBUG_MUTEXES or MUTEX_SPIN_ON_OWNER is defined
  87df2e93ed65 Bluetooth: Delay check for conn->smp in smp_conn_security()
  b09c3eab3e50 cc2520: set the default fifo pin value from platform data
  62b01c325d42 fs/yaffs2: Fix a judgement logic for ACL operations
  1d19c4e95cfc yaffs2: remove read and write methods
  2c822dbc43b9 yaffs2: replace f_dentry to f_path.dentry

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 06483c3ee8b9..7265cde3fa83 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
-SRCREV_meta ?= "429f9e2ff0649b8c9341345622545d874d5e303a"
+SRCREV_machine ?= "f830ab33799d6e0b5433c18c5c6c3c68dce17815"
+SRCREV_meta ?= "ef417dc3dbac098e2273b9157bf7ea8b1ade0ec5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 061205e92088..b0619702f7a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.1.6"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
-SRCREV_meta ?= "429f9e2ff0649b8c9341345622545d874d5e303a"
+SRCREV_machine ?= "f830ab33799d6e0b5433c18c5c6c3c68dce17815"
+SRCREV_meta ?= "ef417dc3dbac098e2273b9157bf7ea8b1ade0ec5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 46d46165b359..d974842810e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3c1245d162ccb55de1af42bcf3dbf690457bf9e4"
-SRCREV_machine_qemuarm64 ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
-SRCREV_machine_qemumips ?= "4132a691d0908d10b8f07ce7ece02e6dc94e17bc"
-SRCREV_machine_qemuppc ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
-SRCREV_machine_qemux86 ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
-SRCREV_machine_qemux86-64 ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
-SRCREV_machine_qemumips64 ?= "033e1aa633465449edf544eb81adda0caf16ec60"
-SRCREV_machine ?= "59b8c4f5e8ddb9c33c62fff22204fe2b0d8c703e"
-SRCREV_meta ?= "429f9e2ff0649b8c9341345622545d874d5e303a"
+SRCREV_machine_qemuarm ?= "f830ab33799d6e0b5433c18c5c6c3c68dce17815"
+SRCREV_machine_qemuarm64 ?= "f830ab33799d6e0b5433c18c5c6c3c68dce17815"
+SRCREV_machine_qemumips ?= "f830ab33799d6e0b5433c18c5c6c3c68dce17815"
+SRCREV_machine_qemuppc ?= "f830ab33799d6e0b5433c18c5c6c3c68dce17815"
+SRCREV_machine_qemux86 ?= "f830ab33799d6e0b5433c18c5c6c3c68dce17815"
+SRCREV_machine_qemux86-64 ?= "f830ab33799d6e0b5433c18c5c6c3c68dce17815"
+SRCREV_machine_qemumips64 ?= "f830ab33799d6e0b5433c18c5c6c3c68dce17815"
+SRCREV_machine ?= "f830ab33799d6e0b5433c18c5c6c3c68dce17815"
+SRCREV_meta ?= "ef417dc3dbac098e2273b9157bf7ea8b1ade0ec5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
-- 
2.1.0


