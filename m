Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4FFA660B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 08:54:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4F8saEX022737
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 01:54:36 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 15 May 2014 01:54:35 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 16:54:32 +0800
Message-ID: <5dc92baf1acffe4ad0e04c60e05704933940bb5d.1400144017.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1400144017.git.Chong.Lu@windriver.com>
References: <cover.1400144017.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] syslinux-native: fix parallel building issue
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
X-List-Received-Date: Thu, 15 May 2014 08:54:38 -0000
Content-Type: text/plain

There might be an error when parallel build:

[snip]
cp: cannot create directory `tmp/sysroots/x86_64-linux/usr/share/
syslinux/com32/include/gplinclude': No such file or directory
make[4]: *** [install] Error 1
make[3]: *** [gpllib] Error 2
[snip]

This is a potential issue. In ${S}/com32/gpllib/Makefile file,
install target wants to copy $(SRC)/../gplinclude to
$(INSTALLROOT)$(COM32DIR)/include/ directory, but in ${S}/com32/lib/Makefile
file, the install target will remove $(INSTALLROOT)$(COM32DIR)/include
directory. We need to do com32/lib first.

The patch make com32/gpllib depends on com32/lib to fix this issue.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../syslinux-fix-parallel-building-issue.patch     | 38 ++++++++++++++++++++++
 meta/recipes-devtools/syslinux/syslinux_6.01.bb    |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/syslinux/files/syslinux-fix-parallel-building-issue.patch

diff --git a/meta/recipes-devtools/syslinux/files/syslinux-fix-parallel-building-issue.patch b/meta/recipes-devtools/syslinux/files/syslinux-fix-parallel-building-issue.patch
new file mode 100644
index 0000000..6b69579
--- /dev/null
+++ b/meta/recipes-devtools/syslinux/files/syslinux-fix-parallel-building-issue.patch
@@ -0,0 +1,38 @@
+syslinux-native: fix parallel building issue
+
+There might be an error when parallel build:
+
+[snip]
+cp: cannot create directory `tmp/sysroots/x86_64-linux/usr/share/
+syslinux/com32/include/gplinclude': No such file or directory
+make[4]: *** [install] Error 1
+make[3]: *** [gpllib] Error 2
+[snip]
+
+This is a potential issue. In ${S}/com32/gpllib/Makefile file,
+install target wants to copy $(SRC)/../gplinclude to
+$(INSTALLROOT)$(COM32DIR)/include/ directory, but in ${S}/com32/lib/Makefile
+file, the install target will remove $(INSTALLROOT)$(COM32DIR)/include
+directory. We need to do com32/lib first.
+
+The patch make com32/gpllib depends on com32/lib to fix this issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ com32/Makefile |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/com32/Makefile b/com32/Makefile
+index 7ea1b01..9a1721b 100644
+--- a/com32/Makefile
++++ b/com32/Makefile
+@@ -20,3 +20,4 @@ modules: lib libutil gpllib
+ rosh: lib libutil
+ samples: libutil elflink/ldlinux
+ sysdump: libupload gpllib
++gpllib: lib
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
index 1af6806..89204b0 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
@@ -12,7 +12,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/6.xx/syslinux-${PV}.tar
            file://0001-movebits-Add-SMT_TERMINAL-a-last-resort-region-type.patch \
            file://0002-memscan-build-a-linked-list-of-memory-scanners.patch \
            file://0003-PXELINUX-Add-bios-memscan-function.patch \
-           file://0004-pxe-use-bios_fbm-and-real_base_mem-to-calculate-free.patch"
+           file://0004-pxe-use-bios_fbm-and-real_base_mem-to-calculate-free.patch \
+           file://syslinux-fix-parallel-building-issue.patch"
 
 SRC_URI[md5sum] = "6945ee89e29119d459baed4937bbc534"
 SRC_URI[sha256sum] = "83a04cf81e6a46b80ee5a321926eea095af3498b04317e3674b46c125c7a5b43"
-- 
1.8.1.2


