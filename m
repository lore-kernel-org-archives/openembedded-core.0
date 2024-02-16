Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEA1C48BC4
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 13:56:40 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.19225.1708091799736588751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 05:56:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8nELTi2;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d220ad10b3so1053951fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 05:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708091798; x=1708696598; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUKf4YDskiw9PqvVxdt+Sd2TP8detwgZHZ+gXUAzOxM=;
        b=W8nELTi2VRYnrHjoYVIgNdEXNSz8yWsrI5+Qg0Bwdu/eQ+nV4GeQPx94csqJvkFmsI
         aSxEviCHooZxIcvrVqGFONHOUWUjWI1GYHhwnRxHlk5XeZXvWDepU4s/X2wP7zFrFou6
         m5NQn2RbPYg59iyR7tUYnXbb6+xAIf2BaeXg0ZPIoHCtoIkOjLYfzDucogM0/x+fnDSL
         xZ46GRQ1pNf3Nf1KoR7kWkCBdrPMZsrTMJkjLLwEQM9dBVGKhKtP7Bc6E5k4Ho1Nx3RP
         mr3T5QhOsHR2+yd6pFsAQ1zEjyRBRm9KzAeJUH95TyN7SXdyamQvSAtK2Oq9yWa/Xuym
         44MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708091798; x=1708696598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUKf4YDskiw9PqvVxdt+Sd2TP8detwgZHZ+gXUAzOxM=;
        b=ZdnjzhHYJe+X2f66W7PN1ypgxcbWzHUI1B0s1iQFcS4/8Ctj0ayi1lf4dEopg7+a+g
         mGsb+7bfXwPiulfpd5XL0amrB5Syr+1AvOxppUttAQy6NHCKcvUjDmysmnGSeRQEcn+L
         ++THBEAD7dF5vK9U7RN3UilXKAyVw46RS9FGbQtapE43IkSf9gLkmTQqBPsrpTMegw/J
         g9FpJyM9h52sZJhZSxYRbN7jn2Gv27mt0jjHHJov2Cw2iK2JmLV/RFnubLRVSg/O7m1B
         hs5+wEucGMSgpQTdkIMSLJ8uY1Qx3YjTHWW2RUsw/XhT+1IqVwbZq3FA54OMMIzijxRt
         lcEg==
X-Gm-Message-State: AOJu0YzT69HDP+BDegorMxyHkodPOSx/j+KxLYVtBwDf2xzVSZHDFwCQ
	95b8bMIVr0XXd6ALIXZJJxU7TDfYTwplv5E9Xtvs8pMlwYistQJza/PAUBUdX+pjXx8LHdtowDS
	lSLkO6buKnf/Xxnv12DYn9TwtMAk=
X-Google-Smtp-Source: AGHT+IE8b3BtGhKj+LM8xlBSlC8IFVI3R6626ZBxiUq0Osh1i7EKhr2gc5pz42Px5pstQFHpp3itxPpjYPqCI5lp4vY=
X-Received: by 2002:a2e:9198:0:b0:2d0:cfe6:4364 with SMTP id
 f24-20020a2e9198000000b002d0cfe64364mr3614595ljg.36.1708091797644; Fri, 16
 Feb 2024 05:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20240216104551.2122943-1-andre.draszik@linaro.org>
In-Reply-To: <20240216104551.2122943-1-andre.draszik@linaro.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 16 Feb 2024 13:56:26 +0000
Message-ID: <CAO5Uq5SKjGNcnx+nm+=7CHD-N2TxQ8eX+oYE78xEW1TWSdYO-w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] sstate-cache-management: fix regex for 'sigdata'
 stamp files
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 13:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195770

On Fri, Feb 16, 2024 at 10:46=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@=
linaro.org> wrote:
>
> Given file names like
>     6.4.do_fetch.sigdata.821b6c62f9f2bd8b7e1378656b8319697a21f6f6e4a351f9=
8dc325a18ef7ed0f,
> I'm pretty sure we want to match the dot here, not any character.
>
> Fixes: 2fa1b25d7485 ("sstate-cache-management: Rewrite in python") in oe-=
core
> Fixes: b723fcaac52f ("sstate-cache-management: Rewrite in python") in pok=
y
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Ouch... good catch!

>  scripts/sstate-cache-management.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/sstate-cache-management.py b/scripts/sstate-cache-ma=
nagement.py
> index 09b7aa2aefd8..d3f600bd28f6 100755
> --- a/scripts/sstate-cache-management.py
> +++ b/scripts/sstate-cache-management.py
> @@ -147,7 +147,7 @@ def remove_by_stamps(args, paths):
>      for stamps_dir in args.stamps_dir:
>          stamps_path =3D Path(stamps_dir)
>          assert stamps_path.is_dir()
> -        re_sigdata =3D re.compile(r"do_.*.sigdata\.([^.]*)")
> +        re_sigdata =3D re.compile(r"do_.*\.sigdata\.([^.]*)")
>          all_sums |=3D set(
>              [
>                  re_sigdata.search(x.parts[-1]).group(1)
> --
> 2.44.0.rc0.258.g7320e95886-goog
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195744): https://lists.openembedded.org/g/openembedde=
d-core/message/195744
> Mute This Topic: https://lists.openembedded.org/mt/104390352/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

