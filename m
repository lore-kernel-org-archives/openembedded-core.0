Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id D25C8621CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 09:30:45 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id uo1so5407305pbc.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 02:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ixEIHdhqQ/+mY0/aMI0fl25kGQY6B8vpSwRQqeFmu34=;
	b=Wx9u1GURSmycW73nbNG8WeEaXz5VoDiVvrEjOI+CRxe4UfcnNWsjcn2HQSjQ2da0Kl
	AgDPT800Lv6s81cm2X28zfn3znmXhS9vBMz97Ry528/McDUIuMdH8tQTpF/3U+eK5hWh
	O+6kvouB73FDAJYXO/ST89iC608qBOaTrKh2yZwc6MKnmR9s7Zi/Z6GBMGkaS1xsBJji
	m4s6giPf1k2sKbQh7Nf/uiNwxklYLH8IHYX9/IfUCfsrOazQq+nw3Nf1QSTR1wRSSGOq
	i+j+cKcOmm2Ara/ljJefVELBQK3PZyfDxmWggoAuB3GZCVxRGvFBgVhO7Ewyn/S4Z4BH
	zkvA==
X-Received: by 10.68.90.131 with SMTP id bw3mr33726pbb.59.1371115846866;
	Thu, 13 Jun 2013 02:30:46 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id v20sm28598177paj.4.2013.06.13.02.30.45
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Jun 2013 02:30:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 02:28:28 -0700
Message-Id: <1371115708-24908-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] python: -Wformat is needed by gcc 4.8
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
X-List-Received-Date: Thu, 13 Jun 2013 09:30:45 -0000

This fixes errors in packages using python( build with gcc 4.8)

|
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/python2.7/modsupport.h:27:1:
error: 'PyArg_ParseTuple' is an unrecognized format function type
[-Werror=format=]
|  PyAPI_FUNC(int) PyArg_ParseTuple(PyObject *, const char *, ...)
Py_FORMAT_PARSETUPLE(PyArg_ParseTuple, 2, 3);
|  ^
| cc1: all warnings being treated as errors
| cc1: all warnings being treated as errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/gcc-4.8-fix-configure-Wformat.patch     |   20 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |    1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/gcc-4.8-fix-configure-Wformat.patch

diff --git a/meta/recipes-devtools/python/python/gcc-4.8-fix-configure-Wformat.patch b/meta/recipes-devtools/python/python/gcc-4.8-fix-configure-Wformat.patch
new file mode 100644
index 0000000..b5d9d5d
--- /dev/null
+++ b/meta/recipes-devtools/python/python/gcc-4.8-fix-configure-Wformat.patch
@@ -0,0 +1,20 @@
+backport bug 17547 from http://hg.python.org/cpython/rev/9d50af4c482f/
+
+-Wformat is needed by gcc 4.8
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Backport
+Index: Python-2.7.3/configure.in
+===================================================================
+--- Python-2.7.3.orig/configure.in	2013-06-11 02:22:04.186529212 -0700
++++ Python-2.7.3/configure.in	2013-06-13 02:17:06.324403327 -0700
+@@ -1196,7 +1196,7 @@
+ then
+   AC_MSG_CHECKING(whether gcc supports ParseTuple __format__)
+   save_CFLAGS=$CFLAGS
+-  CFLAGS="$CFLAGS -Werror"
++  CFLAGS="$CFLAGS -Werror -Wformat"
+   AC_COMPILE_IFELSE([
+     AC_LANG_PROGRAM([[void f(char*,...)__attribute((format(PyArg_ParseTuple, 1, 2)));]], [[]])
+   ],[
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 41862ab..b55d5df 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -27,6 +27,7 @@ SRC_URI += "\
   file://python-2.7.3-remove-bsdb-rpath.patch \
   file://builddir.patch \
   file://python-2.7.3-CVE-2012-2135.patch \
+  file://gcc-4.8-fix-configure-Wformat.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.9.5


