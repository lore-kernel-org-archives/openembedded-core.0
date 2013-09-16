Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A147060648
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 18:10:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Sep 2013 11:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,917,1371106800"; 
	d="asc'?scan'208";a="379056796"
Received: from dvhart-mobl4.jf.intel.com (HELO [10.7.201.128]) ([10.7.201.128])
	by orsmga001.jf.intel.com with ESMTP; 16 Sep 2013 11:10:29 -0700
Message-ID: <1379355017.1285.171.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Sep 2013 11:10:17 -0700
In-Reply-To: <20130914131645.GD30637@jama>
References: <1379117343-29877-1-git-send-email-jason.wessel@windriver.com>
	<1379117343-29877-5-git-send-email-jason.wessel@windriver.com>
	<20130914080555.GA30637@jama> <5234545F.70706@windriver.com>
	<20130914131645.GD30637@jama>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH 4/7] syslinux.bbclass, syslinux: Update to syslinux 6.01
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
X-List-Received-Date: Mon, 16 Sep 2013 18:10:27 -0000
X-Groupsio-MsgNum: 45101
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-i0X/M15etLl0l6j3sgio"

--=-i0X/M15etLl0l6j3sgio
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2013-09-14 at 15:16 +0200, Martin Jansa wrote:
> On Sat, Sep 14, 2013 at 07:19:43AM -0500, Jason Wessel wrote:
> > On 09/14/2013 03:05 AM, Martin Jansa wrote:
> > > On Fri, Sep 13, 2013 at 07:09:00PM -0500, Jason Wessel wrote:
> > >> A newer version of syslinux is required for an EFI enabled isohybrid=
.
> > >> This is used for the the capability to generate 3 types of ISO image=
s,
> > >> all of which can be booted off a USB device or HDD if copied with dd=
.
> > >>
> > >> 1) PC BIOS only ISO
> > >> 2) EFI only ISO
> > >> 3) EFI + PC BIOS ISO
> > >>
> > >> The syslinux.bbclass required a minor tweak because ldlinux.c32 is
> > >> dynamically loaded and needs to be in the created media as of syslin=
ux
> > >> 5 and up.
> > >
> > > Hi Jason,
> > >
> > > can you please look at
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3944
> > > ?
> >=20
> >=20
> > I can look at fixing the defect, but there is no description of how to =
use the directdisk to see the problem.  Could you provide an example?
> >=20
> > I added the directdisk to IMAGE_FSTYPES, but didn't get a .directdisk i=
n the deploy directory so that is not how it works.   Also I think the righ=
t solution is to simply call syslinux_hddimg_populate() from the directdisk=
 class vs having copied code for the install of the syslinux specific files=
 (that is how 1/2 the problem occurred in the first place).
> >=20
> > Back to this particular patch, the ldlinux.c32 change does not affect t=
he bootdirect class.  The ldlinux.c32 is only required for isolinux and the=
 copy is contained with in the inherited syslinux class.
>=20
> You can reproduce it by adding vmdk to IMAGE_FSTYPES and building e.g.
> qemux86 and trying to boot it in VirtualBox.
>=20
> It will always enable tty0 and only way to disable it now is to enable
> menu, but that doesn't work with vmdk images because of missing
> vesamenu.c32
>=20

Thanks for catching that Martin.

I agree that the SYSLINUX_SERIAL needs to be respected regardless of if
menu is set.

It should be acceptable to install vesamenu.c32 I would think, although
it sounds as though there is some work to perform to make sure
bootdirect uses all the new infrastructure as well.

--=20
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


--=-i0X/M15etLl0l6j3sgio
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQEcBAABAgAGBQJSN0mJAAoJEKbMaAwKp364YXQH/2oa0rvyhTVhkRGMIdcSZgys
EDq0AteO+LNvrtMzJOLUvkBFislTckhpma7T9Sztc4WzRhYW1Dkr7LRnKu7Kchr8
iL2iJ7KmxnoLW6D2XRPPBTzW5zhU6sW1KLavTohc1+ulk/j3NEx8yLtice0IfCgO
JpbB+zj/HNv/qx9qdSxExAbK0JlMJSDQCwl6KbVp9rtn8B44dkrSB2ura/XY1tM5
dsB99qcr5Q5jXRVNlsTRlNFPbg5sXxivgdXFXNVMfe2lwY5005GQEia5Llo8PJ8Z
Qx46EuTcP9YPQS9B4YGoUg7QRarsWH3Ftk8zyUyMdQs3MTgvuxy1wL1ZLmL4S4U=
=Tvjr
-----END PGP SIGNATURE-----

--=-i0X/M15etLl0l6j3sgio--
