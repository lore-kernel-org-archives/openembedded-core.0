Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R5ddB-0003x3-MY for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 15:11:30 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8JDCOfs020034 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 14:12:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XLivradhYY4Y
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 14:12:24 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8JDCG3G020000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 14:12:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Sep 2011 14:06:01 +0100
In-Reply-To: <20110919110728.GA31160@mi.fu-berlin.de>
References: <cover.1316429640.git.paul.eggleton@linux.intel.com>
	<8d56fe29bb6f9502c56eae71640da4cc31f7e1a4.1316429640.git.paul.eggleton@linux.intel.com>
	<20110919110728.GA31160@mi.fu-berlin.de>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316437569.14488.15.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] freetype: disable bzip2 compressed font support
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
X-List-Received-Date: Mon, 19 Sep 2011 13:11:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-19 at 13:07 +0200, Henning Heinold wrote:
> On Mon, Sep 19, 2011 at 11:58:36AM +0100, Paul Eggleton wrote:
> > If we do not disable this then it is enabled sometimes and disabled at
> > others depending on whether bzip2 has been built at the time, and worst
> > case it will cause a race condition if bzip2 is building at the same
> > time.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> >  meta/recipes-graphics/freetype/freetype_2.4.6.bb |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-graphics/freetype/freetype_2.4.6.bb b/meta/recipes-graphics/freetype/freetype_2.4.6.bb
> > index 8150dd4..94a389a 100644
> > --- a/meta/recipes-graphics/freetype/freetype_2.4.6.bb
> > +++ b/meta/recipes-graphics/freetype/freetype_2.4.6.bb
> > @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=28d5381b1bef2649c59f20c20bae4f39
> >  
> >  SECTION = "libs"
> >  
> > -PR = "r0"
> > +PR = "r1"
> >  
> >  SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
> >             file://no-hardcode.patch"
> > @@ -28,7 +28,7 @@ inherit autotools pkgconfig binconfig
> >  LIBTOOL = "${S}/builds/unix/${HOST_SYS}-libtool"
> >  EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
> >  EXTRA_OEMAKE_virtclass-native = ""
> > -EXTRA_OECONF = "--without-zlib"
> > +EXTRA_OECONF = "--without-zlib --without-bzip2"
> >  
> >  do_configure() {
> >  	cd builds/unix
> 
> Hi,
> 
> wouldn't it been better to let freetype depend on bz2 and libz. It may save some space in particular situations for some
> people.

Likely we should compress the fonts but this patch at least makes the
build deterministic. I'd probably take a further patch allowing
compression although whether it would make the release at this stage I'm
not sure.

Cheers,

Richard



