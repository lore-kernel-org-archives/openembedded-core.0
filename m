Return-Path: <stefan@herbrechtsmeier.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C164C433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 16:39:38 +0000 (UTC)
Received: from dd43212.kasserver.com (dd43212.kasserver.com [85.13.165.135])
 by mx.groups.io with SMTP id smtpd.web11.10542.1644165576806663864
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 08:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: herbrechtsmeier.net,
 ip: 85.13.165.135, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.45] (i5E8667C7.versanet.de [94.134.103.199])
	by dd43212.kasserver.com (Postfix) with ESMTPSA id DEE9543C0C0E;
	Sun,  6 Feb 2022 17:39:33 +0100 (CET)
Message-ID: <fde77e2c-28ad-3f94-127b-e02fe9d6c5c7@herbrechtsmeier.net>
Date: Sun, 6 Feb 2022 17:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Minimize udev package size if
 DISTRO_FEATURES contains systemd
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220202073525.3413-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220202073525.3413-3-stefan.herbrechtsmeier-oss@weidmueller.com>
 <4cd9f1953e5a5a3287325f4cbec5c2a9e9aa84fb.camel@linuxfoundation.org>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
In-Reply-To: 
 <4cd9f1953e5a5a3287325f4cbec5c2a9e9aa84fb.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 16:39:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161402

Am 06.02.22 um 09:10 schrieb Richard Purdie:
> On Wed, 2022-02-02 at 08:35 +0100, Stefan Herbrechtsmeier wrote:
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> Link udev shared with systemd helper to minimize the udev package size
>> if DISTRO_FEATURES contains systemd.
>>
>> It is only usefull to link udev static with systemd helper if udev
>> should be installed without systemd.
>>
>> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> ---
>>
>> (no changes since v1)
>>
>>   meta/recipes-core/systemd/systemd_249.7.bb | 1 +
>>   1 file changed, 1 insertion(+)
> 
> 
> This seems to break some of our tests:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/4708
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3121
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3085
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3089
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3127
> 
> Presumably it causes extra dependencies to be pulled in causing the file overlap
> where there was previously none.

Sorry, I was told sysvinit with systemd isn't a valid use case anymore.

Would it be okay to enable it only if sysvinit isn't in distro?

Otherwise reject the change because it is impossible to know if a 
dependency between udev and systemd is okay or not.

Regads
   Stefan

