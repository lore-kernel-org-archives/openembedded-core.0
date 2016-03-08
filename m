Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6B473172
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 04:34:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u284Y3Ow017562
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Mar 2016 20:34:04 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 7 Mar 2016 20:34:03 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 7 Mar 2016 23:33:58 -0500
Message-ID: <8c72caca31537d267598d5f1127c3c2012bc6158.1457411284.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457411284.git.bruce.ashfield@windriver.com>
References: <cover.1457411284.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/4.4: iwlwifi: mvm: don't allow sched scans without matches to be started
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
X-List-Received-Date: Tue, 08 Mar 2016 04:34:04 -0000
Content-Type: text/plain

Integrating the following commit for improved iwlwifi support:

    iwlwifi: mvm: don't allow sched scans without matches to be started

    commit 5e56276e7555b34550d51459a801ff75eca8b907 upstream.

    The firmware can perform a scheduled scan with not matchsets passed,
    but it can't send notification that results were found.  Since the
    userspace then cannot know when we got new results and the firmware
    wouldn't trigger a wake in case we are sleeping, it's better not to
    allow scans without matchsets.

    This fixes https://bugzilla.kernel.org/show_bug.cgi?id=110831

    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
    Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
    Signed-off-by: Wu Zheng <wu.zheng@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 41619d7296a3..d24c119973d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "853991833cc5140ca25450e81bf6b822d537a6ac"
+SRCREV_machine ?= "19e3ed348aefd0802dc8747cc143bea1155edc12"
 SRCREV_meta ?= "da47accec6c17c22cecf064be1da29b5bf3d7583"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 5a0884a48706..c31f637155b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.3"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
+SRCREV_machine ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
 SRCREV_meta ?= "da47accec6c17c22cecf064be1da29b5bf3d7583"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 9c3fe7f1dedb..ba39bb48dbf5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fa6a2f888d8adfe03b24ef32654be470960aed41"
-SRCREV_machine_qemuarm64 ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
-SRCREV_machine_qemumips ?= "a23b6eb1c5bca3bde2a9f94d9059274fff7da281"
-SRCREV_machine_qemuppc ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
-SRCREV_machine_qemux86 ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
-SRCREV_machine_qemux86-64 ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
-SRCREV_machine_qemumips64 ?= "8bbcb369cf605d1ada384f4b950da2abc5d1f4cc"
-SRCREV_machine ?= "ff4c4ef15b51f45b9106d71bf1f62fe7c02e63c2"
+SRCREV_machine_qemuarm ?= "d3ce63d0c83f579605b308f83c62a49e5dbf73e6"
+SRCREV_machine_qemuarm64 ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
+SRCREV_machine_qemumips ?= "06c34af69f436c8dca8ff23a30a7d1f834e1d07c"
+SRCREV_machine_qemuppc ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
+SRCREV_machine_qemux86 ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
+SRCREV_machine_qemux86-64 ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
+SRCREV_machine_qemumips64 ?= "79b496614c5d0b4862796928ef9890f2eb375a3b"
+SRCREV_machine ?= "dadb4369046246d7788db1f3cdf0a34298e35b4b"
 SRCREV_meta ?= "da47accec6c17c22cecf064be1da29b5bf3d7583"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


