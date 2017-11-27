Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A4C4778087
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 12:07:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 04:07:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,464,1505804400"; d="scan'208";a="12423502"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2017 04:07:06 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 14:06:49 +0200
Message-Id: <85218a5d339141d2394dc5a4136b1191747ab8c6.1511784130.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v8 05/16] openssh: extend to -native
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
X-List-Received-Date: Mon, 27 Nov 2017 12:07:05 -0000

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 ...1-don-t-use-absolute-path-for-ssh-program.patch | 31 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.6p1.bb |  7 ++++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-don-t-use-absolute-path-for-ssh-program.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-don-t-use-absolute-path-for-ssh-program.patch b/meta/recipes-connectivity/openssh/openssh/0001-don-t-use-absolute-path-for-ssh-program.patch
new file mode 100644
index 0000000000..e9a1c35390
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-don-t-use-absolute-path-for-ssh-program.patch
@@ -0,0 +1,31 @@
+From fb78bd8142f48d0909d8839e8bab48abe39d5ab7 Mon Sep 17 00:00:00 2001
+From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+Date: Mon, 20 Nov 2017 12:08:56 +0200
+Subject: [PATCH] don't use absolute path for ssh program
+
+Makes it possible to relocate openssh binaries referencing to the ssh
+binary.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index c52ce19..752f7d0 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -21,7 +21,7 @@ top_srcdir=@top_srcdir@
+ 
+ DESTDIR=
+ VPATH=@srcdir@
+-SSH_PROGRAM=@bindir@/ssh
++SSH_PROGRAM=ssh
+ ASKPASS_PROGRAM=$(libexecdir)/ssh-askpass
+ SFTP_SERVER=$(libexecdir)/sftp-server
+ SSH_KEYSIGN=$(libexecdir)/ssh-keysign
+-- 
+2.13.6
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
index ebb9a5734d..b0b9ba3f01 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
@@ -27,6 +27,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://add-test-support-for-busybox.patch \
            "
 
+SRC_URI_append_class-native = " file://0001-don-t-use-absolute-path-for-ssh-program.patch"
+
 PAM_SRC_URI = "file://sshd"
 
 SRC_URI[md5sum] = "06a88699018e5fef13d4655abfed1f63"
@@ -52,7 +54,7 @@ CFLAGS += "-D__FILE_OFFSET_BITS=64"
 EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
                 --without-zlib-version-check \
-                --with-privsep-path=/var/run/sshd \
+                --with-privsep-path=${localstatedir}/run/sshd \
                 --sysconfdir=${sysconfdir}/ssh \
                 --with-xauth=/usr/bin/xauth \
                 --disable-strip \
@@ -149,6 +151,8 @@ RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
 
+RDEPENDS_${PN}_class-native = ""
+
 RPROVIDES_${PN}-ssh = "ssh"
 RPROVIDES_${PN}-sshd = "sshd"
 
@@ -163,3 +167,4 @@ ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE_${PN}-scp = "scp"
 ALTERNATIVE_${PN}-ssh = "ssh"
 
+BBCLASSEXTEND = "native"
-- 
2.13.6


