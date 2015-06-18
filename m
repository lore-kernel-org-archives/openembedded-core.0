Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8E216758DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 07:33:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97252737"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jun 2015 15:37:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5I7VvHI013191
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 15:31:57 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 18 Jun 2015 15:33:47 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jun 2015 15:24:46 +0800
Message-ID: <1434612286-52367-3-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434612286-52367-1-git-send-email-biannm@cn.fujitsu.com>
References: <1434612286-52367-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 2/2] libmpc: add libmpc-0.2 which is a GPLv2 version
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
X-List-Received-Date: Thu, 18 Jun 2015 07:33:47 -0000
Content-Type: text/plain

same as other recipe such as bash, we should provide both GPLv3 and !GPLv3 recipe

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../libmpc-0.9/libmpc_fix_for_automake-1.12.patch  | 26 ++++++++++++++++++++++
 meta/recipes-support/libmpc/libmpc_0.9.bb          | 16 +++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/libmpc/libmpc-0.9/libmpc_fix_for_automake-1.12.patch
 create mode 100644 meta/recipes-support/libmpc/libmpc_0.9.bb

diff --git a/meta/recipes-support/libmpc/libmpc-0.9/libmpc_fix_for_automake-1.12.patch b/meta/recipes-support/libmpc/libmpc-0.9/libmpc_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..75fa28e
--- /dev/null
+++ b/meta/recipes-support/libmpc/libmpc-0.9/libmpc_fix_for_automake-1.12.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Pending
+
+this fix avoids this error with automake 1.12
+
+| automake: warnings are treated as errors
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libmpc.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/02
+
+Index: mpc-0.8.2/configure.ac
+===================================================================
+--- mpc-0.8.2.orig/configure.ac
++++ mpc-0.8.2/configure.ac
+@@ -86,6 +86,10 @@ AC_PROG_EGREP
+ AC_PROG_SED
+ AC_LANG(C)
+ 
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
++
+ dnl Check for GMP CFLAGS in gmp.h
+ if test -z "$user_redefine_cc" ; then
+    MPC_GMP_CC_CFLAGS
diff --git a/meta/recipes-support/libmpc/libmpc_0.9.bb b/meta/recipes-support/libmpc/libmpc_0.9.bb
new file mode 100644
index 0000000..7069725
--- /dev/null
+++ b/meta/recipes-support/libmpc/libmpc_0.9.bb
@@ -0,0 +1,16 @@
+require libmpc.inc
+
+DEPENDS = "gmp mpfr"
+LICENSE = "LGPLv2.1"
+
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI = "http://www.multiprecision.org/mpc/download/mpc-${PV}.tar.gz \
+           file://libmpc_fix_for_automake-1.12.patch"
+
+SRC_URI[md5sum] = "0d6acab8d214bd7d1fbbc593e83dd00d"
+SRC_URI[sha256sum] = "fd3efe422f0d454592059e80f2c00d1a2e381bf2beda424c5094abd4deb049ac"
+
+S = "${WORKDIR}/mpc-${PV}"
+BBCLASSEXTEND = "native nativesdk"
+
-- 
1.9.1


