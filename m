Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SruB4-0002KT-IS for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 19:06:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JGsaux004496;
	Thu, 19 Jul 2012 17:54:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03759-04; Thu, 19 Jul 2012 17:54:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JGsQw2004490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 19 Jul 2012 17:54:28 +0100
Message-ID: <1342716870.21788.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Thu, 19 Jul 2012 17:54:30 +0100
In-Reply-To: <50083564.3020200@linux.intel.com>
References: <cover.1342549867.git.dvhart@linux.intel.com>
	<da4bea17ffc6284a462e33b142ec17bd6f15f2ac.1342549867.git.dvhart@linux.intel.com>
	<5005BFA6.5050809@linux.intel.com> <5005C134.4080805@linux.intel.com>
	<1342714551.7940.15.camel@ted> <50083564.3020200@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q6JGsaux004496
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] EFI: Make installer EFI aware
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
X-List-Received-Date: Thu, 19 Jul 2012 17:06:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-19 at 09:27 -0700, Darren Hart wrote:
>=20
> On 07/19/2012 09:15 AM, Richard Purdie wrote:
> > On Tue, 2012-07-17 at 12:47 -0700, Darren Hart wrote:
> >>
> >> On 07/17/2012 12:40 PM, Saul Wold wrote:
> >>> On 07/17/2012 12:29 PM, Darren Hart wrote:
> >>
> >>>> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> >>>> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> >>>> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Small image capable of booting a =
device. The kernel includes \
> >>>>   the Minimal RAM-based Initial Root Filesystem (initramfs), which=
 finds the \
> >>>>   first =E2=80=9Cinit=E2=80=9D program more efficiently."
> >>>>
> >>>> -IMAGE_INSTALL =3D "initramfs-live-boot initramfs-live-install bus=
ybox udev base-passwd"
> >>>> +IMAGE_INSTALL =3D "initramfs-live-boot initramfs-live-install ini=
tramfs-live-install-efi busybox udev base-passwd"
> >>>>
> >>>>   # Do not pollute the initrd image with rootfs features
> >>>>   IMAGE_FEATURES =3D ""
> >>>
> >>> Does this now need a PR bump also?
> >>
> >> I didn't think so as this recipe is rebuilt for every image anyway.
> >> There is no PR in this recipe.
> >>
> >>>> diff --git a/meta/recipes-core/initrdscripts/initramfs-live-instal=
l-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi=
_1.0.bb
> >>>> new file mode 100644
> >>>> index 0000000..6696d94
> >>>> --- /dev/null
> >>>> +++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1=
.0.bb
> >>>> @@ -0,0 +1,22 @@
> >>>> +DESCRIPTION =3D "A live image init script for grub-efi"
> >>>> +LICENSE =3D "MIT"
> >>>> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3=
da9cfbcb788c80a0384361b4de20420"
> >>>> +SRC_URI =3D "file://init-install-efi.sh"
> >>>> +
> >>>> +PR =3D "r7"
> >>>> +
> >>> Why PR =3D r7 for a new recipe, there should be no PR as it default=
s to r0?
> >>
> >> Good catch, just my forcing rebuilds during development, or perhaps =
a
> >> left-over copy from the initramfs-live-install_1.0.bb I based it on.
> >> Updated as r0 in the branch.
> >=20
> > Could I ask you to update this on top of Radu's fix please?
>=20
> Will do.

Thanks, merged to master.

Richard




