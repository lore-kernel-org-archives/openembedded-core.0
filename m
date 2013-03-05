Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UCnQQ-0006QA-8p
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 09:40:52 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r258O7OD027237
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Mar 2013 00:24:07 -0800 (PST)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 5 Mar 2013 00:24:07 -0800
Message-ID: <5135ABA5.1060803@windriver.com>
Date: Tue, 5 Mar 2013 16:24:05 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1362217827.git.liezhi.yang@windriver.com>
	<1362224344.11004.14.camel@ted> <5133852E.2010504@linux.intel.com>
	<513394C2.6030004@linux.intel.com> <5134A4BD.9030201@windriver.com>
	<1362406238.29587.28.camel@ted>
In-Reply-To: <1362406238.29587.28.camel@ted>
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] Fully support ext3/ext4 rootfs generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 08:40:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/04/2013 10:10 PM, Richard Purdie wrote:
> On Mon, 2013-03-04 at 21:42 +0800, Robert Yang wrote:
>>
>> On 03/04/2013 02:21 AM, Darren Hart wrote:
>>>
>>>
>>> On 03/03/2013 09:15 AM, Darren Hart wrote:
>
>> Yes, we do have hard links in the rootfs, e.g: core-image-sato and
>> core-image-sato-sdk:
>>
>> # The sato
>> $ find core-image-sato/1.0-r0/rootfs/ -type f -printf "%p %i %n\n" | grep -v '1$'
>> core-image-sato/1.0-r0/rootfs/etc/terminfo/v/vt200 26977609 2
>> core-image-sato/1.0-r0/rootfs/etc/terminfo/v/vt220 26977609 2
>> core-image-sato/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld.bfd 26978690 2
>> core-image-sato/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld 26978690 2
>
> What if the count was 11? or 21? I'm just mentioning we need to improve
> that command!
>
>> # The sato-sdk:
>> $ find core-image-sato-sdk/1.0-r0/rootfs/ -type f -printf "%p %i %n\n" | grep -v
>> '1$'
>> core-image-sato-sdk/1.0-r0/rootfs/etc/terminfo/v/vt200 26903519 2
>> core-image-sato-sdk/1.0-r0/rootfs/etc/terminfo/v/vt220 26903519 2
>> core-image-sato-sdk/1.0-r0/rootfs/usr/include/et/com_err.h 28058656 2
>> core-image-sato-sdk/1.0-r0/rootfs/usr/include/com_err.h 28058656 2
>> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld.bfd 26900939 2
>> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/perlbug 26899680 2
>> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/gawk-4.0.1 26900368 2
>> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/psed 26899667 2
>> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/s2p 26899667 2
>> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/c2ph 26899695 2
>> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/perlthanks 26899680 2
>> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/pstruct 26899695 2
>> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/arm-poky-linux-gnueabi-ld 26900939 2
>> core-image-sato-sdk/1.0-r0/rootfs/usr/bin/gawk 26900368 2
>
> I'm slightly surprised there aren't more hardlinks for gcc in here. A
> meta-toolchain-sdk tarball will probably have a load of hardlinks in too
> if you want something to test with (we don't usually make extX images
> for the toolchain though).
>

The hardlinks result from the meta-toolchain-sdk is similar:

$ find sdk/image/opt/poky/1.3+snapshot/sysroots/ -type f -printf "%p %i %n\n" | 
grep -v ' 1$'
sdk/image/opt/poky/1.3+snapshot/sysroots/armv5te-poky-linux-gnueabi/etc/terminfo/v/vt200 
27337495 2
sdk/image/opt/poky/1.3+snapshot/sysroots/armv5te-poky-linux-gnueabi/etc/terminfo/v/vt220 
27337495 2
sdk/image/opt/poky/1.3+snapshot/sysroots/armv5te-poky-linux-gnueabi/usr/include/et/com_err.h 
27468703 2
sdk/image/opt/poky/1.3+snapshot/sysroots/armv5te-poky-linux-gnueabi/usr/include/com_err.h 
27468703 2
sdk/image/opt/poky/1.3+snapshot/sysroots/armv5te-poky-linux-gnueabi/usr/bin/gawk-4.0.1 
27297079 2
sdk/image/opt/poky/1.3+snapshot/sysroots/armv5te-poky-linux-gnueabi/usr/bin/gawk 
27297079 2
sdk/image/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/etc/terminfo/v/vt200 
27469810 2
sdk/image/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/etc/terminfo/v/vt220 
27469810 2
sdk/image/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/armv5te-poky-linux-gnueabi/arm-poky-linux-gnueabi-ld.bfd 
27484702 2
sdk/image/opt/poky/1.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/armv5te-poky-linux-gnueabi/arm-poky-linux-gnueabi-ld 
27484702 2

I wonder what's next step please, can we ignore the sparse files at the moment,
and then I will send an patch for review with the hardlink fixes.

// Robert

> Cheers,
>
> Richard
>
>
>


