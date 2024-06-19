Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F52C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 16:51:35 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.26187.1718815891350929876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 09:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Id6zDj1g;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52ccc40e72eso748526e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718815889; x=1719420689; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJf4YYz41WZKlpJWRHz/0qHB90DGUB/9kJK2mun0l+4=;
        b=Id6zDj1gqhsElTYPc8cTwirseN7z8dgxUGK14zRCDqP0eRruRpmZ8cI7qS5FKC91ez
         AhtvjpHAG4jBfgB4pTrgCBYHit4y4nU/bZ2dDWQUIMyhm7/4npHblc2hr6VOMmKQVCDY
         ngGlBIgydDLBuzK1olPzXi48O71dnpPczg5Sd46a/igP9P77QSWA76dN9TAbaYkxyAH0
         Q5VR6xpud2WXEF+uNnCJWYdrpvzDypRF6yWWnoU9rn38Ig1TKDLEbCSCo+PAlD4ZmGp/
         livygQ34BRrcLRJb6mYKXQN6yXCiOAvh7HIO/4dRlKb2eKmCdWNabFYUmstbXrPNln7z
         Ucgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718815889; x=1719420689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJf4YYz41WZKlpJWRHz/0qHB90DGUB/9kJK2mun0l+4=;
        b=nt2Bkvcylh/OPronPMy/xEpIW1cgOs8eS4BS3HXNZCGwpnvbBy9n+c4/ad0CUxp/wm
         KYLM/va2pZZdZqBGhM8C7o2Rf9vQSYvm6KiN4SlRwPzseuBi/ninBzUl777g+pC90LkB
         7Z71a1OQ4cC+X7gbU0GEYyPxpJCKeB1EPZNhF5dS96BfXorKA5UwdZbW0OAWLW9+5wKq
         oqlXVMXecsDwn/WMROVA6iJF1us8as7ECWjYq1kk5P/vs6k81HpOJSGRpZsdG8SOA4kS
         /qTyNXFMn3OgkyScbb+SRFf6KCvd+ZZ3kBUUoZU2gZ6+RB+eTa5DxIqAOWSVMZD7HQHr
         ypQA==
X-Gm-Message-State: AOJu0YwYCKq6xBahTvfTa8Zo/U2OQ7ev1o3uv1zrBTxj0VCrZc5WTU0X
	JI5cCD/CV99FqMb0YUhM2srGiek4H97eZeYaa/PHi2yzDxtMl8ub2geSTmfknkrISnD0vskNq9E
	TE/gN1iwTtRZ8vaiF3KlyoPznuNlxUw==
X-Google-Smtp-Source: AGHT+IGHzvZmNK/hFyLMk5NmT2RRSEysQqDzNJAaxeM0tSuKMMgRH+nKjcO1Ws+i2/jCq+DturH1nLXJiRvF8W5d1cg=
X-Received: by 2002:a19:8c12:0:b0:52c:99fe:3133 with SMTP id
 2adb3069b0e04-52ccaa5a120mr1924810e87.63.1718815889282; Wed, 19 Jun 2024
 09:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
 <20240619085957.2787700-10-alex.kanavin@gmail.com> <CANPvuRkyyjavWQn2gynunhJpXxAG42+DmKNZ6+eTyumCoUCQog@mail.gmail.com>
 <CANNYZj-ZUTSpxwpycadiwnAyWkK2SbvX7BguE5hr3ZY0Kq6XWQ@mail.gmail.com>
 <D479E782-0AE4-45EE-A0B7-A7277B728857@arm.com> <CANNYZj-Ynnex=dPFv+yD_pvV8VFafv5Mwmvyeik_5VCH_YqCqw@mail.gmail.com>
 <35E7A1F3-A630-4F6F-B65C-65391C0B7F32@arm.com>
In-Reply-To: <35E7A1F3-A630-4F6F-B65C-65391C0B7F32@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Jun 2024 18:51:17 +0200
Message-ID: <CANNYZj9amqsdRYvK605tSaz-Nx8FDa+ZJxLs9_WDUcuZav+6gg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/15] glslang: mark 0001-generate-glslang-pkg-config.patch
 as Inappropriate
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 16:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200925

On Wed, 19 Jun 2024 at 18:35, Ross Burton <Ross.Burton@arm.com> wrote:
> > It's right at the bottom. Visible here as well:
> > https://github.com/KhronosGroup/glslang/pull/3371/files
>
> Did you press Start a Review?  You need to submit the review (this is so =
you can incrementally review a PR and send all the comments in one go, inst=
ead of spamming people=E2=80=99s inbox).


Done now.

Alex

