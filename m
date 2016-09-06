Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 135657760E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 20:51:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a6so9332261wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 13:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SpjQB4g3NAgiYvpPokw75FQ98Qu3Shxu6QX1e2r9JzU=;
	b=004Vkci5wi/ksmltIdbFNCnvISQaxSV0HL5JrfVd9RTDd5Ecjtw9MDE16PamlNYO5r
	GRgpRdn4b0w3U9ludb+1kK4SojhQzQY5VTm3QWGoWU0eEMSheLORhlcH8zgHQqApFPKh
	IzES3wkZ6kQC8Yamup0zyQSJwr3qYqRB3rZI0Jjhy+pv2CtbtvLesBbrRtYNSOe12hAV
	ifGle7ECPmHJZPDIhzzZITemge0Ow8afYGwXyKez8PvoRs72gab64wlnTYr6/EZnabL0
	qvNNcczpSYaheiM9X3Gy2/V/hWZu+CwR3NvoTK8ww23X0zRLYzvpL6gtawrDeO1Cdo28
	pAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SpjQB4g3NAgiYvpPokw75FQ98Qu3Shxu6QX1e2r9JzU=;
	b=mj+J4F+9/DnqUCunFnMAO0gpuP0HGhgZfpFnx10YKZTOPQn2+QZDjPhiy+BG0tb5BK
	pEUzBL6kQTXnWJvsMd1Va1UOlkz27FO3CQ75vqZ/vjEW1PkXsLav/0W4YiDHGjUaB6p2
	DLVK7fW7DfqNSQ928oZaPLz3PNGs2PbOlW1FUsBOTFQqpbzKoqLKrAAa+UqfygeUPJ7c
	MJQ3FZ/pzCrCsdE2+RiM9OVh+qYVsMb0xJP5baFeSSno8sdctGwxZ2AfIT7HqYZbdIWl
	Uv3+iHqmP6YfrvepJSrwQaqOHGuleQtDYJjm09bWyGDK2DxY3QH1OjCSyeHp7W5IcUvz
	vpSQ==
X-Gm-Message-State: AE9vXwOlt6IfoN5mVbHvAet/FrPj2xzFOpfGh8XDDYXKBQaTGP0fS8bt7/oJSgV909FxiWcznor4uuqQRPrlEg==
X-Received: by 10.28.125.18 with SMTP id y18mr488586wmc.116.1473195119243;
	Tue, 06 Sep 2016 13:51:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.216.100 with HTTP; Tue, 6 Sep 2016 13:51:58 -0700 (PDT)
In-Reply-To: <1473193556-11790-1-git-send-email-jslater@windriver.com>
References: <1473193556-11790-1-git-send-email-jslater@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 6 Sep 2016 13:51:58 -0700
Message-ID: <CAJ86T=Uiq42eV-zOH8un-1Q4vUmrJmxKX-UHmSGZkNZ5DQ1VAQ@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libwebp: do not assume armv7a has neon intrinsics
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
X-List-Received-Date: Tue, 06 Sep 2016 20:52:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 6, 2016 at 1:25 PM, Joe Slater <jslater@windriver.com> wrote:
> configure incorrectly thinks -mfpu=neon is in CC for armv7a,
> so defeat automatic neon detection.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/recipes-multimedia/webp/libwebp_0.5.1.bb |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-multimedia/webp/libwebp_0.5.1.bb b/meta/recipes-multimedia/webp/libwebp_0.5.1.bb
> index 222bd56..2d86b4a 100644
> --- a/meta/recipes-multimedia/webp/libwebp_0.5.1.bb
> +++ b/meta/recipes-multimedia/webp/libwebp_0.5.1.bb
> @@ -26,6 +26,9 @@ EXTRA_OECONF = " \
>      --enable-libwebpdemux \
>      --enable-threading \
>  "
> +# configure incorrectly believes that armv7a has -mfpu=neon
> +#
> +EXTRA_OECONF_append_armv7a = " --disable-neon"

Unless you want to disable neon for all armv7a builds, perhaps
something like this would be better:

  EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "neon", "",
"--disable-neon" ,d)}"

>  inherit autotools lib_package
>
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

