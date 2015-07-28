Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 036BF7634C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:02:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S22LwR024486
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:02:21 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 27 Jul 2015 19:02:05 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 10:00:07 +0800
Message-ID: <1438048807-23716-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] u-boot-mkimage: fix a building failure on OpenSus
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
X-List-Received-Date: Tue, 28 Jul 2015 02:02:22 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...-the-creation-of-include-config-auto.conf.patch | 54 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb  |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/0001-delay-the-creation-of-include-config-auto.conf.patch

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-delay-the-creation-of-include-config-auto.conf.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-delay-the-creation-of-include-config-auto.conf.patch
new file mode 100644
index 0000000..071aa67
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-delay-the-creation-of-include-config-auto.conf.patch
@@ -0,0 +1,54 @@
+[PATCH] delay the creation of include/config/auto.conf
+
+Upstream-Statue: Pending
+
+config.mk will be included only if auto.conf is newer than .config
+but in some system, the HPET is not enabled, the smallest unit of
+time is second, and can not decise which file is newer, even if
+the correct dependency has been created.
+
+The below shows unit of time:
+
+under SUSE Linux Enterprise Desktop 11 SP2  (i586):
+    $ls --full-time include/config/auto.conf .config
+    2015-07-27 03:46:20.000000000 -0400 .config
+    2015-07-27 03:46:20.000000000 -0400 include/config/auto.conf
+    $
+
+under Ubuntu 14.04 LTS:
+    $ ls --full-time include/config/auto.conf .config
+    2015-07-27 13:40:14.008703027 +0800 .config
+    2015-07-27 13:40:15.020703054 +0800 include/config/auto.conf
+    $
+
+The rule of including config.mk in Makefile as below
+    autoconf_is_current := $(if $(wildcard $(KCONFIG_CONFIG)),$(shell find . \
+                    -path ./include/config/auto.conf -newer $(KCONFIG_CONFIG)))
+    ifneq ($(autoconf_is_current),)
+    include $(srctree)/config.mk
+    include $(srctree)/arch/$(ARCH)/Makefile
+    endif
+
+The compilation will be failed if config.mk is not included
+so delay 1 second to create auto.conf after creating of .config
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 36a9a28..5f085ad 100644
+--- a/Makefile
++++ b/Makefile
+@@ -490,6 +490,7 @@ $(KCONFIG_CONFIG) include/config/auto.conf.cmd: ;
+ # if auto.conf.cmd is missing then we are probably in a cleaned tree so
+ # we execute the config step to be sure to catch updated Kconfig files
+ include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
++	sleep 1; \
+ 	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
+ 
+ -include include/autoconf.mk
+-- 
+1.9.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
index 7735288..c0007c9 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
@@ -14,6 +14,7 @@ PV = "v2015.01+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
            file://gcc5.patch \
+           file://0001-delay-the-creation-of-include-config-auto.conf.patch \
 	   "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


