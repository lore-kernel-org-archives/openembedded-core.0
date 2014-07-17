Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD1BB6ACEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:58:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6H7wUpP024566
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 00:58:30 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Thu, 17 Jul 2014 00:58:30 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jul 2014 15:58:19 +0800
Message-ID: <1405583899-13188-3-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1405583899-13188-1-git-send-email-ming.liu@windriver.com>
References: <1405583899-13188-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gettext: fix implicit build result
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
X-List-Received-Date: Thu, 17 Jul 2014 07:58:29 -0000
Content-Type: text/plain

Some "once only" variants are being defined instead of standard autoconf
macros, for instance, AC_CHECK_HEADERS_ONCE like AC_CHECK_HEADERS. The
advantage is that the check for each of the headers will be put only once
into the 'configure' file, therefore it keeps the size down. But there
is also a drawback that the checks then will turn to be statically inserted
to the configure and cannot be conditionalized any more. It will
definitely break the dependencies chosen as internally included.

Turns AC_CHECK_HEADERS_ONCE back to AC_CHECK_HEADERS for those cases.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 .../fix-absolute-header-macro.patch                | 28 ++++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.18.3.2.bb      |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.3.2/fix-absolute-header-macro.patch

diff --git a/meta/recipes-core/gettext/gettext-0.18.3.2/fix-absolute-header-macro.patch b/meta/recipes-core/gettext/gettext-0.18.3.2/fix-absolute-header-macro.patch
new file mode 100644
index 0000000..7b6935f
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.18.3.2/fix-absolute-header-macro.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Some "once only" variants are being defined instead of standard autoconf
+macros, for instance, AC_CHECK_HEADERS_ONCE like AC_CHECK_HEADERS. The
+advantage is that the check for each of the headers will be put only once
+into the 'configure' file, therefore it keeps the size down. But there is
+also a drawback that the checks then will turn to be statically inserted
+to the configure and cannot be conditionalized any more. It will
+definitely break the dependencies chosen as internally included.
+
+Turns AC_CHECK_HEADERS_ONCE back to AC_CHECK_HEADERS for those cases.
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+---
+ absolute-header.m4 |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/gettext-tools/gnulib-m4/absolute-header.m4
++++ b/gettext-tools/gnulib-m4/absolute-header.m4
+@@ -29,7 +29,7 @@ m4_foreach_w([gl_HEADER_NAME], [$1],
+     m4_defn([gl_absolute_header]),
+     [AS_VAR_PUSHDEF([ac_header_exists],
+                     [ac_cv_header_]m4_defn([gl_HEADER_NAME]))dnl
+-    AC_CHECK_HEADERS_ONCE(m4_defn([gl_HEADER_NAME]))dnl
++    AC_CHECK_HEADERS(m4_defn([gl_HEADER_NAME]))dnl
+     if test AS_VAR_GET(ac_header_exists) = yes; then
+       gl_ABSOLUTE_HEADER_ONE(m4_defn([gl_HEADER_NAME]))
+     fi
diff --git a/meta/recipes-core/gettext/gettext_0.18.3.2.bb b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
index 65d4103..9375e86 100644
--- a/meta/recipes-core/gettext/gettext_0.18.3.2.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
@@ -11,7 +11,8 @@ PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_class-native = "virtual/gettext-native"
 RCONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
-	   file://parallel.patch \
+           file://parallel.patch \
+           file://fix-absolute-header-macro.patch \
           "
 
 PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
-- 
1.8.4.1


