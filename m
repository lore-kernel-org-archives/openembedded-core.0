Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8J-0005pT-0P
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:43 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:26:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419475"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:26:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:49 -0800
Message-Id: <27a640323b8dbff0ddac3ff91c7b1fd123c39927.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/23] Self Hosted Image: Added Task and Images
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:43 -0000

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
1.7.6.4



