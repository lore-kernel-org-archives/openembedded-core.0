Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A62C7828E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:10:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4QKArtr017951
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 26 May 2017 13:10:53 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 26 May 2017 13:10:52 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 26 May 2017 16:10:45 -0400
Message-ID: <e905901eab77eb4f4f14ad7e87a7401bff377efe.1495829213.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1495829213.git.bruce.ashfield@windriver.com>
References: <cover.1495829213.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/meta: smp: Add config X86_BIGSMP since its needed when NR_CPUS > 8
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
X-List-Received-Date: Fri, 26 May 2017 20:10:53 -0000
Content-Type: text/plain

Updating the kernel meta data with the following configuration change:

  When we set NR_CPUS to something > than 8, we also need to set
  X86_BIGSMP
  according to Kconfig:

  config X86_BIGSMP
        bool "Support for big SMP systems with more than 8 CPUs"

  otherwise NR_CPU will end up being reset to 8

[YOCTO #10362]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index 0a832b90c1ed..e6890e3497b4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_meta ?= "e61353b33d00ea3d3eeed125d59477b3797f6751"
+SRCREV_meta ?= "21488a58127eebac2b6b656305aa0fb695e46c50"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 6fd4bf37665a..061ada0d35e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "cb23b8e3ce0ad77acb717e249b4821c8350f1c83"
-SRCREV_meta ?= "504258db25fddc61726bf93f3880ca6f2f381469"
+SRCREV_meta ?= "9d268bd8a8f0e01de550aef730e639bd6b148132"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 05b08a428fa6..fa1263d817ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "095698fd99b452d95188ff6f2cce3df5127beb5c"
-SRCREV_meta ?= "517106befbfadda8aac38eda9e4dfd51df264e2f"
+SRCREV_meta ?= "5fd0435f4d40c03bc5a06389d22dbafd5086e7ab"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index ce9c3d7f7f55..d61a1ee97df0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_meta ?= "e61353b33d00ea3d3eeed125d59477b3797f6751"
+SRCREV_meta ?= "21488a58127eebac2b6b656305aa0fb695e46c50"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index b821e256cfd1..8bc8b5774300 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
-SRCREV_meta ?= "504258db25fddc61726bf93f3880ca6f2f381469"
+SRCREV_meta ?= "9d268bd8a8f0e01de550aef730e639bd6b148132"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index dd84d84e80e3..a55decae84e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
-SRCREV_meta ?= "517106befbfadda8aac38eda9e4dfd51df264e2f"
+SRCREV_meta ?= "5fd0435f4d40c03bc5a06389d22dbafd5086e7ab"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index 5ddb819558d8..1c35ebe4b749 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
 SRCREV_machine_qemux86-64 ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
 SRCREV_machine_qemumips64 ?= "229abf6f63652058db1308a0c07e59652d3e6a23"
 SRCREV_machine ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
-SRCREV_meta ?= "e61353b33d00ea3d3eeed125d59477b3797f6751"
+SRCREV_meta ?= "21488a58127eebac2b6b656305aa0fb695e46c50"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 6e77936e2e3f..9406a05e2ed1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
 SRCREV_machine_qemux86-64 ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
 SRCREV_machine_qemumips64 ?= "a9b8241a0c0e7626baba529abb4940831ff3a83e"
 SRCREV_machine ?= "98b9340a7858f786f5ff7d50021ef83eaad0613d"
-SRCREV_meta ?= "504258db25fddc61726bf93f3880ca6f2f381469"
+SRCREV_meta ?= "9d268bd8a8f0e01de550aef730e639bd6b148132"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 90a35961fa31..5d73cfeb1894 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
 SRCREV_machine_qemux86-64 ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
 SRCREV_machine_qemumips64 ?= "bfdb9d2cf36f5ded1cd8d03e58465d9f6250bba8"
 SRCREV_machine ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
-SRCREV_meta ?= "517106befbfadda8aac38eda9e4dfd51df264e2f"
+SRCREV_meta ?= "5fd0435f4d40c03bc5a06389d22dbafd5086e7ab"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


