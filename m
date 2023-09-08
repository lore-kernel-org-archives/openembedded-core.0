Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243CEEE57CA
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 06:30:03 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.33921.1694154600983971291
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 23:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=WSxHCMJS;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-501ce655fcbso2741253e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 23:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694154599; x=1694759399; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ENDRlD0VFcgnp74aachqWq77s9EqfBaltytqSDv0KCs=;
        b=WSxHCMJSfYg1xPGATHXRKqUH9r+C1/DzMcdnWoIxMEvR+UkSRgkS21DEvO+8nbhEX6
         HZJBMfKi7olcUc7wfP+tw4hhe2OQXtBVLZ/xXU2yirvVo2MnDlCJeNFR5eYad23XdMJ7
         oq/+XgT3DazVL48uYTlWnHRigdd8CmIlYB9DidpzKwIftZqYoKIV+b2WUbZOhf5s7l7j
         WtNyJKwTxaP/qFS1Iq5zFXVXZdPPO4N4xGVwmlj8ajKk/EoxFK6R2iYMDqF1tHYkHUHU
         i4Aj8HGAWLQ2wqH8lqUMHTfLiT4c2s8yB99KBQw3ETaBktfSEL6Lj9e/hDn+JWyg+FTb
         BgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694154599; x=1694759399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENDRlD0VFcgnp74aachqWq77s9EqfBaltytqSDv0KCs=;
        b=ILcOVhqYROPTlmQWcl3bVtQJfZrPcyY63GknhjQB9xsId2uT9qibirGfGhnuhOQGMz
         iP8M7ozwrCPCpFVDPToEk6lVD0M3ekmvGDdZSRr4s2M56ifDzXc/nE2ByfB7SurzFjwt
         u5Bbf/MuCfsMU6xvxtWDpFyu7ytBQxvIReQTWaiRxvMgD5EBd2KGSGmZuL4HYl/RkYnw
         MD5JDPUndFoVkHzxtu5o5+OA7VVxKatFZiJfGUQummkvzc2gtHP2ZvwNI6lA4Erl2IYW
         zbYlx3IDIfTxc05mmTiHjUDy/PVGZWq9qXxodG9z9N1WFHIKKeoEe4qELU5g7++0FNh5
         NyRA==
X-Gm-Message-State: AOJu0YyPY3fwyt3KqlkbX2JcDCmaWUqDZu08tKMRR8v+UGIklD5dLjYH
	JytRQHfjyiP8e5uEPzALl9G3cw==
X-Google-Smtp-Source: AGHT+IEh3YN6LA7KrL+c7fEasX8UhM0mUQxvvY1uadpk4QAigQMXpC4xLC8yfrkcgHdGAy6c1QWCGg==
X-Received: by 2002:a05:6512:2086:b0:502:9fce:b6d2 with SMTP id t6-20020a056512208600b005029fceb6d2mr258800lfr.3.1694154599062;
        Thu, 07 Sep 2023 23:29:59 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id y10-20020ac2446a000000b004fe951827easm176390lfl.196.2023.09.07.23.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 23:29:58 -0700 (PDT)
Date: Fri, 8 Sep 2023 09:29:56 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] classes: Drop ';' delimiter from
 ROOTFS/IMAGE*COMMAND variables
Message-ID: <ZPq/ZOCadgGhzVBj@nuoska>
References: <20230907221120.3231358-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907221120.3231358-1-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187408

Hi,

On Thu, Sep 07, 2023 at 11:11:20PM +0100, Richard Purdie wrote:
> Originally these were shell functions but they have long since been processed by
> bb.build.exec_func(). Since we no longer need shell syntax, we can drop the ';'
> delimiters and just use a space separated string.
> 
> This cleans up the variable and quietly removes any stray ';' that do happen to
> still make it in.

I'm afraid many layers and recipes may be breaking with this because of missing
space in appends, e.g.

IMAGE_PREPROCESS_COMMAND:append = "foo;"

used to work, and now will fail. Fix is to use

IMAGE_PREPROCESS_COMMAND:append = " foo"

but I wonder if we could help detect these?

And I have dislike for :append when a plain += would work
and would add the needed space chars and still allow overriding
the variable elsewhere when it is needed. But maybe that's just me.

Cheers,

-Mikko

