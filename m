Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1Sc2NL-00050T-EQ
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 00:37:19 +0200
Received: from mx4.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id 31B135E9F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2012 14:58:07 -0700 (PDT)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx4.leapfrog.com (Postfix) with ESMTP id 1AF885E8B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2012 14:58:07 -0700 (PDT)
Received: from NAEMCASHT01.na.leapfrog.com (10.16.4.161) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Tue, 5 Jun 2012 14:58:40 -0700
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT01.na.leapfrog.com ([::1]) with mapi id 14.01.0355.002;
	Tue, 5 Jun 2012 14:58:40 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: RFC: Braindump on Bootloaders, Image Types, and Installers
Thread-Index: Ac1DZlmAaso6lcOXROughLP8M7hV2g==
Date: Tue, 5 Jun 2012 21:58:39 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F0428DE00@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Re: RFC: Braindump on Bootloaders, Image Types, and Installers
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
X-List-Received-Date: Tue, 05 Jun 2012 22:37:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>Date: Tue, 05 Jun 2012 13:54:14 -0700
>From: Darren Hart <dvhart@linux.intel.com>
>Subject: [OE-core] RFC: Braindump on Bootloaders, Image Types, and
>	Installers
>To: Patches and discussions about the oe-core layer
>	<openembedded-core@lists.openembedded.org>
>Cc: damien.lespiau@intel.com, "Wold, Saul" <saul.wold@intel.com>
>Message-ID: <4FCE71F6.3060001@linux.intel.com>
>Content-Type: text/plain; charset=3DISO-8859-1
>
>All,
>
>There has been a lot of discussion scattered across the lists and
>bugzilla regarding bootable image types. There are a variety of
>different situations, each with specific requirements. Our current set
>of image types are showing their age. Here I collect what I've seen in
>an attempt to start a consolidated discussion to help arrive at a clear
>vision of where we want to be, and to define tasks that we can
>distribute across various people. If you are on CC, I intend to include
>you in that list of people ;-)
>
>Current issues:
>* hddimg types fail to boot on many intel platforms [3]
>* USBZIP image creation is slow and not integrated into the bitbake
>  process
>* dosfstools is stuck at an old version to avoid requiring GPLv2 to
>  build images
>* no support for kernel+initramfs as a single blob [9]
>* can't create partitioned images as the tools require root access
>* hybrid ISO images are more universally bootable, but don't provide
>  persistent storage even on USB sticks.
>* different boot loaders are used on the live images and the installed
>  images
>* boot parameters are not preserved across installation [0]
>* the installer is very limited to where it can install
>* the installer doesn't work for EFI images [1]
>* the hddimg will load the first rootfs it finds, even if it isn't the
>  one on the hddimg boot media
>* the boot prompts are not self descriptive
>* EFI, PCBIOS, ISO all have subtly different boot requirements which
>  complicate the bootimg recipe and associated classes.
>* custom multi-partition images are not supported [4]
>* Can't build the image and the bootloader as different arches [5]
>* Various issues with unionfs [7] and chroot [8]
>
>... and that's just for x86...
>
>Where I envision images going:
>
>* Create the follwing image types:
>  * Live Installer
>    - this is the merger of hddimg, ISO, and ISOHYBRID
>    - non-persistent storage
>    - intended for demonstration and installation
>    - can be written directly to USB sticks or CDs
>  * Disk Image
>    - create partitioned images (not just volume images)
>    - intended to be written to USB sticks, MMC drives, or SATA disks
>    - may require a script to assemble the image for specific target
>      devices.
>  * Initramfs
>    - Linux kernel and initramfs as a single image
>    - this will require some significant workflow changes as images are
>      generated after the kernel and the kernel needs the rootfs to
>      build the combined image.
>

While we're on the topic, I would add that there's currently no easy way to=
 generate multiple images using different mkfs arguments from the same imag=
e recipe. Our use case is that we have multiple boards with only a very sli=
ght difference, the NAND geometry. Because UBI and UBIFS need NAND geometry=
 info when being generated, this means under the current system, we'd need =
3 image recipes, each containing all of the same packages but having slight=
ly different mkfs and ubinize arguments which is a major performance drawba=
ck because the rootfs has to be created for each final image. We've hacked =
together a solution in house, but if someone is looking at redesigning imag=
es, we'd love to see support for this.

Daniel Lazzari Jr
Firmware Engineer
LeapFrog, Inc
dlazzari@leapfrog.com


