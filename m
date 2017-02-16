Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 34AAC6071F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 01:50:31 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 17:50:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,167,1484035200"; d="scan'208";a="59017066"
Received: from unknown (HELO rebeccas-z640.png.intel.com) ([10.221.118.141])
	by orsmga004.jf.intel.com with ESMTP; 15 Feb 2017 17:50:31 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 09:53:31 +0800
Message-Id: <1487210012-50236-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [jethro][PATCH 1/2] openssl: Security fix CVE-2016-7055
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
X-List-Received-Date: Thu, 16 Feb 2017 01:50:32 -0000

From: Yi Zhao <yi.zhao@windriver.com>

There is a carry propagating bug in the Broadwell-specific Montgomery
multiplication procedure that handles input lengths divisible by, but
longer than 256 bits.

External References:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-7055
https://www.openssl.org/news/secadv/20161110.txt

Patch from:
https://github.com/openssl/openssl/commit/57c4b9f6a2f800b41ce2836986fe33640f6c3f8a

(From OE-Core rev: 07cfa9e2bceb07f3baf40681f8c57f4d3da0aee5)

(From OE-Core rev: 090c2ff292a4d92142c3f33c7517be69d9c16c24)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 .../openssl/openssl/CVE-2016-7055.patch            | 43 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-7055.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-7055.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-7055.patch
new file mode 100644
index 0000000..83a74cd
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-7055.patch
@@ -0,0 +1,43 @@
+From 57c4b9f6a2f800b41ce2836986fe33640f6c3f8a Mon Sep 17 00:00:00 2001
+From: Andy Polyakov <appro@openssl.org>
+Date: Sun, 6 Nov 2016 18:33:17 +0100
+Subject: [PATCH] bn/asm/x86_64-mont.pl: fix for CVE-2016-7055 (Low severity).
+
+Reviewed-by: Rich Salz <rsalz@openssl.org>
+(cherry picked from commit 2fac86d9abeaa643677d1ffd0a139239fdf9406a)
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/57c4b9f6a2f800b41ce2836986fe33640f6c3f8a]
+CVE: CVE-2016-7055
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ crypto/bn/asm/x86_64-mont.pl | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/crypto/bn/asm/x86_64-mont.pl b/crypto/bn/asm/x86_64-mont.pl
+index 044fd7e..80492d8 100755
+--- a/crypto/bn/asm/x86_64-mont.pl
++++ b/crypto/bn/asm/x86_64-mont.pl
+@@ -1148,18 +1148,17 @@ $code.=<<___;
+ 	mulx	2*8($aptr),%r15,%r13	# ...
+ 	adox	-3*8($tptr),%r11
+ 	adcx	%r15,%r12
+-	adox	$zero,%r12
++	adox	-2*8($tptr),%r12
+ 	adcx	$zero,%r13
++	adox	$zero,%r13
+ 
+ 	mov	$bptr,8(%rsp)		# off-load &b[i]
+-	.byte	0x67
+ 	mov	$mi,%r15
+ 	imulq	24(%rsp),$mi		# "t[0]"*n0
+ 	xor	%ebp,%ebp		# xor	$zero,$zero	# cf=0, of=0
+ 
+ 	mulx	3*8($aptr),%rax,%r14
+ 	 mov	$mi,%rdx
+-	adox	-2*8($tptr),%r12
+ 	adcx	%rax,%r13
+ 	adox	-1*8($tptr),%r13
+ 	adcx	$zero,%r14
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
index 26bc6be..fc5e3e3 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
@@ -51,6 +51,7 @@ SRC_URI += "file://configure-targets.patch \
             file://CVE-2016-6306.patch \
             file://CVE-2016-2179.patch \
             file://CVE-2016-8610.patch \
+            file://CVE-2016-7055.patch \
            "
 
 SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
-- 
2.7.4


