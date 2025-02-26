Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DC2C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 13:37:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.5736.1740577054868171023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 05:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tnHbQ-0004Hp-Rs; Wed, 26 Feb 2025 14:37:32 +0100
Message-ID: <2de5a99f9e322de4e58009657471dc2fb8095e1f.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v2 2/2] barebox: upgrade 2024.12.0 -> 2025.01.0
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Date: Wed, 26 Feb 2025 14:37:31 +0100
In-Reply-To: <1a634941-bcb7-42c4-9c7d-283e3325ebd2@pengutronix.de>
References: <20250127153944.676370-1-ejo@pengutronix.de>
	 <20250127153944.676370-2-ejo@pengutronix.de>
	 <CAMKF1sqX7gFCEH78fHS+jkUSieL5crAU_RwAUO-daJL0u+fj0g@mail.gmail.com>
	 <1a634941-bcb7-42c4-9c7d-283e3325ebd2@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 13:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211957

Am Montag, dem 27.01.2025 um 21:01 +0100 schrieb Ahmad Fatoum:
> On 27.01.25 20:06, Khem Raj wrote:
> > On Mon, Jan 27, 2025 at 7:40=E2=80=AFAM Enrico J=C3=B6rns via
> > lists.openembedded.org <ejo=3Dpengutronix.de@lists.openembedded.org>
> > wrote:
> > >=20
> > > Changes:
> > >=20
> > > * Added LLVM/Clang support for the sandbox architecture.
> > > * Enabled command execution from the sandbox command line.
> > > * Improved TFTP with dentry caching and default-disabled window size.
> > > * Introduced hardening features: register zeroing, stack variable
> > > =C2=A0 initialization, and malloc buffer zeroing.
> > > * Enhanced AM625 support with network support, watchdog driver, and
> > > =C2=A0 bootsource detection.
> > >=20
> > > Changelog: https://lore.barebox.org/barebox/Z4oUYdHXEAtnkySC@pengutro=
nix.de/T/#u
> > >=20
> > > Also adds a new patch created for fixing barebox-tools build with mus=
l.
> > >=20
> > > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > > ---
> > > v1 -> v2:
> > > =C2=A0 * added barebox patch file to fix musl build (by Ahmad Fatoum)
> > > =C2=A0 * minor wording change in 'Changes'
> > > =C2=A0 [* added patch to remove old barebox .patch file]
> > >=20
> > > =C2=A0meta/recipes-bsp/barebox/barebox-common.inc=C2=A0=C2=A0 |=C2=A0=
 6 +-
> > > =C2=A0...linux-types.h-define-loff_t-for-musl.patch | 57 ++++++++++++=
+++++++
> > > =C2=A02 files changed, 61 insertions(+), 2 deletions(-)
> > > =C2=A0create mode 100644 meta/recipes-bsp/barebox/files/0001-scripts-=
include-linux-types.h-define-
> > > loff_t-for-musl.patch
> > >=20
> > > diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recip=
es-bsp/barebox/barebox-
> > > common.inc
> > > index fce3b825ae..13f1d81289 100644
> > > --- a/meta/recipes-bsp/barebox/barebox-common.inc
> > > +++ b/meta/recipes-bsp/barebox/barebox-common.inc
> > > @@ -3,6 +3,8 @@ SECTION =3D "bootloaders"
> > >=20
> > > =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000b9ca1f0d=
3364286c4192"
> > >=20
> > > -PV =3D "2024.12.0"
> > > +PV =3D "2025.01.0"
> > > =C2=A0SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2=
"
> > > -SRC_URI[sha256sum] =3D "717a2416b37942f584b0bb2eb61ccbf85dc0f1a5c841=
318f47cd6967b9c4dcab"
> > > +SRC_URI[sha256sum] =3D "288a838e6fe8897ea46dabd112e42287177353c88a7d=
442cefc8be8d1a85f5b5"
> > > +
> > > +SRC_URI +=3D "file://0001-scripts-include-linux-types.h-define-loff_=
t-for-musl.patch"
> > > diff --git a/meta/recipes-bsp/barebox/files/0001-scripts-include-linu=
x-types.h-define-loff_t-
> > > for-musl.patch b/meta/recipes-bsp/barebox/files/0001-scripts-include-=
linux-types.h-define-
> > > loff_t-for-musl.patch
> > > new file mode 100644
> > > index 0000000000..bce9d2ebf5
> > > --- /dev/null
> > > +++ b/meta/recipes-bsp/barebox/files/0001-scripts-include-linux-types=
.h-define-loff_t-for-
> > > musl.patch
> > > @@ -0,0 +1,57 @@
> > > +From e46f4add079bbae4ac0926ed113e393786e89bef Mon Sep 17 00:00:00 20=
01
> > > +From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > > +Date: Mon, 27 Jan 2025 15:31:46 +0100
> > > +Subject: [PATCH] scripts: include/linux/types.h: define loff_t for m=
usl
> > > +MIME-Version: 1.0
> > > +Content-Type: text/plain; charset=3DUTF-8
> > > +Content-Transfer-Encoding: 8bit
> > > +
> > > +musl doesn't define loff_t, but glibc does and both of them define
> > > +__linux__. This leads to build errors with musl when code makes it i=
nto
> > > +scripts/ that uses loff_t. This was already fixed once e.g. in commi=
t
> > > +c0d065fb0aa0 ("scripts: bareboximd: remove usage of loff_t").
> > > +
> > > +Instead of playing whack-a-mole in future, let's just define loff_t
> > > +for non-glibc builds of scripts/.
> > > +
> >=20
> > loff_t is not posix defined but it is available in musl.
> > you need to add -D_GNU_SOURCE to the compiler cmdline.
>=20
> I somehow thought _GNU_SOURCE was already being set globally, but you're
> right: Not all files were setting it.
>=20
> I just Cc'd you on a patch[1] to define it on the compiler command line i=
nstead.
>=20
> [1]: https://lore.kernel.org/barebox/20250127195109.3928003-1-a.fatoum@pe=
ngutronix.de/T/#u

FTR: The musl compatibility was now fixed shortly before barebox 2025.02.0 =
came out.
It does not really make sense to backport these patches to 2025.01.0.
Instead I'll send an update to the 2025.02.0 version.

Thank you all and regards,
Enrico

> Thanks,
> Ahmad
>=20
> >=20
> > > +Also, make sure <linux/types.h> is always included for scripts/commo=
n.h,
> > > +which is the only header currently making use of loff_t.
> > > +
> > > +Fixes: 5171f4d0696f ("scripts: implement read_fd and pread_full for =
tools")
> > > +Upstream-Status: Submitted
> > > [https://lore.barebox.org/barebox/20250127143146.2965544-1-a.fatoum@p=
engutronix.de/T/#u]
> > > +Reported-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > > +Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > > +---
> > > + scripts/common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
> > > + scripts/include/linux/types.h | 2 +-
> > > + 2 files changed, 3 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/scripts/common.h b/scripts/common.h
> > > +index a0d16606b5..21ec576a5b 100644
> > > +--- a/scripts/common.h
> > > ++++ b/scripts/common.h
> > > +@@ -1,6 +1,8 @@
> > > + #ifndef __COMMON_H
> > > + #define __COMMON_H
> > > +
> > > ++#include <linux/types.h>
> > > ++
> > > + int read_file_2(const char *filename, size_t *size, void **outbuf, =
size_t max_size);
> > > + void *read_file(const char *filename, size_t *size);
> > > + void *read_fd(int fd, size_t *out_size);
> > > +diff --git a/scripts/include/linux/types.h b/scripts/include/linux/t=
ypes.h
> > > +index e81d7e8101..02a330cd4e 100644
> > > +--- a/scripts/include/linux/types.h
> > > ++++ b/scripts/include/linux/types.h
> > > +@@ -14,7 +14,7 @@ typedef int16_t __s16;
> > > + typedef uint8_t __u8;
> > > + typedef int8_t __s8;
> > > +
> > > +-#ifndef __linux__
> > > ++#ifndef __GLIBC__
> > > + typedef long long loff_t;
> > > + #endif
> > > +
> > > +--
> > > +2.39.5
> > > +
> > > --
> > > 2.39.5
> > >=20
> > >=20
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#210302): https://lists.openembedded.org/g/openemb=
edded-core/message/210302
> > > Mute This Topic: https://lists.openembedded.org/mt/110840770/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
=C2=A0[raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >=20
> >=20
>=20
>=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

