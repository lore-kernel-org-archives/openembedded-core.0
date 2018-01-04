Return-Path: <jobol@nonadev.net>
X-Greylist: delayed 306 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Jan 2018 10:23:34 UTC
Received: from erza.lautre.net (erza.lautre.net [80.67.160.89])
	by mail.openembedded.org (Postfix) with ESMTP id 845B97847D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 10:23:34 +0000 (UTC)
Received: from d-jobol.iot.bzh (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by erza.lautre.net (Postfix) with ESMTPSA id E484D78AE;
	Thu,  4 Jan 2018 11:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1515060144;
	bh=4kUAtlgiEFUpVoKD9gFQujCVQGkDSQ6J6tDHfrEK+x8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=xlS2c8Jyy3aYaNCQiRcDTBgAh5ZIRkNARDGEcqvuSJevFMPNXmmELXB9T0L3DppD+
	pqm4N/68jukZLFCjM76JZsyX2d+rCRv/xXvTYyT+39pihR5heag02+y7ZX1H4DghyV
	MLgdMIzgv2lQvH5feP2uBdnbg62Y04wuP18HCdWo=
Date: Thu, 4 Jan 2018 11:18:26 +0100
From: =?UTF-8?B?Sm9zw6k=?= Bollo <jobol@nonadev.net>
To: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <20180104111826.5c8f9036@d-jobol.iot.bzh>
In-Reply-To: <f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
	<20170315090430.69b17cc1@d-jobol.iot.bzh>
	<f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Thu, 04 Jan 2018 10:23:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Jan 2018 17:28:27 +0800
wenzong fan <wenzong.fan@windriver.com> wrote:

> Hi Jos=C3=A9 Bollo,
>=20
> This will override the labels of user's home directories that set by=20
> SELinux.
>=20
> For example, if I run below command on SELinux enabled system:
>=20
> $ useradd test
>=20
> SELinux will label it as "user_u:object_r:user_home_dir_t:SystemLow"=20
> first, and then useradd will reset the label as=20
> "system_u:object_r:etc_t:SystemLow".
>=20
> I got strace logs below:
>=20
> 723   openat(AT_FDCWD, "/proc/thread-self/attr/fscreate",=20
> O_RDWR|O_CLOEXEC) =3D 11
> 723   write(11, "user_u:object_r:user_home_dir_t:"..., 35) =3D 35=20
>=20
> 723   close(11)                         =3D 0
> 723   mkdir("/home/t1", 000)            =3D 0
> 723   chown("/home/t1", 1000, 1000)     =3D 0
> 723   chmod("/home/t1", 0755)           =3D 0
>=20
> # SELinux labelled it as "user_home_dir_t" here.
>=20
> 723   llistxattr("/etc/skel", NULL, 0)  =3D 17
> 723   llistxattr("/etc/skel", "security.selinux\0", 17) =3D 17
> 723   openat(AT_FDCWD, "/etc/xattr.conf", O_RDONLY) =3D -1 ENOENT (No
> such file or directory)
> 723   lgetxattr("/etc/skel", "security.selinux", NULL, 0) =3D 27
> 723   lgetxattr("/etc/skel", "security.selinux",=20
> "system_u:object_r:etc_t:s0", 27) =3D 27
> 723   lsetxattr("/home/t1", "security.selinux",=20
> "system_u:object_r:etc_t:s0", 27, 0) =3D 0
>=20
> # useradd reset the label as "etc_t" here.
>=20
> Do you agree to move the patch to Smack specific layer? Such as=20
> meta-security?

I agree.

SELinux is the king of monsters and pushes others in corners...

Best regards
Jos=C3=A9

> Thanks
> Wenzong
>=20
> On 03/15/2017 04:04 PM, Jos=C3=A9 Bollo wrote:
> > On Thu, 09 Mar 2017 18:18:05 +0100
> > Patrick Ohly <patrick.ohly@intel.com> wrote:
> >  =20
> >> On Thu, 2017-03-09 at 17:48 +0100, Jos=C3=A9 Bollo wrote: =20
> >>> On Thu, 09 Mar 2017 17:07:54 +0100
> >>> Patrick Ohly <patrick.ohly@intel.com> wrote: =20
> >>>> Can't you reorder and rebase the patches so that this
> >>>> 0001-useradd.c-create-parent-directories-when-necessary.patch
> >>>> applies on top of the patch which was submitted upstream? =20
> >>>
> >>> I agree that it would be better to reorder. Better but less
> >>> conservative because an existing patch must be upgraded. =20
> >>
> >> If upstream merges the proposed patch, then rebasing will be
> >> inevitable at some point, so we might as well do the cleaner
> >> solution now, even if the diff becomes larger.
> >> =20
> >>>> "devtool modify shadow-native" might be useful for that. "git
> >>>> rebase -i" in workspace/sources/shadow-native", then finish with
> >>>> "devtool update-recipe shadow-native". I haven't tried whether
> >>>> "update-recipe" handles re-ordering patches. If it doesn't, just
> >>>> fix it manually. =20
> >>>
> >>> I'll do and propose the new version soon. =20
> >>
> >> Thanks!
> >> =20
> >=20
> > I pushed a new version of the patch this monday. I suppose that it
> > is waiting for approval.
> >=20
> > Best regards
> > Jos=C3=A9 Bollo
> >  =20


