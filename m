Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TxFlg-0003Mb-MA for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 12:42:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0LBQulu016002;
	Mon, 21 Jan 2013 11:26:56 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04712-09; Mon, 21 Jan 2013 11:26:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0LBQiP9015996
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 21 Jan 2013 11:26:48 GMT
Message-ID: <1358767605.14265.53.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Mon, 21 Jan 2013 11:26:45 +0000
In-Reply-To: <A551BDF323A45B48ACE6A404AA16A1C4127970C8@TOP-EX01.TOPIC.LOCAL>
References: <A551BDF323A45B48ACE6A404AA16A1C4127970C8@TOP-EX01.TOPIC.LOCAL>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: (No subject)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 11:42:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-21 at 10:49 +0000, Mike Looijmans wrote:
> This mail bounced so the v2 patch overtook it...
> 
> >> From: Mike Looijmans <mike.looijmans@topic.nl>
> >>
> >> Multicore embedded systems are getting more and more common.
> >>
> >> Remove "--disable-openmp" from the GCC configuration options and
> >> always build libgomp. This only creates a "bigger" compiler but
> >> has no effect on the compiled binaries that don't use openmp.
> >>
> >> Tested a clean build on mips32el and arm7a, no problems encountered.
> >>
> >> Autoconf will not detect OpenMP after this change, because it will
> >> build and run a target binary on the build system. In order to use
> >> OpenMP, the variable ac_cv_prog_c_openmp=-fopenmp must be set.
> >> ---
> >>  meta/recipes-devtools/gcc/gcc-4.7.inc              |    9 +++------
> >>  .../recipes-devtools/gcc/gcc-configure-runtime.inc |    4 +---
> >>  .../recipes-devtools/gcc/gcc-cross-canadian_4.7.bb |    2 +-
> >>  3 files changed, 5 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc
> >> b/meta/recipes-devtools/gcc/gcc-4.7.inc
> >> index 08a0103..a7aa4a4 100644
> >> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> >> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> >> @@ -88,7 +88,6 @@ JAVA = ""
> >>  EXTRA_OECONF_BASE = " --enable-lto \
> >>                       --enable-libssp \
> >>                       --disable-bootstrap \
> >> -                     --disable-libgomp \
> >>                       --disable-libmudflap \
> >>                       --with-system-zlib \
> >> --with-linker-hash-style=${LINKER_HASH_STYLE} \
> >> @@ -99,7 +98,6 @@ EXTRA_OECONF_BASE = " --enable-lto \
> >>                       --enable-cheaders=c_global "
> >>
> >>  EXTRA_OECONF_INITIAL = "--disable-libmudflap \
> >> -                     --disable-libgomp \
> >>                       --disable-libssp \
> >>                       --disable-libquadmath \
> >>                       --with-system-zlib \
> >> @@ -108,7 +106,6 @@ EXTRA_OECONF_INITIAL = "--disable-libmudflap \
> >>                       --enable-decimal-float=no"
> >>
> >>  EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap \
> >> -                             --disable-libgomp \
> >>                               --disable-libquadmath \
> >>                               --with-system-zlib \
> >>                               --disable-lto \
> >
> >
> > I nearly took this however you still want this disabled in the
> > INITIAL/INTERMEDIATE versions, you're just wasting compile time there sa
> > nothing would use it.
> 
> I don't see the harm in allowing OpenMP usage in build tools (e.g. image
> processing on the build machine), but if it gets the patch through
> sooner, I'll happily remove it. I tend to run unit tests on my build
> system, using OE's compiler version, so it's nice if both host and build
> compilers accept the same options.

The initial/intermediate compiles are only used to build libc and the
final "proper" cross compiler. Since none of these use or benefit from
libgomp, its simply wasting build time having this enabled there.

I'm ok with enabling things where there is a use for them but I also
perfer having an efficient build process where we can. This is why there
are various things disabled above for initial/intermediate.

> >> b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> >> index 53c4632..6c048c0 100644
> >> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> >> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> >> @@ -13,7 +13,7 @@ SYSTEMLIBS = "${target_base_libdir}/"
> >>  SYSTEMLIBS1 = "${target_libdir}/"
> >>
> >>  EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
> >> -             --disable-libgomp --disable-libmudflap \
> >> +             --disable-libmudflap \
> >
> >
> > Again, I'm wondering if you mean this here. The library would have been
> > built as part of the target build? Does the library need gcc support as
> > well as its presence?
> >
> 
> Same motivation as above actually, I see no harm in allowing it. Again,
> I'll remove it for quickness, I'm quite eager to see OpenMP support in OE.

It leads to inconsistencies with other libraries and behaviour so I'm
happier with this being left disabled here, unless someone can point me
at a good reason why we should enable it.

> I'll post a much smaller V2 patch.

Thanks. This will likely go in after M3. I don't fancy changing the
compiler this close to the M3 build (feature freeze for M3 was
yesterday). I will queue it in master-next for now.

Cheers,

Richard



