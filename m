Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191EDC0218B
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 16:26:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.20053.1737476762724798182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 08:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=apv4TRVb;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3862a921123so4163437f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 08:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737476761; x=1738081561; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6MA5xILZ8FlqkmhfLvkQeMgE7V1KgGt7Y/LG72LCWU=;
        b=apv4TRVbpsupHc64sFIpltVgQ0hH5FdRMdI+ltQ83zxm3cJHAln8akwP8NFeABdaB4
         +GfulNnyIP6DvZwuOuzgRoEeqFjb9bwM9/bR8HBREUOYAFnzHMnbAd8QZW6MgQlaKuPk
         49s6400VoHVu84mKdoR0raK9X2oAqfDMpjpxLNr4BSuzPL6ZN4J0CLABXg+72HY87tNK
         papansHGiBvvjseibk2i8X++769tVea6pjQeWjeZg93Z1zGVtktu4rvtKEDtJfIm8374
         aiZWETnnNugfDiOmwVJAih6uypngOxICgn9N+Tt+R93iS0W1nROqah+/xIMCfzNjGbRW
         NZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737476761; x=1738081561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6MA5xILZ8FlqkmhfLvkQeMgE7V1KgGt7Y/LG72LCWU=;
        b=xIJ8EYnChupr/pFGztMLk5f907L2ydTdGVbiKA7jbycSRc3QatgCc6yXUjk2UvcM+L
         Ddnh+SdQgmng381KR8pipM2ACiCnos4gPoTDLp1bxPnp8ix2wKcD8MpR79GN4csCgw29
         eHE/bQydTa/4G9enMxBObLN7kB3n86+kLEe6gZjLA6tbzTodh6i3lagsvbKOu5pnpPgL
         /DgwwHIhfvzJR7Tb6QjuG7kAj+VChjvsIXVWxH54XMgCel88v+y99OGN9Kyhxh0rItvI
         vtDBhgMwHGi4uMRQ1oYjsVOCWpfIfKKAYRQpI5cZr8aXScLDwqiR+u+V/D2hSFGWoUnc
         qs8A==
X-Gm-Message-State: AOJu0Yz8Yt5Lo0yFzOWMjbB0JR3v/nRRxJ+7dbBqmVRrmebaWMMmM5+x
	7QuHGimCdQni4xVvQiZNG+UVPJG4XZllO4iLwoSjcI33/P0bqNFn
X-Gm-Gg: ASbGnctM7gGE3BvWDhypefRtk8aShowqxUWDgiOuSMytI4JJnI86dTVpXWBB3XIFQL1
	X+9D/5IjOunWB3VOCbDozaYtIe3YEWPXDqmbUYrtMp3HgYyUqb6x5gjShC8rZ8Bv2gKE8K7saoM
	pm2byOax3NQKNsC12fQKEmIJ76rD2Bvy2mGtEmfnRqStMgBafk/WTPZFWFbgPnWidCQvVbr9Emz
	oOIfq7gH/jcX8hdjgL1ip0UzSUeVlkLMBDUoTfawuT73AiOgLgYOLFRyYEQbspALtL3cupjuLjw
	T0FPy3TWbmHUasKwnhsdZfrU61I=
X-Google-Smtp-Source: AGHT+IH8jW27+8JaUGTYYMDMAU5yV9OwwXbvae/Zx3ZnMg2tD9vv5tXgKp31/uaQNJ+dFu8EBSQEvA==
X-Received: by 2002:a05:6000:2c5:b0:385:f470:c2c6 with SMTP id ffacd0b85a97d-38bf5655464mr15558544f8f.11.1737476760794;
        Tue, 21 Jan 2025 08:26:00 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32754f5sm14003967f8f.79.2025.01.21.08.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 08:26:00 -0800 (PST)
Message-ID: <0f95eab6-489e-4be4-9add-5b0c5b39532a@gmail.com>
Date: Tue, 21 Jan 2025 17:25:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] npm based packages omit dependencies since Yocto 5.1
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <264405d9-4f89-4102-acf2-320e73235a59@gmail.com>
 <CA+chaQePYP7LVSK_Fxbuf-+MexZVwUpnn35CO7=2Ji3xB3nZeA@mail.gmail.com>
 <181CB1A49703171B.28835@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <181CB1A49703171B.28835@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 16:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210104

The recent changes in Yocto master with the unmodified recipe didn't help.
But npmsw://...;destsuffix=npm in the recipe did.

Thanks again!

2025. 01. 21. 12:27 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> That's it! ;destsuffix=npm helped with Yocto 5.1.
> Thank you very much!
>
> I will re-test with Yocto master and report back.
>
> 2025. 01. 21. 11:53 keltezéssel, Martin Jansa írta:
>> I believe it's the side effect of UNPACKDIR changes, I had to add
>> ;destsuffix=npm in all npmsw:// entries (or ;destsuffix=git where S is
>> set to WORKDIR/git) for dependencies in node_modules to be unpacked
>> where they used to be before.
>>
>> On Tue, Jan 21, 2025 at 11:31 AM Zoltan Boszormenyi via
>> lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
>> wrote:
>>> Hi,
>>>
>>> I have a minimalistic recipe for pm2 (https://www.npmjs.com/package/pm2):
>>> ==================================
>>> node-pm2_5.3.1.bb
>>> ==================================
>>> SUMMARY = "Production process manager for Node.JS applications with a built-in load 
>>> balancer."
>>> HOMEPAGE = "http://pm2.keymetrics.io/"
>>> LICENSE = "AGPL-3.0-or-later"
>>> LIC_FILES_CHKSUM = "file://GNU-AGPL-3.0.txt;md5=9f9fa01c099265d62f73735e404ff8bb"
>>>
>>> SRC_URI = " \
>>>       npm://registry.npmjs.org/;package=pm2;version=${PV} \
>>>       npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
>>>       "
>>>
>>> S = "${UNPACKDIR}/npm"
>>>
>>> inherit npm
>>>
>>> do_install:append () {
>>>           rm -rf ${D}${libdir}/node_modules/pm2/lib/templates/init-scripts/openrc.tpl
>>> }
>>>
>>> RDEPENDS:${PN} = "bash"
>>> ==================================
>>>
>>> Previously this recipe has built and worked correctly under
>>> Yocto 4.3 and 5.0, as in the package included its own internal
>>> dependencies in /usr/lib/node_modules/pm2/node_modules.
>>> Yocto 4.3 ships nodejs 20.8.1, Yocto 5.0 ships nodejs 20.12.2.
>>>
>>> With Yocto 5.1 (node 20.18.0) and master (22.12.0), the package
>>> only has the pm2 module contents in /usr/lib/node_modules/pm2
>>> but no dependencies.
>>>
>>> It seems that at some point, nodejs 20.x LTS upgraded npm
>>> to a version with a breaking change which now flattens the
>>> dependencies into a single level in /usr/lib/node_modules
>>> from the previously accustomed dependency tree in
>>> /usr/lib/node_modules/pm2/node_modules.
>>>
>>> Is there an incantation of EXTRA_OENPM or the npm:// SRC_URI
>>> that would allow either to unflatten the dependency tree, or
>>> include the dependencies as well as the main node module?
>>>
>>> Thanks in advance,
>>> Zoltán Böszörményi
>>>
>>>
>>>
>>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210090): https://lists.openembedded.org/g/openembedded-core/message/210090
> Mute This Topic: https://lists.openembedded.org/mt/110731121/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


