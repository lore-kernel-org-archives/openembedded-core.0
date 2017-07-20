Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 34DCD6003C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:52:04 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t3so2644266wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 06:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FraLoAzlqU7YVIfaqYIeOdvbSLsGXRAz928MxID6IoI=;
	b=o/P7Sp5ncsduY9+h330xE9hcjcTT6Kp6Ect8dQu2P+CkiZAUezbqEAaPAFpJ7ZwTAx
	hf3U3xIsK/Nhn45LkV2unvaiEyD936qNjkAw2gZlW4TpqL05QKk5+aobntaaPygoXz6x
	Jsl53TbRkmZbCmF9ppOUh2EjA0wrRHVU2DFqPk9ap1hVj+XH/PnNZDNAcWsywd0N0eac
	oKiwbITMOq4XhyoLo6n/NXv9BPYndYC16BncTRtloCbIS9sEPcEV76eQe3LndvAQeNBy
	Z4buNjv6PBKndiVVhMeKNXf9Hd1swNNY9WzZ/960XRwWOanA4yU5/yzMPPqYvJ5Cm8P4
	UePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FraLoAzlqU7YVIfaqYIeOdvbSLsGXRAz928MxID6IoI=;
	b=kMc2rNwrSAaSgL2rAN3ZmN7X8P6T/YnFePLFGvmf3Sci7/6nTE455ChaWXWB6bEldF
	N55qGjasXXVlzK3l4DSMp+EANAPp26d1cbVQd0Ro/APypAT5dGN0JDbt9q7pO+ET8gNe
	Y5NEROCayYYxCSIn6uTDgxGVxNuc7kvwrbkmu7qO4EfURwaSN8pZ9cOcuLUytcvRp5wY
	5dDlfL2Q5SGgFJB4xsWVN9KDXJGBOxL0y4QTNeAbGBPQ9iTi3/aVSSjPNMLNS3/WWfRp
	qjZ70CyQ9F9i5xfE4OGdYTkJYk1LTlCuqTIqA8lmBD/oZUVN+HA4oauDNoGDwOJEd7l+
	l08g==
X-Gm-Message-State: AIVw1130INiZvPRC3cB5M0AwsyNhI2YvdWCxFT9m8zi8WRgtNCn8NR1k
	QyuWNvQXWFDyiJHHp1XpeDqFdrIwKA==
X-Received: by 10.80.139.65 with SMTP id l59mr2873661edl.52.1500555330366;
	Thu, 20 Jul 2017 05:55:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Thu, 20 Jul 2017 05:54:59 -0700 (PDT)
In-Reply-To: <20170720115657.11406-1-nicolas.dechesne@linaro.org>
References: <20170720115657.11406-1-nicolas.dechesne@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jul 2017 08:54:59 -0400
Message-ID: <CAMKF1sqOWkSJqqcj4ZW+NB40pJvpuC2NtKJH2Ea3iCwzxwE-8g@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
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
X-List-Received-Date: Thu, 20 Jul 2017 13:52:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 7:56 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> in config.log we can see:
> WARNING: aarch64-linaro-linux-pkg-config not found, library detection may fail.
>
> ffmpeg configure script is not looking for pkg-config at the rigt place since it
> is assuming cross compilation. let's force its value in the recipe.
>
> This patches 'fixes' library detection and brings the following diff:
>
> * RDEPENDS: ++libxcb (>= 1.12) libxcb-shape (>= 1.12) libxcb-shm (>= 1.12) libxcb-xfixes (>= 1.12)
> * PKGSIZE : 79167 -> 87823
>
> Which basically means that the following conf options were left dangling in EXTRA_OECONF:
>
> --enable-libxcb
> --enable-libxcb-shm
> --enable-libxcb-xfixes
> --enable-libxcb-shape
>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
> index f4bb2ba1f5..442d4f4532 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
> @@ -107,6 +107,7 @@ EXTRA_OECONF = " \
>      --datadir=${datadir}/ffmpeg \
>      ${@bb.utils.contains('AVAILTUNES', 'mips32r2', '', '--disable-mipsdsp --disable-mipsdspr2', d)} \
>      --cpu=${@cpu(d)} \
> +    --pkg-config=pkg-config \

There is a proposal to repace pkgconfig with pkgconf, and I hope it
will create a symlink to provide pkg-config
but it would be interesting to check, otherwise this fix will be
voided with that change

>  "
>
>  EXTRA_OECONF_append_linux-gnux32 = " --disable-asm"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

