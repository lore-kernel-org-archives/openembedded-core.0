Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 77BD465C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 14:56:47 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u4CEueNM022013; Thu, 12 May 2016 09:56:47 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016051209453029-985004 ;
	Thu, 12 May 2016 09:45:30 -0500 
Date: Thu, 12 May 2016 17:45:42 +0300
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160512174542.332fae80@adi-pc-linux.emea.corp.natinst.com>
In-Reply-To: <CAMKF1sp-cXec1TAWfdVus_Hg46QxF5SMx+7yk5T-MhsUxsEz8Q@mail.gmail.com>
References: <1463058769-8498-1-git-send-email-adrian.ratiu@ni.com>
	<CAMKF1sp-cXec1TAWfdVus_Hg46QxF5SMx+7yk5T-MhsUxsEz8Q@mail.gmail.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 05/12/2016 09:45:30 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 05/12/2016 09:55:58 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-05-12_07:, , signatures=0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.9: fix build with gcc 6
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
X-List-Received-Date: Thu, 12 May 2016 14:56:49 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 12 May 2016 07:38:00 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, May 12, 2016 at 6:12 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> =
wrote:
> > Building gcc-cross 4.9.3 with gcc 6 fails with the following error:
> >
> > error: 'const char* libc=5Fname=5Fp(const char*, unsigned int)' redecla=
red inline with 'gnu=5Finline' attribute
> >
> > This is a backport of the upstream fix. =20
>=20
> I have seen couple of such patches being proposed. I was of the
> opinion to drop 4.9 from master however if we still want to
> refresh it the I would propose that we change the SRC=5FURI to point to
> latest on gcc-4=5F9-branch and remove any backports
> we have done since 4.9.3 release. It can also be merged into krogoth.
> Then we can latest decide if we want to keep 4.9 in
> 2.2 release or not. Would you be able to test such a patch

Actually I'm all for dropping gcc 4 from master. It's about time IMO.

I need this patch to fix the build in krogoth and was just waiting for
feedback on master before I sent this patch there.

I'll resend for krogoth directly then :)

Thank you,
Ioan

>=20
> >
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
> >  .../gcc/gcc-4.9/0076-Fix-build-with-gcc-6.patch    | 151 +++++++++++++=
++++++++
> >  2 files changed, 152 insertions(+)
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0076-Fix-build-wi=
th-gcc-6.patch
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devto=
ols/gcc/gcc-4.9.inc
> > index 208e092..0cd9826 100644
> > --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> > @@ -91,6 +91,7 @@ SRC=5FURI =3D "\
> >      file://0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.pa=
tch \
> >      file://0074-fdebug-prefix-map-support-to-remap-relative-path.patch=
 \
> >      file://0075-libgcc-use-ldflags.patch \
> > +    file://0076-Fix-build-with-gcc-6.patch \
> >  "
> >  SRC=5FURI[md5sum] =3D "6f831b4d251872736e8e9cc09746f327"
> >  SRC=5FURI[sha256sum] =3D "2332b2a5a321b57508b9031354a8503af6fdfb868b8c=
1748d33028d100a8b67e"
> > diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0076-Fix-build-with-gcc-=
6.patch b/meta/recipes-devtools/gcc/gcc-4.9/0076-Fix-build-with-gcc-6.patch
> > new file mode 100644
> > index 0000000..f865d4f
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc-4.9/0076-Fix-build-with-gcc-6.patch
> > @@ -0,0 +1,151 @@
> > +From efdf2b53b907c96ad3f00275588eb311335d0c91 Mon Sep 17 00:00:00 2001
> > +From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > +Date: Thu, 12 May 2016 15:24:25 +0300
> > +Subject: [PATCH] Fix build with gcc 6
> > +
> > +        * Make-lang.in: Invoke gperf with -L C++.
> > +        * cfns.gperf: Remove prototypes for hash and libc=5Fname=5Fp
> > +        inlines.
> > +        * cfns.h: Regenerated.
> > +        * except.c (nothrow=5Flibfn=5Fp): Adjust.
> > +
> > +svn rev: r233572
> > +
> > +Upstream-status: Backport [gcc 4.9]
> > +
> > +Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > +---
> > + gcc/cp/Make-lang.in |  2 +-
> > + gcc/cp/cfns.gperf   | 10 ++--------
> > + gcc/cp/cfns.h       | 41 ++++++++++++++---------------------------
> > + gcc/cp/except.c     |  3 ++-
> > + 4 files changed, 19 insertions(+), 37 deletions(-)
> > +
> > +diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
> > +index bd1c1d7..a0ea0d4 100644
> > +--- a/gcc/cp/Make-lang.in
> > ++++ b/gcc/cp/Make-lang.in
> > +@@ -111,7 +111,7 @@ else
> > + # deleting the $(srcdir)/cp/cfns.h file.
> > + $(srcdir)/cp/cfns.h:
> > + endif
> > +-      gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc=5Fname=5Fp' -L ANSI-=
C \
> > ++      gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc=5Fname=5Fp' -L C++ \
> > +               $(srcdir)/cp/cfns.gperf --output-file $(srcdir)/cp/cfns=
.h
> > +
> > + #
> > +diff --git a/gcc/cp/cfns.gperf b/gcc/cp/cfns.gperf
> > +index 05ca753..d9b16b8 100644
> > +--- a/gcc/cp/cfns.gperf
> > ++++ b/gcc/cp/cfns.gperf
> > +@@ -1,3 +1,5 @@
> > ++%language=3DC++
> > ++%define class-name libc=5Fname
> > + %{
> > + /* Copyright (C) 2000-2014 Free Software Foundation, Inc.
> > +
> > +@@ -16,14 +18,6 @@ for more details.
> > + You should have received a copy of the GNU General Public License
> > + along with GCC; see the file COPYING3.  If not see
> > + <http://www.gnu.org/licenses/>.  */
> > +-#ifdef =5F=5FGNUC=5F=5F
> > +-=5F=5Finline
> > +-#endif
> > +-static unsigned int hash (const char *, unsigned int);
> > +-#ifdef =5F=5FGNUC=5F=5F
> > +-=5F=5Finline
> > +-#endif
> > +-const char * libc=5Fname=5Fp (const char *, unsigned int);
> > + %}
> > + %%
> > + # The standard C library functions, for feeding to gperf; the result =
is used
> > +diff --git a/gcc/cp/cfns.h b/gcc/cp/cfns.h
> > +index c845ddf..65801d1 100644
> > +--- a/gcc/cp/cfns.h
> > ++++ b/gcc/cp/cfns.h
> > +@@ -1,5 +1,5 @@
> > +-/* ANSI-C code produced by gperf version 3.0.3 */
> > +-/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc=5Fname=5Fp =
-L ANSI-C cfns.gperf  */
> > ++/* C++ code produced by gperf version 3.0.4 */
> > ++/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc=5Fname=5Fp =
-L C++ --output-file cfns.h cfns.gperf  */
> > +
> > + #if !((' ' =3D=3D 32) && ('!' =3D=3D 33) && ('"' =3D=3D 34) && ('#' =
=3D=3D 35) \
> > +       && ('%' =3D=3D 37) && ('&' =3D=3D 38) && ('\'' =3D=3D 39) && ('=
(' =3D=3D 40) \
> > +@@ -28,7 +28,7 @@
> > + #error "gperf generated tables don't work with this execution charact=
er set. Please report a bug to <bug-gnu-gperf@gnu.org>."
> > + #endif
> > +
> > +-#line 1 "cfns.gperf"
> > ++#line 3 "cfns.gperf"
> > +
> > + /* Copyright (C) 2000-2014 Free Software Foundation, Inc.
> > +
> > +@@ -47,25 +47,18 @@ for more details.
> > + You should have received a copy of the GNU General Public License
> > + along with GCC; see the file COPYING3.  If not see
> > + <http://www.gnu.org/licenses/>.  */
> > +-#ifdef =5F=5FGNUC=5F=5F
> > +-=5F=5Finline
> > +-#endif
> > +-static unsigned int hash (const char *, unsigned int);
> > +-#ifdef =5F=5FGNUC=5F=5F
> > +-=5F=5Finline
> > +-#endif
> > +-const char * libc=5Fname=5Fp (const char *, unsigned int);
> > + /* maximum key range =3D 391, duplicates =3D 0 */
> > +
> > +-#ifdef =5F=5FGNUC=5F=5F
> > +-=5F=5Finline
> > +-#else
> > +-#ifdef =5F=5Fcplusplus
> > +-inline
> > +-#endif
> > +-#endif
> > +-static unsigned int
> > +-hash (register const char *str, register unsigned int len)
> > ++class libc=5Fname
> > ++{
> > ++private:
> > ++  static inline unsigned int hash (const char *str, unsigned int len);
> > ++public:
> > ++  static const char *libc=5Fname=5Fp (const char *str, unsigned int l=
en);
> > ++};
> > ++
> > ++inline unsigned int
> > ++libc=5Fname::hash (register const char *str, register unsigned int le=
n)
> > + {
> > +   static const unsigned short asso=5Fvalues[] =3D
> > +     {
> > +@@ -122,14 +115,8 @@ hash (register const char *str, register unsigned=
 int len)
> > +   return hval + asso=5Fvalues[(unsigned char)str[len - 1]];
> > + }
> > +
> > +-#ifdef =5F=5FGNUC=5F=5F
> > +-=5F=5Finline
> > +-#ifdef =5F=5FGNUC=5FSTDC=5FINLINE=5F=5F
> > +-=5F=5Fattribute=5F=5F ((=5F=5Fgnu=5Finline=5F=5F))
> > +-#endif
> > +-#endif
> > + const char *
> > +-libc=5Fname=5Fp (register const char *str, register unsigned int len)
> > ++libc=5Fname::libc=5Fname=5Fp (register const char *str, register unsi=
gned int len)
> > + {
> > +   enum
> > +     {
> > +diff --git a/gcc/cp/except.c b/gcc/cp/except.c
> > +index 221971a..32340f5 100644
> > +--- a/gcc/cp/except.c
> > ++++ b/gcc/cp/except.c
> > +@@ -1030,7 +1030,8 @@ nothrow=5Flibfn=5Fp (const=5Ftree fn)
> > +      unless the system headers are playing rename tricks, and if
> > +      they are, we don't want to be confused by them.  */
> > +   id =3D DECL=5FNAME (fn);
> > +-  return !!libc=5Fname=5Fp (IDENTIFIER=5FPOINTER (id), IDENTIFIER=5FL=
ENGTH (id));
> > ++  return !!libc=5Fname::libc=5Fname=5Fp (IDENTIFIER=5FPOINTER (id),
> > ++                                 IDENTIFIER=5FLENGTH (id));
> > + }
> > +
> > + /* Returns nonzero if an exception of type FROM will be caught by a
> > +--
> > +2.8.2
> > +
> > --
> > 2.8.2
> >
> > --
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core =20


