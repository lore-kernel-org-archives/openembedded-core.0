Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5B10B60777
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 21:27:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u97LRjv6019470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Oct 2016 14:27:45 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 7 Oct 2016 14:27:44 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 7 Oct 2016 17:27:44 -0400
Message-ID: <1475875664-28736-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/4.8: Enable R8169 driver since its needed by supported platforms
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
X-List-Received-Date: Fri, 07 Oct 2016 21:27:45 -0000
Content-Type: text/plain

    The Realtek 8169 driver is needed by the Minnowboard MAX, one of the
    boards we currently support, since some of our images do not contain
    modules by default, the network isnt working on genericx86, genericx86-64
    and intel-core2-32 (meta-intel) when no modules are installed.

    This patch fixes network on images not containing modules when
    using the previously mentioned MACHINES for this board.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index 90e1a4d74758..565d8997fa54 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "b266f7ba78f0cb3d7073e1bf7bd7dfc92bec7431"
-SRCREV_meta ?= "6128a9e47cd1aeb46b604469c17bff3eba8d5f93"
+SRCREV_meta ?= "03bf3dd73190db9c615565d37c02f218382a2283"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 1f026cf41bfe..b669efedd5dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_meta ?= "6128a9e47cd1aeb46b604469c17bff3eba8d5f93"
+SRCREV_meta ?= "03bf3dd73190db9c615565d37c02f218382a2283"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 5e01abc8aa94..bc4941bb22b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
 SRCREV_machine_qemux86-64 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
 SRCREV_machine_qemumips64 ?= "674818dad577cdfc23c6c857aa2b769fc64e379c"
 SRCREV_machine ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
-SRCREV_meta ?= "6128a9e47cd1aeb46b604469c17bff3eba8d5f93"
+SRCREV_meta ?= "03bf3dd73190db9c615565d37c02f218382a2283"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-- 
2.5.0


