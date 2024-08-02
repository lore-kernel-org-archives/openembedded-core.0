Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3772DC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 14:32:44 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.94287.1722609159596696458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 07:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g50lJVZB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3686b285969so4174873f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722609158; x=1723213958; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KuYJtG9z4RpwK7EuJmZD2XwC0IiUsHQsk+mNAN5x+i0=;
        b=g50lJVZBqx6Vvj8pZimVv/6RL99ajX44ad0eBQ5G6ynjL12TxLTwTLfdiZY8SfVqeR
         Xi58rG5RcSH1DPBMG9/h2dlFEZYY+M3ql/63cSXocB2/n7a1TlwqtpBQ6SlDZ3+kGmTU
         6NKZo5RZIc2suQBixQjA+bAcRL7b8aCJpM+Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722609158; x=1723213958;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KuYJtG9z4RpwK7EuJmZD2XwC0IiUsHQsk+mNAN5x+i0=;
        b=EdaYxz/sqaIoLsqAvU8hoTtgY2HshoNAqxRD2Yye1odMC1sNUNZzzzD/v+zp8q3Y9V
         gTsH/AhkSzi8+AuRs9L7Z2XiT2tWMSVQKiyhl7V14Z0NUMbbL18X0BQGZBjWJAzFF4Xg
         vIGIYy2M2Wdquxb4XxlsIWpmqBeDFWe7nvSUPJH0c/6Ua8wJEbbqWytgpwM/1cVjeycO
         arMKTBMBNnLA82BYWz7v1AYX1/ccD9i6NpiXwb5Rr4bUS1TEQoQNmINea9pdaUqCbP/1
         ZKBAhJgNM3ePq3o8XHQ5Ycc1SnHZFToqBL+V8fzHsGaH9hgIrNUHxk0CPkk5bcamdJ7s
         uFSg==
X-Forwarded-Encrypted: i=1; AJvYcCUO1tX2Do/5GAJfUT/HgFKobKKE4099T4bFvPXuueJNV9kETDZbBfjkrmjM2IUKhCYnEZMucWaEhnwS72Hk5qLM5dJ5yUDJwed5EU9S2y1jSYdCmyXLsBN4
X-Gm-Message-State: AOJu0YzaE8NiC2nEQmnnVM5OlJcxADJytebKOgda4yuXDXWW/RmD6SBd
	uxXw14cxP+ItJ5ikEcEkCeWwkJ2Ew7r/gjK9RPTYVIRsbxGpBgNLseBrwwxFovs=
X-Google-Smtp-Source: AGHT+IGs+3iX/8/8au7n4jW+pwNEUqUkH5jzQa+88L0qikbchpgm2zRCdjgrmpCeDbF2lpfbNsm3Lw==
X-Received: by 2002:adf:e648:0:b0:360:7887:31ae with SMTP id ffacd0b85a97d-36bbc16f293mr2414126f8f.54.1722609157705;
        Fri, 02 Aug 2024 07:32:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e1c0:4ec6:2f32:2a4? ([2001:8b0:aba:5f3c:e1c0:4ec6:2f32:2a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf1db9csm2121689f8f.26.2024.08.02.07.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 07:32:37 -0700 (PDT)
Message-ID: <6185d36c7da8c96430a9a1c51d83ed9afedeee1e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] buildhistory: fix package output folder
 creation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pedro.silva.ferreira@criticaltechworks.com, 
	openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pmi183@gmail.com>
Date: Fri, 02 Aug 2024 15:32:36 +0100
In-Reply-To: <20240802140008.497492-1-pedro.silva.ferreira@criticaltechworks.com>
References: 
	<20240802140008.497492-1-pedro.silva.ferreira@criticaltechworks.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 14:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202916

On Fri, 2024-08-02 at 15:00 +0100, Pedro Ferreira via lists.openembedded.or=
g wrote:
> This fix garantees that output package folder exists on
> buildhistory folder to avoid missing files-in-package.txt
> creation during task `package` execution.
>=20
> This issue happens because the output folder is being
> created on task `packagedata` before generating `latest` file.
>=20
> Also it ensures that in case of `find` fails we leave with
> a hard error instead of hidding the error on the for loop.
>=20
> Signed-off-by: Pedro Ferreira <pmi183@gmail.com>
> ---
> =C2=A0meta/classes/buildhistory.bbclass | 8 +++-----
> =C2=A01 file changed, 3 insertions(+), 5 deletions(-)

How would someone reproduce the bug being fixed here?=C2=A0

I'm a little worried that this might really be a build race or a
dependency problem. If that is the case, creating the directory doesn't
seem the right thing to do and is just working around the problem?

Cheers,

Richard

