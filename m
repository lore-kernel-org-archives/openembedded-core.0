Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EE0C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:00:21 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.7861.1698847217593269011
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=aILzf1FA;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-77063481352so74367685a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 07:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698847216; x=1699452016; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o/t/wHxSY+B7v921X9pSHL9+3TmKV7THnYxBMAgme8o=;
        b=aILzf1FA1Q6HWUOB0I/ozdPz8QO1YUstkyHioJcH1LyZBcjMftwg1qEEHPFkJxqPR4
         Os2Xc+wfkMYvRib33YKVDi98l5zYlHCYC5ZqGwxVSH5zNoIuijFEKx4Xzx6HwVvAf5q2
         28XaL836YLJE3fxTpmFhcuyr962LzmHajVU1e4a9yYvEVqL4QPJ8jjAeRg5zwD24sB5C
         0jWtuSQUBW2TICMchR2oFRnyjZNM+VInyiYAbyJVxL1/rWKXEUgZOrdjvGT2VZwbt5Jj
         d6FSzmwEGzd5AUFclL2W2vG2iAd9JvoX70rwEAlQkAV5cwpoPOvKkHCEKlFWLbbwrz5n
         swRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698847216; x=1699452016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/t/wHxSY+B7v921X9pSHL9+3TmKV7THnYxBMAgme8o=;
        b=QULLdY/3/ZkbGVejqiwf0DFpcuvTi3tYTaCgdqNHPwfnZLB6EJUZsGhvlCAPU7qmzY
         4XXToXg/mfLr91QpLoEyBA4pUlPn6Z181cGjxxWEPCsT0ACBWHIyQ0U9PelU3iY4E7ks
         k7R2bC6xbDbjc7bLg8v6jx+B4FFrSWa059eHMGOuAP8TQKjDxiAnVm9DnCOxZkaF9qh9
         bMQbnbqeUyIMdfORtCArImcdZEHhRhegj0jmgzlRKO03KGhX+e/QkpcA2H5Ov5Zcz5hN
         Ky8rIIT79J+HzhX1eJS97geQjWkDqGpsRpTxUsz3uLxx1Ay/RPl9Os5Y7B3FM5R4Jiqx
         vLYw==
X-Gm-Message-State: AOJu0YyWMpXoxzTcFzMeVrnpH5xtVSIcMFpsdpGM7jp6+XsLvmQDF9vE
	+h2mfxi0ycrPl21qz/1yXnM+JQ==
X-Google-Smtp-Source: AGHT+IFjdavfmy9Iw4nl+QWt/Wk5117RjYZoBpg3+VKAkG6Od1IID9bEz6HiPwoVW9I2d91yVYP3Vg==
X-Received: by 2002:a05:6214:ca6:b0:670:a7a7:6415 with SMTP id s6-20020a0562140ca600b00670a7a76415mr9766386qvs.19.1698847216398;
        Wed, 01 Nov 2023 07:00:16 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id cv14-20020ad44d8e000000b006577e289d37sm1489956qvb.2.2023.11.01.07.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 07:00:16 -0700 (PDT)
Message-ID: <389d1d1a-e9e6-4927-ae62-94c58b1b2ab6@baylibre.com>
Date: Wed, 1 Nov 2023 10:00:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-core][PATCH] patchtest: shorten test
 result outputs
To: Steve Sakoman <steve@sakoman.com>, Marta Rybczynska <rybczynska@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>, Tim Orling <ticotimo@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <0101018b861b3b32-256b0c3e-5bb7-40da-83f1-f6717726db5e-000000@us-west-2.amazonses.com>
 <ffa9ec9ce67f785d90b81f348c3a0f5641a4a849.camel@intel.com>
 <CANx9H-CCaTwnVc+KW+sAUJjMutNtNw-T0Rybpdw1kM7o+_qMzg@mail.gmail.com>
 <8c789be17c092ff433b7b4499388f957c32663ef.camel@intel.com>
 <CAApg2=SuPopzhjLJgC1oy3e42xEci+1_h2scS-mkT+8EsQCjHg@mail.gmail.com>
 <CAOSpxda_dq1AGeVCxaoeGLY-u+8d4k7QD7SP-MrNSyw4Kb1TxQ@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAOSpxda_dq1AGeVCxaoeGLY-u+8d4k7QD7SP-MrNSyw4Kb1TxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:00:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189915


On 2023-11-01 09:48, Steve Sakoman wrote:
> On Tue, Oct 31, 2023 at 7:31 PM Marta Rybczynska <rybczynska@gmail.com> wrote:
>>
>>
>>
>> On Wed, 1 Nov 2023, 11:48 Anuj Mittal, <anuj.mittal@intel.com> wrote:
>>> On Tue, 2023-10-31 at 19:33 -0700, Tim Orling wrote:
>>>>
>>>> On Tue, Oct 31, 2023 at 7:26 PM Anuj Mittal <anuj.mittal@intel.com>
>>>> wrote:
>>>>> On Tue, 2023-10-31 at 14:20 +0000, Trevor Gamblin wrote:
>>>>>> Thank you for your submission. Patchtest identified one
>>>>>> or more issues with the patch. Please see the log below for
>>>>>> more information:
>>>>>>
>>>>>> ---
>>>>>> Testing patch /home/patchtest/share/mboxes/patchtest-shorten-
>>>>>> test-
>>>>>> result-outputs.patch
>>>>>>
>>>>>> FAIL: test CVE presence in commit message: A CVE tag should be
>>>>>> provided in the commit message with format: "CVE: CVE-YYYY-XXXX"
>>>>>> (test_mbox.TestMbox.test_cve_presence_in_commit_message)
>>>>> Is this a requirement to have this in commit message in this
>>>>> format? I
>>>>> don't think this was being followed until now. A lot of patches
>>>>> seem to
>>>>> be failing this test as a result.
>>>>>
>>>>
>>>> This was required when patchtest was running previously. It has been
>>>> ignored for a while now, but that does not mean we should not enforce
>>>> it. It should be documented as required.
>>>>
>>>> The tags allow for machines to parse the relevant info. Anything else
>>>> is purely random and chaos.
>>> The tag is already required to be present in the CVE patch itself which
>>> is/can be parsed by scripts which actually I think is a better way of
>>> detecting whether a CVE is patched rather than looking at commit
>>> messages.
>>>
>>> If having it in a specific format in commit message as well helps,
>>> sure. It shouldn't take time to add it but we seem to be adding too
>>> many rules ...
>>>
>> (adding Steve)
>>
>> I agree with Anuj, and I do not remember seeing a rule to put the
>> CVE number in the commit message. We already have it in the
>> patch file name (recommended) and inside the patch file itself.
>> Those two places are enough in my opinion. In fact, it will likely
>> be there in the commit message (its title), so repeating it does
>> not make much logical sense.
>>
>> In fact, I have an update of the manual with more detailed information
>> on submitting CVE fixes and looking for a resolution of this question
>> to submit it :)
>>
>> Steve, does such additional tag in the commit message make it
>> easier for you?
> No.  In most cases it seems to add no value, since the cve number is
> already in the shortlog, the filename of the patch(es), and the CVE
> tag in the patch file(s).
>
> I haven't been requiring it, so have no issue with removing that test
> in patchtest.
I've got a patch ready to do this, just letting the selftests run to 
ensure nothing's broken before submission.
>
> Steve
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189913): https://lists.openembedded.org/g/openembedded-core/message/189913
> Mute This Topic: https://lists.openembedded.org/mt/102275009/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

