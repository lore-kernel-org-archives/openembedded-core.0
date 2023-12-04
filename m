Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B4DC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 14:35:21 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.70041.1701700519814320005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 06:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dkz7vJpC;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50bf1e32571so1605540e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 06:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701700518; x=1702305318; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fsg7/WrR5aHgRYNRx+lc4ZOldAkWbIXVA68oeaGHKvU=;
        b=dkz7vJpCG9EwnJJSDoby+80U3Vr9iHlZfe2w8SHszf+Fi0Um3H8a2o/Qt0KrOd9RE2
         KEhGj+pidxcn+BFUmEoH9gHILi3X7uyVyEcjuHGNY9hrcmcYn65fk9+uk6SCMtvhkMZB
         zJHT/V7Doe8UoM+KBFgRp5urlYJ9l4HHCJLx1HzBBrAIXV3e+pXG7mdqvw5vDna1q35M
         vVPcKdBAqBn8YuwrJlF4/2Nk8eH5kPFVAK1VRt5629jlW/GSUO6K3P961S7q95HJR2Ce
         4hQGs7XFUskQcWhhR4C5+ejst2vDhWzMIVEIGaKjKKZ2dNPoPBO2+cGTPT3V7i0KqqOe
         rVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701700518; x=1702305318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsg7/WrR5aHgRYNRx+lc4ZOldAkWbIXVA68oeaGHKvU=;
        b=Ppzsdq9YabyVoDgLBkIA2vi7tCNh7NHznXQp1TED+Sx7y8fBYlak+T31KdeZv7GHR4
         FplU4R1/DPPAtM9ODjRpzt5vCg3JwN5+E253+HqlpF2/+MeZqVvoU4ZgFRXzo1Rw23mh
         faC0SXLB3NQHjc3R2cbCQJLSseZBkGVRCpLMUkil1sHjzDw78zRQieApxvhofOtTBrVq
         Z5QU/HPSO8wIA2TL9vhPDqQBMdgQzGA7Nl8hqotZkA57opLMEtYnWA/i1sf2h5crkvNl
         HX/vP8KK0tZFWWoWhryIF71cMmrFXrzjzIDF5njmo6rU/iL+zqA3vRVNNX0PoX/bgmjI
         4R5A==
X-Gm-Message-State: AOJu0YyeR3nFF/HsUXoz75ik82Z51U51xDCilkVFqiRHS6LtH5seLC/O
	S86JN6SY5uGLOUQOTPc7wCeAy5A9xDO1YeYRVgg=
X-Google-Smtp-Source: AGHT+IEX1OO4lOXsELBia/+LinEVbA/2qGvnv87tC9cIGtFCD8QYo1VnfkfMpO0WLggUXeAmRku8/X5K9JnIqgdpb2o=
X-Received: by 2002:ac2:58fb:0:b0:50b:f486:88b8 with SMTP id
 v27-20020ac258fb000000b0050bf48688b8mr745993lfo.76.1701700517812; Mon, 04 Dec
 2023 06:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20231202190328142d6d70@mail.local> <5225.1701696829557952852@lists.openembedded.org>
In-Reply-To: <5225.1701696829557952852@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Dec 2023 15:35:06 +0100
Message-ID: <CANNYZj_MaSkVc9SS5vJ4TBDZ7oMV-iXfqDi54U6cMyxuqEL-bQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
To: Andrey Popov <andrey.popov@yadro.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 14:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191741

How big is the script? Can it be 'inlined' into the class as a set of functions?

Alex

On Mon, 4 Dec 2023 at 14:33, Andrey Popov <andrey.popov@yadro.com> wrote:
>
> Hello, Alexandre!
>
> Thank you for the feedback.
> I think I can eliminate the xorriso/libisoburn dependency by replacing it with a python script that I've created which uses modified version of isoparser python package.
> However, I am not aware of the correct way to include this tool into openembedded-core. If someone can suggest such a way (if it is a good idea after all), that would be greatly appreciated.
>
> Best regards, Andrey.
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191737): https://lists.openembedded.org/g/openembedded-core/message/191737
> Mute This Topic: https://lists.openembedded.org/mt/102896781/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

