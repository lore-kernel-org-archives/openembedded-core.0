Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 170867BE89
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 15:26:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBHFQtOY018644
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Dec 2018 07:26:55 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 07:26:49 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 17 Dec 2018 10:26:48 -0500
Message-ID: <1545060408-8324-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: correct qemumips64el definition
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
X-List-Received-Date: Mon, 17 Dec 2018 15:26:56 -0000
Content-Type: text/plain

The big endian mips definition was used as the basis for the little
endian machine. Unfortunatey, the KMACHINE definitions were not fully
cleared, so big endian builds will match on the 'le' variant .. and
break.

We drop the BE machine definitions from the LE variant and we are fixed.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

This fixes the 4.18 and 4.19 qemumips64 build issue. A self inflicted wound :(

Cheers,

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index ae620f578f6b..bc28e1c021b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "6228ee37a46479d624e608c572d241f74eee11b6"
-SRCREV_meta ?= "cc2fb5bd0e71f4beec5c4ce726da0a87e2d55337"
+SRCREV_meta ?= "8f4a98c93851f7f83d796aae2871df2798b8d917"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index ffdebec73b40..cdcdff2e1746 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "bd456d13d8bea4c416209a59f9e0bf50f8511c47"
-SRCREV_meta ?= "1992fb4dad3012f71d319273d61da22ed9aa0469"
+SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 24a12fc05283..b2ca26498742 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "bd4312baf01b5aca2745245c3856b5143bf0c6ad"
 SRCREV_machine ?= "9eddc793f95f4e7e283996a007e205622c633539"
-SRCREV_meta ?= "cc2fb5bd0e71f4beec5c4ce726da0a87e2d55337"
+SRCREV_meta ?= "8f4a98c93851f7f83d796aae2871df2798b8d917"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 8f6e993d6d4d..89c4b9f14d4c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b8f2e8e00f8ddbdf5d7d7614c14eab52f8ee9275"
 SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
-SRCREV_meta ?= "1992fb4dad3012f71d319273d61da22ed9aa0469"
+SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 94f2c9c47340..96c89723e61f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "9eddc793f95f4e7e283996a007e205622c633539"
 SRCREV_machine_qemux86-64 ?= "9eddc793f95f4e7e283996a007e205622c633539"
 SRCREV_machine_qemumips64 ?= "6641acbf076ba3f7ad96e846581272215a537904"
 SRCREV_machine ?= "9eddc793f95f4e7e283996a007e205622c633539"
-SRCREV_meta ?= "cc2fb5bd0e71f4beec5c4ce726da0a87e2d55337"
+SRCREV_meta ?= "8f4a98c93851f7f83d796aae2871df2798b8d917"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 9b998c75e53a..bf4fec71d86c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
 SRCREV_machine_qemux86-64 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
 SRCREV_machine_qemumips64 ?= "d21ff98864241c971c7a42a3c4f1eb940b9b8855"
 SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
-SRCREV_meta ?= "1992fb4dad3012f71d319273d61da22ed9aa0469"
+SRCREV_meta ?= "ced14887c323f1cb6b3befe2b29e471e8fee1bc6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-- 
2.5.0


