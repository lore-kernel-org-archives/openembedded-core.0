Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59434CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 17:25:59 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.14649.1759425953920699537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Oct 2025 10:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IA9sCZEx;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so2570406a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 10:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759425952; x=1760030752; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dhDxgJ6vBPHIL6eSjYafaCh4w086WMyINjLhHw8SeuI=;
        b=IA9sCZExVvnxiVxe434lSrJn6qn7epnxVmZv1bqY1/6E+cX51d9BRW93uY0s4y1PWg
         Ht1aVivsAifsGboBk5TzsnK2UODRV20k+SvmHhiJr717GrHy32fT3/J0EPC2iJFwolx2
         ed1k1aYlu24GF6KohMioGC7+kra/kLlSbf5OI1GjENPbjnmQ5J6qC9mba5AIHnlQm2fw
         xBRyhnHPWVLL48zl8lMYTasLXxYqXz4KerjHHhSg8c7MtjEdLIQSXnkAPbkifG+Qkqyb
         xdTKuY+lcIE724dDiRGVJouqudnNbiCCZMmqbaWa4VFBJXdD6b0+2ZGh51c+Bh76XtT3
         IRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759425952; x=1760030752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhDxgJ6vBPHIL6eSjYafaCh4w086WMyINjLhHw8SeuI=;
        b=diPUU06JC/E4U3gTlp9NOWx8/NRgm1c81yE6fG2aqJz1639aIltfhpskqQmt3JsEYE
         Fra4uBPEUOGJJf05qiEALxly0Phq6Zu6fCCup69cpHFrJLSk6Nwsmxmq7jg3suo3oCBK
         FQumLv0EmOYSluekv3ZWXFn/v6e+k/szt7IIR/z+nwv7IVXz5DdHa0wdPzUGSAQWBJLy
         S7mbHCpWftDAJAi25RZk0qAuQW+qgwZy2QfURzRbHAfCbSVT+QQ5KtrKu2jeML39RtNm
         G+Nocf1gsXOnm2qbMewfmyQiD4AK5zJJGgeNsV9acov8UgZGMZdarvPeui0nbwnmeNBX
         HeVg==
X-Forwarded-Encrypted: i=1; AJvYcCWUg/dgjJm9TJMy4TLq/j8lM7rK5I6UsqRJ+n7974gCxSg+F8HRlaXvx+1Y+RdL8JEji6SvwctvlBUvA7MZPcbC/w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzlvcBRfyhhLN1QNc7/lRG3NJQO5VPuzee32tabeyT+LmTd2zoz
	W4fhfC57aCQg7NpND8m1PxU1XKtrH0NQHNDVc8GEwE+u2HCTEPFsBkmS
X-Gm-Gg: ASbGnct93xHXjPK03Er7MeUglzqbYvghsf+UqQ3semm60ao/tq6ymUhMIX4IM3IAWWY
	lIpoBhin0iJobNe27nFyseiPVfsm1S4/FqZwraNELjdNTOVYnC64DOIvJ4dapyu+PtyiqTt4cNa
	sf6IWHQuaQl2Nw0GbkSthadhfn8BaB22r6HEkgfoQDmoHz7EcC0Y7lZyRVMtWXBxKdNmFh/n/7/
	9xiP6ko75hiIDZWR+wlLC+uii1dydx7fhbd+nE52ElRml5a0QkAipdjK64X2dTadcLqbG+Ealum
	41iWJASpZTLKnt+Nj1yll7o6voM0sxnQSJUfI2agpKQAi/3GZyxMIQJasbw/xWC9rc/7iFGielD
	cXTRj6DviSNq66K8OaVbhrFQKN5gQa3xTQ1NG1GpTtA11FoiXRcTygi14dW8N5WAJDg==
X-Google-Smtp-Source: AGHT+IGIJCoMC/cYKqh2ATJomgloIRde0e2+KbwnHxoqvIsGW4VheI16QV7VBFkP7aJPY9gNCfDrTA==
X-Received: by 2002:a05:6402:1e95:b0:638:3f72:125a with SMTP id 4fb4d7f45d1cf-6383f72157dmr1167417a12.14.1759425951985;
        Thu, 02 Oct 2025 10:25:51 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6375eb397fbsm2194174a12.0.2025.10.02.10.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 10:25:51 -0700 (PDT)
Message-ID: <10ca15f7-f5b7-41a5-bdcf-f678e91aec37@gmail.com>
Date: Thu, 2 Oct 2025 19:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta/lib/oe/recipeutils.py: Handle multi-repo
 recipes for upgrade check
To: u.kleine-koenig@baylibre.com, openembedded-core@lists.openembedded.org
References: <20250923154701.1506704-2-u.kleine-koenig@baylibre.com>
 <ibynx6jvvawtrkybl66at6dqikjuexuuis5ymq5r4cylv6sxzy@zcnbtottsekq>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <ibynx6jvvawtrkybl66at6dqikjuexuuis5ymq5r4cylv6sxzy@zcnbtottsekq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Oct 2025 17:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224376

On 10/2/25 11:48, Uwe Kleine-König via lists.openembedded.org wrote:
> Hello,
>
> On Tue, Sep 23, 2025 at 05:47:02PM +0200, Uwe Kleine-König wrote:
>> For a recipe that uses more than one git repo there isn't a single
>> SRCREV variable. For example for linux-yocto there is SRCREV_machine and
>> SRCREV_meta and rd.getVar("SRCREV") yields "INVALID".
>>
>> Luckily bb.fetch2 already handles all the details and exposes the
>> currently used revision in ud. So just use that.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>> ---
>> Hello,
>>
>> note this is my first OpenEmbedded-Core patch, so please apply some
>> extra caution before applying this patch.
>>
>> Note that for testing with linux-yocto I also set
>>
>> 	UPSTREAM_CHECK_COMMITS = "1"
>>
>> for that recipe. (I'm not sure this is completely right to do in
>> general, but that's a separate discussion. Without it `devtool
>> check-upgrade-status linux-yocto` suggested to go to 6.16.y instead of
>> 6.12.$latest.)
> This patch was applied to oe-core/master as
> ddf00d6aee955878c070327ee8d751fdb6099444 (and cherry-picked to poky as
> 441313eecbd45cfcbf0368e4d1d54bd2e9e59c6b). Would you consider that a fix
> enough to backport it to walnascar and scarthgap, too?

It is most likely too late for Walnascar - there is only one more
release planned, and it is already in QA phase.
Scarthgap is however very much alive - you can rebase your patch on top
of the latest Scarthgap branch, and send it with the appropriate subject[1]

[1]:
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#submitting-changes-to-stable-release-branches

> For walnascar it can be cleanly cherry picked. For scarthgap I
> additionally need:
>
> -            revision = ud.method.latest_revision(ud, rd, 'default')
> +            revision = ud.method.latest_revision(ud, rd, ud.names[0])
>
> I don't understand that completely yet, bisecting points at
> 6dea2e6332835bd7b646a520e28ce840f0d98f24.
>
> Best regards
> Uwe
>

