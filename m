Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C3DCCD193
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 02:20:16 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.web11.649.1761272409155813100
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 19:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XCliqvFr;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-63d97bcb898so2720131d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 19:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761272408; x=1761877208; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEqhIt0BQfOIO3GHpJ2u1rmHeUeg4YpgUiWjfTdePcw=;
        b=XCliqvFrQHF91LqxXn+lzGP4MCziZNXJxq7hb3SQxifFmMPPbmmlBxiT6MIhX3tfuv
         jGjFDLLGIXtD9Qk1TsJrOrw/6EYO42TbgvPxsHjQd+mWY26E8hafwPDFoNlaalNzod11
         /Xbja4D0JucCGhQs4hODEExRgfqs4EaJAj8dZ10VB8/Fy/xl5ZZNS9PXS8SKA9bNXIty
         9/uc2EiFt+lePl+WvmmRFCMlrd5B7USxRR+531maUHYpAo5qI/WiXPQeSkltEzHpFxQK
         /cYrfQs65wy4hQyEy84WIwuIG4UxKQorodXCy93GN61IYJIlKb0ad8V/R0qxs7dPgwwj
         TGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761272408; x=1761877208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEqhIt0BQfOIO3GHpJ2u1rmHeUeg4YpgUiWjfTdePcw=;
        b=ax++JGBF7JvrHiN66qceTCDlbGx7p+gp89itKKomCpZ50o8ldP+wPb/U9pDZlfq4QB
         N0ekp6G6JFzW9bE06NYNz3eiMJaYIIopEaNP77sjAH814a3YOfiFMxkeFBE/M4TjauPU
         A4S9ImzM1pWEeIvh/+nKiiSJeSZQIxkVcazh6aPEnF5FTRDJVLDI5Bp8Mrkp4MNL5EUW
         WBn4B0nEbbVqiPKk/FKTc7ySq78IgveQpFYo5oK8YK9ZVmkFUJnheOwDWdeieiZlrvv4
         PbS9C3If4k6PFQZKrMsVShWbUgDmatNZoDtFJfrxwdm2i/ixyN7XuVwMqfEPnb9wmL34
         SIWA==
X-Forwarded-Encrypted: i=1; AJvYcCVC3zotMhM4ohEfXkS7j6ZET6H5z3Shj7NLv3k7L9/qh4Gs8RXmlX84q+t9JTg6dz97yPP1wpeH8DHlCFEe6GAQfw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyvu03IxVFZ9xnuZsCeYpsDfGu+uVooNSU/+UmpBAdTHFMr4eYD
	hg736mgiqUr6jnQtEjvh87TrWKhMsbeZdGBX+NHy1o4nxEMV1niiPKGQkUf09mhXPrOTskD8sit
	0vWRNp3fqt0Q+dcj4keKkGBK++O+K0co=
X-Gm-Gg: ASbGncsS7JGoR/uQgwNFzf02CpCSkjaqgFSkx7rsASlCqQN/Pr+ipJMYb9gz7ks2Lxu
	gUW9d0/yLilhDpeiILok80MZBiiOUyc5sfE9wJa1upWK7yuNT7PjQDA42K59ZMYHJu708Oauikn
	04Bq7wnl8c3kgvDvSTYMIvXt/iRVyKSGz+EWLuO0FsMmjgSnFprHq69J4C1nXYdBL1Jm1pEx3rg
	t3hoM3ryE+vjDffSOIpP7dSLZWNa0kGLVtthaWcVAg1Tg3754yCitOhB6cN81Mfk7K5f2YJkVSP
	1B6dC7bG/z1bqKm+pUEMTiWbbmmctILddXHzD/Usph+dct7EfLzIwDX9TM2txws9cOkhcGxhhpU
	wdrDnW6O56l89pqH/4MyHmw==
X-Google-Smtp-Source: AGHT+IEO/UbFZb7/kt5KFkdJcosyQIIrptDS7jPx+lJ+JdPgKeIlyQRH0dC/BrrrMxDzANKLtU96fZYS75GaAJDuWLg=
X-Received: by 2002:a05:690e:1553:20b0:63e:3a34:7bb3 with SMTP id
 956f58d0204a3-63f42b28a21mr850993d50.14.1761272408168; Thu, 23 Oct 2025
 19:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251022043126.989530-1-Deepesh.Varatharajan@windriver.com>
 <CAMKF1so5GsGtuE2UfvxPmiUBtVv7w_y4XHuc1t+q1_C6SH=Amw@mail.gmail.com> <E2D3DAD0-C0B8-4AEF-A812-0180CEE1A50D@arm.com>
In-Reply-To: <E2D3DAD0-C0B8-4AEF-A812-0180CEE1A50D@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Oct 2025 19:19:42 -0700
X-Gm-Features: AS18NWB4WtuD1SDWSzIFixjenPvyC_b7WD5UmwIpVh-IpC1OOngW4VVOKItgYQg
Message-ID: <CAMKF1srQgpZ9U4A5Ma8m-WbcYQBLdmo=9OwLWN42Zi+ggquxgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm/clang: Upgrade to 21.1.4 release
To: Ross Burton <Ross.Burton@arm.com>
Cc: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 02:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225275

On Thu, Oct 23, 2025 at 5:18=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 22 Oct 2025, at 05:43, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > LGTM, thanks for the patch
>
> Considering we=E2=80=99re frozen for 5.3, is there anything serious enoug=
h in this point release worth upgrading for, or should this wait for master=
 to fork from whinlatter?
>

No, there are no showstoppers in there, it can be applied after release is =
cut.

> Ross

