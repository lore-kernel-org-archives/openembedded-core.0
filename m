Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F742C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 13:24:07 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.13545.1751030644926837745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 06:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HIWaxGkM;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso3997761a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751030643; x=1751635443; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ReNFIjbSPdbkRU6sEhN6V86V99iQOE4CNctJa02SHU=;
        b=HIWaxGkMHE7/yM221ifCNwCJpbI4OoCtVmGi9LQXqxzWqncQF+sNpnwjU+O1rgE/EU
         YscBas9V0Oq+mnGzd8TyFeibslxnkEDn3Di/rB3Or8qtSamDu0SVrx+OlKo/1atJYnqS
         v2aElZl9+Hd1gNnJmkG4hwZRiJDnI6sUyxcvqfbMKqnoO/6fjau2+xB01lEkwrRN8HvH
         dcTD9Lpre4eIMfB3/lc6sMR2Pk8n0psygVcOsE41B/QTwkl+nCsghJNkTBaSLBjV/lMi
         3ZW1kbF+6cI0yneqnk20LrhT2ddE4D5fFliMq0YxDQpkHb2UiiyO9Fn+HELcpQL/5440
         fcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030643; x=1751635443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ReNFIjbSPdbkRU6sEhN6V86V99iQOE4CNctJa02SHU=;
        b=su964v0OF3WBUQLTyAIPguCFyPM1AT49q87XZwkm7BaGTf0gMjb6Iytp7aK89ZwoKE
         TfsL2AVNhDg9uvMFtA6e0/50BpIaDICd7utUWdkihOikv6t+JLuHXx+IKCH1zHDBN3/h
         XFazuz3e8KpMEcSzJFeMuyzMlnji9RomwdjjgFgAeIr1HpglJ7OoY0K9RFr8f3RwjtNe
         NHOhjNVBqfAGFj4ckni8sF0cKj18N05xFtmz498M7XIGLGoORUTBZu/d/aOjTOORp4ym
         vB6uH1OCuYWxH5qmBRSDGGug0ffPwp4VIMNSGbsQnLNbS26vY53+LbiVBZVqCmAeORbP
         UpaQ==
X-Gm-Message-State: AOJu0YzNUihbmJswfkxzxFVseximQJFPMl2xzEcsuUVDgqphDesWSrLP
	8b1dcXJ+vOTnsFDijJlJvhadtc4+Gr+f4UH9EReZ9h9F6jGbGfjFvmhE
X-Gm-Gg: ASbGncvqrYjpRa4atN9l9HZ3DkEfVQyQOvIV/HQQe1dAwFY9pdy/K+Ed+RhZYsKRwXw
	2eOiaY5yyd5f9m4qsyjuEDyz/gDTA1gGR1OY9TKDRR+v+BneyP6labyjDoT3UGALkPlwDI1CzV2
	D7344pV6Skl/HAiAb0w/OyrLxdIxSuaZC9TYz19RlYRfIUmjmEC7Zi8nqDpX38yD0A8OtClRxJX
	BAofN34ylTx69JcIAokGkjTOKtqPT3cNlwMxp8s4O16SjonMPxtBn42MdYTcnM9Li0bWbG+DTYb
	WRO+BM79Nm+JtmUaeJqzpAj0Oq67ZWI/SWYZAsEOmZVYWNBgz/p6zwm1eIz+uIpq2/1F2A==
X-Google-Smtp-Source: AGHT+IFKoUKP9lEDN4OnEo19hirxcdHAfyp5EDiyuxeX1ErduFzKrpbyMN2U8mzC75hbZNtCBIox3Q==
X-Received: by 2002:a05:6402:1ed2:b0:609:7e19:f12a with SMTP id 4fb4d7f45d1cf-60c88ddd078mr2772967a12.18.1751030642925;
        Fri, 27 Jun 2025 06:24:02 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb7b9sm1488104a12.15.2025.06.27.06.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 06:24:02 -0700 (PDT)
Message-ID: <eee1c2ce-3dc8-487b-a8f7-26e66e4691cf@gmail.com>
Date: Fri, 27 Jun 2025 15:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for psplash: Do not mount
 PSPLASH_FIFO_DIR if the env variable is empty
To: falk bauer <f.bauer@igi-systems.com>
Cc: openembedded-core@lists.openembedded.org
References: <Sn6p.1751029783474271995.Z24t@lists.openembedded.org>
 <01010197b187eeff-24883568-f6c4-49a7-bf21-2ce81864e85b-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <01010197b187eeff-24883568-f6c4-49a7-bf21-2ce81864e85b-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 13:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219410

On 6/27/25 15:16, Patchtest via lists.openembedded.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/psplash-Do-not-mount-PSPLASH_FIFO_DIR-if-the-env-variable-is-empty.patch
>
> FAIL: test mbox format: Series has malformed diff lines. Create the series again using git-format-patch and ensure it applies using git am (test_mbox.TestMbox.test_mbox_format)
>

The headers of this message indicate that it is sent from the
web-interface - which is unfortunately not usable to patches.

Try sending it with "git send-email" (or other plain-text email
clients), that usually sends it in a way that allows git consume it on
the receiving end too.

