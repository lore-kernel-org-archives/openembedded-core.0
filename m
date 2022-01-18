X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Wed, 19 Jan 2022 00:33:19 +0100
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH] btrfs-tools: upgrade 5.15.1 -> 5.16
Message-ID: <YedOP/gu/Ie9IA9Q@piout.net>
References: <1642429806-13814-1-git-send-email-wangmy@fujitsu.com>
 <1e222f92ac63e24af60aaa92adfbb2aebfe150ee.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1e222f92ac63e24af60aaa92adfbb2aebfe150ee.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-id: <openembedded-core.lists.openembedded.org>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, "wangmy@fujitsu.com" <wangmy@fujitsu.com>

Hello,

On 17/01/2022 23:39:50+0000, Anuj Mittal wrote:
> On Mon, 2022-01-17 at 22:30 +0800, wangmy wrote:
> > Changelog:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =A0- rescue: new subcommand clear-uuid-tree to fix failed mount due to
> > bad uuid
> > =A0=A0 subvolume keys, caught by tree-checker
> > =A0- fi du: skip inaccessible files
> > =A0- prop: properly resolve to symlink targets
> > =A0- send, receive: fix crash after parent subvolume lookup errors
> > =A0- build:
> > =A0=A0 fix build on 5.12+ kernels due to changes in linux/kernel.h
> > =A0=A0 fix build on musl with old kernel headers
> > =A0- other:
> > =A0=A0 error handling fixes, cleanups, refactoring
> > =A0=A0 extent tree v2 preparatory work
> > =A0=A0 lots of RST documentation updates (last release with asciidoc
> > sources),
> > =A0=A0 https://btrfs.readthedocs.io
> >=20
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> > =A0...ools-include-linux-const.h-to-fix-build-with-.patch | 10 ++++----
> > --
> > =A0.../{btrfs-tools_5.15.1.bb =3D> btrfs-tools_5.16.bb}=A0=A0=A0=A0 |=
=A0 2 +-
> > =A02 files changed, 5 insertions(+), 7 deletions(-)
> > =A0rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.15.1.bb =3D>
> > btrfs-tools_5.16.bb} (98%)
> >=20
> > diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-
> > btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> > b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-
> > include-linux-const.h-to-fix-build-with-.patch
> > index be942388a5..bd69bfc9cd 100644
> > --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-
> > include-linux-const.h-to-fix-build-with-.patch
> > +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-
> > include-linux-const.h-to-fix-build-with-.patch
> > @@ -1,4 +1,4 @@
> > -From 3d19b0fb882c5e195362a9f0909c474e60070ca0 Mon Sep 17 00:00:00
> > 2001
> > +From 1c9cc81ec72876a5351e3083552b9985eeb6c091 Mon Sep 17 00:00:00
> > 2001
> > =A0From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > =A0Date: Fri, 18 Jun 2021 11:10:36 -0400
> > =A0Subject: [PATCH] btrfs-progs: include linux/const.h to fix build
> > with 5.12+
> > @@ -21,22 +21,20 @@ exists, and is valid to include.
> > =A0Upstream-Status: Inappropriate [mips64 + musl + libc-headers]
> > =A0
> > =A0Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > +
> > =A0---
> > =A0 kerncompat.h | 1 +
> > =A0 1 file changed, 1 insertion(+)
> > =A0
> > =A0diff --git a/kerncompat.h b/kerncompat.h
> > -index df167fe6..254235bd 100644
> > +index 6ca1526e..15995bb4 100644
> > =A0--- a/kerncompat.h
> > =A0+++ b/kerncompat.h
> > =A0@@ -30,6 +30,7 @@
> > =A0 #include <linux/types.h>
> > - #include <linux/kernel.h>
> > + #include <linux/const.h>
> > =A0 #include <stdint.h>
> > =A0+#include <linux/const.h>
>=20
> This patch should be removed.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/com=
mit/kerncompat.h?id=3Db28f7bd9bba6f65258da48955154794f466b4104
>=20

I guess we actually need to backport this one:
https://github.com/kdave/btrfs-progs/commit/b0cfe12c4d4b8b4ef335cdf4ddefcbd=
cd1b70d58

It should fix the issue as reported in https://github.com/kdave/btrfs-progs=
/pull/433


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
