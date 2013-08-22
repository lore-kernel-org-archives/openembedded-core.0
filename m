Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4A4B260842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9fW001261; Thu, 22 Aug 2013 12:42:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F5boEEZafgLP; Thu, 22 Aug 2013 12:42:10 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg6SP001214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:07 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5a-0001hb-5q; Thu, 22 Aug 2013 12:30:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:36 +0100
Message-Id: <1377171000-6469-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/28] gettext: Improve USE_NLS handling for nativesdk/crosssdk/cross-canadian
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:52 -0000

The gettext handling of USE_NLS has become a bit tricky to understand, or
alter from the SDK context. This patch introduces a SDKUSE_NLS which can
be set to configure a given SDK/ADT to use NLS or not. This is independent
of the target system NLS usage.

The code in gettext.bbclass is therefore simplified and the classes
themselves now set USE_NLS to appropriate values. No NLS is used
for native, cross and crosssdk since it is never used there and
would just increase build time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cross-canadian.bbclass | 2 ++
 meta/classes/cross.bbclass          | 2 ++
 meta/classes/crosssdk.bbclass       | 2 ++
 meta/classes/gettext.bbclass        | 8 +++-----
 meta/classes/native.bbclass         | 2 ++
 meta/classes/nativesdk.bbclass      | 2 ++
 meta/conf/bitbake.conf              | 1 +
 7 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 7ab36ac..fa2ab70 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -94,3 +94,5 @@ SHLIBSDIRS = "${TMPDIR}/pkgdata/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}/
 SHLIBSDIR = "${TMPDIR}/pkgdata/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}/shlibs/"
 
 do_populate_sysroot[stamp-extra-info] = ""
+
+USE_NLS = "${SDKUSE_NLS}"
diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 54584fe..f6e7dc1 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -75,3 +75,5 @@ cross_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 }
+
+USE_NLS = "no"
diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 810f61d..635c0c4 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -30,3 +30,5 @@ do_populate_sysroot[stamp-extra-info] = ""
 
 # Need to force this to ensure consitency accross architectures
 EXTRA_OECONF_FPU = ""
+
+USE_NLS = "no"
diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index 17c894f..03b89b2 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -1,17 +1,15 @@
 def gettext_dependencies(d):
-    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d, 'native', 'nativesdk', 'cross'):
-        return ""
     if d.getVar('INHIBIT_DEFAULT_DEPS', True) and not oe.utils.inherits(d, 'cross-canadian'):
         return ""
-    if oe.utils.inherits(d, 'native', 'cross'):
+    if d.getVar('USE_NLS', True) == 'no':
         return "gettext-minimal-native"
     return d.getVar('DEPENDS_GETTEXT', False)
 
 def gettext_oeconf(d):
-    if oe.utils.inherits(d, 'native', 'cross'):
+    if d.getVar('USE_NLS', True) == 'no':
         return '--disable-nls'
     # Remove the NLS bits if USE_NLS is no or INHIBIT_DEFAULT_DEPS is set
-    if (d.getVar('USE_NLS', True) == 'no' or d.getVar('INHIBIT_DEFAULT_DEPS', True)) and not oe.utils.inherits(d, 'nativesdk', 'cross-canadian'):
+    if d.getVar('INHIBIT_DEFAULT_DEPS', True) and not oe.utils.inherits(d, 'cross-canadian'):
         return '--disable-nls'
     return "--enable-nls"
 
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 04f0d06..102dfb8 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -158,3 +158,5 @@ do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 
 do_populate_sysroot[stamp-extra-info] = ""
+
+USE_NLS = "no"
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index 96e1b42..5b9d1f5 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -89,3 +89,5 @@ addhandler nativesdk_virtclass_handler
 nativesdk_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 
 do_populate_sysroot[stamp-extra-info] = ""
+
+USE_NLS = "${SDKUSE_NLS}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 07eb473..8ae3ad2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -110,6 +110,7 @@ TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
 LIBCEXTENSION ??= ""
 ABIEXTENSION ??= ""
 USE_NLS ??= "yes"
+SDKUSE_NLS ??= "yes"
 
 TARGET_ARCH = "${TUNE_ARCH}"
 TARGET_OS = "linux${LIBCEXTENSION}${ABIEXTENSION}"
-- 
1.8.1.2


