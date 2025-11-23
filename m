Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570DBCFC518
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 16:06:59 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17354.1763914014005909876
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Nov 2025 08:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lywhZ58b;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88043139c35so36196896d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 08:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763914013; x=1764518813; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0PnMqJLsdrTmaPmYuznDx/vpwt27z4dLmkxXYNl6gm0=;
        b=lywhZ58blkT+kvo3XOH1byUchZJ//Uu44KmOYENIB/cUEDo3ui1tQ2IN14wk8fL3aT
         nj4l0KxfZOwTjpLSCmCwAGc8bszD5s8Qb9AVaBc8XpSSqTZ/TslDr0zyzjcwxRyCIfEb
         STqTweYvSfRLmSvFwfKXBIIH+AQHrTpKp4LhrKEtvkVPrDwS4GIohYV5FHh98u9E1Gs1
         wm45VqfUxFszNXTS36Ij4pqB4Ec5HYsWWCQwOx6SMIX4DUxm+qEIc3cr4HHw/80v+nI2
         4fRpDHctZLuTxFOKGVV6A+xhlKn1kUI6e1q1Iba1drgVLtRdo/6Ovy13l6/NoWevoGde
         vtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763914013; x=1764518813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PnMqJLsdrTmaPmYuznDx/vpwt27z4dLmkxXYNl6gm0=;
        b=vzbB/FAYwzsNDpUA4ujaEL1EyPAVINGyoaDE1RIekpqM51Otla2CrBuiaKpDu7IQ0V
         m58JnCJ0MWrf8zg18o9U05xRVmILclD3rGUo/xAq0jKss0IquP3P+ZqO+Mmh3JX1iUm2
         ygKM8+mF1AipsgP1XGH8g0kB/d3cCkZnHr+QVfqC/pTSNhVBwkC54xyXfSSaDWW/DK9m
         Old00qB9bb3OpMmm3c+ijf9qnFhf/lkHzKkdX/HMFsm98iesHq4imeDu7Ge9mT4JyDC2
         FA9UzrVmaE0OGR2GE7jg51MkKkWYI7tyBLy1wV0ykjYySov+JItRd1jC4kTJXplBRJzJ
         7M7g==
X-Gm-Message-State: AOJu0YzYBLDWHwLUkPMDYSB24ZxxtighUnBUs1IA91cUgFRxk8jzuX+s
	4btHYoXQATUbjJmt2o9gZw/m5BF0CMji+MwDQkVCAjOY4IJcXo2bXWq+RzXcsVeMx2w9p4LEMq3
	zY31eFFE8ZhXvFdItIIIAVKoHsjxUQnRwwQ==
X-Gm-Gg: ASbGncviBxHiQngvn6xMIWU0xTsN9g5CifY+hEb94jKDPABXF+UbA3bZnHloozyhw+c
	wvHeyrTnSZuZSTzK/xmToz4h4UtRNBXiRW8J8J/81GEIUmnCpL950G2PVdPaQO1L/rreJGEqEiG
	KOpsDGtsUsDD7pfUsRklU8XV21BpG3gSrDAgVRh+NyXU2b1W1YrCwYCpftJ9wY8eFKhlNx/S0mu
	gOx/oIvRcIAa/TZpm9YGvDl5tpXp0TpWQRb06pva3EZNdYS4scTNbyugw9mb2DJofGsVmkWPus5
	QIXt4XeZKGUeBMBh87fajFJ91DIMmEOYMq9ulWjL
X-Google-Smtp-Source: AGHT+IHycs9EAysGcCvGNXdVlefcjdcHdr6d08V2gP1iVLUMbIiXPGLIcjj3+bpW6aIAwrwIHReke1qTkSQtqOPzKVU=
X-Received: by 2002:a05:6214:c6d:b0:87c:21db:cbc1 with SMTP id
 6a1803df08f44-8847c533ee0mr137381376d6.46.1763914012930; Sun, 23 Nov 2025
 08:06:52 -0800 (PST)
MIME-Version: 1.0
References: <20251122160554.283274-1-vpuar@qti.qualcomm.com>
In-Reply-To: <20251122160554.283274-1-vpuar@qti.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 23 Nov 2025 17:06:42 +0100
X-Gm-Features: AWmQ_blDoA4uVx8roiNWmtZ0cA_l2NyWRxUeibXFCvJUqJ3IqQF89qr8f1rkiwk
Message-ID: <CANNYZj-4W4Ujymomy-fqTgaAR8ZZ2uS_b7NwMHiAyff+UxvvEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] udev-extraconf: Split automount and autonet
 into seperate packages
To: vpuar@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 16:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226729

On Sat, 22 Nov 2025 at 17:06, Vivek Puar via lists.openembedded.org
<vpuar=qti.qualcomm.com@lists.openembedded.org> wrote:
>
> Created two subpackages (${PN}-automount and ${PN}-autonet) to separate
> udev rules and scripts for automount and autonet functionality. This allows
> selective installation, and reduces unnecessary dependencies for systems
> that only need one feature.

The same reasoning applies to any other recipe: we could micro-split
everything. It would help to go into a bit more details on this: what
do these features do, and why one would want one but not the other,
and what are the actual savings achieved.

Alex

