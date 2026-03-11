Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC261125815
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:43:04 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21266.1773236574656893988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 06:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JblWMqlt;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48539cbb7b1so23815415e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 06:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773236573; x=1773841373; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=720DlU/MFfBpMhnMNiaj2PeKa2uOoangbHSFHrzM2EQ=;
        b=JblWMqltrJZZPeOJyosv8KxI+UlcpSZBGNL6k0OLlKcfRcsBALtDb/vCPl+tZcw9zM
         gmUmmnrcZuPviuvibECE5noTO9hrALsRPF/prrzLk8GpKmbnyafeJRp/NSbpccf9iVrT
         TmCMgjHPeqbL5DvqkyeQmRMX0+kHLSPu0yf9JUe1DiBBXZS/pNq6k+E+FDu8G1Dz74x9
         qqyOs4UkovebnOJujY+828SkHiYEbve191XNtW42x3ZJxs2JaSW9yfflMCE6SY3TeN98
         L1wGy2TRpMAV5kvkNTpG36x2yzaupE5T9tBwSls9QE9Op4y/YIWsqJLfe3w7n0ct88ML
         wgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236573; x=1773841373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=720DlU/MFfBpMhnMNiaj2PeKa2uOoangbHSFHrzM2EQ=;
        b=rCcyPP3fS/fErv1vnElEsZe4cPbBOU/6hWT5tIxJLYMgqt1goNwGHMhGrO2+CWtkue
         f7sZ2VoHu2bUbvn37EJAuMQPquifqA/FbVkHz8MrlfFSv/pCEYiyjfOewkNtRMk/1NB8
         8y97EfZQhh925OiSLKVgqBvVvgvoytrh4W0SttxulZn4lIdq52u8E6m/7wJfsm51xG0o
         W/jmdhq4XFfvF3ZymbXo2SSgdg7iwQK4HLntwn31Um5WevkZ2dkmWk4Ic2LEWo0WCShN
         OkcZvyoIWvAminFAcuKf5u+j6hmcmeD+TO72As8EFmB/25K5LYYjIbblHO76yy2xlOEE
         eChg==
X-Forwarded-Encrypted: i=1; AJvYcCXTT7HUHR5aShmSrTYMxKxle1XmkOkX717jquu/iJntSJC25R+Qj9sHZVIuLvEjzodlxPc4bxHh/nwrDEPBJQz/Lg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwlE7DVtIR8/hOm0MckNCBUi8FU88YUx44R0NJYsmthwZ2Sers2
	/nHYAUWCruzFvNmf38Up8g7U88ksNsHfyZnxLLWh8t0I6mKEFG+IkftJSSywGg==
X-Gm-Gg: ATEYQzzqhXdGNUCliQs318HA5ISrPbOAM0QiDljsMdvY6ixhOszxy3DbRIkYPrIkGR0
	LjwvFdHw1FUN+7rKSfMm/2ep4y8pAW/OIF8/hgwbbiMx5kwFXRVhvIZxdfJslm5FcwUwDuS6Wie
	/DXWABOo3r+DxblJn5XrzukD8RgG8SuItPsSxHuuJcMdVOFn9PdCeVWnJAcWWfqFxFh00c91wHI
	XxLMrR9mkYSE2WpeJPJHM5572WvkGw660H0yVUlcYBs+cL6AuXJng6sr9EpBtRKHz01jlV2MIfr
	GoOpPbJdPX5UFAj5kukusDZWlcXl/e+1CgFUpx99THYCQQuOY6zXnp5zozn1wM/dkkM6xEQuSmV
	VUWdxes5tSYf+RgYl8MuF/EL8/k4oEhBOd0UMWl0YLwdwU7kukDCnJqptNnGsNkBTytutJw22e3
	kUQsHv368091fGTdoY2IMgK+CtwObj8PAollwH94/gavEKiFGiA3UV6Iw=
X-Received: by 2002:a05:600c:4710:b0:485:3b00:f939 with SMTP id 5b1f17b1804b1-4854b0bafa5mr48826765e9.8.1773236572770;
        Wed, 11 Mar 2026 06:42:52 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aac28bsm146408455e9.1.2026.03.11.06.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:42:52 -0700 (PDT)
Message-ID: <f2f689b6-1600-40dc-94d4-6de8906b2490@gmail.com>
Date: Wed, 11 Mar 2026 14:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
 subpackage
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260311122922.4160133-1-zboszor@gmail.com>
 <AS1PR10MB56977E851FCBA7CBCE3B4652FD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <8be68784-e846-4ddb-9127-e4e6082347aa@gmail.com>
 <AS1PR10MB56979EB1C738893C31052E3EFD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <AS1PR10MB56979EB1C738893C31052E3EFD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232883

2026. 03. 11. 14:40 keltezéssel, Marko, Peter írta:
>
>> -----Original Message-----
>> From: Böszörményi Zoltán <zboszor@gmail.com>
>> Sent: Wednesday, March 11, 2026 14:12
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
>> subpackage
>>
>> 2026. 03. 11. 13:44 keltezéssel, Marko, Peter írta:
>>> These INSANE_SKIP assignments are wrong.
>>> Use GLIBC_GENERATE_LOCALES = "all" (or select just those you need) in your
>> distro.
>>
>> It doesn't help.
> I'm not sure why it down't work for you, since it works for me and for Yocto AB.
> Did you added it to your distro settings and not just to a recipe?
> The explanation about this is at: https://git.yoctoproject.org/meta-yocto/tree/meta-poky/conf/templates/default/local.conf.sample.extended#n61

I added it to my distro include file.

>
> Peter
>
>>> Peter
>>>
>>>> -----Original Message-----
>>>> From: openembedded-core@lists.openembedded.org <openembedded-
>>>> core@lists.openembedded.org> On Behalf Of Zoltan Boszormenyi via
>>>> lists.openembedded.org
>>>> Sent: Wednesday, March 11, 2026 13:29
>>>> To: openembedded-core@lists.openembedded.org
>>>> Cc: Zoltán Böszörményi <zboszor@gmail.com>
>>>> Subject: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
>>>> subpackage
>>>>
>>>> This fixes a QA error:
>>>>
>>>> ERROR: QA Issue: bash-ptest rdepends on locale-base-fr-fr.iso-8559-1,
>>>> but it isn't a build dependency? [build-deps]
>>>>
>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>> ---
>>>>    meta/recipes-extended/bash/bash.inc | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-
>>>> extended/bash/bash.inc
>>>> index 634209c911..b43b1cbf89 100644
>>>> --- a/meta/recipes-extended/bash/bash.inc
>>>> +++ b/meta/recipes-extended/bash/bash.inc
>>>> @@ -32,6 +32,7 @@ ALTERNATIVE_PRIORITY = "100"
>>>>    RDEPENDS:${PN} += "base-files"
>>>>    RDEPENDS:${PN}:class-nativesdk = ""
>>>>    RDEPENDS:${PN}-ptest += "make coreutils perl sed shadow util-linux-setpriv"
>>>> +INSANE_SKIP:${PN}-ptest = "build-deps"
>>>>
>>>>    RDEPENDS:${PN}-ptest:append:libc-glibc = " \
>>>>    	glibc-gconv-big5hkscs \
>>>> --
>>>> 2.53.0


