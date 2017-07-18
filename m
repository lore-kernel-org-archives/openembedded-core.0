Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 064887807A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 22:09:13 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id e199so4126883pfh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 15:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=q/s5XwEgy5YfNW0Xeo+McV+ZlpkKVuBrJJV5xXo8RhE=;
	b=gCoIbtlA8eZSulySgSGZsvxH60lOpPbigs0cmodCNzA+gXwskCwwdM6SA2RZf7bJxP
	WKlo4t+0+m++LD7RFm4XORO/T+PbjUvlcWFg/uhIXlleBWP16eghkS9LQAvv01tczQjB
	+rdtZXNyvboVC3/ptdvMphyFDc+WMhDXqO7kI3JK7EK5ZZjPRNBplAUmim1n9AT+8v+O
	jHXreN2ujorK2JC3q8HyLCty54zUxWhoYIVowIGPAshWnPEGEwarU+geeXFI3Ma1IGgC
	fBRT0o/ihriThpr3s2YI0baDhtzNlRwPphp9RLQj25rSB1xjhM45ii/H579UIlgG19tj
	JJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=q/s5XwEgy5YfNW0Xeo+McV+ZlpkKVuBrJJV5xXo8RhE=;
	b=H7K25Qea+DUt9O4WBlpzwzrgozMvBKrbEKruJAX7XOv9nAly86BpPK7vJLBEowrcdi
	pB3RyFmNLpAFF8aZklNJT71Q1ZDYXOWqSWeUH1arZbWcxODEp5Qg5GNOrrQOEu7BbaYl
	kngRIcSfKZHyR4a3IaTSUEG7xP4BJJBBYkztcCE/XIGbNaY0iDLd+NXV8/W6goXcJIFz
	COXGNdYmb4R3NCvcILjaCFFYK8SuHqGfApI1puwWEHBbPMPlCo0oDsIPZ5MEkKjEsrV5
	wbmmRZKkdlMC5weAmaZ5WW1NwDpnp69R0dmK8nLRSvInFGVUGCmuCLQ4UJVsudYOPVwo
	9Q5g==
X-Gm-Message-State: AIVw112nyE9YXS2s3kP6H9tS79Z+kqOeTVPEDPVTnlzEGshW+NXX8Ow4
	SmLYPJc+zWYoFSNVUhg=
X-Received: by 10.98.80.89 with SMTP id e86mr3790771pfb.195.1500415754859;
	Tue, 18 Jul 2017 15:09:14 -0700 (PDT)
Received: from [10.43.100.234] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	a125sm5543571pgc.37.2017.07.18.15.09.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 15:09:14 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170718220735.6547-1-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <cf77abfd-b4d4-cb57-2cc9-f8ab6a7d9835@gmail.com>
Date: Tue, 18 Jul 2017 15:09:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718220735.6547-1-ross.burton@intel.com>
Subject: Re: [PATCH][morty 1/2] libgcrypt: fix CVE-2017-9526
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
X-List-Received-Date: Tue, 18 Jul 2017 22:09:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/18/2017 03:07 PM, Ross Burton wrote:
> In libgcrypt before 1.7.7, an attacker who learns the EdDSA session key (from
> side-channel observation during the signing process) can easily recover the
> long-term secret key. 1.7.7 makes a cipher/ecc-eddsa.c change to store this
> session key in secure memory, to ensure that constant-time point operations are
> used in the MPI library.

is this version 2 or resend?

- armin
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   ...-Store-EdDSA-session-key-in-secure-memory.patch | 39 ++++++++++++++++++++++
>   meta/recipes-support/libgcrypt/libgcrypt.inc       |  1 +
>   2 files changed, 40 insertions(+)
>   create mode 100644 meta/recipes-support/libgcrypt/files/0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch
>
> diff --git a/meta/recipes-support/libgcrypt/files/0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch b/meta/recipes-support/libgcrypt/files/0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch
> new file mode 100644
> index 00000000000..f6c4ca76f33
> --- /dev/null
> +++ b/meta/recipes-support/libgcrypt/files/0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch
> @@ -0,0 +1,39 @@
> +CVE: CVE-2017-9526
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From b3cab278eb9c2ceda79f980bc26460d97f260041 Mon Sep 17 00:00:00 2001
> +From: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> +Date: Thu, 19 Jan 2017 17:00:15 +0100
> +Subject: [PATCH] ecc: Store EdDSA session key in secure memory.
> +
> +* cipher/ecc-eddsa.c (_gcry_ecc_eddsa_sign): use mpi_snew to allocate
> +session key.
> +--
> +
> +An attacker who learns the EdDSA session key from side-channel
> +observation during the signing process, can easily revover the long-
> +term secret key. Storing the session key in secure memory ensures that
> +constant time point operations are used in the MPI library.
> +
> +Signed-off-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> +---
> + cipher/ecc-eddsa.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cipher/ecc-eddsa.c b/cipher/ecc-eddsa.c
> +index f91f8489..813e030d 100644
> +--- a/cipher/ecc-eddsa.c
> ++++ b/cipher/ecc-eddsa.c
> +@@ -603,7 +603,7 @@ _gcry_ecc_eddsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
> +   a = mpi_snew (0);
> +   x = mpi_new (0);
> +   y = mpi_new (0);
> +-  r = mpi_new (0);
> ++  r = mpi_snew (0);
> +   ctx = _gcry_mpi_ec_p_internal_new (skey->E.model, skey->E.dialect, 0,
> +                                      skey->E.p, skey->E.a, skey->E.b);
> +   b = (ctx->nbits+7)/8;
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
> index 15805cd4365..7c4c0e83b53 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt.inc
> +++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
> @@ -20,6 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
>              file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
>              file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
>              file://fix-undefined-reference-to-pthread.patch \
> +           file://0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch \
>   "
>   
>   BINCONFIG = "${bindir}/libgcrypt-config"


