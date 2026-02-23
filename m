Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5D4EA4FB6
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 12:27:25 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34075.1771849636689649603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 04:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wmu1PZZF;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c6f21c2d81so411840185a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 04:27:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771849636; cv=none;
        d=google.com; s=arc-20240605;
        b=NcPXG2PPcRZPv+qppUrn49DWa347Iw2KpQMa0VeP8AX00bQIsv9k/9QAVhHUYe0SnQ
         wMOAYY9Tg88GFwCHVuCXCIqDHi40/yXTAiBpKLyj1Q+nNXVqTIe2MC2i0SPj0pOQJIBZ
         2QmZeCeXjcwFji11mmm73nR31DIhTsCF9ka66V7MHZzXtuxkLgpseWUhVm6kv0ybyz0H
         hLW7RbCwBMUwwKmvaUAq5qewVWdWYj9cU6cqkGJOLd4GMGVpexZuDTkZuOLNdNrYJFCS
         bTTEy6cOQaqtRHV+eS33/Fbo7EoPxDNTeF3M7TdESu7gUUwf+0lXpgG5+x0ewFF1TjcV
         PjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MQ/N08oial6ETPTajlXHBNbBls7axEQc86Ju5i0ncXw=;
        fh=Kqj7KP/l+C/63FyeBp5bXK/skjrI48FqYsFwOsNLLwQ=;
        b=gB3axazvnVd0J8rZqYhxLrAPEUXYQ56OE7rcKTNhxVusK8Isv+0/IX50G2eYG77A6o
         6gHTMtVAysWsqV78Tl+sxQ6rNBX3zGlfAi7FnLTs6u+sMkfZ90Vsr2JOU0O2DbuV4FQo
         NozOBSQk5MAH/DA/dOQw5BoS4Ar/nn32T0PMEjkb53Rb6x/BkL6ylc+vCYQcgF+c9Wxf
         AU4w0uhZupC/Jp4Gux+moTgwJyEAm6cS2f6B42EKyDfz7FTGobGaFsK5xKGhZIXpeI8a
         IzYiM1lVlnWBtmJZEdqQMSONfNojY8n+BB5hh/Fjd40WVRNkmQPVCutm0cJpQEbEJ24B
         DAqQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771849636; x=1772454436; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MQ/N08oial6ETPTajlXHBNbBls7axEQc86Ju5i0ncXw=;
        b=Wmu1PZZFWs3WkQ502xlzSltcBnzF5rsMcKBPvsplQWmP9U3egKFB9oUpobcw+dmJgd
         yYqSIs6tUBV1Paw+vc6PM5naHbEJA7hR3HnNRr163YAVA7RhQLfv1bm2HjrSX4d76WuW
         R+jEcgApDFteN99yk2h5CJMBut1KELI39qHnRj2KZqz2vRPdAMhJYeMBM63LnfltyAmg
         mnqW8PKfq9gEPXi/1jdZWfoD7N8bXjmHLkqKW7OBFmvzj3rfIN/qVuOj5F/fEHmpOUYd
         8ZyUz/3+L3xa3IJe0e/3MAhpoD+G6iV2QFCRm73FfSy/S+a/SN3xIWcgPRD6Y+BSqYAQ
         Glyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771849636; x=1772454436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ/N08oial6ETPTajlXHBNbBls7axEQc86Ju5i0ncXw=;
        b=DfzSWAzUusSDAyXmuiJFaX6nmwcij0p7jGXQMJ6uYXypP7K22I7uElFpK6HfCZsVT7
         jiNWQ4ZVR1g7cFwLMYs5oRHcHpf8DYQhDRT6mVIaGSBrxfhAQ+MD+ehKUNyLMw4NfUct
         535q7kPVl0de4ZGOK0gbnYl/p9LciJbrv6OJoNMBKzRZOJXgq3ngtM8h//RxNKRih6CU
         TRJGH2g5VbvQDeCpizipGRVTp4QKDz33ryaW4fpotR+Hpjbkl1D/xviihqdBSafmDGGG
         k0UqWCWebJ3RoB+A8Ff7u4zujkKiIF5Py4raZwXbMxTYhYfseC/D0bedpYp9tTDIiHf5
         hSPg==
X-Forwarded-Encrypted: i=1; AJvYcCWKuzJSOqQUQd5bFXCHMmxUmqk8UgzNuorBt8hvA0eIsLkdyg6gcn3Zvv/+p8aqY+Ac07cPlKYnmERtRUFrnU8Pcg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyAZHpbwfVr4L8mXJIBe2Leb8zPmrmmLH5MiEBQoBpAD7vNvnEd
	ksdodkvWJXWUqhWWSilLaIhdzuDMNJXmtqdWqYHUwGwanzYgKvfYTx94rZleh47tObOrMYK7rqT
	/8TdCiHcLJlR78sz39H13z6/mgtjPGWg=
X-Gm-Gg: AZuq6aJP2BPFQpDbOiPODOKlKoZhGhr7bwSOc1eP38Zj2klda2qqXLmHbjA/VGDHSM0
	aztMpL6Q/6xlxhZKkRGcB0s1rn7K90pylj8Z6Oj5mATrfu1FpX+cioelQdmfd+m6kN9X/NDV7Ie
	jZ6vCpyDzfBEEdvzqWZvaJl+wSePidVQjLcEh1MIVjdQZW4oYaezTNiEedKggkBcZuMZSx5Zw+z
	kSX3fxmI3YKW3P4HazLQq7w/AveYtj4WfgJHmzqN6g1spC/ybEMpeg83qenV7+0Vj0yl2ZozYlb
	o7l3twj9LYbMQU0BzgDBoLiMQTNZSK7sP+VAKFUySg==
X-Received: by 2002:a05:622a:450:b0:4ed:de14:b374 with SMTP id
 d75a77b69052e-5070bd06a85mr125752651cf.64.1771849635567; Mon, 23 Feb 2026
 04:27:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771409846.git.liezhi.yang@windriver.com>
 <DGIA0D4P60DI.1CA8PWS58YCCF@bootlin.com> <212e8187-1b6f-4c2c-8d57-97cc66387c56@windriver.com>
 <DGKMRZ496JHU.1T1MJETE5VNUN@bootlin.com>
In-Reply-To: <DGKMRZ496JHU.1T1MJETE5VNUN@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Feb 2026 13:27:03 +0100
X-Gm-Features: AaiRm532fQSWXXNwVSborCAVg4gfSO-YvQkp2Ey1ynXq7byO3ky20uLMvAKwyS8
Message-ID: <CANNYZj9DHuV3rmaAsZsPcbZ2ZsbMrNe+keNgVazav=3hUnYQKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 0/7] rpm: 4.20.1 -> 6.0.1
To: mathieu.dubois-briand@bootlin.com
Cc: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 12:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231666

On Sat, 21 Feb 2026 at 13:15, Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:

> > I'm sorry about that, but I can't reproduce the error, here are my settings:
> >
> > PACKAGE_CLASSES = "package_rpm"
> > MACHINE = "genericx86"
> > DISTRO = "poky"
> >
> > $ bitbake core-image-sato -cpopulate_sdk
> >
> > I checked
> > tmp/deploy/sdk/poky-glibc-x86_64-core-image-sato-core2-32-genericx86-toolchain-5.3.99+snapshot.target.manifest,
> > All the required packages are installed correctly:
> >
> > flac-dev core2_32 1.5.0
> > libcomps-dev core2_32 0.1.23
> > libreadline-dev core2_32 8.3
> > libogg-dev core2_32 1.3.6
> > libxml2-dev core2_32 2.15.1
> > ncurses-dev core2_32 6.5
> >
> > I also tested with IMAGE_CLASSES += "testimage", it also works well.
> >
> > Do you have more info on how I can reproduce the issue, please?
>
> I tried to reproduce it locally yesterday, and I had the same issue: the
> failure did not reproduce. Yet I tried again to apply your patches and
> got a similar error on the autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3218
>
> I will try to investigate this next week.

Note that the autobuilder enables the
'core/yocto-autobuilder/autobuilder' fragment, which contains
significant SDK tweaks:

SDK_EXT_TYPE = 'minimal'
SDK_INCLUDE_TOOLCHAIN = '1'
ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
SDK_TOOLCHAIN_LANGS += 'go rust'

I suspect the above may be enough to trigger the issue (or maybe if
you enable the whole fragment).

Alex

