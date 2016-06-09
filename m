Return-Path: <ovidiu.vancea@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id D006D605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 14:47:41 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u59ElfKf027907; Thu, 9 Jun 2016 09:47:41 -0500
Received: from ovidiu-ro-l0.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016060909474157-1110077 ;
	Thu, 9 Jun 2016 09:47:41 -0500 
Message-ID: <1465483659.36541.24.camel@ni.com>
From: Ovidiu-Adrian Vancea <ovidiu.vancea@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Jun 2016 17:47:39 +0300
In-Reply-To: <1465405170.13979.111.camel@linuxfoundation.org>
References: <1465402114-1588-1-git-send-email-ovidiu.vancea@ni.com>
	<1465405170.13979.111.camel@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 06/09/2016 09:47:41 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 06/09/2016 09:47:42 AM,
	Serialize complete at 06/09/2016 09:47:42 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-06-09_05:, , signatures=0
Subject: Re: [PATCH v2 0/3] ipk/deb/rpm: add kernel version to its dependencies
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
X-List-Received-Date: Thu, 09 Jun 2016 14:47:43 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Wed, 2016-06-08 at 17:59 +0100, Richard Purdie wrote:
> On Wed, 2016-06-08 at 19:08 +0300, Ovidiu-Adrian Vancea wrote:
> >=20
> > Updating the kernel (for all package managers) does not update the
> > dependencies
> > (eg. modules) because there is no possibility to do version
> > enforcement in the
> > OE recipe. Upon rebooting, the older version modules do not load
> > and
> > can leave
> > hardware in a non-functioning state (if their drivers are not built
> > into the
> > kernel).
> >=20
> > Use the Version field from the kernel package on its rdepends,
> > rrecommends, and
> > rsuggests fields=E2=80=99 version. This makes the packages on which the
> > kernel depends
> > to be the same version as the kernel. Version field contains
> > package
> > build
> > number (including git hash) and package revision, thus restricting
> > the kernel
> > and modules to always be built together.
> >=20
> > The current and default behavior will not change unless the
> > variable=C2=A0
> > "VERSION_KERNEL_MODULES =3D 1" is defined in the kernel recipe.
> >=20
> > Ovidiu-Adrian Vancea (3):
> > =C2=A0 package_ipk.bbclass: add kernel version to its dependencies
> > =C2=A0 package_deb.bbclass: add kernel version to its dependencies
> > =C2=A0 package_rpm.bbclass: add kernel version to its dependencies
> Why are you doing this at package_write_XXX? These tasks are there
> specifically to write out the packages. With your changes the data
> written to the packages would be different to that written out to
> packagedata for example. We shouldn't encourage different package
> metadata in different places.
>=20
> I think this needs to happen somewhere at do_package time, probably
> from a hook in module.bbclass?
>=20
> Sorry if I wasn't clear about this last time.
>=20
> Cheers,
>=20
> Richard
>=20
>=20

At do_package time I can't modify the variables RDEPENDS, RRECOMMENDS
and RSUGGESTS as stated in the following email:
http://lists.openembedded.org/pipermail/bitbake-devel/2013-April/003416
.html
I've tried the smallest changes to these 3 fields but without success,
confirming what was said in the email.
I do manage to get the auto pr data (Version=3D4.1+git168+a7e53ecc27-
r0.73 - notice r0.73) that I need to version the dependencies.

At variable loading time I could globally change RDEPENDS, RRECOMMENDS
and RSUGGESTS but I can't get the auto pr data. Since I have no auto pr
data, I can go as far as getting Version=3D4.1+gitAUTOINC+a7e53ecc27-r0
(notice r0, not r0.73) which is incomplete.

The only place I've actually managed to insert the data was at package
creation time (ipk, deb, rpm), which I agree is ugly but I've not found
another to get me where I need.

Thanks for the feedback,
Ovidiu

