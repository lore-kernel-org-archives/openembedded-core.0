Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52607ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 22:50:26 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.66.1662072618431778736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 15:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 281Ml1nu010375;
	Thu, 1 Sep 2022 17:47:01 -0500
Message-ID: <39e25aa4-450b-8bd5-57c8-9ac1092e695b@kernel.crashing.org>
Date: Thu, 1 Sep 2022 17:47:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [Openembedded-architecture] Configuration fragments
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        Joshua Watt <JPEWhacker@gmail.com>,
        Alexander Kanavin <alex@linutronix.de>,
        openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>
References: <20220817131023.4093773-1-alex@linutronix.de>
 <20220817131023.4093773-2-alex@linutronix.de>
 <bff578854db1852bc0891463e6eecd3c892876bd.camel@linuxfoundation.org>
 <CANNYZj-1c9cd1Q9LodoxrMxkhBTbOTdg3gb=TVyVdWJ6inMO4w@mail.gmail.com>
 <d3d5ec04d1b0caec5f0e8f7578e40b3f055e10d9.camel@linuxfoundation.org>
 <CANNYZj8vXyK0erJ9AGBSiUsuskKXCUY6PPGiZshOf-0Gcak-fA@mail.gmail.com>
 <65b62446fc6c2c3d873ca6113f590be95ee27bf8.camel@linuxfoundation.org>
 <CANNYZj_YxkraY46KvFxXMxBATx-FAgqNWGfFdJnJAHUcbN9+OQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: 
 <CANNYZj_YxkraY46KvFxXMxBATx-FAgqNWGfFdJnJAHUcbN9+OQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 22:50:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170229

Wind River already has a mechanism to do something like this, called templates.

https://github.com/WindRiver-Labs/wr-template/tree/WRLINUX_10_21_BASE

Each template can have (optionally):

#   README - template README file
#   require - list of other templates required for this one
#   template.conf - template configuration fragment
#   image.inc - image fragment
#   bsp-pkgs.conf - BSP specific configuration fragment
#   bsp-pkgs.inc - BSP specific image fragment

# The 'bsp-pkgs' files can only be in a template in a layer that provides a
# specific conf/machine/${MACHINE}.conf file and layers it may contain,
# otherwise they will be ignored

I'm not saying what is implemented is a perfect solution, but it made a 
'configuration fragment' approach to system configuration much easier when I 
worked with it.

(For examples see: 
https://github.com/WindRiver-Labs/wrlinux/tree/WRLINUX_10_21_BASE/templates/feature)

You could do things (in your local.conf, or machine.conf or distro.conf) like:

WRTEMPLATE += "dpdk"

This would add the dpdk recipes to your image and also configure the kernel for 
dpdk.

https://github.com/WindRiver-Labs/wrlinux/tree/WRLINUX_10_21_BASE/templates/feature/dpdk

--Mark

On 9/1/22 10:29 AM, Alexander Kanavin wrote:
> On Thu, 18 Aug 2022 at 11:27, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> The intent is the user could add something like:
>>
>> require conf/yocto-autobuilder/x32.inc
>>
>> or
>>
>> require conf/yocto-autobuilder/multilib-mipsn32.inc
>>
>> and similar to their local.conf and more easily replicate
>> configurations.
> 
> This could be a subset of a broader feature, one that allows adding
> and removing pre-canned 'config fragments' to local.conf. The proposal
> is to have such fragments live in
> meta-somelayer/conf/fragments/path/to/some/fragment (I think allowing
> multiple levels is beneficial here), and each fragment would start
> with a comment explaining what it does followed by the actual
> settings.
> 
> Then adding fragments can be done by appending them to local.conf, and
> removing by looking for markers in local.conf and editing it out,
> which probably could use a helper tool/subcommand.
> 
> Layers could also declare 'non-optional' fragments which get included
> automatically by the fact of including the layer into the build, which
> means layer.conf can go back to being short and sweet and to the
> point.
> 
> Thoughts?
> 
>> I would like to see if we can switch the eSDK to use the json format
>> btw. I suspect that may be one of your next steps? :)
> 
> I don't think I understand this, can you explain?
> 
> Alex
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1627): https://lists.openembedded.org/g/openembedded-architecture/message/1627
> Mute This Topic: https://lists.openembedded.org/mt/93398201/3616948
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

