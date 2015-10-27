Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 719A87570D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 00:40:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9R0ermW001707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 17:40:53 -0700
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 26 Oct 2015 17:40:52 -0700
To: <openembedded-core@lists.openembedded.org>
References: <562E3896.6080405@windriver.com>
	<1445875841.5251.107.camel@pbcl.net> <562E58BE.9060003@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <562EC814.4080508@windriver.com>
Date: Mon, 26 Oct 2015 19:40:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <562E58BE.9060003@windriver.com>
Subject: Re: Prelink problems -- need help!
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
X-List-Received-Date: Tue, 27 Oct 2015 00:40:56 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/26/15 11:45 AM, Mark Hatle wrote:
> On 10/26/15 11:10 AM, Phil Blundell wrote:
>> [Cc list trimmed]
>>
>> On Mon, 2015-10-26 at 09:28 -0500, Mark Hatle wrote:
>>> As you can see, pretty much everything is currently broken and I'm
>>> struggling to
>>> find community people with the right skill sets to help me resolve
>>> the issues.
>>
>> I think it's true that prelink is a technology which has largely had
>> its day, and I could well imagine that upstream Red Hat is no longer
>> very interested in it.  https://fedorahosted.org/fesco/ticket/1183 has
>> a summary of some of the reasons why.
>>
>> Before investing any significant amount of time in fixing up prelink
>> (and from what you've described it sounds like it might indeed be a
>> significant effort to get it working again on all platforms) it might
>> be a good idea to make sure we are still convinced that prelink
>> provides useful and meaningful benefits for OE-core users.
>>
> 
> I do think prelink has a purpose.  Especially for embedded systems.
> 
> The biggest reason I see against prelink is ASLR.  I agree 100% that if you want
> ASLR (Address Randomization) you should not be using the prelinker.
> 
> Usually secondary reasons include if you are doing field upgrades at a package
> level -- it means you also need the ability to prelink on the device which cause
> have other performance ramifications and such during this upgrade process.
> 
> I agree with some of the information on the Fedora hosted link you pointed to,
> but disagree with others.
> 
> While some of the modern hashing techniques and such do improve run-time dynamic
> link performance, there is still a hit that we must take.  For devices that need
> quick boot times, quick startup, or are memory constrained, the prelinker can
> still help.  (Memory usage on very small systems is a good example.  Memory
> usage can be reduced in larger applications by reducing the number of
> Copy-on-write pages required to handle the relocation information.)
> 
> I probably would not use the prelinker on a workstation/server any longer.  I
> might not use it on a 'larger' embedded system, but on a more traditional
> embedded system I do think it still has merit.
> 
> (Probably a discussion for the future, due to the ASLR, is should the prelinker
> be enabled by default -- even if it works -- but that is a discussion for later.)
> 
>> If the answer to that is yes then I probably could spare a bit of time
>> to look at the ARM and MIPS issues at least.
> 
> I can certainly use any help you have.  I have someone looking into the ARM
> issues with me.  It APPEARS the primary behavior there has to do with IFUNC
> behavior to things like memcpy has changed, causing the prelinker to do the
> wrong thing(s).  But I have few additional details at this time.
> 
> I've reached out to parts of the MIPS community for help, but we'll see if I get
> any type of response.  (MIPS, especially 32-bit, I'm very surprised has broken
> recently.  I haven't seen many changes in regard to the way binaries are loaded
> on MIPS -- so the issue must be related to a more fundamental optimization or
> bug in the prelink.)
> 
> Thanks for the offer, let me know if you find anything.  I'll certainly respond
> as I make progress trying to go through the issues.

I just wanted to update folks on where I'm at.

On the Intel IA32 architecture, the problem appears to have been triggered by
the ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA that went in after March of this year.
 I've not been able to track down what is causing the bad behavior -- but fully
dropping support for that class type allows the prelink to "mostly work".

On ARM the issues appear to have some problem related to IFUNCs, but I still
don't have any data beyond that at this point.

> --Mark
> 
>> p.
>>
> 


