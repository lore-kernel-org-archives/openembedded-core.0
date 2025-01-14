Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AED2C02184
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 09:48:34 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.41312.1736848106840487401
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 01:48:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d6m4hdvf;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6dd15d03eacso48181306d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 01:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736848106; x=1737452906; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vn/KXvDKF/7SjY2x349tNZBKYh5rDz5elLweOrTNwZk=;
        b=d6m4hdvfLKWBXT9qe5WB01LEg8cdbPDG5MlFn/0K56OO35dVum+x/QANwYLAnBCKPU
         9aCszrMnLITtH4sVo++vKgEJYSLo8RTbiZWkmdzwNKP1y7uPNus8YVYGKBbWF7SA6qFO
         ViANHsOyp3//IgDn6aJGHG6Bz/eStxV1+GHfVkdeEWq6m89lvte1NJmV3XLQvaIda7dV
         WRSEjLeZYcvxO0VQXMkffYVHeJsvNssTvDSGULQYDapuAEFQMfFnZx5m0jfaMVS8yInt
         vjUTAcR06RJx8DetQrgwJw6o792KB9+nVZPwZW3Rh50o2IljP5J3oj0C8bl4rmUY1S1I
         LuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736848106; x=1737452906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vn/KXvDKF/7SjY2x349tNZBKYh5rDz5elLweOrTNwZk=;
        b=GBctUol6pcLWfhWUIW3SdaXYJrEfHohG6dBhN+eeN50eJrQDAGkki65C0UwowXr7CZ
         PVl4CNvKE7d1CWJB+EDL07B0ndAoIAd31vmhovaKIqOOstNmHh1DRStvmKawLuowgaP1
         ECEyPubdzzyn8Llvz84qiF0v3JmlGRpUOD3AwVnUS372svJrtxe4/RlHn2K9ciF4cT3n
         6V2rNWIQshrY6NsOSkeJWOWGor7t4X6P+s/KjTiJV+cdVbgF/PbEZ9agNrk5DKQvS51k
         LhMYC/JK4gixNL2tCOnTqV8pY3Agd1Fi6LQ8xfus/Kvc4LITMhkeBWZfpgz+soY3hu0x
         KZMg==
X-Forwarded-Encrypted: i=1; AJvYcCWIJN4dn9NuBxuW3yMqP87Zd1M6I1q5M9Ht13h/fI7IVtQwV6kdyfqPDcRaMD+/Mql8iIYc8PLHUTPXJvOIou17hA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyEtuJTnUU7eG4JyRpSmQlJjvkqdtbbBeXVbgseGavKPJP0Bx2Z
	Gv+wpK0U3+LWTF3IVEM6p8sfBzNEVuwue1M9GJmQGL/2qLBVjh8NWree1LfKvMKbZnIfnuFvdsj
	aiigMPLma24L/3djzjgBtIUqM4cU=
X-Gm-Gg: ASbGnctXXMkudjxd9qB3ZsNk4e+p1+3kJTaCMQTf+uN+vdGENnTwbBk68tPGy34EMoU
	3lbPtmrfvB3uN87dpEcKkJQxCOJ0b3INwgmAK
X-Google-Smtp-Source: AGHT+IEI+pJySybULqSTimfgg5vqPB0K6F+YLwXpi51C613hBpN6Q/7BuM6GcZqR3VxZd93cNyNRvN5tDz5cnuf/6UE=
X-Received: by 2002:a05:6214:4103:b0:6d9:1532:d8fc with SMTP id
 6a1803df08f44-6dfa3a250a5mr283722636d6.11.1736848105647; Tue, 14 Jan 2025
 01:48:25 -0800 (PST)
MIME-Version: 1.0
References: <20250108110844.3849307-1-catalin.popescu@leica-geosystems.com>
 <CAOSpxda7RYcaEf-i_=iKuFiEPun6D-xjm7HOc0s+Dc3jdZu-Uw@mail.gmail.com>
 <08981091-3b9c-4282-b1d5-bd777c69d2e4@leica-geosystems.com>
 <CANNYZj-LbrGbye1PHktf6CRAeS+RcV07H=TbsESG7s6wmRD2=Q@mail.gmail.com> <4d18c6e6-ec7c-4c2a-9a12-98fe1382774d@leica-geosystems.com>
In-Reply-To: <4d18c6e6-ec7c-4c2a-9a12-98fe1382774d@leica-geosystems.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jan 2025 10:48:14 +0100
X-Gm-Features: AbW1kvYR_y_lZF_Nudcl62n9s8HNwTLkf58h-BDIyEuNA2MA7NYgwaFxVGHvSkM
Message-ID: <CANNYZj-rL-oNUyWWt1-HcQh9t7=4mB+=qQ=ma_ECgYR7H4oxMw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] bluez5: backport configuration file
 shipping from 5.73 to 5.72
To: POPESCU Catalin <catalin.popescu@leica-geosystems.com>, emil.kronborg@protonmail.com
Cc: Steve Sakoman <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 09:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209785

On Mon, 13 Jan 2025 at 14:07, POPESCU Catalin
<catalin.popescu@leica-geosystems.com> wrote:
> One easier way to address the issue with the bluez config files not
> shipped on scarthgap would be to revert the actual commit that
> introduced the issue :
>
> commit 49391fdcf71b32c5fd3c7b134c1d1c45cc1db388
> Author: Emil Kronborg <emil.kronborg@protonmail.com>
> Date:   Thu Feb 22 19:44:59 2024 +0000
>
>      bluez5: remove configuration files from install task
>
>      Since be0e796299b0 ("build: ship all config files with
>      --enable-datafiles") in bluez, installing input.conf and network.conf
>      has been redundant, as the bluez5 recipe already includes
>      --enable-datafiles.
>
>      Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> This commit should have never been merged as long as scarthgap pulls in
> bluez 5.72 (The commit mentioned be0e796299b0 was merged in bluez 5.73
> not in 5.72).

That is correct. I'd like to clarify from Emil how this change came to
be, as oe-core master had only 5.72 at that point, and bluez recipe
was updated to a later release much later.

You can send a revert for scarthgap, please write a commit message
that carefully explains the issue. Reverts in LTS make people nervous.

Alex

