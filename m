Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC3CEC36016
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:49:57 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.4860.1743457787444143960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iyXYV0xI;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3f6eaa017d0so3024324b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 14:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743457787; x=1744062587; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCMk4/rYG//WCp0y4RaIsiVifBlHDB7v5uO7q2g3cLM=;
        b=iyXYV0xIxREUJ3nX4Y0ejbXKT7pJKV1H1M+LYghIuWGlV/GdjebQWj/1Lq6NTmXDoC
         QK0IB1p2igPeH5XK8Tedl0NLXpFBlillGj7VpZGqzGzoYsuLwkEwhtaF+2enVBA3M/tO
         XZbod54bcRg9WE6J7oj6DHDO0TFWVmrU4gUJvzhfw0rZGcNwjrAf2GM70cK05L67u9RG
         96Hm3GBIeKJVoReeBTx5egaJamJ2oQjOpavCzD93/F96odKCZVFuy2gFfWiu5NQCKlGl
         /Re2+WuhsarbELIgn4kFJ8/mVY+5cMA9R+Rn6phlNRpVyQDEpZFFZWkbmlbworqc5WWI
         gTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743457787; x=1744062587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCMk4/rYG//WCp0y4RaIsiVifBlHDB7v5uO7q2g3cLM=;
        b=NNQ2YFoj8Z5rGTY5u70AZy3luh4A7E+1c7e3/6Mpmmn5njbkyRBY7aF3sS4sqtLFg5
         SFoPHbxL8gNpMo7CU09G6MnZr4Hfl2YNZlGdYPLoFFlT5xnmiHshnOz8Cs/L7qlRBIaR
         IssWFjghPOM9FqnQLzyd7zsKKNHfoOIW1HKSLnDza5x48oK5/0jgPBSxKa0KQjffkPa9
         RrnxrJdLYkqRDhgqa16yfyKMLx6qiIRTVM6aaOan8ykA4o3+nQybO3Jp1sARtJIs2Aip
         9HSpML4Vk3fMDVOH9KS9/wp5gcZ3qQdzPgTqrrvmrvLOeASIBi5j84yHLRXbdnTF1ues
         br6A==
X-Forwarded-Encrypted: i=1; AJvYcCWjQlbokXfj+kGISCtlm2AKlz5yXiWFwN35uhzetk1LwXZC/ttUC0Eao0+nE0nXGF1bQE3KYXPmzPJ5EI9HFnDKdA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwNbhh/K+ihLBzj1ydtvgITt/NpbEm1xjhfoAPioRXjv5FVHHqt
	fZ1eMQz7w111xTHyokoBEqwENew+KoZ7asx+tNKljccG5TwR4/XNs0ONYo22oGmiBKJGLAdzXRH
	L4INF/uKh5IZ1J6yL+23UsMAvlAFU5y7OO5g=
X-Gm-Gg: ASbGncvbpTwzrv8xgbLvQMniC43BGzNMhKMz86ETq3GppVJ0isfECjJyzXjDJ6CP3fY
	0i1WlbYYnY6J2aNE0i1wVkHvJMIPkMvpnop0UhBjj0/S1FSYQRORzXBN85tg+Fn7o7/hXq5dwP7
	cJRwoA7Knacgvt92anKcsc0UwTP+WHeDVkJmQmsuSP8IHxD88CM4QIC/+3v1U=
X-Google-Smtp-Source: AGHT+IGZF8ola7J3p4uItWAXSzW2FKnFxhkZTNbNyvOUJpLxIIZ+Jdr6/3dE1HmSEwzpXd2qjVZQYuJVFEvDb0q6RHk=
X-Received: by 2002:a05:6808:e89:b0:3f3:f90b:f1b9 with SMTP id
 5614622812f47-3ff0f3d8b06mr6090376b6e.0.1743457786698; Mon, 31 Mar 2025
 14:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250331133044.1944108-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sr8AqkmjQca6fYe90oOU3h=++A2=7RpaWkRFEuS38oyHg@mail.gmail.com>
 <9fe3cc25-c6fc-410a-b819-58e1e1db818e@windriver.com> <0ea0d9782099022b7a663c94a46cc346ded45e28.camel@linuxfoundation.org>
In-Reply-To: <0ea0d9782099022b7a663c94a46cc346ded45e28.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Mar 2025 14:49:20 -0700
X-Gm-Features: AQ5f1Jqy0qo9Rl-R_unJsuAgC3Y6xq3ihYwpULTyO1dI0S6P_rwY9U1jZ6qIm7U
Message-ID: <CAMKF1srG-DqF-EVp7FRCvAYy4pS3k1rmJf1UOiV8bXufkz=iKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-llvm: Compile llvm to use dynamic libraries
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, "Shinde, Yash" <yash.shinde@windriver.com>, 
	Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 21:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213998

On Mon, Mar 31, 2025 at 1:44=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2025-03-31 at 15:08 -0400, Randy MacLeod wrote:
>
> On 2025-03-31 12:13 p.m., Khem Raj via lists.openembedded.org wrote:
>
> On Mon, Mar 31, 2025 at 6:30=E2=80=AFAM Richard Purdie via lists.openembe=
dded.org <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrot=
e:
>
> Our main llvm recipe uses dynamic linking already but rust-llvm does not.
> Enabling this significanly reduces the size of llvm-rust to about a third
> of what it was, which is a bettter configuration for us leading to smalle=
r
> TMPDIR and sstate objects
>
>
> It will slow down the compiler execution and sometimes its could be signi=
ficant as well we have seen this with clang so it would be good to have som=
e idea around that least we provide a slow compiler compared to other distr=
o infrastructures
>
> We'll get some performance info from the YP AB perf builds.
>
>
> https://valkyrie.yocto.io/pub/non-release/20250331-105/testresults/buildp=
erf-debian11/perf-debian12-vk_master-next_20250331181527_9ba5b4f4e4.html
> https://valkyrie.yocto.io/pub/non-release/20250331-104/testresults/buildp=
erf-alma8/perf-alma8-vk_master-next_20250331181513_9ba5b4f4e4.html
>
> The build time is fractionally faster (1%?) but hard to say within noise.

That's encouraging. I don't know if we have some large rust app which
we compile using rust compiler with and without this patch. There is
uutils in meta-oe
and python3-pydantic-core in meta-python which can show just the rust
compiler's impact.

>
> The diskspace drop is convincing, 2.3GB less TMPDIR size (2.3%).
>
> The rm_work TMPDIR size also drops by 1GB (6%) which is particularly sign=
ificant and nice to have.
>
> In builds with rust-llvm as well as rust-llvm-native, this will double up=
 for a double win.
>
> Cheers,
>
> Richard

