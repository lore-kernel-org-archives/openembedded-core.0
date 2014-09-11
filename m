Return-Path: <chiz.chikwendu@Haemonetics.com>
X-Greylist: delayed 391 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Sep 2014 18:52:38 UTC
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.98])
	by mail.openembedded.org (Postfix) with ESMTP id 9481E617B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 18:52:38 +0000 (UTC)
Received: from [216.82.253.243:31584] by server-2.bemta-7.messagelabs.com id
	86/57-05570-0FDE1145; Thu, 11 Sep 2014 18:46:08 +0000
X-Env-Sender: chiz.chikwendu@Haemonetics.com
X-Msg-Ref: server-2.tower-171.messagelabs.com!1410461132!21055596!4
X-Originating-IP: [12.94.3.150]
X-StarScan-Received: 
X-StarScan-Version: 6.11.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3096 invoked from network); 11 Sep 2014 18:46:07 -0000
Received: from unknown (HELO mail.haemonetics.com) (12.94.3.150)
	by server-2.tower-171.messagelabs.com with AES128-SHA encrypted SMTP;
	11 Sep 2014 18:46:07 -0000
Received: from BRS-EXCH02.haemo.net ([169.254.2.195]) by BRS-Exch01.haemo.net
	([169.254.1.211]) with mapi id 14.03.0195.001;
	Thu, 11 Sep 2014 14:45:35 -0400
From: Chiz Chikwendu <chiz.chikwendu@Haemonetics.com>
To: Scott Garman <sgarman@zenlinux.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] bzImage not included in rootfs
Thread-Index: Ac/NuQqbyNbec55cRIGxKCHHjsJZBgAUnlOAAAe7+YA=
Date: Thu, 11 Sep 2014 18:45:34 +0000
Message-ID: <A0F68394C677A9428EE03709453BAAEC7959C901@BRS-Exch02.haemo.net>
References: <A0F68394C677A9428EE03709453BAAEC7959C76C@BRS-Exch02.haemo.net>
	<5411E2C3.3080807@zenlinux.com>
In-Reply-To: <5411E2C3.3080807@zenlinux.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.1.77]
MIME-Version: 1.0
Subject: Re: bzImage not included in rootfs
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
X-List-Received-Date: Thu, 11 Sep 2014 18:52:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Scott,

Thanks for your help.=20

I went another route. In my layer, I created an image.bb file.=20
The .bb file tells yocto to include the kernel in the rootfs. I do this wit=
h the command:
IMAGE_INSTALL +=3D kernel-image
IMAGE_INSTALL +=3D kernel-module

This installs the kernel image and module in the rootfs.=20
I can also try your suggested method.=20

Chiz Chikwendu
Sr. Hardware Engineer
Tel: 781-356-9739


-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Scott Garman
Sent: Thursday, September 11, 2014 1:58 PM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] bzImage not included in rootfs

On 09/11/2014 05:08 AM, Chiz Chikwendu wrote:
> I am new to Openembedded (and yocto).
>=20
> I have built an image with poky build environment.
>=20
> =20
>=20
> I noticed that the kernel's bzImage is not included in the rootfs.
>=20
> How do I get the system to include "bzImage" in the rootfs (boot/bzImage-=
)?
>=20
> =20
>=20
> I've done some research, and I saw a note about setting the parameter:
>=20
> RDEPENDS_kernel-base =3D "zImage"
>=20
> =20
>=20
> This should override the kernel settings and build the kernel into the
> rootfs. I tried it, however it is not working for me.

Hi Chiz,

Which MACHINE are you building for? This is probably something that is
set in the machine's BSP, since some hw platforms use bootloaders which
look for the kernel in a separate flash disk than the rootfs, so for
those devices there's no need to put the kernel in the rootfs.

If you're building one of the qemu machine targets, note that in
meta/conf/machine/include/qemu.inc there is:

# Don't include kernels in standard images
RDEPENDS_kernel-base =3D ""

Finally, where are you trying to set RDEPENDS_kernel-base in your
example above? I'm assuming in your local.conf file? I believe that
should be the place to do it so that it overrides the machine
configuration's definition.

Finally, make sure you've cleared the build cache for the image
generation by running bitbake -c cleanall <image-name> before trying to
generate it again.

Scott

--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

