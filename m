Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TdSbA-00089D-9V
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 22:21:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qARL7TMm012306
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 13:07:29 -0800 (PST)
Received: from msp-dhcp39.wrs.com (172.25.34.39) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 27 Nov 2012 13:07:28 -0800
Message-ID: <50B52B94.6020700@windriver.com>
Date: Tue, 27 Nov 2012 15:07:32 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:16.0) Gecko/20121026 Thunderbird/16.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20121127154129.GC3692@jama.jama.net>
	<1354047102.21863.105.camel@ted>
	<20121127202356.GJ3692@jama.jama.net>
In-Reply-To: <20121127202356.GJ3692@jama.jama.net>
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
X-List-Received-Date: Tue, 27 Nov 2012 21:21:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/12 2:23 PM, Martin Jansa wrote:
> On Tue, Nov 27, 2012 at 08:11:42PM +0000, Richard Purdie wrote:
>> On Tue, 2012-11-27 at 16:41 +0100, Martin Jansa wrote:
>>> Hi,
>>>
>>> pulseaudio has
>>> RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
>>>
>>> and pulseaudio-module-console-kit is dynamic package
>>> PACKAGES_DYNAMIC += "^pulseaudio-lib.* ^pulseaudio-module.* ^libpulse-lib.* ^libpulse-module.* "
>>>
>>> If you have image where consolekit is pulled to image only by
>>> pulseaudio-module-console-kit (e.g. through pulseaudio-server).
>>> Then consolekit is not built before image do_rootfs is executed and do_rootfs fails.
>>>
>>> Easy way to reproduce this is to build e.g. core-image-minimal with
>>> pulseaudio-module-console-kit or pulseaudio-server added to IMAGE_INSTALL.
>>> Will fail with:
>>>    * satisfy_dependencies_for: Cannot satisfy the following dependencies for pulseaudio-server:
>>>    *    consolekit *
>>>    * opkg_install_cmd: Cannot install package pulseaudio-server.
>>>
>>>
>>> Not sure what's proper fix, bitbake probably just checks that right provider for
>>> pulseaudio-module-console-kit is pulseaudio because of PACKAGES_DYNAMIC, but does not check
>>> RDEPENDS_pulseaudio-module-console-kit after that.
>>>
>>> We can add consolekit to build time deps like it was before, but that's just
>>> work around and not correct fix.
>>>
>>> Also filled as
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3498
>>
>> Well, you can't have this both ways :)
>
> IMHO Only one way is correct and that would be enough :).
>
>> Bitbake doesn't know which modules this package will produce since its
>> using PACKAGES_DYNAMIC. It does its best effort to try and find DEPENDS
>> but it can't take the regexps and come up with
>> "pulseaudio-module-console-kit", hence it doesn't see the RDEPENDS.
>> There isn't any generic way we can teach it to do that either. If it
>> did, it would simply always build consolekit which you say you don't
>> want so its not relevant anyway.
>>
>> So basically, you need to decide whether you want consolekit enabled or
>> not and build accordingly, there is nothing you can do within bitbake to
>> "mind read" what the image is going to want...

For the resolver, it has to use the RPROVIDES, PACKAGES and PACKAGES_DYNAMIC...

> No, you know that you will need pulseaudio-module-console-kit because
> pulseaudio-server RDEPENDs on it (not on any pulseaudio-module-* but
> pulseaudio-module-console-kit exactly). So it's not really mind reading.

But after the recipe has been built, the required item from PACKAGES_DYNAMIC 
should now be in PACKAGES... and if it doesn't end up in the PACKAGES list, it 
would be a good idea to at a minimum trigger a warning...  The catch is, is 
there any way to tell if something from PACKAGES_DYNAMIC was used..

--Mark

> If it's not possible with current code-base then we should document it
> and add some work around in pulseaudio (I'm fine with building
> consolekit even when it's not used later).
>
> Cheers,
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



