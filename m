Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD15C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:34:40 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.31018.1702452873302186617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=AJh7WACr;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40c2bb872e2so61607305e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 23:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702452871; x=1703057671; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rNc7sFBVxePirD7oLpIrEZnIuJSqe4l+3OGcxgqSoXc=;
        b=AJh7WACr/gEI9xXjE7W6S1mwjfeKx0dUU6L09/3j9BUo15nLZxLrUToOBcg4HrUZdz
         LqGG6j9sJTdA1Ib1ZCG1z8FDItvBIjrWT/JHLmB3NDk0vA4dyKtu1QrelBGjg7BorBPL
         VVV7nOF1d4nahSTAgTXSgMtjijqfOHckIT2xqkGIfNGLTQn9ssZD7Klf1/F5WeJKyR6Y
         yd1z/zI+vekoPsHEk93tmEEHKdQx9Vyi90tJTY1YfT+0c1GU5m6rA4opLK+uMaaTAc72
         ggV5PySg99L36AsQ5Gcdke/lQCumCUwjz2XXfQ38N9O6rdc03heCxnQ3ZrtLGWz3GytR
         H65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702452871; x=1703057671;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNc7sFBVxePirD7oLpIrEZnIuJSqe4l+3OGcxgqSoXc=;
        b=WchAmJgZKZ62TjsBfu1WJsszvKWyw86Rx5F6GWAR89xE/EmEg1qll3+Wn/oBeZDft+
         ewj3SqZsvx7MsTj/DEh2TFhbr0aK3Y+/48YbThTc1kA+WlxQ9AS4UBZ+FDCGme2T4/0T
         5c6gVZ4UcSIOksfddCzBJlw8GgXmiu68WhIZ9/kZ3EvqB+QK+SZzobhZQIz5RUlz4D79
         9VgX4l11MOeBbBbcdtEGjWQ86T4MRnbVRPiRFAwVTHs56MwGpF1j7FfLMpNm/iLcUNRO
         DZqwFrpPMLlS17epacS8iTjJgTdFbZs/ZZAYk8TnaO4PjAr0IaqSs1SnENGj65HwVdKW
         0fwA==
X-Gm-Message-State: AOJu0Yyb9rKHniQB/yXiZn1tmBjDJTfi30Up+/VHck5nmSr85wvnFgns
	PwvrvGIzlwTv5h0QGehhCnhWhA==
X-Google-Smtp-Source: AGHT+IGX9r/tudEs2uio1IgythLu9V5NeVW22MhawXFxqG7zcbcVf5sK+HnOUkR0gWsMeueeWT1Tzg==
X-Received: by 2002:a05:600c:35c8:b0:40b:5f03:b3b4 with SMTP id r8-20020a05600c35c800b0040b5f03b3b4mr1904394wmq.214.1702452871339;
        Tue, 12 Dec 2023 23:34:31 -0800 (PST)
Received: from ?IPV6:2a02:8440:b217:4eae:e294:ede:ee4a:560a? ([2a02:8440:b217:4eae:e294:ede:ee4a:560a])
        by smtp.gmail.com with ESMTPSA id l39-20020a05600c1d2700b0040c2c5f5844sm19329485wms.21.2023.12.12.23.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 23:34:31 -0800 (PST)
Message-ID: <2067cfc3-3ab2-4496-ba25-f922bc119859@smile.fr>
Date: Wed, 13 Dec 2023 08:34:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] strace: Disable bluetooth support by default
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20231212233723.2543380-1-yoann.congal@smile.fr>
 <CANx9H-Bju7jVxihXMdKSzDB91iijtLbzY+X9NkP3m4LvxaSdYg@mail.gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CANx9H-Bju7jVxihXMdKSzDB91iijtLbzY+X9NkP3m4LvxaSdYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 07:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192268



Le 13/12/2023 à 04:45, Tim Orling a écrit :
> 
> 
> On Tue, Dec 12, 2023 at 3:37 PM Yoann Congal <yoann.congal@smile.fr <mailto:yoann.congal@smile.fr>> wrote:
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
>       PACKAGECONFIG:append:pn-strace = "bluetooth"
> 
> typo: = “bluez” unless you meant to reference the DISTRO_FEATURE?

You are right, I meant
  PACKAGECONFIG:append:pn-strace = "bluez"
I've tested it, fixed it... and forgot to fix the commit -_-

Thanks! I will send a v2 shortly

> 
> 
> 
>     Fixes [YOCTO #15323]
> 
>     Signed-off-by: Yoann Congal <yoann.congal@smile.fr <mailto:yoann.congal@smile.fr>>
>     ---
>      meta/recipes-devtools/strace/strace_6.6.bb <http://strace_6.6.bb> | 3 ---
>      1 file changed, 3 deletions(-)
> 
>     diff --git a/meta/recipes-devtools/strace/strace_6.6.bb <http://strace_6.6.bb> b/meta/recipes-devtools/strace/strace_6.6.bb <http://strace_6.6.bb>
>     index a3de7941cf..c355b45b20 100644
>     --- a/meta/recipes-devtools/strace/strace_6.6.bb <http://strace_6.6.bb>
>     +++ b/meta/recipes-devtools/strace/strace_6.6.bb <http://strace_6.6.bb>
>     @@ -22,9 +22,6 @@ inherit autotools ptest
>      # Not yet ported to rv32
>      COMPATIBLE_HOST:riscv32 = "null"
> 
>     -PACKAGECONFIG:class-target ??= "\
>     -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
>     -"
> 
>      PACKAGECONFIG[bluez] = "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,bluez5"
>      PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
>     -- 
>     2.30.2
> 
> 
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#192253): https://lists.openembedded.org/g/openembedded-core/message/192253 <https://lists.openembedded.org/g/openembedded-core/message/192253>
>     Mute This Topic: https://lists.openembedded.org/mt/103140540/924729 <https://lists.openembedded.org/mt/103140540/924729>
>     Group Owner: openembedded-core+owner@lists.openembedded.org <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub <https://lists.openembedded.org/g/openembedded-core/unsub> [ticotimo@gmail.com <mailto:ticotimo@gmail.com>]
>     -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

