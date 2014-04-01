Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9E86F8CE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 09:10:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s319A26C025849
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Apr 2014 02:10:03 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Tue, 1 Apr 2014 02:10:02 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Apr 2014 17:09:50 +0800
Message-ID: <812f24b1debb5dcfb8e6b2bdd9ef877d256cd3f8.1396343261.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1396343261.git.kai.kang@windriver.com>
References: <cover.1396343261.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/3] xorg: Fix for CVE-2013-6424
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
X-List-Received-Date: Tue, 01 Apr 2014 09:10:02 -0000
Content-Type: text/plain

Integer underflow in the xTrapezoidValid macro in render/picture.h in X.Org
allows context-dependent attackers to cause a denial of service (crash) via
a negative bottom value.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6424

Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xserver-xorg/xorg-CVE-2013-6424.patch          | 31 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.15.0.bb            |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xorg-CVE-2013-6424.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/xorg-CVE-2013-6424.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/xorg-CVE-2013-6424.patch
new file mode 100644
index 0000000..7c61530
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/xorg-CVE-2013-6424.patch
@@ -0,0 +1,31 @@
+This patch comes from:
+http://lists.x.org/archives/xorg-devel/2013-October/037996.html
+
+Upstream-Status: Backport
+
+Signed-off-by: Baogen shang <baogen.shang@windriver.com>
+diff -Naur xorg-server-1.14.0-orig/exa/exa_render.c xorg-server-1.14.0/exa/exa_render.c
+--- xorg-server-1.14.0-orig/exa/exa_render.c	2014-02-27 14:32:38.000000000 +0800
++++ xorg-server-1.14.0/exa/exa_render.c	2014-02-27 15:46:59.000000000 +0800
+@@ -1141,7 +1141,8 @@
+ 
+         exaPrepareAccess(pPicture->pDrawable, EXA_PREPARE_DEST);
+         for (; ntrap; ntrap--, traps++)
+-            (*ps->RasterizeTrapezoid) (pPicture, traps, -bounds.x1, -bounds.y1);
++            if (xTrapezoidValid(traps))
++                (*ps->RasterizeTrapezoid) (pPicture, traps, -bounds.x1, -bounds.y1);
+         exaFinishAccess(pPicture->pDrawable, EXA_PREPARE_DEST);
+ 
+         xRel = bounds.x1 + xSrc - xDst;
+diff -Naur xorg-server-1.14.0-orig/render/picture.h xorg-server-1.14.0/render/picture.h
+--- xorg-server-1.14.0-orig/render/picture.h	2014-02-27 14:32:26.000000000 +0800
++++ xorg-server-1.14.0/render/picture.h	2014-02-27 15:48:13.000000000 +0800
+@@ -211,7 +211,7 @@
+ /* whether 't' is a well defined not obviously empty trapezoid */
+ #define xTrapezoidValid(t)  ((t)->left.p1.y != (t)->left.p2.y && \
+ 			     (t)->right.p1.y != (t)->right.p2.y && \
+-			     (int) ((t)->bottom - (t)->top) > 0)
++			     ((t)->bottom > (t)->top))
+ 
+ /*
+  * Standard NTSC luminance conversions:
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.0.bb
index a4dda4e..1f9fa04 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.0.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.0.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://crosscompile.patch \
             file://fix_open_max_preprocessor_error.patch \
             file://mips64-compiler.patch \
             file://aarch64.patch \
+            file://xorg-CVE-2013-6424.patch \
            "
 
 SRC_URI[md5sum] = "c2ace3697b32414094cf8c597c39d7d9"
-- 
1.8.1.2


