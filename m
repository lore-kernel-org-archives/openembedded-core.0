Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5B82C605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 17:33:05 +0000 (UTC)
Received: by qkht125 with SMTP id t125so48688346qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 09:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=006Lr9xUW9vjKt6yM5fvUl70iNX5tJYxR/+2UMOivXk=;
	b=fExANRwBQJBdBLXg4HiDR78024PcJYrn4T+gqaFdarmUmO6BY31DmmwcsTTAQD/BA8
	ZY3zsYt/mA9wlFtzhvLRwXrqGH5RYhT7QRdx8EkIRdlGX9SoEdutMs1XxpCqmGfQx7Hg
	0sKz0XSbh1UIKFDIqXfa7gX1EREzIZdsYo6yGSv6PiGBArZs/gL99j4wS6EjM0Ick0es
	K9jYi2Ktb73q8gqBWPkLJTZ1RNy4MzlyQlHo2g/xj2rS0Cigaal+sC5XLb0YdH7EezvZ
	gC3iDTo2ttDf4o5u5WP8BBNv8mOUUlNOYmlr6hvpS7t34jGvvXEksN3v19md4TAjTmB5
	CXNg==
X-Received: by 10.55.26.40 with SMTP id a40mr4329798qka.13.1449855186005;
	Fri, 11 Dec 2015 09:33:06 -0800 (PST)
Received: from localhost ([177.194.217.47]) by smtp.gmail.com with ESMTPSA id
	t101sm8607766qge.2.2015.12.11.09.33.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Dec 2015 09:33:03 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 11 Dec 2015 15:32:57 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Dec 2015 15:32:56 -0200
Message-Id: <1449855176-21533-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] lttng-tools: Revert wrong enforcement of Python 3.0 use
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
X-List-Received-Date: Fri, 11 Dec 2015 17:33:08 -0000

The code has support and checks for Python 2 and Python 3 however
during the development of 2.7 release a requirement for Python 3 was
included.

The Python 3 is required for runtime tests to run however those are
not in use now so we can just disable the enforcement for now.

This reverts the commit restoring the Python 2 support.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Rework commit log

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
2.6.4


