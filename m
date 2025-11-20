Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED0CCF8542
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 06:13:54 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28446.1763619231133107946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 22:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y+/9qOpq;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so191409f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 22:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763619229; x=1764224029; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zdc0iN8YOBWNhFB3Ge6rskmjBD8GhZNmUGz96YOaqB0=;
        b=Y+/9qOpqgOsQP5bHJo/UTe3IDjdxf8XWIGRxGRTMnz7AWhbDjf/aGoiA2YKetwl26T
         ZCUDC0rtNwvWZ27IfYPjrpfLMxLN9XRjXuLIh5ZSVqAVSu2GH7Nr2e3Yi+b0itEK0ym/
         uVrseAiXPmkSL8c4gMejeU4Y+XKr5Na0CL1Kmr/iX5TEbLxgyrOn7nSFnRCveesu4NEG
         AKsMQn7HLS+oiRyhqCCFnUXIY2vOV0dJiuVKLGhey49/EQOmExFhF7Obrd1cxrGfRxad
         UCmEgE2A3vVz4mDt4yvvnWbIGQ3NdGPIFBYbMU+p/mQ2amNLOrB3rdzxMcX2sCdfo956
         wpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763619229; x=1764224029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zdc0iN8YOBWNhFB3Ge6rskmjBD8GhZNmUGz96YOaqB0=;
        b=ScBCUZZremBT2kip3gz2vNDaUYIWHYP3TTzFj/e4EDLKV2spex2Oz97Vrs7f7DZvYI
         GxNwIyCxcANZc45cmph+gPm2FOazstxBQdkblQF76o/po2fV6Xfd7/Zh2LN4vtPituTx
         db/wDkJ+Ex4SxYRKGwbqif5TziwM8WgxOhGxzVoA3FNiVxnakoAL1v5LiMxK32a196BC
         YE4dQ17HhttcE1Xx3KVM8D1rqHA+mAndue4ZgQvMhSgyRJVVnj2EAl2lhO/hE8FczKKk
         tHM/pajnjjBX33iVsXC21SYbCKVlDOgTewGW82wELbekcOahhaxnzkhPgdGDZajF2jLu
         0iSg==
X-Gm-Message-State: AOJu0Yy5qdYGSLw+7eesJMVVaO2/BNSUWoaDp8rk/ZLFbx0viN6f2X8S
	Faf7pdebnT9Xeb07DmPx2ae+5CrkynTs0SysajaP782RsIfoIJMcGCev
X-Gm-Gg: ASbGncsZrq65vM3++f2/906nUKH7yUQVAPdyRkCAt26t9ambNmV/5sV8r71MS8Md/X0
	506v3eZ4ZNtqJFJ/Gznd5WCL5/lrMxEfRVmIr2Yr5bpyOuvgou4DXBAzqA++lgcE5RSPK25e7Ax
	JRe81O/2da6/01/NcMOlHTVLicyhpiMxQcUVZmUidonrpcUCXxjdSnxE8msVLZaux9sSfYppJat
	azH4k3lnx0wyejqDqkrSmRoBvxHAYBKcPiyFOH6mmNQDHVomPuMZIBKmHvnnrHSk8djZryITYyD
	UsB0M0Mz7RPjnCh7hMxEV2b1ZSGricEgkCWj7quO036t4MrWuLSJdjN4/2lqIPjdDJ+ALdE41qx
	/3pDQgY8IBTD1Z93VFb35URJvZBoXF8M6yaAkzbf0FwrYjWSDz/gix2/bUXSFEMfkj5xp8TaUio
	nCkGqFrGMCErOipIImyYw=
X-Google-Smtp-Source: AGHT+IEvC0UYXyMBGKoiAPMs5fVyjLHaGJJelSMAs8b6cGQJRi8GNV1Cvtydv7rKqSspvZtHVDok/Q==
X-Received: by 2002:a05:6000:288b:b0:426:fb27:974a with SMTP id ffacd0b85a97d-42cba7c4cc9mr1075329f8f.27.1763619229121;
        Wed, 19 Nov 2025 22:13:49 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9022sm3374345f8f.36.2025.11.19.22.13.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 22:13:48 -0800 (PST)
Message-ID: <cd7cb6c0-8439-4bb8-98ce-399dab65702e@gmail.com>
Date: Thu, 20 Nov 2025 07:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] bitbake.conf: add canon-prefix-map to
 DEBUG_PREFIX_MAP
To: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20251119101959.2603691-1-skandigraun@gmail.com>
 <e327cbe3-7980-4806-8a1e-69d3910d3eb4@gmail.com>
 <CAMKF1sr9jnTiyAAue6LeGWT5aGganW3zoSCKapGV_dCcrBL93A@mail.gmail.com>
 <331d9c70b2bd4a23790efae7726ac626656e4234.camel@linuxfoundation.org>
 <CAMKF1sqh+kj7vtYHWREOXYPT6zUzR1fUsxxhKogqd4C4230Vcw@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sqh+kj7vtYHWREOXYPT6zUzR1fUsxxhKogqd4C4230Vcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 06:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226604

On 11/20/25 03:40, Khem Raj wrote:
>
>
> On Wed, Nov 19, 2025 at 10:17 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>
>     On Wed, 2025-11-19 at 09:29 -0800, Khem Raj via
>     lists.openembedded.org <http://lists.openembedded.org> wrote:
>     > On Wed, Nov 19, 2025 at 9:20 AM Gyorgy Sarvari
>     <skandigraun@gmail.com> wrote:
>     > > Hmm, I just noticed that this flag wasn't omitted accidentally
>     at all,
>     > > but because clang doesn't support it.
>     > >
>     > > Please ignore this patch, will try to come up with some
>     conditional
>     > > patch or something like that.
>     > >
>     >
>     >
>     >
>     > Right, the intention was to keep the DEBUG_PREFIX_MAP to be generic
>     > and I was hoping that packages won't need -fcanon-prefix-map but
>     that's
>     > not the case. In any case I think we now have toolchain classes
>     and these
>     > options are compiler specific so we could either move the whole
>     > assignment out of bitbake.conf and into toolchain classes
>     > or define addon variable in gcc.bbclass
>     >
>     > DEBUG_PREFIX_MAP_EXTRA = "-fcanon-prefix-map"
>     >
>     > and prepend it to DEBUG_PREFIX_MAP in bitbake.conf
>     >
>     > That will allow it to be overridden cleanly in recipes if needed.
>     >
>     > Third option is to keep it as such and add
>     >
>     > DEBUG_PREFIX_MAP =+
>     "-fcanon-prefix-map" meta/classes/toolchain/gcc.bbclass
>     >
>     > also keep in mind that this option is only available in gcc-13+
>     > so DEBUG_PREFIX_MAP if used on native recipes might fail for
>     hosts with
>     > gcc < 13
>     >
>
>     There is an additional issue in rust too, e.g.:
>
>     https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2773
>
>
> Right, as I noted above in my reply, ibuild host is running debian-12
> and the gcc version on debian-12 is GCC-12 which does not
> have this option implemented. We need atleast gcc 13. Perhaps we
> should follow option 2 or 3, that will address the provlem
> surgically.

Yes, but I believe that we are also hitting this bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15976

This log corroborates with this - bootstrapping is building some crates
for the host, it uses the host's compiler, but it adds the target flags
to it: "HOST_CFLAGS" uses no prefix-maps as prepared by
oe_cargo_fix_env(), but the failing call uses them. (And the failing
crate has cc-rs as a build dependency...)

This is getting into a rabbit hole :) Will stare at this a bit more.

>  
>
>     Cheers,
>
>     Richard
>


