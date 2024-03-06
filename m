Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFC2C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 09:27:28 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.8267.1709717241065415603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 01:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HLn5Fv+t;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51331634948so631466e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 01:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709717239; x=1710322039; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d+eh97rfsrXFeuHkZMAOLbvpTzLCC6xUBa9vE/suGmM=;
        b=HLn5Fv+tMMjqN1v68unzKQ4OdRVVDrBlLprUiEIjnqjFPYpbXyefq9us57xs9pBq+l
         9pL1VPzvzhimcVDbYdRz1u7Sq+jKjltkojaHHozFnRAY7pwbHAt9rPVBiPJJywK+56rq
         TPqVAAeQCBSfdpLj/n4nr/n6q5LS2kq9L7KDLKVH7dVlNOQtQvJkQ8soxmWMJLaToSOy
         /UkE22uENsZiiH3bNtL1d8I/Yre7bklcfVGwaH42N4xqBulQokvlwyjKOXkndDxz4Sit
         717yYtA1H4SVAqULeVHz5D8/1Xw7OPFzmXYlVDmWdglEyAEDcJZMlipIbhEFtnt1IlKu
         ryig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709717239; x=1710322039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+eh97rfsrXFeuHkZMAOLbvpTzLCC6xUBa9vE/suGmM=;
        b=lEnZUrk3dVJXSAVK9+IqvU/VIMJhDSbYZPW78WqksdiMacwKLt98xfHQRIFuYezZKv
         /+Yh663eP+mn/UxC2ATXtjmy0SIjoAFgXX/b6xtbYpEHSPtFT57svOmTeBd0wmqnbU/3
         36fX09Z2nx6HysI08dor//ALd5zJEzAwwLlVYAgBc0gOh1R9Nx5hlgDWg2hOoAI/ImU9
         MTqVYXnV9X7wP/C6pdSGjo4y7SIhey8t/sVIhPog3Z/GfAZbtyyFCWtM4TAEOp1VGF/Q
         deOcZu/YFMee/AJvTJN3EO6mJzbKD637hodHvqAdx5SOarXG1Wn53e5N8CWVqnB3x3Kj
         JRkQ==
X-Gm-Message-State: AOJu0Yx/qSjw6xPGq/4o4T0pUSj6GT7i9BpV+V0iC+VV7lpHINEvAtP6
	Sy3GLJK2wmWj9dBNz313YDvDuPrctYHafU87qM0vWyYLWYH/Fsr/HMsae5m0bFAylo9roGNW+ya
	d4QT101QZJtZGmDnkh4LFfwvFu6Y=
X-Google-Smtp-Source: AGHT+IELpvzqAid5qdyquOnoxAAShSWhHRPxSwz4gJxcipKqZJbEXK/UzTb2HQIGkwSuvSM2SGRVCbncXCY1U/4Z6Ug=
X-Received: by 2002:a19:ae17:0:b0:513:411e:e6d7 with SMTP id
 f23-20020a19ae17000000b00513411ee6d7mr1636999lfc.0.1709717238607; Wed, 06 Mar
 2024 01:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20240228062139.473528-1-philip.lorenz@bmw.de> <20240305161856.4163138-1-philip.lorenz@bmw.de>
In-Reply-To: <20240305161856.4163138-1-philip.lorenz@bmw.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Mar 2024 10:27:07 +0100
Message-ID: <CANNYZj8qUvKh39dzWdXqixTTy7-9QPxOy_C2AtbG=Zvf7HspKg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH v2 0/3] package: Extract GNU build ID during packaging
To: Philip Lorenz <philip.lorenz@bmw.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 09:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196661

The patchset looks okay, but it'll probably have to wait until after LTS.

Alex

On Tue, 5 Mar 2024 at 17:19, Philip Lorenz <philip.lorenz@bmw.de> wrote:
>
> This is the follow up to "package.bbclass: Expose list of split out
> debug files" adding the extraction of the build IDs directly into the
> do_package task.
>
> Build IDs are stored inside the "extended" section of the pkgdata and to
> enable easier testing the "read-extended" command is added to
> "oe-pkgdata-util".
>
> Sequentially reading the build ID from ~8000 debug symbol files takes
> approximately 90 seconds on my machine, and given that extraction
> parallelises well, I deemed those figures low enough to enable this
> feature by default without a configuration switch. Let me know if this
> doesn't match your expectations.
>
> Philip Lorenz (3):
>   oe-pkgdata-util: Add read-extended command
>   package: Expose list of split out debug files
>   packagedata: Extract GNU build ID during pkgdata creation
>
>  meta/classes-global/package.bbclass     |  4 +++
>  meta/lib/oe/package.py                  | 19 ++++++-------
>  meta/lib/oe/packagedata.py              | 25 +++++++++++++++++
>  meta/lib/oeqa/selftest/cases/pkgdata.py | 18 +++++++++++++
>  scripts/oe-pkgdata-util                 | 36 +++++++++++++++++++++++++
>  5 files changed, 93 insertions(+), 9 deletions(-)
>
> --
> 2.44.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196637): https://lists.openembedded.org/g/openembedded-core/message/196637
> Mute This Topic: https://lists.openembedded.org/mt/104747697/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

