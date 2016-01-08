Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id D4ABF731DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 16:24:35 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id u188so143163865wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 08:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TYDHuvajJGwlwOFzALDyge/s2aMihPIvSuvc8StDVWg=;
	b=OUVOY3W0/+iRv7WuL7Oh5ffAN6OZF5pPC+ZLDrYg20k7P5aYfLpvrZ+4ftj4gSdin9
	NpXrCs9g1jih/feRpu2D2pFMXbzF+REBh3YzDrN798mosQJ2aJOhoxyYLyIQuKY0aoWA
	kd2eoFb+RkB9aytvIVvHl7IZyAkhcM1uACC93ue6YkDRG/UousCmp8e0OJXNUD8Cpvs0
	TYAVuvKb5sEgyzJ3JJCkXsO5v9hq0XVPdm9F0J7Z2vF+QHQesdQBUfwQ81Xc41Pj9UVD
	AMwPsEzqIv2gk+Z7fKCP5ohJ6AGE5B5qBewUQuxxYaeGrrwefgNVi6xD632WzLP10Bgu
	Gd9A==
MIME-Version: 1.0
X-Received: by 10.194.156.199 with SMTP id wg7mr118256471wjb.114.1452270276371;
	Fri, 08 Jan 2016 08:24:36 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Fri, 8 Jan 2016 08:24:36 -0800 (PST)
In-Reply-To: <1452257072-1799-1-git-send-email-Martin.Jansa@gmail.com>
References: <1452256574-21587-1-git-send-email-Martin.Jansa@gmail.com>
	<1452257072-1799-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 8 Jan 2016 08:24:36 -0800
Message-ID: <CAJ86T=WNGGp=L358DSu2+VXM4eEdOz9FRcDBkGueUap80RjGBw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][RFC] arch-armv7ve.inc: respect armv7a override as well
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
X-List-Received-Date: Fri, 08 Jan 2016 16:24:37 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 4:44 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * in all cases we currently have we consider armv7ve to be compatible with armv7a

Is this a short term workaround or a long term solution?

If it's a long term solution then how will armv7m and armv7r be
handled? They are likely to need to duplicate a lot of the current
armv7a over-rides too.

Maybe adding a generic "armv7" over-ride which can be enabled by all
armv7 variants is a better option?

Either way, I'd like to continue cleaning up of the existing armv7a
over-rides (e.g. the libav armv7a specific optimisation is likely
bogus and should be removed, etc).


> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/machine/include/arm/arch-armv7ve.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf/machine/include/arm/arch-armv7ve.inc
> index 79e1ef6..d0fdff7 100644
> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
> @@ -3,7 +3,8 @@ DEFAULTTUNE ?= "armv7ve"
>  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
>  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
>  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -march=armv7ve', '', d)}"
> -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:', '' ,d)}"
> +# In all cases we currently have we consider armv7ve to be compatible with armv7a
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', 'armv7ve:armv7a:', '' ,d)}"
>
>  require conf/machine/include/arm/arch-armv6.inc
>  require conf/machine/include/arm/feature-arm-neon.inc
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

