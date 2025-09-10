Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA190CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 16:27:12 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.23502.1757521631660389929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 09:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VuoGX2/R;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-ea3ca65bd38so75281276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757521631; x=1758126431; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5mQMBxMrBem3Asg+qgoshRGEdxszNRFtEPSLIbSQgA=;
        b=VuoGX2/Ryz4J44O6WjKP/CppCRJNuiFr+BQj4NGG24Z3nGDOQhXvsXfAd7fp3+lMqM
         pHIzxBaAFqLncVQEg5kXeqf/qvfhVz7a5eP7p4rnvXuGD42S7L1CGXkifSMA/9SxNGIQ
         4UQb/XrDprD7HyxwfpcSo3fR57NqL+OBfwKhgRG5P9SdjBkEGImKKqZhdaemzxiU5Jk8
         wZUc60P1Hi18pDPGUn+69p8+aDdYcsZ6tuX2ZHnrBZcJUmbTq3gwpm8hLRdO7nNtmxlB
         WqiakZU/voiK0m1fOFDSr73NsszOtTgKNRSRFYucn0qUnZW72sJk6JhlwXcqJLn4/d6W
         1jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757521631; x=1758126431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5mQMBxMrBem3Asg+qgoshRGEdxszNRFtEPSLIbSQgA=;
        b=MPMcB6MVaHqzTJjrjcZh9HKzNkyJ7jgG+/9AHMFOD6j7nLu7JL0R76Q5EjQhKYEstc
         gBd+s72anYR37VwjyzbOSI2pJ2c4Hxi3YNbp9NQ8hPMB8MIpTn70jUoY5nglSIiAfOiZ
         IHPdQEPCpKthAaCzlEfVD7NPRhkQEYZbZ1e5P7Ej9CRQkpj0/sFQpbiYNhBD2Qh8ZhV7
         ys6O+XsJt1sQjgMORl39aZqxh5oULaeftlLQe5Lm72nlB6viTxrwJT2UxOs2eq9aRVkL
         cABQlFQ+L1bHsDHdHsaxODXcifS2FUDYwPHQvps6IDh9Enrk1/ng96ncezkWAvXDH/a6
         AJlg==
X-Gm-Message-State: AOJu0Yxv/qBexJTwclz9K1hDfCBWE7Eu7ZIrVCge+sJA0skeKzqbzcfA
	MYgpCCD+zUFTzaMoGBuQ+Y17M3BfLf1+sTGcrvrNKHmWIp/HkKrWkykWAuSHe2QNn5jcAlbsEfc
	5vWp7tOvKNvpbHuJlaXsS227vjOg8F6w=
X-Gm-Gg: ASbGnct2NmE/6eEX8/7nETm9xrN0XjP2mWUn/dkSmpenqxmehteIIPPdvpU8j2YIsHU
	h7ti1SKY6t9GOotHAYuhuiy0cyCcUAKfROLpv7fq/SaXG2RcuwzOh1VN2AvltyGve6hojt3qqmX
	v1gvcJFpJXbbCMoTXZgYewxXGw/vIXF/F2knW8lEx+Oi2bTuO3d3RWKLCq2WAFEhps5ho8bCfUQ
	fvziUwaxyKjeMcTsRBRPI+9lGLc5ubQ2IMXX2rGzg0W5xAuguP57GteviGc661Q0cyUjrNORvnx
	sqJEQ4A3BNSWA3+VLgKh5nSRPLzswj8HIRlUZmZc1fDT3XghJIp06LhC5g==
X-Google-Smtp-Source: AGHT+IGOCkHdKdPqSszJ1R7tfWi6lLkPfs+HRmKcwsapE37ZMOQhg7QF4uQ5UTpHgZvuAQkjTlaUZ1x4V9vUZunWpF8=
X-Received: by 2002:a05:690c:b05:b0:726:9be4:97d4 with SMTP id
 00721157ae682-727f534c82bmr148668687b3.37.1757521630536; Wed, 10 Sep 2025
 09:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <DS0PR11MB79014CF356CC7621C30E755AE00CA@DS0PR11MB7901.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB79014CF356CC7621C30E755AE00CA@DS0PR11MB7901.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Sep 2025 09:26:44 -0700
X-Gm-Features: Ac12FXyENXzebfyP8RmT18B1AnPGxE-MxAPXYWaXXqVXbkabewCWxEjpnHLmzTY
Message-ID: <CAMKF1spW9RueDyMXqj5oTqhfkq6csjPP7CaOc3Jwk2gx4V=Xyg@mail.gmail.com>
Subject: Re: Clang - Question on dropping D144541 clang patch in OE
To: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 16:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223227

On Mon, Sep 8, 2025 at 7:45=E2=80=AFPM Dora, Sunil Kumar
<SunilKumar.Dora@windriver.com> wrote:
>
> Hi Khem,
>
> I'm cleaning up our clang patches in OE and I am looking at the one we ha=
ve from
> D144514 (The one that adds #undef TIMEBITS in sanitizer_platform.h).
>
> I see you already got the main fix for that TIMEBITS=3D64 error committed=
 LLVM upstream
> in D140812( Commit - 26800a2) for Linux in sanitizer_platform_limits_posi=
x.cpp.
>
> In our builds, I haven't seen any issues without the D144514 patch. Since=
 we're only building
> for Linux, can we just drop the D144514 patch and rely on your upstream L=
inux fix?
>
> My Question is: did D144514 serve a broader purpose for other OSes that w=
e might still
> need to account for? Is there a specific arch or multilib config you'd re=
commend
> I test on to be 100% confident we can drop this?
>

It looks like we can drop it. But try building  compiler-rt-sanitizers
for arm32 ?
to ensure.

> Thank you.
>
> Regards,
> Sunil Dora
>

