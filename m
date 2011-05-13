Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QKxIk-0005L1-4k
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 20:41:26 +0200
Received: by pzk36 with SMTP id 36so1337748pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 11:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=9D64AMN0B8Y3zUsOzuBDF2QLo31AmtkZ5snPTnEGous=;
	b=Zjfr3E72oiQtUEXs7SqcfDTn2Yebru2vTei6NrB6OcuVbRGEkM/pCrl7LvL08/p0mn
	JSpCr3bI1MB191+3sd9jzfu17jdjbnTtPYPZaDHOQR7uUKBg93yqGD2Vafcgh9OGAUhe
	yiJsAxoov6bdbuQJ9gMFqjD0meiDDRoQp+FDw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Z127qwCe9wECGlOtV/7L9WCmAVIcGRIc5HztkftqJAA5tbYQDCN7q5b1sSo57qywm9
	ZXicg9bJNlgkLgLWRPL+DYeTSVvBOrSfZew87J4hFatWO0vRB76pagUzNs5/xaI4X5qw
	9niXfww+djP13g94xe/ENNo9htVpo00Q1chC0=
Received: by 10.68.20.138 with SMTP id n10mr646640pbe.280.1305311915702;
	Fri, 13 May 2011 11:38:35 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 10sm1513306pbo.48.2011.05.13.11.38.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2011 11:38:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 May 2011 11:38:30 -0700
Message-Id: <f11306ee6b1fa022336522a566294cce8d686c63.1305311636.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305311636.git.raj.khem@gmail.com>
References: <cover.1305311636.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] gcc-common.inc: Consider hardfp knob for configuring toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 May 2011 18:41:26 -0000

pass --with-float=hard|soft depending upon ARM_FP_ABI settings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index a3fa234..8b7c3ad 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -8,10 +8,17 @@ NATIVEDEPS = ""
 inherit autotools gettext
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-${PV}"
-
 def get_gcc_fpu_setting(bb, d):
-    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-        return "--with-float=soft"
+    if bb.data.getVar('TARGET_FPU', d, True) in [ 'soft', 'hard'] and bb.data.getVar('TARGET_OS', d, True).find('linux') >= 0 :
+        # ARM_FP_ABI could be either 'hardfp' or 'softfp'
+        arm_fpabi = bb.data.getVar('ARM_FP_ABI', d, True) or ""
+        if arm_fpabi != "":
+            if arm_fpabi  == "hardfp":
+                # reset it to whatever gcc --with-float configure expects which is either 'softfp' or 'hard'
+                arm_fpabi = "hard"
+            return "--with-float=" + arm_fpabi
+        else:
+            return "--with-float=" + bb.data.getVar('TARGET_FPU', d, True)
     return ""
 
 def get_gcc_mips_plt_setting(bb, d):
-- 
1.7.4.1



