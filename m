Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E01C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 12:41:09 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.61714.1702644062644431313
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 04:41:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TSpwOzjb;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50be9e6427dso588193e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 04:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702644060; x=1703248860; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6uYqKUWRdghj8DcZwwnRtp5CUb7u2SguVH/8cBmZVQ=;
        b=TSpwOzjbHUcjj0QMPhqK2grUFADLY3K5dVxNdEWsW6zHby8lGzIRcKInxt3guGAOPR
         CBSCnZuCJsOqeZfCj5JU/xSEIcGvI8cexKEQxhgyJ7NgBdj0N2GvM+6RLOWojmkAGVyg
         sx+HutzzrM52TISiGXaQ1/XR7x7sYpZb1A/28jRCyHGUgMp4aEQnDbAEXkWsbrRPb3lo
         KIz/VrUbOTGEdhGvY7OpIfRUWWAszUlEP2Irbn5l5e1A+ejIAbdvvlS3l0GJwzTzPJhI
         keLm8t6Cztd4JrLPqM6Vcz+5VRwRKKmMy8YvWeZdgchdWdp92GbafjhHI9cb+MswNUzs
         mLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702644060; x=1703248860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6uYqKUWRdghj8DcZwwnRtp5CUb7u2SguVH/8cBmZVQ=;
        b=hdAdsE94BzyFiWEbx6u7G6bMp4Pq3Mc6VD/PvkNhrU5aAYzTpDmQPaXJwYVvcxdk1+
         uUredkreYyxFYFZjLKBGPDFsCkChJgYKMYj0bBV2eAH2TBVecxscjubhhwOhx+8E0IoW
         smiRq4dl2+rVyUKHc/qa3gMf8ThVj3nRmCfceUZ5gYuiUpBIH7f5sBpCF51rkT5LfsXy
         QdTx4cd6xzf/iCncX1OW5ODRffn60KBQtsMGOKM97qQNSe+ELjFtGFlllFoMOba4IrgO
         0n83egkr4x7YUGgd/WgFQ4jJFPMQcprriP5EDa2LpJ66/zhjs4Ifl2Hl7loL1p8QfWxH
         4uIg==
X-Gm-Message-State: AOJu0YwfLOBeR20v0dghcl6MP0UhcICMT0uPFPb8SPVqy46zJld4iERE
	VXgE/aW0W99BeI3K689OjdYaTCwa+MYFpvU3egw=
X-Google-Smtp-Source: AGHT+IGaNZvJco71sd5KsAMOv+XkEeIjZ+RDIA856Qsfa2ZUGKg9+AFGshhg9rjztMPEncaQAvq9wRnMLESwErzSbU0=
X-Received: by 2002:a19:ee07:0:b0:50b:fdb5:90b8 with SMTP id
 g7-20020a19ee07000000b0050bfdb590b8mr4782643lfb.59.1702644060270; Fri, 15 Dec
 2023 04:41:00 -0800 (PST)
MIME-Version: 1.0
References: <20231213094113.3981-1-alex.kiernan@gmail.com> <bdd89f1893f33e2d19db0367fb1544b36ee49cf9.camel@linuxfoundation.org>
 <E29D8825-5868-4FB2-A0ED-B01299BBBF4E@arm.com>
In-Reply-To: <E29D8825-5868-4FB2-A0ED-B01299BBBF4E@arm.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 15 Dec 2023 12:40:47 +0000
Message-ID: <CAO5Uq5TZfbe5HaEuV69T94WC0F6gytTkp-RCpaTKwtO1SoHKrg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.71.1 -> 1.74.1
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 12:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192430

On Thu, Dec 14, 2023 at 10:28=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> =
wrote:
>
> On 13 Dec 2023, at 14:06, Richard Purdie via lists.openembedded.org <rich=
ard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > I've run this with this patch included:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4082
>
> Same failure:
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231213-s13b=
67oz/packages/diff-html/
>
> Ross

Thanks both.

It does look like its just filename churn, but I cannot find where
those names actually get generated :| Suspect this will be a report
upstream and hope someone helps.

--=20
Alex Kiernan

