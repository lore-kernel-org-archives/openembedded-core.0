Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6A2C54E49
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 17:29:33 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.42453.1710091772121158982
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 10:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YvHroRce;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-512ed314881so3191848e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710091770; x=1710696570; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cw/6K5IlhNJwWVEVK3mvCp3xRO536T049UlQnX0BTr0=;
        b=YvHroRceIawMdradw4vTkgbag3wl6qxQhj4JBN8Uf4M4hI5FquGRp09iANWniFjR1y
         QMD7gWwAhs/w8YgWC/y8LsYVztkesQQCm05dQ67tvhAZ8HgvepMA1xzgezHzNE4rH5Iy
         rnpgyfbComAUGXmvrsPNFr3hSxGDWyDJdW/Ha3LTmOL3fkSXbX1iLDKU10osWwyEZ0og
         CHEplsZzxZHpf5q+pkdcjV8UiI8Err1Y0o4pmoiXJ4di3NNS35VOM7/WICtOPfm4I/nS
         KV3j2kA2Ye7wHEmUADrR1laTEsaEVvdtvPXOVv5RVq23CKONwynBEGUHJFATYX0V2yPa
         GuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710091770; x=1710696570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cw/6K5IlhNJwWVEVK3mvCp3xRO536T049UlQnX0BTr0=;
        b=LCNXpxD4rcseZScBY6BEWQ+KqfDuQV9NvpCEj5khHBhJOhp0s7c+AjQOce36+9BArM
         C/Wdi4ez80wdD6OtAYYDGcU7mPzedaJI4EQeC8v1n6wVGnHCWUKxdqP+nNqX2xG3gSdj
         EEmhYzlKPEt3B3laSxZ++9ouWpK1Cs0i2unzAuO8LI/HQcmVl5Y6Eiy18iuVqayOktF6
         K0A6Rk1BMNkiyVsFejnN4stZTO1Hy7J6MJg4Rh3i8KHx2m8/u3NgZ/xroWodqUpu3qbV
         lZEsVl29y6MzZ2wQBhikdq1ko19oV4fF4aClox9CtcSycVlElC03TBh6LW08vQvMWTQZ
         xe4w==
X-Forwarded-Encrypted: i=1; AJvYcCXr3BXjWZpG49XsdqWQyKEPQDwoaOohhIVGZdbPCVf1G3ryxso1YNtyPKAgFdXi9ODJlbAZyYiJwG4yXf1IdqUTdVWRHkxq3ThNQR9lXzETmOf+j1UoI5vz
X-Gm-Message-State: AOJu0YyrON1jSiKxEd8Kek0lFhry94KUcl25J1xhk23IfZPdjeK3ispj
	LnoV2QdbLIEi6hCKNr3vGxeMRZ32CNNZP9kyXp/2KO7TS3ucEPS/JuPLXaOEWt9lR/QmTrLiEWo
	HFYexU3/9dNUvDtaPV8OEsCQfrHY=
X-Google-Smtp-Source: AGHT+IEcYRW35C0NclSDhcBIAnYnbdc2hSMtkfPsYS3wfVHD7sDwBGMOv+MltCwR3x9YQjpfML4X9FnU2i3936yexx8=
X-Received: by 2002:a19:a412:0:b0:513:1eb4:4d5 with SMTP id
 q18-20020a19a412000000b005131eb404d5mr2651778lfc.51.1710091769884; Sun, 10
 Mar 2024 10:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <17BB704B3D5D1758.5850@lists.openembedded.org> <R915AS.S2SD7P4CMM6X2@t-online.de>
 <54530dfa95ef0ca744fde5ab2b83bb402e4a50fd.camel@linuxfoundation.org>
 <17BB725268800180.5850@lists.openembedded.org> <G165AS.UHPXD5QHY4K91@t-online.de>
In-Reply-To: <G165AS.UHPXD5QHY4K91@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 10 Mar 2024 18:29:18 +0100
Message-ID: <CANNYZj-KYLo3jdXj8GeQJjDU9sEEXvgO9KhmtUKBjcQnNHyRKA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gtk4: update 4.12.5 -> 4.13.9
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 17:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196904

On Sun, 10 Mar 2024 at 18:03, Markus Volk <f_l_k@t-online.de> wrote:
>
> On Sun, Mar 10 2024 at 08:56:21 AM -07:00:00, Markus Volk <f_l_k@t-online.de> wrote:
>
> I'll do some tesing with this patches included in vala and will send a patch for it.
>
>
> The problem I have with creating the backport patches:
>  vapi/metadata/Gtk-4.0.metadata should be patched and that file is not included in the tarball version of vala

I think you can first add the needed file with a separate DIY patch?

Alex

