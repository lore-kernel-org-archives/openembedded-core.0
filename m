Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EDCC61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 14:10:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.137906.1700835008120498766
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 06:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=R1jOTLoG;
 spf=pass (domain: baylibre.com, ip: 209.85.128.43, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40b27726369so13815755e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 06:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700835006; x=1701439806; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gl1OXmqw8pXpLbmwn7B1xk3pV6T8dMBY3fb0YofmrP8=;
        b=R1jOTLoGr8pRR8ohRc1HmizuIt8tP8ompoboamD2WpDd8QrvE6zlw1qGLTL1ui/qL+
         lRea+eiBRhcauAvnpokPFOhbQ4LjsFE3H+BTrYpexPhH1LAStcYtuKOtaq2A6I3AZTUN
         +n3+FLhSa2fNJevWtTZ2RvibjmRWBXnJwVKaVBhvuwNG4AgsG0XzyMhQ/NyP3tY/+wHW
         ypxuQwrTEHOtnElGVO3UG4fHdPKHjFeBUVIETRgChQGyPZjSErfndYyaf2llhsNTf1D+
         s64aRuyRA3rsubjuuOuazOX2pzeZyPsoIxd4/e9IBjE9UCNu6WP2yu/HP/XM7HNbF/FO
         BMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700835006; x=1701439806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gl1OXmqw8pXpLbmwn7B1xk3pV6T8dMBY3fb0YofmrP8=;
        b=PGVcAZyLhc2MZaRibq/3brx77syYjMj8QVSXhaYX/a9sMPUjeyepY88hkim+U2TF2K
         yvQkdwPxc5LQAhjfweAy7OxvJTSWOZmeIk/xuST03xNdfA4zUzz8aWY0JFvtv8z9cNW9
         cvVMS+YlFPcyYRsulyH5c67F6ALAfSyN1oByVLiRH26cyfdadtYPaL51w0t27l+Mb20r
         XdsxCDtuxS+wwWjZUL2GQWQnVsQXmzMxTiTl/7hXkyclDNfhqYp1P8e6lRLKk4Qn01Ga
         EkE+jzgaPXOLOnz8JFS1lxJjx0vqlGMjqX4Rdw7p7R0v91eOd2pLVcxlXjyLpWbAA1kk
         nkOA==
X-Gm-Message-State: AOJu0YxNYdhwj0qtjBodUdWq6zvC/RaKvT3er4F5kAVI2bDNbpnk0UWH
	C7g+HIIAE7RLqYWPG3JyNA165A==
X-Google-Smtp-Source: AGHT+IGCX2rZ6R74fylH0bUOOT6qj/v9XmeNLnhfqndmsa4VR2wfsupxC6UsyODh4vGZsDbbA7fnfA==
X-Received: by 2002:a05:600c:3b16:b0:3fe:ba7:f200 with SMTP id m22-20020a05600c3b1600b003fe0ba7f200mr2488174wms.20.1700835006012;
        Fri, 24 Nov 2023 06:10:06 -0800 (PST)
Received: from [192.168.178.55] ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id p18-20020a05600c359200b0040b360cc65csm5153404wmq.0.2023.11.24.06.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 06:10:05 -0800 (PST)
Message-ID: <84c99b9f-518d-492d-bffb-0f9bd4c633d1@baylibre.com>
Date: Fri, 24 Nov 2023 14:10:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC 2/2] useradd.bbclass: ensure sysroot_setscene for
 DEPENDS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <cover.1700746611.git.pidge@baylibre.com>
 <c6d2ae3913582947c046d577a9dbf6dc8629909a.1700746611.git.pidge@baylibre.com>
 <12a072dc57477bc7a07847718a34bd75dab9abeb.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?=
 <pidge@baylibre.com>
In-Reply-To: <12a072dc57477bc7a07847718a34bd75dab9abeb.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 14:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191195

On 23/11/2023 14:11, Richard Purdie wrote:
> On Thu, 2023-11-23 at 13:49 +0000, Eilís 'pidge' Ní Fhlannagáin wrote:
>> [YOCTO #13419]
>>
>> If recipeB creates a user and assigns it to a group created in recipeA,
>> we need to ensure two things:
>>
>> That recipeA is in recipeB's DEPENDS (documentation issue) and that the
>> sysroot setscene, in the case of a TMPDIR wipeout, is in
>> USERADDSETSCENEDEPS.
>>
>> RP and I discussed adding a USERADD_DEPENDS variable to deal with this,
>> but there is some magic around DEPENDS that a new variable wouldn't have
>> so I'm sending this as is for people to poke at.
> 
> Can you be more specific about this "magic"?
> 
> I'm still worrying that DEPENDS is too broad, there are many more
> things in there which we don't want listed as setscene dependencies and
> I think this needs to be more precise.
> 
> Cheers,
> 
> Richard

The interesting thing here is if we do something like:

python __anonymous() {
     setscenedeps = ""
     if "-native" not in d.getVar("PN") and d.getVar("USERADD_DEPENDS") 
is not None:
         for pkg in d.getVar("USERADD_DEPENDS").split():
             setscenedeps += " %s:do_populate_sysroot_setscene " % pkg
         d.setVar("USERADDSETSCENEDEPS", "%s %s" % 
(d.getVar("USERADDSETSCENEDEPS"), setscenedeps))
}

we end up throwing:

ERROR: creategroup2-1.0-r0 do_prepare_recipe_sysroot: The sstate 
manifest for task 'creategroup1:populate_sysroot' (multilib variant '') 
could not be found.
The pkgarchs considered were: qemux86_64, core2-64, x86_64, allarch, 
none_none-nativesdk.
But none of these manifests exists:
 
/home/pidge/poky/build/tmp/sstate-control/manifest-qemux86_64-creategroup1.populate_sysroot
 
/home/pidge/poky/build/tmp/sstate-control/manifest-core2-64-creategroup1.populate_sysroot
 
/home/pidge/poky/build/tmp/sstate-control/manifest-x86_64-creategroup1.populate_sysroot
 
/home/pidge/poky/build/tmp/sstate-control/manifest-allarch-creategroup1.populate_sysroot
 
/home/pidge/poky/build/tmp/sstate-control/manifest-none_none-nativesdk-creategroup1.populate_sysroot

The weird thing (hence this being an RFC), is that the patch I sent 
doesn't throw this. At first, I thought it was something happening with 
a polluted sstate but I don't think so now. I am absolutely unsure as to 
why that would be, BUT my suspicion is that this error is related to 
14961 (which I'm still poking at).

-- 
Eilís 'pidge' Ní Fhlannagáin
BayLibre - At the Heart of Embedded Linux
www.baylibre.com


