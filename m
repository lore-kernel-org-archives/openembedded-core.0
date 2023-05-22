Return-Path: <philmd@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF51C7EE2A
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 10:09:18 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.18538.1684750151489591344
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 03:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=nj0XUMk0;
 spf=pass (domain: linaro.org, ip: 209.85.221.42, mailfrom: philmd@linaro.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30a1fdde3d6so2014703f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 03:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684750149; x=1687342149;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+OeH8/qYMtOvtH6B6O5Bs0c0AC9BQD6RzdULUyZ6FNk=;
        b=nj0XUMk0DbLNAGy18FNAlCb0YlDZpM1u4fcuXdD3iBuQyuLSeXec4Avrr+62gEAazj
         Bm7Pdx0hrkZQSMGgxiEnESFEF82kReCCJxqQw1IRXwYnF5A100C+gm2VUgqHfwMxuKRQ
         Sc1S+QkOKYpE6p1d3C8ZWIee1GEdEeWuJCiLG3+RTWxjKYXiBWakncHt1W6ng78tgkO5
         6UmROnRR8nlXdzmlDV8Zkz3/XcKQJjudpOhozUfliINr0C8ouE2HHzgDH1mYChaw/xsN
         3wBFy8t+96IAKIkxWUuSua77MLXfxO5+AQK4cyTO0B7LIx0WuyCPgY19mKANKpsl0bB5
         /iIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684750149; x=1687342149;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+OeH8/qYMtOvtH6B6O5Bs0c0AC9BQD6RzdULUyZ6FNk=;
        b=Hip07/goE9NJdVIPS3OvgcV6mD65wRK47Pi4sXwoq0x1Jh/c2zbkJA2yZafSir3GLo
         +A0/zwbrJkN9UyBR3YZ+4k535jrkBcG6AwzXAsQyS31uF2MnBMWWQiaKPjecp2zy+DvO
         FZYuBKlpBJ6HnTepguhMaHoIRbr8Bgtbv5OPhTaH+tbVIycDEAwTsH7kooQIer3DJBxO
         52G04WqLF+V4BJnxe3spSzsfW8MHM/oz0JFzi1WD1MdfUWnnbdJxlD4ryEjWOuNLy9v5
         M0b2sxQCUKCcCC9nuFvngk1FocVVolP7hAb1CUNPQ20NAOMsHGVC0Jtc2QtUXI/4tCFq
         8jew==
X-Gm-Message-State: AC+VfDzSw5TMyAc4cbLJXC/+GA+ge8FubpRWwLqvdt8u4FbCSNtmrgVM
	ygC7gyDx9Yw5tLzlwKdUCj7t41eK6NHyO50MIFc=
X-Google-Smtp-Source: ACHHUZ5xy0vnugmFA3wdVYmOheVWtm0FrGQYn4IjYYCYirpK6ijomIDLC0VxbiDJoNxk2DamCKZ6iQ==
X-Received: by 2002:a5d:58d4:0:b0:307:cb94:972f with SMTP id o20-20020a5d58d4000000b00307cb94972fmr5998820wrf.46.1684750149610;
        Mon, 22 May 2023 03:09:09 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.153.164])
        by smtp.gmail.com with ESMTPSA id k15-20020a05600c1c8f00b003f1978bbcd6sm24586685wms.3.2023.05.22.03.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 03:09:09 -0700 (PDT)
Message-ID: <9f41eab9-25d7-b080-5177-13d932ff62ce@linaro.org>
Date: Mon, 22 May 2023 12:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] qemurunner: support serial console login via qemu
 stdout
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20230510125935.4120156-1-mikko.rapeli@linaro.org>
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230510125935.4120156-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 10:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181588

On 10/5/23 14:59, Mikko Rapeli wrote:
> runqemu script works with qemu machines which provide login
> and serial console to the qemu process stdout. Add the same support
> to qemurunner so that testing with testimage.bbclass is possible.
> 
> Default qemu machines provide serial console boot logs and login via
> socket to qemu process but I don't see a reason why qemu process stdout
> should not be supported too since they work with runqemu as well.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>   meta/lib/oeqa/utils/qemurunner.py | 30 +++++++++++++++++++-----------
>   1 file changed, 19 insertions(+), 11 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


