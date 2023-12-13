Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EDDC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 08:58:51 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.31801.1702457927841219792
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 00:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=PmEtMtdS;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3363653e180so1008318f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 00:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702457926; x=1703062726; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uLz7bw0P9NXB4Qf0+tW19tA8ObeBhR+4bcTWwU21PAo=;
        b=PmEtMtdSD615A6k2jBLOyVWOV4echgbXI8pvENPF7cZ9N7806yRSC9PpwrIAlLZHC+
         pNntcgWp+p58SdfUMsEeRNhdqv4PbCzBGQEpdav868rCWsCKjDI5Uej9E6Qzc7Goa6Lf
         JHxHsKZC+6XVHUDYCD7VTXhlMH1cY8Jp6NKRA26l7WY7ZB7fKpkvYpqhwjEHhMAAIOBc
         OafnThE3mLYjGwFWWYaJu3vmKOILau6iOv3FEWX0DSv0mmk35/aiTwWYCiuj0C6DvGdX
         fMKf6Mib7u0LicZj4GnSGnePuTYdGksZOGkhTG04mja0oT/USimAWkS3jz9DC+3H9a97
         jl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702457926; x=1703062726;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLz7bw0P9NXB4Qf0+tW19tA8ObeBhR+4bcTWwU21PAo=;
        b=RCWLXKmRnZU3vCcbO3sea/1FFQzswOU4ajrmJM8RmoxPVl0i5Ae0xrW9fW4qoqj2Pg
         N7e3gNtKjA1ADW+44c+BVbTZxBWD/ct8dbta9cjbJhkcTilMdaDnUzZW5trFQeDsvU3F
         67eV5N+GhfsRnOGQStFbcY4VqbhynhXjJVsF4VZYtTxCX0gygFJCjd7D5t0SOtWaQxgJ
         PfpOX+t2ZwievXrX7UYMH77crythl78QNchBZFw20U09CYMQisRAM+8ZXrcuSnhxwucp
         N+NcV83DbdYDzAaZe2fSxfT3pEY38xUxmBKmcmDbSuy+aEPmIdGRxwAGzK1vGfdN+RAA
         pu7Q==
X-Gm-Message-State: AOJu0YzxPpWgMtJzc12FgOANVp8VtAJVeo1XYOuB8Ho3p7d5mvGahbsu
	1Qe1IDilKTJM6wn/al1n1ua2Yw==
X-Google-Smtp-Source: AGHT+IEps87/5rpZYY931e8tpvYOP8LWwdJpaVgaEGgOWJ3SJaYb+lUX2mTOM2ZUzEeaxiNaqDkzYw==
X-Received: by 2002:a5d:4887:0:b0:333:2fd2:2f0a with SMTP id g7-20020a5d4887000000b003332fd22f0amr3430275wrq.131.1702457926162;
        Wed, 13 Dec 2023 00:58:46 -0800 (PST)
Received: from [10.1.8.246] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d4cc1000000b0033350f5f94dsm12664342wrt.101.2023.12.13.00.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 00:58:45 -0800 (PST)
Message-ID: <760d4ace-ff3e-4a1e-9c97-6d2aa23d779c@smile.fr>
Date: Wed, 13 Dec 2023 09:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] strace: Disable bluetooth support by default
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Tim Orling
 <ticotimo@gmail.com>, Ross Burton <ross.burton@arm.com>
References: <20231213074323.2547894-1-yoann.congal@smile.fr>
 <CA+chaQftbh0-27atHbh9sVbcO5ZZOivH_nYhtGFqfPui3cb34A@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CA+chaQftbh0-27atHbh9sVbcO5ZZOivH_nYhtGFqfPui3cb34A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 08:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192275

Le 13/12/2023 à 09:35, Martin Jansa a écrit :
> There is missing leading space in suggested:
> PACKAGECONFIG:append:pn-strace = "bluez"

V3 sent. Thanks! 

> On Wed, Dec 13, 2023 at 8:43 AM Yoann Congal <yoann.congal@smile.fr <mailto:yoann.congal@smile.fr>> wrote:
> 
>     The bluetooth support adds a bluez5 dependency (and,recursively, a lot
>     of other stuff). Disable it by default to avoid having to build all of
>     this when it is not needed.
> 
>     This decrease the number of tasks run for a core-image-minimal build by
>     ~1000 (-21%).
> 
>     To re-enable bluetooth support in strace, add "bluez" to strace
>     PACKAGECONFIG. For example, in local.conf:
>       PACKAGECONFIG:append:pn-strace = "bluez"
> 
>     Fixes [YOCTO #15323]
> 
>     Signed-off-by: Yoann Congal <yoann.congal@smile.fr <mailto:yoann.congal@smile.fr>>
>     Suggested-by: Ross Burton <ross.burton@arm.com <mailto:ross.burton@arm.com>>
>     ---
>     v1->v2:
>     * Fixed local.conf example (thanks Tim)
>     * Added Suggested-by: Ross (thanks Ross)
>     * Removed an extra empty line
>     ---
>      meta/recipes-devtools/strace/strace_6.6.bb <http://strace_6.6.bb> | 4 ----
>      1 file changed, 4 deletions(-)
> 
>     diff --git a/meta/recipes-devtools/strace/strace_6.6.bb <http://strace_6.6.bb> b/meta/recipes-devtools/strace/strace_6.6.bb <http://strace_6.6.bb>
>     index a3de7941cf..eeffe477b3 100644
>     --- a/meta/recipes-devtools/strace/strace_6.6.bb <http://strace_6.6.bb>
>     +++ b/meta/recipes-devtools/strace/strace_6.6.bb <http://strace_6.6.bb>
>     @@ -22,10 +22,6 @@ inherit autotools ptest
>      # Not yet ported to rv32
>      COMPATIBLE_HOST:riscv32 = "null"
> 
>     -PACKAGECONFIG:class-target ??= "\
>     -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
>     -"
>     -
>      PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,bluez5"
>      PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
> 
>     -- 
>     2.30.2
> 
> 
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#192269): https://lists.openembedded.org/g/openembedded-core/message/192269 <https://lists.openembedded.org/g/openembedded-core/message/192269>
>     Mute This Topic: https://lists.openembedded.org/mt/103145986/3617156 <https://lists.openembedded.org/mt/103145986/3617156>
>     Group Owner: openembedded-core+owner@lists.openembedded.org <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub <https://lists.openembedded.org/g/openembedded-core/unsub> [martin.jansa@gmail.com <mailto:martin.jansa@gmail.com>]
>     -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

