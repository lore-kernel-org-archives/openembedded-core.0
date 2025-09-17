Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5A4CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 13:53:13 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.23609.1758117189603272754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 06:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z94ysxNz;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: zboszor@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-330469eb750so393817a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 06:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758117189; x=1758721989; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmVvQQUP3VlEa1+0waOCKXhngxlaauv+7/YCyBgH1Jw=;
        b=Z94ysxNzbeKQDfQkTQNC0NZImr7t+Sb7o6cvfLPjdmyT9MuUN9BoFWdLOET0fXipvX
         Y+HqaTCSV0W67TXp/yW5xOFjePGKg6gBYQiCyIRTf6hnfL7hjmULYHJYBkH7DHfKcUT2
         BblXKBBGSIungK9pvEcSLmN3VSjNJuKpStl8ilGnhai96l6KbyQPuVrNmg7hxTPzjAL8
         rlBAe8SXmsPv8/aOtyGbNyAPrObLJKcF+4MizaJKRcwkKIzE/4yjgSbpf/eVdMs7HyCJ
         fI7k/BwT3BNHTr0Y7zaRvnSGm4J7Etkx32YcHP7Tnv3bQL2WbjEf5EDoHxeT0nHK1J2G
         dTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117189; x=1758721989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmVvQQUP3VlEa1+0waOCKXhngxlaauv+7/YCyBgH1Jw=;
        b=PeaEFu4sF1LuCjxtz5t/+8cqAI67PxMGoXqNSoZ757+4JSO3F3AJbxByhbThnxOfQo
         pQkLSv/9fgZOwB3HRsxo8P+sd42kAL0WbPCyDfFAHdfdETDhPAFyGb/4BfLjms7yA1e7
         7iSdrVhqVnCCbvQ2Yd6JyCX+CxLhkI1gKJ7WR7URKawvQQ1CoxlJug4DGfGWmlkszg63
         spPKTAR1ACsSxE6tlgLn1Gb0Dkf376b9v3KEkYgmCm6v4E7kX/wgWAQmV7ceeWgUbn6d
         eGIdmwdHwP0kkrS8VB3mvPd2eibz6OS6vSkCi4pIgPNvvIR+uH47IARXqkWlICFK6cPZ
         aVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLesUBSgcz4C/NjLIuVHJvn7Yucu0TS0bYA/IupMUaDrZIBtWLgLxMMssYxvM3NiKSKWCGHH3fAlDLccDg2jDRMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHsSvVEMBtksxG8aY2b2bzZxEr8ZHc0z6YRyha9NKiPH+n89ES
	tQ0APa4ZETlvTc0FDsulEvJ7Hbiy/VmpjP0dJ0TggOSIsJaCFmmNm8CK
X-Gm-Gg: ASbGncs1UjN7bUofsraj8Erc4WpjnopLNoB6NdXHZ/ZATUIc1L2X29LIkGKPmTaPfSb
	JG992qhl+kdSVXFUqK34mdlnYnimWdmxi16GRQ8eh5604DnI9kwofYNbkTJfVk3Dq/N8Kt2E4Vn
	ToYzVJeZLeiqmIKY22Z3zcV/Ch1sSbaHulwImpW+T74lBaZLmvhLJMe2SvRLqEI7Wqt52Gb1N3I
	3ZLYLGV0cCjLJvixPUxyQnTtEjwJ64btFbT8VQQP6cwMeg1lGBjzvEo0dZvPobCAhSy29xeyJ/d
	ztM3xD76oRGjaBsKYmmMZSBUiyki5Z9LHolkj397EvW7/oxKBvxk6HwPqo8Uh81NvXDL6RrEzOc
	y+fF9UlgumKWXTpX8e7OFKYsADE+xm3/B7l0hUBJxYy9sOZZt1RbMyDmG
X-Google-Smtp-Source: AGHT+IHAWEd4SjkkFwrOU19Beggaa9F3B1eSBGe2+mekMO8cK8tysCF+MmmL+wnjMJn1XlaxzvjM1w==
X-Received: by 2002:a17:90b:4c88:b0:32e:32e4:9789 with SMTP id 98e67ed59e1d1-32ee3eed45emr3064890a91.3.1758117188775;
        Wed, 17 Sep 2025 06:53:08 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54b467382csm13582799a12.6.2025.09.17.06.53.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:53:08 -0700 (PDT)
Message-ID: <a75581d2-8234-42c2-a9ff-1102753203c6@gmail.com>
Date: Wed, 17 Sep 2025 15:53:01 +0200
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
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <18661636B9C9FA43.26272@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223606

2025. 09. 17. 15:52 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> It's not transient. It happens if I try to build xkeyboard-config-native
> after -c cleanall. Wasn't there a way/bbappend to turn absolute symlinks

Sorry, I meant bbclass.

> to relative ones under ${WORKDIR}/image?
>
> 2025. 09. 16. 10:46 keltezéssel, Alexander Kanavin via lists.openembedded.org írta:
>> I think these are both transient issues that happen when build
>> directory is reused between the old and the new version. Not
>> xkeyboard-config fault per se, it just rearranges the install set in a
>> way that triggers a bug somewhere in oe-core :-/
>>
>> Alex
>>
>> On Tue, 16 Sept 2025 at 07:43, Khem Raj <raj.khem@gmail.com> wrote:
>>> I am seeing a build failure for xkeyboard-config-native
>>>
>>> ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot: sstate
>>> found an absolute path symlink
>>> /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/sysroot-destdir/mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/recipe-sysroot-native/usr/share/X11/xkb 
>>>
>>> pointing at 
>>> /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/recipe-sysroot-native/usr/share/xkeyboard-config-2.
>>> Please replace this with a relative link.
>>> ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot: Failing
>>> task due to absolute path symlinks
>>> ERROR: Logfile of failure stored in:
>>> /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/temp/log.do_populate_sysroot.726640 
>>>
>>> NOTE: recipe xkeyboard-config-native-2.45-r0: task do_populate_sysroot: Failed
>>> ERROR: Task 
>>> (virtual:native:/mnt/jenkins/workspace/Yocto-world-arm/sources/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_sysroot)
>>> failed with exit code '1'
>>>
>>> On Mon, Sep 15, 2025 at 10:32 PM Markus Volk via
>>> lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org>
>>> wrote:
>>>> I'm seeing issues with symlink creation:
>>>> | Installing symlink pointing to xkeyboard-config-2.pc to 
>>>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/pkgconfig/xkeyboard-config.pc
>>>> | Installing symlink pointing to base to 
>>>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg
>>>> | Installing symlink pointing to base.lst to 
>>>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg.lst
>>>> | Installing symlink pointing to base.xml to 
>>>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-config-2/rules/xorg.xml
>>>> | Installing symlink pointing to xkeyboard-config-2.7 to 
>>>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/man/man7/xkeyboard-config.7
>>>> | Installing symlink pointing to /usr/share/xkeyboard-config-2 to 
>>>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/X11/xkb
>>>> | ln: failed to create symbolic link 
>>>> '/home/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/X11/xkb/symbols/en': 
>>>> No such file or directory
>>>>
>>>> On Thu, Sep 11 2025 at 10:51:22 +02:00:00, Alexander Kanavin via 
>>>> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>>>>
>>>> From: Alexander Kanavin <alex@linutronix.de> License-update: disclaimer and copyright 
>>>> clarifications per 
>>>> https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/merge_requests/821 
>>>> Replace manual symlink creation with a meson option. Drop no-op autoconf options. 
>>>> Adjust packaging as this is where upstream installs now. Signed-off-by: Alexander 
>>>> Kanavin <alex@linutronix.de> --- ...oard-config_2.44.bb => xkeyboard-config_2.45.bb} 
>>>> | 13 ++++--------- 1 file changed, 4 insertions(+), 9 deletions(-) rename 
>>>> meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.44.bb => xkeyboard-config_2.45.bb} 
>>>> (65%) diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb 
>>>> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb similarity index 65% rename 
>>>> from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb rename to 
>>>> meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb index 
>>>> 52d074fd5ed..857ccc75160 100644 --- 
>>>> a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.bb +++ 
>>>> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb @@ -10,23 +10,18 @@ 
>>>> HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig" BUGTRACKER = 
>>>> "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config" LICENSE = "MIT 
>>>> & MIT" -LIC_FILES_CHKSUM = "file://COPYING;md5=8fc8ae699974c360e2e2e883a63ce264" 
>>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=faa756e04053029ddc602caf99e5ef1d" SRC_URI = 
>>>> "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz" 
>>>> -SRC_URI[sha256sum] = 
>>>> "54d2c33eeebb031d48fa590c543e54c9bcbd0f00386ebc6489b2f47a0da4342a" 
>>>> +SRC_URI[sha256sum] = 
>>>> "169e075a92d957a57787c199e84e359df2931b7196c1c5b4a3d576ee6235a87c" SECTION = 
>>>> "x11/libs" DEPENDS = "util-macros libxslt-native" -EXTRA_OECONF = 
>>>> "--with-xkb-rules-symlink=xorg --disable-runtime-deps" - -FILES:${PN} += 
>>>> "${datadir}/X11/xkb" +FILES:${PN} += "${datadir}/X11/xkb 
>>>> ${datadir}/xkeyboard-config-2" inherit meson pkgconfig gettext python3native 
>>>> -do_install:append () { - install -d ${D}${datadir}/X11/xkb/compiled - cd 
>>>> ${D}${datadir}/X11/xkb/rules && ln -sf base xorg -} +EXTRA_OEMESON += 
>>>> "-Dxorg-rules-symlinks=true" BBCLASSEXTEND += "native"
>>>> -- 
>>>> 2.39.5
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223605): https://lists.openembedded.org/g/openembedded-core/message/223605
> Mute This Topic: https://lists.openembedded.org/mt/115184776/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


