Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E03CD71AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 18:26:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w48IQmg4002869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 May 2018 11:26:48 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.60.223) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 8 May 2018 11:26:47 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 May 2018 14:26:47 -0400
Message-ID: <2438346.XpoQbIzh2t@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CAHYQr0rKoHVVKec=Au7PX-TM=dMMPVbUdNJahvLaFzK6NAck8A@mail.gmail.com>
References: <20180416130021.4428-1-koen.kooi@linaro.org>
	<20180416130021.4428-2-koen.kooi@linaro.org>
	<CAHYQr0rKoHVVKec=Au7PX-TM=dMMPVbUdNJahvLaFzK6NAck8A@mail.gmail.com>
MIME-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 08 May 2018 18:26:50 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Tuesday, May 8, 2018 1:46:43 PM EDT Ricardo Salveti wrote:
> On Mon, Apr 16, 2018 at 10:00 AM, Koen Kooi <koen@dominion.thruhere.net>=
=20
wrote:
> > The recipe wants to install libs into base_libdir, but uses "basename
> > $libdir" to derive that. That breaks in a multiarch setup. Use the prop=
er
> > variable and remove the inline python usage.
> >=20
> > Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > ---
> >=20
> >  meta/recipes-support/libcap/libcap_2.25.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-support/libcap/libcap_2.25.bb
> > b/meta/recipes-support/libcap/libcap_2.25.bb index d619a2e..47ecf34
> > 100644
> > --- a/meta/recipes-support/libcap/libcap_2.25.bb
> > +++ b/meta/recipes-support/libcap/libcap_2.25.bb
> > @@ -32,7 +32,7 @@ PACKAGECONFIG[pam] =3D "PAM_CAP=3Dyes,PAM_CAP=3Dno,li=
bpam"
> >=20
> >  EXTRA_OEMAKE =3D " \
> > =20
> >    INDENT=3D  \
> >=20
> > -  lib=3D${@os.path.basename('${libdir}')} \
> > +  lib=3D'${base_libdir}' \
> >=20
> >    RAISE_SETFCAP=3Dno \
> >    DYNAMIC=3Dyes \
> >    BUILD_GPERF=3Dyes \
>=20
> This creates a build failure when usrmerge is used, as libcap expects
> only the lib folder name and not the lib path (and when usrmerge is
> enabled base_libdir gets set to /usr/lib instead of /lib).
>=20
> Since base_libdir and libdir are all based out baselib, can you
> provide more details about how that broke your multiarch setup?
>=20
> The failure when usrmerge is used:
> WARNING: libcap-2.25-r0 do_package: QA Issue: libcap:
> Files/directories were installed but not shipped in any package:
>   /usr/lib
>   /usr/usr/lib/libcap.so
>   /usr/usr/lib/libcap.so.2
>   /usr/usr/lib/libcap.so.2.25
>   /usr/usr/lib/libcap.a
>   /usr/usr/lib/pkgconfig
>   /usr/usr/lib/pkgconfig/libcap.pc
>   /usr/usr/lib/security/pam_cap.so

Agreed. I just started to determine how this is breaking qemu-native (with=
=20
virtfs enabled in the PACKAGECONFIG) and found that this change drops sever=
al=20
files from being installed in the native-sysroot.

Before this change:
=E2=9F=AB cat .../tmp/work/x86_64-linux/qemu-native/2.11.1-r0/recipe-sysroo=
t-native/
installeddeps/libcap-native.39df7fd64afdeb62b13bb47b7969532b=20
recipe-sysroot-native/sysroot-providers/libcap-native
recipe-sysroot-native/usr/include/sys/capability.h
recipe-sysroot-native/usr/sbin/getpcaps
recipe-sysroot-native/usr/sbin/capsh
recipe-sysroot-native/usr/sbin/getcap
recipe-sysroot-native/usr/sbin/setcap
recipe-sysroot-native/usr/lib/libcap.so
recipe-sysroot-native/usr/lib/libcap.so.2.25
recipe-sysroot-native/usr/lib/libcap.a
recipe-sysroot-native/usr/lib/libcap.so.2
recipe-sysroot-native/usr/lib/pkgconfig/libcap.pc
recipe-sysroot-native/usr/lib/pkgconfig/
recipe-sysroot-native/sysroot-providers/
recipe-sysroot-native/usr/include/sys/
recipe-sysroot-native/usr/include/
recipe-sysroot-native/usr/share/
recipe-sysroot-native/usr/sbin/
recipe-sysroot-native/usr/lib/
recipe-sysroot-native/usr/

After the change:
=E2=9F=AB cat .../tmp/work/x86_64-linux/qemu-native/2.11.1-r0/recipe-sysroo=
t-native/
installeddeps/libcap-native.2d12ea82cbd6eeaf25251caae2dce487
recipe-sysroot-native/sysroot-providers/libcap-native
recipe-sysroot-native/usr/include/sys/capability.h
recipe-sysroot-native/usr/sbin/getpcaps
recipe-sysroot-native/usr/sbin/capsh
recipe-sysroot-native/usr/sbin/getcap
recipe-sysroot-native/usr/sbin/setcap
recipe-sysroot-native/sysroot-providers/
recipe-sysroot-native/usr/include/sys/
recipe-sysroot-native/usr/include/
recipe-sysroot-native/usr/share/
recipe-sysroot-native/usr/sbin/
recipe-sysroot-native/usr/lib/
recipe-sysroot-native/usr/

I also believe that the old inline python was also not functioning correctl=
y=20
which is why it was believed that the change was non-consequential for non-
multilib builds. I am looking at putting together a fix but would be more t=
han=20
happy if someone else came up with something first.

Mark


>=20
> Thanks,





