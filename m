Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724CBC46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 14:24:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.82400.1703600642697312918
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 06:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZZ3k2uBp;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.53, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d5a9cb423so5248285e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 06:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703600641; x=1704205441; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnBX/nqyo5LaLw5J344EAYQW7+bKWiIVfLD4bgsurJA=;
        b=ZZ3k2uBpC7L0hWKpUIjw3kvR6SNWeaLOZmEYOBZboAF/WDcwYzGOEXfaWv2t+gnm+J
         RXzDleT7S0+MLFh1JC5J+LbixA2bq8qebFJhF87j2MnV2GIN5i207TLMCjQZN8VOAmll
         G7c+Dn8kaUYvmW20BaG1zVV39ddn6a93GLq5OxVVYAz0nC1lFZy/kZ5i0+zInNwT3YFw
         JGnubSlOsfreW1EXTa8Y/AwBPka5dp/h0B+ncd+KAXeh20uLvoKX0gyA9mUG34rPcUBA
         h9cxLweL6SAWCVOVs/tbho7ZQr7cZQdF09kKa1+4FHNUbR8tS+IudId+NTMzoImFvo1z
         xpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703600641; x=1704205441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnBX/nqyo5LaLw5J344EAYQW7+bKWiIVfLD4bgsurJA=;
        b=Y9mpVzxOCdFkIITWWWZ4NxhoSofDenxGSPWmXhdnquH+H+khSZ+sWXXySA/K/xffk9
         /avnVjD7MH0LLNCBVMsKhHCC0y1UbSExE+CIXtiT4DaSz6QjvSzoRFQ10QjogHJWBJtK
         TNjn//+onYhpVU5HjF8Mc/ES62eiLShHASnOFH50lkDssda07D8DG/Ty2cnhxoULPYFJ
         9XyeqxBgDdh4Esoxe8+dbb5i/4ithUo9nAYqo16Z7Aaa3QHw56fcXVK34yg8wxD8lUBW
         G4GV8JXGRwnRpezOT64E6C86TraT546k7yshW3kZEjgGb30sPmAPTfyf3gf9OV/n1Xs0
         TAwQ==
X-Gm-Message-State: AOJu0Yzy3mWrELY3suJcjc7of0zXspH8pqr2x+XjQdwhlM4rj+AE65yQ
	D9pnmPCtz1yiUp+d1H2vIEs0xChnSMG2tm0GQuLP2zlEqGUwKA==
X-Google-Smtp-Source: AGHT+IFSsjyvTmlOMlzbzU4uk6ZOL9HRNiviP5Cb518OJAPuZIBNswRaTDtPb8Uwffj4tbE41rg9JMhViRys2oiH7n4=
X-Received: by 2002:a05:600c:3844:b0:40d:58ca:c0a8 with SMTP id
 s4-20020a05600c384400b0040d58cac0a8mr911850wmr.31.1703600640555; Tue, 26 Dec
 2023 06:24:00 -0800 (PST)
MIME-Version: 1.0
References: <20231222060422.10559-1-mail2szahir@gmail.com>
In-Reply-To: <20231222060422.10559-1-mail2szahir@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 26 Dec 2023 04:23:49 -1000
Message-ID: <CAOSpxdbkSogKMBWg+jBX7K9w0aXzjWp0cVwnpXPt-UfC7kzKbA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] alsa-lib: Enabling ptest for alsa-lib component
To: aszh07 <mail2szahir@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com, 
	Zahir Hussain <zahir.basha@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 14:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192911

Sorry, this is a feature addition and not suitable for stable releases.

Steve

On Thu, Dec 21, 2023 at 8:08=E2=80=AFPM aszh07 <mail2szahir@gmail.com> wrot=
e:
>
> From: Zahir Hussain <zahir.basha@kpit.com>
>
> This change adds ptest for alsa-lib.
>
> 1) Adding CFLAGS change for include the header file path for resolving
>  below compilation issue;
>         In file included from ../../../alsa-lib-1.2.1.2/test/lsb/config.c=
:4:
>         ../../../alsa-lib-1.2.1.2/test/lsb/test.h:5:10: fatal error:
>         alsa/asoundlib.h: No such file or directory
>         5 | #include <alsa/asoundlib.h>
>
> 2) Removed the test suite execution 'make' call using 'sed' command.
>
> 3) Compiled the test directory source code using "oe_runmake check" comma=
nd.
>
> 4) Copied all the required binaries into PTEST path using do_install_ptes=
t()
>  function.
>
> Signed-off-by: aszh07 <mail2szahir@gmail.com>
> Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../alsa/alsa-lib_1.2.1.2.bb                  | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index 3fb7ec2657..b74e18a322 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -5,6 +5,7 @@
>  #
>  PTESTS_FAST =3D "\
>      acl-ptest \
> +    alsa-lib-ptest \
>      apr-ptest \
>      apr-util-ptest \
>      attr-ptest \
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb b/meta/reci=
pes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> index 4867c798b9..3f772360f4 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> @@ -52,3 +52,22 @@ RREPLACES_alsa-conf =3D "alsa-conf-base"
>  RCONFLICTS_alsa-conf =3D "alsa-conf-base"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +EXTRA_OEMAKE:append =3D " AM_CPPFLAGS=3D-I${S}/include"
> +
> +do_compile:append() {
> +       sed -i 's/^.*$(MAKE) $(AM_MAKEFLAGS) check-TESTS.*$/ /' ${S}/test=
/lsb/Makefile.in
> +       oe_runmake check
> +}
> +
> +do_install_ptest:append() {
> +    for f in control client_event_filter namehint
> +    do
> +        install -m 0755 "${B}/test/.libs/$f" "${D}${PTEST_PATH}";
> +    done
> +
> +    for f in config midi_event
> +    do
> +        install -m 0755 "${B}/test/lsb/.libs/$f" "${D}${PTEST_PATH}";
> +    done
> +}
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192858): https://lists.openembedded.org/g/openembedde=
d-core/message/192858
> Mute This Topic: https://lists.openembedded.org/mt/103314286/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

