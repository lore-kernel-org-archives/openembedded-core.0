Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 17D2A7D3E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 09:23:42 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id e25so15235933itk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 02:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Nc9SQj7ACGN9PGEhSRY7jiY8EH++LyG2jVdblxiUyUo=;
	b=teKUKIdWlSRwZnnN1aP15sR/gUJnS1fj4EprhqBDsv+UB6qUV3aso40LtSlOKAK81G
	Cdq1WhAUKwA8SYhNpOkJGq/wOWvod5dKvZSO3V00RWl8u3vS6BznlduGBxpOJURTy9GZ
	PO/wPbmz416uFL+8PLQPtAdmF+FE0aPUli2bsocRhFIg9D2E0WFC1bGxOilZaGsma+sm
	/UkQY1gilkZzMoK0coz3m0hCVrdG2kkeSwbyzkA+hiiI8kSOzMyftHBOdUtgot6gtieZ
	CSt8G7xpI6RF0dfmKt2FpUPyRZTuEfJXenikRql9r/U5UFFB3CPWJ8TPRO+0849pbjHn
	yiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Nc9SQj7ACGN9PGEhSRY7jiY8EH++LyG2jVdblxiUyUo=;
	b=uW7SFEe8wP63rd+Cofj6LppiWqP8z5Ad7A+j1OITgk9jw1G8CTsUsNyTLIK5tp8kUA
	SECEC31I1EpcCqY4VbXXxfolbPw6ejt5VC1NJmCLc6HhacfYcxVo7V+8tZbkd50g+FEa
	7/wnL85GBVeDYzSLSMp/0KReOSibcWueXiwJhMyWVGpvaeKgz8yalRkG7NyqrrnVumXI
	aWWtoHVAkIq03Nzb2OWPdQFvsllkfeROgRZ9iDuWWhNP+5xcdlNEycyxUREIp1Zx1+vB
	gGW814acyAum5FOWcAPVv8p+HLInidr3DI0gjbTuICLB9OnM+e+s1tI6ffCkNWi32Q46
	zshg==
X-Gm-Message-State: APjAAAUAJQqt4yImmtCXJnQw3KOjPE/DfMFPci69CnaxeSBV+MfwFX8N
	IZ0QfgsRhTL1S9jF7uk/MfK2uyzPhJH4ulpySfO1dg==
X-Google-Smtp-Source: APXvYqxKlp1Pej60kMk5qYlviVMKZUTam0IsA3jynUgFQw+Ldrrdcku4iHJwp/AeTcWGcG4QXKZEDRO4gmlENvk2UxQ=
X-Received: by 2002:a24:c987:: with SMTP id h129mr2928621itg.74.1560417824007; 
	Thu, 13 Jun 2019 02:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <1559434935-11842-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1559434935-11842-1-git-send-email-leimaohui@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Jun 2019 10:23:33 +0100
Message-ID: <CAJTo0LYF08Tad=-RwO_7Bj5a58yeEgmR-XFCsSw2RbsDT=DAkQ@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: Hong Liu <hongl.fnst@cn.fujitsu.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix a build bug on aarch64BE.
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
X-List-Received-Date: Thu, 13 Jun 2019 09:23:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Jun 2019 at 09:48, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
>
> From: Hong Liu <hongl.fnst@cn.fujitsu.com>
>
> Fix bug as following on aarch64BE:
>
> Error: operand 1 must be an integer register -- `rev v31.16b,v31.16b'
>
> Upstream-Status: Pending [https://github.com/openssl/openssl/pull/9151]

This line ^^^

> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  ...01-Fix-build-error-for-aarch64-big-endian.patch | 41 ++++++++++++++++++++++
>  .../recipes-connectivity/openssl/openssl_1.1.1c.bb |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
> new file mode 100644
> index 0000000..65ca02c
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
> @@ -0,0 +1,41 @@
> +From 1f8c0f2feea5cdcae0bcd9dfc78198d9e2c4cf09 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Thu, 13 Jun 2019 12:17:30 +0900
> +Subject: [PATCH] Fix build error for aarch64 big endian.
> +
> +Modified rev to rev64, because rev only takes integer registers.
> +https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90827
> +Otherwise, the following error will occur.
> +
> +Error: operand 1 must be an integer register -- `rev v31.16b,v31.16b'
> +

^^ goes here.

The upstream status is a property of the patch you're adding, not the
commit message.

> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + crypto/sha/asm/keccak1600-armv8.pl | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/crypto/sha/asm/keccak1600-armv8.pl b/crypto/sha/asm/keccak1600-armv8.pl
> +index dc72f18..6620690 100755
> +--- a/crypto/sha/asm/keccak1600-armv8.pl
> ++++ b/crypto/sha/asm/keccak1600-armv8.pl
> +@@ -731,7 +731,7 @@ $code.=<<___;
> +       blo     .Lprocess_block_ce
> +       ldr     d31,[$inp],#8           // *inp++
> + #ifdef        __AARCH64EB__
> +-      rev     v31.16b,v31.16b
> ++      rev64   v31.16b,v31.16b
> + #endif
> +       eor     $A[$j/5][$j%5],$A[$j/5][$j%5],v31.16b
> +       beq     .Lprocess_block_ce
> +@@ -740,7 +740,7 @@ ___
> + $code.=<<___;
> +       ldr     d31,[$inp],#8           // *inp++
> + #ifdef        __AARCH64EB__
> +-      rev     v31.16b,v31.16b
> ++      rev64   v31.16b,v31.16b
> + #endif
> +       eor     $A[4][4],$A[4][4],v31.16b
> +
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> index 669b1a1..ec85ccd 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> @@ -16,6 +16,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://0001-skip-test_symbol_presence.patch \
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
>             file://afalg.patch \
> +           file://0001-Fix-build-error-for-aarch64-big-endian.patch \
>             "
>
>  SRC_URI_append_class-nativesdk = " \
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

