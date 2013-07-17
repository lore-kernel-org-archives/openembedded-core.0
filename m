Return-Path: <Sen.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2EA6B215
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 08:38:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6H8cAj3014422
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 01:38:10 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 17 Jul 2013 01:38:09 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 16:40:46 +0800
Message-ID: <a4862bad0bd4a0e9a1027a6b1955934bb5187d62.1374050133.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1374050133.git.sen.zhang@windriver.com>
References: <cover.1374050133.git.sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] tremor: add a patch to build with arm thumb
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
X-List-Received-Date: Wed, 17 Jul 2013 08:38:09 -0000
Content-Type: text/plain

Add IT instructions so that it builds with thumb tunes. ARM mode won't
be affected since IT is a pseudo-instruction in ARM mode.

Signed-off-by: Sen Zhang <sen.zhang@windriver.com>
---
 .../tremor/tremor-20120314/tremor-arm-thumb2.patch | 104 +++++++++++++++++++++
 meta/recipes-multimedia/tremor/tremor_20120314.bb  |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-thumb2.patch

diff --git a/meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-thumb2.patch b/meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-thumb2.patch
new file mode 100644
index 0000000..2049542
--- /dev/null
+++ b/meta/recipes-multimedia/tremor/tremor-20120314/tremor-arm-thumb2.patch
@@ -0,0 +1,104 @@
+From: Xin Ouyang <Xin.Ouyang@windriver.com>
+Date: Mon, 16 Jul 2012 13:29:34 +0800
+Subject: [PATCH] tremor: add IT instructions for arm thumb2 tune flags.
+
+Upstream-Status: Pending
+
+In Thumb-2, most instructions do not have a built in condition code (except for 
+conditional branches). Instead, short sequences of instructions which are to be 
+executed conditionally can be preceded by a special "IT instruction" which 
+describes the condition and which of the following instructions should be 
+executed if the condition is false respectively. 
+
+For the ARM/Thumb IT(If-Then) instruction:
+http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0489c/Cjabicci.html
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+---
+ asm_arm.h |   14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/asm_arm.h b/asm_arm.h
+index c3bda00..823c54f 100755
+--- a/asm_arm.h
++++ b/asm_arm.h
+@@ -108,9 +108,11 @@ static inline void XNPROD31(ogg_int32_t  a, ogg_int32_t  b,
+ static inline ogg_int32_t CLIP_TO_15(ogg_int32_t x) {
+   int tmp;
+   asm volatile("subs	%1, %0, #32768\n\t"
++	       "itt     pl\n\t"
+ 	       "movpl	%0, #0x7f00\n\t"
+ 	       "orrpl	%0, %0, #0xff\n"
+ 	       "adds	%1, %0, #32768\n\t"
++	       "it      mi\n\t"
+ 	       "movmi	%0, #0x8000"
+ 	       : "+r"(x),"=r"(tmp)
+ 	       :
+@@ -139,10 +141,12 @@ static inline void lsp_loop_asm(ogg_uint32_t *qip,ogg_uint32_t *pip,
+       
+       "ldmdb   r0!,{r1,r3};"
+       "subs    r1,r1,%4;"          //ilsp[j]-wi
++      "it      mi;"
+       "rsbmi   r1,r1,#0;"          //labs(ilsp[j]-wi)
+       "umull   %0,r2,r1,%0;"       //qi*=labs(ilsp[j]-wi)
+       
+       "subs    r1,r3,%4;"          //ilsp[j+1]-wi
++      "it      mi;"
+       "rsbmi   r1,r1,#0;"          //labs(ilsp[j+1]-wi)
+       "umull   %1,r3,r1,%1;"       //pi*=labs(ilsp[j+1]-wi)
+       
+@@ -167,6 +171,7 @@ static inline void lsp_loop_asm(ogg_uint32_t *qip,ogg_uint32_t *pip,
+       "mov     r0,#0x4000;\n"
+       
+       "subs    r1,r1,%4;\n"          //ilsp[j]-wi
++      "it      mi;\n"
+       "rsbmi   r1,r1,#0;\n"          //labs(ilsp[j]-wi)
+       "umull   %0,r2,r1,%0;\n"       //qi*=labs(ilsp[j]-wi)
+       "umull   %1,r3,r0,%1;\n"       //pi*=labs(ilsp[j+1]-wi)
+@@ -190,18 +195,23 @@ static inline void lsp_loop_asm(ogg_uint32_t *qip,ogg_uint32_t *pip,
+       "mov     r2,#0;"
+       "orr     r1,%0,%1;"
+       "tst     r1,#0xff000000;"
++      "itt     ne;"
+       "addne   r2,r2,#8;"
+       "movne   r1,r1,lsr #8;"
+       "tst     r1,#0x00f00000;"
++      "itt     ne;"
+       "addne   r2,r2,#4;"
+       "movne   r1,r1,lsr #4;"
+       "tst     r1,#0x000c0000;"
++      "itt     ne;"
+       "addne   r2,r2,#2;"
+       "movne   r1,r1,lsr #2;"
+       "tst     r1,#0x00020000;"
++      "itt     ne;"
+       "addne   r2,r2,#1;"
+       "movne   r1,r1,lsr #1;"
+       "tst     r1,#0x00010000;"
++      "it      ne;"
+       "addne   r2,r2,#1;"
+       "mov     %0,%0,lsr r2;"
+       "mov     %1,%1,lsr r2;"
+@@ -222,15 +232,19 @@ static inline void lsp_norm_asm(ogg_uint32_t *qip,ogg_int32_t *qexpp){
+   ogg_int32_t qexp=*qexpp;
+ 
+   asm("tst     %0,#0x0000ff00;"
++      "itt     eq;"
+       "moveq   %0,%0,lsl #8;"
+       "subeq   %1,%1,#8;"
+       "tst     %0,#0x0000f000;"
++      "itt     eq;"
+       "moveq   %0,%0,lsl #4;"
+       "subeq   %1,%1,#4;"
+       "tst     %0,#0x0000c000;"
++      "itt     eq;"
+       "moveq   %0,%0,lsl #2;"
+       "subeq   %1,%1,#2;"
+       "tst     %0,#0x00008000;"
++      "itt     eq;"
+       "moveq   %0,%0,lsl #1;"
+       "subeq   %1,%1,#1;"
+       : "+r"(qi),"+r"(qexp)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/tremor/tremor_20120314.bb b/meta/recipes-multimedia/tremor/tremor_20120314.bb
index a11e799..d95fdf1 100644
--- a/meta/recipes-multimedia/tremor/tremor_20120314.bb
+++ b/meta/recipes-multimedia/tremor/tremor_20120314.bb
@@ -10,6 +10,7 @@ PR = "r1"
 
 SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18221;protocol=http \
            file://obsolete_automake_macros.patch;striplevel=0 \
+           file://tremor-arm-thumb2.patch \
 "
 
 S = "${WORKDIR}/Tremor"
-- 
1.7.11.7


