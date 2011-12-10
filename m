Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZV6T-0004rX-VM
	for openembedded-core@openembedded.org; Sat, 10 Dec 2011 23:09:10 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Dec 2011 14:02:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100849592"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2011 14:02:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Sat, 10 Dec 2011 14:01:59 -0800
Message-Id: <71f6cb63e711721a1a03cfc1c0f1d054472241fe.1323554268.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323554268.git.sgw@linux.intel.com>
References: <cover.1323554268.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323554268.git.sgw@linux.intel.com>
References: <cover.1323554268.git.sgw@linux.intel.com>
Subject: [PATCH 3/5] self-hosted: Add ext2 utilites and perl-pod for building
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Dec 2011 22:09:11 -0000

Add self-hosted-host-tools for non-build related tools

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/tasks/task-self-hosted.bb |   54 +++++++++++++++-----------
 1 files changed, 31 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index b3a68b4..b9bdd21 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Basic Image Tasks"
-PR = "r1"
+PR = "r2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -14,6 +14,7 @@ PACKAGES = "\
     task-self-hosted-sdk \
     task-self-hosted-extended \
     task-self-hosted-graphics \
+    task-self-hosted-host-tools \
     "
 
 ALLOW_EMPTY = "1"
@@ -23,13 +24,26 @@ RDEPENDS_task-self-hosted = "\
     task-self-hosted-sdk \
     task-self-hosted-extended \
     task-self-hosted-graphics \
+    task-self-hosted-host-tools \
+    "
+
+RDEPENDS_task-self-hosted-host-tools = "\
+    e2fsprogs \
+    dhcp-client \
+    genext2fs \
+    hdparm \
+    iptables \
+    kernel-module-tun \
+    kernel-module-iptable-raw \
+    kernel-module-iptable-nat \
+    kernel-module-iptable-mangle \
+    kernel-module-iptable-filter \
+    mc \
+    screen \
     "
 
 # eglibc-utils: for rpcgen
 RDEPENDS_task-self-hosted-sdk = "\
-    sed \
-    mktemp \
-    eglibc-utils \
     autoconf \
     automake \
     binutils-symlinks \
@@ -37,27 +51,30 @@ RDEPENDS_task-self-hosted-sdk = "\
     cpp \
     cpp-symlinks \
     ccache \
+    coreutils \
+    diffutils \
+    distcc \
+    eglibc-utils \
+    file \
+    findutils \
     gcc \
     gcc-symlinks \
     g++ \
     g++-symlinks \
     gettext \
-    make \
     intltool \
+    ldd \
+    less \
     libstdc++ \
     libstdc++-dev \
     libtool \
+    make \
+    mktemp \
     perl-module-re \
     perl-module-text-wrap \
-    coreutils \
-    diffutils \
     pkgconfig \
-    findutils \
     quilt \
-    less \
-    distcc \
-    ldd \
-    file \
+    sed \
     tcl \
     "
 
@@ -74,8 +91,8 @@ RDEPENDS_task-self-hosted-extended = "\
     bzip2 \
     chkconfig \
     chrpath \
+    cpio \
     curl \
-    dhcp-client \
     diffstat \
     diffutils \
     elfutils \
@@ -88,7 +105,6 @@ RDEPENDS_task-self-hosted-extended = "\
     grep \
     groff \
     gawk \
-    hdparm \
     libaio \
     libxml2 \
     libusb1 \
@@ -97,7 +113,6 @@ RDEPENDS_task-self-hosted-extended = "\
     lzo \
     man \
     man-pages \
-    mc \
     mdadm \
     minicom \
     mtools \
@@ -111,6 +126,7 @@ RDEPENDS_task-self-hosted-extended = "\
     perl \
     perl-modules \
     perl-dev \
+    perl-pod \
     pth \
     python \
     python-compile \
@@ -140,7 +156,6 @@ RDEPENDS_task-self-hosted-extended = "\
     quota \
     readline \
     rpm \
-    screen \
     setserial \
     subversion \
     sudo \
@@ -158,13 +173,6 @@ RDEPENDS_task-self-hosted-extended = "\
     xinetd \
     zip \
     zlib \
-    cpio \
-    iptables \
-    kernel-module-tun \
-    kernel-module-iptable-raw \
-    kernel-module-iptable-nat \
-    kernel-module-iptable-mangle \
-    kernel-module-iptable-filter \
     "
 
 
-- 
1.7.6.4



