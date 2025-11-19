Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C297CF58F5
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:54:21 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17468.1763585660184186813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=msTMHbDz;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-948c58fe8c2so6631239f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763585659; x=1764190459; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PxdTflLK/qO2/K59q4Mem8a348kBX8dn7+7DZ3To1WY=;
        b=msTMHbDzm28pwBtTKdDCcm4TSGNlDSZpc86gnInyySDCfP2OSCVInvyUMaMK0i6O0Z
         HO/NnERHBQOvAXZFawrk/wqcoBwwlTDO4ezXg8oRpSuYAmom+/nzfRwbA10O3PKdEcV9
         XfKQfwON1//rvvbxz8FcvvUo9VyfSsee3ZA9y5pyiraQ8l+ws+D7f5jLJUTlKJfKreZT
         HWLMZM5ZVJkU9QjL61bleWud7v+AiHcpuLhewQZAseQH4FnuFXmEo8R2RURnztATjR3L
         qCoMlcgwGYqlI6JNmZDygeC8dLU82YeMHVArUIBXMhYEA/AidyiL1VhyWznRqWUQfKem
         sI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763585659; x=1764190459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxdTflLK/qO2/K59q4Mem8a348kBX8dn7+7DZ3To1WY=;
        b=iqXwzasCAPRbGabWnWgVufHU91QDzz+LGEjgstF7EkToHNCwwkqAS6VtxWGfkg4KX6
         dbGlc9HpMhWPo2iuUTfU0a3RWnuKGgLBB/cP8NY+QKn+ECAe42DkXpSJxoNicCzjJfW2
         SEBrIvyKKBOh17234J3b2lhI7D5jF14fBtmNjxloersmBBhrWLpRS1HGCl+g63cydDZI
         5HG8fhVjS4pLcOc8Piw4NkjUkmC2C2kN2z5dURBTABpKviy0VXDcXPkmCR6BFJZt/1jE
         W7jDYF8iRAMsnftWzmCberqDscC1ASBEpFfNAdVp+PMbS5ur5FMCiRB6HsWQNpUG9hOQ
         C5lg==
X-Gm-Message-State: AOJu0YzjwlWC3+MR5g6Hj8lCyRCGV5q1KjIJqFUDrPuDyEVbFdU8ztPn
	sHg8tULmHfRCEpPUVCFEFrjj2wXoUFndpDYq7G1ViuiMz5dv8Lyngboa6iu7Bw==
X-Gm-Gg: ASbGnctLYpZgZt7C0bQ4G3LsAR4m5xAkUVHHkg1KnekxBSLT1JM5/NC4vtTevLfUMiH
	PTF5efZMZUcLeE4L6G1TLISPUfr4a234nN8oVV2CEw7C6L3+JW1DH65OGYnVksjUqLZ3jcMKdAU
	17b70ZRycN32qX+PRzPTaV0ENitK+a8wikUHMBlLW73VN1PvJaHv4zpG+PFCrnL5gxQabrn63Rb
	9nAl4l3UDEZh92xfd3VcaUb1X/eNtehAvBlMLnWmRM84RzPrTZM5bVFRXs0lrfZ/zGlwOB6USPV
	zKbTbih98BJo/UK1EIL3tECmjQykREe4kWTOshejFUx7MJt0hJbFV5T2qcs2QWisDUf08d4KhBT
	DmUG+J7kiLPbceQ2HcwJmctSrV7wu5KjYaxKCdo3/yqx3VEEJ3aTwKEoSy5UwuusQj5k2HI88W/
	iKaK+zeV4IeknoYsZZxbU2m7nRBFO1jkWiuaF1CiBMtbVYsDycxE0Q0PHPI2g2hQ==
X-Google-Smtp-Source: AGHT+IF7PWOCMyah/kEojzTQ9tP9zUD3qlIjMAmgi5gen3mu3Kfqm3OMSHnIUgQocdvaiC1Vold+WQ==
X-Received: by 2002:a05:6638:c0f6:b0:5b7:16ed:d852 with SMTP id 8926c6da1cb9f-5b955c647f3mr101249173.8.1763585659256;
        Wed, 19 Nov 2025 12:54:19 -0800 (PST)
Received: from [172.26.252.3] (75-166-169-44.hlrn.qwest.net. [75.166.169.44])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b954b48bc6sm123292173.44.2025.11.19.12.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 12:54:18 -0800 (PST)
Message-ID: <093dfca9-acbd-46f5-a9fa-3476b4626b0e@gmail.com>
Date: Wed, 19 Nov 2025 13:54:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] OE-core CVE metrics for walnascar on Sun 09 Nov 2025
 01:44:35 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
 yocto-security@lists.yoctoproject.org,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20251109114632.331C31001C6@builder.sakoman.com>
 <b96e80dd-fde5-417a-a2af-6a05a6832b83@gmail.com>
 <CAOSpxdbQSCrYfN6LpDCN0xBAqtYJEQ8GukDswA7hKjvNu=uLsA@mail.gmail.com>
Content-Language: en-US
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
In-Reply-To: <CAOSpxdbQSCrYfN6LpDCN0xBAqtYJEQ8GukDswA7hKjvNu=uLsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226598

> On Fri, Nov 14, 2025 at 7:16 PM Clayton Casciato
> <majortomtosourcecontrol@gmail.com> wrote:
>>
>>> Branch: walnascar
>>> [...]
>>> Removed this week: 34 CVEs
>>> [...]
>>> CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
>> Hi, Steve
>>
>> Can you provide insight as to how/why this was removed?
> 
> The walnascar branch is end of life and not changing, so I suspect
> that this was removed due to a CVE database change.
> 
> Steve
> 
It is back in the latest metric report:
https://lists.openembedded.org/g/openembedded-core/topic/116320116>>
>> Thank you!
>>
>> --
>> Clayton Casciato


