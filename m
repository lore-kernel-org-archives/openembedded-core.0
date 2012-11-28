Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tdked-0006Ke-Pm
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 17:38:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qASGOEvJ016931
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Nov 2012 08:24:15 -0800 (PST)
Received: from msp-dhcp42.wrs.com (172.25.34.42) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 28 Nov 2012 08:24:12 -0800
Message-ID: <50B63AAD.4080506@windriver.com>
Date: Wed, 28 Nov 2012 10:24:13 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20121127154129.GC3692@jama.jama.net>
	<1354047102.21863.105.camel@ted>
	<20121127202356.GJ3692@jama.jama.net>
	<50B52B94.6020700@windriver.com> <1354080360.21863.111.camel@ted>
In-Reply-To: <1354080360.21863.111.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: RDEPENDS of packages created by PACKAGES_DYNAMIC not built before image rootfs
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
X-List-Received-Date: Wed, 28 Nov 2012 16:38:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/12 11:26 PM, Richard Purdie wrote:
> On Tue, 2012-11-27 at 15:07 -0600, Mark Hatle wrote:
>> On 11/27/12 2:23 PM, Martin Jansa wrote:
>>>> Bitbake doesn't know which modules this package will produce since its
>>>> using PACKAGES_DYNAMIC. It does its best effort to try and find DEPENDS
>>>> but it can't take the regexps and come up with
>>>> "pulseaudio-module-console-kit", hence it doesn't see the RDEPENDS.
>>>> There isn't any generic way we can teach it to do that either. If it
>>>> did, it would simply always build consolekit which you say you don't
>>>> want so its not relevant anyway.
>>>>
>>>> So basically, you need to decide whether you want consolekit enabled or
>>>> not and build accordingly, there is nothing you can do within bitbake to
>>>> "mind read" what the image is going to want...
>>
>> For the resolver, it has to use the RPROVIDES, PACKAGES and PACKAGES_DYNAMIC...
>
> and it does to the limits that are reasonable...
>
>>> No, you know that you will need pulseaudio-module-console-kit because
>>> pulseaudio-server RDEPENDs on it (not on any pulseaudio-module-* but
>>> pulseaudio-module-console-kit exactly). So it's not really mind reading.
>>
>> But after the recipe has been built, the required item from PACKAGES_DYNAMIC
>> should now be in PACKAGES... and if it doesn't end up in the PACKAGES list, it
>> would be a good idea to at a minimum trigger a warning...  The catch is, is
>> there any way to tell if something from PACKAGES_DYNAMIC was used..
>
> "After it is built" is no good to bitbake. It has to know what its doing
> without building things.
>
> All Bitbake can see is that there is some regexp in PACKAGES_DYNAMIC.
>
> Yes, Bitbake could take all the keys in the datastore, expand each one
> (since it could be constructed using another variable name) and find the
> ones starting with RDEPENDS, then apply the rexexp to each key and see
> if it matches. We one tried something like this and it is extremely
> slow, parsing would take a massive speed hit.

I was more thinking in the oe-core recipe QA stuff..  if there was a way to know 
that the following items were matched in PACKAGES_DYNAMIC for this item, and 
then check to see if they ended up in PACKAGES.  Then warn/error as appropriate 
if they don't match.

> The rule is therefore in corner cases like this (which are rather
> unusual), you add something to DEPENDS and be done with it.
>
> It is not a reasonable expectation for bitbake to figure this kind of
> thing out.

Ya, I wasn't advocating a change in bitbake for the detection, just a way to 
pass the data to the recipe and do it at that point.

> I agree that if it builds things and discovers some kind of missing
> dependency, that would be good to tell the user about.

--Mark

> Cheers,
>
> Richard
>
>
>



