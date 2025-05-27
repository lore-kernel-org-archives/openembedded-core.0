Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A361FC54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 16:01:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.55845.1748361659890000663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 09:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dCWZAm/R;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a376ba6f08so2308659f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 09:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748361658; x=1748966458; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cc4r4cyHbI5AQnblhF9AwBPlLxrLnIPaD8btfQgMHCk=;
        b=dCWZAm/Rb7SqzxaR8rkJ0ca4nwS4GrPZ0TGFxqfLyJmJ9s675+n8EIc6hyny57gBb0
         VhfQVGnrQBTC4F67ON42V7+oMChKm8ozG/94z4yogxkzy4qxwEZnr9giRoSzRtrXerN9
         QxPvdS+GKjutyl00/mfRHxoGeTUvhDc7pB+lrx50IT+WIuJe327X22U+HoAvitfyj375
         eWvO53Ib9LeoYgh3Y8LYiEL7n2237L5kpEorEBkcnCIQvUfcX2/cl22Qwe67BGU2toht
         EwSZtFZ0JdVqjAwv9+3C7ADElHUkBd5xtZuU4pK/QRTcfepmv4/vrneYxI9Y0Af0HhgZ
         s3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748361658; x=1748966458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cc4r4cyHbI5AQnblhF9AwBPlLxrLnIPaD8btfQgMHCk=;
        b=WG2WvRb2OscU5RMe/61N8XG4uHOQdVO3ZGttNRtO5qTbamZc3oyqxgaJXETMrzQfJ4
         cK5FXcZkRsSw101ARBxp88idws4QBGuU27Xvn8qk3fIdDKWATu8wFy7lQjR9fb901DGV
         TEoPoXEmLa4nz87C4V3oBhG86B2vXSyRZasGC3MC+Tg6SJVlgWOhM03Z9b7BPTwrPYe6
         K7GASf41K/Ddhw3RSgTOPlzGpq+3arJOnyr6qRaqC4yUmLwxxo1omof43KohfSFdrSXt
         bvvWFF1pTYRtSkbfM+vi2mFTF8ZZMiMDl3iqRHmZehPcpSpLGjjxUP38Sb3sxltevNFC
         i7uA==
X-Forwarded-Encrypted: i=1; AJvYcCXNi/sphfOrbU7dEnH7GnhcJRWjdEjgeYPAnV7zfFAIbAGiOPj/i/bPlre/CEVlSmMochRLOTZBQzbjm/HonrXgIQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwwzmsbkXrhHalP0P/UjBzfaC8yZ7i/3XcO5ZDZwZ0TkynD33mh
	dwfK4Ux2g8+YF1NL5UdVKExO+WmKp2Z+RZRVASV9h5EyIQQ2WylJWluBdgAuMQ==
X-Gm-Gg: ASbGnctpx7uCDP/o8RDbO/lZ9v54/pwz6cJxnc3HFWTvc63I2f43hRCICXSfrL3LKKq
	ndxJroKZE0/DUUc5wI/4nIeazoIqgqDVl/fK0WKeHywzqHX+KJ/r2SgJNsFPMX7xpflGOKMASfS
	fV9YJeloLRpn8GI1VZn0ZqFDh0XtvGKXdWHshe/Bu4RZULSVVeimDuAyYgRXAEMNzEhnZYeE6Bx
	+Sik9rsb7o2kddyCBBRKR1RojGxoeCHezMMtS8Kx/JDd/OMrVQdds7WIuy6f7QCDDVYTspdTRM6
	bI1HS/gMj50q0HAAz+xbIkLQaP2D7WQzpxjHySvt3mUKxARH143AQmiI6rQ=
X-Google-Smtp-Source: AGHT+IEGP8zo1ltgG94H3JrYqHgZ/QQsoOfBrsVKCIKh8PSs8rbptb8ewaqF6XvME0cIRcHBiDcFVA==
X-Received: by 2002:a5d:4208:0:b0:3a3:63d1:4160 with SMTP id ffacd0b85a97d-3a4cb4ad5d7mr9797204f8f.56.1748361657448;
        Tue, 27 May 2025 09:00:57 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d93ce27bsm6258872f8f.84.2025.05.27.09.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 09:00:56 -0700 (PDT)
Message-ID: <08003f5c-5919-49ec-9e3e-15fa1e62f8f2@gmail.com>
Date: Tue, 27 May 2025 18:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 11/15] python3-flit-core: upgrade 3.11.0 ->
 3.12.0
To: ccasciato@21sw.us, openembedded-core@lists.openembedded.org
References: <23322.1747622946650098895@lists.openembedded.org>
 <22894.1748353705199489095@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <22894.1748353705199489095@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 16:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217314

On 5/27/25 15:48, Clayton Casciato via lists.openembedded.org wrote:
> I also found this:
>  
> "[AUH] python3-flit-core: upgrading to 3.12.0 FAILED"
>  
> https://lists.openembedded.org/g/openembedded-core/message/214061

I tried to reproduce these errors in my env[1] with all your failing
packages, but they built successfully. I also tried with only oe-core,
without anything else, and that was successful too.
The AUH failure seems to match your error, but interestingly the patch
has survived autobuilder many times... I wonder if the error is rooted
in build host environment, or maybe even in sstate cache somehow? (I did
delete tmp folder, but reused sstate cache. I build my recipes in a
Debian 12 based Docker image)

[1]:
Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta-firefox         = "master:685ae3023b8ad6e6378e41058520327439ffe6cf"
meta-clang           = "HEAD:02e254ba1fb4937530d94a154b4c713c904c2d06"
meta-firefox-test    = "master:7ac03919ed0036da95fa3eb6643627b41d8e73eb"
meta-multimedia      
meta-networking      
meta-oe              
meta-python          = "HEAD:1d6095b73fa21062fde2b347cd61b6c5104390d9"
meta                 
meta-poky            
meta-yocto-bsp       = "HEAD:9bc47d6a4d23bff5999b69fa2b99e1b32eaa62fb"


