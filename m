Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B031A60761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 08:14:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8Q8E1gJ011836
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 01:14:02 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Sep 2016 01:14:01 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2016 15:56:28 +0800
Message-ID: <b6d557af326cd4aa599c1609a192ee9b87de5a1c.1474875470.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1474875470.git.jackie.huang@windriver.com>
References: <cover.1474875470.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2 v2] boost: disable pch when build boost-math
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
X-List-Received-Date: Mon, 26 Sep 2016 08:14:01 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

It's a work around for a defect when build in parallel:
https://svn.boost.org/trac/boost/ticket/12477

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../boost/boost-math-disable-pch-for-gcc.patch     | 31 ++++++++++++++++++++++
 meta/recipes-support/boost/boost_1.61.0.bb         |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch

diff --git a/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
new file mode 100644
index 0000000..595ba17
--- /dev/null
+++ b/meta/recipes-support/boost/boost/boost-math-disable-pch-for-gcc.patch
@@ -0,0 +1,31 @@
+From cabfcba1ff7511ffd6b91ca244288d44f585aad2 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Fri, 23 Sep 2016 01:04:50 -0700
+Subject: [PATCH] boost-math: disable pch for gcc
+
+Upstream-Status: Inappropriate [*]
+
+* It's a work around for a defect when build in parallel:
+https://svn.boost.org/trac/boost/ticket/12477
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ libs/math/build/Jamfile.v2 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libs/math/build/Jamfile.v2 b/libs/math/build/Jamfile.v2
+index e19fb2e..82472a7 100644
+--- a/libs/math/build/Jamfile.v2
++++ b/libs/math/build/Jamfile.v2
+@@ -13,7 +13,7 @@ project
+       #<toolset>intel-linux:<pch>off
+       <toolset>intel-darwin:<pch>off
+       <toolset>msvc-7.1:<pch>off
+-      <toolset>gcc,<target-os>windows:<pch>off
++      <toolset>gcc:<pch>off
+       #<toolset>gcc:<cxxflags>-fvisibility=hidden
+       <toolset>intel-linux:<cxxflags>-fvisibility=hidden
+       #<toolset>sun:<cxxflags>-xldscope=hidden
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/boost/boost_1.61.0.bb b/meta/recipes-support/boost/boost_1.61.0.bb
index 33f209c..40e3870 100644
--- a/meta/recipes-support/boost/boost_1.61.0.bb
+++ b/meta/recipes-support/boost/boost_1.61.0.bb
@@ -9,4 +9,5 @@ SRC_URI += "\
     file://0002-boost-test-execution_monitor.hpp-fix-mips-soft-float.patch \
     file://0003-smart_ptr-mips-assembly-doesn-t-compile-in-mips16e-m.patch \
     file://0004-Use-atomic-by-default-when-BOOST_NO_CXX11_HDR_ATOMIC.patch \
+    file://boost-math-disable-pch-for-gcc.patch \
 "
-- 
2.8.3


