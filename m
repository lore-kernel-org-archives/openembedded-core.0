Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6C26011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 03:35:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0C3ZZ8v001564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Jan 2016 19:35:35 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Jan 2016 19:35:34 -0800
To: Armin Kuster <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1452207843-29858-1-git-send-email-akuster808@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56947484.2060908@windriver.com>
Date: Tue, 12 Jan 2016 11:35:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1452207843-29858-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH][V2][Jethro, fido 1/3] openssl: fix for CVE-2015-3193
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
X-List-Received-Date: Tue, 12 Jan 2016 03:35:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Armin,

I got strange errors when use git am:

  git am /tmp/jethro/*openssl*
Applying: openssl: fix for CVE-2015-3193
/buildarea/lyang1/poky/.git/rebase-apply/patch:24: trailing whitespace.
This patch was imported from
/buildarea/lyang1/poky/.git/rebase-apply/patch:41: space before tab in indent.
         add     (%rdx),%r8              # can this overflow?
/buildarea/lyang1/poky/.git/rebase-apply/patch:51: space before tab in indent.
         xor     %rax,%rax
/buildarea/lyang1/poky/.git/rebase-apply/patch:52: trailing whitespace.

/buildarea/lyang1/poky/.git/rebase-apply/patch:53: space before tab in indent.
         neg     $carry
warning: squelched 11 whitespace errors
warning: 16 lines add whitespace errors.
fatal: cannot convert from y to UTF-8

Would please put the patches to a repo ? so that I can fetch them ?

// Robert

On 01/08/2016 07:04 AM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   ...64-mont5.pl-fix-carry-propagating-bug-CVE.patch | 101 +++++++++++++++++++++
>   .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   1 +
>   2 files changed, 102 insertions(+)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
> new file mode 100644
> index 0000000..125016a
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch
> @@ -0,0 +1,101 @@
> +From d73cc256c8e256c32ed959456101b73ba9842f72 Mon Sep 17 00:00:00 2001
> +From: Andy Polyakov <appro@openssl.org>
> +Date: Tue, 1 Dec 2015 09:00:32 +0100
> +Subject: [PATCH] bn/asm/x86_64-mont5.pl: fix carry propagating bug
> + (CVE-2015-3193).
> +
> +Reviewed-by: Richard Levitte <levitte@openssl.org>
> +(cherry picked from commit e7c078db57908cbf16074c68034977565ffaf107)
> +
> +Upstream-Status: Backport
> +
> +This patch was imported from
> +https://git.openssl.org/?p=openssl.git;a=commit;h=d73cc256c8e256c32ed959456101b73ba9842f72
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + crypto/bn/asm/x86_64-mont5.pl | 22 +++++++++++++++++++---
> + crypto/bn/bntest.c            | 18 ++++++++++++++++++
> + 2 files changed, 37 insertions(+), 3 deletions(-)
> +
> +Index: openssl-1.0.2d/crypto/bn/asm/x86_64-mont5.pl
> +===================================================================
> +--- openssl-1.0.2d.orig/crypto/bn/asm/x86_64-mont5.pl
> ++++ openssl-1.0.2d/crypto/bn/asm/x86_64-mont5.pl
> +@@ -1779,6 +1779,15 @@ sqr8x_reduction:
> + .align	32
> + .L8x_tail_done:
> + 	add	(%rdx),%r8		# can this overflow?
> ++	adc	\$0,%r9
> ++	adc	\$0,%r10
> ++	adc	\$0,%r11
> ++	adc	\$0,%r12
> ++	adc	\$0,%r13
> ++	adc	\$0,%r14
> ++	adc	\$0,%r15		# can't overflow, because we
> ++					# started with "overhung" part
> ++					# of multiplication
> + 	xor	%rax,%rax
> +
> + 	neg	$carry
> +@@ -3125,6 +3134,15 @@ sqrx8x_reduction:
> + .align	32
> + .Lsqrx8x_tail_done:
> + 	add	24+8(%rsp),%r8		# can this overflow?
> ++	adc	\$0,%r9
> ++	adc	\$0,%r10
> ++	adc	\$0,%r11
> ++	adc	\$0,%r12
> ++	adc	\$0,%r13
> ++	adc	\$0,%r14
> ++	adc	\$0,%r15		# can't overflow, because we
> ++					# started with "overhung" part
> ++					# of multiplication
> + 	mov	$carry,%rax		# xor	%rax,%rax
> +
> + 	sub	16+8(%rsp),$carry	# mov 16(%rsp),%cf
> +@@ -3168,13 +3186,11 @@ my ($rptr,$nptr)=("%rdx","%rbp");
> + my @ri=map("%r$_",(10..13));
> + my @ni=map("%r$_",(14..15));
> + $code.=<<___;
> +-	xor	%rbx,%rbx
> ++	xor	%ebx,%ebx
> + 	sub	%r15,%rsi		# compare top-most words
> + 	adc	%rbx,%rbx
> + 	mov	%rcx,%r10		# -$num
> +-	.byte	0x67
> + 	or	%rbx,%rax
> +-	.byte	0x67
> + 	mov	%rcx,%r9		# -$num
> + 	xor	\$1,%rax
> + 	sar	\$3+2,%rcx		# cf=0
> +Index: openssl-1.0.2d/crypto/bn/bntest.c
> +===================================================================
> +--- openssl-1.0.2d.orig/crypto/bn/bntest.c
> ++++ openssl-1.0.2d/crypto/bn/bntest.c
> +@@ -1027,6 +1027,24 @@ int test_mod_exp_mont_consttime(BIO *bp,
> +             return 0;
> +         }
> +     }
> ++
> ++    /* Regression test for carry propagation bug in sqr8x_reduction */
> ++    BN_hex2bn(&a, "050505050505");
> ++    BN_hex2bn(&b, "02");
> ++    BN_hex2bn(&c,
> ++        "4141414141414141414141274141414141414141414141414141414141414141"
> ++        "4141414141414141414141414141414141414141414141414141414141414141"
> ++        "4141414141414141414141800000000000000000000000000000000000000000"
> ++        "0000000000000000000000000000000000000000000000000000000000000000"
> ++        "0000000000000000000000000000000000000000000000000000000000000000"
> ++        "0000000000000000000000000000000000000000000000000000000001");
> ++    BN_mod_exp(d, a, b, c, ctx);
> ++    BN_mul(e, a, a, ctx);
> ++    if (BN_cmp(d, e)) {
> ++        fprintf(stderr, "BN_mod_exp and BN_mul produce different results!\n");
> ++        return 0;
> ++    }
> ++
> +     BN_free(a);
> +     BN_free(b);
> +     BN_free(c);
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> index fd56841..79e86d8 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
> @@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
>               file://crypto_use_bigint_in_x86-64_perl.patch \
>               file://openssl-1.0.2a-x32-asm.patch \
>               file://ptest_makefile_deps.patch  \
> +            file://CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch \
>              "
>
>   SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
>

