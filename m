Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6D9CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 16:21:01 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.43175.1697214053553874445
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 09:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FpGNz90c;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5079f9675c6so408056e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697214052; x=1697818852; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQ3T/klmgYSgw4cuaZ2MA9bVweZdBQ3gtPNJaLyS8ss=;
        b=FpGNz90cNVlIh6Wg9CBRMSf8WtVNU/LkcRyEgk8ekOqo+AXVPrvnbLUO9DYLedts5J
         BuqjxzL8aLXj1RXVyoSvFg0aBl5s3dWgyIAOHOaCoPd6/AmPbzM8wi+qYF58BNFJWQzZ
         oR6oHF/tEpTCP2M5qDJcW6g4CxcQdHLXFx6jm/HRlsW1CSiTLdc9daLpRHA8SSICGr05
         suy55ltY+Q8nhc2RgotIsVYRM/7b93AqoshyX15YF3lQzodQ36VVxMtyTKKY+YuEYYbc
         j8hqexIKAsVVqzJG9HqK/FYgLujrBIKjrFmT5c41iY6WAhv/+TMnskvchDAzDOyP2yf2
         7jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697214052; x=1697818852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQ3T/klmgYSgw4cuaZ2MA9bVweZdBQ3gtPNJaLyS8ss=;
        b=Ig+qigr8QZgR0CbANywQRC64fkIu+gdTW2x8rBTeDITxHz98DuwCqia0s5ZoacV+nq
         E7MORwHWwsfdkY4T8y1EVswiYjgKUu8c8qXCTmCnn49zZ2Rj0kqaATDi/deOeksvvQ+r
         L0vBHZXVRIzU+jOVHBHgppNFN6UReyBa3quUpfAtU/YvZ/4w4RWbr3fdkacvkGSyCNkJ
         H+KyPm/U5h668DBXocqLCIx4iEKsFBDj5u5W8dp+6MBVMRxu2jvg2q5JRmBUpZhyAaSB
         Q37AIPwFBxrBthDB1l+vC4ES9zPiUV2/DQFk2BhdGx7DzCGfaBSegQPXi6su//T+CAVz
         DaEQ==
X-Gm-Message-State: AOJu0YyG6NrysAhdg1Uic8W/CttbdPIEw66qaBE0syK3bJ3Uk468lyKD
	heP95wyTD+s5Xv5s7JzLMKjAbHZM7L/4SlI0cjI=
X-Google-Smtp-Source: AGHT+IHkop1p6l6inTXuA0yR+PIgkQsIMutcceh0q0/N45+w8v6JhgPe+Q/XmT0EMM8CP/12Y3qgku9Rb2UU9GOyrPk=
X-Received: by 2002:a05:6512:1583:b0:4ff:7602:5879 with SMTP id
 bp3-20020a056512158300b004ff76025879mr28690231lfb.55.1697214051392; Fri, 13
 Oct 2023 09:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231013154214.2233184-1-jose.quaresma@foundries.io>
In-Reply-To: <20231013154214.2233184-1-jose.quaresma@foundries.io>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 13 Oct 2023 10:20:38 -0600
Message-ID: <CAJdd5GYinqs0YBjc+DqF+0GQ8ijnY9MOaHN1U7Zu-wkqCGBv_w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] create-spdx: fix do_create_spdx cannot find any
 SPDX file for recipe
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 16:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189073

The dependency chain here is a little weird, because do_create_spdx()
depends on do_collect_spdx_deps(), and the do_collect_spdx_deps has a
deptask on do_create_sdpx to get the dependencies from upstream
recipes (read the comment in there for why that is). We avoided
recrdeptask because we _should_ only be pulling in SPDX documents from
direct dependencies, so the "recursive" part _should_ not be necessary
(which is why we use deptask instead of recrdeptask).

That being said, there is a bug here somewhere and I can't quite
figure out what it might be and I'm having a really hard time
reproducing it; but I'm not sure this is the fix.

I don't think

On Fri, Oct 13, 2023 at 9:42=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
> Given that we need some SPDX files produced in other recipes by do_create=
_spdx task,
> we need to ensure that any of this other do_create_spdx build-time depend=
encies
> runs first to produce the artidacts we need in the do_create_spdx of the =
current recipe.
>
> Fix the following which especially affects multiconfig machines:
>
> | ERROR: flex-native-2.6.4-r0 do_create_spdx: Cannot find any SPDX file f=
or recipe autoconf-native, True sstate:autoconf-native:x86_64-linux:2.72c:r=
0:x86_64:11: sstate:autoconf-native::2.72c:r0::11:
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index b0aef80db1..a37245bdba 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -709,6 +709,7 @@ addtask do_create_spdx_setscene
>  do_create_spdx[dirs] =3D "${SPDXWORK}"
>  do_create_spdx[cleandirs] =3D "${SPDXDEPLOY} ${SPDXWORK}"
>  do_create_spdx[depends] +=3D "${PATCHDEPENDENCY}"
> +do_create_spdx[recrdeptask] +=3D "do_create_spdx"
>
>  def collect_package_providers(d):
>      from pathlib import Path
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189071): https://lists.openembedded.org/g/openembedde=
d-core/message/189071
> Mute This Topic: https://lists.openembedded.org/mt/101942902/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

