Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CCDCA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 12:24:52 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.11009.1756902287367586132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 05:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lr9CUqmc;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7e86faa158fso90901185a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 05:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756902286; x=1757507086; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fbcJB0p4jfriMx7KX6mRz0sC32GYWvEoraDuON3kf5k=;
        b=Lr9CUqmcXJkh4n//MeRTpvjLRH69Q2igBrmK02CxJFnILA6/1v16rJWOKCI9mwr/KA
         gaAnuqbi+TcEAE+zDg011bKQ33Z+7QPMNkhxEPoXmcs8kvT22e8fvcN+UDzi39kuxQ4e
         q46I7v7p3XA5vEpy0+6Ke/ZMZXWNgNBKATZ40/ueBUwn3A4GNzUI+alg9EtXqLbMnlvI
         cLFyeNOghhy1ZwSXf9D1TT7mZ11LGaqiOSqJ7VBa8OT1yP5QTXgYwaPWX7ESrq1hW4Iz
         FGT1baBfk2r9lofdAi92T04jk/XyJ3GI27Kh4MXtMJFEe6hQ+C969E2fpl607gu3VEkz
         QPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756902286; x=1757507086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fbcJB0p4jfriMx7KX6mRz0sC32GYWvEoraDuON3kf5k=;
        b=umXykNiFO2HfmxLcJoI/xpAjjPhMDBBZmukG1tLIdzpcgy6xmNNoFhzT9tvkrZarme
         bAWhAvire0cZ7+uJHStpQgZUCwZL6jfzTzx161+j4yqAyT4YnGpW0AKt57dOzbccSzGU
         a2COOpebHlTiTZFCvneMTmlHzUi3B70G4Blu9RKWzgbohWT+vUz+Aexlj4L0LMm1FLH3
         LdwWZo31OLihRNBCgHmfqTDH+voh0bgk2srblojdu/ilEoVZf34o980pEtZJdOnNm1Hn
         EshwgPGY9K4HpZ9U0IhuRd7asuKJ66eWpEQATnkmJ5PRmFPJ4ePksJDFeVQqL2FqFq4O
         HSew==
X-Gm-Message-State: AOJu0Yy7uMnp5nclZiekPcdwf8YPAByO42UxfkN6ZVoQFU62saAzZ4uV
	0J0ZNKT8Qk+4F5QR/QWaodnhpH30jhe4D64La7pCziS03QU9IwehYCsdXzaQDlirLXr59DB/AjM
	3ra+3zn1HrUlz+lGLyK1P0008ProGow5qNA==
X-Gm-Gg: ASbGncsNkdD/QxvtWnD3B8JTaMRo91f/2iLMG6rbY2F6xIE3UpMf2Qex6EDfKfzeGcu
	25DVmB+wpt5qxtxatNv0IgTGhQbBDBypOcwJbMyUSn9CGjFtRMEdGN0xzkYtVSK1N6A4MkMbC3D
	06MHXEgknjIMVQewtml2TssFIo57vA3gfxBHjFzoP9gw1V1sDAG7gvWKE3+kaEV1vHdNI2lsXuf
	nWR2bVg1dJ8U8tv0wkTVl6ghJ8T+h1lm3OFrKDSy77P3x+omftfHyhsJ1ZTcEDlL0MQ1A3SX723
	1tCD48dEvVQxwxrjA2n8AVTJes4yUDiM6x/W1eiqoU4F1w0letg=
X-Google-Smtp-Source: AGHT+IFxv/KYnpxgCLVBrBCou/YBdPXnlrnAevfgsIcB/eqHqESZ7mVcKJQ87Vo8Y3UvwWIvSP6wVCgbmHi3B497Y5E=
X-Received: by 2002:a05:620a:4155:b0:7fa:880f:1b71 with SMTP id
 af79cd13be357-7fecd105cbcmr1732515085a.0.1756902286322; Wed, 03 Sep 2025
 05:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250903081113.3182850-1-haixiao.yan.cn@windriver.com>
In-Reply-To: <20250903081113.3182850-1-haixiao.yan.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Sep 2025 14:24:34 +0200
X-Gm-Features: Ac12FXy-AVS6ciW2ZQ2O6APco3EzDboHneUPvTHr7yDg4Gbd6lFgeOZlLmEPDlM
Message-ID: <CANNYZj9Qr7uy-bZGGEt23MWXHkX-fU3TYQc3WYoX3KEtTC9NtA@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] environment.d-openssl.sh: fix unbound
 variable with 'set -u'
To: Haixiao.Yan.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 12:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222857

On Wed, 3 Sept 2025 at 10:11, Yan, Haixiao (CN) via
lists.openembedded.org
<Haixiao.Yan.CN=windriver.com@lists.openembedded.org> wrote:
> Note: environment.d-curl.sh, environment.d-python3-requests.sh,
> and environment.d-git.sh have the same issue and should be fixed
> similarly.

Which means we either have to fix everything (and somehow ensure it
won't regress), or just have a requirement that 'set -u' is not used.
I don't think it's right to fix such issues halfway.

Alex

