Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3E6C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 14:18:37 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.22488.1707229110867065110
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 06:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=m3rTZNr+;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78407987510so235383585a.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 06:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707229110; x=1707833910; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1pqG7r7YSZ4q/ZGkTXoZ2aZ0T2nTV+BNJQ0fvW4hALo=;
        b=m3rTZNr+nFpi6F6FOrIpVN4Hg/cPYB1Sh4uyMjiXGHmPh2aiG7EnY1DLIXx7p7ixv/
         5PdCMUohHHBP/SaWSVjf+dvcQTDRwQq3IvmzmMpdx//DWWj+4Qh1KeT2cZld9k/OlKG1
         XPQr1W+9z4tTNKEDvMC22XsCbu9/+rJg8EgVgOTjC+Qzu5XHMbYuXtNmR3snoB/XPXAr
         OLdIUYhXv0ZCRhYmx44ingIqqg2RoxaS4LXNSkbZtcmlmtw7oqISEdYhKU0QOUw/Na/p
         P65HM0TFdhF+fN0Rw7G8TtJ0npDYrf89O58+rwr7Q+dKWmVtfKH/ovH1PFXSGEs0j8ab
         NOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707229110; x=1707833910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1pqG7r7YSZ4q/ZGkTXoZ2aZ0T2nTV+BNJQ0fvW4hALo=;
        b=DEmhkLNLYpDoYaaYEsTIGlgk65DZGnJqbetwSS8uqgL34NHE8JF3LMhfQ4uVg5bTps
         p11trVlL7kqyQv0+XMCt+WUtUXDib9rJehnRlkhalrCeUByQF/YqnYIb7tDUAE+iDhkd
         I2naC2dY0u33M4p+OLLDJJdn2rO9IaS9l68EK0LGWVpyn32/pMAefvDAeiohCuy4HhX/
         q2PlxUc8G+su4CjIsWeaK5xLZJaz+a/Gl5CMyDYk5005wdMdoEPXm3FgCh4lcjxEDs8m
         b9MA0aweR8KHwkSupjTFbuuORxYoBZKE9vFn4bKWFiutfjsVUXXilQrigKLLbouAtbat
         uGZQ==
X-Gm-Message-State: AOJu0Yy5D4TLf1qz6puJT/RGJjvoNAAz5SqiINQI5pM5wnWg9rtbJqxf
	LXcdmkW+65ecSc5rlrp7ym/D7Jbwbp0BPV+eNgY2M7tXQbaiLTQdmSKccxXzaOI=
X-Google-Smtp-Source: AGHT+IGCBEUf/wCyr5MKBNQI7cpOTs3ALG3u5NTBDnLb8dv6tlbgQeBoYV/558+O18xUlC8xLWwZiw==
X-Received: by 2002:a05:620a:450e:b0:784:37fe:820d with SMTP id t14-20020a05620a450e00b0078437fe820dmr2872636qkp.59.1707229109772;
        Tue, 06 Feb 2024 06:18:29 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW63Q0xRc7DYNtIQ7U3D38bHcZbSsFNyd/4lr/4UoJl+0qphAn15gpsmjvid1N0JW7H1zKktjNC6Z9AHD9qNj+bvLN14g8JjMyw/kAbJBLhg1XN5SNsSeHYcXqb0q8iE2uoZ78VwnGxZZAmL+k+nuH/4gxVdALfuA==
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id c11-20020ae9e20b000000b007840843f3b2sm937613qkc.18.2024.02.06.06.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 06:18:29 -0800 (PST)
Message-ID: <844b6a09-e3e5-48e3-99d4-05b647da7386@baylibre.com>
Date: Tue, 6 Feb 2024 09:18:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH 0/2] patchtest-send-results: prevent false
 positives due to commit subject
Content-Language: en-US
To: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240205155730.115895-1-alexis.lothore@bootlin.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20240205155730.115895-1-alexis.lothore@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 14:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194994


On 2024-02-05 10:57, Alexis Lothoré via lists.openembedded.org wrote:
> Hello,
> this small series aims to prevent patchtest-send-results from sending
> reports to submitters in a specific case: if the commit message
> contains the word "FAIL", it will (wrongly) send a report to submitter
> despite all tests passing / being skipped.
>
> The first patch is a trivial cleanup while the second patch brings in the
> real fix.
Sorry for the late reply. Thanks for sending these out, nice catch!
>
> Alexis Lothoré (2):
>    patchtest-send-results: remove unused variable
>    patchtest-send-results: properly parse test status
>
>   scripts/patchtest-send-results | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194952): https://lists.openembedded.org/g/openembedded-core/message/194952
> Mute This Topic: https://lists.openembedded.org/mt/104178720/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

