Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.12227.1612886002393736054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: XoGMGU/t1rFndiaCqIXI0jsZuNBSUCHOjuPXA2uVWM4L3c5Yn8BKsjQvTZEDX8TpXVIY3rP+Pi
 Q+Mp8pfmZkfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182045283"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="182045283"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:28 -0800
IronPort-SDR: jYcl4/8c0snMSSxW+ha/nW2lwRdNEtAAFserBgX63dse6dgO8iYQePzf+vKo+55bgD7BFUKWuS
 uTjMVwYNTQyQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215672"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:27 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 35/35] python3targetconfig.bbclass: Make py3 dep and tasks only for target recipes
Date: Tue,  9 Feb 2021 23:52:20 +0800
Message-Id: <8657f6241daf46545164461b6a39ee80fbf710ca.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

python3targetconfig append target python3 to dependencies
unconditionally, and here its inherited unconditionally too but
distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other not-target
recipes as well. Hence the change added via 9c8f666097802cb594a759989edcf01603a22df3
is now bridging the native dependencies with target python3 and thats
resulting all sorts of rebuilds for multimachine builds e.g.

MACHINE=qemuarm bitbake python3-scons-native
MACHINE=qemumips bitbake python3-scons-native

results in rebuilds for python3-scons-native

bitbake-diffsigs shows

Hash for dependent task python/python3-scons-native_3.1.2.bb:do_populate_sysroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153f73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
0e3b97bd058d162065
    Hash for dependent task python/python3-scons-native_3.1.2.bb:do_install changed from 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4fb11aef86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
229cb0f5ebb11
        Hash for dependent task python/python3-scons-native_3.1.2.bb:do_compile changed from e3ee4b52a15267e6ae7853ec19a666b2fb62608a597608793336382d1c45f8a0 to 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
7cc9769194c43eae1
            Hash for dependent task python/python3-scons-native_3.1.2.bb:do_configure changed from 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to a366982778b03eee5165c3117ee778f848acdfaa2
b346650fbdf114ac70ab57b
                Hash for dependent task python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot changed from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to 474333fb565f908992fd3716
4935aaecf31a79e867826fe634cde4f44171d8e7
                    Hash for dependent task python/python3_3.9.0.bb:do_populate_sysroot changed from 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
08777e46a6fa6e417c0445018

...

Therefore limit effects of this class only for target recipes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59cc148de3fd19f5041727f072f087f741c506f6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/python3targetconfig.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/python3targetconfig.bbclass
index 640d0c97b6..fc1025c207 100644
--- a/meta/classes/python3targetconfig.bbclass
+++ b/meta/classes/python3targetconfig.bbclass
@@ -1,15 +1,17 @@
 inherit python3native
 
-DEPENDS_append = " python3"
+EXTRA_PYTHON_DEPENDS ?= ""
+EXTRA_PYTHON_DEPENDS_class-target = "python3"
+DEPENDS_append = " ${EXTRA_PYTHON_DEPENDS}"
 
-do_configure_prepend() {
+do_configure_prepend_class-target() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
 }
 
-do_compile_prepend() {
+do_compile_prepend_class-target() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
 }
 
-do_install_prepend() {
+do_install_prepend_class-target() {
         export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
 }
-- 
2.29.2

