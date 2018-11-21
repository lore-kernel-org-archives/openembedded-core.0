Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB596B40D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 15:47:50 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 430RmQ5qJ9z1qyCf;
	Wed, 21 Nov 2018 16:47:50 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 430RmQ5Lwbz1qrnq;
	Wed, 21 Nov 2018 16:47:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id weLkb1DaCyOz; Wed, 21 Nov 2018 16:47:49 +0100 (CET)
X-Auth-Info: eieq15ALRt3/XjhqG6hP3FaY4Va5x3U1XFABjd/PF0g=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 21 Nov 2018 16:47:49 +0100 (CET)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20181120202107.41029-1-abrodkin@synopsys.com>
	<f9ff2442-e164-d973-6fea-49bfeb9cbbd7@denx.de>
	<CAP9ODKodGomFQXWXnKXo321JjrmqW281H8Li+h5tM1vCMXB3cg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <59cc4223-ea8b-49e4-a105-e5b1a879e09d@denx.de>
Date: Wed, 21 Nov 2018 16:47:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKodGomFQXWXnKXo321JjrmqW281H8Li+h5tM1vCMXB3cg@mail.gmail.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <alexey.brodkin@synopsys.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Wed, 21 Nov 2018 15:47:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/21/2018 04:45 PM, Otavio Salvador wrote:
> On Tue, Nov 20, 2018 at 6:22 PM Marek Vasut <marex@denx.de> wrote:
>> On 11/20/2018 09:21 PM, Alexey Brodkin wrote:
>>> This utility is used for creation of images containing
>>> usable in run-time U-Boot environment.
>>>
>>> As of today this utility is added per-board like here [1]
>>> for Intel Edison board.
>>>
>>> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
>>>
>>> Given there're quite some U-Boot tools that we may want to add later
>>> this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
>>> still for compatibility we provide "u-boot-mkimage" with help
>>> of PROVIDES as well as proposed "u-boot-mkenvimage".
>>>
>>> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>>> Cc: Martin Jansa <martin.jansa@gmail.com>
>>> Cc: Ross Burton <ross.burton@intel.com>
>>> Cc: Marek Vasut <marex@denx.de>
>>> ---
>>>
>>> I may "git grep u-boot-mkimage" in more places:
>>>  1. meta/classes/image_types.bbclass:311:CONVERSION_DEPENDS_u-boot = "u-boot-mkimage-native"
>>>  2. meta/classes/kernel-fitimage.bbclass:7:        depends = "%s u-boot-mkimage-native dtc-native" % depends
>>>  3. meta/classes/kernel-uimage.bbclass:6:        depends = "%s u-boot-mkimage-native" % depends
>>>  4. meta/conf/distro/include/distro_alias.inc:357:DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
>>>
>>> But that's not clear for me if it's required to swap "u-boot-mkimage"
>>> to "u-boot-tools" see:
>>>  1. "u-boot-mkimage" is still a valid recipe as we export ot via PROVIDES
>>>     (or I'm mixing package name with recipe name which very well might be
>>>      the case)
>>>  2. I don't fully understand a mening of "DISTRO_PN_ALIAS".
>>>     If that's a name of a package from some big Linux distro or how target
>>>     utility is named in that distro. For example in Debian Sid there's
>>>     a package named "u-boot-tools" which includes "mkimage", "mkenvimage",
>>>     "fw_printenv", "fw_setenv" and many more while in "distro_alias.inc"
>>>     we still have:
>>>     ---------------->8----------------
>>>     DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
>>>     ---------------->8----------------
>>
>> Just make u-boot-tools RPROVIDE the u-boot-mkimage, and make it generate
>> a u-boot-mkimage package , no ?
> 
> In fact, it should:
> 
> PROVIDE += "u-boot-mkimage"
> 
> So dependencies are going to keep working; as Richard said, it should
> use the new name for the sake of correctness though.
> 
> The package split will define how it will need to be handled for the
> runtime counterpart.
> 
> If we adopt:
> 
> PACKAGES += "${PN}-mkimage ${PN}-mkenvimage"
> 
> Then we need to add:
> 
> RPROVIDES_${PN}-mkimage = "u-boot-mkimage"
> RREPLACES_${PN}-mkimage = "u-boot-mkimage"
> RCONFLICTS_${PN}-mkimage = "u-boot-mkimage"
> 
> So it provides the upgrade path to the original package.
> 
> (this is my vote, btw)

Cool, all right.

-- 
Best regards,
Marek Vasut

