Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QTf74-0006Fx-PO for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 21:05:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p56J261Y008474
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 20:02:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08391-02 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2011 20:02:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p56J1vEN008468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 20:01:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=eR+PJ5+jPDsqZeGB6w8Xr276X1Q@mail.gmail.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
	<3eba2df4c6f2371db24ab2420d037b992725cb84.1307342214.git.sgw@linux.intel.com>
	<BANLkTi=eR+PJ5+jPDsqZeGB6w8Xr276X1Q@mail.gmail.com>
Date: Mon, 06 Jun 2011 20:01:56 +0100
Message-ID: <1307386916.7672.33.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 01/20] bitbake.conf: Create staticlibs pacakge for static libraries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jun 2011 19:05:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-06 at 10:03 -0700, Khem Raj wrote:
> On Sun, Jun 5, 2011 at 11:44 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >  meta/conf/bitbake.conf |   12 ++++++++++--
> >  1 files changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index de94316..520b808 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -194,9 +194,13 @@ This package contains ELF symbols and related sources for debugging purposes."
> >
> >  SUMMARY_${PN}-dev ?= "${SUMMARY} - Development files"
> >  DESCRIPTION_${PN}-dev ?= "${DESCRIPTION}  \
> > -This package contains symbolic links, static binaries, header files, and \
> > +This package contains symbolic links, header files, and \
> >  related items necessary for software development."
> >
> > +SUMMARY_${PN}-staticlibs ?= "${SUMMARY} - Development files (Static Libraries)"
> > +DESCRIPTION_${PN}-staticlibs?= "${DESCRIPTION}  \
> > +This package contains static libraries for software development."
> > +
> >  SUMMARY_${PN}-doc ?= "${SUMMARY} - Documentation files"
> >  DESCRIPTION_${PN}-doc ?= "${DESCRIPTION}  \
> >  This package contains documentation."
> > @@ -248,13 +252,17 @@ FILES_${PN}-doc = "${docdir} ${mandir} ${infodir} ${datadir}/gtk-doc \
> >  SECTION_${PN}-doc = "doc"
> >
> >  FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
> > -                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
> > +                ${libdir}/*.o ${libdir}/pkgconfig \
> >                 ${datadir}/pkgconfig ${datadir}/aclocal \
> >                 ${base_libdir}/*.a ${base_libdir}/*.o"
> >  SECTION_${PN}-dev = "devel"
> >  ALLOW_EMPTY_${PN}-dev = "1"
> >  RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
> >
> > +FILES_${PN}-staticlibs = "${libdir}/*.a ${base_libdir}/*.a"
> > +SECTION_${PN}-staticlibs = "devel"
> > +RDEPENDS_${PN}-staticlibs = "${PN}-dev (= ${EXTENDPV})"
> > +
> 
> I think if you need to divide it then -dev should be divided into
> static, dynamic and headers otherwise this may not be so useful.

The dynamic package would only consist of some symlinks and .la files
though so wouldn't be that much extra compared to the -dev package?

Cheers,

Richard



