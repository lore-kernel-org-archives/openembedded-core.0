Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9B2C0219E
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 17:20:11 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.57755.1739208010081371379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 09:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q+w8TcIs;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso43524256d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 09:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739208009; x=1739812809; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hdDjiMrCLL8ishV80com4aKCrdWBAR9289VwqTRVSdI=;
        b=Q+w8TcIsW3r1gsj3K5qRC3Uepvl341F6MJek74Ad8JldxXG0lLY7y/MVcdREbhUGRm
         4hVtAnCWkIovt+3J0yMrGN2JtbGuSLGSrMPRX82DRRudZr/raCOOV20ovgIMklird6P8
         HHadVtFgumLFTqenZUQcFWNTS/fjxLzxZ6iW3hAyVdA8bLBajJIpMifH/1QWhTCSQtc8
         V2w3/pNs+RMUFpPK1mOf+vR9xegOETfllVN9ACTT1ZMjTTAjowH2RcpqnMfGE+cpkwog
         W0bXX9OmXTU3qnuDNn4WhQ8/kvbxwvEN993T8ZL/9Ewhcy/nvKvjP7z4qYRElovJxeWj
         DozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739208009; x=1739812809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdDjiMrCLL8ishV80com4aKCrdWBAR9289VwqTRVSdI=;
        b=vJc3VCVf1QZz9yItUFqGABQ4u51RgQ6EyQFPlbW2nNlkeBBQVsVKwbQm51gvYppakh
         PZ4Xn1K9SX2ZvsIn9cdOP+IMbXvhTUCDiXqTNf24kGM4XKooM4sIDwS5rZN1ejW0yJ+w
         rBEOSTPspnNu+o723omltbaN72kKAl73gC2DW5PzEilJDXL7lUKBwfceAMcGBCRxqDoZ
         Q82Z6mr2ghUTis1Y0t+IboUbBNv11N44GR/GXp+gsxv3GtxtFoSGkeRbNOpHVmhc/Igo
         rcaKpGsnsdPmMDeJ4SrJiBJY20wHQpKtvYnCwNxVPpqkKms/0SduLHSRf4RhXWuvEOpV
         +U7A==
X-Forwarded-Encrypted: i=1; AJvYcCXDcdDK160TLn9xmtlBO0SS6IDqsCDuk969ME6Af6TmjwfwcxgovAi/AkOzvQQtC1JtbwEIKjg+RMUDggYTdD3F5g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy4jGKzzAnRU8++Ox8aIthq9tj0+qihCg86fVhyRkLPFFpaVSiW
	yNeJqxm0EVPXiMvEUChqpcL9jod3NxDQ8sMPq2S6LNxe0Pp3ZIjESeNeS8tjuaK1HiXiujxE2R8
	SlOyL3t5prHtFpi34nkHoDBPAEoM=
X-Gm-Gg: ASbGncvpm+gIrbUXYhvvoexJ3ZKpR/6NA8mm6be/10uIIapUM/FCgNw+F7HGW/86vWt
	xJIWHF7mto9nSwE9eatAEy5N0hqHGrJ2k7jVZoMfCrTX15cEgJSDHfzE+K2p+V0/AinIQDkxZ6W
	OKKZcW7NRMAkx5+Hqkt8qzxGqX3IS0/hM=
X-Google-Smtp-Source: AGHT+IGJV4PTqRC+oD5vUjGkYd8fZK1qvbLyzypxIphGa2VxxKifwOlDO1QjoS8QP6ROKhR4Po+a6RAZJjMWHrMMCiQ=
X-Received: by 2002:ad4:5caf:0:b0:6cd:ec00:205e with SMTP id
 6a1803df08f44-6e445404817mr218722596d6.0.1739208009143; Mon, 10 Feb 2025
 09:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20250206144907.1924993-1-oobitots@cisco.com> <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com> <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Feb 2025 18:19:58 +0100
X-Gm-Features: AWEUYZkWwZzNUuwHLGt7lJPUqVCIV8dYfHm6PWHTrn48JPDoGA19E5pJ_bRCfTE
Message-ID: <CANNYZj_BoKLY1dgiAW72Tuc+EF6BFCSfKozN2X8ibdCGqbgifw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate subpackage
To: oobitots@cisco.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Ruslan Bilovol (rbilovol)" <rbilovol@cisco.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 17:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211108

They're not actually copied. They're hard-linked from
sysroots-components/. This is a cheap operation and it doesn't waste
disk space.

Alex

On Mon, 10 Feb 2025 at 18:05, Oleksiy Obitotskyy via
lists.openembedded.org <oobitots=cisco.com@lists.openembedded.org>
wrote:
>
> Hi Alexander,
>
> By 'deploying whole systemd' I mean next:
>
> Every component copy and installs packages with libraries, utilities and config files in component local sysroot, i.e. directory used to create final component image:
>
> libsystemd0_255.4
> libsystemd-shared_255.4
> systemd_255.4
>
> So, on disk we have duplication of files for every component that depend on the systemctl.
> In case of separate subpackage we have one root component depend on the systemd and all other components will contain only systemd-systemctl package content.
>
> Of course, I understand it's quite a specific scenario.
>
> Regards,
> Oleksiy
>
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Monday, February 10, 2025 13:03
> To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@cisco.com>
> Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>; Ruslan Bilovol (rbilovol) <rbilovol@cisco.com>
> Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate subpackage
>
> On Mon, 10 Feb 2025 at 13:01, Oleksiy Obitotskyy via
> lists.openembedded.org <oobitots=cisco.com@lists.openembedded.org>
> wrote:
> > We have next situation:
> > - a lot of software components that depend on packages and deploy all packages they depend on locally inside component.
> > - some components directly depend on systemctl only (e.g. this binary used in scripts), so for every component we have to deploy whole systemd locally.
> > - finally, all/some of those components will be merged in some way and will use systemd/libsystemd, but until then it will be nice to get rid of such duplication.
>
> I'm sorry, but this does not quite make sense. You need to more
> specifically describe what 'deploying whole systemd' means, and why is
> that problematic.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211106): https://lists.openembedded.org/g/openembedded-core/message/211106
> Mute This Topic: https://lists.openembedded.org/mt/111032725/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

