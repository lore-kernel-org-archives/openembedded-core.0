Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B26C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 17:19:12 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.14059.1678295950288201258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 09:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ADj0HD+Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id u9so68753934edd.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678295948;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2H4EtgyTLSWDc8Ca+fW5u/ZvflJv3LJhgeGZWSCrw8=;
        b=ADj0HD+YOpyFemU6o1XvkCGtky63JHVptqofGraSCOuGt1psBfgt3mAOaixxp2dIN3
         s6bgSzL3G0cKsNHJmyeKRC/PoH6Oj38hPO+pQ+y7HW1XMw3W2VVBHJbQ2XJ6TeHoJCm8
         M9wL6fv64NkLOZS6BUiCUo7dzmiiVA1aJaYRx9CcAmP73s2XZVkhtuVDEwYKE1eu0Hts
         bnLTfjlXeHGJyPIQOgebgJ/Kh1rCb3ZiFRCzi6CdcLFE0aG1vBU1Q5ZaXl76xRTkOxKV
         r7HDsO9Nnm7VA2xDH59AFOxH+kmhCw/xy/QcKauPW6Vhoxw1pW9J3cMUjqOW4TGd1o2b
         5tIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678295948;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y2H4EtgyTLSWDc8Ca+fW5u/ZvflJv3LJhgeGZWSCrw8=;
        b=cS7NE3793MnVGj1CBJZi7zw3i1nqZO/iR7n8zDF6MqDi/vEBXI5Yzoh7xhMGwkbn/b
         gR00kuyTQbaMLDzkOXtfCRzAqC/No4JU+XpVjjWHMY2XEazWpJ4Njf4KcedTiexwJVKE
         95eTak5jiv+yEoq9c1BjpqtnoivXYwo4LIklfGGzoZWsSLHsRPxy0fiPceDczFwfIqA7
         5+fuJet4OEpV8qxgiDg9gBWXd5YbR7FjWkBRYLg2N5qMuH7XuJZG1UFtB3zYZeoo+X6K
         fNwMWk2sqyHvxTUp0FbQj86jIbB/PjDrPERxq37Thrx/GRDm5pUca/fqhLW1HKAMTx3R
         h8yg==
X-Gm-Message-State: AO0yUKVJZuz7tdhrMmjarWDyayl976dft5KuUbhN9d6yKqJ6gu3/8ga7
	dwxpzAnW0mx1Zo9Ly2RJQ6lEHr/PeBHB6Q==
X-Google-Smtp-Source: AK7set+UciN4dXoA0phStJeljrIESRgMQqPDdImGY8oexyWhlOhTPJaymmpiL2xKSHIQ27b5IBCTxQ==
X-Received: by 2002:a17:906:4997:b0:87b:d60a:fcbb with SMTP id p23-20020a170906499700b0087bd60afcbbmr17209101eju.47.1678295948344;
        Wed, 08 Mar 2023 09:19:08 -0800 (PST)
Received: from [192.168.1.143] (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id o21-20020a170906289500b008ef42f9cf48sm7682394ejd.82.2023.03.08.09.19.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 09:19:08 -0800 (PST)
Message-ID: <39e3c709-d743-a680-2c20-915df263f0d5@gmail.com>
Date: Wed, 8 Mar 2023 18:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: Inconsistent libOpenCL.so.1 expectations
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 17:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178183

Hi,

I observed the following inconsistencies:

1. opencl-icd-loader and ocd-icd both provide libOpenCL.so.1

2. opencl-icd-loader has PROVIDES="virtual/opencl-icd", ocl-icd hasn't

3. oe-core's piglit recipe explicitly depends on opencl-icd-loader (should be 
virtual/opencl-icd)

4. meta-intel recipes RDEPENDS on ocl-icd (should be virtual/opencl-icd)

Currently, I can't install piglit together with e.g. openvino-inference-engine
because opencl-icd-loader and ocd-icl would conflict.

Best regards,
Zoltán Böszörményi


