Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QbZZw-0008Uf-0C
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 16:47:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5SEi8SY015049
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 07:44:10 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 28 Jun 2011 07:44:08 -0700
Message-ID: <4E09E8B7.1070901@windriver.com>
Date: Tue, 28 Jun 2011 09:44:07 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com>	<4E095480.3070001@windriver.com>
	<1309266943.20015.290.camel@rex>
In-Reply-To: <1309266943.20015.290.camel@rex>
Subject: Re: [Draft design][RFC] Running postinst at rootfs generation time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2011 14:47:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/28/11 8:15 AM, Richard Purdie wrote:
> On Mon, 2011-06-27 at 23:11 -0500, Mark Hatle wrote:
>> On 6/27/11 9:09 PM, Cui, Dexuan wrote:
>>> Hi all, below is an initial investigation about the task and we'll continue to further look into it.
>>>
>>> In poky we have 2 types of postinst scripts:  one (type-1) can be (and has already been) run at rootfs generation time and the other (type-2) has to be delayed to the first-boot of target device. Type-2 makes target device's first-boot slow and it would be great if we can fix it and convert it to type-1.
>>>
>>> We can instrument a first-boot with minimal/sato first to see which postinstalls take the most time and then prioritise those ones to fix.
>>>
>>> I figurerd out a list of 33 recipes in total(recipes with the same name but with different versions are counted once) we possibly need to fix.
>>> For the recipes, we need try to find recipe-specific ways(use appropriately modified native utilities to generate caches, files, etc as necessary on the target filesystem).
>>>
>>
>> ...
>>
>>> 1 recipe: prelink: we could propablly fix it, but I'm not sure yet.
>>> meta/recipes-devtools/prelink/prelink_git.bb
>>
>> There is nothing to do for the prelinker.  The "image-prelink.bbclass" handles
>> everything needed to prelink during image creation.  The script is only there
>> for on-target field upgrades.  So you can remove this from your list.
> 
> Mark, are you 100% sure about this?
> 
> It looks like if we install prelink into an image it adds a post install
> which runs "prelink -a" on the target device at first boot.
> 
> This would happen regardless of whether the cross prelinker did or did
> not prelink the image :/.

That is certainly not the intention of this code.  If it does, it should be a
fairly quick bug to fix -- and improve boot-time.  (Of course, this only should
be skipped if we've done image-prelink.bbclass.)

I'll attempt to look into this shortly....

--Mark

> Cheers,
> 
> Richard
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



