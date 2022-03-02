Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E97EC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 18:46:18 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.1414.1646246777680140875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h3k2kjj0;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id v5so2073418qkj.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o6tlCfKmdVPisrcxLUF+lDkugkRmE6M1QLXD+XGUR7Q=;
        b=h3k2kjj0BljUd3tFIi+ZQXqhiasPjbg3OsMYnIaHUgXrczoZlX31U0ruMNXm5rGSHm
         PxkxKusm8lulzqNNdo1cMNdYINJilz7EmrBXCSXsirLcMzgc6vB9Q0QTyX+O/99ihkNj
         1OMWBNTbaWMqZGRoUjpsA+FyJ+FkB1npCyxRJ+uBvbSKofGLnMCxU/eVuqOZddSJbVLW
         T4cLimKjF5InqekYccjzDVTkAdXuw7/j/w1gozzGfgW/N9rtJsy1Ed/PIRoOpiD1ZABQ
         83Q7bVzcbio7QRe8NlwySkuzAQ/4VZtdhvUJ3JHYOd+kBqfoVu6MlaYNgyDsc+Rt8UXj
         rPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o6tlCfKmdVPisrcxLUF+lDkugkRmE6M1QLXD+XGUR7Q=;
        b=uo9hiJse0XRDbVl7VO4ZoQzONtWa1tMIcROryEoxPRmsSUrrR2QJ+z29i3+MsMDYfQ
         mCzg+k9pBDOV5YdVFvHOhn0EFiX1iqN8Mc91GjSSK/7xS9D1hlpn9+zS9heAJxx1O5V9
         TjHCs0gD0wmS0ROwDt+s3nJYim3EmYUWL4De8hd2NSFittAvewUMpjRbjDTZaCRsWVeW
         uISsnlehK9oq3h2WeTyNypAqhO3aMa965Vg/38wFYY4zo0jLrb5IG/SktPYuECzoQZvD
         SMrAHMlPhESqY+Oewbo0iUO5x0cnOos3ONg+UoMcyuDa2U3lRL+WU2gt1g7lwP9YjGYM
         0+Mg==
X-Gm-Message-State: AOAM530JtmSVu/8DiK9cHn1FcDl8ravMyHCJAvAOHluGLcG4cGkO/m3q
	U4O5j/TbXg04T/QfZngQilWx9mh+iQsE9LbsPt4=
X-Google-Smtp-Source: 
 ABdhPJwiPJ0J7A4OMfyan66SAbzaO02nEb+QLGyhy5nLYDunUdA6SC1VET1gVZPDgRXvxL3m7jaSvzLDcRnxjTynhfg=
X-Received: by 2002:a37:b541:0:b0:475:4524:bb4b with SMTP id
 e62-20020a37b541000000b004754524bb4bmr17412981qkf.149.1646246776729; Wed, 02
 Mar 2022 10:46:16 -0800 (PST)
MIME-Version: 1.0
References: 
 <AS8PR09MB464554B9B604C0EB0E3FBB1DA8029@AS8PR09MB4645.eurprd09.prod.outlook.com>
 <CANx9H-BhZVaYekYpoqT3P9Nbvd-bWiXixXkfhEmtg_FWXtr8nA@mail.gmail.com>
 <CAMKF1spMpkHH4-LpH6Fe=tcg+WM30x3_+0-ZHiDRnvCUqGOquw@mail.gmail.com>
 <CAAnfSTsU3h9tS=A8+cyJaDP1UQ350oEOHY18BCGRiaSTBwNvkQ@mail.gmail.com>
 <CAMKF1spreuzybUvdA-2o_J6Q4pFoFdSQMrc3LN89DWOs0BW7zA@mail.gmail.com>
 <16D881D0D78DCA29.25756@lists.openembedded.org>
 <AM9PR09MB4642BEA4F3119E5652ACD6E7A8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642BEA4F3119E5652ACD6E7A8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2022 10:45:50 -0800
Message-ID: 
 <CAMKF1srTWtYeSO-0vcJ5=RM0xz+5BOoRse-vbyDqSJ6kk-MYqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] pip_install_wheel: improve wheel handling
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Ross Burton <ross@burtonini.com>, Tim Orling <ticotimo@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 18:46:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162619

v4 is definitely better than v3, I see one case it could address as well e.g.

python3-pymetno produces PyMetno-0.9.0-py3-none-any.whl, so if
guessing code could address the case-sensitive piece here would be
good.

On Wed, Mar 2, 2022 at 1:21 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> v4 is out.
> I tried to make it work with the dist-dir/bdist-dir option, but
> apparently this isn't respected by setuptools in all of the tested recipes.
> That's why I went with applying cleandirs on
> ${SETUPTOOLS_SETUP_PATH}/dist, that should do the trick as well.
>
> v4 is tested against all core python recipes, all the python recipes in
> my layers and a reasonable subset from meta-oe
>
> On 02.03.22 09:06, Konrad Weihmann wrote:
> > My bad - one of the brackets in the name guessing slipped...
> > Will send a v4 soon
> >
> > On 02.03.22 06:20, Khem Raj wrote:
> >> this is causing 100+ packages to fail see
> >>
> >> https://errors.yoctoproject.org/Errors/Build/142116/
> >>
> >> I suggest to include meta-python for wider testing of such changes.
> >>
> >> On Tue, Mar 1, 2022 at 12:14 PM Ross Burton <ross@burtonini.com> wrote:
> >>>
> >>> On Tue, 1 Mar 2022 at 18:48, Khem Raj <raj.khem@gmail.com> wrote:
> >>>> where the wheel file is called
> >>>> pytest_runner-5.3.1-py3-none-any.whl
> >>>
> >>> I'm thinking we should tell pip to install the wheels to a directory
> >>> we control and then just install *.whl.
> >>>
> >>> IIRC the option was --dist-dir, and we can [cleandirs] that to ensure
> >>> it's clean on builds.
> >>>
> >>> Ross
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#162595): https://lists.openembedded.org/g/openembedded-core/message/162595
> > Mute This Topic: https://lists.openembedded.org/mt/89472354/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

