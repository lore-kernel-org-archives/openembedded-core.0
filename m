Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D126D12694
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 11:24:06 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12822.1764761039339887745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 03:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CBUxswZQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b25dd7ab33so414078785a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 03:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764761038; x=1765365838; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PeQi9wuD/cr90mTaly6IsBI1iPthwG0huog+2F9P4Ik=;
        b=CBUxswZQfdDjoRkxvayQwtknmVaZZOzOdpg857B3SldMgOq/dY0ON8D25eXtUgaqo7
         W1sNRxAbWr5oVYtT+WOzB+cHxF9cV1jvigaI7awnQHOxoVNtMmm+ImkEzW+Dd0JIQyl0
         5jHe1rdrrd4xyNHsDD0XtkqS7G+cYi3PtW7VwAklBHkS3dMhU5+3/J/b5D33cQfePA9r
         f3tRWAv7aSCZJ7ZyiVLYjBegw3coc+VgMdVe7z4bR031B2AXWc9BPffUoa/c6Fw+veyU
         gJBYMr+eaK/biFYGCpyDCgqTNi6zH87pwOVMa1kfM0Xj5uMBA/i8GVVedSBd7IvZL7bi
         KUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764761038; x=1765365838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeQi9wuD/cr90mTaly6IsBI1iPthwG0huog+2F9P4Ik=;
        b=KT5SgdbbavXJiiS4QwXgsQvuPule3IE4yHwZ75X0RQ/Et8MsJNZMT0txxxse5sIyU3
         /WfhNCbrceJ6UTzNQ8H43+YtY2qaPeRAISmCnYG+un3sKTl6ky+3BYeK6gMJWrS52hOR
         oHoEz5pOS8bImYWaeB6/MZDzVoeoXN6/siRJIIW+rvnVtHMhf7vFqkd4HaUArG7rjhLa
         O8aMpVNpFznkkVTasmJrSDRNWAEwehlOTHMZqpx6O0BmV3+QXiLD7ZYqF2G2zgVJzCE9
         ZmBcJ50Ch06v/J78Dq8O932XdktgEUuQ+Ki62zHH+fn2GMH7KtQqMIIKS4H8K7BZrRiX
         J/XQ==
X-Gm-Message-State: AOJu0YyZLKtwV8tLkAu5XcTgsBwnSOPcT/o3/Td7YNP1rI/iT3rqdbRN
	R2wl+rmijsKl6doOf74mqq++K1cAam5wruF52d/czbwwarUT8TvXHAqMHkXUoCj9CULCoJs/j7i
	JKCi6HYNLLd+7VYKSX+mSO/+wPBvPcOI=
X-Gm-Gg: ASbGncvp/c+zflzNBdF6Ooadr5BR/iIQPmZPaZjo6kzP6NtKo6C8YJYaGqZjA20DASd
	ldrblqRGswpvWFIaG/9pDiThPMljkd+2ZTqhi/TuKEfjK6jf6W+X7Jt9hQyVmRycvyLHNAFtAk0
	pigw7sglvdBD4Tm2StjMF6EPIHLU2qHyVGJTTq2JjTHdkDu/HwGyx5GsCnRM7+WKKIczCZAFoLq
	hmzSoj4L7jTVdeffuu6xL0IfXjVcfsrnknIfgjqLdGvJMa4eHC5UkgN2h6ZGeiRXb3lZWwgkXYA
	Ox1kiNNqh6YmABHA/Dy/X63+nHHjEQ==
X-Google-Smtp-Source: AGHT+IFr1MJ/ahEePPCMxCWdorCb5q74RCsg/Q4OhGqwlDeWifDtzR56eRfeSfgQgTYlGHxvdvAbPFHY3FtXJuacca0=
X-Received: by 2002:a05:620a:448e:b0:8b2:ec5c:20bf with SMTP id
 af79cd13be357-8b5e554d9c0mr242967485a.29.1764761038277; Wed, 03 Dec 2025
 03:23:58 -0800 (PST)
MIME-Version: 1.0
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
 <20251128013628.2187455-2-miaoqing.pan@oss.qualcomm.com> <187C300838343AAE.236385@lists.openembedded.org>
 <CANNYZj-41tXqMX2D=bUU2Q8E7=qAC8=5M_3uvMFcmq0aKV_sRA@mail.gmail.com>
 <8d2218a0-3f94-459f-ac2f-8880d356db2b@oss.qualcomm.com> <CANNYZj9J7aNyqi6vxeZr_6viF=gze87JaKJx7-ge_6GokcCLTQ@mail.gmail.com>
 <97ef8fca-f266-4e6a-b94d-469709500c62@oss.qualcomm.com>
In-Reply-To: <97ef8fca-f266-4e6a-b94d-469709500c62@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Dec 2025 12:23:47 +0100
X-Gm-Features: AWmQ_bnTE_u4DggKOS6VmdzLDb3Rxm2wEt4_2w-JTnKr3TB4q8iQ-4z07UUGz1A
Message-ID: <CANNYZj-2aJEenGpzSq53fPbYVpLOEvSAiKKGmb4j+heNVhbS3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/4] wpa-supplicant: restore use of packaged defconfig
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, 
	dmitry.baryshkov@oss.qualcomm.com, jouni.malinen@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 11:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227215

On Wed, 3 Dec 2025 at 02:37, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com> wrote:

> The version of wpa_supplicant in oe-core is a fixed release version, and
> its defconfig will not be updated. If we upgrade to v2.12 in the future,
> the corresponding defconfig will need to be updated as well. This does
> not require significant maintenance effort.

You can still modify the upstream defconfig by adding patches to the
recipe. At that point we can meaningfully review them and consider
whether they should be sent upstream. And when upstream makes a new
version, some or all of these patches would be removed as upstream has
already taken them and made a release with them.

This is the standard practice, and it has been repeatedly proven as
far more maintainable and sustainable than making copies of files and
modifying them privately. Please work with upstream to get the changes
you need into the master branch.

Alex

