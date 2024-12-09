Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8FAE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 12:12:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.100050.1733746315150896126
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 04:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k+9FlWmR;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434e84b65e7so20865565e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 04:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746313; x=1734351113; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vlf6caTF+N0xRLARonI9RlxB6IO3V73FKbSd16n2Bk=;
        b=k+9FlWmRKWjIUSHz5amoAv3g8z8sX46IPir6Z68UFZLVPaYUHUzhhLuSKyqRG39vE7
         ZKimDXpAhSAfJdG9k9fW5VFL3ipL5p5oY+I7LLiMTMWCUuqhlpzzWb21IUb1Kg/qV351
         2TPo2sgXSmDSMCooQVXTjbF4nYFxbkFIkOy4b+Ad+ub3NQvcYNTb8oVtCIJKKgrTerPU
         dP0+AnUcqK1pd+cbg6gP7aMH+B9ZMaR80oSySgkHqrtT4eTTKal0MijVdTwcW8F1mfgI
         0pHCPr3z3XJA3hLHD3ViFE+2xSYaDvqZgv/uNrX6M2Ye36ArJPRFtRLGL8Tg4IX7Xh2b
         WiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746313; x=1734351113;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vlf6caTF+N0xRLARonI9RlxB6IO3V73FKbSd16n2Bk=;
        b=bTcnV4u8/gLpzpa2hV543ZZTjnh1/w1Wy1QjSohuQHHHFcCYqCXWgpcdZymiJCPOAt
         GpFLIOq41VTKRl7myMAKGsMHruRa0sC2l45jhk42eozoiKjpw4t11P3gxYUgIxk9YeYh
         YB4DDWTbxCOKFBfMaHvHIWM8a1xwLxz2qXCKRYGK+ZnvIhOPs3OEp3kALo1pEBJdH+rM
         gvKlkw6MPI+Y56aYuPhZk3TGueHDKfcoHrao/PBaa/+VzdolELug0XitH1JWnCtR7CoF
         /q7KcCT//JPivm5pu5ix0gKUtVGHwCtreZFVHvVxjyQgdEAGIp1jzijBhLeNmA7WJ5BY
         3Mxg==
X-Forwarded-Encrypted: i=1; AJvYcCV+oBpMF88VV9ixDADnjExRcIXpQYHxdJjxUdeeHODXMvUE98PxMxWozWyjSEluNZ21b48lmjAh2z2fqiywLZolOw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwoITrPFfioatx0y61+XGUSg087wIZeYdYAGI3O2MlHOL/l6CcA
	2OCpYLMGuD+6t005LXkmj9R+o+D+MDDq1mwV9JaoIf+Buho1XNKq
X-Gm-Gg: ASbGncs9q4Gb+Pa/UAO7sdCJ0NXBHDUIffmMtQRoCsfxzpTTQqCLhkuKyAHPfQGfTQs
	cXqncs/a7xsB0GtBPMzO3HRn7egosaZ06uFXIE5fRH0k97qEI2ssonGa+H1ssYc2Cz4g2j6L+io
	rdbqikcSOjYGIs8rjXQbx+tlYJNaYKYytMSFFzgybxmZIC0sfPvZVw8JyVgDd7W0H+JfU0Aeb5G
	zQO8h1NNGijCqOEKTFkPlxer30QG1wwbLFcaMEGQx2kfQYb4hSd2gFcjqh63T99uisNI+1AVlIJ
	aaWGw+NiBq1OXDiDfY9mEJwJ6duEfQ==
X-Google-Smtp-Source: AGHT+IH+9sketz1pshkIJ3nGitQnesQr7SXCVO+uODQcSj99d6Y7A9WlWlKkG9yoxsKi+iz4O4y6Ig==
X-Received: by 2002:a05:600c:4f84:b0:434:a04d:166f with SMTP id 5b1f17b1804b1-434dde4dd11mr113544295e9.0.1733746313382;
        Mon, 09 Dec 2024 04:11:53 -0800 (PST)
Received: from [192.168.188.21] (77.118.58.106.wireless.dyn.drei.com. [77.118.58.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbd72sm192903815e9.44.2024.12.09.04.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:11:52 -0800 (PST)
Message-ID: <ddd7c6e6-9e1b-89b1-c7cc-625ce4978308@gmail.com>
Date: Mon, 9 Dec 2024 13:11:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH v2] wic: bootimg-pcbios.py: optionally pass
 'initrd' from .wks(.in) via sourceparams
Content-Language: en-US
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
References: <20241206164822.18330-1-Robert.Berger@ReliableEmbeddedSystems.com>
 <D66Z8Z0753NP.2HHE39VDDW4FO@bootlin.com>
From: Robert Berger <oecore.mailinglist@gmail.com>
In-Reply-To: <D66Z8Z0753NP.2HHE39VDDW4FO@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 12:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208480

Hi,

On 12/9/24 08:05, Mathieu Dubois-Briand wrote:
> On Fri Dec 6, 2024 at 5:48 PM CET, Robert Berger via lists.openembedded.org wrote:
>> optionally allow to pass 'initrd' from .wks(.in) via sourceparams
>>
>> Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
>> ---
> 
> Hi,
> 
> I believe this patch is the source of the following error on the
> autobuilder:
> 
>    File "/srv/pokybuild/yocto-worker/wic/build/scripts/lib/wic/plugins/source/bootimg-pcbios.py", line 177, in do_prepare_partition
>      initrd_dir_and_file = os.path.join(deploy_dir_image, initrd)
>    File "<frozen posixpath>", line 89, in join
>    File "<frozen genericpath>", line 188, in _check_arg_types
> TypeError: join() argument must be str, bytes, or os.PathLike object, not 'NoneType'

Hmm yes this looks suspicious.

> 
> https://valkyrie.yoctoproject.org/#/builders/15/builds/580/steps/12/logs/stdio
> 
> Can you have a look at this issue, please ?
> 
> 

Can you tell me what you tried to build to get this error?

I guess the problem is, that it's not quite that "optional" as it should 
be so when you don't pass the initrd you get the error.

Regards

Robert

-- 
Robert Berger
Embedded Software Evangelist

Reliable Embedded Systems
Consulting Training Engineering
URL: https://www.reliableembeddedsystems.com

Schedule a web meeting:
https://calendly.com/reliableembeddedsystems/
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--


