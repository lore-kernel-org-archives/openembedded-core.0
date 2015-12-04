Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4BADE612E5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 16:24:02 +0000 (UTC)
Received: by qkfo3 with SMTP id o3so45627274qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Dec 2015 08:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=zySvMfMZBQRaul00uCzBAq1/ndPpFDKkqkr0KLOvXJg=;
	b=A0awfEl+kYQx7IlQ+Ndg8zhAzT8w9IKhByh6GT8j38vHhEJTseH2QrcDrOVo2lR5jo
	lCLNAe2anWYsYJgObN9AIPy3Qla7aAS9Dl4sB5fruFXU7bOy0kbPJ5rATbk5kWrv1lz8
	PEn1PMgukCrCqoc+yQPLFhXzqeEdzqEwECVq+UT/ZG0wEIz4hNB/xf1SqmiVChPeT4gZ
	rZytJ+bAD6gVQAD2Pc5fSyYmjvqqnEQxfnU/ETZn75RMuqd/4PETLDED6Fj+xkLetT+3
	DaJzz2Zl4cnoPXioRe5Kqpk8/0WNPEg2DiNRnKoJCPeqZCPMF5R7f1YwuCkLgL8wvIpx
	I8SQ==
X-Received: by 10.55.76.213 with SMTP id z204mr19131513qka.58.1449246242952;
	Fri, 04 Dec 2015 08:24:02 -0800 (PST)
Received: from localhost ([177.194.217.47]) by smtp.gmail.com with ESMTPSA id
	w10sm5722289qhc.16.2015.12.04.08.23.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Dec 2015 08:24:01 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 04 Dec 2015 14:23:56 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  4 Dec 2015 14:23:55 -0200
Message-Id: <1449246235-14680-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] lttng-tools: Revert wrong enforcement of Python 3.0 use
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
X-List-Received-Date: Fri, 04 Dec 2015 16:24:03 -0000

The code has support and checks for Python 2 and Python 3 however
during the development of 2.7 release a requirement for Python 3 was
include, without a reason.

This reverts the commit restoring the Python 2 support.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...d-look-for-python-3.0-when-building-pytho.patch | 30 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/Revert-Build-look-for-python-3.0-when-building-pytho.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/Revert-Build-look-for-python-3.0-when-building-pytho.patch b/meta/recipes-kernel/lttng/lttng-tools/Revert-Build-look-for-python-3.0-when-building-pytho.patch
new file mode 100644
index 0000000..d05c04c
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/Revert-Build-look-for-python-3.0-when-building-pytho.patch
@@ -0,0 +1,30 @@
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Fri, 4 Dec 2015 16:11:41 +0000
+Subject: [PATCH] Revert "Build: look for python >= 3.0 when building python bindings"
+Organization: O.S. Systems Software LTDA.
+
+This reverts commit 227703a2ceada3c104edd56756d48455ca4c271a.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4dee4b4..6608bcd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -339,7 +339,7 @@ AM_CONDITIONAL([PYTHON_BINDING], [test "x${enable_python_binding:-yes}" = xyes])
+ 
+ if test "x${enable_python_binding:-yes}" = xyes; then
+   AX_PKG_SWIG($swig_version, [], [ AC_MSG_ERROR([SWIG $swig_version or newer is needed]) ])
+-  AM_PATH_PYTHON([3.0])
++  AM_PATH_PYTHON
+ 
+   AC_ARG_VAR([PYTHON_INCLUDE], [Include flags for python, bypassing python-config])
+   AC_ARG_VAR([PYTHON_CONFIG], [Path to python-config])
+-- 
+2.1.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index b124b95..82a0840 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -26,6 +26,7 @@ PACKAGECONFIG[lttng-ust] = "--enable-lttng-ust, --disable-lttng-ust, lttng-ust"
 PACKAGECONFIG[kmod] = "--enable-kmod, --disable-kmod, kmod"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.7 \
+           file://Revert-Build-look-for-python-3.0-when-building-pytho.patch \
            file://stop-using-SIGUNUSED.patch \
            file://runtest-2.4.0.patch \
            file://run-ptest"
-- 
2.6.2


