Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF2CC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 09:57:06 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.91670.1701079020558059118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 01:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E0YaDnlF;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a049d19b63bso547639766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 01:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701079018; x=1701683818; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EVMjGYwUZQVNSLJ3xqQ1cXgF+wSXHad60H/9Iyqv4c=;
        b=E0YaDnlFKLK426F4Q/krdK000XhQJHlqzyh91ONQKAUSu+RL0N3ZwkdOGs021eqfN9
         W+5s9b4jPHQFx53p1YDEeVjwVEe2sicE2OiabNf7vXcvLPg1fB6jbVGe6uVtsfNX80XO
         FWIusJ29IeFbTjmsaYfkhzVF2ezB4fV/phQFXU2GCOs2eq96KPI2eaFvA8lUIhjLHRCx
         13kq6H8f1s6UapsSWcKzzl6adc+NaqlAsnPExRX+7J/yg5EusGi2fCKJz8MxxCbRZ3kd
         Pe1k7llEVCRvTX/BLBOjbP2l2M59M6DfcjsNFlWA5LUZ+teeR5vzeaoezr5iftoKC/Rn
         GNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701079018; x=1701683818;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EVMjGYwUZQVNSLJ3xqQ1cXgF+wSXHad60H/9Iyqv4c=;
        b=eiJIqkp5pk6g/7mFTg2k8wE1XKr7nPvom8M9Fd1h+/4sZmP9m9lkUqGi4WHleXB+iq
         TN/xbK05nYCE7yFyZbBoOxtY44hWFUzkEI3t2OkIrp2jWzwe3vFZvJCo0htOUfH3bBHo
         OEweJWbtCRvx1zvl1oMj1b3G2EPg7czqCT9nXfBQzsR2521O9gF3wwPBWFmTilR0wFAt
         sT/gu91uvNTdQ6X4/tk4mjbrpQKolao/CkoZB43EpCaIScgCY+oelvRgfOwVd2hnnRwy
         0MkDDFWS/5w8dRc9UeDAkOf/2HGgESpHcOW0+uCzQOps6Kb9zC4CazhF6Sf61in6+l7x
         UbLQ==
X-Gm-Message-State: AOJu0Yzj0K4OhHf/pUyni3KhxAMPMwbmOOnPzpMdtWzFcfUB72xj+7y2
	zwT4X2i+UY1F4/ZL/Ps2PruRKjxSYyQ=
X-Google-Smtp-Source: AGHT+IHfXznlsAD3TD+eHRmwyJFHEcQWDiakb8h9tRo5W9rXvJk/dOSkdItheCuRzcX+6IGolgw9dA==
X-Received: by 2002:a17:907:7751:b0:a02:f8f4:45c7 with SMTP id kx17-20020a170907775100b00a02f8f445c7mr7595951ejc.69.1701079018120;
        Mon, 27 Nov 2023 01:56:58 -0800 (PST)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ci11-20020a170906c34b00b00a0d672bfbb0sm1923418ejb.142.2023.11.27.01.56.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 01:56:57 -0800 (PST)
Message-ID: <7779715d-0d0c-4209-ba7e-afa8889e2edb@gmail.com>
Date: Mon, 27 Nov 2023 10:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] bitbake-server does not exit after build ends
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <179B721D67836847.32091@lists.openembedded.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <179B721D67836847.32091@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 09:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191264

2023. 11. 27. 10:52 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> Hi,
>
> I am not sure what's the actual problem here.
>
> FWIW, I have recently upgraded my laptop to Fedora 39
> where I test recipe changes first.
>
> Now, whenever a build ends (no matter if successfully or
> if there was a recipe build failure) two bitbake-server
> processes stay running.

Builds for mickledore and nanbield both show the same issue.

>
> As a result, the next bitbake run spits out messages about
> the previous instance holding bitbake.lock and retries.
>
> Fedora 39 has Python 3.12 but maybe an outdated python
> module is the issue.
>
> I am happy to try any ideas.
>
> Thanks in advance,
> Zoltán
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191263): https://lists.openembedded.org/g/openembedded-core/message/191263
> Mute This Topic: https://lists.openembedded.org/mt/102826186/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


