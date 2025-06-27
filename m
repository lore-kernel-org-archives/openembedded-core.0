Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6615EC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 14:51:48 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.15747.1751035898253126326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 07:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=UQVpgP/7;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ff16e97d1eso14892106d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751035897; x=1751640697; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kf0afUym1zUAkUQIBg3RmY4XwSINnypNmxtnmfBUDJw=;
        b=UQVpgP/7Fs6lPHQwjFByCuFbZtstNjKzmtrmHrhh5HSrlQi5lUP/BQUjOFRF28Ny91
         aa9i4ejvo9McFmFxMzBae6ZM88Ry1IBnatXzpnz0gyfnIjsYoxYYTMXmG7nCypi3Jk5A
         /ueUs1Ca4gQjhQFW1XNdN+YReIHmxUBrP6y0o8JjRQb9vkyzKl3v7Cff89lshRd6dPE5
         Ajm+o2x1LDL3J0EuMoPPPoXXDVGFMjQdo3E4cJCpunpETNjZnEIvlJBVhTKomVLoVAWR
         8Wgqmr31o+QbLmp5AvSZFn7Uvq2u8V9CxOkO4SjIXQ1kMMDiSunsjS1309E0Clid1fbf
         SZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035897; x=1751640697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kf0afUym1zUAkUQIBg3RmY4XwSINnypNmxtnmfBUDJw=;
        b=OUV3KWTals/zFGhp+M0X0iDZcj8zeQcwW3mfx6IQiHQsZRZobe5TApJJ5bxoYJ/1Dg
         oQg5+PUDOBBgiPqP2IVPURKNiqYTtQrazmX76umFRiyxPH14C5lzZ4kP4vwifgpge/lu
         jOuGxv1ekEc7Y80I5Eze5nvuLiOs2Y/+U4qJFn+1Jw57Oi3MTT+webKT3YX8q/tMplbr
         HBLMn/R1l0/4nhxDOD+xR0aT720Kfb1WtDxzMsQtu9VBgtNmDoJkGxbRUxBt+WFUBgNc
         uj3HkdV+eul+uen6ye6hXMouj2mR22rsELx5Ogso1IvNMSncAUvCMLPS5DiNQtAnuaYl
         aJbg==
X-Gm-Message-State: AOJu0YyxMEHOMjK2si2cJvPY0r9urNpR73JB6Jxi7zdhE3B1tolrxZ+J
	XahGTviSSyeSz/OfqWKzrxEZue55lFUZ408SWFI52V4qIKEWWQoHDJdWf3EFHhFCcP0=
X-Gm-Gg: ASbGnctxv4r+uaE1cyP3F/TrX4qd5bnpHLYWO/PnNBsXTRvpIQ1mnW6igVbyz1EVuwA
	N1es5SVTGABOsQYfiFCdz1UipbTvUacNob2LNTDnxG+f7YbLY2Z2YCH2jfraKH3eoHhkQYjhTrR
	GQrhvP6vSVA0FZHfIJa7a8TVCIApp6aFtdsLNH8aqHGbyeSxnLWW5OxO4a5cOngP4Xnt0QsimGs
	UU66543upt84FxhYma/tJff5xrUhKusJvkMb7qHYMB6i0QM1pm5058qFLBMlugsW+KgGviQKSyC
	po8v5LD5i/BXZEYLOZNkQ0X0QhpE5vHBlEHWWa/DO1PogemdGlnOTkxKS0Unw3WrNbq7TAFzu2b
	8xefJ7mDh/7JnzyaD1aHEkXxzvV5qhA==
X-Google-Smtp-Source: AGHT+IG89DKEJJKcvj6GTReZJtRgrCzuLzqWPE8MfP7iHbQ21BRw7HHInSvWokJUFIX8AG4Qi8kHJg==
X-Received: by 2002:a05:6214:5d10:b0:6fa:fc4b:8ea7 with SMTP id 6a1803df08f44-6fd753ffa9bmr119627566d6.21.1751035896727;
        Fri, 27 Jun 2025 07:51:36 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac6csm21476276d6.103.2025.06.27.07.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:51:36 -0700 (PDT)
Message-ID: <d2f10487-0906-402d-8e8f-aaeb5ddbe280@baylibre.com>
Date: Fri, 27 Jun 2025 10:51:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] should local.conf.sample include qemuriscv* machine
 conf files?
To: rpjday@crashcourse.ca, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <2857400a-49a9-3050-a092-bd38969b6eb4@crashcourse.ca>
 <CANNYZj9ABvvEZDAHwPCTpwyv+GomWhasey-2TB7t_pgGeeOziA@mail.gmail.com>
 <d19508dc-c0d4-166f-62db-50a716881f2c@crashcourse.ca>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <d19508dc-c0d4-166f-62db-50a716881f2c@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 14:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219424


On 2025-06-27 10:49, Robert P. J. Day via lists.openembedded.org wrote:
> On Fri, 27 Jun 2025, Alexander Kanavin wrote:
>
>> On Fri, 27 Jun 2025 at 15:31, Robert P. J. Day via
>> lists.openembedded.org <rpjday=crashcourse.ca@lists.openembedded.org>
>> wrote:
>>>    i forget if i've asked this before, but should OE's
>>> local.conf.sample be extended to include all of the machines defined
>>> by the OE-core layer? particularly the two qemuriscv*.conf entries?
>> TBH what we should move towards is an empty local.conf.sample, as
>> things it does include are all over the place and at the same time
>> don't cover many important tweaks.
>>
>> But for now, yes it should have risc-v, and mips/ppc should be
>> dropped. Basically it should match what is getting tested on the
>> autobuilder, rather than what is available in oe-core.
>    if we want to keep it this simple, i can submit a patch. unless
> someone thinks there should be more cleanup and wants to handle it.
It would probably be simplest to submit a patch and let others provide 
feedback there.
>
> rday
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219423): https://lists.openembedded.org/g/openembedded-core/message/219423
> Mute This Topic: https://lists.openembedded.org/mt/113861385/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

