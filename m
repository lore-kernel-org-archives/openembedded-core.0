Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BA7566FFED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 06:50:47 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1dBFGp-00052e-PP from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 17 May 2017 23:50:47 -0700
Received: from svr-pkl-eng-07.mgc.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.3.224.2; Thu, 18 May 2017 07:50:46 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 May 2017 11:50:43 +0500
Message-ID: <20170518065043.1662-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.11.1
MIME-Version: 1.0
Subject: [PATCH] autogen-native: allow user to set POSIX_SHELL as desired
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
X-List-Received-Date: Thu, 18 May 2017 06:50:55 -0000
Content-Type: text/plain

Using 'test -x' is only viable in situations where
POSIX_SHELL is directly set to an executable whereas
there are scenarios where a user might want to set
it to "env sh" so that it can be used in places
where there's a problem with shebang lengths etc. This
is exactly how it is being used in OE so build failures
are seen in cases where deep directory hierarchies are
used for the builddir.
We now use 'test -n' just to make sure if POSIX_SHELL
is set by the user or not and then move forward to
other tests in case it is unset.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 .../autogen/autogen-native_5.18.12.bb              |  1 +
 ...pts-allow-user-to-set-POSIX_SHELL-as-desi.patch | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/autogen/autogen/0001-config-libopts-allow-user-to-set-POSIX_SHELL-as-desi.patch

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
index 853477cf7c..37571e3358 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://fix-script-err-when-processing-libguile.patch \
            file://0001-config-libopts.m4-regenerate-it-from-config-libopts..patch \
            file://0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch \
+           file://0001-config-libopts-allow-user-to-set-POSIX_SHELL-as-desi.patch \
 "
 
 SRC_URI[md5sum] = "551d15ccbf5b5fc5658da375d5003389"
diff --git a/meta/recipes-devtools/autogen/autogen/0001-config-libopts-allow-user-to-set-POSIX_SHELL-as-desi.patch b/meta/recipes-devtools/autogen/autogen/0001-config-libopts-allow-user-to-set-POSIX_SHELL-as-desi.patch
new file mode 100644
index 0000000000..bfbf6621e1
--- /dev/null
+++ b/meta/recipes-devtools/autogen/autogen/0001-config-libopts-allow-user-to-set-POSIX_SHELL-as-desi.patch
@@ -0,0 +1,37 @@
+From dfb30e438a051993c69357c5069170ec779e91e4 Mon Sep 17 00:00:00 2001
+From: Awais Belal <awais_belal@mentor.com>
+Date: Wed, 17 May 2017 15:06:48 +0500
+Subject: [PATCH] config/libopts: allow user to set POSIX_SHELL as desired
+
+Using 'test -x' is only viable in situations where
+POSIX_SHELL is directly set to an executable whereas
+there are scenarios where a user might want to set
+it to "env sh" so that it can be used in places
+where there's a problem with shebang lengths etc.
+We now use 'test -n' just to make sure if POSIX_SHELL
+is set by the user or not and then move forward to
+other tests in case it is unset.
+
+Upstream-Status: Pending
+
+Signed-off-by: Awais Belal <awais_belal@mentor.com>
+---
+ config/libopts.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/libopts.m4 b/config/libopts.m4
+index 51e6a39..efabc7f 100644
+--- a/config/libopts.m4
++++ b/config/libopts.m4
+@@ -114,7 +114,7 @@ AC_DEFUN([INVOKE_LIBOPTS_MACROS_FIRST],[
+   AC_PROG_SED
+   [while :
+   do
+-      test -x "$POSIX_SHELL" && break
++      test -n "$POSIX_SHELL" && break
+       POSIX_SHELL=`which bash`
+       test -x "$POSIX_SHELL" && break
+       POSIX_SHELL=`which dash`
+-- 
+2.11.1
+
-- 
2.11.1


