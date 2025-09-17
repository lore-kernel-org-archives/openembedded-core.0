Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150DFCAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 13:57:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.23717.1758117454633359577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 06:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZsxYndy0;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: zboszor@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24457f581aeso67249445ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 06:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758117454; x=1758722254; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8J6Ihje/Bop1I1zOKXq7ib5rCpwt0iO/clsFy4SUsUw=;
        b=ZsxYndy0yzcoEYP5c9h8abWLWrvdPU05ilb3UqTYzXAHAm+R4G1mk8z0pFb0VOWXEj
         xdof3zzd/vk65042xHsrAZ9WOWAzqeJCp49YHRBz9gkwv8E60RSWvXkZu620TXl8NJmU
         pIErEglRjbTLlL7PaVN3Es7yjja/QkBK7kCQYjbMxVD5gUQ71ziHKJLLi9JaTc0/EHGc
         x+KQ/Zq0raTAqnyHnWIMehOeLQJlvAU1aacU+MQ8VuVOJtis1wpg1KmD+Sf6DVy5oh/x
         i3kAnFBJZxO91Cd99H4c13VxfxRYr62RkNaKrimauxaX2odixH6rs0vzMU4a3zWLfFNj
         x3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117454; x=1758722254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8J6Ihje/Bop1I1zOKXq7ib5rCpwt0iO/clsFy4SUsUw=;
        b=oX0bPsdc4rx1dz/RRoNdnqtq9PjbB6mb4/NZmDccFS5fUbbByvNArGMS//PU0IuknB
         QKoc4SPvqOY+07xD1a/1UBj5JWnSdYU32ommkh+bbzngWsUfK3Ty5gie1poeLiEvDqLh
         TyE7L6Y0xQ6BWq9+r2uC42d3JrRQEhRrOj3i5G49SZUXAYqjt7YWNzf91M5LrjTDcS9C
         99p6AMl3pDFfCzUDKjN1UqwZa4droHj72mxdfowIyF25kP5uq9j7tcGxUkFzapTXn/88
         yRhp8ZTSHvlk+FlnVH7VF5fpp0K8MFm/rWQ85P2pVq65jfUB5J6Wj1JNfeHfJa4EWMWz
         JpCw==
X-Forwarded-Encrypted: i=1; AJvYcCXKuYlLr4OLG7G9tcuY7TOj22hMctGRg18Si1VMqDK5eWCbeHQ0K6xLTNxGrqzgAfB25PPDP4GX3dJCBWGSDsY48A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyYKL4wyznLs/4/U1R0i/Mag5AamJ7LnHpVObxS2jlPw7sbEwsz
	lWkXfZNdGFLFklFIvhTzracDX4LHMIo2OmfiQOZH0fHtQ8ZLAMfXS84R
X-Gm-Gg: ASbGncs7/1/553iiZw+IzTG2eqlUfiaPFNZUkcmAOvPq4do5dIDFQKK+ApW4Txp9le3
	mqUlfpH5vN9RgviPfMO/f9sPLOck2hdexACle3QRIvTSvsbY5SlQUnNWXBakW1TR1uCNvFPtbuh
	yGcB88bOkmYSpk6g6jHC2Uxg97LxFm3l/A6F4Bmbs16G4t7dTT02JVQCSyaza8IRnOeqEJEi39p
	Rw8Sk3dUe6N9oYYTBieCSO7gMqwPzkK9gEr3K3z1wwyl3Zs8aPIrICx4C3CcKM/tiv+ddJAAggd
	rQ3hsipniMW5p3ZkIe2PGEOhSch3f5R0wAcTpbOaYhoxVVOI6nEZdIgLIx3X1Cc8nqLsNyshyS0
	ozx+Pjg34Rs2Ip011a7P0FTALS49ktVbdOxI6YUbD8f3sijwKk7ZgRKEI
X-Google-Smtp-Source: AGHT+IH1Nbx9v0pGSSCvLuunRAXs884yS+OSAYXk/ecE61H91NoM9oqXvFm4w9h1JaLz4HlPMKRymw==
X-Received: by 2002:a17:903:2305:b0:25c:b1d6:c41a with SMTP id d9443c01a7336-26811ba56acmr35292065ad.11.1758117453873;
        Wed, 17 Sep 2025 06:57:33 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2680889f449sm23086065ad.102.2025.09.17.06.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:57:33 -0700 (PDT)
Message-ID: <bf58632b-e6b1-48a0-a598-07db4184204a@gmail.com>
Date: Wed, 17 Sep 2025 15:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 15/16] xkeyboard-config: update 2.44 -> 2.45
To: alex.kanavin@gmail.com, Khem Raj <raj.khem@gmail.com>
Cc: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
 <20250911085123.1551425-15-alex.kanavin@gmail.com>
 <P12O2T.G9TC7LOZ6AEG@t-online.de>
 <CAMKF1sokUU3n1uDAXTD8ebxFTsSVmZX-4B9iSB1mFQ+3vp7K=Q@mail.gmail.com>
 <CANNYZj994mKx9TLP+1uYf3YDK1ArbkzAJHtyrERhYX5NFT-=EA@mail.gmail.com>
 <18661636B9C9FA43.26272@lists.openembedded.org>
 <18661644E619375D.26272@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <18661644E619375D.26272@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223607

2025. 09. 17. 15:53 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2025. 09. 17. 15:52 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
>> It's not transient. It happens if I try to build xkeyboard-config-native
>> after -c cleanall. Wasn't there a way/bbappend to turn absolute symlinks
>
> Sorry, I meant bbclass.

I found it. Adding inherit relative_symlinks to the recipe fixes it.

>
>> to relative ones under ${WORKDIR}/image?
>>
>> 2025. 09. 16. 10:46 keltezéssel, Alexander Kanavin via lists.openembedded.org írta:
>>> I think these are both transient issues that happen when build
>>> directory is reused between the old and the new version. Not
>>> xkeyboard-config fault per se, it just rearranges the install set in a
>>> way that triggers a bug somewhere in oe-core :-/
>>>
>>> Alex
>>>
>>> On Tue, 16 Sept 2025 at 07:43, Khem Raj <raj.khem@gmail.com> wrote:
>>>> I am seeing a build failure for xkeyboard-config-native
>>>>
>>>> ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot: sstate
>>>> found an absolute path symlink
>>>> /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/sysroot-destdir/mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/recipe-sysroot-native/usr/share/X11/xkb 
>>>>
>>>> pointing at 
>>>> /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/recipe-sysroot-native/usr/share/xkeyboard-config-2.
>>>> Please replace this with a relative link.
>>>> ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot: Failing
>>>> task due to absolute path symlinks
>>>> ERROR: Logfile of failure stored in:
>>>> /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/temp/log.do_populate_sysroot.726640 
>>>>
>>>> NOTE: recipe xkeyboard-config-native-2.45-r0: task do_populate_sysroot: Failed
>>>> ERROR: Task 
>>>> (virtual:native:/mnt/jenkins/workspace/Yocto-world-arm/sources/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_sysroot)
>>>> failed with exit code '1'
>>>>
>>>> On Mon, Sep 15, 2025 at 10:32 PM Markus Volk via
>>>> lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org>
>>>> wrote:
>>>>> I'm seeing issues with symlink creation:
>>>>> | Installing symlink pointing to xkeyboard-config-2.pc to 
>>>>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/pkgconfig/xkeyboard-config.pc 
>>>>>
>>>>> | Installing symlink pointing to base to 
>>>>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg
>>>>> | Installing symlink pointing to base.lst to 
>>>>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg.lst
>>>>> | Installing symlink pointing to base.xml to 
>>>>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg.xml
>>>>> | Installing symlink pointing to xkeyboard-config-2.7 to 
>>>>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/man/man7/xkeyboard-config.7
>>>>> | Installing symlink pointing to /usr/share/xkeyboard-config-2 to 
>>>>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/X11/xkb
>>>>> | ln: failed to create symbolic link 
>>>>> '/home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/X11/xkb/symbols/en': 
>>>>> No such file or directory
>>>>>
>>>>> On Thu, Sep 11 2025 at 10:51:22 +02:00:00, Alexander Kanavin via 
>>>>> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>>>>>
>>>>> From: Alexander Kanavin <alex@linutronix.de> License-update: disclaimer and 
>>>>> copyright clarifications per 
>>>>> https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/merge_requests/821 
>>>>> Replace manual symlink creation with a meson option. Drop no-op autoconf options. 
>>>>> Adjust packaging as this is where upstream installs now. Signed-off-by: Alexander 
>>>>> Kanavin <alex@linutronix.de> --- ...oard-config_2.44.bb => xkeyboard-config_2.45.bb} 
>>>>> | 13 ++++--------- 1 file changed, 4 insertions(+), 9 deletions(-) rename 
>>>>> meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.44.bb => 
>>>>> xkeyboard-config_2.45.bb} (65%) diff --git 
>>>>> a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb 
>>>>> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb similarity index 65% 
>>>>> rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb rename to 
>>>>> meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb index 
>>>>> 52d074fd5ed..857ccc75160 100644 --- 
>>>>> a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb +++ 
>>>>> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb @@ -10,23 +10,18 @@ 
>>>>> HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig" BUGTRACKER = 
>>>>> "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config" LICENSE = "MIT 
>>>>> & MIT" -LIC_FILES_CHKSUM = "file://COPYING;md5=8fc8ae699974c360e2e2e883a63ce264" 
>>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=faa756e04053029ddc602caf99e5ef1d" SRC_URI = 
>>>>> "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz" 
>>>>> -SRC_URI[sha256sum] = 
>>>>> "54d2c33eeebb031d48fa590c543e54c9bcbd0f00386ebc6489b2f47a0da4342a" 
>>>>> +SRC_URI[sha256sum] = 
>>>>> "169e075a92d957a57787c199e84e359df2931b7196c1c5b4a3d576ee6235a87c" SECTION = 
>>>>> "x11/libs" DEPENDS = "util-macros libxslt-native" -EXTRA_OECONF = 
>>>>> "--with-xkb-rules-symlink=xorg --disable-runtime-deps" - -FILES:${PN} += 
>>>>> "${datadir}/X11/xkb" +FILES:${PN} += "${datadir}/X11/xkb 
>>>>> ${datadir}/xkeyboard-config-2" inherit meson pkgconfig gettext python3native 
>>>>> -do_install:append () { - install -d ${D}${datadir}/X11/xkb/compiled - cd 
>>>>> ${D}${datadir}/X11/xkb/rules && ln -sf base xorg -} +EXTRA_OEMESON += 
>>>>> "-Dxorg-rules-symlinks=true" BBCLASSEXTEND += "native"
>>>>> -- 
>>>>> 2.39.5
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>
>>
>>
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223606): https://lists.openembedded.org/g/openembedded-core/message/223606
> Mute This Topic: https://lists.openembedded.org/mt/115184776/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


