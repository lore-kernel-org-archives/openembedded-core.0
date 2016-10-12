Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 909DE6074F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 20:21:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9CKLcCs016582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Oct 2016 13:21:38 -0700 (PDT)
Received: from [128.224.56.235] (128.224.56.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 13:21:37 -0700
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>, Bruce Ashfield
	<bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <1475513685-18627-1-git-send-email-bruce.ashfield@windriver.com>
	<CAMKF1soRbsU8iV35jxKnRfrcvsobF20p_u14EfRZ5uee_9N+gg@mail.gmail.com>
	<CAMKF1src3Dj1p+E5p+6QEu213dkFSFMOtDKx3hoJFT+hKvHn9Q@mail.gmail.com>
	<CAMKF1soOP+440ZhymX8wFHu-Et=77NhscQqm4M8T2i=wQhmGNg@mail.gmail.com>
	<CADkTA4NT6ynC61Pd_qRhwL8phc3Wzx0kXw=bzaDUAa8Or485ng@mail.gmail.com>
	<3ea3b10b-1072-0d3a-8e6b-be082214e5d1@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AA013A2F5C37@SAN-EXCH-DR.corp.ad.wrs.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <731480a7-99a7-9da4-c4ee-f5638f8fbe2b@windriver.com>
Date: Wed, 12 Oct 2016 16:21:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA013A2F5C37@SAN-EXCH-DR.corp.ad.wrs.com>
X-Originating-IP: [128.224.56.235]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: if_tunnel: remove include of if/ip/in6.h
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
X-List-Received-Date: Wed, 12 Oct 2016 20:21:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-08 09:17 PM, Huang, Jie (Jackie) wrote:
>
>
>> -----Original Message-----
>> From: MacLeod, Randy
>> Sent: Friday, October 07, 2016 4:54 AM
>> To: Bruce Ashfield; Khem Raj; Huang, Jie (Jackie)
>> Cc: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH] linux-libc-headers: if_tunnel: remove include of if/ip/in6.h
>>
>> On 2016-10-03 08:27 PM, Bruce Ashfield wrote:
>>>
>>> It's something we could drop in the future, but these are mods that have
>>> been done since -rc4, and could very well be undone if they start
>>> breaking things like this.
>>>
>>> The alternative is to try and fix the userspace applications, but I
>>> currently don't see a fast way to do that (and I'm now officially on
>>> vacation).
>>>
>>
>> I've sent a fix to the net-tools list:
>>
>> https://sourceforge.net/p/net-tools/mailman/net-tools-devel/?viewmonth=201610
>>
>> Jackie will be back at work on Saturday and he'll revert
>> Bruce's change, test all qemu builds and boot an image
>> to test iptunnel before sending a patch to the list.
>
> I just sent patches for this to the list.
>
> Thanks,
> Jackie


Jackie,

Thanks for fixing the net-tools bug. A fedora dev acked the patch
on the SF list so hopefully it will be integrated upstream.

Bruce, Khem

What, if anything, should we do about the other yocto specific changes 
to linux-libc-headers:

$ ls -1 meta/recipes-kernel/linux-libc-headers/linux-libc-headers
0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
0001-ppp-fix-in-if.h-includes.patch
0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch
0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch

It seems like some of the patches (ppp) could be addressed and
dropped and that we should do that before releasing oe-core-2.2
or wait for 2.3.

../Randy


$ git log 
meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch


commit 12451a412fb7b5706c1553618ee7b704234876cc
Author: Bruce Ashfield <bruce.ashfield@windriver.com>
Date:   Mon Oct 3 01:54:36 2016 -0400

     linux-libc-headers: fix in/if.h includes

     The following kernel commits broke the compilation of ppp, due to 
redefined
     structures.

     Nothing else breaks in userspace with or without these uapi 
changes, so we
     revert them to keep everything building.

        commit 05ee5de7451796cf9a8aeb2f05a57790d4fd2336
        Author: Mikko Rapeli <mikko.rapeli@iki.fi>
        Date:   Mon Aug 22 20:32:42 2016 +0200

            include/uapi/linux/if_pppol2tp.h: include linux/in.h and 
linux/in6.h

            Fixes userspace compilation errors like:

            error: field <E2><80><98>addr<E2><80><99> has incomplete type
             struct sockaddr_in addr; /* IP address and port to send to */
                                ^
            error: field <E2><80><98>addr<E2><80><99> has incomplete type
             struct sockaddr_in6 addr; /* IP address and port to send to */

            Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
            Signed-off-by: David S. Miller <davem@davemloft.net>




>
>>
>> In oe-core-2.3, we should probably drop net-tools completely or
>> at least from packagegroup-core-full-cmdline.bb since iproute2
>> replaces it:
>>    http://xmodulo.com/linux-tcpip-networking-net-tools-iproute2.html
>>
>> ( and I'm now officially on vacation for a few days. :) )
>>
>>
>> --
>> # Randy MacLeod. SMTS, Linux, Wind River
>> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,
>> Canada, K2K 2W5
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

