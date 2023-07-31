Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6A2C001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 18:01:03 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web10.2138.1690826455144304918
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 11:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EArrPCYg;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: luca.boccassi@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-486639bdd77so1524099e0c.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 11:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690826454; x=1691431254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j0OUDtBdQCMIQqSzzBwR1gshhQmQGNmCPbroJcSQmN4=;
        b=EArrPCYgJsJ4B7YyifUI9EtrjMWDABkQKX2fqcUK6U26H2N5vZPwQ8iD3dL/R+TRIw
         /iJ2Ycmbkn0n0DglVGm9x//kjlp+ZBEcO4d26GVs3ppRXqpfJCfBPn5Nn90yP9EO/bdU
         6lKZyIGR9mMTpBzPpYbE7dljyM3+pARQwGU7n5c8f7zzbC64oQOHfnxg1k3tiEEl85OE
         +jBF4H2hlJQ0eepJGzufp1ai0tG0eHaeBXPv5rbWUSGzYlMLKtI0h1FOCd4QTloM/hxd
         XVWSIIT73El/y+AIsxiuC1keockG6jEq3424mRuVD1MmcO+RMBLHXTXBicSuk+t8iAWk
         YoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690826454; x=1691431254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0OUDtBdQCMIQqSzzBwR1gshhQmQGNmCPbroJcSQmN4=;
        b=fQO4OKRUaI7p0sztPuyeUNa3ulZjRN3o6V0i6x9QJbPdCDpy2YNRqq4QeBcAgEJ7gl
         RExfr9T1PJjujxwEKkm1C/JpDH4+bosHyEDidYNyfbsejsJsjWA4YAYSvc5ymlnt9O1S
         vXm1iGhC4kag9BaHMT7l/1Bailqtss3mN5DxbFIIe9zlTggldMHDOCNU1ZfPyteh+FiF
         SmE8kwqvGN8vtu6l72fSk3MuE5jCY3vTKPZMiPsLCVEoMW9V9ClPj9Snl2Z/nnP84++3
         vk3P6oj26AYe/AMlZ9bckVfp4R0A/KyjELAtImGcgbvJ4k88V41lx6zuUPH5zV+N4Wnd
         cCAA==
X-Gm-Message-State: ABy/qLaRua5T1g/9de04TjEa1NaMBvvcIsidwL+oK2ORnrhd/L/dh2uX
	2qRV2+jLM/d8UxaCIEvNJa5uhCVpjWU1/aKfw0c=
X-Google-Smtp-Source: APBJJlGzlwJJApAyaZRBGSV5xI+uIZz6SQkchSVJ2HMFXPC3bLTjtNzeMPU2gF74c8pYsc3hi42MVS9pcEXqVoPxjtA=
X-Received: by 2002:a67:ba05:0:b0:445:23e7:767f with SMTP id
 l5-20020a67ba05000000b0044523e7767fmr708586vsn.28.1690826454134; Mon, 31 Jul
 2023 11:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230731112736.1238510-1-luca.boccassi@gmail.com> <20230731164010faa31974@mail.local>
 <CAMw=ZnR3L05DSaBGSijuA5-vNXPkriCjdbi02LJsUFmVo-FbHA@mail.gmail.com>
 <202307311713165bd45fd1@mail.local> <CAMw=ZnTCOt1aq-iQLRsgjv5sJL_GYXWW3dNup300B1dbNYnLZw@mail.gmail.com>
 <1777043202ABE7FB.4565@lists.openembedded.org> <CANNYZj_9PaJtAhi1XTMzO8oY9GgxUh6hO+00f0Ph2MUndzBVbA@mail.gmail.com>
In-Reply-To: <CANNYZj_9PaJtAhi1XTMzO8oY9GgxUh6hO+00f0Ph2MUndzBVbA@mail.gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Mon, 31 Jul 2023 19:00:42 +0100
Message-ID: <CAMw=ZnR9S1oHjjPUyOHnDakPOM-6JkyHbnTTR2hDjqv65qfB1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] systemd: update to v254
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 18:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185159

On Mon, 31 Jul 2023 at 18:37, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> A better option: fix the libpam recipe to say:
>
> ANY_OF_DISTRO_FEATURES = "pam systemd"
> instead of  current
> REQUIRED_DISTRO_FEATURES = "pam"
>
>
> This should avoid having to fix the tests.

Thanks for the suggestion, applied in v6.

