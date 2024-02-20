Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB86C54764
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 09:03:24 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.9446.1708419803245404211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 01:03:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LF2K03dT;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-511976c126dso6318334e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 01:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708419801; x=1709024601; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjo5D3O/FhIRD3QgRCUJJAPGd3oACSLkfxpnG/IyS4E=;
        b=LF2K03dT3FxsmogqktglkfF/TCYuRNJ1EF+lTaOhXQ/Qy5M6R9CMVsvrECoWrKh0U/
         SlxrSMgvMd2d1B/Vlo90B5qXyaLHTy3hHGm6CjYSIMS1myszUtturysinjRFOgdIWBnk
         Xij9Le36TSKnjUEBuKOxoNMr1Oi/cBdWb7wTYi23FcPgVjaVzH3D7WvHRLU/LtNqbJzL
         TZij44ZItsCjdq1fgTqjdFy/cis9UN9apOBWGHgPxdvQ7GTTBESEB/J1G1Weg58mNLBg
         tQdrn2juR/hfrXK06fVJYeU0rKWID48POVLUOR8Wz4S207dkJ2027EfwjPSfmRbecWbe
         yl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419801; x=1709024601;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gjo5D3O/FhIRD3QgRCUJJAPGd3oACSLkfxpnG/IyS4E=;
        b=aLB9WeCsyPL0GYEODl5UPrmupBnN0+LW5M7dprMR3wU7Qwq9Exw/t0q3lWeBmIQrQP
         kjVE0nnk2v5V/7bZhpDZeyIdM9GPwgy2r4gvDmamMJHfxoxZhbGM5e+80zHuVTZnlOWB
         Eug/F1YEYqEQTbFb57Q1kfeTx9xXRBbdP50UODyB4ymWkZMRjQYzZqor7M2/tMlZeelV
         XFvs8x0mHJzM9REfSFPdoAg7fUFJoeT3hQov6gqGHdwYJOA0a/GAPYYmjugCZ8EG/wuu
         dKFM4iXm8kReFyHWXFX+9bnLeHF5wNLKSJNsrHlv7cHX9zDFS0h7NrbZNHAthHnwb3mn
         JoJg==
X-Forwarded-Encrypted: i=1; AJvYcCUdGHuMM8iQ+COFoZhKAV9MelG6e+teZshEDtnBWpWTQF0SMrJW4dwNY4DyqFypYUT6WrqPt0xwsElmfMuQpFpw2SX3ddo2bv7v3Ol1Hq83/Ee0Pp/bh3J0
X-Gm-Message-State: AOJu0YyEsNKpmWg4GY5ulL0aL6g32sSmlc4lhDk3yPn1DN3keZgCu9lV
	t0vZzdfAAGSQgJBlICLCr9kjhXXv0VNzT59W3qRbbYWdX6USY3O3
X-Google-Smtp-Source: AGHT+IEaMmSbmLctNCTGtinwT1z8vOZjSc2BTMVTjHtcoyGT8iREXUnhK3VjPvLZJq3bJeyv5NIwKA==
X-Received: by 2002:a05:6512:11c5:b0:511:a2ed:f6c7 with SMTP id h5-20020a05651211c500b00511a2edf6c7mr8501342lfr.11.1708419801056;
        Tue, 20 Feb 2024 01:03:21 -0800 (PST)
Received: from [192.168.113.175] ([178.197.195.255])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c014300b0040fccf7e8easm13735584wmm.36.2024.02.20.01.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:03:20 -0800 (PST)
Message-ID: <ff4b525bfe4e97abc41975a354784cc1f25f44a1.camel@gmail.com>
Subject: Re: [PATCH v2 1/5] devtool: ide_sdk: Use bitbake's python3 for
 generated scripts
From: adrian.freihofer@gmail.com
To: Enguerrand de Ribaucourt
 <enguerrand.de-ribaucourt@savoirfairelinux.com>, 
 openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2024 10:03:19 +0100
In-Reply-To: <20240219165525.714512-2-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: 
	<20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
	 <20240219165525.714512-2-enguerrand.de-ribaucourt@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 09:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195907

On Mon, 2024-02-19 at 17:55 +0100, Enguerrand de Ribaucourt wrote:
> The generated scripts use the sys.path configuration found inside
> bitbake. It can be a different python version than the one used on
> the
> host through the IDE.
>=20
> For instance, when running the generated script
> deploy_target_cmake-example-core2-64 from an eSDK generated on
> another
> machine, I got the following exception:
> =C2=A0=C2=A0=C2=A0 AssertionError: SRE module mismatch
>=20
> We need to match the sys.executable to the sys.path.
>=20
> Signed-off-by: Enguerrand de Ribaucourt
> <enguerrand.de-ribaucourt@savoirfairelinux.com>
> ---
> =C2=A0scripts/lib/devtool/ide_sdk.py | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/lib/devtool/ide_sdk.py
> b/scripts/lib/devtool/ide_sdk.py
> index 3986dc1436a..14679744807 100755
> --- a/scripts/lib/devtool/ide_sdk.py
> +++ b/scripts/lib/devtool/ide_sdk.py
> @@ -750,7 +750,7 @@ class RecipeModified:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 does not need to start a=
 bitbake server. All information
> from tinfoil
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is hard-coded in the gen=
erated script.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd_lines =3D ['#!/usr/bin/en=
v python3']
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd_lines =3D ['#!%s' % str(s=
ys.executable)]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd_lines.append('import=
 sys')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd_lines.append('devtoo=
l_sys_path =3D %s' % str(sys.path))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd_lines.append('devtoo=
l_sys_path.reverse()')

LGTM.

Adrian

