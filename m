Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63271C07CA9
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 10:10:52 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.69206.1701339051761370222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 02:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E7uQoUgL;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a013d22effcso103443266b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 02:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701339050; x=1701943850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BAJleN46drXTmdGtrm/LEgnqNdHRkKMsnkKCu9Go0to=;
        b=E7uQoUgL4uKbNrgMTrT4p+BCk/pSPLWFZaF2K8SPuURi5sZSsHGgYGRijCb9sOa6tG
         5F0Na3FAFmROW32kHUYYUVCnpqVz9QuKNVZOxn85ED6EMvGTsutXnIh2GZnyIvom1f7j
         cFLHxN64kZ2qyNWj9ZWqsXI2KEkWY9edzUw/pjXVYwqF2E5wfRJ//aEjMmO5X/QbKjgd
         eDYnha0RWPNfowRvZ4zQEWxMiOPvEmUBuA00Ue0mcV/0MbcSypleURX3pZZT80ylBaT1
         sbiIKPtAEtNgPeYHUKHN1URcEbeIa+ypOTOHSnntbSZfPihL4waHRjG0Pz2Ksr5n19q2
         p1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701339050; x=1701943850;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAJleN46drXTmdGtrm/LEgnqNdHRkKMsnkKCu9Go0to=;
        b=ZcFfdeF0sc2wo4bBLjzSdwx7Bp7IlWsCt7dnGj85N72DXxv0bVtmBDSl2Dj1iNtTV6
         ahyGuyKp0GUXmpsNgwtoFdROObXkKzBKMmijtFDKZ0vvHsRmAv52+w4K0WmhgzdxAT53
         JzRoNR95rXHDnygWC+Q9ail/Kl2Fxwe/h//wq3eFX9mOz7n9QtDclqMIKaZd6nOK33Jc
         9/k5PLFTI+Wisz1ZsZ2QbEOS1nJU151v9VfWm9hamkFdeFzM1E7aNVtHoW9FvpA2PzHr
         d8+Blva/UZoLg6fQSH/p3TWaDSlY45mNw4BRwOoPyGnAzrn7ZW60lF9URVF4ZLjZEbAz
         LjvQ==
X-Gm-Message-State: AOJu0YwObghqf6fGwqwgJ8+TmujW9Lg3ZviHtobjeXRhE34yLcxHYrf2
	OeAHeTc8/7vbGgyRqv6fndBLnEzO6TQ=
X-Google-Smtp-Source: AGHT+IH8uBQKABnUspdtocd63RI+BOoI/xftipZd7C0s+eAnv+S2fS45+aCAlaGbD3vhICIzY09l9Q==
X-Received: by 2002:a17:907:30d5:b0:9a5:a0c6:9e8e with SMTP id vl21-20020a17090730d500b009a5a0c69e8emr14066207ejb.31.1701339049941;
        Thu, 30 Nov 2023 02:10:49 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id r18-20020a17090609d200b00a015eac52dcsm497191eje.108.2023.11.30.02.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 02:10:49 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 0/2] Failure for rust-cross for arm(v5)
Date: Thu, 30 Nov 2023 11:08:39 +0100
Message-ID: <20231130101010.1696-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 10:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191490

From: Jermain Horsman <jermain.horsman@nedap.com>

I ran into the following when trying to compile rust for arm (on kirkstone):

Exception: TypeError: int() argument must be a string, a bytes-like object or a number, not 'NoneType'

After some investigation I notices some patches on master which were not
available on kirkstone.
Using the patches included here I am able to compile successfully.

However, some additional patches are not on kirkstone,
I am unsure whether or not these should be backported too,
maybe someone, who has a better understanding of these, can comment on that.

It's about the following patches:
https://git.openembedded.org/openembedded-core/commit/?id=0f83d959465e0d99f98ade6803281585931d1b02
https://git.openembedded.org/openembedded-core/commit/?id=2d4b35a0db1220e7a7f1b6776223aa4d40a3f246

The following patch is also not on kirkstone,
based on the commit message I think it might be desired to have this one as well:
https://git.openembedded.org/openembedded-core/commit/?id=d554161a045d12411f288394e253c54aa4c1257c



Richard Purdie (2):
  rust-cross/rust-common: Merge arm target handling code to fix
    cross-canadian
  rust-cross: Simplfy the rust_gen_target calls

 meta/recipes-devtools/rust/rust-common.inc | 18 ++++++++++++------
 meta/recipes-devtools/rust/rust-cross.inc  | 21 ++++-----------------
 2 files changed, 16 insertions(+), 23 deletions(-)

-- 
2.42.0.windows.2


