Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D40CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 17:18:55 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1991.1762795125610935550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 09:18:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K9Xo9YYB;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso21842575e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 09:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762795123; x=1763399923; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ciFWAyF8q7EUg/dKaTlE7d3Zflu3sfvW0PwkHItqt0=;
        b=K9Xo9YYBOIoAmCZzVfon/d7aVxjzm8IJoWQVuMrQSGq8E9AVk0Y6Dua2E+Jjns8Lyu
         3oJzQqd1wB8qY2hWh6grcrY861V4zvh+iW90MJjgVJp97C58jMyQ8q7weKM6rgATb8/t
         3TQHZBSepA/AqLseSWg/ktcYJUasaAT5LdRCYhjfn7wItqjh9knBHH38ZxqhTAXBi8pc
         f66F6Lyl0RYPKyFnTpAlsqubJ0Xw5UTFzxCbJqXH3w64GhInr9ihqQN4gSGXwJeR/U6Q
         5soUOZIwmmF4WzDfftH/OwNwzn+VFwi7i8/PFG3GGVCOuPv9jI/PCsxRjevBDTBZoI/P
         XGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762795123; x=1763399923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ciFWAyF8q7EUg/dKaTlE7d3Zflu3sfvW0PwkHItqt0=;
        b=rLDO6/wgdiKJapyCOkbMOWYnWdUuhEOcWt5XVr6jzCax+mH640aTIsIlOkwFF5TTBq
         UZRSl9uS1JUFVeNEoiRhZ4AIUPVOP+ZxSoi1TKEf8YdUFy97j0lwjv4cU6IRaB45OVPF
         eE8NrtgaR7iXDYHehiY1fVvFBkXbWsImKPOTlbbK871bewD7++CojnUdRy27GpF4TTtO
         Kccu/HsRfe807Mnh/FBwVk8ZTxrFM0NJ9juhNNtSPJpdB9IU8tpV1QNBmLSHXYGUfJG8
         WWp/CjDHjonqHH5th/DHOLQ7ULtRy9+q8C77bQrp96zAyQKTizHYp0FEY9JRerGXIduv
         MAqA==
X-Gm-Message-State: AOJu0Yw9H2mZd9XzOWo9pH5DnTWq/6tYISnYgyeb3dwZzlp82/Pd6mfs
	Fe1MuJ9f7bhb2S3hh1siBMDt4zM6l+i7qZzY4MuokCx/9zdwtXgw2uv/8QfQzA==
X-Gm-Gg: ASbGnct9hY3CdD6BrtYJNnABn67XfI3MpKX08nqGQ2qm77hATjU/NR32Pw4mgwd3tBn
	AoGL5w4tL+G80u9i39uqMNQEqcY9dY2r1Pe6CIJ10lX4g9dx3PV71spGCy4Rz1U9GvfSdJuxhBE
	0Pkyycpa5vjV5KuwvXwEthigAjXydFFU76W45gWPGgeIBoZrlhct/NToHaMinjR3taf094xaAxN
	8m8KFKpBsrjHVQvO3YHolS2IyowXCX/uQPkOHXsuZLne5dwfT1duTq9IQovjCXv72u6Olo9x627
	K9TmcIVGaIufiLS38sQDwVlC7Tdx9vSlDzphpP07KIClcJYSXE/jUuTQIRxGupr+qtSz5KKYsBQ
	62XWJIG3RvSCUg/PRt+I7YJsctqWenKdQRrJENF7sKTgZCCsr19KwJBqGBWJIUaLXZVl4/f52Ya
	/Le+S5Jv4=
X-Google-Smtp-Source: AGHT+IGHMoKrA1aU33aQzv8R4V9TtIqk5HnzdHwSYPlijYcLVJClNgTdyjBOkm2wqb0r06kg4c4B3A==
X-Received: by 2002:a05:600c:4f42:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-4777c7ddab0mr54550515e9.32.1762795123008;
        Mon, 10 Nov 2025 09:18:43 -0800 (PST)
Received: from localhost ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdc33bdsm328532055e9.1.2025.11.10.09.18.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 09:18:42 -0800 (PST)
Message-ID: <6df562d0-8ce8-481a-a913-11bae6e0abaf@gmail.com>
Date: Mon, 10 Nov 2025 17:18:41 +0000
MIME-Version: 1.0
Subject: Re: [OE-core] Thoughts on SPDX for files from meta-layer
To: openembedded-core@lists.openembedded.org
References: <b2e867d19c02966f3e11d2c7e6b7765564587df5.camel@emlix.com>
Content-Language: en-US
From: Fabio Berton <fbberton@gmail.com>
In-Reply-To: <b2e867d19c02966f3e11d2c7e6b7765564587df5.camel@emlix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 17:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226132

Hi Daniel,

I'm working on something similar and have shared what I have so far, https://lists.openembedded.org/g/openembedded-core/topic/rfc_patch_0_1_spdx_add/116223136.

Could you please take a look?

Best regards,
Fabio

On 11/5/25 14:54, Daniel Wagenknecht via lists.openembedded.org wrote:
> Hello,
> 
> I've looked through the generated SPDX files for a project recently.
> I' m specifically interested in the downloadLocation property that is
> set for entries in SRC_URI in recipe scope SPDX files, as our list of
> upstream sources we need to monitor for security information is based
> off those values.
> 
> We'd like to extend the generated SPDX to also cover files from meta-
> layers, that are provided via file:// entries in SRC_URI. The files
> provided via this mechanism are mostly configuration files, systemd
> services, initscripts and the likes, so one could argue that they
> are not relevant dependencies and thus do not need to be traced in
> SPDX, but we'd prefer to properly trace them in the SPDX documents.
> 
> Are there any thoughts on this, prior discussion that I've not found in
> the mailinglist archive or external resources on how such files should
> be treated in SPDX in general?
> 
> I'm considering implementing this as outlined:
> - for file:// entries in SRC_URI determine which layer provides the
> file (via bb.fetch2.local.localpath())
> - check if the layer is modified via oe.buildcfg.is_layer_modified()
>   -> modified -> abort
> - retrieve the layers URL. This is more involved since what
> oe.buildcfg.get_metadata_git_remotes() returns might not be the URL
> that should be specified in the downloadLocation
> My approach would be to introduce a per-layer variable that specifies
> it's public URL.
>   -> no public URL for the layer found -> abort
> - create a SPDXRef-Download-recipename-X entry for the file with the
> downloadLocation set to the layers url with commit and subpath of the
> file in the repository specified
> 
> If the layer is modified or a public URL for that layer is not
> specified the downloadLocation would yield a NOASSERTION value.
> 
> I'd be glad to get some feedback on those ideas!
> 
> Sincerely
> Daniel Wagenknecht
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225774): https://lists.openembedded.org/g/openembedded-core/message/225774
> Mute This Topic: https://lists.openembedded.org/mt/116135395/6083838
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [fbberton@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


