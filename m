Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 18925755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 21:31:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 29 Oct 2015 14:31:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,216,1444719600"; d="scan'208";a="674614648"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by orsmga003.jf.intel.com with ESMTP; 29 Oct 2015 14:31:16 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Thu, 29 Oct 2015 14:31:14 -0700
Received: from orsmsx109.amr.corp.intel.com ([169.254.2.19]) by
	ORSMSX156.amr.corp.intel.com ([169.254.8.249]) with mapi id
	14.03.0248.002; Thu, 29 Oct 2015 14:31:14 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "Hatle, Mark G (Wind River)" <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jurobystricky@hotmail.com"
	<jurobystricky@hotmail.com>
Thread-Topic: [OE-core] [PATCH 1/1] glibc: Allow 64 bit atomics for x86
Thread-Index: AQHREott3rbiPCLq50yapwd6c82ivJ6DahSA//+SIkA=
Date: Thu, 29 Oct 2015 21:31:14 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6108DAD4F@ORSMSX109.amr.corp.intel.com>
References: <1446151418-16034-1-git-send-email-juro.bystricky@intel.com>
	<1446151418-16034-2-git-send-email-juro.bystricky@intel.com>
	<5632890B.2010405@windriver.com>
In-Reply-To: <5632890B.2010405@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] glibc: Allow 64 bit atomics for x86
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
X-List-Received-Date: Thu, 29 Oct 2015 21:31:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for your quick reply.
Yes, the way you propose to apply the patch is cleaner, leaving i386 and i4=
86 unaffected.=20
However, they do not work already, so I cannot  do them any more harm.
Quark does support cmpxchg8b, so in theory it should work. But as you point=
ed out,
there are many errata for Quark atomic ops, so it is not guaranteed.




> -----Original Message-----
> From: Mark Hatle [mailto:mark.hatle@windriver.com]
> Sent: Thursday, October 29, 2015 2:01 PM
> To: Bystricky, Juro; openembedded-core@lists.openembedded.org;
> jurobystricky@hotmail.com
> Subject: Re: [OE-core] [PATCH 1/1] glibc: Allow 64 bit atomics for x86
>=20
> On 10/29/15 3:43 PM, Juro Bystricky wrote:
> > This patch fixes [YOCTO#8140].
> >
> > The fix consist of allowing 64bit atomic ops for x86.
> > This should be safe for i586 and newer CPUs.
> > It also makes the synchronization more efficient.
>=20
> I'm not sure this is correct.. see below.
>=20
> > Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> > ---
> >  .../glibc/glibc/use_64bit_atomics.patch            | 24
> ++++++++++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.22.bb              |  1 +
> >  2 files changed, 25 insertions(+)
> >  create mode 100644
> > meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
> >
> > diff --git a/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
> > b/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
> > new file mode 100644
> > index 0000000..eb7f2b2
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
> > @@ -0,0 +1,24 @@
> > +This patch alows using 64 bit atomic instructions on a
> > +32 bit platform. This is safe, providing x86 is Pentium or later
> > +(would not work on i386, i486). Using 64 bit atomic instructions
> > +bypasses code containing a bug as documented in
> > +https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8140
> > +
> > +Upstream-Status: TBD
> > +
> > +Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> > +
> > +
> > +Index: libc/sysdeps/i386/i486/bits/atomic.h
> >
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- libc.orig/sysdeps/i386/i486/bits/atomic.h
> > ++++ libc/sysdeps/i386/i486/bits/atomic.h
> > +@@ -54,7 +54,7 @@ typedef uintmax_t uatomic_max_t;  # endif  #endif
> > +
> > +-#define __HAVE_64B_ATOMICS 0
> > ++#define __HAVE_64B_ATOMICS 1
> > + #define USE_ATOMIC_COMPILER_BUILTINS 0
>=20
> The patch will enable it for i486 and above, but you comment says i486 is=
n't
> supported.
>=20
> Normally you'd resolve this by creating a new
>=20
> sysdeps/i386/i586/bits/atomic.h
>=20
> (include or copy the original file)
>=20
> and adjust the HAVE_64B_ATOMICS value at that point.
>=20
> Then the sources will work for older systems and newer.
>=20
> While 386/486 is likely not used much these days... I do also have a conc=
ern
> about Quark CPUs.  Do you know if they support the 64B ATOMICS?  (I
> suspect they do not.)  If that is the case, we might need to special case=
 this
> patch and make it 'i686' and above?
>=20
> --Mark
>=20
> > +
> > diff --git a/meta/recipes-core/glibc/glibc_2.22.bb
> > b/meta/recipes-core/glibc/glibc_2.22.bb
> > index 020e417..2494ad7 100644
> > --- a/meta/recipes-core/glibc/glibc_2.22.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.22.bb
> > @@ -50,6 +50,7 @@ SRC_URI_append_class-nativesdk =3D "\
> >             file://0001-nativesdk-glibc-Look-for-host-system-ld.so.cach=
e-as-
> .patch \
> >             file://0002-nativesdk-glibc-Fix-buffer-overrun-with-a-reloc=
ated-
> .patch \
> >
> > file://0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
> > \
> > +           file://use_64bit_atomics.patch \
> >  "
> >
> >  S =3D "${WORKDIR}/git"
> >


