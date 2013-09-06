Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4CEC06BDAC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 17:05:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r86HI53P030322; Fri, 6 Sep 2013 18:19:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hEFV280aWigR; Fri,  6 Sep 2013 18:19:03 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r86HJ0KN030340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 6 Sep 2013 18:19:01 +0100
Message-ID: <1378487137.3484.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 06 Sep 2013 18:05:37 +0100
In-Reply-To: <50C050F1-3F84-419B-8053-D8DCA38FFFA7@gmail.com>
References: <1378415843.32427.84.camel@ted>
	<165EE9CC-A70F-4416-8743-BE00BF7B8B93@gmail.com>
	<1378460046.32427.96.camel@ted>
	<50C050F1-3F84-419B-8053-D8DCA38FFFA7@gmail.com>
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
X-List-Received-Date: Fri, 06 Sep 2013 17:05:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-06 at 09:54 -0700, Khem Raj wrote:
> On Sep 6, 2013, at 2:34 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > On Fri, 2013-09-06 at 00:08 -0700, Khem Raj wrote:
> >> On Sep 5, 2013, at 2:17 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> >> 
> >>> These are the hacks I needed to make libgfortran build. This is ugly, no
> >>> argument from me. We could probably get better results if we patch
> >>> configure and libtool to stop doing nasty things. I've probably taken
> >>> this as far as I'd want to though, not being a particular fan of
> >>> fortran...
> >>> 
> >>> Khem: Any thoughts on this?
> >>> 
> >>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>> ---
> >>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> >>> index 2599760..395623f 100644
> >>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> >>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> >>> @@ -18,6 +18,9 @@ RUNTIMETARGET = "libssp libstdc++-v3 libgomp"
> >>> # libmudflap
> >>> # libgfortran
> >>> 
> >>> +DEPENDS_append = " chrpath-replacement-native"
> >>> +EXTRANATIVEPATH += "chrpath-native"
> >>> +
> >>> do_configure () {
> >>> 	export CXX="${CXX} -nostdinc++ -nostdlib++"
> >>> 	mtarget=`echo ${MULTIMACH_TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
> >>> @@ -30,6 +33,11 @@ do_configure () {
> >>> 		cd ${B}/$target/$d/
> >>> 		chmod a+x ${S}/$d/configure
> >>> 		${S}/$d/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
> >>> +		# Ugly hack, libgfortran configure looks for ../libquadmath/libquadmath.la
> >> 
> >> Maybe we should explicitly --enable-libquadmath in gcc-cross when fortran is asked for in RUNTIMETARGETS
> >> might avoid some of below.
> > 
> > That would mean the gcc-cross recipe has to package it. We've basically
> > now agreed and changed the code so all the packaging doesn't happen in
> > -cross packages since it was always problematic.
> > 
> > FWIW I also tried disabling quadmath but that caused different build
> > failures.
> 
> But we stash the build artifacts from gcc-cross that then we reuse to build gcc-runtime so I am hoping that
> it will do the configuration bits right probably and we dont have to do libtool surgery.

It won't help, we'd have to install the libs/headers from quadmath into
the target sysroot and we can't reasonably do that from the cross
recipe.

Cheers,

Richard


