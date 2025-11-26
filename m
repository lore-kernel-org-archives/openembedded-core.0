Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93179D11196
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 19:49:41 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2688.1764186579370293888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 11:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gpzw+kqL;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3e89d226c3aso68260fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 11:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764186578; x=1764791378; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V33Rb7QNmXP699rDklL6eBRqwbM974QCQFURkDBtcE=;
        b=Gpzw+kqLIOaStoJxPnqr/KigP3sTVCpeD/i3AUmWHeI4wynyVOV6narru0CjFt27YD
         STzTGVjPtgepL0GPr4A5hkiMM1w+Ln4va7WZHieQBqC2eNyPKMJaKPbov8nxOAEBBkEE
         gwote/jpWS7nCTLg+bpH73N48DibQ/EaXRH8PLU2EHA5IWuqnihEOSiIuYkDi/6qiV3s
         BS413DZh2Z+Da0uzAVzOhGmAoUqxfFFVh3NWQzQA5Kz39wk1GbG2uudCO1fhmiLqppx7
         mbj1F4LMtFk6+e1CBgLzOoR/E/agSIEBUNT91J8Y7Hjiak8mNrMsWunqfTPGZ7R9f4tJ
         2dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764186578; x=1764791378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0V33Rb7QNmXP699rDklL6eBRqwbM974QCQFURkDBtcE=;
        b=AmDvbTCk9pVf0iltXyENk1dtzcB/Sy1QqlhtG1W1nGKPJHQcq8WoeEPj5W3W+/x9vZ
         M/MmLXy76BTTeO8wS5ifzV10DUhwmyruC5OUnchiOVw5rkDdWD7yvcdjtdCg6TeqaFoE
         BED8deYhb5Wq5pTiRnBdd9bMIyILEZJxe3c+ix+PgNbtLi5emuJkcwchy560vdbkrn60
         0rMIXuwXeaHQAYzwMjTiansCIo8u5RqFyBEZF1OL1dYRudjAoEm/dhwQSDfVXZ4GP2ER
         ez31QZAALjX0i3JFY4p5Kn/mGdoC3ZSJixjz6zq8ihH11zXX94KWq3lADZJ8tDQNpyeN
         NbVA==
X-Gm-Message-State: AOJu0YzzzrCI+PqiJHed0NxMdeRdv5x7XEeDw1zVxc5WYXznllO/eYcJ
	xbbbNzfn3dpdpA1CwtZwssEAiBahjHh7UeVnjdQJYvp0P0Ty7LkUeoqlTA+xvaZGvDu2cR6tCQQ
	xsIqRcqlHwgU7fGs69bOK5uFeYdeO2L4/fA9E
X-Gm-Gg: ASbGnctNNOGTAd8XcUdCIi5N4Atf5/li+80+QOb0UIPXBdR/v6KlXczVA0SaCz9ZrPe
	/THGGvfLU3/PAm/VBqyAejblBzHx+sEmZVjO1KV21soCaVCqMMQvceHY2g0Pf5NSvb2HZsp5dts
	Vub85CzrBZdK5e1a760OiBkSRm9KgFi5FWuXOCkpDfMfHQ0QGQWF7Ts+vTfLugAjvLruZpTOXNf
	/U6gv+/Cscic8mJU/ZdaBH1lbDS8ETCBOXbQfUJZPzA9qjp8oUw8hkRJgvtR/vdig2zjzQ+
X-Google-Smtp-Source: AGHT+IHMWsayCOVLs4VTsLtGB8m2uTLBdsv50bOIdCTDtDW4QCqUV1+qfO4KCxvBeVHeO4UQUj13s+Y4u7hPeWSUk/g=
X-Received: by 2002:a05:6808:3a0c:b0:450:bf48:8352 with SMTP id
 5614622812f47-4514e5fcafcmr3768346b6e.11.1764186578358; Wed, 26 Nov 2025
 11:49:38 -0800 (PST)
MIME-Version: 1.0
References: <20251126034801.1997488-1-ankur.tyagi85@gmail.com>
 <20251126034801.1997488-2-ankur.tyagi85@gmail.com> <DEIT1AQE9UED.25L2WY7E8RYCY@bootlin.com>
In-Reply-To: <DEIT1AQE9UED.25L2WY7E8RYCY@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 27 Nov 2025 08:49:25 +1300
X-Gm-Features: AWmQ_bm0y3CSwsOPrAgKA4WfqvZ9TIYzTClDbcYdIu5u4RC6-_W_yJS3J15cS6M
Message-ID: <CADySD0H4eeFC6zD1VuNVA-=cKjw_UMLhpqAFayhxtRkBSE3FOg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 2/2] ovmf: fix build error with Nasm 3.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 19:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226813

On Thu, Nov 27, 2025 at 6:32=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Wed Nov 26, 2025 at 4:48 AM CET, Ankur Tyagi via lists.openembedded.or=
g wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
>
> Hi Ankur,
>
> Thanks for your patch.
>
> We do have the usual new line issue with ovmf patches: they tend to be
> messed up while sending patches by mail. Do you have the possibility to
> push a branch somewhere with your patches, so I can pick them directly?
>
Hi Mathieu,

I have pushed my changes at
https://github.com/trukna/openembedded-core/commits/ankurt/nasm-upgrade/

cheers
Ankur

> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

