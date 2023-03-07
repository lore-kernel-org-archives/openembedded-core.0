Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D5AC678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 15:13:25 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.17550.1678201998130049091
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 07:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F6KrT+pC;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id ay14so49872480edb.11
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 07:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678201996;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqDSRJCcg5QitXN/7/qYg7ofJ0lWQzwVbpm54IAWKx4=;
        b=F6KrT+pCf4ekhEAIs3VARVh2+Wbtsm0XgJ3MHMiK4RJ/MHfLUfS0CNMDlowv07k8EQ
         ftJHSAz8f/unYShEU1dTMbGJr3P9IQUCpiQuxiiJcIpKUsI7DICv7iFinCVmNtuP/gry
         sFoCo6CHH/q1w3Rhl8AMyDgFAwmBbU26mpuSHGDJl/WeFfP969Hf1nx0oo034+HNTAUO
         eBiNkusOibWQgtwoTMlWD5BIyvA0c07rzby4GuDoU0Fvl85H5fqbpH5qxZUqPDECYYfw
         psL5TghhohPnxUwD/DCdkvvPTE68vHJuqV6/PqdYSURhNSuyU2SJZKw21mFCzeL+3xTX
         +aXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678201996;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eqDSRJCcg5QitXN/7/qYg7ofJ0lWQzwVbpm54IAWKx4=;
        b=WPudh4pkJ5g5v0+sr8kzKfpPOnjHWwcl6kCZeTOFdorMAtBvjN33MGtE10SPskQcdD
         jNLyyWy8f6BMoszEMLs+MJcAKJi37bPyxAr1zsU1dFAZSW05YWAw3qTnPfqQOAcPEEtf
         YbLVT978sJGTYIbFioF8Qwcx75ucd73bz0SVyOZ5B1Tj2s0NYpj/yi7djzMgH7VZwoo8
         r1HMJxwOnGkw0jgR+HS0dR3zbet0p1rPX0pkEvUfDsfm7lhU4+2o4CW1FhkBbDaIQ3zP
         kqlnx0+dVu/XoJxGXSXzfUgR4pPiG0iT55l7cSFLF2peRkwpphM4PTEvj2azbAb5m8GF
         5uWA==
X-Gm-Message-State: AO0yUKWGWReS51u4EdbWGj/SA/TxAWt3LJ9TBslLYDVqKTlx8J0zJFo5
	lzjffsQefkiH/lSNldgqAxpazPcNtAA=
X-Google-Smtp-Source: AK7set/uDmn2vdjZic9tMjcX3N7GYmWos4jr2cLoMcHzTC6HKsHXQmNqjZIc9GwRc7XLTh0mNKk4zg==
X-Received: by 2002:a50:ed18:0:b0:4af:7bdc:1891 with SMTP id j24-20020a50ed18000000b004af7bdc1891mr14222525eds.11.1678201995964;
        Tue, 07 Mar 2023 07:13:15 -0800 (PST)
Received: from [192.168.1.143] (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id v30-20020a50955e000000b004bf2d58201fsm6909298eda.35.2023.03.07.07.13.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 07:13:06 -0800 (PST)
Message-ID: <ed526f1f-9ef4-5c46-1ee5-7eef641c9684@gmail.com>
Date: Tue, 7 Mar 2023 16:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: python3-ninja to speed up cmake builds of python modules
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 15:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178108

Hi,

Recently, I had to create recipes for a few python modules,
among which a few used cmake to build their C or C++ pieces.
I saw from their build log that they complained about
the missing (optional) "ninja" python module, and falling back
to the traditional compile-one-file-at-a-time method.

Do we want to speed up building python modules that
exploit this or using ninja is too rare to bother?

Thanks,
Zoltán Böszörményi


