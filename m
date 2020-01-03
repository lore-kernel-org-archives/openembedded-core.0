Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 51A2E7D2E6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 11:05:53 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47q2Bp4MnXz1rfPW;
	Fri,  3 Jan 2020 12:05:54 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47q2Bp43bpz1qr2j;
	Fri,  3 Jan 2020 12:05:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id lV_591QvWqoa; Fri,  3 Jan 2020 12:05:53 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Fri,  3 Jan 2020 12:05:53 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 5C4C945404DC;
	Fri,  3 Jan 2020 12:05:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id fFyGCDVV5oe9; Fri,  3 Jan 2020 12:05:50 +0100 (CET)
Received: from [192.168.178.89] (stefano-MacBookPro.fritz.box [192.168.178.89])
	by babic.homelinux.org (Postfix) with ESMTPS id 8C44C454037B;
	Fri,  3 Jan 2020 12:05:50 +0100 (CET)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefano Babic <sbabic@denx.de>, openembedded-core@lists.openembedded.org
References: <20200103101536.2561-1-sbabic@denx.de>
	<67936cf2c289480b0a9b94b7ca52ba2e061c0fad.camel@linuxfoundation.org>
From: Stefano Babic <sbabic@denx.de>
Message-ID: <0619cd66-1a7e-78a2-964d-8bafdc97e025@denx.de>
Date: Fri, 3 Jan 2020 12:05:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <67936cf2c289480b0a9b94b7ca52ba2e061c0fad.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 03 Jan 2020 11:05:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

On 03/01/20 11:40, Richard Purdie wrote:
> On Fri, 2020-01-03 at 11:15 +0100, Stefano Babic wrote:
>> libubootenv is a replacement for u-boot-fw-utils. It is
>> hardware-independent and provides fw_printenv and fw_setenv tools
>> that
>> are full compatible with the ones provided by U-Boot. A library is
>> provided to access the environment from an own application.
>> License is LGPL-2.1 and this allow to link the library to proprietary
>> code. The user of the tools should install the configuration file
>> "fw_env.config", as he is already used to with u-boot-fw-utils. The
>> configuration file is compatible with u-boot-fw-utils.
>>
> 
>> +PROVIDES += "u-boot-fw-utils"
>> +RPROVIDES_${PN} += "u-boot-fw-utils"
> 
> What is the ultimate intention/end goal here? Does this replace u-boot-
> fw-utils? 

Frankly speaking, yes. The topic was discussed more as a year ago on
U-Boot's ML, and libubootenv is the result of this (long) discussion:

	http://u-boot.10912.n7.nabble.com/SWUpdate-U-Boot-environment-library-dependency-tt340530.html#none

One of the major goal is to solve the fragile connection between u-boot
and u-boot-fw-utils. The need to syncronize u-boot with u-boot-fw-utils
has always been a pitfall, specially when projects sets a custom BSP
layer replacing U-Boot with a custom recipe, and then people wonder why
board is bricked. Licensing (LGPL2.1 instead of GPLv2) is another major
goal, too, that libubootenv solves.

> Should we remove the other recipe?

libubootenv is thought to be full compatible with u-boot-fw-utils, and
it was already pushed in many projects. So yes, my proposal and final
goal is then to drop u-boot-fw-utils.

Anyway, I do not know if you prefer to have a "transition" time with
both recipes or it is fine for you to drop soon u-boot-fw-utils.

Best regards,
Stefano

-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

