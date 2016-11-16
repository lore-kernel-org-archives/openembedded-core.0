Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD54A6612C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 10:07:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAGA7bmK024697
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 02:07:37 -0800
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 16 Nov 2016 02:07:35 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2016 18:07:33 +0800
Message-ID: <1479290853-11390-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] openssl: Security fix CVE-2016-7055
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
X-List-Received-Date: Wed, 16 Nov 2016 10:07:36 -0000
Content-Type: text/plain

There is a carry propagating bug in the Broadwell-specific Montgomery
multiplication procedure that handles input lengths divisible by, but
longer than 256 bits.

External References:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-7055
https://www.openssl.org/news/secadv/20161110.txt

Patch from:
https://github.com/openssl/openssl/commit/57c4b9f6a2f800b41ce2836986fe33640f6c3f8a

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../openssl/openssl/CVE-2016-7055.patch            | 43 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2j.bb |  1 +
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
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
index 257e3cf..f2aca36 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
@@ -40,6 +40,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://configure-musl-target.patch \
             file://parallel.patch \
             file://openssl-util-perlpath.pl-cwd.patch \
+            file://CVE-2016-7055.patch \
            "
 SRC_URI[md5sum] = "96322138f0b69e61b7212bc53d5e912b"
 SRC_URI[sha256sum] = "e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431"
-- 
2.7.4


