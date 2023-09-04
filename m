Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F203CC83F2C
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 10:54:02 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.45135.1693824837574954518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 03:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lpgQQdhi;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: bbara93@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bcb89b476bso19244141fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 03:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693824836; x=1694429636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7prH8oHoYPuLpqZO29MtSoS/Ea5EXg7p1XsTQ6AKGk=;
        b=lpgQQdhij1AjCrsoGx8NBzeGoi1ztoSgzyO+/PAUXiztlu67mRCow+SCg/hmodGjDF
         cEgK3/E2esQnR/sS4B2Fq06sKnLEr6MXDnH7A7hKCwD3/krtOsrgtuuVG6NgfFFp2zY4
         r8WlrXRoVbcoe16wvTgPFEwL5y9eBpjmWvZLs5qlFVkf6FaQ2cJrz1UwhIKfgkGrBMNP
         sP81Xwjg4KnyE6ZecUJS0KLqv4nmlf7m5oaPjs0VmASCCQnfM8BYIZRJvIrpewRGfiMT
         1GmjDfHyyZzdFk8Dp/vU+xn5CwGEmGaW/IXaYwacDwI9KUetsllFyh9sr8COk+93XM+9
         IVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693824836; x=1694429636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7prH8oHoYPuLpqZO29MtSoS/Ea5EXg7p1XsTQ6AKGk=;
        b=Fy2F7ge8DORmcgZ65EGCsTVmIqnAO1wzSrcf3w/+ONsBAqN21AtbZCJJm3DYBptx1I
         G5OglCN2kDBwcXnUKO9ogFkpKc/qKYoWDJXrOpgrwWYLJRkfl17QleM8DQMUE0Ut7sGo
         IImhQFdkFRfytQ8cN6tgkkzn2LyfWkSeHPuKVUEwEsFK3r0Ll25G9VZkJuwuz53LXxDj
         3zCSzExR2BPbrHrmy/WRcth+Sltfe+IHtkhY5+6oqefm+L1nDA1Ti5ypvw8L548O+6+X
         0CPF7BvwnGAONIJ0r9a91z2N8C9meyzNA0tuKS5OkU6xi1UB6aBP6IaJeuiVC9TXuNxD
         YuYw==
X-Gm-Message-State: AOJu0YxQygAqwlE/LFx5+wrhfr92EiHM0gt6/oXn5FESUvHzdndKBbq+
	e9EiPz2zndLpyyniLwA95dE=
X-Google-Smtp-Source: AGHT+IGbBlRotgQz+byaRUlKVE6L/Y5RjJCvyRhon8TbSJIdlqbh5h06ylwv7TOSrqb9VWOOAg144Q==
X-Received: by 2002:a2e:b010:0:b0:2bc:e954:4203 with SMTP id y16-20020a2eb010000000b002bce9544203mr6783323ljk.26.1693824835473;
        Mon, 04 Sep 2023 03:53:55 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id f23-20020a1c6a17000000b003fc01189b0dsm13470878wmc.42.2023.09.04.03.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 03:53:55 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: alex.kanavin@gmail.com
Cc: bbara93@gmail.com,
	benjamin.bara@skidata.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] ghostscript: avoid neon on unsupported machines
Date: Mon,  4 Sep 2023 12:53:40 +0200
Message-Id: <20230904105340.4171316-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANNYZj8a-gncxWB4EtpHNc=E1f4=1M2+pr38=ige=X+BxYuVow@mail.gmail.com>
References: <CANNYZj8a-gncxWB4EtpHNc=E1f4=1M2+pr38=ige=X+BxYuVow@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 10:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187172

Hi Alex,

On Mon, 4 Sept 2023 at 11:04, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> On Mon, 4 Sept 2023 at 10:49, Benjamin Bara <bbara93@gmail.com> wrote:
> > +do_configure:prepend () {
> > +    if ! [ "${@bb.utils.filter('TUNE_FEATURES', 'neon', d)}" ]; then
> > +        # unset the neon-specific variables if no neon available
> > +        sed -i 's/HAVE_NEON=".*"/HAVE_NEON=""/g' ${S}/configure.ac
> > +        sed -i 's/TESS_NEON=".*"/TESS_NEON=""/g' ${S}/configure.ac
>
> Ad hoc patching with sed should be avoided if possible because it's
> difficult to understand and is prone to silent breakage (e.g. no
> longer doing what it was meant to). Can you make a proper patch please
> and submit upstream as well? Perhaps add an explicit option?

Sure, I will post a v2 of this patch as soon as I found out how to contribute
to ghostscript :D

Thanks,
Benjamin

