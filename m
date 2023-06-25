Return-Path: <philmd@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17934EB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:35:58 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.20510.1687728950670473753
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=AvsyvLlR;
 spf=pass (domain: linaro.org, ip: 209.85.221.53, mailfrom: philmd@linaro.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3112c11fdc9so2109400f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687728949; x=1690320949;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xd9Vxd8aQPlQUdnEalJ0fS2JtADfA13ztmunCzEpXF8=;
        b=AvsyvLlR+Rlp/BeOtnxDjaDcZYlFcYYREL6MCZaHDpbHvugvCDduR9Qyy3yXC3iAYD
         NgBRECNnFU+PnO43V7AKro4iD420AzvlyVAy6TEQhTVdsPOKIzvwpWATqCuSrpxQS2YB
         /vVqgxYEqyk34V7HeOiTlDyow9FfugWV8qNSJv8zBVIEZwSthGdsPRcEIES3SbKxDu8J
         a6WOFfcff9B2QSboAVDT1+ojC71RR1wXmkC31yZiFqQJ/ytKcrj6HVeFUKg7Y0GtoxGy
         F0kY1ys/3a41aPV4TpU2AkvPCXfVvXaIu2byHmGl8ZsxtrkEwDTStCiPP0eI+xw68Jcm
         bLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728949; x=1690320949;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xd9Vxd8aQPlQUdnEalJ0fS2JtADfA13ztmunCzEpXF8=;
        b=OxHAJKGdnv4FWmadK4kATyVXnfYHFEykhpyuywRFpPj8R6t6aJU+hHmHn3kyozR7t/
         bjDF3CGaRDeqRdO4rzsVzwJ+wWNHkervRg7M4U7y1DmDAoWDQ8TL7FJtux9ZsbpFbmmL
         jszFWhblgBXQlk/xjHcm2gmk/+VBDRQdM918OWfLHSH7HdXqKSsDCTM3ejvLuM4wn/5R
         unzCk0YVRAO6dhQl44JVcuuE8TPozNkniSTNNTicqJFKNPTBiR2HeDzcWSF1S3VtClHD
         Gy0D4R1XzczX8q2+OHvooXU3Kh8ZNbQwBfoQw1TqD3oJeNI/DaZgUwxPZxdiSIVyiZb7
         vfTg==
X-Gm-Message-State: AC+VfDxJJyzfz5XE+Nhu5y2E0Xvi81G65NmgZ8O7RbhPJm1f0YPJySN6
	Rduxs6/gEAX5hopjQV4uG020Tw==
X-Google-Smtp-Source: ACHHUZ5FtEm5k9EjAeYWFA8Duc5J3caODl0PfxL/QYHk7YZrJ+TPdptgHnbY906au/bAV6fG3+jrtQ==
X-Received: by 2002:adf:de88:0:b0:313:ed1d:39d5 with SMTP id w8-20020adfde88000000b00313ed1d39d5mr1558724wrl.35.1687728948878;
        Sun, 25 Jun 2023 14:35:48 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.212.184])
        by smtp.gmail.com with ESMTPSA id k26-20020a5d525a000000b003078354f774sm5457346wrc.36.2023.06.25.14.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 14:35:48 -0700 (PDT)
Message-ID: <9c38d028-3ccb-0bff-5619-0d0b1380ab43@linaro.org>
Date: Sun, 25 Jun 2023 23:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] runqemu: Stop using warn() since its been deprecated
Content-Language: en-US
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>,
 openembedded-core@lists.openembedded.org
References: <20230625042746.3999111-1-alejandro@enedino.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230625042746.3999111-1-alejandro@enedino.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183397

On 25/6/23 06:27, Alejandro Enedino Hernandez Samaniego wrote:
> logger.warn() has been deprecated, logger.warning() should be used instead.
> 
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>   scripts/runqemu | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



