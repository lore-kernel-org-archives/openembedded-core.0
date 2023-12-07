Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54560C10DCE
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 12:15:36 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.82123.1701951335069473247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 04:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=VvtpSbsG;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-332f90a375eso845842f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 04:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1701951333; x=1702556133; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=517GrC3EtmbG8PQBoKRZrnYTIsDMhi5CGfa4GWIwYCQ=;
        b=VvtpSbsGUCbeKIqgEIbkqqBhkeoCvEFwM+l68koCikp+m1UTsaR5EbeKRNP2ds20BS
         jZeVetjyj6m/rElMQXxINCt2A34uQ8rs8RNGg4+MsfnYgMo/XtB0oZWoxsvwWxGTYCoS
         HmZNLexqL3GLI/suvERYE2WYxlBfOnLel8KOYXiXOQWpgnnSRi+oTvYbDufzSjGgv/Ny
         Ew9PCNPBQmhHzIngBmlXxVQ+uIU8HMKnAqpFZzv8sWjHp0yNU4aEWLvwBJKqdgckEwoL
         6+zhqBdTi58RrpCSH1A+ZWy+Y0f9mZ7zmJBLXI2U+I2AKQPPCyI8djAFZ6sHxwcomyZA
         cRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951333; x=1702556133;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=517GrC3EtmbG8PQBoKRZrnYTIsDMhi5CGfa4GWIwYCQ=;
        b=LPxxTJhSodNSmIhIo70zR46kb3FFGK0JuEYn1kBSld1uD8e2GbtcgEOquq0k0yFs17
         JqmqEanxhuARnzBzct8yUsu+38KwAFt8kuIJipyk5HK0T1VCmUp2aG/OgbLU8kDxSUL8
         hI1vNaORF5Ol4ScLYWdsMwI2igBuN9SfRfEV3fIiSD+B4Iu9yHT0FZvJ66vx8I0bQqSq
         w3L8MbnZPA+fSGBoTjp+13gZDWJlBinYDPpDCsYJyOvaeqsHOsksmryIVHZpfQ9xsxEj
         hAHPUEz7nsAF87X4jTBT09kXrRopPSXZtWyfKvoPdDrioV2L9YCoi7h36yf9+nnqnxt8
         8B0g==
X-Gm-Message-State: AOJu0YxIZiFNdzWmaEB7j7Snc+M379qfAvQ32wg0d6aSXLP7RVzXAckd
	vtKLeilwovsooYyDG1HxKWYu6xRFZxPrjWN5guM=
X-Google-Smtp-Source: AGHT+IFFMbamBt9eN+h/RpG+hdJqKW81m7TF9LqvTxv+7X+PK/Pq+94Ovf8pTMdCLuiAPjrbLzknkA==
X-Received: by 2002:a05:600c:5190:b0:40c:1da4:3c68 with SMTP id fa16-20020a05600c519000b0040c1da43c68mr1570482wmb.102.1701951333486;
        Thu, 07 Dec 2023 04:15:33 -0800 (PST)
Received: from [10.1.75.166] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id v14-20020a05600c444e00b0040b47c53610sm1718944wmn.14.2023.12.07.04.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 04:15:33 -0800 (PST)
Message-ID: <7199f571-bed6-4b2f-837d-252b3fcc24e0@smile.fr>
Date: Thu, 7 Dec 2023 13:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][mickledore][PATCH 1/1] python3-cryptography: fix
 CVE-2023-49083
Content-Language: en-US
To: narpat.mali@windriver.com, openembedded-core@lists.openembedded.org
References: <20231207115815.532553-1-narpat.mali@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20231207115815.532553-1-narpat.mali@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 12:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191947

Hi,

Le 07/12/2023 à 12:58, Narpat Mali via lists.openembedded.org a écrit :
> From: Narpat Mali <narpat.mali@windriver.com>
> 
> cryptography is a package designed to expose cryptographic primitives
> and recipes to Python developers. Calling `load_pem_pkcs7_certificates`
> or `load_der_pkcs7_certificates` could lead to a NULL-pointer dereference
> and segfault. Exploitation of this vulnerability poses a serious risk of
> Denial of Service (DoS) for any application attempting to deserialize a
> PKCS7 blob/certificate. The consequences extend to potential disruptions
> in system availability and stability. This vulnerability has been patched
> in version 41.0.6.
> 
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-49083
> https://security-tracker.debian.org/tracker/CVE-2023-49083
> 
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>

FYI, this is a patch for mickledore branch but this branch is EOL (End-of-life). See :
https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#LTS_.E2.80.9CMixin.E2.80.9D_repositories
https://wiki.yoctoproject.org/wiki/Releases

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

