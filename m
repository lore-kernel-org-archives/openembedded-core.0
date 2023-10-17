Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076EBCDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 16:20:10 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.223154.1697559607286583104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 09:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=uLIfisSF;
 spf=pass (domain: baylibre.com, ip: 209.85.160.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4180b417309so35022121cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697559606; x=1698164406; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UhfWK4/+5RMahxUN1BBYbDU2jLCYfcc3lVsvxwzYUjU=;
        b=uLIfisSFNdtejhI/ztcxsAmzXIZPtb8YaqWGOeUQo+M9oslHvSqCfmVARXr0v9jAL0
         FAc6ZRchy4jKJY4dmlYUjt87Vn7BitN+3sma+KEvUhu35/uRrntnNWMZhVlaMt6PmBIU
         0d/6ftGMiiqlZZiD8cIRFX70XkTjMxYq2G5hyslbDe9DRKjQKL+I0bkAutQP1CDZfyq+
         4vOI0CSnTHp5lkik3YqxNoyBzvSp01vzUeli09CKvYxHKRUl9X6HxHY4lnfupM6hmoMR
         mUzG+4loDFTAC50f91NP2+ky+M7WE6c/76rE540ED5thHvvNGoIXbYIOQGmZloqbxLuw
         eFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697559606; x=1698164406;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UhfWK4/+5RMahxUN1BBYbDU2jLCYfcc3lVsvxwzYUjU=;
        b=LXuR/9QJisgZHhKYxs1/LXcDdjFEqfJ0a53mal+jy0/ywCA5hHvcAdQ9v+Z413H92Y
         BUKruxhQo+IimYVrfO6XbDTuKHUMEpNWifXsNqg51GW+O36fErEHoVRVDdk+l6qClgwi
         6545dOH7EnnweaH+tz/AvH2aIiTQgrr0Q61JKTYz552pI2PRJEDp4BBaNzmPNBfWBMgt
         uD7ERMETxVazt43gX36j6oy+QEt9xljAGtHV9x6AomH/+bA8ltOa2MUhjUuaj9aLGPiC
         XYeroAo+TGI6jcwvviZ/pFWG9o5qU9EmLi/Wyegl3wdCXivNYOpDQqX4icmvqm5cPKxb
         JRvg==
X-Gm-Message-State: AOJu0Yx3/JGUPxuNnHe9INKNF0mskEoC/Xe7TYgON8boexARNcTA73ZQ
	er9XgGEbxRYxdFNbBtnZtMZKyA==
X-Google-Smtp-Source: AGHT+IHNBCCUz+FzLAQx9lKRw22X9ZhXQK1uzRiFjcpH3I3tRFlUfPCYCuYprnJh86En1kH+vOu4sA==
X-Received: by 2002:ac8:7d01:0:b0:418:7ec:7570 with SMTP id g1-20020ac87d01000000b0041807ec7570mr3012783qtb.64.1697559606277;
        Tue, 17 Oct 2023 09:20:06 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id a2-20020ac81082000000b003f6ac526568sm729241qtj.39.2023.10.17.09.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 09:20:05 -0700 (PDT)
Message-ID: <54ee28ed-c128-5bde-d62f-2bda0142c6fe@baylibre.com>
Date: Tue, 17 Oct 2023 12:20:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core][PATCH 0/4] patchtest: add to oe-core
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20231016194458.2243201-1-tgamblin@baylibre.com>
 <cf924d75-68ee-4a34-aa9b-dea215a1a581@bootlin.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <cf924d75-68ee-4a34-aa9b-dea215a1a581@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 16:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189345


On 2023-10-17 11:45, Michael Opdenacker wrote:
> Hi Trevor
>
> On 16.10.23 at 21:44, Trevor Gamblin wrote:
>> Add the patchtest core tools and supporting scripts to
>> openembedded-core. This will enable users to validate their changes
>> locally against the repository before submission to the mailing list,
>> reducing maintainer overhead and encouraging more consistent use of
>> important patch tags and information. Note that there are a few elements
>> of the tooling that are still under development, namely the
>> patchtest-send-results script, which is currently hard-coded to mail
>> test results to test-list@lists.yoctoproject.org (and only that list),
>> while in the future it may be adjusted to directly reply to user
>> submissions.
>>
>> A scripts/patchtest.README file is included for basic instructions on
>> how to use patchtest, as well as for submitting fixes should any bugs be
>> identified. The Yocto Project Contributor Guide will receive a single,
>> corresponding patch to provide similar details on why and how to use
>> patchtest. Finally, the patchtest layer itself will be reduced to only
>> those pieces that are required for building the core-image-patchtest
>> image, which makes special adjustments to kernel configurations and
>> initscripts that are only suitable for automation, and therefore outside
>> the scope of most contributors' usage.
>>
>> Trevor Gamblin (4):
>>    patchtest/requirements.txt: update
>>    patchtest: add supporting modules
>>    patchtest: add scripts to oe-core
>>    patchtest: set default repo and testdir targets
>>
>>   meta/lib/patchtest/data.py          | 100 ++++++++++++
>>   meta/lib/patchtest/patch.py         |  73 +++++++++
>>   meta/lib/patchtest/repo.py          | 185 ++++++++++++++++++++++
>>   meta/lib/patchtest/requirements.txt |   2 +
>>   meta/lib/patchtest/utils.py         | 179 +++++++++++++++++++++
>>   scripts/patchtest                   | 233 ++++++++++++++++++++++++++++
>>   scripts/patchtest-get-branch        |  92 +++++++++++
>>   scripts/patchtest-get-series        | 125 +++++++++++++++
>>   scripts/patchtest-send-results      |  93 +++++++++++
>>   scripts/patchtest-setup-sharedir    |  95 ++++++++++++
>>   scripts/patchtest.README            | 156 +++++++++++++++++++
>>   11 files changed, 1333 insertions(+)
>>   create mode 100644 meta/lib/patchtest/data.py
>>   create mode 100644 meta/lib/patchtest/patch.py
>>   create mode 100644 meta/lib/patchtest/repo.py
>>   create mode 100644 meta/lib/patchtest/utils.py
>>   create mode 100755 scripts/patchtest
>>   create mode 100755 scripts/patchtest-get-branch
>>   create mode 100755 scripts/patchtest-get-series
>>   create mode 100755 scripts/patchtest-send-results
>>   create mode 100755 scripts/patchtest-setup-sharedir
>>   create mode 100644 scripts/patchtest.README
>
> Thanks for this!
>
> I tried "patchtest --patch" with the attached patch, which had its 
> "Signed-off-by" line intentionally removed.
> However, it didn't find the issue (see the attached log).
>
> Did I miss anything in the way I use it?

Hi Michael,

This is a little odd, I can't reproduce what you're seeing even with a 
fresh checkout of poky, so I'm wondering if maybe it's because Python 
modules are missing on the host. However, patchtest is currently only 
designed to work properly with oe-core patches, and trying to point it 
at yocto-docs will cause a failure because it expects the 
yocto-docs/scripts/lib path to exist for use (normally it will look in 
openembedded-core/scripts/lib for a few modules). This is one of the 
things I want to improve now that it's working again. In the meantime, 
This is some important info for the docs I had missed, so I'll send a 
patch with clarification about where patchtest can be used.

- Trevor

> Thanks again
> Michael.
>

