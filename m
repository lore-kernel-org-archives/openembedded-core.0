Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A0AC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 09:52:37 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.91304.1701078754537376279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 01:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j0m0fhC6;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a00b056ca38so532246466b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 01:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701078752; x=1701683552; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzSbMrObNi0WZAdUGTz3rm/QAsxQj1V8sthOcTebCo8=;
        b=j0m0fhC6aWPilUVjkk3qUQNnR59KbiX7kjhJhZkuMI7fyTQRIHwiZWjWXEmQ24kspH
         8v/BogFsLeFaH9I68AV/xiZpRfad4ZsnuTLOjVYo2R6qIFWfZ8ehMqi6AEg5NpyCi9Pe
         IbEDvE4krT6e4AFTc894H1WRPXTjeZrCIjNgRcyIzb1pc3rNC6wj8CVsVIXRB6B2rVup
         eVJ9cxvWILh8JrBeWRrAU4mxvtpkYhy1FOszJynXNkt4YHj9lJywZqXnEHviIme0OO/y
         fsh4ZYZjL9NQi77y/Y9b8wLGUTP8+RuUzZl6nx/PlQxjrxpHxlODLIlIdTh5ylInO5un
         eRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701078752; x=1701683552;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MzSbMrObNi0WZAdUGTz3rm/QAsxQj1V8sthOcTebCo8=;
        b=NJKEpoShV6K5/aeb8tWC0gHsCMS/VHLoRpeMAnGebXQATPrC2cSSbFhVda2EeZB7Mf
         vWmasEy8B9eC4wfhHJ1Bl7zF4UYEMMLDKH24KdMDRMKqfqfg1dGcKXNV/CGqw48Yp2rF
         lWHoQN52tZqfdMk70q8BgatFmXiqhkiUVx0hZljGSe4kZGPDa+sWNWAWysgB1OwfkRLu
         hJZzRSS6Tkt9S80nf9L03l9QvgcfyMzv3mRMl9jQJ/iNHtb+m/P1h3pyK2yS2l9IGvOR
         LX1MGqFfEITCXdpc2At3C/u+3Uu871vkPHV96A6AkVxTrjAnhatbi8nQ6t0C5VmDDzMv
         pQnQ==
X-Gm-Message-State: AOJu0YwqzWyXddNtw5iGxroZKrfI79itsfsS1FqGKh3IVAxRaQqKPXQe
	puIluO8S6PBw8Oet7fWhMuaM4M44Szg=
X-Google-Smtp-Source: AGHT+IEkTq/dR1+VXnO0IHSL4zDo583apMH85rYb0DFeNW+d2n0RNk7aplc7ddyn0DyP6uNU/o5FQQ==
X-Received: by 2002:a17:906:1009:b0:a09:e781:97ef with SMTP id 9-20020a170906100900b00a09e78197efmr8244922ejm.73.1701078752035;
        Mon, 27 Nov 2023 01:52:32 -0800 (PST)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090681c500b00985ed2f1584sm5530595ejx.187.2023.11.27.01.52.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 01:52:31 -0800 (PST)
Message-ID: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
Date: Mon, 27 Nov 2023 10:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: bitbake-server does not exit after build ends
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 09:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191263

Hi,

I am not sure what's the actual problem here.

FWIW, I have recently upgraded my laptop to Fedora 39
where I test recipe changes first.

Now, whenever a build ends (no matter if successfully or
if there was a recipe build failure) two bitbake-server
processes stay running.

As a result, the next bitbake run spits out messages about
the previous instance holding bitbake.lock and retries.

Fedora 39 has Python 3.12 but maybe an outdated python
module is the issue.

I am happy to try any ideas.

Thanks in advance,
Zoltán


