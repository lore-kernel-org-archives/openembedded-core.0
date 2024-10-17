Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07FCD206BA
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 08:35:13 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.44489.1729154107425630276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 01:35:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CBDV/asM;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so7039471fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 01:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729154105; x=1729758905; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EaIO9IhReC2fNRUx5rYKnZUIjzH6FtiTKDWNEsVDCLw=;
        b=CBDV/asM4n6JhSvFsiW3glW1Zk9/J0zKssYEmAGxF/8lIRCa+VWJUSynGLHSX1R0+1
         VMPxJqyA/wbIxh1pDv6VnxmXhskQ3fLWgzpuf6Gul/VigdbSWFZIepHskQPstH5w8fk2
         w5Xj1FFWCv23X5WOIiEbeBYXlpro+TNB8S7XSc/PSAGc3bie/1wFFIzR7/jLSeMBB848
         NKxKHPCyLkMtmqJFNZTSytSb/NNUrQTCzbPB6eYiXclR+hD+fgQmbCmMhSOLmjqjI7hr
         md5xXOIRQFrwhGymB/IitObRV93f4pFcpTETx2mcHaA1gNi6VG7f2CDkTkcFed04Er+/
         vzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729154105; x=1729758905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EaIO9IhReC2fNRUx5rYKnZUIjzH6FtiTKDWNEsVDCLw=;
        b=S6LRuDztgV9vXKyzt9lWOPLe9u/LqtYAJzbKdS9RFRchmvSJDm0t7tOjGtBZymhxR9
         TEWSr68Rl8FPfwj74mMcENM59Y4O6OIp9JVwBui6AoIooUBfAY7TPm2wINk+dklEKaE6
         QtTvk99w8FyzsQgrx0yhk+NPHN/M9D8QLQxS0oWPtH+8bVjLG3MfssNJIGCKcxDskADd
         Zx9q4fUosRRR0gjqKhLs1QI+j0uXiyht/976gIdC6hMLgEgp2vTbY3ctAJzH9xawQ3eE
         794r7jDlMHK5ie56ApC0dWBBrz9ldwqVV9XvZqqDBcCW4cOIWdTMgq8ND1EpDL2tDTGo
         E3xw==
X-Forwarded-Encrypted: i=1; AJvYcCUmZFmwLodDCFKtlIGaMHAbEiY0MYZNNVwbi1NKqLW2Dt4FtkWnwOH6Tml9oPZplU8uK4VJmMkTCNp+XWgrzcJINw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGxzBkGYsH18EmgFzj8sULVuD6gTkWKhgFQNUD9l/Z47bgPaLk
	W7UEAEmG0C4M2XlQNlkUw9L70YuJKWBMmFGfxskqTeLLXpHi4QefDYVcEqwUTXiAQGnNwBko5Oo
	883KBByiI9pGMYtbPw0BhTKtcxAw=
X-Google-Smtp-Source: AGHT+IFjACiLGIy+bQrmRsBOyCNum9dqejTBdvM7WAxRiHJRzF7ewr8S331ycLIiJHZsblDBLglZkfmWPDZgivzFW4g=
X-Received: by 2002:a05:651c:503:b0:2fb:6394:d6b6 with SMTP id
 38308e7fff4ca-2fb6394dac8mr32412271fa.16.1729154104890; Thu, 17 Oct 2024
 01:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241016122555.21496-1-workjagadeesh@gmail.com>
 <CAMKF1srq8CNR7xuNDov3Vh4JjipFWjzuroeL35HFF=CKKS0vhQ@mail.gmail.com> <4a307cc0-2ff6-4d73-9c0b-21893be1e5d0@cherry.de>
In-Reply-To: <4a307cc0-2ff6-4d73-9c0b-21893be1e5d0@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Oct 2024 10:34:53 +0200
Message-ID: <CANNYZj9pvdBWn=O28LUkZ=c9ZKOc3WgOvviRzkHNJv6qLSQHgQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] tune-cortexa32: set tune feature as armv8a
To: quentin.schulz@cherry.de
Cc: raj.khem@gmail.com, workjagadeesh@gmail.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 08:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205988

On Thu, 17 Oct 2024 at 10:18, Quentin Schulz via
lists.openembedded.org
<quentin.schulz=cherry.de@lists.openembedded.org> wrote:
> >> Cortexa32 is a 32-bit armv8a architecture processor, so set the tune feature
> >> as armv8a instead of aarch64 which is 64-bit armv8a architecture.
> >>
> >
> > That's right. its aarch32 only arch. This change is fine to apply.
> >
>
> Do we not have an issue with
> TUNE_FEATURES:tune-cortexa32          = "aarch64 cortexa32 crc
> callconvention-hard neon"
>
> in meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc as well too then?

The patch is addressing that, no? Is there a different file or a
different issue?

Alex

