Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 57C236E667
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 19:27:08 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id g62so146684672wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 11:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=i/aE4olBH0iJDj39+kynAQgPee76mBlRUzC4nfrxb/U=;
	b=A0yjL9KGL56i0NaRRkY+OWrlE1fxT981coxiSAgYfvQ/e6Cqejv3xk5twm3ksKnHLq
	UeykTmXKjeUJhG5dGiZWOOjHii4Bq48EQhgHQSSGegI0HMWPlvmxeUAm+cu4FtYpBl/b
	AmuanjPmGEGyR1bIJKHluO435diz+L4AEkxC5vjuSldZ5VHGQlMaCzKkZoqXxbEWri8G
	n8lekB6mRZviJM1nZQ9d6nEqwPceTKZJmPyxqyaxdMbWMsoqppfMDGcWl0HYKg8ZtoEa
	HfiQA0VNsCDhsdfSg1TTzHYoD2ODCBVKemTNRjLuSGv5DK7ThF4uPCj94aXcFEQg7fyU
	etRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=i/aE4olBH0iJDj39+kynAQgPee76mBlRUzC4nfrxb/U=;
	b=eFMuhH7/2Apea+9xqNklX9TOGd9Txr2K4CYFVRGDCU6bSdZj/h4KyzY3Vsr4/V9t6+
	EOr8AnnW4VLuqnkmVUtXvLW0oH5pmzHoq6xLY1ucJ7g57fpzODpso21DzucML/0kVwZd
	fdRKqYTO8Ep7ud0WHi9tXqiRViqNjwVKgQXnjJe7GY8DDMYypuHKT2ktH0avCaYaXmtr
	8fw3oi9UKGkuENFX/wpX/RJIu+EYAHWZSwd89dswaoGfXwC3iwyByIvsSluOrcRXT1YN
	U+LTTvSOY/OtZWCoXbtnXUJtNyd1Q5ZCkRPtD4iFmg5vM6Y/6GAhppiO1TFyVBJ8YVOf
	LN7A==
X-Gm-Message-State: AG10YORaYzt0okApix2LBSnuqTYdzvfNcYNLpg6gbmc/PvtmtaWh61ySdq82hIEPcWcDOu69Xz59whgO+5aeeg==
MIME-Version: 1.0
X-Received: by 10.28.53.193 with SMTP id c184mr503922wma.4.1454959629361; Mon,
	08 Feb 2016 11:27:09 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 8 Feb 2016 11:27:09 -0800 (PST)
In-Reply-To: <1454944563-30448-1-git-send-email-ross.burton@intel.com>
References: <1454944563-30448-1-git-send-email-ross.burton@intel.com>
Date: Mon, 8 Feb 2016 11:27:09 -0800
Message-ID: <CAJ86T=WxJLfU0rObHB3oZ-4DzharyiWxQfFzxkuTQ6VDAX9FjQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-corei7.inc: tell qemu to emulate a matching processor
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
X-List-Received-Date: Mon, 08 Feb 2016 19:27:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 7:16 AM, Ross Burton <ross.burton@intel.com> wrote:
> If tune-corei7 is in use then the target binaries may contain instructions that
> qemu-x86-64 can't execute by default, resulting in errors on rootfs construction:
>
> NOTE: Running intercept scripts:
> NOTE: > Executing update_font_cache intercept ...
> qemu: uncaught target signal 4 (Illegal instruction) - core dumped
>
> In this case the instruction is popcnt, part of SSE4.2, so tell Qemu to emulate
> the CPU that the tune targets (in this case, Nehalem).
>
> [ YOCTO #8888 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/machine/include/tune-corei7.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
> index d245d9f..197558f 100644
> --- a/meta/conf/machine/include/tune-corei7.inc
> +++ b/meta/conf/machine/include/tune-corei7.inc
> @@ -11,6 +11,8 @@ DEFAULTTUNE ?= "corei7-64"
>  # Pull in the previous tune in to pull in PACKAGE_EXTRA_ARCHS
>  require conf/machine/include/tune-core2.inc
>
> +QEMU_EXTRAOPTIONS_corei7-64 = " -cpu Nehalem,check=false"

What about corei7-32 and corei7-64-x32 ?

>  # Extra tune features
>  TUNEVALID[corei7] = "Enable corei7 specific processor optimizations"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'corei7', ' -march=corei7 -mtune=corei7 -mfpmath=sse -msse4.2', '', d)}"
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

