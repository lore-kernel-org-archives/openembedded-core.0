Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 481BD78598
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 13:52:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2TDqxZh014904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Mar 2018 06:52:59 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 29 Mar 2018 06:52:58 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>
Date: Thu, 29 Mar 2018 09:52:57 -0400
Message-ID: <1522331577-8895-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.14: add elfutils, util-linux and openssl dependencies
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
X-List-Received-Date: Thu, 29 Mar 2018 13:52:59 -0000
Content-Type: text/plain

4.15+ already has the following dependencies:

 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"

Updates to 4.14 via the -stable releases have also introduced the same
dependencies to 4.14's "make scripts". As such, we bring the same lines
into 4.14 to restore the ability to build scripts.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---

Ross/RP,

This allowed me to 'make scripts' on the target, but I didn't see
the original error on my builders. I also did build with the 'old'
kernel-devsrc to rule out that my new devsrc was bringing in RDEPENDS
that allowed things to work in my tests .. and I was still able to
pass the test.

Cheers,

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   | 3 +++
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb | 3 +++
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index dfbde660b053..85f85428514e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -19,6 +19,9 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=mac
 
 LINUX_VERSION ?= "4.14.30"
 
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index e5941a7ea043..942579795f39 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc
 
 LINUX_VERSION ?= "4.14.30"
 
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index ff5472561345..bfc4de02f239 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -26,6 +26,9 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 
 LINUX_VERSION ?= "4.14.30"
 
+DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
+DEPENDS += "openssl-native util-linux-native"
+
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-- 
2.5.0


