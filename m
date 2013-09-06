Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB1E6156E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 09:34:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r869lSxU012158; Fri, 6 Sep 2013 10:47:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ybgOuoZBO-4H; Fri,  6 Sep 2013 10:47:28 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r869lPK7012152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 6 Sep 2013 10:47:26 +0100
Message-ID: <1378460046.32427.96.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 06 Sep 2013 10:34:06 +0100
In-Reply-To: <165EE9CC-A70F-4416-8743-BE00BF7B8B93@gmail.com>
References: <1378415843.32427.84.camel@ted>
	<165EE9CC-A70F-4416-8743-BE00BF7B8B93@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] gcc-runtime: Hacks for libgfortran with gcc-4.8
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
X-List-Received-Date: Fri, 06 Sep 2013 09:34:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-06 at 00:08 -0700, Khem Raj wrote:
> On Sep 5, 2013, at 2:17 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > These are the hacks I needed to make libgfortran build. This is ugly, no
> > argument from me. We could probably get better results if we patch
> > configure and libtool to stop doing nasty things. I've probably taken
> > this as far as I'd want to though, not being a particular fan of
> > fortran...
> > 
> > Khem: Any thoughts on this?
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > index 2599760..395623f 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > @@ -18,6 +18,9 @@ RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
> > # libmudflap
> > # libgfortran
> > 
> > +DEPENDS_append = " chrpath-replacement-native"
> > +EXTRANATIVEPATH += "chrpath-native"
> > +
> > do_configure () {
> > 	export CXX="${CXX} -nostdinc++ -nostdlib++"
> > 	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
> > @@ -30,6 +33,11 @@ do_configure () {
> > 		cd ${B}/$target/$d/
> > 		chmod a+x ${S}/$d/configure
> > 		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
> > +		# Ugly hack, libgfortran configure looks for ../libquadmath/libquadmath.la
> 
> Maybe we should explicitly --enable-libquadmath in gcc-cross when fortran is asked for in RUNTIMETARGETS
> might avoid some of below.

That would mean the gcc-cross recipe has to package it. We've basically
now agreed and changed the code so all the packaging doesn't happen in
-cross packages since it was always problematic.

FWIW I also tried disabling quadmath but that caused different build
failures.

> > 
> > +		# so we need to compile it before configure
> > +		if [ "$d" = "libquadmath" ]; then
> > +			oe_runmake MULTIBUILDTOP=${B}/$target/$d/
> > +		fi
> > 	done
> > }
> > 
> > @@ -38,6 +46,16 @@ do_compile () {
> > 	for d in libgcc ${RUNTIMETARGET}; do
> > 		cd ${B}/$target/$d/
> > 		oe_runmake MULTIBUILDTOP=${B}/$target/$d/
> > +		if [ "$d" = "libgfortran" ]; then
> > +			# libtool needs libdir to match the final installation directory which configure
> > +			# sets from output from this command (e.g. both set to /usr/lib/../lib
> > +			# It also adds bogus RPATHS which we have to delete
> > +			fulllibdir=`$CC -print-multi-os-directory`
> > +			if [ $fulllibdir != "." ]; then
> > +				sed -i -e "s#relink_command=.*#relink_command=#" ${B}/$target/$d/libgfortran.la
> > +				chrpath -d `readlink -f ${B}/$target/$d/.libs/libgfortran.so`
> > +			fi
> > +		fi
> 
> hmm remind me but I think we use unmodified libtool that comes with gcc IIRC. if we used libtool-cross then this could
> be fixed there

We do use libtool from gcc, yes. To do otherwise safely, you have to
reautoconf gcc which "is painful". Mixing two libtool versions usually
gives stacks of errors so our only option would be to patch libtool in
gcc to apply our patches. Even then, I'm not sure they'd cope with the
way quadmath is linked :/.

This is why I ended up hacking things in the metadata since it seemed
the least worse solution...

Cheers,

Richard


