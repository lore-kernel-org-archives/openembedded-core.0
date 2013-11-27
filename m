Return-Path: <kergoth@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 20B446D8C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:07:17 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id t61so1462872wes.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+7b0KH44OiSf6tcYpLdSyFC+qVc0j4zhismqaOhrGwg=;
	b=ZZlM5DFFr+H1jaV1NnMzt6WlrEvS7G0foQ3XhdiL5ED5jSWNkbbkPMsueFinQUdbM/
	8IYPjeLb7QvO3q73Abg4j3ply1Iqh6dZ1ueb6LouAY36dUYYpFyTGa6sTZOLvp2htulj
	MYwt75HC5H5y02loKdlER7NC9DVJZkKQVSdXGUk4YD9yMFFahpP2+UZRsrxdc+brWoko
	Ax1FsGPWWiCX65OUJTFvCvCRmMPV1RXLyKXLbUh/6Fql9dofBRU5xka4z4StTJF/tfps
	jMkKHwLMjT5aMaWIfNJJ9rbW5WGv+LdOIF8FJ9mulQ6HRaaxCkEAF+gXNWgQJE7ifWRS
	qJbg==
X-Received: by 10.194.20.202 with SMTP id p10mr13442672wje.39.1385575637390;
	Wed, 27 Nov 2013 10:07:17 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id w1sm37430090wib.6.2013.11.27.10.07.15
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 10:07:16 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 11:07:02 -0700
Message-Id: <02c0b62bd0784357b13c89b00ef7c64bab9f72a5.1385575572.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/7] quota: apply patch to obey tcp-wrappers config
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
X-List-Received-Date: Wed, 27 Nov 2013 18:07:19 -0000

From: Christopher Larson <chris_larson@mentor.com>

Without this, the tcpwrappers argument wasn't obeyed, and as such the build
wasn't as deterministic as we'd prefer.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 .../quota/quota/config-tcpwrappers.patch           | 75 ++++++++++++++++++++++
 meta/recipes-extended/quota/quota_4.01.bb          |  3 +-
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/quota/quota/config-tcpwrappers.patch

diff --git a/meta/recipes-extended/quota/quota/config-tcpwrappers.patch b/meta/recipes-extended/quota/quota/config-tcpwrappers.patch
new file mode 100644
index 0000000..94dc3f5
--- /dev/null
+++ b/meta/recipes-extended/quota/quota/config-tcpwrappers.patch
@@ -0,0 +1,75 @@
+Upstream-status: Pending
+
+--- quota-tools.orig/configure.in
++++ quota-tools/configure.in
+@@ -151,33 +151,46 @@ AC_SUBST(QUOTA_NETLINK_PROG)
+ AC_SUBST(NETLINKLIBS)
+
+ AC_SEARCH_LIBS(gethostbyname, nsl)
+-AC_MSG_CHECKING(for host_access in -lwrap)
+-AC_CACHE_VAL(ac_cv_lib_wrap_main,
+-	saved_LIBS="$LIBS"
+-	LIBS="$LIBS -lwrap"
+-	[AC_LINK_IFELSE([AC_LANG_PROGRAM([[
+-	#include <stdio.h>
+-	#include <sys/types.h>
+-	#include <sys/socket.h>
+-	#include <netinet/in.h>
+-	#include <tcpd.h>
+-	struct request_info request;
+-	int deny_severity, allow_severity;]],[[hosts_access(&request);]])],
+-	dnl We always restore LIBS as we add -lwrap in the next check
+-	[ac_cv_lib_wrap_main=yes; LIBS="$saved_LIBS"; AC_MSG_RESULT(yes)],
+-	[ac_cv_lib_wrap_main=no; LIBS="$saved_LIBS"; AC_MSG_RESULT(no)])
+-	])
+
+-if test ${ac_cv_lib_wrap_main} = yes; then
+-	AC_CHECK_HEADER(tcpd.h,, [
+-		echo 'ERROR: could not find tcpd.h - missing TCP wrappers package'
+-		exit 1
+-	])
+-	LIBS="$LIBS -lwrap"
+-	AC_DEFINE([HOSTS_ACCESS], 1, [Use hosts.allow and hosts.deny for access checking of rpc.rquotad])
+-	COMPILE_OPTS="$COMPILE_OPTS HOSTS_ACCESS"
++AC_ARG_WITH(tcpwrappers,
++	[  --with-tcpwrappers=[yes/no/try]   Use hosts.allow and hosts.deny for access checking of rpc.rquota [default=yes, if available.]],
++	,
++	with_tcpwrappers="try")
++
++if test "x$with_tcpwrappers" != xno; then
++	AC_MSG_CHECKING(for host_access in -lwrap)
++	AC_CACHE_VAL(ac_cv_lib_wrap_main,
++		saved_LIBS="$LIBS"
++		LIBS="$LIBS -lwrap"
++		[AC_LINK_IFELSE([AC_LANG_PROGRAM([[
++		#include <stdio.h>
++		#include <sys/types.h>
++		#include <sys/socket.h>
++		#include <netinet/in.h>
++		#include <tcpd.h>
++		struct request_info request;
++		int deny_severity, allow_severity;]],[[hosts_access(&request);]])],
++		dnl We always restore LIBS as we add -lwrap in the next try
++		[ac_cv_lib_wrap_main=yes; LIBS="$saved_LIBS"; AC_MSG_RESULT(yes)],
++		[ac_cv_lib_wrap_main=no; LIBS="$saved_LIBS"; AC_MSG_RESULT(no)])
++		])
++
++	if test "x$ac_cv_lib_wrap_main" = xyes; then
++		AC_CHECK_HEADER(tcpd.h,, [
++			if test "x$with_tcpwrappers" != xtry; then
++				AC_MSG_ERROR([could not find tcpd.h - missing TCP wrappers package])
++			fi
++		])
++
++		LIBS="$LIBS -lwrap"
++		AC_DEFINE([HOSTS_ACCESS], 1, [Use hosts.allow and hosts.deny for access checking of rpc.rquotad])
++		COMPILE_OPTS="$COMPILE_OPTS HOSTS_ACCESS"
++	elif test "x$with_tcpwrappers" != xtry; then
++		AC_MSG_ERROR([could not find libwrap - missing TCP wrappers package])
++	fi
+ fi
+
++
+ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+ AC_C_INLINE
diff --git a/meta/recipes-extended/quota/quota_4.01.bb b/meta/recipes-extended/quota/quota_4.01.bb
index 9835f06..a5f69b3 100644
--- a/meta/recipes-extended/quota/quota_4.01.bb
+++ b/meta/recipes-extended/quota/quota_4.01.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://quota.c;beginline=1;endline=33;md5=331c7d77744bfe0ad2
                     file://svc_socket.c;beginline=1;endline=17;md5=24d5a8792da45910786eeac750be8ceb"
 PR = "r1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/linuxquota/quota-tools/${PV}/quota-${PV}.tar.gz \
+           file://config-tcpwrappers.patch"
 
 SRC_URI[md5sum] = "5c2c31e321d2e1322ce12d69ae5c66d6"
 SRC_URI[sha256sum] = "a36300bbc126b79b745bf937245092808b4585aa3309ef3335d4ab9d873cd206"
-- 
1.8.3.4


