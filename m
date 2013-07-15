Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F2078619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 08:59:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6F8x8fr018441
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 01:59:08 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 15 Jul 2013 01:59:06 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2013 16:59:06 +0800
Message-ID: <1cde2ae50523504cf14974a656e790d2a9daa7b4.1373877005.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1373877005.git.rongqing.li@windriver.com>
References: <cover.1373877005.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dpkg: backport a patch to support mipsn32el and mips64el
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
X-List-Received-Date: Mon, 15 Jul 2013 08:59:06 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 ...-for-mipsn32-el-and-mips64-el-to-arch-tab.patch |   78 ++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.16.10.bb         |    3 +-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/Add-support-for-mipsn32-el-and-mips64-el-to-arch-tab.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/Add-support-for-mipsn32-el-and-mips64-el-to-arch-tab.patch b/meta/recipes-devtools/dpkg/dpkg/Add-support-for-mipsn32-el-and-mips64-el-to-arch-tab.patch
new file mode 100644
index 0000000..c7093aa
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/Add-support-for-mipsn32-el-and-mips64-el-to-arch-tab.patch
@@ -0,0 +1,78 @@
+Upstream-Status: BackPort
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com> 
+
+
+From 597a7348527cbe91e35cf04a2e214a562612a768 Mon Sep 17 00:00:00 2001
+From: YunQiang Su <wzssyqa@gmail.com>
+Date: Sat, 22 Jun 2013 06:14:09 +0200
+Subject: [PATCH] Add support for mipsn32(el) and mips64(el) to arch tables
+
+[guillem@debian.org:
+ - Remove unneeded abi entry.
+ - Fix mips64 endianness. ]
+
+Closes: #685096, #707323
+
+Signed-off-by: Guillem Jover <guillem@debian.org>
+---
+ abitable         |    1 +
+ cputable         |    2 ++
+ ostable          |    2 ++
+ triplettable     |    4 ++++
+ 5 files changed, 11 insertions(+)
+
+diff --git a/abitable b/abitable
+index 578228d..300a1ab 100644
+--- a/abitable
++++ b/abitable
+@@ -7,4 +7,5 @@
+ # Column 2 is the size (in bits) of the ABI integers/pointers.
+ #
+ # <Debian name>	<Bits>
++gnuabin32	32
+ gnux32		32
+diff --git a/cputable b/cputable
+index c556fdd..d48e59c 100644
+--- a/cputable
++++ b/cputable
+@@ -27,6 +27,8 @@ m32r		m32r		m32r			32	big
+ m68k		m68k		m68k			32	big
+ mips		mips		mips(eb)?		32	big
+ mipsel		mipsel		mipsel			32	little
++mips64		mips64		mips64			64	big
++mips64el	mips64el	mips64el		64	little
+ powerpc		powerpc		(powerpc|ppc)		32	big
+ ppc64		powerpc64	(powerpc|ppc)64		64	big
+ s390		s390		s390			32	big
+diff --git a/ostable b/ostable
+index 1383150..29d3843 100644
+--- a/ostable
++++ b/ostable
+@@ -18,6 +18,8 @@ musleabihf-linux	linux-musleabihf	linux[^-]*-musleabihf
+ musl-linux		linux-musl		linux[^-]*-musl
+ gnueabihf-linux		linux-gnueabihf		linux[^-]*-gnueabihf
+ gnueabi-linux		linux-gnueabi		linux[^-]*-gnueabi
++gnuabin32-linux		linux-gnuabin32		linux[^-]*-gnuabin32
++gnuabi64-linux		linux-gnuabi64		linux[^-]*-gnuabi64
+ gnuspe-linux		linux-gnuspe		linux[^-]*-gnuspe
+ gnux32-linux		linux-gnux32		linux[^-]*-gnux32
+ gnulp-linux		linux-gnulp		linux[^-]*-gnulp
+diff --git a/triplettable b/triplettable
+index e0d78a4..a2c683f 100644
+--- a/triplettable
++++ b/triplettable
+@@ -9,6 +9,10 @@ musleabihf-linux-arm	musl-linux-armhf
+ musl-linux-<cpu>	musl-linux-<cpu>
+ gnueabihf-linux-arm	armhf
+ gnueabi-linux-arm	armel
++gnuabin32-linux-mips64el	mipsn32el
++gnuabin32-linux-mips64	mipsn32
++gnuabi64-linux-mips64el	mips64el
++gnuabi64-linux-mips64	mips64
+ gnuspe-linux-powerpc	powerpcspe
+ gnux32-linux-amd64	x32
+ gnulp-linux-i386	lpia
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.16.10.bb b/meta/recipes-devtools/dpkg/dpkg_1.16.10.bb
index 309c17c..5a486ed 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.16.10.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.16.10.bb
@@ -6,7 +6,8 @@ SRC_URI += "file://noman.patch \
             file://check_version.patch \
             file://preinst.patch \
             file://fix-timestamps.patch \
-            file://remove-tar-no-timestamp.patch"
+            file://remove-tar-no-timestamp.patch \
+            file://Add-support-for-mipsn32-el-and-mips64-el-to-arch-tab.patch"
 
 SRC_URI[md5sum] = "a20a06a5272717274a8b009368f237da"
 SRC_URI[sha256sum] = "aeaacf0884039940d9463901102194f9a42eb5702157b9e7a23f43e0d9f65cf2"
-- 
1.7.10.4


