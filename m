Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753DBC001DB
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 20:32:33 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.13430.1691267548097921808
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Aug 2023 13:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20221208.gappssmtp.com header.s=20221208 header.b=b2NE2Fha;
 spf=pass (domain: ossystems.com.br, ip: 209.85.128.178, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5768a7e3adbso62753307b3.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20221208.gappssmtp.com; s=20221208; t=1691267547; x=1691872347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmwzWOkunIAACD357hFm9VQYaiirkKg3vEc4Tew7WkA=;
        b=b2NE2FhauhyI9zgusTBKjlrbgANsB6CBJ4IT4TfTeXdvKxaNx/ofY3VLnHZ6Svc549
         7OpomFZacQaLIlWS7ddhxAk0yhNl1q5Fq1lC1Me0nWUVAla/PaVXA3/nzP1dcV/mD2Re
         ItsLzUXEDjiadIsT/mR8VuSvBmy+0SYE7QVBTBUQPp+RdOrHsZrPLNzf6d3OOO8f2C4e
         eelDdGQiponJx0B/rr3YAT0N88F0z9Kc43aIt+CYs46oF7ADGGWwDRRKgL2Bak3hdsbC
         pHJMWvHqadqufrY9zY8VEjSXjPke31A5HuPQBUzbqcZGsr3uX4+ySRf/sTJHBgliBZXw
         QIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691267547; x=1691872347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lmwzWOkunIAACD357hFm9VQYaiirkKg3vEc4Tew7WkA=;
        b=iVURaSYudwQdnYmyv2MSjhcanaGSWgSpq3G+XwxdoL42va5HulV23qWtKpBLGUkr6J
         CmFaQ66F1X8BVgA5v3wc8XV2g+rfHdCx/HtI09wObxGAW4vfvdAlWRo4pHK6ewpR+Eq7
         lSpUB1N9kMiiV2s4e268UVdZqm7muT/OHw3i4GiPJ2uPGLvQ8MACC0BuJl5XyzB9Uze2
         FeGUfplTh6NL9KuL90bq/MTM+CusGBjQk23y0oBmWoi1dkBAU41NWluE/sdwbayfqjeC
         QlMzy16XpfZg37DqYnvWWDJ9t+imZnjXn1pHagCuV0BpyCslBufZRAn52TDP6iLGHYXR
         64Dg==
X-Gm-Message-State: AOJu0Yy/WbXabpgEI5PZkZuY3thPPbg+Se7pV8UhzLZITvtxV7XD+1Js
	465dhG6B7LqexxjwgIVDtcO4rI1dWB97M6PaKvxKtg==
X-Google-Smtp-Source: AGHT+IGNFhIWFPH59mQEZxVU6Qdr641Nnk5NuhC957b2W54BTw/M0RmvJSe59CU71sMZMhKc3hgG6Q==
X-Received: by 2002:a81:4995:0:b0:583:aca3:469c with SMTP id w143-20020a814995000000b00583aca3469cmr3865453ywa.2.1691267546767;
        Sat, 05 Aug 2023 13:32:26 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id w9-20020a0dd409000000b00586ba973bddsm854380ywd.110.2023.08.05.13.32.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 13:32:26 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d299ed34bacso6245235276.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 13:32:26 -0700 (PDT)
X-Received: by 2002:a81:4e83:0:b0:56c:e480:2b2b with SMTP id
 c125-20020a814e83000000b0056ce4802b2bmr3839094ywb.12.1691267545955; Sat, 05
 Aug 2023 13:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230805070334.230324-1-f_l_k@t-online.de>
In-Reply-To: <20230805070334.230324-1-f_l_k@t-online.de>
Date: Sat, 5 Aug 2023 17:32:13 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqSnpORHQPsAoBU9zfHDM-6L20GbwtL30BYpBWoq6EfQA@mail.gmail.com>
Message-ID: <CAP9ODKqSnpORHQPsAoBU9zfHDM-6L20GbwtL30BYpBWoq6EfQA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] systemd: add less to RRECOMMENDS
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 20:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185556

Em s=C3=A1b., 5 de ago. de 2023 =C3=A0s 04:03, Markus Volk <f_l_k@t-online.=
de> escreveu:
> journald uses less to display logs. less.busybox can do the
> job, but it rips out support for color/highlighting.
>
> So I would highly recommend to use the real 'less'
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>

I think this should be added depending on a PACKAGECONFIG. Adding it
by default seems overkill.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

