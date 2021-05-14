Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.6106.1620981191121295418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 01:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U/f6swnt;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id v5so22739149edc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 01:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v8wWzp0OrNR8oQ31rTpQ+4Wjdn6wNU6881e/qou4oSo=;
        b=U/f6swntm9JkjkugbLaUWMy5VSOQl61n/TTR8oVh/3U8CrC4zEOTayS+ay7dEScEYW
         230d3N5HVOJdR9Da6bv0A7iIXUk9gWwEkvjLmddq+CnXvDXlBzHWQ54KNFFks9Jyzfv4
         QUNdCYOYGolPRd8E8IF9ckHN6+dZqxLJMFyIoARujD14toLbrfyg4AzB3NS66EgypLcI
         X8laiwad3cq7/wdc/8r768bHjP0kQja3y30RsUsSByhUJ4VqsAf6FY7CjWAIwJNwCzpz
         Ac+nur3aFpyme8DavP7ADW2Q1PAqHPkrQRGFF2hmEMYLZOTo6cdc+Zl/LXwl/W6yC6hZ
         bJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v8wWzp0OrNR8oQ31rTpQ+4Wjdn6wNU6881e/qou4oSo=;
        b=BattI8FB54SAfbEAPJykWmen3ENoC+FgX+kUF8V58QhOTqb5Q3fGO2ZmecrjkH0T9x
         BBWiNFRDAwAvgw6hhhGv5vFXnxe2wdE5HvikO08s7pxNQCcIYdccIKzlRNcGls65PqVv
         Eh+S5FtzF0gkDE6Rx/Hl09cPZg31YTi7eXQBDm2OLNKlyRliCyqM9Py/z55mlA/iY4k9
         kFzy/egq/VBJz5fhp5jLvEU3x3oGnXagd7h17OhudU741Ak8JntA46ZHpcqAWeU7z3sl
         92bfgcuRBTcqay8p+0odCBe6fsZBz71AWTLc22VGpaz8qcXLPlIs7H8XRm9wgX5XQPVp
         HiuQ==
X-Gm-Message-State: AOAM533IaxdLDjYn0ISN7p3DPZ9EEHqy7T7qtqDizrMKdXbK1RPz4XGJ
	1lbGpqex7XzthCrkVUvYDRAabaWy+MSPXjpFioc=
X-Google-Smtp-Source: ABdhPJxQ6dof7sQxfQE/wF/0khBtHt5j1GK8nWJd0HKi+gwaDbg3/jAlvloyCFrCwMHpWxQLFji6xX262CmK5Z/pous=
X-Received: by 2002:a05:6402:2218:: with SMTP id cq24mr37977988edb.213.1620981189611;
 Fri, 14 May 2021 01:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210513223847.1086544-1-raj.khem@gmail.com> <20210513223847.1086544-2-raj.khem@gmail.com>
In-Reply-To: <20210513223847.1086544-2-raj.khem@gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 14 May 2021 09:34:42 +0100
Message-ID: <CANPvuRnsot0330W_=bmEsGTpU3z-Vmcz2nFeD6+yKPO5+vXMbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-libav: remove explicit LICENSE_FLAGS
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

There has already been a discussion about this in
https://lists.openembedded.org/g/openembedded-core/message/143935

In short: If libav needs ffmpeg, it will need that line (with a comment
explaining its due to the dependency). Assuming libav without
ffmpeg doesn't make sense/work

Khem Raj <raj.khem@gmail.com> escreveu no dia quinta, 13/05/2021 =C3=A0(s)=
 23:38:
>
> From: Yann Dirson <yann@blade-group.com>
>
> This flag does not describe the gst-libav package, but ffmpeg instead.
> It gets in the way of using finer-grained LICENSE_FLAGS in ffmpeg.
>
> It is above all not needed, the real problem is even more clear without =
it:
>
>  ffmpeg was skipped: because it has a restricted license 'commercial'. W=
hich is not whitelisted in LICENSE_FLAGS_WHITELIST
>  ERROR: Required build target 'gstreamer1.0-libav' has no buildable prov=
iders.
>  Missing or unbuildable dependency chain was: ['gstreamer1.0-libav', 'ff=
mpeg']
>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4=
.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
> index 7c39e7da37..d5b38f77c5 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
> @@ -4,9 +4,6 @@ muxers, and demuxers provided by FFmpeg."
>  HOMEPAGE =3D "http://gstreamer.freedesktop.org/"
>  SECTION =3D "multimedia"
>
> -# ffmpeg has comercial license flags so add it as we need ffmpeg as a d=
ependency
> -LICENSE_FLAGS =3D "commercial"
> -
>  LICENSE =3D "LGPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928e=
ad0d \
>                      file://ext/libav/gstav.h;beginline=3D1;endline=3D18=
;md5=3Da752c35267d8276fd9ca3db6994fca9c \
> --
> 2.31.1
>
>
>=20
>


--=20
Best regards,

Jos=C3=A9 Quaresma
