Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0775FC3600C
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 17:29:38 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.2203.1743096571245994869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 10:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DtAuNheV;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ed0cc5eca4so25702956d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743096570; x=1743701370; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=evJ7YMJBEuSbCblF8z1pTQmfRZ5usKgpJ8qfMolYRlI=;
        b=DtAuNheVv2w5RIGveJNBEGa9V9ai38Ts6VtZg1DDZfpQwcXfo7KHU5ZdirOdrwIqzF
         NfIZBCtSZwLG3L2CUyZCu5ZMAkYkYFml6m3lkCDaU5JSC3K7kxkeVZMgTXChey9O7dA2
         lebqtjjb+DDyE1xhoF2T2FoGDJQOjw+kY70n8s6mGPieAneYg5DLDswPqa5bnTfGDiuZ
         pMT/CppmHj9U5mKYB/KoLunyV+5hAaLWfdqA0dMZ8pelzfOMRPVjWeyKZJVKcHxK77Kc
         qa0cup2Ua3Zf8NwjYXb/zXvsmHWNrn92Z+QhxL4iATs82Rl+Ke6kBz+CnmP3PffXljKg
         kefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743096570; x=1743701370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evJ7YMJBEuSbCblF8z1pTQmfRZ5usKgpJ8qfMolYRlI=;
        b=CYlyAn1FDVLW3i505SgeXIi+RWhSaB+umnZDk6J1Sp61hl1C7YER3cqVdr7ViltHi2
         GqDvdyhgZbzoOVj85Sut0BRe0RvGwKCylQg5eFvAUsaTim/2dKRF588FFw+cQZbymBUD
         99P8WVtHdO6z0z3PNc7j/50Reuh9507fY5RapbCUkCgqehLQ0JwlvXQCoULOiNRPje1n
         o4hAjsyeY2QDP4T517SEHsVHOpRnY7ko3qZ9CKDbIIjoCSZ0aGVls94j1ednceva07UX
         yZQj5SYvJ4MhLjJBVKQrbaCLlNQtqWW8HG/+FrGFmP1p9Yy20wVeJd8+CaEFbWICwfEU
         +MEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHldy3LiKnmAvTxt1V0NXNQk9EgNRqZK7EZTeBx0kYnxOizOjx61KSISyi72Yk53v1dqlkXGNALUOtklrw0o4UBA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyTE/tJT9euJamExDYnxHojM9QngGhv2m50/Z7M3V8Al8RhlQL2
	g6KY8ItR9mTyw9tihQ65qUedNiM/m70CvJ00gRgiD5pIyrkdN4yEYMfs2PNKR+wttp0pFCsHwwo
	2pkGZLhAoNKy+AgrI6sDSSh+VK0o=
X-Gm-Gg: ASbGncvyrouZWc+g62B/0Kfz1vPfbJlFp8qT3Ai1a+BwMef1fK4igCnwzXnHWe7h6Jq
	PQ84cQ7bzrr25cTWB3QEG93MVGqbSnT2oA72uaD7xtkrpLUStpJDFkB7/Sl1Dl1VD8ENbuZSXcb
	3q+jjAwwWN+/nTo6+msid7aWWds+R8FjfUTwRIQJzxlaYYvlMtrksz8UuOpkdQ
X-Google-Smtp-Source: AGHT+IFZfz/4lv0XO94MDh0N+n4mFRnL09jBwJ8NI8PlFiksbsr1cqANFMp34c9DJD5DCm6njsjgrHcSDu3v1/yGyNU=
X-Received: by 2002:a05:6214:627:b0:6e4:3478:8ea7 with SMTP id
 6a1803df08f44-6eec7a4606bmr16519756d6.4.1743096569947; Thu, 27 Mar 2025
 10:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <5a7b5f6c-1be9-4c5d-bf2e-59e115762d6a@cherry.de>
 <CAOSpxdajP0E0uVMR3QmRCqqmmRMAMnXiZM3bPmOXHGyRrVTfDw@mail.gmail.com> <20250327171239.kvs4jtetjkcs3i2u@hiago-nb>
In-Reply-To: <20250327171239.kvs4jtetjkcs3i2u@hiago-nb>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Mar 2025 18:29:18 +0100
X-Gm-Features: AQ5f1JppkrxVukFXV1BBG2gcFO49TWbwFUiZNS8H0UKgio5uNL2f0bKxR0W9LM0
Message-ID: <CANNYZj-+2ESLmCUjGR9ZXK62=wJno85DgFdU3tjsu1O7G5DPGA@mail.gmail.com>
Subject: Re: [OE-core] [styhead][PATCH v2 00/31] linux-firmware: upgrade
 20240909 -> 20250311
To: hiagofranco@gmail.com
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Hiago De Franco <hiago.franco@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 17:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213772

On Thu, 27 Mar 2025 at 18:12, Hiago De Franco via
lists.openembedded.org <hiagofranco=gmail.com@lists.openembedded.org>
wrote:

> What do you reccomend? Should I try to keep the patch with minimal
> differences as possible?

You might consider adding this to meta-lts-mixins?

Alex

