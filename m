Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330A0CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 18:49:36 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.2502.1761158968654728620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 11:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T1NWQ/hZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-81fdd5d7b59so94551916d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 11:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761158968; x=1761763768; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3oUlNhWDNczpCYpFeTpbNvNNCRpHhQ/YSaR8pFcbxs=;
        b=T1NWQ/hZI+Md8Nmphbl5VmAlhC1T9I2r2Tp98iMe18+UktonCNd+4We45R3P1ubmHW
         NLvh7XbAmaXVOwo1gt2k3wIxNMEbB6s4jaYQKfmeKywXf0XV5oH+Y5Bsu6JE+AV0PR5s
         0WmfT2z8kYvNiE0pF82RU+g11l+gnApJPm1tXtwM1qhVnh22/ntswk/u7/ZsK2Y+ccE6
         iaI87KIYmPV+a8BVuy5inDr/uHK/jngX6WQVY1juxCzl0F2ZCxu0YFqCM8SzzSh0VBPm
         V9afyR+2fUUlQpw1d+OC44ya+W9uZ4UNrjeWdLx2gun+4nkGqwGVHUP/goC2gyj/3L3a
         Gr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761158968; x=1761763768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3oUlNhWDNczpCYpFeTpbNvNNCRpHhQ/YSaR8pFcbxs=;
        b=SKZMdcg+bTt32AEqo/2V2Xx+K89fZ2BoSmKIM/UQuzYxqiNH4TZDQ7YEMSAXvn1kHJ
         D02cY7o1DFPQCr/W8zSBSKeevo2D1IlCvGbPbD6H42WjYx+YyrBb+fGAwLeeLkCkpXYa
         jJ2MHQGk1ZON0L3MCPYRkw5acvax8nCm+hA+zT6jZHm5z6PA7TGdjr47TruE2EIhQFd/
         BOLPyhpuY7S7pxX3SB4uPvoizrpsRSRtqom1kl6mgLy1yT8ad3v/NAi9oOVrceU4ElzO
         B4uqMFAu/G6w3HoH/piuK36F6QJR5U9RPiDC5bYtLF8YI7mJKCma/FaAQF56HjuTGTC8
         gciw==
X-Gm-Message-State: AOJu0Yzh6ruoIbapYWwo44lu5S5/bVZcZ2mDvKUK18uHdWYKyB8aO0v8
	JfP378rxg557gjzwNgSyQNF0MVu+teNAqOjejEdLEbmn7KYGKoF1gmkzdTmkiq9k1grWUHsfLg1
	bgdyJV6BHL/OCUh7+1CwESljgT1CVgGw=
X-Gm-Gg: ASbGncsR2PP9Dc4PhgmWmsKTpqsS1YGLHKmQqRbulowlsZO7yIvF15PX2s/vvjNCuFn
	e5Jx50KXuLeKt2F9wmLzy4W+P3uHoVCna2ECMtfVMVpdqggKoASp/Rv5QJe+SgrmjVz5U3K7t38
	ueElPN0qxy/r86CDxFpO6H/j9H5ifiw9mKJKjskLbQaYa2PLaOi3RhSYMouu3dJPSfDLfihn7Vh
	Ho5IgyXyaho63KzMQWVbXFrv3wWlTYzdDe/4v7s+ng5+M1OfzqNvG2sq4OSpyyYXsSpBZd5mVhO
	OHpK8c+8T3cHpQMPvCZKHbDEBzroFeXL9oAF5Syr0rF47QVsZGJed4L3I1cdqSz5cWmA
X-Google-Smtp-Source: AGHT+IEjWw41tPQYcyZKbMkG7mBxFaYIAoiDXCN4mXLrtsCi2D6Ij2LzuAZY9cMMjb8rFW+ueXqvPRrWj/6D7c6fIB0=
X-Received: by 2002:a05:6214:1c89:b0:7d2:e1e6:f79f with SMTP id
 6a1803df08f44-87c2061dbd7mr274256506d6.47.1761158967652; Wed, 22 Oct 2025
 11:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251022113212.3220395-1-alex.kanavin@gmail.com>
 <a39c0819-945f-43a7-8b25-8fc5d00d8230@cherry.de> <CANNYZj9-37415LXhP7jnNSqOynuxZVtoEo5rdQOEg-_0rirQpg@mail.gmail.com>
 <a082d3c9-ca41-4195-9020-aa722fd9bb17@cherry.de> <CANNYZj9syemH4k8NVko4uBnEuH56D9KQntjoinNYRuLRph6uog@mail.gmail.com>
 <98fb3807-f779-438b-87fa-04bf706c28cf@cherry.de> <CANNYZj-_=hdvz5EmKxoSEFJcsyCtYyQsDfJ7G+W6bnRvmWLVLw@mail.gmail.com>
 <6fd9a2ba-0a78-417d-819c-4178dfba1528@cherry.de>
In-Reply-To: <6fd9a2ba-0a78-417d-819c-4178dfba1528@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Oct 2025 20:49:16 +0200
X-Gm-Features: AS18NWBuS12tSO8BHpOVP1Ax8x_bkecGSC34reSF6zBTVWVLyMVhR0j7FtVFzzk
Message-ID: <CANNYZj_sx7op71ZCJL+vLvO954nHRFJfirnLE6ie_eQZ5q4TAQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] layer.conf: add a bb_min_version statement
 to perform an early bitbake version check
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 18:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225207

On Wed, 22 Oct 2025 at 17:31, Quentin Schulz <quentin.schulz@cherry.de> wrote:

> Changing BB_MIN_VERSION to 2.15.2 results in
>
> NOTE: Starting bitbake server...
> #
> # $BB_MIN_VERSION [2 operations]
> #   set
> /home/qschulz/work/upstream/yocto/openembedded-core/meta/conf/layer.conf:1
> #     "2.15.2"
> #   set
> /home/qschulz/work/upstream/yocto/openembedded-core/meta/conf/sanity.conf:6
> #     "2.15.2"
> # pre-expansion value:
> #   "2.15.2"
> BB_MIN_VERSION="2.15.2"
>
> as expected.

Thanks, yes this works for me too. Not sure what I did incorrectly the
first time around. I'll incorporate this into the next version, but it
would be good to get RP's approval of the overall idea. Maybe this can
be done without adding a whole new keyword (which is then used once).

Alex

