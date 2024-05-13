Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08134C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 11:02:09 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.57255.1715598125496779040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 04:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L+yyT0RI;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e45c0a8360so44541331fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 04:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715598124; x=1716202924; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7uTQ0EK5rZICzfuIIHIafikO0IpRQLlMQP2E50Bto9g=;
        b=L+yyT0RIdbexkqwBB4LWUw1hjjzuHeSD8zzyQr8jpvcsUlUnFX1tz2CUAAWdSHBji+
         RBgLPcHm/NyNzGPXH1LWiuHA7a7/m/8zIG6qUZeP3K2/dSYCU9cH9EpLPNOkZrH9tG7Z
         rhALQs3QxeLgZ6UI+26kpEP4RIAlbCMeHhnAXMpQLc3r2oo6Pyy1nwYBQSWV2saixaln
         2ymir5arOYOK0+/ZonbtvAQM7zOQ+LLhM4cuQ00OolgO4SB9JPGALkAnNcR/nqXYSZWE
         6vGUj2QPmLZwq065tc58VQfOXVCF8XDkeKE+vEQDJBFJV2QBpvLQrb6PjiB8OwKSFadt
         czSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715598124; x=1716202924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uTQ0EK5rZICzfuIIHIafikO0IpRQLlMQP2E50Bto9g=;
        b=RhHIr80phrStc7o9MahIIBOHS1eaLFk6HhQVStBAnWnpR6SpzKfxMwAWIDxi6NE9Z6
         kh0gg6ibVZ/Jer9pk/V79Qe3B+D6biFb41SsahqURrDHu3nThATTwol5bRkk2FB+0IbD
         4X8p1k4OBsD6Shws82Y29DIk8nobFe0EpmingEsCZWFXh8W/cCddwLLxNFVDvyyVBSIT
         CVyvyTunREtoV55hININpzeiQUIKz224vsmWHvnjgKBnA8VwFrKDy8RhsIx7eFXJcET5
         URCYQE6wpCoZwwGNMPhiV3Oe8wCwZKiK/MY2uuMGRP+SzMmVpGEFKVzz2eSdFjjjmRJ1
         ZgAw==
X-Gm-Message-State: AOJu0Yxwp0cEXkoLhcGf+TNUYjd0+RQgObpWxG8kXzBZRswoAJO+1Htw
	1zACIGbrBN9dBY60vMmGy5TVq+oFVNa7tkOx/6mpi9cfzuOQG5uKYUEmro+vuGpiyfvXvPPDT2e
	fGfA/23R/PCdhtxNgWf17CLge5t0=
X-Google-Smtp-Source: AGHT+IHibAKBOd4+cn/aNrl0DzQXY2wlQGi9WiqGS3BZGwa1YNdjo9R3DLPtKRUBDKpQIwIX1Ys5DNlDG+i15AudTrc=
X-Received: by 2002:a2e:a175:0:b0:2e3:3b4e:43e4 with SMTP id
 38308e7fff4ca-2e5204b2ed4mr61481201fa.32.1715598123416; Mon, 13 May 2024
 04:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-3wQKzHGNhe0zTqxaVaxROUHcmMajgnMvNzrkXf9T+2Q@mail.gmail.com>
 <25272.1715594709758853517@lists.openembedded.org>
In-Reply-To: <25272.1715594709758853517@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 May 2024 13:01:51 +0200
Message-ID: <CANNYZj-uDz_gCpvkb5F9R6NkkQVGn768=mHXyvZJPHfKyZ-t2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory: Fix do_package race issues
To: pmi183@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 11:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199229

On Mon, 13 May 2024 at 12:05, pmi183 via lists.openembedded.org
<pmi183=gmail.com@lists.openembedded.org> wrote:
> If you execute:
> rm -rf tmp/ && bitbake base-passwd -c cleansstate && bitbake base-passwd
>
> Check the log.do_package of the recipe all you will see the error there and if you check `buildhistory/packages/` you wont find `files-in-package.txt` for this package for example.

Thanks, I see it now. This however raises further questions:
- why is it not a hard error?
- why is it unable to find anything in packages-split/, if it executes
after populate_packages which places things there?

Can you investigate these? Moving things to packagedata seems like
fixing the symptom, not the root issue.

Alex

