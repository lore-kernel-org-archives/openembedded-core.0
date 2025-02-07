Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1114BC02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 08:42:31 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.64926.1738917743406041909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 00:42:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mHEFuZET;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b6f8524f23so230196385a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 00:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738917742; x=1739522542; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lxcVqXFbf7DnLo2Qbo+qpvk/DInEb54vnpzkLqt+6Q4=;
        b=mHEFuZETk3ca+3FVUVIvKVO0MAhaA3yky2/lAjdqmS5eY8S1bhufnSqvmVuFA2szxM
         yV8zjYXkXVc7cODKNaEvkrQfnqZ1s290yv6UtKteTyAsUp1Nlt99QQBllPIrKp+8Hb4u
         ta5Lh0Z1dCmr9m0PN0S8rG34dEtr2Pm6xCcemYu/Awn+BQfE9juATRr/LReHwEZx1k10
         O7sVN+q0PLFslhb4tHVL/dCQzGKEybCSBL/gAl7AzFhEko1sMOpIhYgvBeRFFJ0xa2LO
         qycwKKIoE3cdZoZW00LIlC4ISKzg9aTJUOrYCnzYC6WZOcRZW6GovsKGpoV5Ee1BAXcg
         MHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917742; x=1739522542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxcVqXFbf7DnLo2Qbo+qpvk/DInEb54vnpzkLqt+6Q4=;
        b=WdUin5SD8WbemaF+qF+txG3ul7iY5aaiVsvExZ+fHW+TjvoTRvi3tDecx4ZwbJwvAa
         d2w0At9c5LQ2Aahpp+28o1kTRdJqzfMbFVabOCOgSUFSOoCn/oc2T3BgNZDCza7gjH/P
         Ef6Ki5jbeDfzNAMM5tev4zWL6m3FNWXYDPfCII076lS5gZ40qgbWme/D2DFYMSSb4Hmi
         buFL2Cn92W4CKTVFPPoAsOmxnBUpn7rcG03EG2xqhwUr6Z0v5NwIX7X0rfMhttmooHG8
         fPj3rWmCXTTdB1abABBqXb0HcTIYy+73TgMg5TrJNKr+uWAlC5bFaQVaOEgr7n74VP0A
         41sg==
X-Forwarded-Encrypted: i=1; AJvYcCVccTHCnu3+5ppt9xLeyvr8cWTAHQxGVY5FoD8vs1ab1FgDI/yGR+Jxqcfnkp08SV9WpwwFeiRBv06r3z+JSMtFTw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzQ9gK6xe4MNHwiv36xDQ4oR8TRKAwTncpMShOOhtsEWPnFls5/
	HTTNiWBostEZQcY6G8+p05xLgdRdKRRH42NMBJY3AD6aVrsujMS57sXsE/m2PBPHbCx12Z9T3Z0
	2gSBWS0BsHXfRvpWJafdUeOjKChM=
X-Gm-Gg: ASbGncualtRD2mCKgfOikVCcMJKAr1lpb0Yv9EgZ7I4+sLtW7f9VTtC3vhTKJkvkpSo
	hjjT4APgto1lIDSG+bsl4u4lnq8peTBDb0t66oQ0PvIHM2XkSFCO1SDkNFW6dOopAdutpK38=
X-Google-Smtp-Source: AGHT+IFpVSpPJ5XTHpHamDaGcZUSJH/jzfRRbZUaQuFumc5eIJsvlmqxmsX0PWuYLgwBnk/0VMrDPgcLjQEQrmC4sbE=
X-Received: by 2002:a05:6214:1d24:b0:6e4:2e12:3a0c with SMTP id
 6a1803df08f44-6e445701c9cmr28939396d6.39.1738917742303; Fri, 07 Feb 2025
 00:42:22 -0800 (PST)
MIME-Version: 1.0
References: <1736986779-18213-1-git-send-email-wangmy@fujitsu.com>
 <B0D54F55-821C-42B5-8EF6-285E7055A9D8@arm.com> <CANNYZj8Lbz7s6JeQzrXu=MCbyQ5bC6RZcyLYLMc6MyHvcXLc6g@mail.gmail.com>
 <TYWPR01MB118610AE7185CEB27A28AFD98DCE12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <CANNYZj_zmLZnyPPKoRs5GdUe4sS_Uw7dtgET39=r7g12-3UF8A@mail.gmail.com> <TYWPR01MB1186150CCA7356A0F8E211977DCF12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB1186150CCA7356A0F8E211977DCF12@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 7 Feb 2025 09:42:12 +0100
X-Gm-Features: AWEUYZmiUITnIYyGGtuasB2qXVjK75SSWuP0ecme66_2Z7UAr7gLnXdG-bHcj6M
Message-ID: <CANNYZj_O4OQtAXnzMAB2H7vH27zGApga-T=q4kLFiKzqyNXrNw@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [PATCH v3] ncurses: Fix install conflict when
 enable multilib.
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: "ross.burton@arm.com" <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 08:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210975

On Fri, 7 Feb 2025 at 03:03, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com> wrote:
> I discussed this issue directly with the maintainer through email, so he only mentioned it in the changelog and did not leave a record of the discussion on the web.

That's ok; generally it's preferred to hold such discussions through a
public channel. If it was via private email, please mention that
explicitly in the future.

Alex

