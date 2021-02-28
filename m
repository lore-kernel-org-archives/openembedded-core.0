Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
 by mx.groups.io with SMTP id smtpd.web11.5746.1614515124858075378
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 04:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=jVZ31XMB;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.17, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id GL8TlwjOwjOtyGL8Vl590i; Sun, 28 Feb 2021 12:25:23 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=UcTKtJaN c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=qa6Q16uM49sA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
 a=pGLkceISAAAA:8 a=HijlfyYwsqdhXUezSpsA:9 a=CjuIK1q_8ugA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=qmgkgpp8DrLO2CH4EFL0/dxQOKSh+MQM9O/Ra5ob8bk=; b=jVZ31
	XMBn5GWvJc8so0eT/kfAOrtfMZEC2M+myachWOK+/NuDAixMhis5mlKs0QVH0G7j4bYONZPZNCz0G
	velby0NuvDN/tPON3JxZI9gy5su7u6UP0eaNbEll/VL32Kz/dVmrLGm4ntzsGkuLJoz+cS9HSwRCm
	Mm+9ggc/QLyiLOa7ggBpNZ1Rb7nT61ZYK+n5Dqi0SgM84r+E95NxDyHOqnTfTPNhZI+jqtOQfYP2m
	hTh1DH1FEUo1cfr7fuxKbW4peVjcGWoHIbuWiz8anlqaSTFUCpyYyL4uVDe2saKudaHuq4P8FFi1b
	6ESZZpDD+VBXQeK5Cf1zLKTtn8btg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1lGL8T-0002m0-Q7; Sun, 28 Feb 2021 12:25:21 +0000
Date: Sun, 28 Feb 2021 12:25:21 +0000
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-sanitizers: Move content from gcclibdir into libdir
Message-ID: <20210228122521.GA5878@mcrowe.com>
References: <20210225173653.2408-1-mac@mcrowe.com>
 <YDpe+v5had6dt56Z@piout.net>
MIME-Version: 1.0
In-Reply-To: <YDpe+v5had6dt56Z@piout.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfG7FJ6zLPUSW3CeKKkHCcIcAbf+RVwD57IIH2d58aH7m3kSi50PzjzYxz/js+CK2Dm/cQWboPolxLwrulwmdHsL+X2vlxVFMJxV9wo1qDSta4ONCoZXe
 7jRkyEhh4/nUuwnP1VLiiiRnXUOFq6tqHpeMmsyH0t1DobZPmB85FIMGIyzttCC4FjM2ff9RZuRK7g==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Saturday 27 February 2021 at 16:02:18 +0100, Alexandre Belloni wrote:
> Hello,
> 
> On 25/02/2021 17:36:53+0000, Mike Crowe via lists.openembedded.org wrote:
> > In e9e5744ba8b0d43c8b874d365f83071ce20bf0a1, Khem Raj wrote:
> > > OE does not use the traditional /usr/lib/gcc prefix to store
> > > gcc-runtime it basically is moved into libdir, however some newer
> > > files were installed by newer versions of gcc especially libgomp (
> > > omp.h openacc.h ) into gcclibdir, so we have content in both
> > > directories, this confuses other tools which are trying to guess the
> > > gcc installation and its runtime location, since now we have two
> > > directories, the tools either choose one or other and we get
> > > inconsistent behavior, e.g. clang for aarch64 uses /usr/lib but same
> > > clang for riscv64 chose /usr/lib/gcc
> > 
> > > This change ensures that OE ends up with single valid location for gcc
> > > runtime files
> > 
> > I think that the same thing needs to happen in gcc-sanitizers.inc,
> > otherwise I get errors like:
> > 
> > | .../recipe-sysroot/usr/include/gpg-error-64.h:884:11: fatal error: sanitizer/lsan_interface.h: No such file or directory
> > 
> > when attempting to compile with sanitizers enabled.
> > 
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > Cc: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> > index 668e14a59f..67b755edf8 100644
> > --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> > @@ -35,6 +35,11 @@ do_compile () {
> >  do_install () {
> >      cd ${B}/${TARGET_SYS}/libsanitizer/
> >      oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/libsanitizer/ install
> > +    if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
> > +	install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> > +	mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> > +	rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
> > +    fi
> >      if [ -d ${D}${infodir} ]; then
> >          rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
> >      fi
> 
> This seems to result in the following erro on the autobuilders:
> 
> ERROR: gcc-sanitizers-10.2.0-r0 do_package: QA Issue: gcc-sanitizers: Files/directories were installed but not shipped in any package:
>   /usr/lib/i686-poky-linux
>   /usr/lib/i686-poky-linux/10.2.0
>   /usr/lib/i686-poky-linux/10.2.0/include
>   /usr/lib/i686-poky-linux/10.2.0/include/sanitizer
>   /usr/lib/i686-poky-linux/10.2.0/include/sanitizer/common_interface_defs.h
>   /usr/lib/i686-poky-linux/10.2.0/include/sanitizer/lsan_interface.h
>   /usr/lib/i686-poky-linux/10.2.0/include/sanitizer/asan_interface.h
>   /usr/lib/i686-poky-linux/10.2.0/include/sanitizer/tsan_interface.h
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> gcc-sanitizers: 8 installed and not shipped files. [installed-vs-shipped]
> ERROR: gcc-sanitizers-10.2.0-r0 do_package: Fatal QA errors found, failing task.
> 
> It seems to be an easy one to fix.

Removing the gcc/ part of the path added to FILES_${PN} seems to solve the
problem for me. I'm not sure why I didn't see that in the dunfell/usrmerge
tree that I originally wrote the fix for.

Updated patch at:
https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_gcc_sanitizers/80970998?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,80970998

Thanks.

Mike.
