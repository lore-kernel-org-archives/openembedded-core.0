Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BFA796012C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 12:19:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Nov 2015 04:19:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="848219453"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga001.fm.intel.com with ESMTP; 27 Nov 2015 04:19:02 -0800
Date: Fri, 27 Nov 2015 14:20:20 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20151127122020.GA26454@mbabyjoh-mobl.fi.intel.com>
References: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
	<1448622259-5907-3-git-send-email-maxin.john@intel.com>
	<20151127111452.GB17303@jama>
MIME-Version: 1.0
In-Reply-To: <20151127111452.GB17303@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libjpeg-turbo: import the recipe from meta-oe
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
X-List-Received-Date: Fri, 27 Nov 2015 12:19:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

On Fri, Nov 27, 2015 at 12:14:52PM +0100, Martin Jansa wrote:
> On Fri, Nov 27, 2015 at 01:04:19PM +0200, Maxin B. John wrote:
> > libjpeg-turbo has same API/ABI as libjpeg. It is relatively
> > faster in JPEG compression/decompression than libjpeg.
> 
> Is this imported as-is from meta-oe? If so then at least mention it in
> commit message and sent libjpeg-turbo removal for meta-oe.
> 

Sure, Will do that. This patch set was sent in order to get the opinion from
everyone. Will send the libjpeg-turbo removal patch to meta-oe once it is accepted
in oe-core.

> > 
> > [YOCTO #8628]
> > 
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb | 40 ++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> > 
> > diff --git a/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> > new file mode 100644
> > index 0000000..e79f800
> > --- /dev/null
> > +++ b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> > @@ -0,0 +1,40 @@
> > +DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
> > +HOMEPAGE = "http://libjpeg-turbo.org/"
> > +
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=cad955d15145c3fdceec6855e078e953 \
> > +                    file://jpeglib.h;endline=14;md5=dfc803dc51ae21178d1376ec73c4454d \
> > +                    file://djpeg.c;endline=9;md5=e93a8f2061e8a0ac71c7a485c10489e2 \
> > +"
> > +
> > +DEPENDS = "nasm-native"
> > +
> > +BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
> > +
> > +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
> > +SRC_URI[md5sum] = "b1f6b84859a16b8ebdcda951fa07c3f2"
> > +SRC_URI[sha256sum] = "4bf5bad4ce85625bffbbd9912211e06790e00fb982b77724af7211034efafb08"
> > +
> > +S = "${WORKDIR}/${BPN}-${BASEPV}"
> > +
> > +# Drop-in replacement for jpeg
> > +PROVIDES = "jpeg"
> > +RPROVIDES_${PN} += "jpeg"
> > +RREPLACES_${PN} += "jpeg"
> > +RCONFLICTS_${PN} += "jpeg"
> > +
> > +inherit autotools pkgconfig
> > +
> > +EXTRA_OECONF = "--with-jpeg8 "
> > +
> > +PACKAGES =+ "jpeg-tools libturbojpeg"
> > +
> > +DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
> > +FILES_jpeg-tools = "${bindir}/*"
> > +
> > +FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
> > +INSANE_SKIP_libturbojpeg = "dev-so"
> > +
> > +BBCLASSEXTEND = "native"
> > +
> > +LEAD_SONAME = "libjpeg.so.8"
> > -- 
> > 2.4.0
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

Best Regards,
Maxin


