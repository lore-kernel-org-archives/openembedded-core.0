Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id B02B57E28B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 12:24:01 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47q3wy3StYz1qt91;
	Fri,  3 Jan 2020 13:24:02 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47q3wy3B3mz1qr2s;
	Fri,  3 Jan 2020 13:24:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id aNDfLraK861b; Fri,  3 Jan 2020 13:24:00 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Fri,  3 Jan 2020 13:24:00 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 061DC45404DC;
	Fri,  3 Jan 2020 13:24:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Xk3LxyZC33J1; Fri,  3 Jan 2020 13:23:58 +0100 (CET)
Received: from [192.168.178.89] (stefano-MacBookPro.fritz.box [192.168.178.89])
	by babic.homelinux.org (Postfix) with ESMTPS id 1A0D7454048E;
	Fri,  3 Jan 2020 13:23:58 +0100 (CET)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefano Babic <sbabic@denx.de>, openembedded-core@lists.openembedded.org
References: <20200103101536.2561-1-sbabic@denx.de>
	<67936cf2c289480b0a9b94b7ca52ba2e061c0fad.camel@linuxfoundation.org>
	<0619cd66-1a7e-78a2-964d-8bafdc97e025@denx.de>
	<b2fa4667eafee81a7ca69ebfcb4861b3bc4bfe96.camel@linuxfoundation.org>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <b1ae1136-3a7b-dfff-743f-1b709b0d3c6b@denx.de>
Date: Fri, 3 Jan 2020 13:23:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b2fa4667eafee81a7ca69ebfcb4861b3bc4bfe96.camel@linuxfoundation.org>
Subject: Re: [PATCH V3] u-boot-fw-utils: Add support for libubootenv
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jan 2020 12:24:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

On 03/01/20 12:18, Richard Purdie wrote:
> On Fri, 2020-01-03 at 12:05 +0100, Stefano Babic wrote:
>> On 03/01/20 11:40, Richard Purdie wrote:
>>> On Fri, 2020-01-03 at 11:15 +0100, Stefano Babic wrote:
>>>> libubootenv is a replacement for u-boot-fw-utils. It is
>>>> hardware-independent and provides fw_printenv and fw_setenv tools
>>>> that
>>>> are full compatible with the ones provided by U-Boot. A library
>>>> is
>>>> provided to access the environment from an own application.
>>>> License is LGPL-2.1 and this allow to link the library to
>>>> proprietary
>>>> code. The user of the tools should install the configuration file
>>>> "fw_env.config", as he is already used to with u-boot-fw-utils.
>>>> The
>>>> configuration file is compatible with u-boot-fw-utils.
>>>>
>>>> +PROVIDES += "u-boot-fw-utils"
>>>> +RPROVIDES_${PN} += "u-boot-fw-utils"
>>>
>>> What is the ultimate intention/end goal here? Does this replace u-
>>> boot-
>>> fw-utils? 
>>
>> Frankly speaking, yes. The topic was discussed more as a year ago on
>> U-Boot's ML, and libubootenv is the result of this (long) discussion:
>> 	
>> http://u-boot.10912.n7.nabble.com/SWUpdate-U-Boot-environment-library-dependency-tt340530.html#none
>>
>> One of the major goal is to solve the fragile connection between u-
>> boot U-Boot's ML, and libubootenv is the result of this (long)
>> discussion:
> 
>> has always been a pitfall, specially when projects sets a custom BSP
>> layer replacing U-Boot with a custom recipe, and then people wonder
>> why board is bricked. Licensing (LGPL2.1 instead of GPLv2) is another
>> major goal, too, that libubootenv solves.
> 
> Thanks, this was a leading question as I suspected this might be the
> case. I think there will be less push back from people about a new
> recipe if it is clear its a replacement,

Ok

> it has the backing of upstream
> and it has compatibility, all of which seems to be the case.

Yes, it is.

> 
> People on this list won't have seen the other discussion so this is
> important context to add for them. Its worth putting in the commit
> message too since others may look at the commit later to find out what
> they need to do to migrate.

Of course, I will add it to commit message.

> 
>>> Should we remove the other recipe?
>>
>> libubootenv is thought to be full compatible with u-boot-fw-utils,
>> and it was already pushed in many projects. So yes, my proposal and
>> final goal is then to drop u-boot-fw-utils.
>>
>> Anyway, I do not know if you prefer to have a "transition" time with
>> both recipes or it is fine for you to drop soon u-boot-fw-utils.
> 
> My personal perspective in this context is we should replace. The
> PROVIDES you add means the original recipe is effectively masked out
> anyway.
> 
> Your patch needs to update the maintainers.inc file to reflect the new
> recipe name (it would fail in testing now as it doesn't add a
> maintainer for the new recipe).

Thanks, I'll do in V4.

Regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

