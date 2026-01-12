Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CC1CF45C5
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 18:58:45 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39489.1768240901154308495
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 10:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elder-tomes-com.20230601.gappssmtp.com header.s=20230601 header.b=gRUs/rga;
 spf=pass (domain: elder-tomes.com, ip: 209.85.210.195, mailfrom: levi.shafter@elder-tomes.com)
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-81df6a302b1so2888879b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 10:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=elder-tomes-com.20230601.gappssmtp.com; s=20230601; t=1768240900; x=1768845700; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EfVpCsCzIJkls5nPFASGmKFxLopEFLO9PmLuOOUPg8=;
        b=gRUs/rgaiXDLaLZB/IB1oTp4czrhDV2FDtkdcpFCa8JB02027B6DktGFEV4v8coVpb
         SNkeaCn1PRwNQbR6Lrd9uWugyYlPh82//kuNp2iELqFP6xq6R2ImOTF+jtmgVm3CC6UZ
         cOfZFQbU17fdNGOJ4SC5aKEacsspvlL6mc4Azzvos3OnpspvMtECOyJlJ5tpRSK0Rw6c
         mfGOiUItP2mcWY6tFTAuEV1XJHNtfg7NMd+DtJmH5if0SbqcdqfKWSiFAlVZ3xIAlOXq
         F4UGP8p3E2B7XKlcNr0VjfNg8HX3XtPQbsP358T3B5Qf8+yBgEJ7H2m9D42PjZoKPBxc
         vDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768240900; x=1768845700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EfVpCsCzIJkls5nPFASGmKFxLopEFLO9PmLuOOUPg8=;
        b=qCC05rIRFgJ7K6lSNrIUm0zInqtqMjoHeNgul9alqvupsNsOwaTMfuws8c2/4tHglh
         cVsE40yfxeHAUgsToX+aSUSsj4GWEYqDkOEAn//kTfuBgXeFwcQBjRqkA45J7utlAEaE
         ORLYGJp7eBlaPhgnPpEHJrT37CZX24I02e3ie9JR/fy0ZAf3gtNl2IQtNeDX7uL+UGxZ
         T9WcmQ+EiUvov+3JoyoM2g0AkaGNDm8454BH1vgCNGOiKQkKoVjL0tBCx00x+itc/nWV
         reO7xPgcPgFy6a7AtyHfs8+q7z1OorC9SGimHVja9N6n0umdBO/PlG1/Bq/OoBTEFriK
         vGlg==
X-Gm-Message-State: AOJu0YwyOuDQemX70L7A2CexGPl+dSisrWjDltpGXV6xRE7Swun7UWY2
	J0S+GartXIaawPtGNSHTolpR9GbhSVI0+z6YRD3Nnmbu4UNqaUgdXsqDJjs2d6GDp40lXiWhUlP
	x7PKsFS8=
X-Gm-Gg: AY/fxX7J1IChK0LfnkblBmLPkg3Lr/IMjhnDifa1cqomWeVi7H+4eHQgWWI9NowldXH
	1FheaNPxLeKsJnje+nK9lsUEBCrsxuDYf5EXhEww+MuJlbzITTp/+Fl8rsQ0WhvVrM1tFwGUGoM
	f/YdTneDQzQ/1vErfXJ3VIZ4YpBLwewWOr88orxquG2CF2Rb8Oc/c0OX+Azl4gmI8qLvhX3tUxO
	mVwIS/We9qPyusHIdeI7KQvT2HGQd8qRduy8U9ERHYt8IDSsiumpaBk4WBYP5pPjuilcsuaWssW
	/1JCRSoPGRP/ZCVK2GdoeV4gbdpC7agrHWsULRfGuPX9xWxKD3j6SmOF7YfsMw2vgfxxqX42Cvv
	fpMFRZ4+ux3ijHRvINCDNTgtDjnJh7mrSx2ZS0qyv5gp/rpPlUF643gH4TbfVpJ66H4SAz3H1QF
	ObJ7gs/zYao6YgGGfTd/uB6L7+6l5LwAMInzz2w5c76adEVoVPMDtvqw8ER7rd7/QHfnEtPWY=
X-Google-Smtp-Source: AGHT+IFmHLUu3E05NI6rMCbdKxmqxglH4q1IRcG2lyYUQHresvx+ejXFYadb+ptbCHbjw3BZ5OenkA==
X-Received: by 2002:a05:6830:3c1:b0:7c7:6217:5c66 with SMTP id 46e09a7af769-7ce50a282f7mr10385056a34.19.1768240581736;
        Mon, 12 Jan 2026 09:56:21 -0800 (PST)
Received: from [192.168.1.9] (c-73-169-9-114.hsd1.co.comcast.net. [73.169.9.114])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478029a6sm13600428a34.3.2026.01.12.09.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 09:56:20 -0800 (PST)
Message-ID: <832cd652-6b7b-46c1-943b-883414013e29@elder-tomes.com>
Date: Mon, 12 Jan 2026 10:56:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] image_types.bbclass: make fsck optional
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <585429b3-5763-4c61-97ae-2c73266c887d@elder-tomes.com>
 <C7184CF3-DBB2-4AE3-AACF-875B74E60632@arm.com>
From: Levi Shafter <levi.shafter@elder-tomes.com>
In-Reply-To: <C7184CF3-DBB2-4AE3-AACF-875B74E60632@arm.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 18:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229219

Hi Ross,

I really appreciate the feedback! I agree that passing timestamp
information is the proper solution here. I'll create a new patch that
does this.

Be well,
- Levi

On 1/9/26 10:03, Ross Burton wrote:
> On 31 Dec 2025, at 22:52, Levi Shafter via lists.openembedded.org <levi.shafter=elder-tomes.com@lists.openembedded.org> wrote:
>>
>> The fsck in oe_mkext234fs() was added to prevent an extra reboot on the
>> target:
>>
>> https://git.openembedded.org/openembedded-core/commit/?id=a93d0059341
>>
>> This has the side effect of increasing delta between images which
>> prevents reproducibility. In many cases, the added security provided by
>> image reproducibility is worth the extra reboot upon first booting the
>> target. The use of fsck should be included by default, but left
>> configurable.
>>
>> [YOCTO #16110]
> 
> There’s slightly more information in the bug report than here, which links to a video from YPS 2024.12 talking about how fsck will modify timestamps in file systems, so whilst the initial ext4 from mkfs is reproducible, we do a fsck to clear flags and they’re no longer bit-identical.  Is this the only source of non-determinism that you’re observing?
> 
> I don’t think adding an option is the right thing here as you’re swapping one problem (non-reproducible ext4) with another (filesystem dirty, needs a reboot).  As the video shows, we should be passing timestamp information at construction time to avoid this problem. Would you be able to work on a patch to do that instead?
> 
> Thanks,
> Ross


