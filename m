Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198])
	by mail.openembedded.org (Postfix) with ESMTP id 2892E6BDEC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 01:42:04 +0000 (UTC)
X-Originating-IP: 134.49.240.168
Received: from [192.168.1.114] (unknown [134.49.240.168])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 13E84C0004;
	Mon,  3 Dec 2018 01:42:03 +0000 (UTC)
Message-ID: <1543801320.28866.12.camel@redrectangle.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 02 Dec 2018 17:42:00 -0800
In-Reply-To: <6f1b3209e6b40f0b796f68dd8c638bb0f89a241c.camel@linuxfoundation.org>
References: <20181202031408.28161-1-robert.joslyn@redrectangle.org>
	<6f1b3209e6b40f0b796f68dd8c638bb0f89a241c.camel@linuxfoundation.org>
X-Mailer: Evolution 3.24.6 
Mime-Version: 1.0
Subject: Re: [PATCH v2] pciutils: Move headers from pciutils-dev to libpci-dev
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
X-List-Received-Date: Mon, 03 Dec 2018 01:42:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-12-02 at 10:43 +0000, Richard Purdie wrote:
> On Sat, 2018-12-01 at 19:14 -0800, Robert Joslyn wrote:
> > The pciutils recipe places libpci in a separate package, but the
> > default
> > package split puts the headers for the library in pciutils-dev.
> > When
> > building an SDK for an image that uses libpci, but not pciutils,
> > the
> > headers for libpci are not included.
> > 
> > Move the headers, unversioned so symlink, and pkgconfig files from
> > pciutils-dev to libpci-dev so the SDK gets those files for images
> > using
> > libpci.
> > 
> > Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> > ---
> >  meta/recipes-bsp/pciutils/pciutils_3.6.2.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
> > b/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
> > index 413421cd8a..de1e54e5a5 100644
> > --- a/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
> > +++ b/meta/recipes-bsp/pciutils/pciutils_3.6.2.bb
> > @@ -52,9 +52,11 @@ do_install () {
> >  	oe_multilib_header pci/config.h
> >  }
> >  
> > -PACKAGES =+ "${PN}-ids libpci"
> > +PACKAGES =+ "${PN}-ids libpci libpci-dev"
> >  FILES_${PN}-ids = "${datadir}/pci.ids*"
> >  FILES_libpci = "${libdir}/libpci.so.*"
> > +FILES_libpci-dev = "${includedir} ${FILES_SOLIBSDEV}
> > ${libdir}/pkgconfig"
> >  SUMMARY_${PN}-ids = "PCI utilities - device ID database"
> >  DESCRIPTION_${PN}-ids = "Package providing the PCI device ID
> > database for pciutils."
> >  RDEPENDS_${PN} += "${PN}-ids"
> > +RDEPENDS_libpci-dev = "libpci (= ${EXTENDPKGV})"
> 
> "dev" packages per library don't really work unfortunately as most
> code
> can't be split like that.
> 
> The general policy is one dev package per recipe. This patch doesn't
> just move things but creates a new package.
> 
> The dev-pkgs code should be resolving "libpci" back to "pciutils" and
> from there it can figure out it should be adding pciutils-dev, that
> is
> the real bug we need to fix.
> 
> Cheers,
> 
> Richard


Hi Richard,

The reason I thought to create a libpci-dev package was because if
there is only pciutils-dev, it means the other things in pciutils are
then pulled into the SDK that you may not care about. Not that big a
deal with the SDK, but it seemed better to avoid it. I can see it being
fairly annoying to split out multiple *-dev packages for more complex
recipes though.

I'm not familiar with the packaging code, but I can try to take a look
at what it would take to tie the dev-pkgs dependency back to the the
single -dev package for the recipe.

Thanks,
Robert

