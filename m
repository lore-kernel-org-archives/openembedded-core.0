Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC40F11258BE
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:04:23 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25302.1773331460901538346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 09:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wo7us8fL;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89a465bd7edso9264256d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 09:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773331460; cv=none;
        d=google.com; s=arc-20240605;
        b=cTP1OWDk748NbXRpD9dgldTGW9sdny2fQvB6UWut8mAahkzMcGYwNSGSqjnQ/k2F3M
         CI4dfjxryWgwuotGxA497lqlrZIWVMJgdlqbjSR+0NEMZCdM5lNn835Ii3uUKdj9Ny/I
         QXjPnBYxl3NYwjzr2XZZd0UBQS5HZHTEUgjS11wUVTJfo3XLjOd14wsU0ZELz5OcghFl
         rOZVE9uuRsVXsqO8rnBxO33Z/2LJb/IBjiCnwhZvrsZJARYG4wWbiI56IiqkNPRkm5Fc
         mGsScai+PXFdM/e7DcxDi9cZowLU0M+UE6LtohZ4mxbSge3ZgEiTOjYVq6IUc+JwY7he
         P7oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UL/BFnK+oAnM8l/nmPYIOWeqs5tV9s/jOE/mY20ZZGs=;
        fh=GftaUKfWgEil+Mwabps7tbMTKGpb4TWKSgWbL0gL2A8=;
        b=IbRpXfUyDTX6Lf80Q+w5/sCPAzmnZjQreYMV730SlSXJzccMQo11ofvf8Y4m4TBnJv
         8cvkWYIXueQcCvduMFPufSUTA1lcnKBaWY3SkhdFz0JKEDuWU4bxdvPV7opUO//Tc7RT
         AvYyq2NYsAgQTzNPeINqD3HTTcf+V+kQ8fRvhBQpK9PgUP6ns7M3cHGHmOMr7SQKnjO+
         m0hKJpDQENs3yc5YZMjly2qemMRmHrZYcQxjcSpKypPzwq0KqRmrl802gjmlhKVf86vK
         XmaR0pklvbp9W+a40GInnZMRPfjHsH0M+/FqrRs8fEVC3UHV8p5L5fzTN7OnT3Mq73Z9
         rZ4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773331460; x=1773936260; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UL/BFnK+oAnM8l/nmPYIOWeqs5tV9s/jOE/mY20ZZGs=;
        b=Wo7us8fLQrIAcctxpQHUzCJumefxGVeEHlZj8+WSULqdDhMuvQWCk79J8wttJCbAiw
         tn0pRNDk3g9lQ5S6Mbi2rdUyu3e9OwqEThL2QQeGUXPmr2hhutKqyDgvYLp5+WK/UeZo
         v7zTkoFb2eJcWZEvHiUkIZ4ilqNrIv4EvqxIMTX2mzfzH5+ecaatXtyX7ftMrvw3I2sn
         Y87ZkzinOrVHugR6S8TmOVl5KLtiiXALMSojTzeaPCXMBG2XxNSdkmwBnSTVcYaIkt1E
         9mVneyk2tpc1PsWMyD+atyrV5vJR7NVXs2Ld4XrkgEhsxtiGHNF226K0iSwv7OemcQ6j
         sPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331460; x=1773936260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UL/BFnK+oAnM8l/nmPYIOWeqs5tV9s/jOE/mY20ZZGs=;
        b=YkQPXRgt2m81i5kVFhO5FJm8XM8qfeIHubw/F9w13STx7ZQUi8s2NBcjR23dZhcDz/
         t7Tp9ZJQpC8W3B9boxba84u7qrFSbcggVyfT5ZcER9swTDxtP6tjJGoc3Su4VwTZNqIO
         8Byyd6cgUIGX+92BYcS0C+b7GIopiIM2+Peeoh7E3YIxiuNvCQEJlGCOh/3LJEXxdq0v
         rcNGi7Tot3O93czdm+E9w7zhJZMiliLnJOGXJemWQRs573JpR2pG2f2dnx2Bhv3ktbP7
         r7QreCj/Dn1738HkaVfVI45R52mDWn0m9ttJ5P1gOktlRQciDiQYGvZ/BUY5RTMOobsi
         HdCA==
X-Forwarded-Encrypted: i=1; AJvYcCX2MiJm9mhf59Hy0UQ6Yv+qB8ko0Yay2xWVyvn9gRASz68KuaSRGHlwjCXmO8/YgAW5QSalogvzfxaL3o2iWMJSBA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzm+KZPjTxPrbIUD7v4En0g3epiorBY8qHOzS8N1lqxTp7kvykw
	tF/hGyhIuoougRJRj01NwCaVbKR9k0gZmBYsvmsDJdq11fmETUYrC9dSjVpIHUDPVHuYVqW7STG
	2AYV13ES0wTSJzkPddzqd617yg7aVF/A=
X-Gm-Gg: ATEYQzziQ2b/jqhGhWPXJs80FDyw97N20hqltL9l61qiWBYtzhMFpZ3RYAC6xvhHkkG
	b6fWymMPnOXrWJGJpSx+nJO1rcHartHJOv4QX2jIjVWfSUE6gLTTHOXVcYklTANwgc9NX+4iDMr
	BdW4KvtxpBiXmbXIqjCkW+0YECNATZ1lBencCQmjO95KfI2Fv1LzUilJB1vbU3BSKEpk1qKy5Vl
	fw2VasQ6V/4Q83kpnxWUo5h8RxpNXi4FDTt1/N5s1ZHe1CbX/eJPFLTbawDZG9vs6m3fZbSqoIG
	LFBg2St4wjNAPvAOgMaMgovcK2X/dl6aBCLZHoNGfg==
X-Received: by 2002:a05:6214:2587:b0:89a:f0b:dc0d with SMTP id
 6a1803df08f44-89a81c77bb6mr4385486d6.9.1773331459568; Thu, 12 Mar 2026
 09:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <SN7PR11MB770572B1859AB0B7EB592DE3CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj9Y0Fk_DHxTcP-2cqmYnzcD4_VSg5eihwXp1Vc10HbREg@mail.gmail.com>
 <SN7PR11MB770587ED31BE8EE18D973740CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <SN7PR11MB77056419029EAA594968E1DECD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <CANNYZj8uCJWnkhvh=CecWiawWd57k15wdqcfzc3mtbxoMFqSHg@mail.gmail.com>
 <SN7PR11MB77053FF5985F085C57270866CD46A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <f2209b0a-c297-463c-97bc-7139732c498c@windriver.com> <SN7PR11MB7705A4E28D635E7CA5B10512CD47A@SN7PR11MB7705.namprd11.prod.outlook.com>
 <8b79a7e5-d706-4d4d-ab23-6933eece6c93@windriver.com>
In-Reply-To: <8b79a7e5-d706-4d4d-ab23-6933eece6c93@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Mar 2026 17:04:08 +0100
X-Gm-Features: AaiRm53jTbjRBDsSJUiQM4Qr1QoXqTMmtdoLvXSs3G1yuEkJ2jwHToGaQCCkr5E
Message-ID: <CANNYZj_-OS+OHnV+mPpCdmk5fBEtXBtx8kWzuCSLyxc=tUhkBg@mail.gmail.com>
Subject: Re: [OE-core] RPM 6 in Wrynose
To: liezhi.yang@windriver.com
Cc: "Matthew Ware (mattware)" <mattware@cisco.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Elliot Sparling (esparlin)" <esparlin@cisco.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	"adam.duskett@amarulasolutions.com" <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232985

On Thu, 12 Mar 2026 at 15:15, Robert Yang via lists.openembedded.org
<liezhi.yang=windriver.com@lists.openembedded.org> wrote:
> Thanks for everyone's great help, especially Mathieu Dubois-Briand.
>
> This is the most difficult work that I've met in the past 17 years.

I want to express appreciation for your perseverance with this, I know
very well how tedious rpm/dnf upgrades can be. Hopefully it's
beneficial for you (learning how a key component works), and it
certainly is beneficial for the project when more than one person
knows a subject.

Alex

