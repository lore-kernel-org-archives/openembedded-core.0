Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RTWKP-0005qt-WB
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 11:14:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Nov 2011 02:08:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79496863"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2011 02:08:15 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2011 18:08:13 +0800
Message-Id: <3555652106215dac451ed065dc39e287131e2b42.1322128490.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322128489.git.dexuan.cui@intel.com>
References: <cover.1322128489.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322128489.git.dexuan.cui@intel.com>
References: <cover.1322128489.git.dexuan.cui@intel.com>
Subject: [PATCH 3/4] Self Hosted Image: Added Task and Images
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
X-List-Received-Date: Thu, 24 Nov 2011 10:14:50 -0000

From: Saul Wold <sgw@linux.intel.com>

This is the first pass of creating a self hosted image, this task
and image can pass bitbake's sanity check (if modified to remove the
cvs check) and can build psuedo, albit very slowly on qemu.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |   11 ++
 meta/recipes-core/tasks/task-self-hosted.bb   |  174 +++++++++++++++++++++++++
 2 files changed, 185 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/images/self-hosted-image.bb
 create mode 100644 meta/recipes-core/tasks/task-self-hosted.bb

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
new file mode 100644
index 0000000..7ddba9c
--- /dev/null
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -0,0 +1,11 @@
+IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
+
+POKY_EXTRA_INSTALL = "\
+    task-self-hosted \
+    "
+
+IMAGE_ROOTFS_EXTRA_SPACE = "1048576"
+
+inherit core-image
+
+PR = "r0"
diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
new file mode 100644
index 0000000..c218f43
--- /dev/null
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -0,0 +1,174 @@
+#
+# Copyright (C) 2010 Intel Corporation
+#
+
+DESCRIPTION = "Create Basic Image Tasks"
+PR = "r0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PACKAGES = "\
+    task-self-hosted \
+    task-self-hosted-debug \
+    task-self-hosted-sdk \
+    task-self-hosted-extended \
+    task-self-hosted-graphics \
+    "
+
+ALLOW_EMPTY = "1"
+
+RDEPENDS_task-self-hosted = "\
+    task-self-hosted-debug \
+    task-self-hosted-sdk \
+    task-self-hosted-extended \
+    task-self-hosted-graphics \
+    "
+
+# eglibc-utils: for rpcgen
+RDEPENDS_task-self-hosted-sdk = "\
+    sed \
+    mktemp \
+    eglibc-utils \
+    autoconf \
+    automake \
+    binutils-symlinks \
+    binutils \
+    cpp \
+    cpp-symlinks \
+    ccache \
+    gcc \
+    gcc-symlinks \
+    g++ \
+    g++-symlinks \
+    gettext \
+    make \
+    intltool \
+    libstdc++ \
+    libstdc++-dev \
+    libtool \
+    perl-module-re \
+    perl-module-text-wrap \
+    coreutils \
+    diffutils \
+    pkgconfig \
+    findutils \
+    quilt \
+    less \
+    distcc \
+    ldd \
+    file \
+    tcl \
+    "
+
+RDEPENDS_task-self-hosted-debug = " \
+    gdb \
+    gdbserver \
+    tcf-agent \
+    rsync \
+    strace"
+
+
+RDEPENDS_task-self-hosted-extended = "\
+    binutils \
+    bzip2 \
+    chkconfig \
+    chrpath \
+    curl \
+    dhcp-client \
+    diffstat \
+    diffutils \
+    elfutils \
+    expat \
+    gamin \
+    gdbm \
+    git \
+    gettext \
+    gettext-runtime \
+    grep \
+    groff \
+    gawk \
+    hdparm \
+    libaio \
+    libxml2 \
+    libusb1 \
+    lrzsz \
+    lsof \
+    lzo \
+    man \
+    man-pages \
+    mc \
+    mdadm \
+    minicom \
+    mtools \
+    ncurses \
+    neon \
+    openssl \
+    opkg \
+    opkg-utils \
+    parted \
+    patch \
+    perl \
+    perl-modules \
+    perl-dev \
+    pth \
+    python \
+    python-compile \
+    python-compiler \
+    python-core \
+    python-curses \
+    python-datetime \
+    python-distutils \
+    python-elementtree \
+    python-fcntl \
+    python-logging \
+    python-misc \
+    python-multiprocessing \
+    python-netclient \
+    python-netserver \
+    python-pickle \
+    python-re \
+    python-rpm \
+    python-shell \
+    python-sqlite3 \
+    python-subprocess \
+    python-textutils \
+    python-xmlrpc \
+    python-email \
+    python-unixadmin \
+    python-compression \
+    quota \
+    readline \
+    rpm \
+    screen \
+    setserial \
+    strace \
+    subversion \
+    sysstat \
+    tar \
+    gzip \
+    tcl \
+    texi2html \
+    texinfo \
+    usbutils \
+    unzip \
+    watchdog \
+    wget \
+    which \
+    xinetd \
+    zip \
+    zlib \
+    cpio \
+    "
+
+
+RDEPENDS_task-self-hosted-graphics = "\
+    python-pygtk \
+    mesa-dri \
+    mesa-dri-dev \
+    libglu \
+    libglu-dev \
+    libsdl \
+    libsdl-dev \
+    libx11-dev \
+    "
-- 
1.7.6



