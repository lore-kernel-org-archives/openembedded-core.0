Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id D31D471984
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:06:33 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id m7so23769733qtm.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vDdh6X3e5NJw+IMxk3/mhCDV22UwUNnhr0OpqktvtAM=;
	b=QhZwVEILJ0lqqREJ97eA0hK/TKhq9/iq23pFYanJiRZLjisfmRgfExUUP9ebL/2t0S
	WMnpweP08U2eh92L2GIX8983sCC8z00ldRqbTXaFCZkQ7WxznCDQDN6ZathM/HtNZhA3
	kOr0/2tMY250PRx/aJQlClgQNHn4x2XGCYKDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vDdh6X3e5NJw+IMxk3/mhCDV22UwUNnhr0OpqktvtAM=;
	b=gN0LHjUHY+YBWf3DUkDR7ZipWCHrvrmEi0vLSsAvn4/Pf7d9MiaazW32zjX18uU9bL
	RQS9yyruLu+ySukPgYLd/im87vAEbNYT3tB3sfyi7PMJjvI/vUVQQDCAyrBHbgVfhff6
	jJELI6rp04ivZyMB2GRV2jZu2Rj1LUbu6aCUbArtiuPuWz3ROWKrtVzMOm3BJnpc3Mgv
	mjLJPkAzsDiQ2bpDkwB+Tw3p5NCpUflBZx+4HX6bp4nE/mzUA7r4y/tMHHLlbjve8kzB
	2X6eid9RkJzEYiE9lbcFHclAU4v2YtqvOz18gckTndG2Ee6YcAvEBedElx6QG/BLBYby
	yqcQ==
X-Gm-Message-State: AIVw111Ksgd3HGK/yID8bOZzXheQ8yElxbgVIGtz/aVto1t6+UMgW6Ld
	ZLhxfEyJ8zzFHph+grCWkebKmhfQljCX
X-Received: by 10.200.3.45 with SMTP id q45mr4775109qtg.3.1500559594700; Thu,
	20 Jul 2017 07:06:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.97.194 with HTTP; Thu, 20 Jul 2017 07:06:14 -0700 (PDT)
In-Reply-To: <CAMKF1sqOWkSJqqcj4ZW+NB40pJvpuC2NtKJH2Ea3iCwzxwE-8g@mail.gmail.com>
References: <20170720115657.11406-1-nicolas.dechesne@linaro.org>
	<CAMKF1sqOWkSJqqcj4ZW+NB40pJvpuC2NtKJH2Ea3iCwzxwE-8g@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 20 Jul 2017 16:06:14 +0200
Message-ID: <CAP71WjyWBkAKzf0MJXL_XVKEuU_1zZSPxDyEziWz9D-O6Mz62A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: fix pkg-config utilization
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
X-List-Received-Date: Thu, 20 Jul 2017 14:06:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 2:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Jul 20, 2017 at 7:56 AM, Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
>> in config.log we can see:
>> WARNING: aarch64-linaro-linux-pkg-config not found, library detection may fail.
>>
>> ffmpeg configure script is not looking for pkg-config at the rigt place since it
>> is assuming cross compilation. let's force its value in the recipe.
>>
>> This patches 'fixes' library detection and brings the following diff:
>>
>> * RDEPENDS: ++libxcb (>= 1.12) libxcb-shape (>= 1.12) libxcb-shm (>= 1.12) libxcb-xfixes (>= 1.12)
>> * PKGSIZE : 79167 -> 87823
>>
>> Which basically means that the following conf options were left dangling in EXTRA_OECONF:
>>
>> --enable-libxcb
>> --enable-libxcb-shm
>> --enable-libxcb-xfixes
>> --enable-libxcb-shape
>>
>> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>> ---
>>  meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
>> index f4bb2ba1f5..442d4f4532 100644
>> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
>> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
>> @@ -107,6 +107,7 @@ EXTRA_OECONF = " \
>>      --datadir=${datadir}/ffmpeg \
>>      ${@bb.utils.contains('AVAILTUNES', 'mips32r2', '', '--disable-mipsdsp --disable-mipsdspr2', d)} \
>>      --cpu=${@cpu(d)} \
>> +    --pkg-config=pkg-config \
>
> There is a proposal to repace pkgconfig with pkgconf, and I hope it

do you have a link?

> will create a symlink to provide pkg-config
> but it would be interesting to check, otherwise this fix will be
> voided with that change

what do you mean?

>
>>  "
>>
>>  EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

