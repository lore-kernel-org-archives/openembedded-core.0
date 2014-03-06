Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 366C36F4EE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 16:46:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Mar 2014 08:46:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="487311060"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.174])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 08:46:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 16:46:08 +0000
Message-Id: <443ac5f6f00064a7052215a5e59da4eb10140aba.1394124256.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394124256.git.paul.eggleton@linux.intel.com>
References: <cover.1394124256.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394124256.git.paul.eggleton@linux.intel.com>
References: <cover.1394124256.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/5] core-image-basic / packagegroup-core-basic: rename to *-full-cmdline
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
X-List-Received-Date: Thu, 06 Mar 2014 16:46:26 -0000

This more accurately represents what this image and packagegroup are
intended to provide (a more complete command-line environment similar
to what you would find on a traditional Linux system), and avoids
confusion with the similarly named core-image-base and
packagegroup-base.

Fixes [YOCTO #2424].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py                  |   2 +-
 ...e-image-basic.bb => core-image-full-cmdline.bb} |   2 +-
 meta/recipes-extended/images/core-image-lsb.bb     |   2 +-
 .../packagegroups/packagegroup-core-basic.bb       | 138 -----------------
 .../packagegroup-core-full-cmdline.bb              | 163 +++++++++++++++++++++
 .../recipes-graphics/images/core-image-directfb.bb |   2 +-
 6 files changed, 167 insertions(+), 142 deletions(-)
 rename meta/recipes-extended/images/{core-image-basic.bb => core-image-full-cmdline.bb} (87%)
 delete mode 100644 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
 create mode 100644 meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 7ca0802..ee1f82a 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -68,7 +68,7 @@ class BitbakeTests(oeSelfTest):
             self.assertTrue(find_task)
 
     def test_bitbake_g(self):
-        result = bitbake('-g core-image-basic')
+        result = bitbake('-g core-image-full-cmdline')
         self.assertTrue('NOTE: PN build list saved to \'pn-buildlist\'' in result.output)
         self.assertTrue('openssh' in ftools.read_file(os.path.join(self.builddir, 'pn-buildlist')))
         for f in ['pn-buildlist', 'pn-depends.dot', 'package-depends.dot', 'task-depends.dot']:
diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/recipes-extended/images/core-image-full-cmdline.bb
similarity index 87%
rename from meta/recipes-extended/images/core-image-basic.bb
rename to meta/recipes-extended/images/core-image-full-cmdline.bb
index d599e72..4d69073 100644
--- a/meta/recipes-extended/images/core-image-basic.bb
+++ b/meta/recipes-extended/images/core-image-full-cmdline.bb
@@ -5,7 +5,7 @@ IMAGE_FEATURES += "splash ssh-server-openssh"
 
 IMAGE_INSTALL = "\
     packagegroup-core-boot \
-    packagegroup-core-basic \
+    packagegroup-core-full-cmdline \
     ${CORE_IMAGE_EXTRA_INSTALL} \
     "
 
diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipes-extended/images/core-image-lsb.bb
index 1ef7f11..ed316a6 100644
--- a/meta/recipes-extended/images/core-image-lsb.bb
+++ b/meta/recipes-extended/images/core-image-lsb.bb
@@ -5,7 +5,7 @@ IMAGE_FEATURES += "splash ssh-server-openssh hwcodecs package-management"
 
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
-    packagegroup-core-basic \
+    packagegroup-core-full-cmdline \
     packagegroup-core-lsb \
     "
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
deleted file mode 100644
index f3b4ff7..0000000
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ /dev/null
@@ -1,138 +0,0 @@
-#
-# Copyright (C) 2010 Intel Corporation
-#
-
-SUMMARY = "Create Basic Image Tasks"
-PR = "r6"
-LICENSE = "MIT"
-
-inherit packagegroup
-
-PACKAGES = "\
-    packagegroup-core-basic \
-    packagegroup-core-basic-libs \
-    packagegroup-core-basic-utils \
-    packagegroup-core-basic-extended \
-    packagegroup-core-dev-utils \
-    packagegroup-core-multiuser \
-    packagegroup-core-initscripts \
-    packagegroup-core-sys-services \
-    "
-
-python __anonymous () {
-    # For backwards compatibility after rename
-    packages = d.getVar("PACKAGES", True).split()
-    for pkg in packages:
-        d.appendVar("RPROVIDES_%s" % pkg, pkg.replace("packagegroup-core", "task-core"))
-        d.appendVar("RREPLACES_%s" % pkg, pkg.replace("packagegroup-core", "task-core"))
-        d.appendVar("RCONFLICTS_%s" % pkg, pkg.replace("packagegroup-core", "task-core"))
-}
-
-
-RDEPENDS_packagegroup-core-basic = "\
-    packagegroup-core-basic-libs \
-    packagegroup-core-basic-utils \
-    packagegroup-core-basic-extended \
-    packagegroup-core-dev-utils \
-    packagegroup-core-multiuser \
-    packagegroup-core-initscripts \
-    packagegroup-core-sys-services \
-    "
-
-RDEPENDS_packagegroup-core-basic-libs = "\
-    glib-2.0 \
-    "
-
-RDEPENDS_packagegroup-core-basic-utils = "\
-    bash \
-    acl \
-    attr \
-    bc \
-    coreutils \
-    cpio \
-    e2fsprogs \
-    ed \
-    file \
-    findutils \
-    gawk \
-    gmp \
-    grep \
-    makedevs \
-    mc \
-    mc-fish \
-    mc-helpers \
-    mc-helpers-perl \
-    mc-helpers-python \
-    mktemp \
-    ncurses \
-    net-tools \
-    pax \
-    popt \
-    procps \
-    psmisc \
-    sed \
-    tar \
-    time \
-    util-linux \
-    zlib \
-    "
-
-RDEPENDS_packagegroup-core-basic-extended = "\
-    iproute2 \
-    iputils \
-    iptables \
-    module-init-tools \
-    openssl \
-    "
-
-RDEPENDS_packagegroup-core-dev-utils = "\
-    byacc \
-    diffutils \
-    m4 \
-    make \
-    patch \
-    "
-
-VIRTUAL-RUNTIME_initscripts ?= "initscripts"
-VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
-VIRTUAL-RUNTIME_login_manager ?= "busybox"
-VIRTUAL-RUNTIME_syslog ?= "sysklogd"
-RDEPENDS_packagegroup-core-initscripts = "\
-    ${VIRTUAL-RUNTIME_initscripts} \
-    ${VIRTUAL-RUNTIME_init_manager} \
-    ethtool \
-    ${VIRTUAL-RUNTIME_login_manager} \
-    ${VIRTUAL-RUNTIME_syslog} \
-    "
-
-RDEPENDS_packagegroup-core-multiuser = "\
-    cracklib \
-    gzip \
-    ${@base_contains('DISTRO_FEATURES', 'pam', 'libuser', '', d)} \
-    shadow \
-    sudo \
-    "
-
-RDEPENDS_packagegroup-core-sys-services = "\
-    at \
-    bzip2 \
-    cronie \
-    dbus \
-    dbus-glib \
-    python-dbus \
-    elfutils \
-    gzip \
-    less \
-    libcap \
-    libevent \
-    lighttpd \
-    logrotate \
-    nfs-utils \
-    pciutils \
-    libpcre \
-    rpcbind \
-    sysfsutils \
-    tcp-wrappers \
-    tzdata \
-    "
-
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
new file mode 100644
index 0000000..b87213c
--- /dev/null
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -0,0 +1,163 @@
+#
+# Copyright (C) 2010 Intel Corporation
+#
+
+SUMMARY = "Standard full-featured Linux system"
+DESCRIPTION = "Package group bringing in packages needed for a more traditional full-featured Linux system"
+PR = "r6"
+LICENSE = "MIT"
+
+inherit packagegroup
+
+PACKAGES = "\
+    packagegroup-core-full-cmdline \
+    packagegroup-core-full-cmdline-libs \
+    packagegroup-core-full-cmdline-utils \
+    packagegroup-core-full-cmdline-extended \
+    packagegroup-core-full-cmdline-dev-utils \
+    packagegroup-core-full-cmdline-multiuser \
+    packagegroup-core-full-cmdline-initscripts \
+    packagegroup-core-full-cmdline-sys-services \
+    "
+
+python __anonymous () {
+    # For backwards compatibility after rename
+    namemap = {}
+    namemap["packagegroup-core-full-cmdline"] = "packagegroup-core-basic"
+    namemap["packagegroup-core-full-cmdline-libs"] = "packagegroup-core-basic-libs"
+    namemap["packagegroup-core-full-cmdline-utils"] = "packagegroup-core-basic-utils"
+    namemap["packagegroup-core-full-cmdline-extended"] = "packagegroup-core-basic-extended"
+    namemap["packagegroup-core-full-cmdline-dev-utils"] = "packagegroup-core-dev-utils"
+    namemap["packagegroup-core-full-cmdline-multiuser"] = "packagegroup-core-multiuser"
+    namemap["packagegroup-core-full-cmdline-initscripts"] = "packagegroup-core-initscripts"
+    namemap["packagegroup-core-full-cmdline-sys-services"] = "packagegroup-core-sys-services"
+
+    packages = d.getVar("PACKAGES", True).split()
+    for pkg in packages:
+        if pkg.endswith('-dev'):
+            mapped = namemap.get(pkg[:-4], None)
+            if mapped:
+                mapped += '-dev'
+        elif pkg.endswith('-dbg'):
+            mapped = namemap.get(pkg[:-4], None)
+            if mapped:
+                mapped += '-dbg'
+        else:
+            mapped = namemap.get(pkg, None)
+
+        if mapped:
+            oldtaskname = mapped.replace("packagegroup-core", "task-core")
+            mapstr = " %s %s" % (mapped, oldtaskname)
+            d.appendVar("RPROVIDES_%s" % pkg, mapstr)
+            d.appendVar("RREPLACES_%s" % pkg, mapstr)
+            d.appendVar("RCONFLICTS_%s" % pkg, mapstr)
+}
+
+
+RDEPENDS_packagegroup-core-full-cmdline = "\
+    packagegroup-core-full-cmdline-libs \
+    packagegroup-core-full-cmdline-utils \
+    packagegroup-core-full-cmdline-extended \
+    packagegroup-core-full-cmdline-dev-utils \
+    packagegroup-core-full-cmdline-multiuser \
+    packagegroup-core-full-cmdline-initscripts \
+    packagegroup-core-full-cmdline-sys-services \
+    "
+
+RDEPENDS_packagegroup-core-full-cmdline-libs = "\
+    glib-2.0 \
+    "
+
+RDEPENDS_packagegroup-core-full-cmdline-utils = "\
+    bash \
+    acl \
+    attr \
+    bc \
+    coreutils \
+    cpio \
+    e2fsprogs \
+    ed \
+    file \
+    findutils \
+    gawk \
+    gmp \
+    grep \
+    makedevs \
+    mc \
+    mc-fish \
+    mc-helpers \
+    mc-helpers-perl \
+    mc-helpers-python \
+    mktemp \
+    ncurses \
+    net-tools \
+    pax \
+    popt \
+    procps \
+    psmisc \
+    sed \
+    tar \
+    time \
+    util-linux \
+    zlib \
+    "
+
+RDEPENDS_packagegroup-core-full-cmdline-extended = "\
+    iproute2 \
+    iputils \
+    iptables \
+    module-init-tools \
+    openssl \
+    "
+
+RDEPENDS_packagegroup-core-full-cmdline-dev-utils = "\
+    byacc \
+    diffutils \
+    m4 \
+    make \
+    patch \
+    "
+
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
+VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
+VIRTUAL-RUNTIME_login_manager ?= "busybox"
+VIRTUAL-RUNTIME_syslog ?= "sysklogd"
+RDEPENDS_packagegroup-core-full-cmdline-initscripts = "\
+    ${VIRTUAL-RUNTIME_initscripts} \
+    ${VIRTUAL-RUNTIME_init_manager} \
+    ethtool \
+    ${VIRTUAL-RUNTIME_login_manager} \
+    ${VIRTUAL-RUNTIME_syslog} \
+    "
+
+RDEPENDS_packagegroup-core-full-cmdline-multiuser = "\
+    cracklib \
+    gzip \
+    ${@base_contains('DISTRO_FEATURES', 'pam', 'libuser', '', d)} \
+    shadow \
+    sudo \
+    "
+
+RDEPENDS_packagegroup-core-full-cmdline-sys-services = "\
+    at \
+    bzip2 \
+    cronie \
+    dbus \
+    dbus-glib \
+    python-dbus \
+    elfutils \
+    gzip \
+    less \
+    libcap \
+    libevent \
+    lighttpd \
+    logrotate \
+    nfs-utils \
+    pciutils \
+    libpcre \
+    rpcbind \
+    sysfsutils \
+    tcp-wrappers \
+    tzdata \
+    "
+
diff --git a/meta/recipes-graphics/images/core-image-directfb.bb b/meta/recipes-graphics/images/core-image-directfb.bb
index ad0197c..5641195 100644
--- a/meta/recipes-graphics/images/core-image-directfb.bb
+++ b/meta/recipes-graphics/images/core-image-directfb.bb
@@ -12,6 +12,6 @@ CONFLICT_DISTRO_FEATURES = "x11"
 
 IMAGE_INSTALL += "\
 	${CORE_IMAGE_BASE_INSTALL} \
-	packagegroup-core-basic \
+	packagegroup-core-full-cmdline \
 	packagegroup-core-directfb \
 "
-- 
1.8.5.3


