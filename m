Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web11.8194.1616679854471055035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 06:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=IZm+qNMO;
 spf=pass (domain: blade-group.com, ip: 209.85.217.49, mailfrom: yann.dirson@blade-group.com)
Received: by mail-vs1-f49.google.com with SMTP id v2so891501vsq.11
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KrLN8ELa5vM0S/yIqNhucy1YsBpsEp2DC2jawxGPuTg=;
        b=IZm+qNMOCIbwRE8IlVu+BuFP23kB5CZSq1BtqAnpRpHcK9UzGr7fTTX2EZW1eyT1iY
         pNqLXxLou5jKeIsJJZQQBjX17MXemNozHCwmOk2Wp9o1skpOQHS8AUdEsdCNEUMqQLYz
         I+3/5BpD9tf8BH8/hp7lt2HTTkUbEqqMthDdn9QaG2DN8Uu7x9hwAmeG4+hH0AFrVuKV
         Zm4rFwFW4gR0JKuqgwGBKCoMttDXGY4QDjxsRDLAUKjYJFrwcsxjBCYpVxaK6MmPZWzC
         Th5GJIHAWeOas4mZEQAlFYnfqTSlOwhyA/50dR7418oZ9MCuVdTDu/IhMluSrdUcpFve
         ugiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KrLN8ELa5vM0S/yIqNhucy1YsBpsEp2DC2jawxGPuTg=;
        b=OIkkSYRPr2nSxXocIlp61C+nUOQZDH6dSyXBtNsTZRrEKg8dhKxcN7u9d80Up0wWCH
         j8tDnGyapUQ/tDgZ7a6O0RRoVDt3dusaWcKmrccnj+781Dcsn80aMR1lCVwSTVqyBWhp
         NGmRiCJfEuLMnqgF5htaXVuT1wiu2nkt257Y1vIXZ4pmIRwY2vQZb0MOtd9zpnRk1Iko
         KXLDSgow7ME/h50i5ViJo5qHzgfrNks8RlnFcsTA5XyvL6KUufAcFlcptZJjlrH+nJjd
         HAygEnfcvweGh+bByBrdA5AFA5weQjE1ZEGBxVa0Hyexl4+8LvKt7PSNsvZ3K7+A6nwq
         J2jQ==
X-Gm-Message-State: AOAM531Kyd41qO4KfWLXzAGhJZdBobW6MHVJwQJN9YaJZB1psIdUZLot
	QdZt+sPZ9VirOUDUXt1/1UWZ2tSDWh0F9awFIKRDVA==
X-Google-Smtp-Source: ABdhPJzSvSsUgeRCq9C2VsnD94BAlWSvK8IYLrpgnhNuXqQfS734sGre/oLOh1U+Ace9AJSAGgiQa1McrjOjCvuLEdk=
X-Received: by 2002:a67:641:: with SMTP id 62mr4787887vsg.23.1616679853562;
 Thu, 25 Mar 2021 06:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210323163742.810094-1-yann@blade-group.com> <CANNYZj8fm0vTpB-p0PFJNmF4S8oOBmKGhK+R7PBhOdKZXy4R7A@mail.gmail.com>
In-Reply-To: <CANNYZj8fm0vTpB-p0PFJNmF4S8oOBmKGhK+R7PBhOdKZXy4R7A@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Thu, 25 Mar 2021 14:44:02 +0100
Message-ID: <CA+4=imaBb=bmRJq8wMVqRftk-Toiz29bmPD_gcCOxBLpgnfE8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] ffmpeg: make LICENSE_FLAGS fine-grained
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Le mar. 23 mars 2021 =C3=A0 17:42, Alexander Kanavin
<alex.kanavin@gmail.com> a =C3=A9crit :
>
> Is it possible to further split the NONCOMMERCIAL_PACKAGECONFIGS into on=
es that are enabled and disabled, and use the former in PACKAGECONFIG itsel=
f?

You mean something like this ?

# PACKAGECONFIG features that do not pull codecs
NONCOMMERCIAL_DEFAULT_PACKAGECONFIGS =3D " \
 avdevice avfilter avformat swresample swscale postproc avresample \
 alsa bzlib drm gpl lzma pic pthreads shared zlib \
 ${@bb.utils.contains('AVAILTUNES', 'mips32r2', 'mips32r2', '', d)} \
 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv xcb', '', d)} \
"
NONCOMMERCIAL_NONDEFAULT_PACKAGECONFIGS =3D " \
 altivec bzlib gsm jack openssl sdl2 \
"

PACKAGECONFIG ??=3D "avcodec theora \
                   ${NONCOMMERCIAL_DEFAULT_PACKAGECONFIGS}"

I admit I'm not completely sure about every feature's status.

I tend to think that if ffmpeg relies on a lib providing an
implementation, and there
are patent-related risks, it should that lib setting a LICENSE_FLAG.
Eg. x264 and others
already sets the "commercial" flag, so I'm tempted to not add a
duplicate flag in
ffmpeg (in the same spirit as my patches against gst-libav and mpv).
Would it be
good enough ?

>
>
> Alex
>
> On Tue, 23 Mar 2021 at 17:38, Yann Dirson <yann.dirson@blade-group.com> =
wrote:
>>
>> From: Yann Dirson <yann@blade-group.com>
>>
>> The rationale here is that if the user can only whitelist "commercial"
>> to use any part of ffmpeg, even it the list of features is carefully
>> reviewed when switching the whitelisting on, there was nothing to
>> guard from inadvertently activating a new feature that would not have
>> been reviewed.
>>
>> This patch adds one LICENSE_FLAGS value for each feature, except for
>> those that bring no codec, trying to be on the same level of legal
>> safety - but then I may miss something.
>>
>> I tried to leave out of the safe NONCOMMERCIAL_PACKAGECONFIGS list
>> anything that brings a codec, notably libavcodec.  I also did not look
>> at non-default features yet.
>>
>> There may still be a problem if any feature in ffmpeg gets activated
>> by default upstream and not registed as a PACKAGECONFIG feature.  At
>> least any of those that depend on another lib would not be enabled,
>> that could be seen as a sufficient safeguard.
>> ---
>>  meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/reci=
pes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
>> index 08be38ca50..3a36c95151 100644
>> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
>> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
>> @@ -16,7 +16,17 @@ LICENSE_libavutil =3D "${@bb.utils.contains('PACKAGE=
CONFIG', 'gpl', 'GPLv2+', 'LGP
>>  LICENSE_libpostproc =3D "GPLv2+"
>>  LICENSE_libswresample =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl'=
, 'GPLv2+', 'LGPLv2.1+', d)}"
>>  LICENSE_libswscale =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl', '=
GPLv2+', 'LGPLv2.1+', d)}"
>> -LICENSE_FLAGS =3D "commercial"
>> +
>> +# PACKAGECONFIG features that do not pull codecs
>> +NONCOMMERCIAL_PACKAGECONFIGS =3D " \
>> + alsa bzlib drm gpl lzma zlib xcb xv \
>> + avdevice avfilter avformat swresample swscale postproc avresample \
>> +"
>> +# An ffmpeg feature not in NONCOMMERCIAL_PACKAGECONFIGS should be expl=
icitly whitelisted.
>> +# See https://ffmpeg.org/legal.html
>> +LICENSE_FLAGS =3D "${@' '.join('commercial_' + cfg \
>> +                             for cfg in '${PACKAGECONFIG}'.split() \
>> +                             if cfg not in '${NONCOMMERCIAL_PACKAGECON=
FIGS}'.split())}"
>>
>>  LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263 \
>>                      file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80=
d47fae504 \
>> --
>> 2.30.2
>>
>>
>>=20
>>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
