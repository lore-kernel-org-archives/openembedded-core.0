Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 571936FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 12:25:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2UCPFx2006949
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 05:25:15 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Mar 2016 05:25:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 08:25:04 -0400
Message-ID: <f2b2f56a2fe3200742b1ecec529d8770c18f22d8.1459340441.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1459340441.git.bruce.ashfield@windriver.com>
References: <cover.1459340441.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] linux-yocto/4.1: Intel Broxton: pwm backports
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
X-List-Received-Date: Wed, 30 Mar 2016 12:25:14 -0000
Content-Type: text/plain

Integrating the following mainline changes:

afaf425e796c pwm: Add the pwm_is_enabled() helper
023721c3d067 pwm: atmel: Fix incorrect CDTY value after disabling
cd9fe8adb313 pwm: atmel: Fix incorrect CDTY value after enabling
3f445ca6df1f pwm: lpss: Rework the sequence of programming PWM_SW_UPDATE
9a51f622bdc9 pwm: lpss: Select core part automatically
8ee11b6f80ba pwm: lpss: Update PWM setting for Broxton
148228a52c2d pwm: lpss: Remove ->free() callback
e20d95bcd0b3 pwm: lpss: Add support for runtime PM
b2248acf6f8b pwm: lpss: Add more Intel Broxton IDs
85e8566bd241 pwm: lpss: Support all four PWMs on Intel Broxton
1bcdcb6275bf pwm: lpss: Add support for multiple PWMs

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 2b52aa56f2bf..48f9f08957bc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "6b39da48a67a738eca3024c86ff977d5b6ba02dd"
+SRCREV_machine ?= "23325988c373852d75515cfa9582681a036d1bfd"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 3361b1787a44..13c30c70cbf0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2b0cc0f0ca23ec54d66ea697fe929e99f219f9a4"
+SRCREV_machine ?= "afaf425e796c6b72c10e869ea6ad20295033f956"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 72cca01e2a90..2841aa211cc8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6213179ad1ff33d166b57c080db39ec7f0f5caff"
-SRCREV_machine_qemuarm64 ?= "2b0cc0f0ca23ec54d66ea697fe929e99f219f9a4"
-SRCREV_machine_qemumips ?= "31411f4bccac5574a1be7c3e34f9f7ca25306bb1"
-SRCREV_machine_qemuppc ?= "2b0cc0f0ca23ec54d66ea697fe929e99f219f9a4"
-SRCREV_machine_qemux86 ?= "2b0cc0f0ca23ec54d66ea697fe929e99f219f9a4"
-SRCREV_machine_qemux86-64 ?= "2b0cc0f0ca23ec54d66ea697fe929e99f219f9a4"
-SRCREV_machine_qemumips64 ?= "556291afe538f9d31d707661bea5054a9af2add9"
-SRCREV_machine ?= "2b0cc0f0ca23ec54d66ea697fe929e99f219f9a4"
+SRCREV_machine_qemuarm ?= "4f8fe4c56eb352573a19b797d2c4d1b1f4e38831"
+SRCREV_machine_qemuarm64 ?= "afaf425e796c6b72c10e869ea6ad20295033f956"
+SRCREV_machine_qemumips ?= "85f5c8b85364ea8e7f8d47a492c7047bfd9aa963"
+SRCREV_machine_qemuppc ?= "afaf425e796c6b72c10e869ea6ad20295033f956"
+SRCREV_machine_qemux86 ?= "afaf425e796c6b72c10e869ea6ad20295033f956"
+SRCREV_machine_qemux86-64 ?= "afaf425e796c6b72c10e869ea6ad20295033f956"
+SRCREV_machine_qemumips64 ?= "8ac723e2fb023bd3b168d3fb914c09797bc20ed4"
+SRCREV_machine ?= "afaf425e796c6b72c10e869ea6ad20295033f956"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


