Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 106A57E653
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 05:04:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5H54a5H001058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Jun 2019 22:04:36 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 16 Jun 2019 22:04:35 -0700
To: Lei Maohui <leimaohui@cn.fujitsu.com>,
	<openembedded-core@lists.openembedded.org>
References: <1559771208-32780-1-git-send-email-leimaohui@cn.fujitsu.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <ae10a4bc-7415-d9af-280b-9e64703ba7fa@windriver.com>
Date: Mon, 17 Jun 2019 13:16:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1559771208-32780-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCH v2] openssl: Fix a build bug on aarch64BE.
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
X-List-Received-Date: Mon, 17 Jun 2019 05:04:39 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2019 05:46 AM, Lei Maohui wrote:
> Fix bug as following on aarch64BE:
>
> Error: operand 1 must be an integer register -- `rev v31.16b,v31.16b'
>
> https://github.com/openssl/openssl/pull/9151
>
> Upstream-Status: Submitted
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>   ...01-Fix-build-error-for-aarch64-big-endian.patch | 41 ++++++++++++++++++++++
>   .../recipes-connectivity/openssl/openssl_1.1.1c.bb |  1 +
>   2 files changed, 42 insertions(+)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
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

Put Upstream-Status here.

Best Regards,
Chen Qi

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
> + 	blo	.Lprocess_block_ce
> + 	ldr	d31,[$inp],#8		// *inp++
> + #ifdef	__AARCH64EB__
> +-	rev	v31.16b,v31.16b
> ++	rev64	v31.16b,v31.16b
> + #endif
> + 	eor	$A[$j/5][$j%5],$A[$j/5][$j%5],v31.16b
> + 	beq	.Lprocess_block_ce
> +@@ -740,7 +740,7 @@ ___
> + $code.=<<___;
> + 	ldr	d31,[$inp],#8		// *inp++
> + #ifdef	__AARCH64EB__
> +-	rev	v31.16b,v31.16b
> ++	rev64	v31.16b,v31.16b
> + #endif
> + 	eor	$A[4][4],$A[4][4],v31.16b
> +
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> index 669b1a1..ec85ccd 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
> @@ -16,6 +16,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>              file://0001-skip-test_symbol_presence.patch \
>              file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
>              file://afalg.patch \
> +           file://0001-Fix-build-error-for-aarch64-big-endian.patch \
>              "
>   
>   SRC_URI_append_class-nativesdk = " \



