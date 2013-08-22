Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B05EB6B199
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 09:59:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7M9xhCq014629
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 02:59:43 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 22 Aug 2013 02:59:41 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 17:59:29 +0800
Message-ID: <f9869f7b4140c668688499102da1dfa9fa2d91c2.1377165347.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1377165347.git.kai.kang@windriver.com>
References: <cover.1377165347.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 1/1] alsa-lib: fix function definitions error for mips
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
X-List-Received-Date: Thu, 22 Aug 2013 09:59:41 -0000
Content-Type: text/plain

Functions atomic_add(s) and atomic_sub(s) are defined with 'extern
__inline__' that may cause compile fails when cross compile for mips.
The error message looks like:

| pcm/.libs/libpcm.a(pcm_meter.o): In function
`snd_pcm_meter_update_scope':
| .../alsa-lib-1.0.27.2/src/pcm/pcm_meter.c:139: undefined reference to
`atomic_sub'

Replace the 'extern __inline__' with 'static __inline__' to fix this
issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...-iatomic.h-functions-definitions-for-mips.patch | 68 ++++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb  |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/Update-iatomic.h-functions-definitions-for-mips.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/Update-iatomic.h-functions-definitions-for-mips.patch b/meta/recipes-multimedia/alsa/alsa-lib/Update-iatomic.h-functions-definitions-for-mips.patch
new file mode 100644
index 0000000..f1a7947
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/Update-iatomic.h-functions-definitions-for-mips.patch
@@ -0,0 +1,68 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From f21f48a70f8437a671b58fcab75e54222a9eea16 Mon Sep 17 00:00:00 2001
+From: Kai Kang <jiashuo.kang at gmail.com>
+Date: Thu, 15 Aug 2013 17:17:19 +0800
+Subject: [PATCH] Update iatomic.h functions definitions for mips
+
+Functions atomic_add(s) and atomic_sub(s) are defined with 'extern
+__inline__' that may cause compile fails when cross compile for mips.
+The error message looks like:
+
+| pcm/.libs/libpcm.a(pcm_meter.o): In function `snd_pcm_meter_update_scope':
+| .../alsa-lib-1.0.27.2/src/pcm/pcm_meter.c:139: undefined reference to `atomic_sub'
+
+Replace the 'extern __inline__' with 'static __inline__' to fix this
+issue.
+
+Signed-off-by: Kai Kang <jiashuo.kang at gmail.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+---
+ include/iatomic.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/include/iatomic.h b/include/iatomic.h
+index 5711fe8..2393297 100644
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
+1.8.1.2
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
index 5455944..0e1ea76 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
@@ -17,6 +17,7 @@ ARM_INSTRUCTION_SET = "arm"
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://fix-tstamp-declaration.patch \
+           file://Update-iatomic.h-functions-definitions-for-mips.patch \
           "
 SRC_URI[md5sum] = "69129a7c37697f81ac092335e9fa452b"
 SRC_URI[sha256sum] = "690ed393e7efd4fc7e3a2d2cda5449298ca0c895197e5914e350882012430d19"
-- 
1.8.1.2


