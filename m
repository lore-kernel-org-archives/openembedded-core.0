Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9952CE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 14:29:12 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.102827.1733754550581651689
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 06:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IlabKz5c;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385ed7f6605so1947421f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 06:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733754549; x=1734359349; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Unkgd+QFjECRgS+Xid6wCJm7jxXevagldiVWtKSc61o=;
        b=IlabKz5cCOW/h+UjGAVejWICBO4NvJ57xLx1NOz1JaOzGqFb4EQ9OQP7L68Y45KnXj
         AL4Vi4VLm3F0mQlqsZo1dUIU7wnndMzV/9T9X5v+gDKD7TZqH1ghJbRac+OiiuAmPYg5
         1+bF0SmxGc+Z/1U9G+547a7FcWdDPvA120R8x57hSHiZFk4Bo2n9gLonmHRuenGAeSoE
         62Er9LjN7qVYYx8V0y51AIOyxgJDF0c0UI/XwRDpePsMtLHStpTE35k0//Bv4/iXBuYb
         Wc5qybiqyjLhMo1t1NryCGH1nRDZ0m2fDFemsv/4vCeYYIgYaSdEDu0yN9jVW2qp6Ijd
         tJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733754549; x=1734359349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Unkgd+QFjECRgS+Xid6wCJm7jxXevagldiVWtKSc61o=;
        b=gB90nR8SlSmn18M/vBOjGpAkoY2HEwisxcQDCcLy2rYZygmGKWx/7E935/RCjOqz8b
         v9C1642VHxReVIcj2R+4BK/y3iO0c3qb6QRefusGsGk1Vz3W/MkohU15t3DtaZyq/trD
         gq2DW8wTJa5ehEQ1k8TgPGwS2VsPcHZuCfEQLSixIzLghK1zvmYju+hno13pch2KiDjA
         79TRmb80Fhv31w6+yZg9/q5XCZiF/3yG1tUBH/vESqRqhbnCkRITy5Vy6vw/x6/c2Jxj
         pOUrRV83dmcsO3WugZkv9AXZRqcq9yXww3qLlFaD62iC0WW3Dz2gXxtj2Kr3dHHgphEG
         548A==
X-Forwarded-Encrypted: i=1; AJvYcCVqx7B3G6U+v5ijWOkO6y7StXlpgCx2ait4sFqAgWk3ByADKVS6sdSO7YYwNHoNn5TlBARjEv1FTH0K6CwlUELVRQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzxiJyQrkzh7nLeqhInWjI6If2eTlEbGacnQPZ1ZnTWTCZh7j2L
	TcjUXIsRunsLQyobriDaDC/WafLt39WpCAass4dfsizu4ID56E6GAnDXeQ==
X-Gm-Gg: ASbGncsrY5REWe0TzaDBxAP8VmytMdXRiTenJrn6WJ+tAonwXCa/jabbIbZ2VEnDLjt
	/S5dGtYxNLc701EhGNIqOzR8QPrfn9VrOaoIw3czTU9yOipWWoc08LOHdRJ0UTYNc89Gp1edFQF
	81WD1kATL90rwuxSv6o06mNsg+GiZLtaz85zc+gPDo9zrcL15/TAKFMTv+jfBJS7gz2qBN6cmge
	fHHLnlIYuzjUkPJeGMaDunPCD3FVnZWGbCrHcCY4Z+Q8pdGfvxXjLjSQ+4v/inkXRVwExIdbMXJ
	FTmgV87EXM1+dhlYhZS+QBMlKyEFSg==
X-Google-Smtp-Source: AGHT+IHzWTR9+DSmgYVdiK5Et3nSPDyGxGXLF1tVziTRpamPTlNNg6Y2KLriyXYjlIMLvn1crtMSbA==
X-Received: by 2002:a05:6000:4609:b0:385:e8ff:b9c9 with SMTP id ffacd0b85a97d-386453f9ef7mr453831f8f.42.1733754548672;
        Mon, 09 Dec 2024 06:29:08 -0800 (PST)
Received: from [192.168.188.21] (77.118.58.106.wireless.dyn.drei.com. [77.118.58.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbd72sm196665435e9.44.2024.12.09.06.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:29:07 -0800 (PST)
Message-ID: <73d14e42-55a9-5400-fc57-6de2de1c4dba@gmail.com>
Date: Mon, 9 Dec 2024 15:29:06 +0100
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
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 14:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208485

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
> 
> https://valkyrie.yoctoproject.org/#/builders/15/builds/580/steps/12/logs/stdio
> 
> Can you have a look at this issue, please ?
> 
> 

Please drop that patch for now - it will take me some time to find my 
example which uses it ;)

Regards,

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


