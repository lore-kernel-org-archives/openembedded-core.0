Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3059C83F26
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 17:16:28 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.86863.1753722982726808466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 10:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UxyTbzRS;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-719c4aa9b19so42145427b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753722982; x=1754327782; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CN4oVTHJ1MpaeU0tQqeswswMW51jki8VwJu9JuHK98=;
        b=UxyTbzRS9Mv4e5ShkUdMcHR6tVAZN0bOCJxMKva5e2tWiFj/wQYa28SpiZngkatiPK
         cZYN8y7+9XN7Q3Fgu3HUrDH14uNFSef1f1GTRykjrc4M4uWqJJ6eSYIaVWt4ZG6YApiI
         /VnnKNR3rAEyUWoyjdRFO1E44jarxAXsrUcw1Sx4CA0zpOzWBJcSpl6Nr9GjmjsW0LhA
         gdTWGOXNi5qvkcUkPPA0GfI+8BHEWT/YkKI6o/SflXgEHFk9PKAb40BxtW/y+p1Hge0d
         uqlG6p07d3HKcfJw7V/G0Aeiz/7iJiMiy4haD51WcwVDqa2radPvO/dBoiPsuCNniAW0
         sGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753722982; x=1754327782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0CN4oVTHJ1MpaeU0tQqeswswMW51jki8VwJu9JuHK98=;
        b=KPxvr9+bAYoFLS+72OR86oIfXAg7U6FdIAuwaRBIgpWS0yII2iD/0/zI3VJWIHUGHM
         lhbBi8CKYX+bc6Hud78gKysa3CTg2Pm9nt0T4GITsufhIiWpxrC2uK3larYQRHuLB+qG
         9cOrUR8TOs+TTJlmoTReSnxMO9uwpId1dElDLxgy6JCgwSJS/8/o7PAWtsEa1K3GBH5Z
         4qlwJgs9ZK9wE2S7eCJM1z5o7Rrjqo84tGXr1q2kGWSGMrhke+6frqAHrJwrNAI+Cikp
         z4QBtWecjB0ktjNPvNDD30DtA+BJtbted7EEFVbAUYX4XmkVkeYWdAxO6rH5sepgZS9S
         Q7lA==
X-Gm-Message-State: AOJu0YwkFjo/gl4+CFcaPor/NO/hLEH7mE89gCLEjipwqFspqJu2c08d
	FL1DqEJQYkwgZDlD5r08l5vVE8NMdWffuM2/tBPWSa4uPt4i2Acj005kHo/o/6wUTDoWdY6a3+q
	AURbKp03tHyOoyRZyte5H4e8/QEtwrys=
X-Gm-Gg: ASbGncuIq7Ybg3Q/sGqDwRf2F+ycZu+oP/WBJwCZLGfXUgVIrhykErbLh7FRW+dfYYi
	JlbUnMxFiKyN+YkZywOR1vAp2xb/tN5IV0nFkIqUPMSRUmZcbEA+KujoA9bxyYiaMTDXe1sD3Ds
	S/h0CLXPNlmGAW/F+VWqMZ0YU+cPghDS1uBq8YTiNvE+VlNXLwl6lTAzv45BQVlorq2GXejDO6s
	9Gj7khy0JaIa/y0baqeQa9OZvtsjYOpcAw=
X-Google-Smtp-Source: AGHT+IGMElT7795qtOxRCYlGWwzrcjR61e2RP7POFhteYIJrmI5QPsdzqC4MnBAncrARHXTjegBUNZdQGdERdN/nMyg=
X-Received: by 2002:a05:690c:6ac1:b0:71a:23b3:13c0 with SMTP id
 00721157ae682-71a23b31627mr49514117b3.6.1753722981567; Mon, 28 Jul 2025
 10:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250728032045.2783514-1-raj.khem@gmail.com> <20250728032045.2783514-3-raj.khem@gmail.com>
 <efc50221-0504-48ab-abf9-0a76e5f076e1@gmail.com>
In-Reply-To: <efc50221-0504-48ab-abf9-0a76e5f076e1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2025 10:15:54 -0700
X-Gm-Features: Ac12FXwBpzogpypgBEaKapD_SVWwQ5BBN9NfB1nVkBbEASiiDqLRalHPr4ecNYc
Message-ID: <CAMKF1sq5dTYOTREZuAKySUFnq3O0BqkGRpG1r7jExMavx=M0jw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] spirv-headers,spirv-tools: Update to tip of trunk
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 17:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221018

On Sun, Jul 27, 2025 at 11:58=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
> On 7/28/25 05:20, Khem Raj via lists.openembedded.org wrote:
> > This is needed for compiling SPIRV llvm-translator from llvm 21.1.0 rc1
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb | 3 ++-
> >  meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb   | 3 ++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb b/me=
ta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> > index 1da2e74f93b..b1cec77080a 100644
> > --- a/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> > +++ b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> > @@ -4,7 +4,8 @@ HOMEPAGE =3D "https://www.khronos.org/registry/spir-v"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da0dcaa512cc2dee95fe0fd791ee=
83a18"
> >
> > -SRCREV =3D "2a611a970fdbc41ac2e3e328802aed9985352dca"
> > +PV .=3D "+git"
> > +SRCREV =3D "de1807b7cfa8e722979d5ab7b7445b258dbc1836"
> >  SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Headers;protocol=3Dht=
tps;branch=3Dmain"
> >  PE =3D "1"
> >  # These recipes need to be updated in lockstep with each other:
> > diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb b/meta=
/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> > index 319b25b7f43..f66b25c60db 100644
> > --- a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> > +++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> > @@ -7,7 +7,8 @@ SECTION =3D "graphics"
> >  LICENSE  =3D "Apache-2.0"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
> >
> > -SRCREV =3D "33e02568181e3312f49a3cf33df470bf96ef293a"
> > +Pv .=3D "+git"
>
> There is a typo in PV

ah bummer.

>
> > +SRCREV =3D "a983ab19d6f91a07a8272767427b6c5208576d08"
> >  SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dma=
in;protocol=3Dhttps \
> >             "
> >  PE =3D "1"
>

