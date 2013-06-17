Return-Path: <Sen.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ACE6A6A91D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 12:31:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5HCVEa9022790
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 05:31:14 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 17 Jun 2013 05:31:14 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 20:33:25 +0800
Message-ID: <a6c520d722246e89ba238033fa49acafd5e7e572.1371472283.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1371472283.git.sen.zhang@windriver.com>
References: <cover.1371472283.git.sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] alsa-lib: Change function type to "static __inline__"
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
X-List-Received-Date: Mon, 17 Jun 2013 12:31:14 -0000
Content-Type: text/plain

"extern __inline__ function()" is the inlined version that
can be used in this compilation unit, but there will be another
definition of this function somewhere, so compiler will not emit
any code for the function body. This causes problem in -O0,
where functions are never inlined, the function call is preserved,
but linker can't find the symbol, thus the error happens.

since no packages provide atomic_add and atomic_sub, and -O0
Optimize is hoped to keep for debug, we can change extern to
static to fix this problem.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 .../fix-O0-Optimize-unable-inline-function.patch   | 61 ++++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb    |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-function.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-function.patch b/meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-function.patch
new file mode 100644
index 0000000..eb33406
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/fix-O0-Optimize-unable-inline-function.patch
@@ -0,0 +1,61 @@
+Change function type from "extern __inline__" to "static __inline__"
+
+"extern __inline__ function()" is the inlined version that
+can be used in this compilation unit, but there will be another
+definition of this function somewhere, so compiler will not emit
+any code for the function body. This causes problem in -O0,
+where functions are never inlined, the function call is preserved,
+but linker can't find the symbol, thus the error happens.
+
+since no packages provide atomic_add and atomic_sub, and -O0
+Optimize is hoped to keep for debug, we can change extern to
+static to fix this problem.
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ include/iatomic.h |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/iatomic.h b/include/iatomic.h
+index e92dbfd..364bc5c 100644
+--- a/include/iatomic.h
++++ b/include/iatomic.h
+@@ -720,7 +720,7 @@ typedef struct { volatile int counter; } atomic_t;
+  * Atomically adds @i to @v.  Note that the guaranteed useful range
+  * of an atomic_t is only 24 bits.
+  */
+-extern __inline__ void atomic_add(int i, atomic_t * v)
++static __inline__ void atomic_add(int i, atomic_t * v)
+ {
+ 	unsigned long temp;
+ 
+@@ -744,7 +744,7 @@ extern __inline__ void atomic_add(int i, atomic_t * v)
+  * Atomically subtracts @i from @v.  Note that the guaranteed
+  * useful range of an atomic_t is only 24 bits.
+  */
+-extern __inline__ void atomic_sub(int i, atomic_t * v)
++static __inline__ void atomic_sub(int i, atomic_t * v)
+ {
+ 	unsigned long temp;
+ 
+@@ -763,7 +763,7 @@ extern __inline__ void atomic_sub(int i, atomic_t * v)
+ /*
+  * Same as above, but return the result value
+  */
+-extern __inline__ int atomic_add_return(int i, atomic_t * v)
++static __inline__ int atomic_add_return(int i, atomic_t * v)
+ {
+ 	unsigned long temp, result;
+ 
+@@ -784,7 +784,7 @@ extern __inline__ int atomic_add_return(int i, atomic_t * v)
+ 	return result;
+ }
+ 
+-extern __inline__ int atomic_sub_return(int i, atomic_t * v)
++static __inline__ int atomic_sub_return(int i, atomic_t * v)
+ {
+ 	unsigned long temp, result;
+ 
+-- 
+1.7.4.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb
index 49f4486..2695e6b 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.26.bb
@@ -19,6 +19,7 @@ PR = "r0"
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://fix-tstamp-declaration.patch \
            file://obsolete_automake_macros.patch \
+           file://fix-O0-Optimize-unable-inline-function.patch \
           "
 SRC_URI[md5sum] = "2dfa35d28471d721e592b616beedf965"
 SRC_URI[sha256sum] = "8c9f8161603cc3db640619650401292c3e110da63429ab6938aac763319f6e7d"
-- 
1.7.11.7


