Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49C2C749D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 19:19:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w48JImwE030742
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 May 2018 12:19:04 -0700
Received: from yow-masselst-lx1.localnet (128.224.60.223) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 8 May 2018 12:18:38 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 May 2018 15:18:37 -0400
Message-ID: <2836508.QEPAnaP5EO@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <2438346.XpoQbIzh2t@yow-masselst-lx1>
References: <20180416130021.4428-1-koen.kooi@linaro.org>
	<CAHYQr0rKoHVVKec=Au7PX-TM=dMMPVbUdNJahvLaFzK6NAck8A@mail.gmail.com>
	<2438346.XpoQbIzh2t@yow-masselst-lx1>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [PATCH v2 2/4] libcap: fix (base_)libdir usage
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
X-List-Received-Date: Tue, 08 May 2018 19:19:40 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Tuesday, May 8, 2018 2:26:47 PM EDT Mark Asselstine wrote:
> On Tuesday, May 8, 2018 1:46:43 PM EDT Ricardo Salveti wrote:
> > On Mon, Apr 16, 2018 at 10:00 AM, Koen Kooi <koen@dominion.thruhere.net>
>=20
> wrote:
> > > The recipe wants to install libs into base_libdir, but uses "basename
> > > $libdir" to derive that. That breaks in a multiarch setup. Use the
> > > proper
> > > variable and remove the inline python usage.
> > >=20
> > > Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > > ---
> > >=20
> > >  meta/recipes-support/libcap/libcap_2.25.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-support/libcap/libcap_2.25.bb
> > > b/meta/recipes-support/libcap/libcap_2.25.bb index d619a2e..47ecf34
> > > 100644
> > > --- a/meta/recipes-support/libcap/libcap_2.25.bb
> > > +++ b/meta/recipes-support/libcap/libcap_2.25.bb
> > > @@ -32,7 +32,7 @@ PACKAGECONFIG[pam] =3D "PAM_CAP=3Dyes,PAM_CAP=3Dno,=
libpam"
> > >=20
> > >  EXTRA_OEMAKE =3D " \
> > > =20
> > >    INDENT=3D  \
> > >=20
> > > -  lib=3D${@os.path.basename('${libdir}')} \
> > > +  lib=3D'${base_libdir}' \
> > >=20
> > >    RAISE_SETFCAP=3Dno \
> > >    DYNAMIC=3Dyes \
> > >    BUILD_GPERF=3Dyes \
> >=20
> > This creates a build failure when usrmerge is used, as libcap expects
> > only the lib folder name and not the lib path (and when usrmerge is
> > enabled base_libdir gets set to /usr/lib instead of /lib).
> >=20
> > Since base_libdir and libdir are all based out baselib, can you
> > provide more details about how that broke your multiarch setup?
> >=20
> > The failure when usrmerge is used:
> > WARNING: libcap-2.25-r0 do_package: QA Issue: libcap:
> >=20
> > Files/directories were installed but not shipped in any package:
> >   /usr/lib
> >   /usr/usr/lib/libcap.so
> >   /usr/usr/lib/libcap.so.2
> >   /usr/usr/lib/libcap.so.2.25
> >   /usr/usr/lib/libcap.a
> >   /usr/usr/lib/pkgconfig
> >   /usr/usr/lib/pkgconfig/libcap.pc
> >   /usr/usr/lib/security/pam_cap.so
>=20
> Agreed. I just started to determine how this is breaking qemu-native (with
> virtfs enabled in the PACKAGECONFIG) and found that this change drops
> several files from being installed in the native-sysroot.
>=20
> Before this change:
> =E2=9F=AB cat .../tmp/work/x86_64-linux/qemu-native/2.11.1-r0/recipe-sysr=
oot-native/
> installeddeps/libcap-native.39df7fd64afdeb62b13bb47b7969532b
> recipe-sysroot-native/sysroot-providers/libcap-native
> recipe-sysroot-native/usr/include/sys/capability.h
> recipe-sysroot-native/usr/sbin/getpcaps
> recipe-sysroot-native/usr/sbin/capsh
> recipe-sysroot-native/usr/sbin/getcap
> recipe-sysroot-native/usr/sbin/setcap
> recipe-sysroot-native/usr/lib/libcap.so
> recipe-sysroot-native/usr/lib/libcap.so.2.25
> recipe-sysroot-native/usr/lib/libcap.a
> recipe-sysroot-native/usr/lib/libcap.so.2
> recipe-sysroot-native/usr/lib/pkgconfig/libcap.pc
> recipe-sysroot-native/usr/lib/pkgconfig/
> recipe-sysroot-native/sysroot-providers/
> recipe-sysroot-native/usr/include/sys/
> recipe-sysroot-native/usr/include/
> recipe-sysroot-native/usr/share/
> recipe-sysroot-native/usr/sbin/
> recipe-sysroot-native/usr/lib/
> recipe-sysroot-native/usr/
>=20
> After the change:
> =E2=9F=AB cat .../tmp/work/x86_64-linux/qemu-native/2.11.1-r0/recipe-sysr=
oot-native/
> installeddeps/libcap-native.2d12ea82cbd6eeaf25251caae2dce487
> recipe-sysroot-native/sysroot-providers/libcap-native
> recipe-sysroot-native/usr/include/sys/capability.h
> recipe-sysroot-native/usr/sbin/getpcaps
> recipe-sysroot-native/usr/sbin/capsh
> recipe-sysroot-native/usr/sbin/getcap
> recipe-sysroot-native/usr/sbin/setcap
> recipe-sysroot-native/sysroot-providers/
> recipe-sysroot-native/usr/include/sys/
> recipe-sysroot-native/usr/include/
> recipe-sysroot-native/usr/share/
> recipe-sysroot-native/usr/sbin/
> recipe-sysroot-native/usr/lib/
> recipe-sysroot-native/usr/
>=20
> I also believe that the old inline python was also not functioning correc=
tly
> which is why it was believed that the change was non-consequential for no=
n-
> multilib builds. I am looking at putting together a fix but would be more
> than happy if someone else came up with something first.

Sorry, I stand corrected the python is functional, I was getting confused w=
ith=20
the interplay between 'lib' used during make and 'prefix' used during insta=
ll.=20

The issue wtih the -native build is that $base_libdir is influenced by=20
additions made in native.bbclase, specifically:

    # Path prefixes
    base_prefix =3D "${STAGING_DIR_NATIVE}"
    prefix =3D "${STAGING_DIR_NATIVE}${prefix_native}"

Since $base_libdir incorporates $base_prefix:

export base_libdir =3D "${root_prefix}/${baselib}"
where
root_prefix =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', \
    '${exec_prefix}', '${base_prefix}', d)}"

So we end doubling down $STAGING_DIR_NATIVE twice. Once via 'lib=3D' in=20
do_compile and once via 'prefix=3D' in do_install.

Similarly with the 'usrmerge' builds, we are doubling down on '/usr', once =
in=20
do_compile and one in do_install.

I will send out a fix but since the original commit doesn't really describe=
=20
the multiarch breakage I will have to rely on Koen to validate that my chan=
ge=20
doesn't just put us back to where we were.

Mark




>=20
> Mark
>=20
> > Thanks,





