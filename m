Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 308287238C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 18:07:48 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id im17so2350415vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 10:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=5AwIIpmxGkH/Pi+B2frVBQOOFVns+oeCz8EyNwroGAM=;
	b=Svza/j6LiVwnX1s9kbQWDd17dAenh81BhRLWsRmSxEN5P9jDdKAAqWLg7Mjb39a/x6
	4s1vVNAuUXEOvPNJa+3Inb+zbcFu+HlYgt3LXxpQOHSsGMizk4XiFZGrMmigipYOcx0M
	uni/Q/Idn6cacUD5Xo6g/X9VJj5HSR0/qKQpfl4XlSbaNUvobK0eGPYNyltGAV0GRVGZ
	ZkzVqBf3FTHiP/xOWOXw0w69kkjbcwH/FzANl86URln14ku3FiyInlBPffCqtwxPdqTt
	LTLqNCKfi4bUBefZ4CbloqhPEDfoHXAuLs3KG7pi1TvXSkDFUoWLatYS62vlVKvmAdL0
	FSAQ==
X-Gm-Message-State: ALoCoQnOIMIHmsaMRtjVjResFSaRZFBJP3sYQq3BjKXu0xVl27kvk0GLdQkp66cJF/6GClbJYmvv
MIME-Version: 1.0
X-Received: by 10.221.38.8 with SMTP id tg8mr21101483vcb.76.1417111669392;
	Thu, 27 Nov 2014 10:07:49 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.31.188.129 with HTTP; Thu, 27 Nov 2014 10:07:49 -0800 (PST)
In-Reply-To: <201409211802.17872.marex@denx.de>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<201409190914.03281.marex@denx.de> <1411111512.4736.11.camel@ted>
	<201409211802.17872.marex@denx.de>
Date: Thu, 27 Nov 2014 18:07:49 +0000
X-Google-Sender-Auth: HFOa-7UGuToz77hsKLGg-vzAX4Y
Message-ID: <CAOMwXhMOr2SxHfz_JX2QaW_j1GAQiR0BR4KpCGCPMVx7yyGztw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Marek Vasut <marex@denx.de>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Thu, 27 Nov 2014 18:07:55 -0000
Content-Type: text/plain; charset=UTF-8

What is the situation on this front?

On Sun, Sep 21, 2014 at 5:02 PM, Marek Vasut <marex@denx.de> wrote:
> On Friday, September 19, 2014 at 09:25:12 AM, Richard Purdie wrote:
> [...]
>> > git grep nativesdk-python-modules doesn't show any matches in
>> > git://git.yoctoproject.org/poky master . Do you mean the
>> > nativesdk-packagegroup- python I crafted or do you refer to something
>> > else please ?
>> >
>> > Also, shouldn't full python be installed into all the SDK toolchains ? I
>> > am for example unable to compile U-Boot 2014.10rc with the Yocto SDK
>> > toolchain anymore. The SDK is missing python modules and I cannot easily
>> > override the usage of python from the SDK . So I agree with Laszlo here,
>> > the SDK toolchain is somewhat unusable as it is.
>>
>> I refer to the package I mentioned:
>>
>> $ ls -la tmp/deploy/ipk/x86_64-nativesdk/nativesdk-python-modules*
>> -rw-r--r-- 2 richard richard 1512 Sep 18 17:09
>> tmp/deploy/ipk/x86_64-nativesdk/nativesdk-python-modules_2.7.3-r0.3.24_x86
>> _64-nativesdk.ipk
>>
>> See ${PN}-modules defined in python-2.7-manifest.inc.
>
> Oh I see, sorry. Is there any way to look up packages with bitbake or Yocto
> please ?
>
>> I agreed there is a problem, I disagree somewhat about how it should be
>> fixed since you're just installing a set of modules which is defined as
>> those needed to run bitbake and I don't think this is what you actually
>> want. There is also the question of whether nativesdk-python should even
>> be in there...
>
> So would this patch (paste below) work please ? If so, I would submit proper.
>
> diff --git a/meta/classes/populate_sdk_base.bbclass
> b/meta/classes/populate_sdk_base.bbclass
> index 10d04ed..7245d53 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -30,7 +30,11 @@ B_task-populate-sdk = "${SDK_DIR}"
>
>  SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${REAL_MULTIMACH_TARGET_SYS}"
>
> -TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-
> canadian-${MACHINE}"
> +TOOLCHAIN_HOST_TASK ?= "                               \
> +       nativesdk-packagegroup-sdk-host                 \
> +       packagegroup-cross-canadian-${MACHINE}          \
> +       nativesdk-python-modules                        \
> +       "
>  TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
>  TOOLCHAIN_TARGET_TASK ?= "packagegroup-core-standalone-sdk-target packagegroup-
> core-standalone-sdk-target-dbg"
>  TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
> diff --git a/meta/recipes-qt/meta/meta-toolchain-qt.inc b/meta/recipes-
> qt/meta/meta-toolchain-qt.inc
> index 6b162bd..473a123 100644
> --- a/meta/recipes-qt/meta/meta-toolchain-qt.inc
> +++ b/meta/recipes-qt/meta/meta-toolchain-qt.inc
> @@ -1,4 +1,8 @@
> -TOOLCHAIN_HOST_TASK = "nativesdk-packagegroup-${QTNAME}-toolchain-host
> packagegroup-cross-canadian-${MACHINE}"
> +TOOLCHAIN_HOST_TASK = "                                                \
> +       nativesdk-packagegroup-${QTNAME}-toolchain-host         \
> +       packagegroup-cross-canadian-${MACHINE}                  \
> +       nativesdk-python-modules                                \
> +       "
>  TOOLCHAIN_TARGET_TASK = "packagegroup-${QTNAME}-toolchain-target"
>  TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-${QTNAME}-${DISTRO_VERSION}"
>
>
> Best regards,
> Marek Vasut

