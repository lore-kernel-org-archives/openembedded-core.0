Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EEC106289F
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:12:24 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20601.1773234741524605989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 06:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LhitJ6VE;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483487335c2so118612985e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 06:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773234740; x=1773839540; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=grfiOP7HXgSWIuEg6VFr+g7k8aop//hA75mY6MN+x0Q=;
        b=LhitJ6VEtHdtk6mRJLwT6MRQ5LySHhDBUA3yzyCi7E0xsW3sE73eZa34bEyO+PmJWU
         WX8FcMIkyB15ItmfdvcUmT1LnjqxbW667z7w/yEgVt1Yfi5ZyJshTKkN2VwwR3iUyk08
         GnAeVN6iEKIA8sIF7vv822WuC3/6FUIToeMonlLsXU2ONP1q+9/WnYQ1vrIAovYeNHiz
         Zwj8XlEZusIIwHJBhl2tkZ0LaEYkquovZTiN2gHO2IAQcgWtvoQqabwBhrkn5VoB7bxb
         HzuLVal+MZ+H/Smx232EqKLZkXd9zboK5IJ6X3OYwlmE07we0uc3ype9Sfi5hl3kipb4
         6sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234740; x=1773839540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grfiOP7HXgSWIuEg6VFr+g7k8aop//hA75mY6MN+x0Q=;
        b=S8rpz4ORz39g0QYcxb5GouTgDHei/qnWD1Sf3kDaops4mnFFZrvBKFYSfdp4dLVIna
         gamvdGnaRr+pUQI5M6igHm4IsAnXB89VoAOA7Yz1L8mQEoFADdpar73TIyJx0Cx3Bbp4
         0Ts23czbzjbY19KEv2vp9YgEtRYXKi4xn1NIr3UgPuyvtaI3nKEa6jtKqf40lX1/l1Hj
         /8Sv6i5rCc6Xt3H33LSoHdZozqHpXWz5zt2JEFarO2x3ajidJzXysS2PLG6CywvHpHFa
         DSTHI16i4FKzRopmXZdvYcOLFEgEgWmLWL+9kevBJozdF66x9KbvB8sdFqQcxeCQWyW+
         oDPw==
X-Forwarded-Encrypted: i=1; AJvYcCWGkm0O93bTve4XZWF2H6BU6pyvWEJ06hh+JUP+TJ1bv5TVjE7mY6CJed5V+7Fu76tAkXyQzN+Up5aVjofqpFiBZw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw0YoSsxfDRCADe8KIRijJ8qfROKoDEWk6yfvvPW1XyqsViARyt
	6qkoZWqQvc3RWa9zVdUDnVvZpSNfAWKraF7/naRsxEoMK3N7IS5Hl+SsqT8+wg==
X-Gm-Gg: ATEYQzxIhd6I/l5b00wL6/k56V8wekoUNK6UnGDHhQCWDqIkSpDoh76oIsmtffHm1MX
	hpD8szaRGO+V125rqG66kg4yG9xTFE1mb8pvkoh5ECG4SFYppgeWu5UVlotn6zReHiH2s2sC0LN
	pLf0eLfIyP7zz+BfZ2HQbfrV6cVQNm95Qm3ZsLUnmEZgeWHSa8SM0dtzrXULcivmjp4phl3FQhr
	igosgj14G9fDASriRRRBojDUYw4sYCnMy+06QRbM/BR9JApb1n6i5SGfi3K2suoNOQ2EJNy2a14
	7YfWcPd8TXoIkWDZbuY2/5/G3AZpvXARgqZEPoJdL4F6z+NyzT7QD90lsB5LF5CXaCg8iSpDFYw
	vEkRfJoO8sVsywHJmY1A6pSghPUuhRVIsYSOKVRGYD+5yODiaM4YEn3UWDempF8p1TsCmJL6R/n
	DHK9yWUEuinBEaxfC6rg4WdNIpELQOgsQr3FSps6Lj655IOY1O5GnLwIg=
X-Received: by 2002:a05:600c:64cc:b0:485:3d3e:1675 with SMTP id 5b1f17b1804b1-4854b0b97fdmr40043355e9.8.1773234739550;
        Wed, 11 Mar 2026 06:12:19 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fed7sm49122155e9.11.2026.03.11.06.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:12:19 -0700 (PDT)
Message-ID: <8be68784-e846-4ddb-9127-e4e6082347aa@gmail.com>
Date: Wed, 11 Mar 2026 14:12:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
 subpackage
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260311122922.4160133-1-zboszor@gmail.com>
 <AS1PR10MB56977E851FCBA7CBCE3B4652FD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <AS1PR10MB56977E851FCBA7CBCE3B4652FD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232878

2026. 03. 11. 13:44 keltezéssel, Marko, Peter írta:
> These INSANE_SKIP assignments are wrong.
> Use GLIBC_GENERATE_LOCALES = "all" (or select just those you need) in your distro.

It doesn't help.

>
> Peter
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Zoltan Boszormenyi via
>> lists.openembedded.org
>> Sent: Wednesday, March 11, 2026 13:29
>> To: openembedded-core@lists.openembedded.org
>> Cc: Zoltán Böszörményi <zboszor@gmail.com>
>> Subject: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
>> subpackage
>>
>> This fixes a QA error:
>>
>> ERROR: QA Issue: bash-ptest rdepends on locale-base-fr-fr.iso-8559-1,
>> but it isn't a build dependency? [build-deps]
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/recipes-extended/bash/bash.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-
>> extended/bash/bash.inc
>> index 634209c911..b43b1cbf89 100644
>> --- a/meta/recipes-extended/bash/bash.inc
>> +++ b/meta/recipes-extended/bash/bash.inc
>> @@ -32,6 +32,7 @@ ALTERNATIVE_PRIORITY = "100"
>>   RDEPENDS:${PN} += "base-files"
>>   RDEPENDS:${PN}:class-nativesdk = ""
>>   RDEPENDS:${PN}-ptest += "make coreutils perl sed shadow util-linux-setpriv"
>> +INSANE_SKIP:${PN}-ptest = "build-deps"
>>
>>   RDEPENDS:${PN}-ptest:append:libc-glibc = " \
>>   	glibc-gconv-big5hkscs \
>> --
>> 2.53.0


