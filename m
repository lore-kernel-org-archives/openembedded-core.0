Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8320FC36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 10:20:51 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.15521.1743502845164383921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 03:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fENPNLOc;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7be49f6b331so544850385a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 03:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743502844; x=1744107644; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mQIc73m+UYy6teEIEgidV4k2iGyo7fFwpltVMg35tko=;
        b=fENPNLOcElTYcWS+szx9obyQg7rtgc2WASwkhGXmMBc2fAbl6A3+xpLuvGrLmMnp9p
         4KrQAgaRB6/otJXJzdU4y5Gxho2Kag04B/p3a893M1PoXbdVjRjNg76p6walGnfW5/Ux
         h2W06SzDuOOptVG22DBlF2Pi5LuOrGdbXyO1q05+irzC94VigYbhmoXe+As6+xAVEpdA
         KdqTUbX2xLBLpsIFPENw0xjqAJQQSiN1boTX5CaIU7uD+S3/b5bRDjSw+vjRX5sOAuOa
         LOGuAz6fljLwwlyr5DP5dYC959CcDjYd7zVDukprm9orRVupVhXFnp12wxPHXPcmy43r
         ctAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502844; x=1744107644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQIc73m+UYy6teEIEgidV4k2iGyo7fFwpltVMg35tko=;
        b=PBhABzMJmiBg231q2+jsGGA4J4n8K5xvBpQDcsUycYkcSJReOJRdJ2938I0WS/DAVd
         u9rV2z8QSA3tqIaYWGyAVnoUkmQlyNqEV9b0JZ8/sOfEftftZW8u839vnShupgQ9NgAx
         XMTeT6qjoFl0SsJBjVMUgCZn34U5q3NyA+8D4JXKXwM8fK7S0ZT+dZcc01K6wCfsNnuN
         ziO51eruh510yk1mvH6LnZrPhF0ZM7CsmaNfBq73pPaf+mhiIsibG/V9P9Tu6kL/cVVb
         UQtOelwKhQtIKQfRrt8A8UC4UG7l5u84l0GZQg45oPqC/A+sCmmyLEOa2HWqzUicyF0i
         N6lg==
X-Forwarded-Encrypted: i=1; AJvYcCVRfy2JzAPtHp2BGWfWrJduJOM6SMitnLELtdOQ2f1xP/r30DUaPHFWbdkxAwnFQH/4oACWlA3W87Fq3iw0uXHjMw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzrH1x2a28uZLsEXPW4vTGzgbwQG8QDxogq8Vlrq8/C0HHuFtQ3
	H4kFlf0QNSf2TBhgxjtp+ae++XpstuaELzk/WVmckxOzDQIlPbIaWt86L/d7OcjewP2YtVOLB5M
	Bold71HFfyD1xgjTVlke2HEt7nG0=
X-Gm-Gg: ASbGncv85VzMzPgAHfp/0kMcTBB5kxo1C4q/GxPmtniML3DfFoit7fCEdGeNT8O4Ues
	jSC/JJmK/HRnYQiiIJjysylqNA9MMqqF/rNFX13Xl4iSHMfFLxhvDee0Oj8xwVjE/WGXWl84ofs
	WzFIEkVTBOQ8J8wzFNVr9+Hq4kjYgu6R/CL0mCxp0lji0z0GsxHEocstxmaFfb
X-Google-Smtp-Source: AGHT+IGiB0AITApzEAIhIEQ2SAIicIKwHtrziJ+MaimpOXe+s71aHIQwRLrSxDrIOu1299W9kc6uJR0DkT6aDDsi9OA=
X-Received: by 2002:a05:6214:20c7:b0:6e6:6506:af59 with SMTP id
 6a1803df08f44-6eed5fdc1dbmr183773076d6.15.1743502844153; Tue, 01 Apr 2025
 03:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250401094825.1938-1-leimaohui@fujitsu.com>
In-Reply-To: <20250401094825.1938-1-leimaohui@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Apr 2025 12:20:33 +0200
X-Gm-Features: AQ5f1JoZ2plGBNPskSDwDFvhmD960P8hpBE-OFI3JsK-OjiDMH5stlFX7rBn9ek
Message-ID: <CANNYZj_FRbT3XV+hurpjE+JYz75UiU3dy1kNkjLpkaPYvMiTBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 -> 24.11.1
To: leimaohui@fujitsu.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 10:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214013

On Tue, 1 Apr 2025 at 11:48, leimaohui via lists.openembedded.org
<leimaohui=fujitsu.com@lists.openembedded.org> wrote:
> +DEPENDS += " \
> +    python3-pdm-native \
> +    python3-pdm-backend-native \
> +"

How was this update tested? python3-pdm recipes are not in oe-core, so
this is going to fail immediately.

Alex

