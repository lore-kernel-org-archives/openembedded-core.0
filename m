Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92C9C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 06:38:33 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.71076.1705300705025946075
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 22:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IXoKl3wl;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ccbc328744so100685911fa.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 22:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705300703; x=1705905503; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AN9jPqCFGp6u82zc2iDnJhA4niKHDVGljrJP85Ak++8=;
        b=IXoKl3wl3E+b1zQTJFSLmDlQlR3s+VlVq7taSD04B6HS5kOmiiUqX2JWYMonKVf9A1
         6B11MNcG1sDQT/Fiz/3ysnl1BD+aptpaWVX433RxnPwGkOnuPsw5NGbEJ+t+2QCLJXtn
         7y+OroIT0k92sjiY7hjP45jAAw/rle3l2eAUAQEu6kaVTj0soZSVaS0YzTOWEdSWocnM
         M1HHvK2fhDxyrRGW4UH+KUVqrtFa+6y4Uy8sXDve9a4EpzJX6hvUU0T4s68NmiznvmQC
         V9E/OrOT6Ug3oJp44R2nOtPBSV278Dr2MFnLi/3f2voy6tjyaqJAwH15TnW8gpyQ5U2l
         kIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705300703; x=1705905503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AN9jPqCFGp6u82zc2iDnJhA4niKHDVGljrJP85Ak++8=;
        b=HTrrTJZ65uPo3t0RiR18Qr1c4wXQ4pXZyFgHNO3AfNGTA45lK94yEZr+vy8lDiXKn6
         161huXpANXppMeiKY1H/weMr2rf4mLlKsR90eFEDrF98d1XNBZ6ijyiZwMDvAygR4rZG
         GgyyrTtfAabrEi0PapeTwneB7OTFz7v9+9yzjjBfl1JgtQl2/hdhyDlmW9AQhL1X+abX
         jHgVmtlPYTC62ydSKya+bmHei5xdkxeYGSeI0HM5crSDNCT+dWrdyah/KzTV3hGnVd9F
         3Sg0hUdCIfVM195uxnjXT7eDyjqC3u4PQAzpixe5jvGIqh8oXPzW+QGKpzJva/uTCrSk
         CNKg==
X-Gm-Message-State: AOJu0YyxP/nMUajOPna+0qA3ukxG72OhxOmbza7u3vW4InvUbP8cSgTr
	N8iJ/4Tl2+QxjvLohH7t+5TPOAZKSV5tAzW7B5I=
X-Google-Smtp-Source: AGHT+IHlugUnU0cL6zGiTLZCCUYtnd6WFpdm64SQ7yYzyoTlQ8OK3msaoOXhk5Kn4RyZ9iNadUseLfI00Wgro1WDvZA=
X-Received: by 2002:a19:770f:0:b0:50e:ac2a:6b6d with SMTP id
 s15-20020a19770f000000b0050eac2a6b6dmr1960368lfc.119.1705300702952; Sun, 14
 Jan 2024 22:38:22 -0800 (PST)
MIME-Version: 1.0
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com> <17AA7149AA53F0BC.13033@lists.openembedded.org>
In-Reply-To: <17AA7149AA53F0BC.13033@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jan 2024 07:38:10 +0100
Message-ID: <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
To: alex.kanavin@gmail.com
Cc: Jasper.Orschulko@iris-sensing.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 06:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193634

On Mon, 15 Jan 2024 at 07:26, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:

> I'm also curious about what osselot outputs that can't be done with a
> oe-core class directly? Is something missing in existing create-spdx
> classes? Here's for example what osselot provides for busybox, but I
> can't really make sense of it:
>
> https://github.com/Open-Source-Compliance/package-analysis/tree/main/analysed-packages/busybox/version-1.36.1

Okay, I've read the README file in that repo, and if i understood it
right, the process is:
- run fossology
- have a human inspect the output, and correct it on a file by file
basis (tremendous waste of time and limited developer resources even
when done the 'open source way' if you ask me but whatevs)
- place the corrected output into the above repository

Do you really really need the 'human corrected' part of all this? It
will never possibly cover all of the packages you need to ship and
match all their versions. If not, then maybe using and improving this
layer is a better way out?
https://git.yoctoproject.org/meta-spdxscanner/

Alex

