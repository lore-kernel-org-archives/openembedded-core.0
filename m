Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3379AC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 09:22:44 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.4280.1658395350254626157
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 02:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=J8eMXj3/;
 spf=pass (domain: qtec.com, ip: 209.85.219.175, mailfrom: daniel@qtec.com)
Received: by mail-yb1-f175.google.com with SMTP id f73so1776861yba.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 02:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eNubCtq6u4skPnbC+ks5A+HfpheL2YGC6HxwRfPMA9E=;
        b=J8eMXj3/1rFzapHpObIKzxj02mKI+gn4zkXVgaqYtVM+oC+F3ofpqw0wc8aWpoFiLq
         oWIONgTbVuzG7y+7S0XVG0l1KJgWIF3FqL7Jsc20UR1zCj5Ylu/KmuEnWJVtT8NspH+T
         anAQ3TsV/pK1eYu5AFwbnjbWM8RP461CILlZtuGlUIua4AvXUIHEP6dUBgbiitekJfM+
         AwYnbak9eiZUzk0Kc+Q0gFqtHgryr2IyTodOATelaT6I84eew0OfNNPnFgap+z1qIwSk
         NRqwH+amaduufwlWrDHw5bukSUcIF4UzBRcJSiBSrgQ0cACCfnyRajSPETWCPwvO1iU8
         hrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eNubCtq6u4skPnbC+ks5A+HfpheL2YGC6HxwRfPMA9E=;
        b=7u6O4b20U6QgBojQajgpb1Dg00Tn0hcEIoUEyahF8phK/AOp9u/g/CBZnZ9R+E3qR5
         vMD1BY1MB3kbK7RLALaSFnm+U+/PWNdz+632A1dpPIG2LSM2leI6/SY3ay9vxOEC9rpU
         wsIoEaAcNepDBMYxtsFyiUly/QmJFBAg2YVgGE9LkbEG+PLOAJj1yBhcYs9p8IIYGErS
         gyDnrnwCzRGrn81k3LJzIQbymYnMsW7ob7NBCUcGDmA6iM0LLThb/yxRjs/09OEx9hv0
         lsb0ju2NfzTwqTMT9pUEEyvVOxA7KNtT+IishQHPd/ClNTHXXZIdGQ5q8N77WckyagXE
         JW6g==
X-Gm-Message-State: AJIora+xdyLCNjCjJbl0IOCgU5uy6HpFAG6QCH6NfiKSqTCwDCmMRe3W
	p7dS1vylXbyzEPyB1WKPnidf1AoSai85+SvG64ai3g==
X-Google-Smtp-Source: 
 AGRyM1uPEjKa7Va9u/zOyzGK9mS3lkZMfJ4gL7M8ef11GLl8lrU3jF4TqfFYnOJWry0zkKqqLSVl9rh1P47pbP4KfPM=
X-Received: by 2002:a5b:cd1:0:b0:66f:ad59:be9d with SMTP id
 e17-20020a5b0cd1000000b0066fad59be9dmr37604058ybr.308.1658395349219; Thu, 21
 Jul 2022 02:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220720194416.89631-1-daniel@qtec.com>
 <8B7B30C0-321F-4AB4-9105-894148FC9D9C@arm.com>
In-Reply-To: <8B7B30C0-321F-4AB4-9105-894148FC9D9C@arm.com>
From: Daniel Gomez <daniel@qtec.com>
Date: Thu, 21 Jul 2022 11:22:18 +0200
Message-ID: 
 <CAH1Ww+Qwxro1pxRZmPH2MUYPg931s35uFxEyBp3NQOr1XcW0TA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] dropbear: Enable x11 forwarding
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"dagmcr@gmail.com" <dagmcr@gmail.com>,
 "yi.zhao@windriver.com" <yi.zhao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 09:22:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168383

On Thu, 21 Jul 2022 at 11:13, Ross Burton <Ross.Burton@arm.com> wrote:
>
>
> > On 20 Jul 2022, at 20:44, Daniel Gomez via lists.openembedded.org <dani=
el=3Dqtec.com@lists.openembedded.org> wrote:
> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' \
> > +                file://0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LO=
WDELAY.patch \
>
> This patch should be always applied, as it doesn=E2=80=99t cause any brea=
kage when applied if not used.  Patches which are conditional tend to cause=
 breakage when they=E2=80=99re not always applied.
>
> > +                file://0008-default_options-Enable-x11-forwarding.patc=
h', '', d)}=E2=80=9D
>
> This should be a PACKAGECONFIG instead of a forced on/off based on DISTRO=
_FEATURES.
>
> Upstreaming a configure option to expose this as =E2=80=94enable-x-forwar=
ding would be great, but for now you can easily sed this file as needed bas=
ed on the value of PACKAGECONFIG.

Thanks Ross for the review. I'll send a v2 with the changes and look
into the upstream option.
>
> Ross

