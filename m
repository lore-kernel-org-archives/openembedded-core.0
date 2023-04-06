Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7642C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 11:12:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.155665.1680779525501016444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 04:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=VoC0tpwi;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id m8so11490646wmq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680779524;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i14vB10ePm4uRl58C8FTsEzCNOtYwdeCLPgzdzd3Fcg=;
        b=VoC0tpwi789BYdgJo0W+7PuVbUN/cC/oPuEkb0GVUYvspbIP0gKrD/fbvpka2HMGHN
         67sFBFDEQUQrqb+mDA2qaLg1DcKTSchIbxAjrknOc8ZohbQ8o/UhgOoTJ4qfWTSWG+B1
         NEtWqQ6zMyV2nM3aqtc3NSLtK8Lsf1HaKYj7R/PBFaEp7xwa+QoPBvsdIU0MeR9AzXle
         09py5s4d0psWkCAHHpmtfxdyTBzSJObct0z2loHHAhAlfvj35fS7s+qid982LCtgEVze
         tSxagi3VsNOME+Ob5gMCARxTO0YidAozRzY0cV7A6tuw0GtcSpBiUU4CBOcnS1hvEkax
         MlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680779524;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i14vB10ePm4uRl58C8FTsEzCNOtYwdeCLPgzdzd3Fcg=;
        b=xW9hUItKg343pt+iqMec3Pjmh1IPG3dVwidC1oygq1pVYoh6lp4QS+t7fqzHy/rZV1
         IbWSQsEkeycJQCoGH0OWt3NZtC6RROOlxeMATnt19vs+Y9m6fdT7vH24teYaNuH8iS2J
         JIRgoxlpXg3bVMsh2QqHXFVUJT5qMN11ENb7QqZBOqKE2u/Im8m7TT2zylpRX6XppRsU
         Mj7WYOSJfCJK/QycQbZDw9H1mG2HRA3isjnKQI2texyyFLfECJ/GW6EJAN+Zx72n7sV/
         CGJOVdYPJz00QRy3U1QIjReOCuUni0PJXYZIlXNzdx93qlouGKIwCenPLhzfBEnEfCrY
         nmDg==
X-Gm-Message-State: AAQBX9dc25ow2lpxDXdHqvBCqOkVumjLWAfNwgshHJ23zqxXiIaqqGVo
	Hj0xuBQcygVkm+p0hIxGk7Jv/g==
X-Google-Smtp-Source: AKy350ahhum1K5H+uyOfJ+c27QUzHjY1RFa1W3YN3A2ZBkUXUaGWubZejv5XeDXhXrvHE/8NZMHn3A==
X-Received: by 2002:a7b:c40e:0:b0:3ee:1239:1ba7 with SMTP id k14-20020a7bc40e000000b003ee12391ba7mr7031830wmi.27.1680779523653;
        Thu, 06 Apr 2023 04:12:03 -0700 (PDT)
Received: from [192.168.0.27] (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c4fcb00b003ebff290a52sm4920429wmq.28.2023.04.06.04.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 04:12:03 -0700 (PDT)
Message-ID: <764c1ff2-4771-377d-2fa9-ddd3af028e89@smile.fr>
Date: Thu, 6 Apr 2023 13:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: Exclude some issues
 not present in linux-yocto
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Geoffrey GIRY <geoffrey.giry@smile.fr>
References: <20230404164400.403462-1-richard.purdie@linuxfoundation.org>
 <9cb0aae1-c1be-ab0d-2263-1ab2f928c885@smile.fr>
 <eaa125c5ba2c1a13837c65df4a961abab5f5373b.camel@linuxfoundation.org>
 <9eab4d61-3939-0703-1d81-e998f8957e99@smile.fr>
 <432346f305541dc9e25b0e7fe34de1fd12aab978.camel@linuxfoundation.org>
 <b481324c-62ee-8d82-3147-1c677020ae00@smile.fr>
 <810a3c1fcf90c6a3a7af827d10079536a1420d55.camel@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <810a3c1fcf90c6a3a7af827d10079536a1420d55.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 11:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179769

On 4/6/23 10:36, Richard Purdie wrote:
> On Thu, 2023-04-06 at 10:23 +0200, Yoann Congal wrote:
>>
>> For CVE-2022-38457 and CVE-2022-40133 
> 
> This one appears to be fixed for 6.1 only with this change:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=a309c7194e8a2f8bd4539b9449917913f6c2cd50
> 
> coming into 6.1 stable here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.1.y&id=7ac9578e45b20e3f3c0c8eb71f5417a499a7226a
> 
> 
> The fix seems to cover both CVEs.
> 
>> I can't track the commit properly.
>> Yes, linuxkernelcves.com gives commits for these CVEs but is this safe enough to ignore? 
>> Until now, we have only ignored CVE from commits present in the NVD database.
> 
> I think if we have good reason to believe these commits address the
> CVE, we can document that. There does seem to be a strong connection
> here but I've not gone into the details.

Ok, I'm now convinced the commit fixes these CVEs.
I'll send a patch to ignore these.

>> CVE-2023-23005 is disputed (as you noted), I'll look into it but at a
>> quick glance, the dispute has good arguments and we might ignore this
>> one safely.
> 
> Agreed. If there are strong arguments from the maintainers, this does
> give us a good case for ignoring it as long as we document it as such.

Same, I'll send a patch to ignore this one also.


>> We are vulnerable to CVE-2023-28866 : It was introduced in 5.17 (bce56405201111807cc8e4f47c6de3e10b17c1ac from Fixes: tag).
>> On the 6.1 branch, this is fixed in 6.1.22 and we are at 6.1.20.
> 
> Hopefully we'll update soon then! :)
> 
> Thanks for the help with these. It does make a difference and is much
> appreciated. You can see the downtick in master here:
> 
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/
> 
> :)

Happy to see this :)

> This should then mean we'll soon get a list of "real" issues instead of
> noise.

I really hope we'll get to that point!

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

