Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE5BEE3F00
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 17:48:32 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.1271.1694540907261205905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 10:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WJfj6OaH;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5029e4bfa22so7307989e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 10:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694540905; x=1695145705; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=okMP583MQtt+lReq8mFlzZdDH5hpllIASB/EGp8F1F0=;
        b=WJfj6OaHh+e0C9Y6EeVSo5geyGZHYJUXKWVzmxLEq6F7Pt6CW7Vq2iecaoWnEdP1n1
         iA2GBo1nJhu9YfZZw976Zb+kHoq2K03FmaELeZwKVZWm03y/V9fRw0ku/8svTUXOMCFJ
         t+pCDz2p/ChMmdLVviukGSxrubx/cbbTLvgBWIH9IU/4BslLZ/QsR74cD9CxeSrVQYrN
         uYa7km4eKjcxZh+NqnGdySJZmSjwKoKH0c1+y7tEO8k3tBwF8+6m8pP8jQPRkTXIuKY1
         ewuC7UVya7QVDxkCzAPq6oEXcsxgKRAXC5NJLGvQgdjSLafRFZqJv+Ekp9oJyDCD/5Bs
         VZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694540905; x=1695145705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okMP583MQtt+lReq8mFlzZdDH5hpllIASB/EGp8F1F0=;
        b=k1z93zi2jA3PbQCrnDVc+h4vHLS+F4GD/WqBWeyHBQDytexSCA8L5nkaj4wYrKb9BV
         uLUQudk4RWcWJmqoB/WDSKZzIIR+mP9W5Ss0lKk+8IxovpbCf3NK703q2dvwn8+mWMwj
         xTBwDdRraKQchkG9p4tmp/+JJHKdU/sawUX7L8idwkdY+Ih7eS8Kr/zYsR6rLsL271kl
         +hARejKUuHHlFF8oNwZVPBPlog3kBeOOCFDqaOug00DkVnEojftVCUkjOnHuMc0l/F2H
         5ZuBjNHa9IBEpYG4Wd1mkgY7JLKr1GlQBd1FQ+kedRuCONty/Dg1yX7lp58JPEJ2rZcB
         IeEA==
X-Gm-Message-State: AOJu0Yxm0JATSPKcXCrhl/K+aDGTcGxvX13QcJErSVSJnbxKlLv6pU05
	r1KNfBWyiyy5NM+gdYEhcBwxSS5gSwVfL8DUVmk=
X-Google-Smtp-Source: AGHT+IFRSX9DRil6uzTpvr69qvVHQ0LvLCMk8OmmiIOKapaZlOTxNJUOnjfTzMgC5LrHlnJCAhwMv9KJowR1lHgtV1Q=
X-Received: by 2002:a2e:8092:0:b0:2bc:f5a0:cc25 with SMTP id
 i18-20020a2e8092000000b002bcf5a0cc25mr436333ljg.2.1694540904706; Tue, 12 Sep
 2023 10:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <CADEQF5GFW16EDaPdyiOTouH8nTeMG+TTdZerTHyStgAiKy+_Vw@mail.gmail.com>
In-Reply-To: <CADEQF5GFW16EDaPdyiOTouH8nTeMG+TTdZerTHyStgAiKy+_Vw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Sep 2023 19:48:13 +0200
Message-ID: <CANNYZj9XFxJvN6UjbRfBgRVsMi-oASar_neY5cDn-XcnQVK8bw@mail.gmail.com>
Subject: Re: [OE-core] mickledore - adding rust tooling to sdk seems to create
 problematic rustc/cargo executable configurations
To: Danny Hadley <dadleyy@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 17:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187545

On Tue, 12 Sept 2023 at 19:26, Danny Hadley <dadleyy@gmail.com> wrote:

> I can provide as much additional information as needed!

I think you need to set
SDK_TOOLCHAIN_LANGS = "rust"
and then things should just work.

Alex

