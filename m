Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41E8D46629
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 21:18:40 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1057.1768511913858159882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 13:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZI2oNNNL;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so8836945e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 13:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768511912; x=1769116712; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APtfshnCOgMAd4qOU37PjC1UzuVGkxwBiC286J3SILw=;
        b=ZI2oNNNLFXGZzEwRsaZvru0wQ1jYDfTbyfTw7knZ0HQdkz9ZRDkutUQoeDRL0crTbh
         jrl398lMIdbBQmLzXuaScL8YzRRRFpwayZEhsIPRpvF6/uXrTwUW9qKY9nr39tJLck13
         EwkQcQatm0RYok4AkOidz6yO8g8JjIMkl75ZwygoTcAXi8JxSDURQjeZ+uZCe+G8KhO5
         EZAZ8J8pKmcw48VFGOON9lj55gIeoLItz1Kl00kV77sgWLNAkeFQ26ediZXKlwO0ZyGH
         fNksnU+misaZaiCYijZTZYnqcaxErCrqc4rx1OW/UAvNjY6RTkuIjc1zYChAMseARyJB
         RVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511912; x=1769116712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APtfshnCOgMAd4qOU37PjC1UzuVGkxwBiC286J3SILw=;
        b=k1odERsQLkX7pj3TwmMdRexoJ0lMStAvHh/w5GZDi7OMfd93ZrFcWdYbOH9tlbzO4w
         0pSqzsORH7u9Qoa8pvvAle5eEEK+Ye0vol2erY3IP/Mzf9MHFdAxdpDILhRVq34aV/St
         gXN5LzrnluoVgmUi9Y8TSH4ODhA6dm5jAP5EanVxPj9r4kXK8KQp8/m8H4i5tq9nCr/B
         653WK0etYpGbEP0DQJAYfZO6uEAvR9HYkzGxIlvd30hbiw1/+DNY84TiZISv0j/If/me
         tAUrKunbL+dLvIVJfhmCI9QoOJ6IU8wUc4x69y7bpMUasRPq7bIyAsQ6L27S9igtKmqc
         oWkw==
X-Forwarded-Encrypted: i=1; AJvYcCUioNnNJOiJZBSTVQmVccO+vDTiPNtKXHzZALToaAaLHO4AHVlnljq8B45CYiX8n2bNs7l3mGh1GKXK4Doe2ZuZyQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkLBKIaQ4fswRgHFZ46l+GDKvbswkfXQEN+yOieiUtOVXKSJzc
	+QhHCRFXTB6PscUq4hIuPzZI+YgieFFM5eJ8E+9edEmA6yL47xhcBeHj
X-Gm-Gg: AY/fxX6NSbw/Sbo9LssHjVS3NOv8n8AuFf6FswnIfxeXTOz+Sdvm4oSMVpelCI38o2+
	pgYWoam4f9oa+lBbfPZ1ILjTBGeRUBT0wdI0ZtRPpoJDJvBmElrDOpn0hOjbd8352HXteAddmkJ
	NVBhjQj2iij9HT/u6jISBTAarXMB+OKPTt+5xtnsRyrYcOg/LwTGwWOg2UVPSP8uIJgiYt6vKN1
	3xuQMXyctQ40Vaodh+3NdKo4mCvmJ6iVQVXKt7FxsPxrsTIcBwlUupPmkE1rO+Ep8m2O9hQEhjQ
	yvkNyKjBrsv7emnzwx4bpC7O6bGFvDNsTf/J+7cx9gyWS+f4+wXj8nWMXQNeJv2q2sXDQYA++01
	qjhWjmBKudY4Jgi00yPmoB4WbyELUShP2wCgA2o0q7elfqa3FE0fmfe+acSqhUbhPzUyujtL3BN
	YqV7hnm6FpjBMJqGhbwd7UWsCWkg==
X-Received: by 2002:a05:600c:3495:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-4801e343a9fmr12196765e9.29.1768511911949;
        Thu, 15 Jan 2026 13:18:31 -0800 (PST)
Received: from [10.54.7.179] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e80c477sm13308015e9.0.2026.01.15.13.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 13:18:31 -0800 (PST)
Message-ID: <30338f3a-39e5-4e2a-b7a6-120142ecd6b3@gmail.com>
Date: Thu, 15 Jan 2026 22:18:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/3] overlayfs: Fix the QA skip for ignored
 mounts
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20260114185508.380709-1-uvv.mail@gmail.com>
 <20260114185508.380709-2-uvv.mail@gmail.com>
 <4c89ce299fb704382932a367669852b0617c9232.camel@pbarker.dev>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <4c89ce299fb704382932a367669852b0617c9232.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 21:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229438

This is actually a good point, but I'm not sure how WARN_QA/ERROR_QA can 
be utilized here. WARN_QA/ERROR_QA expects one keyword, but 
OVERLAYFS_QA_SKIP expects a flag per mount unit. If we simplify it to 
WARN_QA/ERROR_QA, then we enable/disable the QA for all mount units. 
This will be a breaking change though, but it sounds like it might 
simplify things a bit. Do you think that would be better to use 
WARN_QA/ERROR_QA instead of current mechanism?

As for the check performed twice question. The file list is populated / 
expanded at the parsing stage, but the actual QA is performed at the 
rootfs postprocessing, because the overlayfs class works on a recipe 
basis, so to check if everything is provided the whole file system is 
needed.

Slava

On 15.01.2026 14:41, Paul Barker wrote:
> On Wed, 2026-01-14 at 18:54 +0000, Vyacheslav Yurkov via
> lists.openembedded.org wrote:
>> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>
>> The supressing of QA check for mounts should happens twice, at parsing stage
>> and at rootfs postprocessing. If the mount point is configured to be skipped,
>> but it is still present in the configuration (machine or distro), then the
>> parsing would complain.
> Thanks for respinning these patches.
>
> I'm still unsure why the check is being performed twice. Are we checking
> for different errors at parse time and rootfs time?
>
> Also, can we convert this to fit in our existing QA framework so that it
> is controlled by the WARN_QA/ERROR_QA variables?
>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
>>   meta/lib/oe/overlayfs.py | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
>> index 5a5ea03d45..3805746d90 100644
>> --- a/meta/lib/oe/overlayfs.py
>> +++ b/meta/lib/oe/overlayfs.py
>> @@ -33,7 +33,8 @@ def unitFileList(d):
>>       # check that we have required mount points set first
>>       requiredMountPoints = d.getVarFlags('OVERLAYFS_WRITABLE_PATHS')
>>       for mountPoint in requiredMountPoints:
>> -        if mountPoint not in overlayMountPoints:
>> +        qaSkip = (d.getVarFlag("OVERLAYFS_QA_SKIP", mountPoint) or "").split()
>> +        if mountPoint not in overlayMountPoints and not "mount-configured" in qaSkip:
>>               bb.fatal("Missing required mount point for OVERLAYFS_MOUNT_POINT[%s] in your MACHINE configuration" % mountPoint)
>>   
>>       for mountPoint in overlayMountPoints:
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#229369): https://lists.openembedded.org/g/openembedded-core/message/229369
>> Mute This Topic: https://lists.openembedded.org/mt/117266570/1826184
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [paul@pbarker.dev]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


