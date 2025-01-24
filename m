Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644B4C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 10:46:02 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.9134.1737715553294728129
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 02:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WnMIvZtz;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467b086e0easo10892591cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 02:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737715552; x=1738320352; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsS2uzO30mqrmnN7PX3h+1SsjfKJXzgH+o7aRfBEnWs=;
        b=WnMIvZtzgk43r3lkMO5S6BVVHFKSprh4XQzsEgP1h5YIql7L9XWLws1pOW1O5UOg7v
         iNNLezJ2ywFgM25A9OuWDuERrraUM8E7d+rUft6ez1gmpEgA7tZMQBJU72POgNtv9eug
         Mqc31pZRy5yPHrTgf2rizxfzf/0iI2rpLgTsMXq9bQfR0t5XeI0WuTeqN4kNrzu7EAMR
         dDqYnglJir+Lg4wQfDnK0lfWlBNtbihgMgXKWSNh32tpojWvcAYLwhaQiVD3jf7Yzlgv
         rD9XmCAxrYeG5z4Q7r/FDYJCBCzHgDfAT/hEefPkClbpuiY3ufmaLCL8URbsBRaLI2+o
         H78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737715552; x=1738320352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsS2uzO30mqrmnN7PX3h+1SsjfKJXzgH+o7aRfBEnWs=;
        b=k7Mn81en40p/HztbnCsVmmCdGxAldws64VO32QkjMAjZrJBlp4r3Poy0Xv/ENW7aEd
         cu1fMbC0PCdKImd6Z+5rjuMoJh9DMKSY28Ljxt4BTe1tge1rTm3WJUFfFFnyExHfz0ED
         Z0NOrAWWWLJ2EYIP5/JtOdCE+EQFSm6Rm0HV1AsIVZVPIQJ0EZ2XP9XoPkzNbnjgjUpL
         nocJOXeocNZG+tkVcAiC871lFoeiHoogwFWwKgvv/Rx3FiNTGZSHtjHzoaVbHflWoFnA
         SUppwEBSbrYLV7uQcBtTmIDaZ7ku09+MhLuWnmx4stuTNrInM7YSBASG0rHOjWsFRDIG
         sJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPC0XuWrGL8aAeH8M4KnDhS68IOVnyhXmFwdGXbZbNr/loHTejGBS20f/jeUVguhj8gdlVw/ayh/ImPnyp39bq3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxCYtLFvr84cGS6OeX/eZ2hu7qt1yw4drieo9Z9VBgkkBW5ZDx3
	x7PBlBqUAgPddU999aHrnfhhSEs3B7Rfsjkiz5x7LPEauz0nTrRxG6/nFboGpGpQuxqNMNeXy2y
	1h0pAsHeVGY8wZ74T6dmm49V0HszbUA==
X-Gm-Gg: ASbGncsEy35T4DBhk2ENjtXzsSdQAlgLalobYTJVuXaMM4FWiWjFtMqxbtGv2FqNuow
	oERVxYgfWPQt8eX/Cbojwj6cKFxqMIDA3acU2EILqf6iYqCVq+WzA7KAjDzUJ
X-Google-Smtp-Source: AGHT+IHLKaChUlZ4PUvK7Z8Xu2UVyOnFMTzZkivdYzuLF+jSn7AKTylzIX0w0nnUkHbF30TXZYNIsA8j0FWYjIS3gI4=
X-Received: by 2002:ac8:5f06:0:b0:467:53c8:7572 with SMTP id
 d75a77b69052e-46e12a55504mr527384521cf.13.1737715552399; Fri, 24 Jan 2025
 02:45:52 -0800 (PST)
MIME-Version: 1.0
References: <1736986779-18213-1-git-send-email-wangmy@fujitsu.com>
 <B0D54F55-821C-42B5-8EF6-285E7055A9D8@arm.com> <CANNYZj8Lbz7s6JeQzrXu=MCbyQ5bC6RZcyLYLMc6MyHvcXLc6g@mail.gmail.com>
 <TYWPR01MB118610AE7185CEB27A28AFD98DCE12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CANNYZj_zmLZnyPPKoRs5GdUe4sS_Uw7dtgET39=r7g12-3UF8A@mail.gmail.com> <TYWPR01MB11861F43C751CA906A41A7AA5DCE32@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861F43C751CA906A41A7AA5DCE32@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Jan 2025 11:45:41 +0100
X-Gm-Features: AWEUYZn17nrMXpEytCdkL-9i94RXOj5jQKlykDew_hpsOP9pn5exUplCzX99G0M
Message-ID: <CANNYZj-jKtRBwEiRK=d=jprA6A=gHJELEeT4NbQsPfHqkCOM9w@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 10:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210218

On Fri, 24 Jan 2025 at 03:11, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com> wr=
ote:
>
> The upstream of ncurses has fixed this issue.
>
> But I'm not sure if it has been completely modified.
>
> I can submit an upgrade patch, do I still need to specify --with-xterm-kb=
s=3Ddel in this patch=EF=BC=9F

Unfortunately the upgrade patch is not acceptable (I wrote a separate
response why). Can you point to the upstream fix that they added to
their repo?

Alex

