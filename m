Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E5AC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 14:39:00 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.38238.1699886330386533820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 06:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xOGun+2x;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-778a92c06d6so280190585a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 06:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699886329; x=1700491129; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/BIeuZuMKIRolkMqxrolV6ona00rt2FO8sU4PZoKSI=;
        b=xOGun+2xwgfijACwPty1xyJ72mIQ1r53EZCZY672x+v3hO+yjkj15WI/c1xEytDvxN
         ZYMu3QqmsJ8p+kkuzgeOdzgELa+Ulvo2EIgPPGWGlHGnf0YYVc/73Yfz0JTz78TDtXEk
         qium8EdPxmYx5yngWmSJ3k+PMCiaQnsupHFzm5RTP1YSrepVs17V4TZMDnq3YXRGoC9W
         eZ3CUpsjpBPweUzTPoyAXYVwqjL3AuaHUac0qwoIccXYDC5orAfUqiIUdeCF3yrwJzmX
         ksQA8UKxQL0oow1K2jYto1KDZ1/bSYIJ56tOQy74BXi33DYkowwM1BI04g86bbzPWPRz
         UkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699886329; x=1700491129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/BIeuZuMKIRolkMqxrolV6ona00rt2FO8sU4PZoKSI=;
        b=bXyjnvEjDGanP7zmBDXAMLWleknYg8nrkqCWa9NjFgywuKPRqkBy6ziB8TET40R9fC
         QMJUH7cp7bbF0ACzR27a/zJDNyS7Mhhyf/oAV1Yujg+XDIi4duBDzZAj4E0vhfbaou5s
         f0pJke7OxuuQUJqWqdfbOaA35ESkNiU3fD0zeCy3eJCWAnWmZJJjfNxnFrus04PlZcMF
         lw1WWjpBZcctdVoflZNjaeEx1ZGwj/Po0uPmkGrcS/ztM3/pDN+08iXjp3PDwvRgYGXZ
         y7c+gn3DKdq1EeBDwjNJiTf2k/btYduY0LntGnn96/UHkMIC5vApQjFZZCoTskk3iWBl
         06aw==
X-Gm-Message-State: AOJu0YxgDEDj8Xo6yMc+U/vANvsvCHpaKUuGfCsa5AQlZtXKXiDYKKle
	M/5f2EAlr2o6v5j39xSbjqW1FQ==
X-Google-Smtp-Source: AGHT+IG8/rppt7aErWy5U2j7UCxGs5N8unOuT5x6dCJLDI5qOaqaW2jMiZow3ojDN6v2fkOnHgub4w==
X-Received: by 2002:a05:620a:2ac4:b0:77b:c79b:4b44 with SMTP id bn4-20020a05620a2ac400b0077bc79b4b44mr6419029qkb.44.1699886328998;
        Mon, 13 Nov 2023 06:38:48 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id a14-20020a05620a066e00b007788dac6b24sm1927634qkh.41.2023.11.13.06.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 06:38:48 -0800 (PST)
Message-ID: <45622371-efb7-476c-8756-52d68e27d6e0@baylibre.com>
Date: Mon, 13 Nov 2023 09:38:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-core][mickledore][PATCH] grub: Fix for
 CVE-2023-4692 and CVE-2023-4693
Content-Language: en-US
To: Patchtest <patchtest@automation.yoctoproject.org>,
 Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <0101018bc385844a-d32fb9cc-7763-4fa2-8415-f9e65cfd111d-000000@us-west-2.amazonses.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <0101018bc385844a-d32fb9cc-7763-4fa2-8415-f9e65cfd111d-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 14:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190477


On 2023-11-12 07:33, Patchtest wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Tests failed for the patch, but the results log could not be processed due to excessive result line length.
> ---

Hi,

Patchtest failed the signed-off-by test in the CVE-2023-4693 patch 
because the "Signed-off-by" lines don't have the proper email format in 
them:

+Reported-by: Maxim Suhanov <dfirblog@...>
+Signed-off-by: Maxim Suhanov <dfirblog@...>
+Reviewed-by: Daniel Kiper <daniel.kiper@...>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@...>

Can you correct this and resubmit?

>
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190449): https://lists.openembedded.org/g/openembedded-core/message/190449
> Mute This Topic: https://lists.openembedded.org/mt/102541228/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

