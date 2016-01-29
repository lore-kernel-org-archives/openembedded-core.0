Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41C516FF91
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:36:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0THaBua014351
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Jan 2016 09:36:11 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Jan 2016 09:36:11 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 29 Jan 2016 12:35:57 -0500
Message-ID: <89d0983784390cce5fd975199443c874ee1b1295.1454088695.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1454088695.git.hongxu.jia@windriver.com>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] glibc.inc: do not immediate expand SELECTED_OPTIMIZATION
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
X-List-Received-Date: Fri, 29 Jan 2016 17:36:12 -0000
Content-Type: text/plain

We need to expand SELECTED_OPTIMIZATION later, so
do not immediate expansion, and do the work in
anonymous python function.

It is reasonable to give an error for -O0.

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/glibc/glibc.inc | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 17fa2d5..7c4551a 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -9,26 +9,20 @@ PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 
 # glibc can't be built without optimization, if someone tries to compile an
-# entire image as -O0, we override it with -O2 here and give a note about it.
-def get_optimization(d):
-    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
-    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O2", "x", "", d) == "x":
-        return selected_optimization
-    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O", "x", "", d) == "x":
+# entire image as -O0, break with fatal.
+python () {
+    if bb.utils.contains("SELECTED_OPTIMIZATION", "-O", "x", "", d) == "x":
         bb.note("glibc can't be built with -O, -O -Wno-error will be used instead.")
-        return selected_optimization.replace("-O", "-O -Wno-error")
+        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
     elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
-        bb.note("glibc can't be built with -O0, -O2 will be used instead.")
-        return selected_optimization.replace("-O0", "-O2")
+        bb.fatal("glibc can't be built with -O0, using -O1 -Wno-error or -O1 instead.")
     elif bb.utils.contains("SELECTED_OPTIMIZATION", "-Os", "x", "", d) == "x":
         bb.note("glibc can't be built with -Os, -Os -Wno-error will be used instead.")
-        return selected_optimization.replace("-Os", "-Os -Wno-error")
+        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
     elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O1", "x", "", d) == "x":
         bb.note("glibc can't be built with -O1, -O1 -Wno-error will be used instead.")
-        return selected_optimization.replace("-O1", "-O1 -Wno-error")
-    return selected_optimization
-
-SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
+        d.appendVar("SELECTED_OPTIMIZATION", " -Wno-error")
+}
 
 # siteconfig.bbclass runs configure which needs a working compiler
 # For the compiler to work we need a working libc yet libc isn't
-- 
1.9.1


