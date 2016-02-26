Return-Path: <net147@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 91B8B77417
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 11:17:11 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id x65so50789234pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 03:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=jlzbPsH2KGbvfXSHBZ8O1FyrAu74qqJ5Jxyz+HvP4SY=;
	b=s7ARKMIMvZ+v1K4QxSMtBJBUOxibmMkjI6N7qiXQd6GD/1khFhUgtZU9ejB1THisgD
	z3lwGOmAMKdM7pk6oPLCHpn824kltd+GUX6fyfm0GLFmr5TeLZJyxZHZKMzWT5QnHlf+
	apkoANyLpBAHRgVhUyaEDM2E7HpszaLM7U1PfpOfEU8cCaY1fLRuy/GNQzae4a9p00FF
	cpLHOhvcQSa4y3GokhGyOy9GSjk5HJjG8Aynx62B090qk9aahxHyog4MlzXAve1puMRG
	LwQfq3p1VadknCeJCIfG3afpzGezul23ILGlfVR4wxYj0NTiI2gTtTeUQrtweETIfrtt
	dGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=jlzbPsH2KGbvfXSHBZ8O1FyrAu74qqJ5Jxyz+HvP4SY=;
	b=kwruiHtHL9dwOvGNqxcG1spp/+w+uZp4gwB1AVvtTRlxtKkMS47lEa9uYrWhreaWcL
	4viYuGZ3zV+ziTsj1zUC6vaHu+rVKYPYac9fvCKpHDVYQ4Zg7QwKGRCDAU9uqBYenzyv
	n2OZuSK2OSt+t1bVe2F6OkwjAGWbwABHC5yeSpJ3IbOkvuLNYCUOqIgd5rWGhWBtZago
	qwrbIP6SaRVsMxZaV+OPuq5hXjfX74CL2+57gsbGOET+MbGpgHjV5QjmyoyT3PRSpmwf
	KP554BMrvgt8e706weZPFrtZACeczLfyzZKNOVbIHL2J5cKYvXrlT5tkvvjthvSw9oCn
	g6BQ==
X-Gm-Message-State: AD7BkJJ9ewXj3ELYw569usrLJbwzYMtJ0C/addYPYc8uv3p44sO45J+Jpulf2LS8EQd/WP8h2xFqNS2A9HaLQw==
MIME-Version: 1.0
X-Received: by 10.98.72.193 with SMTP id q62mr1212256pfi.117.1456485431999;
	Fri, 26 Feb 2016 03:17:11 -0800 (PST)
Received: by 10.66.155.201 with HTTP; Fri, 26 Feb 2016 03:17:11 -0800 (PST)
In-Reply-To: <20160226110428.GA2557@jama>
References: <1456483945-16340-1-git-send-email-net147@gmail.com>
	<20160226110428.GA2557@jama>
Date: Fri, 26 Feb 2016 22:17:11 +1100
Message-ID: <CANwerB0bs=0b0r_mj+VJ+rgYz56jKUuSiUgs7kdK+tD9f=Ot8A@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: fix build when DISTRO_FEATURES doesn't contain x11
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
X-List-Received-Date: Fri, 26 Feb 2016 11:17:12 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

It doesn't work in PACKAGECONFIG..... that is the first thing I tried.

Regards,
Jonathan

On 26 February 2016 at 22:04, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Feb 26, 2016 at 09:52:25PM +1100, Jonathan Liu wrote:
>> If avdevice is enabled, libxv is used if it is detected by configure
>> for the XV outdev. However, we can't depend on libxv for avdevice when
>> DISTRO_FEATURES doesn't contain x11 as this will result in an error.
>>
>> Fix this by adding a libxv dependency only when the avdevice
>> PACKAGECONFIG is enabled and DISTRO_FEATURES contains x11. XV outdev
>> is only one of many that are supported by avdevice so it is still
>> useful to enable avdevice even if libxv is not available.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
>> index 72393b3..f29c05e 100644
>> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
>> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
>> @@ -23,11 +23,12 @@ SRC_URI[sha256sum] = "25bcedbdafadac3d09c325c1d46a51f53d858b26a260d5aed6b4f17fea
>>  PROVIDES = "libav libpostproc"
>>
>>  DEPENDS = "alsa-lib zlib libogg yasm-native"
>> +DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'avdevice', bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxv', '', d), '', d)}"
>>
>>  inherit autotools pkgconfig
>>
>>  PACKAGECONFIG ??= "avdevice avfilter gpl theora x264 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>> -PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice, libxv"
>> +PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
>
> bb.utils.contains didn't work in PACKAGECONFIG?
>
> Why not
> PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice, ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxv', '', d)"
>
>>  PACKAGECONFIG[avfilter] = "--enable-avfilter,--disable-avfilter"
>>  PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
>>  PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
>> --
>> 2.7.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

