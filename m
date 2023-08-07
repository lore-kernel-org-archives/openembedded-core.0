Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE5EC001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 13:48:13 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.34813.1691416087433971611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 06:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lRnAd/Os;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4fe1344b707so7073950e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 06:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691416086; x=1692020886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=el0+bzuDLEkbVtX75TEHdmoW8S6ZRsBTCbHgoGyfyF8=;
        b=lRnAd/Os+TOYrQWbgCQAGb7soyjQN43midplA+a5+iNzmAm5eLIiD0Ko0i0+IrSvgH
         ehEeEfDqUBbePt2Qq4pMxoTg0U4jwkpfXK5h2Yf7/e5jKDYraIYR1qIc6Y06jQpOj8tP
         4OAqlibPHxxNhxpqVvMrN+FbIH55ANi2myvLd1iMB8nkcS3TkRBFXiCYe1/8rWDXXvvU
         hvHuNMfPuiuCoj0DkhghMm7ECF6/cGWJF1DuMzB3zX9TV4Ueki2Bk7wZmVaA2iKifuay
         n/biabUSLE5Mg3XOBd2ndKVJlZCRofbhFS2UyqQXuqQNM+XLqKL6Ro9Z3QN3UgSBDIqZ
         1mQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691416086; x=1692020886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=el0+bzuDLEkbVtX75TEHdmoW8S6ZRsBTCbHgoGyfyF8=;
        b=VODv0CbnfYm02XU0PkKATP2p8Ieu5Rlq52ulRxU02IvdPjDIke68lNymjCmcZQXEce
         eaMR+09eYi/8xgxqyyH9qmSV0Rvkk1lS5bVZP3VplmMqI7KDRNL83K7EJ+TFBmYkcW3G
         TZjUDjrtRV0XC2bdTyhZHFX1D6XW54ifcGDBeJmjDZwz2UDAqeN8hAEXNfoeriJPmBmC
         QZ+iBkk162gjQCfKSLY8GTy1WJw23ePtCsI0B/Flicj2UGaQ5uOERZtF/aLuinu61qEI
         xgzozEnbxkYNQXGiBZles4yhgh08SeoLAxogIZKTDuRnLNXyuSC75DirLreM/dJPEIhI
         cjrg==
X-Gm-Message-State: AOJu0YwfxWa5Ixk2EvwJEw3IoXfntNFwX9nrOa519Cs1XUzkr/boJZ87
	iv8mzz/kfZ9M9Guy3ft2XTqfjqCYjzxq7c5/zHg=
X-Google-Smtp-Source: AGHT+IHp78l7U5Sa++/Fh2XspKRtDwC1idMFlkucfmpLCg5UlBg7Rm2Vm69BF/RbBh7T2aCAbyEitfgzIVfeUTF2yKY=
X-Received: by 2002:a19:9116:0:b0:4fb:78b1:1cd4 with SMTP id
 t22-20020a199116000000b004fb78b11cd4mr5547508lfd.49.1691416085370; Mon, 07
 Aug 2023 06:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230721142543.246415-1-jstephan@baylibre.com>
 <CANNYZj8tCEDM51XrCgfUfMu0ExJqJEwQ7=vU+4e7vrRqdpsKCg@mail.gmail.com>
 <b7qoln53fio3pwdngj2god5iy7lemvh46pys43lfewimdyfgam@d2vfmfbti4q6>
 <CANNYZj_4GRz3j20Mc5wow2fpgHyhoTRsuwnYyHe6yiwnQM-vvA@mail.gmail.com>
 <ythwlmw5z74zvdz5csmmccksb4jmcyjckthqn6qhl2m27tisan@w3ng7x7q2gy6>
 <CANNYZj9iZVZ8qunaPQxLCk8x3MiVFEhTbr2i=hO=U138EmwHLg@mail.gmail.com> <CAEHHSvbzEZja7unnFTwy4RF51qmvWSWDmj=0qHuQHLeGULQp7g@mail.gmail.com>
In-Reply-To: <CAEHHSvbzEZja7unnFTwy4RF51qmvWSWDmj=0qHuQHLeGULQp7g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Aug 2023 15:47:54 +0200
Message-ID: <CANNYZj-dgpCf6BqiqpfU3ZryUOfOaXKQykGzKUBR4WEbu0hy1g@mail.gmail.com>
Subject: Re: [OE-core] [RFC v2 0/2] Add bblock helper script
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 13:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185600

On Mon, 7 Aug 2023 at 15:38, Julien Stephan <jstephan@baylibre.com> wrote:
> I sent a v4 with an oeqa self test. What do you think about it?
> https://lists.openembedded.org/g/openembedded-core/message/185408

Right now I don't have any particular comments about v4, but others
do, I think? You may have to make further fixes if something fails in
QA with these changes.

Alex

