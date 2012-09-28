Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THReD-00077A-1j
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 05:53:53 +0200
Received: by pbbro12 with SMTP id ro12so4592282pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 20:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=BtqbpZDJSZhM4pkkOJXGVcuXaWIS66NGdJ3PuonTduo=;
	b=0BtkiDTasY1T3uUgYh8dEoq3LUfUmOrHZ4hwtd+/oLsas3XteuFs0kthrtjnBcTp9P
	cvaYTj1ixMw7twtPT9IBDqWaKkzWrARBIDSFeTWjn3wzlfQ8bJE/WnV4jzzkRxdvGhcv
	XqhywollhF+A3SauuIqLXYShe0vPwdlW6S1W9IG3UB1imTn9rHEbO5olsypiO0BIdH5M
	4qlwE9jphKhPqFzRsDj7XADlawtDRZrp8tf1fqh6DJqwpLjMRmXPV/hSarj6vkgDeFFP
	zLnVzHHpg3ToAJ44gKQlSbjx3/rLln/a7TWV7DIEo91KU53RxQNG9z5G00oo3vUugEDU
	hGKQ==
Received: by 10.68.131.2 with SMTP id oi2mr16862463pbb.78.1348803659859;
	Thu, 27 Sep 2012 20:40:59 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id s10sm4781602paz.11.2012.09.27.20.40.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 20:40:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 20:40:42 -0700
Message-Id: <1348803644-20961-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] boost: Support enums in hash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 03:53:53 -0000

Fixes builds which were building fine with previous versions of boost

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/boost/boost_1.51.0.bb        |    6 ++-
 meta/recipes-support/boost/files/hash_enums.patch |   45 +++++++++++++++++++++
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/boost/files/hash_enums.patch

diff --git a/meta/recipes-support/boost/boost_1.51.0.bb b/meta/recipes-support/boost/boost_1.51.0.bb
index 1564b0e..b95049f 100644
--- a/meta/recipes-support/boost/boost_1.51.0.bb
+++ b/meta/recipes-support/boost/boost_1.51.0.bb
@@ -2,8 +2,10 @@ include boost.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-SRC_URI += "file://arm-intrinsics.patch"
+SRC_URI += "file://arm-intrinsics.patch \
+            file://hash_enums.patch \
+           "
 SRC_URI[md5sum] = "4b6bd483b692fd138aef84ed2c8eb679"
 SRC_URI[sha256sum] = "fb2d2335a29ee7fe040a197292bfce982af84a645c81688a915c84c925b69696"
diff --git a/meta/recipes-support/boost/files/hash_enums.patch b/meta/recipes-support/boost/files/hash_enums.patch
new file mode 100644
index 0000000..368da96
--- /dev/null
+++ b/meta/recipes-support/boost/files/hash_enums.patch
@@ -0,0 +1,45 @@
+Allow hashing of enums.
+Fixes errors like 
+
+/opt/poky/1.3.0-1/sysroots/i586-poky-linux/usr/include/boost/functional/hash/extensions.hpp:257:34: error: no matching function for call to 'hash_value(const myspace::idx&)'
+
+Upstream-Status: Pending
+Singed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: boost_1_51_0/boost/functional/hash/hash.hpp
+===================================================================
+--- boost_1_51_0.orig/boost/functional/hash/hash.hpp	2012-07-15 16:28:30.000000000 -0700
++++ boost_1_51_0/boost/functional/hash/hash.hpp	2012-09-26 14:00:57.738364002 -0700
+@@ -15,6 +15,8 @@
+ #include <boost/functional/hash/detail/hash_float.hpp>
+ #include <string>
+ #include <boost/limits.hpp>
++#include <boost/type_traits/is_enum.hpp>
++#include <boost/utility/enable_if.hpp>
+ 
+ #if defined(BOOST_NO_TEMPLATE_PARTIAL_SPECIALIZATION)
+ #include <boost/type_traits/is_pointer.hpp>
+@@ -89,6 +91,9 @@
+     typename boost::hash_detail::long_numbers<T>::type hash_value(T);
+     template <typename T>
+     typename boost::hash_detail::ulong_numbers<T>::type hash_value(T);
++    template <typename T>
++    typename boost::enable_if<boost::is_enum<T>, std::size_t>::type
++      hash_value(T);
+ 
+ #if !BOOST_WORKAROUND(__DMC__, <= 0x848)
+     template <class T> std::size_t hash_value(T* const&);
+@@ -178,7 +183,12 @@
+     {
+         return hash_detail::hash_value_unsigned(v);
+     }
+-
++    template <typename T>
++    typename boost::enable_if<boost::is_enum<T>, std::size_t>::type
++      hash_value(T v)
++    {
++      return static_cast<std::size_t>(v);
++    }
+     // Implementation by Alberto Barbati and Dave Harris.
+ #if !BOOST_WORKAROUND(__DMC__, <= 0x848)
+     template <class T> std::size_t hash_value(T* const& v)
-- 
1.7.9.5



