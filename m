Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78014EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 12:43:19 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.6498.1689684192521907390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 05:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=V1YRYaee;
 spf=pass (domain: baylibre.com, ip: 209.85.160.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1bac0e25891so191710fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 05:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689684191; x=1690288991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fPtN1LnCbLvgyBWofdkWQ5Sfuzqm3XhYSMuHz20af44=;
        b=V1YRYaeeUjQA6WTzqkgSL2BXAEnK3iJqv++0ewNtlsRpu5yV1A0zkmX1jkkCdI6+Xi
         QTjBUnSpa6QD60r5ixG+KkzpvDdYs8+LPE5/N6qw2rDuwzHIYlXbI5CPEsHGooqfhT5n
         DHDnCsKnGhwrqkKxD95WA/JvLQHGappfu+3A8W70XOVRjgRRHl/OmiZEfhC0XGOvaZK0
         RVaPc0xQ1vFLlwubwZ+T6vqK68x70tKdP2LeifY2qBbzOJSUSM7Fgqo4o2DaaYbdCy1E
         +xwBn/D4I03tYZsRFty/ZH1vWCdIN5SJ67NhV8FvTpo/ibSiF9f5bK5IgoALszhjg2Qd
         NI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689684191; x=1690288991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPtN1LnCbLvgyBWofdkWQ5Sfuzqm3XhYSMuHz20af44=;
        b=GPD2fjtHjE/fNW2qiQOUwBCyPwbEXw3LRn2IAP13MnKqxQDzGUYW1tvos48DlSbB4a
         VFMHG3kvgpaFS58jOY/qIpKwg20Ozy+75rOthfzLceXU/0lF6Et9GY46XgU4Q5f2fmG7
         FY5EYVjIDt0qDJaGHLjWbqSooZA/4dJBPXNBTK4W+O1NIrWooyCIPjYqJIwZrLnpGlWQ
         /H6Iv4y4s0EuwjgpGUmjJG9OuSNLjXlL3eKRwW1xt3/8kqeuBTwAyLGsTuEJrdIwinXN
         Vzvr8xQjkWKOoGc5NaW1juyU/OyN2cgGKrtFrOIYC4prusx1PfLL/OXodRCA6P0xplRZ
         nEqQ==
X-Gm-Message-State: ABy/qLYXUpC8XlRIWnmbVu1zYv5JI9DiHSXcuBdRSBrZZtL+4zAQSrJ1
	TmQQ4V3daoVJ8IH5djsVzSxa4g==
X-Google-Smtp-Source: APBJJlFSWEg7nlM+3VJZQ5Y+XNAfml2C2LaQmQ365vr4O8G4gXkSWI59DOiUIJ1Pny9TElgKToWCtw==
X-Received: by 2002:a05:6870:d207:b0:1b0:2f70:15a5 with SMTP id g7-20020a056870d20700b001b02f7015a5mr15296833oac.52.1689684191275;
        Tue, 18 Jul 2023 05:43:11 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id os28-20020a05620a811c00b00767765561absm547513qkn.100.2023.07.18.05.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 05:43:11 -0700 (PDT)
Message-ID: <fa6ba812-a8a7-d812-1819-5910aee4d2e7@baylibre.com>
Date: Tue, 18 Jul 2023 08:43:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core][PATCH] python3: parallelize ptests, add test_cppext
 dependencies
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230711172545.738677-1-tgamblin@baylibre.com>
 <CANNYZj-7ZzO65GN+_X+peMDFp31Q1M9Tx8OEfj0p0PS4VB5Ecg@mail.gmail.com>
 <c42e28fd-7c9f-ed6c-d2f7-8b0930233808@baylibre.com>
 <CANNYZj_hZVaTs1JR9FabZW2cbVQfW6hSqwfHcTE8z2X_ONddJw@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj_hZVaTs1JR9FabZW2cbVQfW6hSqwfHcTE8z2X_ONddJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 12:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184502


On 2023-07-17 16:16, Alexander Kanavin wrote:
> On Mon, 17 Jul 2023 at 15:06, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>> AssertionError:
>> ptests which had no test results:
>> ['python3']
> This happens when the test prints no PASS: and no FAIL:, this is used
> to catch regressed ptests that don't test anything but don't return an
> error either.
>
> Can you run run-ptest manually and check what it prints? There should
> be at least one PASS:
Fixed it. Needed to have curly brackets around the OR statement for it 
to print. Since the patch is already merged, I've sent a new one to add 
this in.
>
> Alex

