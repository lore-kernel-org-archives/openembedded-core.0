Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B09C5321E
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 10:49:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.50348.1724669350870563013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 03:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hxAXC9aw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42ab97465c8so35567915e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 03:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724669349; x=1725274149; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6sTJGY31iKLjo4xTWRl/IIFXjoPYlDCEbFqKCY2zEY=;
        b=hxAXC9awRlJJhp1nzN7RjrJvU4R5bVZR734WWxsrlTBBPYOVsBcwzMRlw0V69a0KgQ
         OQS9R3d5eaqaSUB4F4961d8dUf5ngnOh9YAy8K7SRqnHRqwh8lTCdiS79T0JwSGlSJvC
         09Hh8qFzM2Jhh3Uzj9W1d2r7MkJMrgwj1BCX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724669349; x=1725274149;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J6sTJGY31iKLjo4xTWRl/IIFXjoPYlDCEbFqKCY2zEY=;
        b=RVgoUCXONWFiXgpRsS+pu9R2DW3rWoBDUWecTe6MyEJzxOe7o+0KOzCP9OZmMlAkmW
         YYCQ+Sw0vWl6lvraE958OIBmFMH7pxRaVIuHp5Dczvx5IsFbLIwHSZbcBIF0CTQ6tnGE
         rsTtrlXRlaBl24OFwjDQkCI4LgcULLyCF5GMMwtGhBCQeiisw+SNPBJD/CcsemxoNFhL
         mAqJyzqj3m60k8KFJRJ8GGK5TRO/As2elXNYYSPfekNoUnXCqddeCmxCFP8bYPupagj0
         OkJTbe6LwcHUWOUrhTVqZvDftdeiwfvddUAvgguxwHkGdGIyevi/VkFKLi6d8lsm63WM
         tZqA==
X-Forwarded-Encrypted: i=1; AJvYcCWXwJ0L4qHOem3zDh5GRyuBsy176HfDuxHQXcsvkayGQPVIaXHmAAgc0vIlWBm0OCKX9STrO8qdaC43Psb5RocP4g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywwm7swEzuRbxGwK36jaAIPK/8J7B3yP86UPMxh6iVBawdRuQjl
	HN2goGGWpnxjDC640S8pk4Ux/2m8zoMymhkrMJdPrSCfrA7c2ticmHOHjWsXaqk=
X-Google-Smtp-Source: AGHT+IGSlIypY/Dpgz8lgVSe5wDSeZAIt0wfZs7PgHRb0/s5cf/xmNQJ5jfo2l20zus3juPvI1gGsw==
X-Received: by 2002:a05:600c:3c92:b0:426:5c34:b19b with SMTP id 5b1f17b1804b1-42acc8e1df1mr71265595e9.20.1724669349111;
        Mon, 26 Aug 2024 03:49:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:152e:7c20:baa0:ecce? ([2001:8b0:aba:5f3c:152e:7c20:baa0:ecce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abeba89a5sm189457595e9.0.2024.08.26.03.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:49:08 -0700 (PDT)
Message-ID: <671eb55a3c01febbd0b857947993ca7b0c96471b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] testimage: Add support to create test report
 in JUnit XML format
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: clara.kowalsky@siemens.com, openembedded-core@lists.openembedded.org
Date: Mon, 26 Aug 2024 11:49:07 +0100
In-Reply-To: <20240826081337.2737132-1-clara.kowalsky@siemens.com>
References: <20240826081337.2737132-1-clara.kowalsky@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 10:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203746

On Mon, 2024-08-26 at 10:13 +0200, Clara Kowalsky via lists.openembedded.or=
g wrote:
> This introduces the possibility to report the test results of testimage
> in JUnit XML format by setting TESTIMAGE_JUNIT_REPORT =3D "1".
> The generated unit test report is located in the TEST_LOG_DIR and can be
> used in the CI/CD pipeline to display the test results.
>=20
> Signed-off-by: Clara Kowalsky <clara.kowalsky@siemens.com>
> ---
> =C2=A0meta/classes-recipe/testimage.bbclass | 15 +++++++++++
> =C2=A0meta/lib/oeqa/core/runner.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 39 ++++++++++++++++++++++++++-
> =C2=A02 files changed, 53 insertions(+), 1 deletion(-)

I'm not sure that we want to add new output formats every time we have
a need for a different way of displaying the results as this won't
scale each time a new output format is needed and we can easily end up
with missing data with one of the formats.

Could we use a conversion tool instead (it could be part of
resulttool)?

If there is data missing in the json format, we should be able to add
it.

Cheers,

Richard

