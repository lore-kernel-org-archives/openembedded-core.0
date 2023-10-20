Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB741CDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 08:09:16 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.49891.1697789350256487321
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 01:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=SFZbXICk;
 spf=pass (domain: smile.fr, ip: 209.85.218.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9c3aec5f326so352354666b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 01:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1697789348; x=1698394148; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hbgeVF0F9E3EbsFjBZM++wTRCYme0oGfVFzSjiHtTr8=;
        b=SFZbXICkqZBHFn9suGWyxO437gZQzS8jo0jgBZ0JVGpi/pDfvAxBYTNn9Lds+Rh9sq
         gWExeZ76QOpBEQ+8Yv+uN9ruCKjtu6p1uPOSA4l46HUfqxoqytAglLWeJmcUgR41E/d4
         ojqpsH3iEDLwZv37BOuVyF0DP4an3WE1R7x62z2uqa0SbCNXlDjLUvHqmfTh/axn5rjy
         cLo+kzXayJVifoGXhzFdX3WqeomqzVz1yYGnWWvxe7ZKFUyP91DwfMIJ7P/mleNmW855
         Ox1twYauaeLNQUC7uEEXQUdta8m3o633FQKbcZWqoKhREC+x4/ApTAgSYI5rbCDJ47n3
         77HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697789348; x=1698394148;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbgeVF0F9E3EbsFjBZM++wTRCYme0oGfVFzSjiHtTr8=;
        b=OKx7a6Kh42uxEo+n4LzXK0XBNMZycylre3mzpaGYCO9LCUiwzYVBByrMHXbMbr7xwi
         7Kt43jAwIbxdNKJG6JxPRuQoaHwlebi8RYXJQwUX0IAHWQBhwIS9PkltlC32wbhFiNnk
         gP7K8qQsf30VZ0F2Eixk+VIqYiR+0ctYjCSm+OX5Qnv+6jklFUB+og9pq1yo2jrd5F8Y
         1Na5D50EpfAPgckqeAPJf6ACFX9p5D6R+t00orRziRkW2o8UbbZ6oUn3QaooDRIKbi1i
         Jdl2fHQ/OPhQbKZ1w9WPJ7UI/zNzmRAF2/rvIJvAwMBiycMN4E5EEV6DqqOFo5ku630o
         gxAg==
X-Gm-Message-State: AOJu0Yyu54KSTGD9QCQCaz+WrJeQMs0Em7yZrGtutyW0PH3EdjtUS9t8
	Hkankqu8d9jnttHC6c06lV2pkg==
X-Google-Smtp-Source: AGHT+IE1lZwslACIGjViQSgsENKN8OGk35Knj6n7+h4YCjaexzzgwd9q4+jmAky9JR6bnt3vbQg2Vg==
X-Received: by 2002:a17:907:9619:b0:9aa:1794:945b with SMTP id gb25-20020a170907961900b009aa1794945bmr3635484ejc.22.1697789348588;
        Fri, 20 Oct 2023 01:09:08 -0700 (PDT)
Received: from [192.168.0.35] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906225000b0098921e1b064sm987075ejr.181.2023.10.20.01.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 01:09:08 -0700 (PDT)
Message-ID: <9cafbdb4-0ba4-7726-bf6b-fbc681dd5549@smile.fr>
Date: Fri, 20 Oct 2023 10:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [OE-core] Detecting unimplemented ptests with heuristics
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>,
 openembedded-core@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org
References: <c8b8ee57-7e21-0189-ba71-3e4805725bcc@smile.fr>
 <f0d794fd-ae24-4999-b564-c608da9f0af7@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <f0d794fd-ae24-4999-b564-c608da9f0af7@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189505

On 10/19/23 17:21, Michael Opdenacker wrote:
> Hi Yoann

Hi,
 
> On 19.10.23 at 10:00, Yoann Congal wrote:
>> Hi everyone,
>>
>> We recently implemented a way to detect recipes for upstream code that contain unit tests but does not implement ptests.
>> Those recipes make good candidates for increasing the ptests coverage.
>>
>> This is implemented as a QA check. The check is disabled by default since it generates a lot of warning at build.
>> In order to activate it (in local.conf for exemple) :
>> WARN_QA += "unimplemented-ptest"
>>
>> The warnings looks like:
>> WARNING: time-1.9-r0 do_patch: QA Issue: time: autotools-based tests detected [unimplemented-ptest]
>>   I've generated the list for the unimplemented ptests for oe-core and for meta-openembedded:
>>    329 unimplemented-ptests_oe-core.log: https://gist.github.com/ycongal-smile/dd51b0e450a8f0083e9d5cc10eeeb060#file-unimplemented-ptests_oe-core-log
>>   1080 unimplemented-ptests_meta-openembedded.log: https://gist.github.com/ycongal-smile/dd51b0e450a8f0083e9d5cc10eeeb060#file-unimplemented-ptests_meta-openembedded-log
> 
> Thanks, indeed, I "own" recipes that were flagged :)
> Maybe, you could find a way to notify the maintainers of such recipes, as in the AUH upgrade status reports (https://lists.openembedded.org/g/openembedded-core/message/188589 for example).

Good idea, Thanks!

I've created a bug to not forget : 
15249 – Notify the maintainers of unimplemented ptests
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15249
I've CC'd you :)

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

