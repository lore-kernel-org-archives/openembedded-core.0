Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5646BC54E49
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 16:51:31 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.28486.1709830283684353253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 08:51:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GSSqGSEG;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33e6d364b7aso381307f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 08:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709830282; x=1710435082; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqEmLNyCWfQgNI4xMyDsJiVtSknhPDc7PROQ2+wmANU=;
        b=GSSqGSEG224Osric41nbdTBLGtbJkydk2JNSZYe5WzX9fX79rRn51slDvxYL14TkqB
         PmZW/mynsuAq/6eos/ZaNru1pwLNmgix5WPqaFq26/8yzMbT8ip21D42gM0goxB7HYA5
         /tOTOoMD0GSyLThuvMcVwFrLf+JZtoDdABk8GgxAwTK22d6llNvnk1QPRkL+OkuQQwHf
         PHjbvH3fTClJ+rp0bxl2vH0hMPdeJBBhIH4QHiUpa8/Fitt/kr6XEXJAY0hfToG69v1M
         Ei0tMq4DHS/qFgwHaXI5Aa9hiaW4QIC99NlYHuj87DDJLCkqfpQnqlRPCvobvo301IPP
         TwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709830282; x=1710435082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqEmLNyCWfQgNI4xMyDsJiVtSknhPDc7PROQ2+wmANU=;
        b=oNObqhbegMFjSlO9yVkYR21ibCDItd5+ldyiqgzvh7HRaKqn8ue8RTrE9YG4tFfMdK
         /1DDLIWuUjb/rtVOZ5vcD+wWKNOkcezz9JIhQisdjhTMy93zu7eMpeZL6Aiqjixk1OL0
         zcCj+2yQqQR3RH0rp+K5YZFRD08TZEUBwmBbHPQ7WtUnwZWhtcTfVidsGlvWWP8PF6RE
         xmWpEC9O0fhnkN+n6baHxE1TAqJJLZHiZvH20/pi8qodFWqFWyN7V9eLr8HABz4knQQC
         MTKbwnc/cgKWdCW3jefnkKDJyq1GNUwDpPUfW/XvXWRq1LWUbB2FDBVK2L20Ee0+UK6e
         HtOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX//y9tbzaatzOgU6xLvi9NNTyagS/KsIh/L+VPy9Eex2ZObDyUFtGLYd8nMnNFo2b931711z24qj/aXUauO/1DZgkScdONFZ0YxPvdfM93l9/6t7S4v91b
X-Gm-Message-State: AOJu0YyW2C9xJGAy6W9uY5MDGW1nrktV1yXGkhT+Dd5jPuZq5cCXdGOX
	uAqx+Olx7c/q52yy5wRDqb53v94+rYvzIBYEnF3J92q2/9OUtdZxnZBWuPmo2BlX6db2+nj8zve
	yKsqoV8lTYtgKjh+D+vk+LkP6PQ76q8DabVU=
X-Google-Smtp-Source: AGHT+IGvUaRilde9C7lBG3Zb6uEod9GiTplhJpsiK51CmHcNOXyFAeqHibKDR8/NNX7QpaWCvXq9l7FWruV9lOJRI+k=
X-Received: by 2002:adf:e682:0:b0:33e:1ea:2eeb with SMTP id
 r2-20020adfe682000000b0033e01ea2eebmr14915990wrm.67.1709830281738; Thu, 07
 Mar 2024 08:51:21 -0800 (PST)
MIME-Version: 1.0
References: <20240225093726.1113403-1-martin.jansa@gmail.com>
 <CAMKF1sr1SVSnAZ2_ZCTHfMyM8i01msDQ+81M5h+Bb9zmKGPLCw@mail.gmail.com>
 <17B78F10F29044A4.14830@lists.openembedded.org> <CA+chaQfh47nRBVAjhxpo1xeXWkmw-vHf8Jk-MWX6Npn4GfyGXw@mail.gmail.com>
 <CAMKF1sroBXyZwPqLyehFLD36orrh7fC3Z5A_b98863-5hbRFxQ@mail.gmail.com> <DB5PR02MB10213AB74AFAAB16C842B2E78EF202@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213AB74AFAAB16C842B2E78EF202@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Mar 2024 17:51:07 +0100
Message-ID: <CA+chaQdc8zDhrk5JhK5yGbcNSuFOE_1MWVBm_6KhP85KdP3v+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: backport a switch from distutils to
 packaging in codegen
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 16:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196808

On Thu, Mar 7, 2024 at 4:48=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> We have a lot of recipes that use gdbus-codegen and are now facing this
> problem. To solve it, I have added a gdbus-codegen.bbclass that does:
>
> DEPENDS:append =3D " glib-2.0-native python3-packaging-native"
>
> inherit python3native
>
> This adds the dependencies needed to use gdbus-codegen, and is similar
> in spirit to pkgconfig.bbclass, which adds the dependencies needed to use
> pkg-config.
>
> I can send a patch to add it to either meta or meta-oe if it sounds
> like this is something that would be useful to others.

I was wondering about the same while changing this, there is already
CODEGEN_PYTHON_RDEPENDS =3D "python3 python3-packaging python3-xml"
CODEGEN_PYTHON_RDEPENDS:mingw32 =3D ""

RDEPENDS:${PN}-codegen +=3D "${CODEGEN_PYTHON_RDEPENDS}"

but that won't apply the python3native inherit, unless moving this to
some gdbus-codegen.bbclass as you suggested.

I've already fixed all recipes in meta-oe and our internal layers so I
don't need this anymore, but agree it would be useful.

Regards,

