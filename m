Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.10145.1601121902304918257
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2020 05:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LwYJ447m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id e2so2036324wme.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2020 05:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qg5oJRvXMp8m0dPOKw48vnphr/3XW0sZwen3fPWtI1k=;
        b=LwYJ447mbSZNjt/QnGDGYXf92GK7dh2oqdCBJsm4M5XYq36aEud3NRU6ivRacknxKU
         R6GCOffoGMVUBbLtR0krYIygNAp7drbC2p52pKC2UU6yXnb8vLQfMa26pbM9uc3I2SK7
         zw8y0ppToJwk/VTVySocr0wO/OQ8tsLJmM3Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qg5oJRvXMp8m0dPOKw48vnphr/3XW0sZwen3fPWtI1k=;
        b=IGTYjRFiKEf/KT1z3SaIG43qp3wJvNq03G60b0SaPArOil8+VXWegjnlasO1GGO/e3
         FWRbmifBRBuPK9RjIZcyqOYuTZan0ftPc7lze702iVfJOVgoasINl+t1unnwbq9xmtc4
         lriL5x5aNhDSsVn4Nwq+BGIQOQGGKO3AtGCP7ZSAsZj1NgctXLZG7Nk7x4M3b7b4ul5T
         iKT/0jfQR4BI3xhVNnJTANrVB4UZzmeNp6bW4r4p9R16H6/tKHUVhpiUJdtqNb9IT49N
         lIiSAbzTY6jwGQ5iXIoEEvHOCbg6cqmUYDkufjwGqR8bjmDrFbg+1SKEZDGeZUSB8foQ
         MDXA==
X-Gm-Message-State: AOAM532w9+QJ6B1ZHgZFqTAGoIvhM580l9zAPFcwwPauwjZbYqJ8D88W
	MCDjNwT7e/3xGVs11yWCHusYvg==
X-Google-Smtp-Source: ABdhPJzQCHRm22sYOL0ie5xYmy1Ul/57DvgYQwPfx0a0IzpxKHyHMGYLVazvmejf0a8jmcEYQuqruw==
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr2427126wmc.165.1601121900485;
        Sat, 26 Sep 2020 05:05:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:90bc:6f26:fb38:5724])
        by smtp.gmail.com with ESMTPSA id i6sm6886787wra.1.2020.09.26.05.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:04:57 -0700 (PDT)
Message-ID: <8245e93994abbf9cc54c270f9f21ca88f53c3864.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 1/2] testimage: Add testimage_dump_target to kwargs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Sep 2020 13:04:55 +0100
In-Reply-To: <20200925145529.588234-1-saul.wold@windriver.com>
References: <20200925145529.588234-1-saul.wold@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Saul,

On Fri, 2020-09-25 at 07:55 -0700, Saul Wold wrote:
> This passes the list of commands to run on the OEQemuTarget when
> the TargetDumper needs to run in a test context due to a failure
> on the target.
> 
> This is added here as a kwargs because the 'd' dictionary is not
> available in the staticmethod getTarget in the
> OERuntimeTestContextExecutor class. The OEQemuTarget is different
> from the QemuTarget which already uses the list of commands from
> testimage_dump_target from 'd'. The create_dir() is needed to
> initialize the TargetDumper's dump_dir variable.
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/classes/testimage.bbclass    | 1 +
>  meta/lib/oeqa/core/target/qemu.py | 4 ++++
>  2 files changed, 5 insertions(+)

Thanks for looking at this, I'm really keen to get something in place
to help with this. Unfortunately testing showed up test failures, I'm
not sure why at this point:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/2520/steps/8/logs/step1c
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2508

basically I think all the failures appearing in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1422

are coming from this unfortunately (although there could be some from
other changes under test).

Cheers,

Richard

