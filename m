Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4E34172F4E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 13:32:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 20 Apr 2017 06:32:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,225,1488873600"; d="scan'208";a="1138115770"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2017 06:32:26 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 6DCCC6A4080;
	Thu, 20 Apr 2017 06:32:14 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 16:32:19 +0300
Message-Id: <1492695139-21316-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] openssl: Bump SONAME to match the ABI
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
X-List-Received-Date: Thu, 20 Apr 2017 13:32:25 -0000

Commit 7933fbbc637 "Security fix Drown via 1.0.2g update" included
a version-script change from Debian that was an ABI change. It did
not include the soname change that Debian did so we have been calling
our ABI 1.0.0 but it really matches what others call 1.0.2.

Bump SONAME to match the ABI. In practice this changes both libcrypto
and libssl sonames from 1.0.0 to 1.0.2.

For background: Upstream does not do sonames so these are set by
distros. In this case the ABI changes based on a build time
configuration! Debian took the ABI changing configuration and bumped
soname but e.g. Ubuntu kept the deprecated API and just made it not
work, keeping soname. So both have same version of openssl but support
different ABI (and expose different SONAME).

Fixes [YOCTO #11396].

Thanks to Alexander Larsson et al for detective work.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../openssl/openssl/debian1.0.2/soname.patch                | 13 +++++++++++++
 meta/recipes-connectivity/openssl/openssl_1.0.2k.bb         |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch
new file mode 100644
index 0000000..f9cdfec
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/soname.patch
@@ -0,0 +1,13 @@
+Index: openssl-1.0.2d/crypto/opensslv.h
+===================================================================
+--- openssl-1.0.2d.orig/crypto/opensslv.h
++++ openssl-1.0.2d/crypto/opensslv.h
+@@ -88,7 +88,7 @@ extern "C" {
+  * should only keep the versions that are binary compatible with the current.
+  */
+ # define SHLIB_VERSION_HISTORY ""
+-# define SHLIB_VERSION_NUMBER "1.0.0"
++# define SHLIB_VERSION_NUMBER "1.0.2"
+ 
+ 
+ #ifdef  __cplusplus
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
index 1c104142..83d1a50 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
@@ -30,6 +30,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://debian/no-symbolic.patch \
             file://debian/pic.patch \
             file://debian1.0.2/version-script.patch \
+            file://debian1.0.2/soname.patch \
             file://openssl_fix_for_x32.patch \
             file://fix-cipher-des-ede3-cfb1.patch \
             file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
-- 
2.1.4


