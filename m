Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWm2-0001Ov-3F
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:07:39 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 15:00:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720812"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:21 -0800
Message-Id: <2a815ec68240ad45d8beaf6bfb87baa50db87e6a.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 21/26] coreutils: build and install hostname
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
X-List-Received-Date: Tue, 29 Nov 2011 23:07:39 -0000

busybox's hostname doesn't work with pseudo somehow, so let's use the version
of coreutils. This is needed for the self-hosted-image work.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/coreutils/coreutils_8.14.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index 01face0..15ed38a 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r1"
+PR = "r2"
 DEPENDS = "gmp"
 DEPENDS_virtclass-native = ""
 
@@ -19,6 +19,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
 SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
 SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
 
+EXTRA_OECONF += "--enable-install-program=hostname"
+
 EXTRA_OECONF_virtclass-native = "--without-gmp"
 
 # [ gets a special treatment and is not included in this
@@ -29,9 +31,8 @@ bindir_progs = "base64 basename chcon cksum comm csplit cut dir dircolors dirnam
                 sha384sum sha512sum shred shuf sort split stat stdbuf sum tac tail tee test timeout\
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes df"
 
-# hostname gets a special treatment and is not included in this
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
-                     mknod mv pwd rm rmdir sleep stty sync touch true uname"
+                     mknod mv pwd rm rmdir sleep stty sync touch true uname hostname"
 
 sbindir_progs= "chroot"
 
@@ -71,7 +72,6 @@ pkg_prerm_${PN} () {
 	for i in ${sbindir_progs}; do update-alternatives --remove $i $i.${PN}; done
 
 	# The special cases
-	update-alternatives --remove hostname hostname.${PN}
 	update-alternatives --remove uptime uptime.${PN}
 	update-alternatives --remove '[' 'lbracket.${PN}'
 }
-- 
1.7.6.4



