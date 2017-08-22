Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00B5378287
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 20:18:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7MKIJqf027329
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 13:18:20 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 13:18:19 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Aug 2017 13:18:19 -0700
Message-ID: <20170822201819.48739-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] ghostscript: fix several CVEs by adding bounds checking
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
X-List-Received-Date: Tue, 22 Aug 2017 20:18:20 -0000
Content-Type: text/plain

CVE-2017-9611
CVE-2017-9612
CVE-2017-9739
CVE-2017-9726

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../ghostscript/ghostscript/CVE-2017-9611.patch    | 34 ++++++++++++++++++++
 .../ghostscript/ghostscript/CVE-2017-9612.patch    | 35 ++++++++++++++++++++
 .../ghostscript/ghostscript/CVE-2017-9726.patch    | 33 +++++++++++++++++++
 .../ghostscript/ghostscript/CVE-2017-9739.patch    | 37 ++++++++++++++++++++++
 .../ghostscript/ghostscript_9.21.bb                |  4 +++
 5 files changed, 143 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9611.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9612.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9726.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9739.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9611.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9611.patch
new file mode 100644
index 0000000..58ef04d
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9611.patch
@@ -0,0 +1,34 @@
+From c7c55972758a93350882c32147801a3485b010fe Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 12 Jun 2017 13:08:40 +0100
+Subject: [PATCH] Bug 698024: bounds check zone pointer in Ins_MIRP()
+
+---
+ base/ttinterp.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- end of original header
+
+CVE: CVE-2017-9611
+
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/base/ttinterp.c b/base/ttinterp.c
+index e56aec6..f6a6d95 100644
+--- a/base/ttinterp.c
++++ b/base/ttinterp.c
+@@ -3858,7 +3858,8 @@ static int nInstrCount=0;
+     /* XXX: UNDOCUMENTED! cvt[-1] = 0 always */
+ 
+     if ( BOUNDS( args[0],   CUR.zp1.n_points ) ||
+-         BOUNDS( args[1]+1, CUR.cvtSize+1 )    )
++         BOUNDS( args[1]+1, CUR.cvtSize+1 )    ||
++         BOUNDS(CUR.GS.rp0,  CUR.zp0.n_points) )
+     {
+       CUR.error = TT_Err_Invalid_Reference;
+       return;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9612.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9612.patch
new file mode 100644
index 0000000..b737cc5
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9612.patch
@@ -0,0 +1,35 @@
+From 98f6da60b9d463c617e631fc254cf6d66f2e8e3c Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 12 Jun 2017 13:15:17 +0100
+Subject: [PATCH] Bug 698026: bounds check zone pointers in Ins_IP()
+
+---
+ base/ttinterp.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+--- end of original header
+
+CVE: CVE-2017-9612
+
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/base/ttinterp.c b/base/ttinterp.c
+index f6a6d95..e7c9d68 100644
+--- a/base/ttinterp.c
++++ b/base/ttinterp.c
+@@ -4129,7 +4129,9 @@ static int nInstrCount=0;
+     Int         point;
+     (void)args;
+ 
+-    if ( CUR.top < CUR.GS.loop )
++    if ( CUR.top < CUR.GS.loop ||
++         BOUNDS(CUR.GS.rp1, CUR.zp0.n_points) ||
++         BOUNDS(CUR.GS.rp2, CUR.zp1.n_points))
+     {
+       CUR.error = TT_Err_Invalid_Reference;
+       return;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9726.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9726.patch
new file mode 100644
index 0000000..3e6c656
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9726.patch
@@ -0,0 +1,33 @@
+From 7755e67116e8973ee0e3b22d653df026a84fa01b Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Thu, 15 Jun 2017 08:58:31 +0100
+Subject: [PATCH] Bug 698055: bounds check zone pointer in Ins_MDRP
+
+---
+ base/ttinterp.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- end of original header
+
+CVE: CVE-2017-9726
+
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+diff --git a/base/ttinterp.c b/base/ttinterp.c
+index e7c9d68..af457e8 100644
+--- a/base/ttinterp.c
++++ b/base/ttinterp.c
+@@ -3770,7 +3770,8 @@ static int nInstrCount=0;
+ 
+     point = (Int)args[0];
+ 
+-    if ( BOUNDS( args[0], CUR.zp1.n_points ) )
++    if ( BOUNDS( args[0], CUR.zp1.n_points ) ||
++         BOUNDS( CUR.GS.rp0, CUR.zp0.n_points) )
+     {
+         /* Current version of FreeType silently ignores this out of bounds error
+          * and drops the instruction, see bug #691121
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9739.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9739.patch
new file mode 100644
index 0000000..69a94df
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9739.patch
@@ -0,0 +1,37 @@
+From c501a58f8d5650c8ba21d447c0d6f07eafcb0f15 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Fri, 16 Jun 2017 08:29:25 +0100
+Subject: [PATCH] Bug 698063: Bounds check Ins_JMPR
+
+---
+ base/ttinterp.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+--- end of original header
+
+CVE: CVE-2017-9739
+
+Upstream-Status: Backport [git://git.ghostscript.com/ghostpdl.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/base/ttinterp.c b/base/ttinterp.c
+index af457e8..adf3f0c 100644
+--- a/base/ttinterp.c
++++ b/base/ttinterp.c
+@@ -1794,6 +1794,12 @@ static int nInstrCount=0;
+ 
+   static void  Ins_JMPR( INS_ARG )
+   {
++    if ( BOUNDS(CUR.IP + args[0], CUR.codeSize ) )
++    {
++      CUR.error = TT_Err_Invalid_Reference;
++      return;
++    }
++
+     CUR.IP      += (Int)(args[0]);
+     CUR.step_ins = FALSE;
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
index adad9fd..93589cc 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
@@ -37,6 +37,10 @@ SRC_URI = "${SRC_URI_BASE} \
            file://CVE-2017-5951.patch \
            file://CVE-2017-7975.patch \
            file://CVE-2017-9216.patch \
+           file://CVE-2017-9611.patch \
+           file://CVE-2017-9612.patch \
+           file://CVE-2017-9739.patch \
+           file://CVE-2017-9726.patch \
            "
 
 SRC_URI_class-native = "${SRC_URI_BASE} \
-- 
2.7.4


