Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 845BBFA0C23
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 07:27:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8064.1776324468592291685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 00:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KvBL/T+A;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so117240145e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 00:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776324467; x=1776929267; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EmNJFLmcfzG1RsGCm0UotehnDoBOFs8bBwSPUPcMEPY=;
        b=KvBL/T+A43uQ4MGD6ATk+Tyb75wt2/ZgNhlu2A7Lrp9c/SXKIKp100OyLOgm4HjDgR
         ztdAG+lQ1NbsqBRcCN3ARhbH/5FA+Piuc0gdMpWvKz8mIJaYdDQfElfHqfKfTi/jqKSo
         TOoIhfz0RaHoTLsUBM9I4OMFq72yABV5tImRLTCTApZJs/Z8QRtOPdOwmnxRy73xkdRx
         XNT0YkytDgakwhpKrnEWPSf1eJn2iLKZQGUTXdVMMnGTClmOkp67rmpsHpelxKjJSLTE
         hDqdA3R+kA475zrRICq31NESrBXxubSpWIHCRgQQ/F7L60OEnd1CJdIf8KrmAVoxsBzz
         MCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776324467; x=1776929267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmNJFLmcfzG1RsGCm0UotehnDoBOFs8bBwSPUPcMEPY=;
        b=kE9iCwrDZd+4hgeO/O2JnLah/ribe/V0+F9Q93QQxjF9zQWvpJ+CtEaSJ5bs0x9hKi
         TYrItpfeL0iIk1SDqR1wGYrC0si/QkJideSBhmYRSEaE7KhGEWcitzgC5gSM3r3t42Fa
         RlYiqPezmBtDvUH2MnR6Zx/rQPqGjdQuqC1g4ITyVjD8K9JSuJgoFLvMa5mER3wgmEvm
         TrfGZqby8O4dQSYd4cNNwWcXVcdmhvRjfPRgMNuzEs0irescgOkJjdSZ4wS7oItHTSEG
         ucaq79czGcHLvqSDltCQi6ws4OjR07metLH1+dvoSmPFPUv56dE7m8WoThqu+Wn0FeKx
         uY4w==
X-Forwarded-Encrypted: i=1; AFNElJ9QQmvW7fxMsmrxO09xvPid7wcfUl7nij0BP3NyS3NUSu539EUy1VM1EQ2jx94U1Qb8XFVxKnFpZ4DOZ5asB8wdVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRS6jHCLOXOfr2Rt0hznmcTfUlDn2ycmNH1Skz8dOZTzHqRkSk
	G9Tv2ynWNxnJ5KQhlwZTIIJhtokuhujum9Z2kfoOFB80x7niYQygCvyuJm86HA==
X-Gm-Gg: AeBDietAw59iTJqxDkAY7c0Y7MIQc6tcLJmF+iuLknihh/pIh9LoNXQXRjHLl27SaRb
	inrOBcsjQLNX0/m2xT4YSV83PLtTJFO3szqRkqO+x9752GEHqaPidRudy4stg/CDtMBJHGxAkrT
	C9CXCa284QsdjjBRgz8+Q8A73lkM2IuxpDXuHi5jkKp4v/2BZFCOSBLHNDUJyrGh2LwZ2vxsJgI
	D2/cmWxfCRkKVPkD0aOZ5/6Cc5FiKWw2OHJQnYxTSOpbeWnJMJsXtXSVhCevugDqWKg4ipzqHP1
	pwCbqe9DJyYaKr4edG7E8WlvmaY406h2V92d1NWe/c7fJwWERISsUyXepMUKE8ohF6v0Q7PL3L/
	3zVDgHNxJ0f6jTjS/RidI0NtXmSmAGkF0KbsK/u8kDtyXuwDObb6OLxrGG7InphZ0MilNAcWH9p
	HZraI4w5YHZ+gWGSY+98P9+lR+lBOekrFXJMfF9cO+NOkHStcf8bcMKw==
X-Received: by 2002:a05:600d:9:b0:488:b4e3:aeca with SMTP id 5b1f17b1804b1-488d67bf177mr272633545e9.1.1776324466765;
        Thu, 16 Apr 2026 00:27:46 -0700 (PDT)
Received: from [192.168.2.123] (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f584e306sm36236175e9.11.2026.04.16.00.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 00:27:46 -0700 (PDT)
Message-ID: <ee4be5e2-033f-436b-b847-a3c796304fab@gmail.com>
Date: Thu, 16 Apr 2026 09:27:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 3/7] pseudo: fix for build with glibc-2.43
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Martin Jansa <martin.jansa@gmail.com>
Cc: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org,
 Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
 <20260308150834.2508331-3-Hemanth.KumarMD@windriver.com>
 <CA+chaQcneoNBogdCZmZB3LCE-cVErs2-4NoNtYUGgK+REEBxLg@mail.gmail.com>
 <18A40738790ACBCC.657799@lists.openembedded.org>
 <e38f41d9-4af6-4389-90a7-0c2ae6b47330@gmail.com>
 <CA+chaQdDkMUDBO8G=cku8SVe=Ow+Hgt606mZO863rCaNaznDrA@mail.gmail.com>
 <18A41C5827F22307.777565@lists.openembedded.org>
 <ed118dea-62cd-4d29-9ee1-336367a2aae5@gmail.com>
 <a534592e54506e5576444250023b0bed775a298d.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <a534592e54506e5576444250023b0bed775a298d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 07:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235391

2026. 04. 15. 15:16 keltezéssel, Richard Purdie írta:
> On Tue, 2026-04-07 at 17:38 +0200, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> 2026. 04. 07. 17:21 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
>>> The issue turns out to be with GNU tar, specifically this build:
>>> https://koji.fedoraproject.org/koji/buildinfo?buildID=2924033
>>>
>>> Manually downgrading to the previous build fixed the packaging problem:
>>> https://koji.fedoraproject.org/koji/buildinfo?buildID=2917292
>>>
>>> I reported it here:
>>> https://bugzilla.redhat.com/show_bug.cgi?id=2455965
>> According to the changelog of the current GNU tar 1.35-8.fc44 build,
>> it contains backports from what will be the official 1.36 version.
>> With that release, whenever it will be out, other distros would fail, too.
>>
>> Note this from the Fedora package changelog:
>>
>> - Backport upstream changes to jailify extraction directory
>>     Includes related gnulib changes to add openat2
>>     Fixes CVE-2025-45582 (fedora#2380007)
>>
>> which seems to be this commit:
>> https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=75b03fdff48916bd0654677ed21379bdb0db016d
>>
>> commit 75b03fdff48916bd0654677ed21379bdb0db016d
>> Author: Paul Eggert <eggert@cs.ucla.edu>
>> Date:   Thu Nov 13 13:44:10 2025 -0800
>>
>>       Use openat2 to jailify the extraction directory
>>
>>       This addresses CVE-2025-45582.
>>       * gnulib.modules: Add openat2.
>>       * src/misc.c (open_subdir): New static function.
>>       (fdbase_opendir): Use it.
>>       * src/tar.c (open_searchdir_how): New var, replacing and
>>       augmenting open_searchdir_flags.  All uses changed.
>>       * tests/extrac31.at: New file.
>>       * tests/Makefile (TESTSUITE_AT), tests/testuite.at: Add it.
>>
>> I guess it will really need fixes in pseudo to overcome this.
> I have put some patches onto this branch of pseudo:
>
> https://git.yoctoproject.org/pseudo/log/?h=rpurdie/openat2
>
> In my local testing, that did work but I don't have a Fedora 44 system
> to test on right now. There are some potential issues with chroot
> handling in there but I would be curious how this works on Fedora 44 if
> you were able to test...

Here's the patch I made against pseudo:

--------
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb 
b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 4d31629903..1282e231d7 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
  require pseudo.inc

-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=rpurdie/openat2;protocol=https \
             file://fallback-passwd \
             file://fallback-group \
             "
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
      file://older-glibc-symbols.patch"
  SRC_URI[prebuilt.sha256sum] = 
"ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"

-SRCREV = "56e1f8df4761da60e41812fc32b1de797d1765e9"
+SRCREV = "54f3d1b4dd3eaed2c57b43c3a4d62cdf99239ed2"
  PV = "1.9.3+git"

  # largefile and 64bit time_t support adds these macros via compiler flags globally
--------

I have upgraded to tar 1.35-8.fc44 and run some build.
This change in pseudo works properly with the newer tar build shipped in Fedora 44.
FWIW, I have not tried building GNU tar from their latest git sources.

Thank you very much!


