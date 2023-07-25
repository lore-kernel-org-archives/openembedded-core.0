Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B248C0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 10:28:43 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.17091.1690280913537001976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 03:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=od5vZlf1;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fdd515cebcso8211806e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 03:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690280912; x=1690885712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1luiBYNA5CL+n9v0hCwTG7lMQPh7hoyDhXUqA/v2yU=;
        b=od5vZlf1rEMARnDPreIgaQqfBwmiy3thMi8xpI+IZ4dGudY3OfZYrTK45Sxw5UCkpm
         5JiXdFLPmzIr/UuXwlknsmuUfr5PI3V2efcCGWjyTvg9gEjyRHHgBtS4wSfA7WaTYcB+
         45OJ6/1M/VT7YQ6ZA8Lgylx5oZ2wG5oCU/MMLGOFK0CY9PjnyJKrhzI+c48zkeodIRP0
         MjUXCy/zHLwortjElz9HD/S+8Ext/WnnYkneBVauw7J9aC20lxiYCrF2yw/m2nDePlNw
         MOapXiP6ydgfpLrMYzwzcV/KVkd4rZWtw4X9F3L8S5Z25cP/LjifH9YxKZCsXGOIGlAn
         PE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280912; x=1690885712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1luiBYNA5CL+n9v0hCwTG7lMQPh7hoyDhXUqA/v2yU=;
        b=V4m4I5EF6RjngmJzeJ/VZJTJPOho0yJIm8XNmGcOxXQCX1Z/djGjM6/VAvtVlLsTqN
         AD6KYGdnX5d9wwcB66Ja+WcVzyduKgfdL8v4esb6UDZ51xmnZG9GUCG3kAqcz4Mwr8wY
         BT0p96Mi6DfDTUsGoB7nMJrY9f8J6KoJOLBvkZWND8uCp5N4NAnjnnsTeToQynAD96Eb
         DV4XZGqUfrW6s1uwa3St6Mq0cJLF9OBpeGBp7DLn3BgM4kCre3WN7B+m598bQF2yTxqW
         X2DNkf1dKwUtw0s1D2Mdm92jDXI6S8KqO0xoSIPHbWKsR1cHYn5qDBVZk3IL1Q15Kt9k
         Jmdw==
X-Gm-Message-State: ABy/qLYqI8kQsEVV5BC3EoId/tNi2AXNusmZd1maUYLTHklOBbkPT++1
	ulk0+wcevozjQXNFdgZfIde6JVqNxWLB8WjGfAw=
X-Google-Smtp-Source: APBJJlH24TqChZwT/GVmcV+IV3vzXIobXLZ1uYEJOy9q5VQgxXdOCQjAiGInVvYr7h8bhpQa4SjtuIjK0ZtuLcoqsMU=
X-Received: by 2002:a05:6512:1284:b0:4f8:5e65:b61b with SMTP id
 u4-20020a056512128400b004f85e65b61bmr8333089lfs.65.1690280911460; Tue, 25 Jul
 2023 03:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230724204639.353571-1-p.lobacz@welotec.com> <VI1PR04MB537371C2BED481FEDB533DB89102A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <20230725092837d3f47a0f@mail.local> <177512EFFC81235D.7114@lists.openembedded.org>
 <VI1PR04MB537367B15795A2E226290F849103A@VI1PR04MB5373.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB537367B15795A2E226290F849103A@VI1PR04MB5373.eurprd04.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Jul 2023 12:28:19 +0200
Message-ID: <CANNYZj-g=pozvQ_+PNh-qCTNkU4DX1M0hKhs4L9EnmxCBAU-FA@mail.gmail.com>
Subject: Re: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
To: =?UTF-8?Q?Piotr_=C5=81obacz?= <p.lobacz@welotec.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 10:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184832

On Tue, 25 Jul 2023 at 11:58, Piotr =C5=81obacz <p.lobacz@welotec.com> wrot=
e:
>
> Yeah, I have just checked it for acpid-src packages and diffoscope worked=
 without any errors.
>
> Question, is this test being run with acl or/and xattr? Because from what=
 I remember it was not. Can you check?
> If this will confirm, then something is still wrong with the gnu format, =
because right now all posix - meaning with acl/xattr support - packages are=
 working for me.

Hello Piotr,

may I suggest: you need to learn to reproduce the autobuilder failures
locally. Integrators are stretched very thin, they juggle a ton of
patches (other than the ones you want to get in), and the expectation
is that when they tell you something fails, it is on you to do further
investigation. Here's how you do it:

- start by finding the failed build in the list of their definitions:
https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json
You can see that it's this one:

        "reproducible" : {
            "MACHINE" : "qemux86-64",
            "SDKMACHINE" : "x86_64",
            "step1" : {
                "shortname" : "Reproducible Selftest",
                "EXTRACMDS" : ["${SCRIPTSDIR}/checkvnc;
OEQA_DEBUGGING_SAVED_OUTPUT=3D${BASE_SHAREDDIR}/pub/repro-fail/
DISPLAY=3D:1 oe-selftest -r reproducible"],
                "ADDLAYER" : ["${BUILDDIR}/../meta-selftest"]

            }

What that means is you need to set up a plain poky build (no extra
layers, no custom configs specific to your organization), then run
'oe-selftest -r reproducible'. That is however a heavy test as it
builds everything, so we need to narrow it down to just the failing
pieces.

- the failure log shows that reproducibility is tested via
meta/lib/oeqa/selftest/cases/reproducible.py. If you open that file,
you can see OEQA_REPRODUCIBLE_TEST_TARGET narrows down the targets
used to test reproducibility, and you can also set
OEQA_REPRODUCIBLE_TEST_PACKAGE similarly.

- now you can run oe-selftest -r reproducible. Once it finishes and
confirms the failure, head to build-st/reproducibleA and
build-st/reproducibleB, to see where the difference first appears.

You can also replicate reproducibility test by manually setting up two
different build directories with identical configs.

Alex

