Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F07BC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 14:28:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.72636.1656944899274043830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XhsG+qir;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: ptsneves@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 c131-20020a1c3589000000b003a19b2bce36so2521688wma.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 07:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=jBCYotUr5Fr84fKGAd7gENGAFV55oS3W5keJhRqhMYQ=;
        b=XhsG+qirz5KBRBUWociPrTY9EPIymHF7ZRLn36ywrBjs2ayqd3EyNQql9qM81IrA/D
         aeBsnZTiZ6JemIyf/z2V7VAZL/VS/xPHFtzC2X/lHJwprqEV91sDUWoHW7z3qMObxEFi
         jt+d6Y5Ht1QqkOK6t/J+pMI6W4Wkni2lgsAPrHkgJx+9ns4VnPMAZiG+ihQRkhhmKFhJ
         /ctaw6UCdRo+lwB5+YKohG2XP+K53HlSwZTNFZ4d1Fi0aA0YBOgsfI1wrEJCZSkdM5wN
         L0707mO9q0eK8KK3ETvs5dVB50DCWn/qYCKsJrJO9TZ4gHiHPl2eTO0BjHBVMZ5j+Aaa
         uM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jBCYotUr5Fr84fKGAd7gENGAFV55oS3W5keJhRqhMYQ=;
        b=5ipjbhckypsebyMN4g1EH+iixJh2MnsqRfAxm6YmDIy/3uMHSdTU3Ck6xTRi0kxDij
         WRKPi9kWFnPoj8t00BQJFdoP28aJqIolnqg//R4QH2a7ifWxC7qoXT1a/OHA3FtGKQ/7
         qEzU23yCJu+tL4mk88ZEd19RAXahyl1cwSe+jjhXX3qrCmGRCu50g7gQpeHNPJUw31fV
         F99N2ptYJhBKig1CMmvMlg6Xz/1XiAXlv7pE2Hi0Pb/SYOSd8iVx+rl8UYsPPUgEySqT
         qZ+kczgyyZ5/0VeDHZtD8vvDJNhelwi1aADFvKXi3ZScLqZgeOS4jCs4eN8gP1p8lfYF
         Zt8g==
X-Gm-Message-State: AJIora9M8M6+mMG1dABGnr0nkgFmmw1/vYjbA6YtMx5Z+P3PKmq49/rf
	qVaUkAnuYvuExga+Y0WXTQ==
X-Google-Smtp-Source: 
 AGRyM1t7ycNHvYRDZiXzLcAyL62RECa/sT9I+YHzKXLIbo+q6o6LHZdG47I+yLjczSyNktO+zjYL5g==
X-Received: by 2002:a05:600c:1d17:b0:3a0:481b:f1e1 with SMTP id
 l23-20020a05600c1d1700b003a0481bf1e1mr33470962wms.136.1656944897687;
        Mon, 04 Jul 2022 07:28:17 -0700 (PDT)
Received: from [192.168.1.10] (83.11.75.211.ipv4.supernova.orange.pl.
 [83.11.75.211])
        by smtp.gmail.com with ESMTPSA id
 w13-20020a5d680d000000b0021b93a483dbsm30467897wru.32.2022.07.04.07.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 07:28:17 -0700 (PDT)
Message-ID: <8e071b38-0ec1-c5ab-a14f-776ec826d5d4@gmail.com>
Date: Mon, 4 Jul 2022 16:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH 2/3] oeqa/sysroot.py: Check bitbake return
 status
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220703114114.2313369-1-ptsneves@gmail.com>
 <20220703114114.2313369-2-ptsneves@gmail.com>
 <69be22a57b1786c0e8a86a64fea2717a2fc73868.camel@linuxfoundation.org>
From: Paulo Neves <ptsneves@gmail.com>
In-Reply-To: 
 <69be22a57b1786c0e8a86a64fea2717a2fc73868.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 14:28:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167617

On 7/4/22 16:16, Richard Purdie wrote:
> On Sun, 2022-07-03 at 13:41 +0200, Paulo Neves wrote:
>> bitbake ran but we incorrectly did not assert the exit status needs to
>> be non 0. Now all sysroot tests commands expected to fail are verified
>> to do so.
>>
>> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/sysroot.py | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/sysroot.py b/meta/lib/oeqa/selftest/cases/sysroot.py
>> index 588fc8c713..294ba4a4a0 100644
>> --- a/meta/lib/oeqa/selftest/cases/sysroot.py
>> +++ b/meta/lib/oeqa/selftest/cases/sysroot.py
>> @@ -45,6 +45,7 @@ TESTSTRING:pn-sysroot-test-arch2 = "%s"
>>           expected = "maximum shebang size exceeded, the maximum size is 128. [shebang-size]"
>>           res = bitbake("sysroot-shebang-test-native -c populate_sysroot", ignore_status=True)
>>           self.assertTrue(expected in res.output, msg=res.output)
>> +        self.assertTrue(res.status != 0)
>>   
>>       def test_sysroot_la(self):
>>           """
> I did have a question on this patch. Wouldn't it be simpler to remove
> the "ignore_status=True" from the bitbake() call?
>
> Cheers,
>
> Richard
You are right. I guess the assert is more explicit and with the removal 
of the ignore_status it becomes implicit. Let me know if you want me to 
remove the assert and the ignore status and will submit a v2.

Paulo Neves

