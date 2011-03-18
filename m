Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1Q0WQf-00012T-H0; Fri, 18 Mar 2011 10:57:11 +0100
Received: by wwb17 with SMTP id 17so4085940wwb.24
	for <multiple recipients>; Fri, 18 Mar 2011 02:55:23 -0700 (PDT)
Received: by 10.216.221.72 with SMTP id q50mr896863wep.99.1300442123604;
	Fri, 18 Mar 2011 02:55:23 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f30sm1491173wef.7.2011.03.18.02.55.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Mar 2011 02:55:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D832AA4.1020701@matrix-vision.de>
Date: Fri, 18 Mar 2011 10:55:22 +0100
Message-Id: <AB78D48B-B478-47DF-A7CF-94FF96C313AC@dominion.thruhere.net>
References: <4D832AA4.1020701@matrix-vision.de>
To: Michael Jones <michael.jones@matrix-vision.de>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: staging & using kernel headers
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
X-List-Received-Date: Fri, 18 Mar 2011 09:57:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

CC:ing oe-core since we have kernel.bbclass patches there as well.

Op 18 mrt 2011, om 10:49 heeft Michael Jones het volgende geschreven:

> Hello Koen & co.,
>=20
> I recently bumped into a problem with recipes ti-dmai and gstreamer-ti
> when they included the kernel headers.  These headers were staged by
> kernel.bbclass sysroot_stage_all_append() with a lot of manual copying
> and manipulating links and such, rather than using 'oe_runmake
> headers_install'.  Back in October Koen explained this
> (http://article.gmane.org/gmane.comp.handhelds.openembedded/37772) is
> because some recipes use private kernel API.  The result of this with =
my
> 2.6.38 kernel

DMAI and gst-ti don't really work with anything newer than 2.6.32-psp, =
we're trying to get that addressed internally.

> is that I get a warning-turned-error from linux/types.h
> that "Attempt to use kernel headers from user space".
>=20
> ti-dmai_svn.bb hacks this (self-admittedly) by defining
> _EXPORTED_HEADERS_ (commit d0184be13b4879e, also from Koen).  I had to
> modify the recipe to enable the define to actually get passed as a
> compile option.  For gstreamer-ti, there was no such hack in place, =
but
> it was needed for the same reason.
>=20
> I would think it is a common requirement for recipes to include kernel
> headers, and this warning has been around since 2.6.32.  I got around =
it
> with gstreamer-ti by installing the headers with headers_install into =
a
> subdir of the headers directory set up currently by kernel.bbclass, =
and
> pointing the gstreamer-ti recipe at that, but I'm not sure if there's =
a
> better way.
>=20
> If there are some recipes that need internal kernel sources staged for
> them, then it seems to me that we need both sets of kernel headers: =
one
> exported to userspace (with headers_install) and one that is not.
> Right?  Can we agree on a standard place/manner for this?
>=20
> Below is my patch to get gstreamer-ti working, for illustration.

I don't really have a better suggestion, apart from adding a var in e.g. =
bitbake.conf to point to the userspace stuff.

We might even do the reverse, stage the full set into =
$kernel_dir/private and the userspace ones in $kernel_dir, that would =
make it more clear which recipes need internal API.

regards,

Koen

>=20
> -Michael
>=20
> =46rom 71b3762ad5f6e7a8553a6b780296f7e994513f0b Mon Sep 17 00:00:00 =
2001
> From: Michael Jones <michael.jones@matrix-vision.de>
> Date: Thu, 17 Mar 2011 17:23:53 +0100
> Subject: [PATCH] install kernel headers exported for userspace
>=20
> kernel.bbclass already copies and manipulates kernel headers into
> sysroot, but it doesn't export them properly using "make =
headers_install"
> which leads to a compiler error/warning in linux/types.h:
>=20
> "Attempt to use kernel headers from user space, see
> http://kernelnewbies.org/KernelHeaders"
>=20
> ---
> classes/kernel.bbclass      |    5 +++++
> recipes/ti/gstreamer-ti.inc |    2 +-
> 2 files changed, 6 insertions(+), 1 deletions(-)
>=20
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 422bcd7..6b46d51 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -210,6 +210,11 @@ sysroot_stage_all_append() {
> 	[ -e Module.symvers ] && install -m 0644 Module.symvers =
$kerneldir/
>=20
> 	cp -fR scripts $kerneldir/
> +
> +	# install kernel headers in the proper manner to export them
> +	# for userspace programs
> +	userspace_hdrs=3D${kerneldir}/userspace
> +	oe_runmake headers_install INSTALL_HDR_PATH=3D${userspace_hdrs} =
ARCH=3D${ARCH}
> }
>=20
> kernel_do_configure() {
> diff --git a/recipes/ti/gstreamer-ti.inc b/recipes/ti/gstreamer-ti.inc
> index 905e192..04d990f 100644
> --- a/recipes/ti/gstreamer-ti.inc
> +++ b/recipes/ti/gstreamer-ti.inc
> @@ -72,7 +72,7 @@ CPPFLAGS_append =3D " -DPlatform_${PLATFORM}"
> export ENCODE_COMBO    =3D =
"${installdir}/ti-codecs-server/encodeCombo.x64P"
> export DECODE_COMBO    =3D =
"${installdir}/ti-codecs-server/decodeCombo.x64P"
> # Makefile also expects to be able to find the kernel headers from the =
envirionment
> -export LINUXKERNEL_INSTALL_DIR =3D "${STAGING_KERNEL_DIR}"
> +export LINUXKERNEL_INSTALL_DIR =3D "${STAGING_KERNEL_DIR}/userspace"
>=20
> do_configure_prepend() {
> 	# PSP kernel is based on older DSS. we need to replace =
linux/omapfb.h with mach/omapfb.h
> --=20
> 1.7.4.1
>=20
>=20
> MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
> Registergericht: Amtsgericht Stuttgart, HRB 271090
> Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner



