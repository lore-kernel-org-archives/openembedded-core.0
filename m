Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RTcyt-0004fl-Fj
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 18:21:03 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Nov 2011 09:14:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,565,1315206000"; d="scan'208";a="78895914"
Received: from unknown (HELO envy.home) ([10.255.15.250])
	by azsmga001.ch.intel.com with ESMTP; 24 Nov 2011 09:14:28 -0800
Message-ID: <4ECE7B78.706@linux.intel.com>
Date: Thu, 24 Nov 2011 09:14:32 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1322120651.git.dvhart@linux.intel.com>
	<d5ab9354f38a3cdecfedaf734ffb48aa969a8541.1322120651.git.dvhart@linux.intel.com>
	<B17E0298-4C9C-461A-A713-ADEE9771F8F0@dominion.thruhere.net>
	<1322133994.24143.15.camel@ted>
	<EE779348-2CFB-4ABE-BEEE-96E34470DFFD@dominion.thruhere.net>
In-Reply-To: <EE779348-2CFB-4ABE-BEEE-96E34470DFFD@dominion.thruhere.net>
X-Enigmail-Version: 1.3.3
Cc: Josef Ahmad <josef.ahmad@intel.com>, Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/5] grub-efi-native: New recipe to build GRUB EFI images
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
X-List-Received-Date: Thu, 24 Nov 2011 17:21:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 11/24/2011 08:51 AM, Koen Kooi wrote:
> 
> Op 24 nov. 2011, om 12:26 heeft Richard Purdie het volgende 
> geschreven:
> 
>> On Thu, 2011-11-24 at 09:59 +0100, Koen Kooi wrote:
>>> Op 24 nov. 2011, om 09:05 heeft Darren Hart het volgende 
>>> geschreven:
>>> 
>>>> Add a recipe to build the GRUB efi images. This recipe is 
>>>> written as a native recipe as the resulting GRUB utils are 
>>>> required to assemble the final image. Rather than build a 
>>>> native and a target recipe (and increase build times),
>>> 
>>> That's a false dilemma. If you write it as a regular recipe
>>> with BBCLASSEXTEND=native your buildtime doesn't increase
>> 
>> That isn't true, if you build a target and a native version your 
>> build time does increase. Using BBCLASSEXTEND does improve
>> parsing time over having two separate recipes though.
> 
> Are you really saying that 'bitbake grub-native' will build both 
> versions if you use BBCLASSEXTEND!?!?! If not, it remains a false 
> dilemma.

No, that isn't it. Because of the way grub builds, you need the utils
in HOST_ARCH and the grub modules in TARGET_ARCH. Grub has a
monolithic build system, so in order to do this with BBCLASSEXTEND, we
would need to have grub-efi depend on grub-efi-native so that the
final do_mkimage task could use the -native version of grub-mkimage to
assemble the target-built modules into a final binary.

This approach builds grub natively and sets the --target to the
TARGET_ARCH so the modules are built for the target. This is why I'm
making the distinction between build the grub tools for deployment and
building the grub efi boot image. The approach to each is different,
and this recipe generates the boot image for the target.


- -- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOznttAAoJEKbMaAwKp364dG0H/0tScwNt0pc9gHDXDELdhCvp
JGJ8soO+yWgksG9o/p077oysd7HMm24Tq//m7FuRzgm0D2JymYwPwdLe06mA1ARs
BpwtvltUW5SLaWzJVeamxeNn5cDpdIcyaa904BdS2Ink/alZgTdoV60qh9LvElIh
P70Pb/GeV/Po5OLALmnYuEV39JPnRxz7RfaXr7qU/0e0JVGKxXa/hrBp8ZgzpYI4
WvGns2LrZRPi/Fp93Vc312NfZYa2y/s9H8ji+B2Nvdza99Zo9y4xtWSf9bDRn+4J
04Kw/CFUe4GqXrIoBATLvm8LmcS/fLaqtVY5Ewz5bSnPFRvXyYApmmNvWpy5hGs=
=LaXk
-----END PGP SIGNATURE-----


