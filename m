Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33156C87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 17:14:22 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.67831.1753982053205699955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 10:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FoVMG0uY;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8e0aa2e3f9so733866276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 10:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753982052; x=1754586852; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zR35Kwk4OzVmLKVRvkmzwiy0+3cjPBxTDsG+Iny2KDM=;
        b=FoVMG0uYThvz9uqxM2VpWcJOBJcbIQeX0wrQlz3PsF0Z2RYOd/C14tZegAbGnUlArl
         RhZyxu5M5sZCkawJppskTUfAejeXYjOOjeUatqksBX4T7TfiAwa4F/uRl1gatp4588Q9
         x2CsBaEriUS44UHmKNuXQFCx1iHMObo5td17mVBIYVFo9pnon9VcraTTCOFT+quEBW/G
         PyuIViZ7M1qhnFZRfp1Ck47I1xiTABJgQxFNQTM5/NaXwBvJr36oWXT9snuNdH7APH95
         s0cqpeQty5qwSR4R0BY/a9nDNPppq9Cjd2kvUNL1k1wmeb/pcHKsnsbmh8BzfDznioNr
         5f8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753982052; x=1754586852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zR35Kwk4OzVmLKVRvkmzwiy0+3cjPBxTDsG+Iny2KDM=;
        b=NRrs9xexqppYHbyKnYSu+aJJ0rlW+vx7cq8O6NxtN+WFCdCgBjYcn9MaB9ZJirpITu
         nczi31i/0rvqf7AS9GB1hiiqwKrEk1kD+gxPf0SZGFjud+jDrIDdzBilryKyANVu+xKc
         DrhgLth10oGggzMRXOjVX3SOMPkSoByzwFKSicjLcQx86JbcZmFSQ19GHnpbaMH829iv
         l26/vITK64oh/Y5W8aOviOmA7YbQQWG9HvB5IxnKkD2qi2GCTxE1wNAlCS6/QD0p8y0o
         HEgcsQsHyf557HvzL0/lyjDuYUmoZKF8QZV5MCXrw29S+WxvjbwTSYatbgrJjL70yYD0
         TEFw==
X-Forwarded-Encrypted: i=1; AJvYcCXumW0H9usJu57Hyodv8oQ95177UcY8gIz1/+J/LUpTO+7X9LgW+HB5sCRWd8j+RjTRtWPDlje3C9VELhKxa3g4Gg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxw3p1YA5o9NgOiVq/SfV7SpEp+zh/ZCvGiuf9iTqlOv+VKeJG5
	DwwpqG5l1tvMHNAsweB5//igiPJzdNm/X3lyKiYnMDb9xM1wJqcpOmVU1oUtZTHftj7wHPY3QCz
	BfRw2u7of9yIb+f8o2iZoscfgIY4rn7U=
X-Gm-Gg: ASbGncv35EAgadBhN3Wza46UUFNQFPlaj7pAiHbonj/PyINSmt4ctapC92AYu0W7XJZ
	Wq0czjsK14L0tZE4fzTdGrIQhyJsI8ZRH5QC7X8k+91kjbMyWcyPk4zj8NBZGwCtmVuBDANIPDu
	fwq9i7eqb11C5FSKpiW2yXJQvAn4pobP6hIWYkeBtjpP6dmndaKfG9ZokE2gdeFf/eINfGaYvCP
	c8aJxTHttK1RIIpwEzU+vOMPqaaZADwL6M=
X-Google-Smtp-Source: AGHT+IHkRX5fVFjShJLaTn/uVOWu2CRSDTsLZ8rBq4+yJkaQfo8cbp/ojQ5Qr66iltKvoa/lknzhLf2ZYYN/3alBkxo=
X-Received: by 2002:a05:690c:7408:b0:719:dbb5:e76a with SMTP id
 00721157ae682-71a46970189mr104869057b3.42.1753982052045; Thu, 31 Jul 2025
 10:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250728032045.2783514-1-raj.khem@gmail.com> <CANNYZj-KztVkyJc_3-cm5T=MtJasYoJkidku2J=7rA5BTysEqw@mail.gmail.com>
 <CAMKF1sqjDpXSBB5TZGF4-YGeS_XUJArGVjnoo2CFLEW+6VvLdQ@mail.gmail.com> <415E301D-8F29-4B75-91E3-9A53896B500E@arm.com>
In-Reply-To: <415E301D-8F29-4B75-91E3-9A53896B500E@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Jul 2025 10:13:45 -0700
X-Gm-Features: Ac12FXx1i0z3Ip36GH93vUNCYYZZaGziH9pfhFpOl7W4mdQ7grXFxwDauh2Rt4k
Message-ID: <CAMKF1srwRPAVnWGKvLxgaDhg8cTnUC-BOr+WnMPSupiQzqqSxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] spirv-headers,spirv-tools: Upgrade to
 1.4.321.0 release
To: Ross Burton <Ross.Burton@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 17:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221203

On Thu, Jul 31, 2025 at 10:10=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> =
wrote:
>
> On 28 Jul 2025, at 18:14, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> > Yes thats reasonable. Although what worries me is the spread of depende=
ncies for
> > atomic upgrades now, libclc is built from clang sources and libclc has
> > dependencies
> > into these via spirv-tools, this is adding quite a bit of sundry
> > dependency upgrades
> > that compiler upgrade will have to do. Thats my worry all along when
> > we spun packages
> > out of clang, It would make it hard to do version upgrades in future.
>
> There=E2=80=99s no change to what actual code is being built, the libclc =
recipe uses the llvm shared sources.

We controlled the spirv (headers/tools) deps inside clang recipes
initially when it was part of clang recipe.

>
> Ross

