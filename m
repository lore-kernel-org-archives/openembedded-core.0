Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA70C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 15:03:55 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.90078.1754060630848975344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 08:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hPpgPTEK;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.178, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71b6ad2d6fcso11484247b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754060630; x=1754665430; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wo68TAm/kIZ2wZfjMQxFreMeMDns9w/OmZo2bIBtPA=;
        b=hPpgPTEK/LCE9iSbtg2BWd5AknHJb77er/o2kf65H+zqlRMpbkOklYNCWqJ0bnXaWs
         ChjDeaFqjjopRF6w5wgjy69CElfcTJ1EhujBLRBMs6nDdiMGPHKuRzWEj1nIPsF75d8N
         Mm/24zQPGUZEJtI/VjuiAIatUP4bTF1+3KT60X5JyDZu1Ebn6t6EqULvFkVMCMXHQxdK
         JO1uJnlP9t+qfwnbllfQfrG4aJlmyea/Gj36O3oKcaBxvX9vJv/asEiOSG8kRawtTKr5
         h6W6BJ8TJMKYgRxNQKkteeGxwacgwUq5zcRU5tg3KYRdbUls6ZvFMjh+bS0kkBV30wDB
         Iu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754060630; x=1754665430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wo68TAm/kIZ2wZfjMQxFreMeMDns9w/OmZo2bIBtPA=;
        b=hlwUQ1RVta/ztd0BvSSOfbIkRgrnm+H9ifYf9lgePx7tX6lqGLe0fBdxAGT6Mmd9Gg
         J2+hsLJLIMAjDz5Yf5X1YJ5wDAUXteHn1Ja2PbMaLZQxslDcosf9gS+dsdhfXe9zm3zR
         q23nDcWREm9Rd+zIhbVRItDta/K64uxsI1O+WyhvaQDiX6gPl0QC9vrlKd/h88ivrttt
         IOc/wtPNOP2fD7dDA6H9oAXwk/888PCV+c4s3GE74AnfaFpiyNcsPNj44PlgrKgNzlUU
         RF6zyyZWWRtsq+DzWeJMDf4h3qi8q7iLY6v5u3CM+mTNifiDJvtAd9t3M2EIAiQwJYOF
         CJVw==
X-Gm-Message-State: AOJu0Yz+A3CRRo6GwOsSAr0IRwGEEAn7GAmKoSDOpODR1bycJWsBZ+o/
	eMiE0+uqjvlFSKcw6N4LsZd0IWFkeNcMKOPX6Iyx/uBvoSFoY7apbsgv8UX3NazvNKgkX6nDorj
	u0uhH2WTgyuGP/kmuXkZcaNWRKt1iXptfYoaXR+pGHA==
X-Gm-Gg: ASbGncuVcArjlV1/tmcKSByZc9TgFRE/K26IKILLRauEUBmEpkRtLDR1koeoKGoNvMn
	Dq0hYr8lxZEzgLATUxfaLM4IsNVOcPg6O6Ic7d+2ZRzZ8tgYOxcyltIycxUFBPOjEQHqvvHYiGB
	oHoWyHbHFopMYik5lVG4pSIHY7fjHK9JY5DCo+tTOJIln9CKP+zUJkIWbIwR0trIm2JNFgIIv6g
	G32SNY09PKVrDQdPclzvYtT6J+y4JEou/W4C3g=
X-Google-Smtp-Source: AGHT+IGvJLjKDrbz6MOuxPl3jo6P5OIUf6lRN+8SnvRCKLQKWNrasRzXZxrWoXQ+zKjnvoZ66yqUTZnZJ5oMfml56Zo=
X-Received: by 2002:a05:690c:6401:b0:719:3e4f:60f7 with SMTP id
 00721157ae682-71b6d78ffaemr39417787b3.26.1754060629892; Fri, 01 Aug 2025
 08:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250801100708.2925411-1-martin.jansa@gmail.com>
 <CAOSpxdbjrwU2N-qYdy8+o2K3Q+XH9dn0VquQe0YSyass_PxYcA@mail.gmail.com> <CA+chaQcVit+vwWQny5N-uAsCHD4YFbU1RSrVfNuPqkJW_ii8BA@mail.gmail.com>
In-Reply-To: <CA+chaQcVit+vwWQny5N-uAsCHD4YFbU1RSrVfNuPqkJW_ii8BA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 1 Aug 2025 08:03:39 -0700
X-Gm-Features: Ac12FXxQqbrh1NvSHO5b06JdK4TD2a2qu3KLhRYWOrEuIpcqguVGteTpkqNHCnU
Message-ID: <CAOSpxdYWyrg-A84eUjcXH5gdPZH+FvMtxE8hzJM68BONmBbNeQ@mail.gmail.com>
Subject: Re: [scarthgap][PATCH] libpam: re-add missing libgen include
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, hprajapati@mvista.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 15:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221364

On Fri, Aug 1, 2025 at 7:43=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:
>
> On Fri, Aug 1, 2025 at 4:42=E2=80=AFPM Steve Sakoman <steve@sakoman.com> =
wrote:
> >
> > Thanks Martin!
> >
> > Any theories on why I didn't see this error on local or autobuilder tes=
ting?
>
> I've seen it in build with clang which is more strict than older gcc
> used in scarthgap.

Makes sense, thanks!

Steve

