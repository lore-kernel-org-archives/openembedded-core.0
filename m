Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0404760166
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 15:20:39 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id A18037CD; Tue,  7 Jan 2014 16:20:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from [192.168.1.65] (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 5630E60E;
	Tue,  7 Jan 2014 16:20:44 +0100 (CET)
Message-ID: <52CC1B45.9010808@free-electrons.com>
Date: Tue, 07 Jan 2014 16:20:37 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Organization: Free Electrons
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>
	<20140107143558.GQ3709@jama>
In-Reply-To: <20140107143558.GQ3709@jama>
X-Enigmail-Version: 1.5.2
Cc: darren.hart@intel.com, Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: use oldnoconfig instead of yes '' | make oldconfig
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
X-List-Received-Date: Tue, 07 Jan 2014 15:20:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/01/2014 15:35, Martin Jansa wrote:
> On Tue, Jan 07, 2014 at 03:18:37PM +0100, Alexandre Belloni wrote:
>> When using a defconfig, using yes '' | make oldconfig may not result in
>> the correct configuration being set. For example:
> 
>>  $ grep USB_ETH .config
>>  CONFIG_USB_ETH=y
>>  CONFIG_USB_ETH_RNDIS=y
>>  CONFIG_USB_ETH_EEM=y
>>  $ make savedefconfig
>>  scripts/kconfig/conf --savedefconfig=defconfig Kconfig
>>  $ cp defconfig .config
>>  ‘defconfig’ -> ‘.config’
>>  $ yes '' | make oldconfig
>>  [...]
>>  #
>>  # configuration written to .config
>>  #
>>  $ grep USB_ETH .config
>>  CONFIG_USB_ETH=m
>>  CONFIG_USB_ETH_RNDIS=y
>>  CONFIG_USB_ETH_EEM=y
>>
>> Using make olddefconfig solves that but we'll use oldnoconfig for
>> backward compatibility with older kernels.
> 
> Looks good, I have few kernel recipes where I had to fixup resulting
> .config after "make savedefconfig", "yes '' | make oldconfig" combo
> exactly because of some =y changing to -m.
> 
> 1) Do you know since when oldnoconfig is supported?
> 
> IIRC oldest kernel I've in BSPs is 2.6.24. 

oldnoconfig seems to be present since 2.6.36. olddefconfig is an alias
that appeared with fb16d8912db5268f29706010ecafff74b971c58d which is
present since v3.7.

Then hat about using:

oe_runmake oldnoconfig || yes '' | oe_runmake oldconfig

> 
> 2) Could you send similar patch for
> meta-openembedded/meta-oe/recipes-kernel/linux/linux.inc
> ?
> 

Sure, will do once we agreed on this patch



-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

