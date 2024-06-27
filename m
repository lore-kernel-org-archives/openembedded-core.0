Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615ECC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 13:31:53 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.7916.1719495109774497911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 06:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dDTAiEdT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-36703b0f914so1198906f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 06:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719495108; x=1720099908; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fm9uWJWmMLnnyJAbKbxMptLPMOREhyi2JCFIN2YcbdE=;
        b=dDTAiEdT0D3E0011XEeLWd5vuj/8p9JXxvuiUEQgCdrG/YReFAXeehc3dZ3owVTy1T
         XxlIffZ5WfiOB/ZROfyjXS16HLSNPEArC6WQ9sPcPPGwMcQDUiTR5I6YQud05xmLh1Bx
         TlxlE8vdldTMGkcOO4EPYJztyAmIRbttQv/Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495108; x=1720099908;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fm9uWJWmMLnnyJAbKbxMptLPMOREhyi2JCFIN2YcbdE=;
        b=gDUA5DQdUb2Kh/PqDY/jUB4iHEnbYlnJJfpnA400YA+rCnlIkhCLcZszOFrlH3/t6G
         o0bHG9NtZMMqZFlr2qAxEt4U+8XKIt5P5/mZWJo4yTnW9i/K9wqaHgUft/aHHjQn/9Eg
         WxNBAq4SI+5kD0rfWpwbOQkrhTjZEmhEhdoohu78bT2o/OrSsatk1B8D0K8RWB0T4dEI
         LlQbL78AipaEe/KiNPNJEpB5hNre/AiKcBkLroFJiGi/f2AmnbLGs/j446ZrCgemYl4I
         gNvm5giIhBK0q9dx+q6pG2a7ECuRBGQV+SK6znm1wylzefTcUUo9Dey9ZHBYHu/CDb2s
         RozQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8INiZ2sKjzSa3HFr0JLB8NIUPnRhSylLG8LkGjkJsOfy73HdLpxl4exUivKRft88rVydNbV0ydb2kdtUaq+nAsEGLoYEiwBiRihMZoQuRcQL5ORfCCxSh
X-Gm-Message-State: AOJu0YwH3WKkhHKkqEdIM65D7s3DGlJafdJj1eBT1ZZfPsmLk67dkguT
	SkmcqluchF2KKMm+THKTqx+X8bgxG/oeamluQqBPMfMF6Uq1su2vkEm6LXFbX1M=
X-Google-Smtp-Source: AGHT+IE5FhWA1Umn/V+uw1igeV3e7g6zgstxWb/lpSFWXoq66j0EYU5f1fEBRMG21KSkXBMpzlpJBg==
X-Received: by 2002:a5d:522d:0:b0:362:2af4:43cc with SMTP id ffacd0b85a97d-3673cc6218emr2303889f8f.19.1719495107170;
        Thu, 27 Jun 2024 06:31:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:edd1:8c91:3c15:8e70? ([2001:8b0:aba:5f3c:edd1:8c91:3c15:8e70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674357fcecsm1897118f8f.26.2024.06.27.06.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:31:46 -0700 (PDT)
Message-ID: <4c9ada58477ef36f4022972b74140e0f14f2bc6a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] testimage: Gate artifact collection with
 variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>, 
 ",openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Jun 2024 14:31:45 +0100
In-Reply-To: <00A67594-956C-4E0F-BA5A-CE113EFFB153@arm.com>
References: <20240626094130.255905-1-peter.hoyes@arm.com>
	 <dc373ddf53eddf0ef3103d9f08a9bb72bbd00550.camel@linuxfoundation.org>
	 <00A67594-956C-4E0F-BA5A-CE113EFFB153@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 13:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201204

On Thu, 2024-06-27 at 12:34 +0000, Ross Burton wrote:
> On 27 Jun 2024, at 13:02, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2024-06-26 at 10:41 +0100, Peter Hoyes via
> > lists.openembedded.org wrote:
> > > It does not always make sense to collect artifacts and data from
> > > the
> > > target on failure, e.g. if testing firmware or if the target is
> > > not
> > > running an SSH server.
> > >=20
> > > Introduce the variable TESTIMAGE_RUN_FAILURE_POST_ACTIONS, which
> > > defaults to "1". If this variable is not true, skip the failed
> > > test post
> > > actions.
> > >=20
> > > Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
> > > ---
> > > =C2=A0meta/classes-recipe/testimage.bbclass | 10 ++++++----
> > > =C2=A01 file changed, 6 insertions(+), 4 deletions(-)
> >=20
> > Is there a reason you can't just set TESTIMAGE_FAILED_QA ARTIFACTS
> > =3D "=E2=80=9D
> > ?
>=20
> Answering for Peter because I asked the same question: the next step
> after list_and_fetch_failed_tests_artifacts() is=20
> get_target_disk_usage() which does a target.run() so causes a SSH
> call.

Rather than call this RUN_FAILURE_POST_ACTIONS could we have something
like TESTIMAGE_SSH_AVAILABLE and then test against that in the
appropriate places?

Cheers,

Richard

