Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.4768.1622019126681524813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 01:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=slfzdJ0R;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id lg14so1154691ejb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QwU9+5+gvfEazdlJRI6h2A4dYCJQbZyj893LjNveIRQ=;
        b=slfzdJ0R+BgPcpM25PHqpnD7a3+wXitYt6NCi1qeqLJ2LZjtbv1Q9U5/gcdlrxJ2VC
         vhsv49j0od8FHcfNZWtnqjBHwxDkuBd1S58OXSYz+GBJaeFNKFRRbDSjPSkbCmqwvmXR
         QrDofsFFz76OAhEff4fLYT8Ig7WDJcFZ1QTM4gwqE4GyauNvF13qwcaCriXmx3mtZDP+
         Aeygoi1nwPZiJMIXEf9p6uvidAUZZ5XoFmFWlPnvLyN5alZsJzer4lwRRFF+tQ3mrWN+
         q7RqoRC2qHrGUGW+gez/3BwfTON4+D+YrYChLt3MKcCDT44b12+kIE+2xI4w9bdLBJtG
         2xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QwU9+5+gvfEazdlJRI6h2A4dYCJQbZyj893LjNveIRQ=;
        b=euA1AHY2vtXG99jhTz8gMSRB+JJPkSahGPUzDexS36GibsGy7aoNgHP0qXStu3rGwz
         MYjXhOS7Em4yLiVAZZydWQsA90KVy9xNtTX2upuFTMcKtVh7YCKPYHD9aK//VnoqK4AI
         DvDb2XrzTFJjWeer2eykDVt6Lm16nw47HXBDL+646DmCkRS7/4RpMJheKX4yV+qURHxP
         V0bdTeZpK1tjCamd165VWWCaBK/r6sORO2LqNb6ukMOw8ruy+bkOEfnzVYRyXCCiQiiR
         rGlkybcYh9NvnfJMb24dlJmorldSYnkOgbqUxk8YWXf9cM/6a5MGYZYoYcWrwTPuN/V/
         tM6g==
X-Gm-Message-State: AOAM532soebdAti4XF/jHJrSJpi4Ui/2GHojNU/LBlakmMgyQaOyFK8D
	k4BJooDTZbK8jb1nBmzX4dedivoFt3ONLQvXsEg=
X-Google-Smtp-Source: ABdhPJx58AcWa1San6fKYiLSNnp+qSTcY1I5TLeDbuR/a1DRdhAApislQAtxdSuaL9X3rC17JJ8hdRYZu5FV9Jyn5+8=
X-Received: by 2002:a17:907:c19:: with SMTP id ga25mr32499501ejc.33.1622019125074;
 Wed, 26 May 2021 01:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210526002744.3683697-1-douglas.royds@taitradio.com> <20210526002744.3683697-2-douglas.royds@taitradio.com>
In-Reply-To: <20210526002744.3683697-2-douglas.royds@taitradio.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Wed, 26 May 2021 09:51:54 +0100
Message-ID: <CANPvuRkM5FqLWRFAeWpi9ckhwcL-tcmur7OjW5bQwhcAPxCUug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] Revert "icecc: Don't use icecc when INHIBIT_DEFAULT_DEPS is set"
To: douglas.royds@taitradio.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Instead of reverting we can add an exception for the packages you mentione=
d:
gcc-cross and friends, binutils-cross, and importantly, the linux kernel.

Douglas via lists.openembedded.org
<douglas.royds=3Dtaitradio.com@lists.openembedded.org> escreveu no dia
quarta, 26/05/2021 =C3=A0(s) 01:28:
>
> Although this silenced the warnings, it also turned off icecc for
> gcc-cross and friends, binutils-cross, and importantly, the linux
> kernel.
>
> This reverts commit 0315aabeff8e6483b737d0e23d6841f1394ad3c8.
>
> [YOCTO #13863]
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/classes/icecc.bbclass | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index d095305ed8..0dde960e7a 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -138,10 +138,6 @@ def use_icecc(bb,d):
>      if icecc_is_cross_canadian(bb, d):
>          return "no"
>
> -    if d.getVar('INHIBIT_DEFAULT_DEPS', False):
> -        # We don't have a compiler, so no icecc
> -        return "no"
> -
>      pn =3D d.getVar('PN')
>      bpn =3D d.getVar('BPN')
>
> --
> 2.25.1
>
>
>=20
>


--=20
Best regards,

Jos=C3=A9 Quaresma
