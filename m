Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE38FF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 07:58:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6305.1777449492499925133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 00:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tHNrkDpz;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so87630765e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777449491; x=1778054291; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBZF8RORLW/BckZQ2lywKEUKPfqQGz95CH0bNU0JyRw=;
        b=tHNrkDpzR/CPEgIQKRC+xVIxvbZ44zcHEsH823KViWcAbIZ3idLXBGU1Mp2iN5503R
         +VDTqjd5RDO/o41wSz78o4Ky32zBmAhaAHi6QyN5YaVB7Cm63w7V+wpyBH5jiGGK4GIZ
         CswpRYFgESD+gJ3yObuYhxU58UKno7k6dsxUSvMiC00RJv0IrOoPk2x8HQGAOHDuqFLK
         OBh7TIupfmMl3wrsMc2Y/rANUA9xr6UViGf/oyTgH4IIgki5fuFCH6wR+ZMgSx2J1z2S
         qZaFgase5Ar1YeQZw/D7mHIIKOwtP5d3bkXOLrr8OllAodnfy5x3Oc91gphJ9hxX/9jt
         FbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449491; x=1778054291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBZF8RORLW/BckZQ2lywKEUKPfqQGz95CH0bNU0JyRw=;
        b=gscRyJawJQKYkPw3PofD9Z2vu3zF4TsxTlaXlClM6StDtW7K6842gum9qFgD7xz+7X
         coHRbh7J+bOENVHckN3mwvK5tH/iuByKtElnvcDOhPwYGzEYOXf8BD66dhXq9lvYsrfM
         H2SB3kwOaX7ieA+EZt6ZWXsyGH2seMrYBaLynbC99vhtuSplOzei6yNFZ7TtNvvPwxA5
         QyPoTKxhg8pgJwmLs+GW7RJV6l1asejfjMJ5LcVPBSGsKZw7ptKtXVk8H0+AGnOULkOs
         yASe/TFUrZE6r9Rh/j7EGUGL7FjtwcCZqVV/nx5YyKjAh4ZRUKOqOlxqAR9Kcw0Xluld
         F6Nw==
X-Forwarded-Encrypted: i=1; AFNElJ862DEV7HZey0NAcz/RkvQCbpRb5AB3sOhY3kx2Gm1ZsDh0wQ2snyJ8/0EzFC2g0qQt9on/uryw7w1X8GhiUB0hBw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzokaRHrwiHmN9YxMGfWCF4GcHO4y4z8TlAZPfSdXp2/weBe8hA
	2KE5Zh4j6AoHKSIcE6MLr+EVCs2/52zM94hi4eGFvlAOmIOlvLdtifa5
X-Gm-Gg: AeBDiesFaOjtctynH+gEYMvkkq8/qHM5k6qv13hkP43gmEKNbkpoXGul45qFhu1kO2Z
	3Szj8xgTeLmhPAfLbMXPVx6SHJXHgkpdiRcFeKKQXqdpCbjgifljVhtrLWWl9DQjoLnVJRnIzx5
	0LmQf5uTfmoyV4X25fIOMB08XIzf5Eu3ae+rajO8ECgriUK4qS4BFKuzJX86z70XGeq1Ig+AWkW
	7P/hrjgCP82HtZlzXtD5dsnNR+dfTQeGD3L36ccC4QqML9bxxvLG5WPEYEQzHCUTSPLqHdCrbWo
	wrAXA0nt6iMm/yJ2wak6udrhceuPr6zkAEpQv6fZO809bWR36HFup+czlQ3eaw7GmcOKpDTLeVr
	LIluNAdz2HT5W9uOAvqkOv6DlWv3Pmc45GRHuZxJswjiNNxZo0FvS4mHB54lFaKfwOhoHuefTdK
	NLkkKdGf297IjK3MvlyqC/1OSSHqNDKwO9Yrz1z1xuHIVK2TqiEZGsAYnv+Gkg44S9
X-Received: by 2002:a05:600d:d:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-48a77b1333fmr84523505e9.17.1777449490422;
        Wed, 29 Apr 2026 00:58:10 -0700 (PDT)
Received: from [192.168.2.123] (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc23ffesm40177145e9.8.2026.04.29.00.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 00:58:09 -0700 (PDT)
Message-ID: <73dcaf57-8629-483c-935b-0abec14656d4@gmail.com>
Date: Wed, 29 Apr 2026 09:58:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] base/bitbake.conf: Rework DISTRO_FEATURES
 and MACHINE_FEATURES default handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20260423133340.1954703-1-richard.purdie@linuxfoundation.org>
 <20260423133340.1954703-2-richard.purdie@linuxfoundation.org>
 <822efc1b-68ff-4d95-adbf-15576b653a55@gmail.com>
 <1d912b5e73c5ef463eaa1c7e0dfcf8607767efad.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <1d912b5e73c5ef463eaa1c7e0dfcf8607767efad.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 07:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236083

2026. 04. 27. 16:26 keltezéssel, Richard Purdie írta:
> On Sun, 2026-04-26 at 09:28 +0200, Böszörményi Zoltán wrote:
>> I found via git bisect that this breaks my builds.
>>
>> It breaks two things:
>>
>> 1.
>>
>> With DISTRO_FEATURES containing seccomp (e.g. when using
>> meta-virtualization and/or meta-security), this libseccomp-native
>> is not found by gnutls-native anymore. Sure enough, the libseccomp
>> recipe does not have BBCLASSEXTEND = "native nativesdk" like
>> gnutls has. So this change has at least some good points to
>> point out pre-existing issues.
>>
>> 2.
>>
>> A circular dependency occurs:
>>
>> ERROR: Task
>> virtual:native:/mnt2/zozo/yocto-6.0-arm/conf/../layers/openembedded-
>> core/meta/recipes-core/util-linux/util-
>> linux_2.41.3.bb:do_create_recipe_spdx
>> has circular dependency on
>> /mnt2/zozo/yocto-6.0-arm/conf/../layers/openembedded-
>> core/meta/recipes-core/systemd/systemd-systemctl-
>> native_259.5.bb:do_create_recipe_spdx
>> ERROR: Command execution failed: Exited with 1
>>
>> Adding INHERIT += "nospdx" does not fix this and none of
>> the layers have any bbappend that would explain this.
>>
>> Using the preceding commit fixes the build even without adding
>> the necessary BBCLASSEXTEND incantation to libseccomp.
> I tried to reproduce this by including meta-virtualization, using a
> systemd based DISTRO (poky-altcfg), setting seccomp in my
> DISTRO_FEATURES and building both util-linux-native and systemd-
> systemctl-native (and then world). I wasn't able to reproduce.
>
> How do I reproduce it?

I only found the culprit today.
I had this lingering in my custom distro layer:

DISTRO_FEATURES += "${DISTRO_FEATURES_LIBC}"

Apparently, DISTRO_FEATURES_LIBC was dropped in 2019 without me
noticing it and nothing was warning about that I was still using it.

The circular dependency problem was gone after removing this line.

Please, add this variable to the list of obsolete variables.

Thanks!


