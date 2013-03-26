Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UKVPl-0002W0-V6
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 16:04:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2QEkobs015627
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Mar 2013 07:46:50 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 26 Mar 2013 07:46:51 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Mar 2013 07:46:37 -0700
Message-ID: <db19eada85a3c7de5efbbcadd217fed4872a5d1f.1364308617.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364308617.git.bruce.ashfield@windriver.com>
References: <cover.1364308617.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/3.8: fix perf host contamination
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 15:04:46 -0000
Content-Type: text/plain

Updating the 3.8 SRCREVs with the following fix:

    libtraceevent: Remove hard coded include to /usr/local/include in Makefile

    commit b9e8c37220c80e78289a1e87b50c09418eb59a7e upstream

    having /usr/local/include hardcoded into the makefile is not necessary
    as this is automatically included by GCC. It also infects cross-compile
    builds with the host systems includes.

    Signed-off-by: Jack Mitchell
    Acked-by: Namhyung Kim
    Cc: Ingo Molnar
    Cc: Paul Mackerras
    Cc: Peter Zijlstra
    Link: http://lkml.kernel.org/r/1362741712-21308-1-git-send-email-ml@communistcode.co.uk
    Signed-off-by: Arnaldo Carvalho de Melo

    This implements the fix I described in Yocto [BUG #3993][perf using
    host includes], now upstream.

    Integrated-by: Tom Zanussi <tom.zanussi@linux.intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

[YOCTO #3993]

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.8.bb    |   12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 97178c7..f12de2e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "e9b9f72029522ef142ab181e9f7f3ae71535181a"
-SRCREV_machine_qemuppc ?= "7443096f0bdc6522053decd10430fc96a0ef9b94"
+SRCREV_machine ?= "d125901ac3e516e9b894df088f4282347651b690"
+SRCREV_machine_qemuppc ?= "66630413d6df1665f2c5c94d25eb409271ffe20c"
 SRCREV_meta ?= "2a6d36e75ca0a121570a389d7bab76ec240cbfda"
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 2b46c3d..f2ad0e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -3,12 +3,12 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "358940bfd596167b6ed03caa4113944c7845a855"
-SRCREV_machine_qemumips  ?= "7d995e09dfb21185442d37f62db0a5655b1adba3"
-SRCREV_machine_qemuppc ?= "1c65b040e7952d177ac4c83df5551efd90fc29f2"
-SRCREV_machine_qemux86 ?= "c753c612377f08f5172b528b9b07715f2b3b5735"
-SRCREV_machine_qemux86-64 ?= "c753c612377f08f5172b528b9b07715f2b3b5735"
-SRCREV_machine ?= "c753c612377f08f5172b528b9b07715f2b3b5735"
+SRCREV_machine_qemuarm ?= "3a73643770a32ea6c86724e92e1e5abecb5dc822"
+SRCREV_machine_qemumips  ?= "1aefa19417793412ef87217a4cb5d1074dc549ba"
+SRCREV_machine_qemuppc ?= "8844013c81e9ad80246aabca6573eed9dbaac646"
+SRCREV_machine_qemux86 ?= "15a0766b3d007e5fafce3503375694dff2b0603e"
+SRCREV_machine_qemux86-64 ?= "15a0766b3d007e5fafce3503375694dff2b0603e"
+SRCREV_machine ?= "15a0766b3d007e5fafce3503375694dff2b0603e"
 SRCREV_meta ?= "2a6d36e75ca0a121570a389d7bab76ec240cbfda"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.7.10.4



