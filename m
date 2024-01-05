Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB19AC3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 11:43:05 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.21791.1704454980865447408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 03:43:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fCfc1iJp;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd1ca52f31so17204201fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 03:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704454979; x=1705059779; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TaZNp/mn+l3VrXT1wOmV1+PjUC+fCi02txI4oPYMXn8=;
        b=fCfc1iJpniOx29tN8/mK+4ZLRgYuZP2tkaVEdP/vGmnmUd/V1BuJEat3s1sGJ5ZaXZ
         14mpl8XYh35ThCQWE+LsC/+srTW5DemwUMptOb4LoZlzxdm7OnWrrjkpgzK3RMaOb1aE
         0FGYjjHp3aj5mmKXHyq/9HuI7+DlyIM1sUMTcyP47wgYfeK+Xv6uxMp77vIK9qqIIvyo
         LUzNi4i7TnM1zyFiWiNqFCYGu2HMbllfh4BTQ5HsSF0gHVC4meRHkj4UTpN50IeZ6s1X
         U7sUPMUFpAAeRKGfBNc2AKlG7AIgB0nYFwo9hf/OpTnwsfS54Oh0vPNlseKBZ+YysKgl
         q/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704454979; x=1705059779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TaZNp/mn+l3VrXT1wOmV1+PjUC+fCi02txI4oPYMXn8=;
        b=FfvXiu5aIpMgvEWd7Rx7CDwuTZ3xpMkL527XfwlodtHd+9jThLh1ApkiRwBbhi/NXD
         q+KR04cKTxOK5gAjoUYWUazpeYoXRP+gYXtW2xD6l308TEx/iMep/bpbZ3Bcq114Lz6C
         lNgvkJHdfmFfhp7PNyW9Mud2p+OUIJGfU/9BvZtHfh8hy8urKfo8vjQW7QzeSu6hVAut
         0fbTqe69XUnbqU9ie1FXPgXxcIjTXSfM5Tew8KhDJAoc5H2UMRQsaDNAR93RwPqLQ+QM
         wOY1sZqjVg3xywID/XHRAN6ZuEexcuDzPPrSXpwaob8c2TF7a+0sWXl2IHdvfW/tSSsX
         +wgQ==
X-Gm-Message-State: AOJu0Yw40fmLoEGEfM6WSm7VYvYUpr4nbIcyHEKz6MYYB2Mj+L0rcjnI
	JE+0Py+TnjXR1z/jGQBgBxagaEuM9/E3yuLBLbI=
X-Google-Smtp-Source: AGHT+IEOTA20ynTN3pJf7r7V9rwIdWUEUfMXnc2awWABrb3uoU5rRLYQ7RTGwR8kq8w4gGqOwHjJkO53zmBn7KXDFng=
X-Received: by 2002:a05:6512:238f:b0:50b:f3a0:861 with SMTP id
 c15-20020a056512238f00b0050bf3a00861mr1260524lfv.7.1704454978834; Fri, 05 Jan
 2024 03:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20231218084403.599015-1-alex@linutronix.de> <20231218084403.599015-3-alex@linutronix.de>
 <c35a799d9843214d220362c0a190129e2299b93e.camel@linuxfoundation.org>
In-Reply-To: <c35a799d9843214d220362c0a190129e2299b93e.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Jan 2024 12:42:47 +0100
Message-ID: <CANNYZj-px=OXTm0x2D3sJVJxHx8c_wqMXwHeO0Ex1B-829bUpw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/7] sstatesig/find_siginfo: unify a disjointed API
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 11:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193352

On Fri, 5 Jan 2024 at 12:22, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I've a few ideas on how we might be able to detect potential problems,
> I'll continue to try and work something out but I want to make it clear
> there are some things it is hard to change :/.

There's the option of adding another function (find_siginfo_v2) and
leaving this one as it was, this is how the kernel does things. They
don't shy away from adding v3, v4 and so on either. But I thought less
code is better than more code.

Alex

