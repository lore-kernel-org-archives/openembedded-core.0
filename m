Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TCSHl-0000D5-Ic for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 11:34:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8E8ue2K009727;
	Fri, 14 Sep 2012 09:56:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09652-01; Fri, 14 Sep 2012 09:56:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8E8uUKG009721
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 09:56:31 +0100
Message-ID: <1347612993.9456.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 14 Sep 2012 09:56:33 +0100
In-Reply-To: <5052CDF2.9090505@linux.intel.com>
References: <1347530671-16622-1-git-send-email-ross.burton@intel.com>
	<1347530671-16622-3-git-send-email-ross.burton@intel.com>
	<5052CDF2.9090505@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] librsvg: make the libcroco dependency a PACKAGECONFIG option
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
X-List-Received-Date: Fri, 14 Sep 2012 09:34:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-13 at 23:25 -0700, Saul Wold wrote:
> On 09/13/2012 03:04 AM, Ross Burton wrote:
> > Default to enabling it as we were build-depending on it already.  If a user
> > needs the disk space and the limitations imposed by not using libcroco are
> > acceptable they can override this.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >   meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    9 ++++++---
> >   1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> > index 6bb5fe2..012b3ba 100644
> > --- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> > +++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> > @@ -7,15 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> >                       file://rsvg.h;beginline=3;endline=24;md5=20b4113c4909bbf0d67e006778302bc6"
> >
> >   SECTION = "x11/utils"
> > -DEPENDS = "gtk+ libcroco cairo libxml2"
> > +DEPENDS = "gtk+ cairo libxml2"
> >   DEPENDS_virtclass-native = "cairo-native pango-native gdk-pixbuf-native"
> >   BBCLASSEXTEND = "native"
> >
> > -PR = "r9"
> > +PR = "r10"
> >
> >   inherit autotools pkgconfig gnome gtk-doc
> >
> > -EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz --without-croco"
> > +EXTRA_OECONF = "--disable-mozilla-plugin --without-svgz"
> > +
> > +PACKAGECONFIG ??= "croco"


Needs a 

+PACKAGECONFIG_class-native ??= ""

> > +PACKAGECONFIG[croco] = "--with-croco,--without-croco,libcroco"
> >
> This change seems to introduce a new native dependency on libcroco-native.
> 
> ERROR: Nothing PROVIDES 'libcroco-native' (but 
> virtual:native:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/build-appliance/build/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb 
> DEPENDS on or otherwise requires it)
> 
> This was during a bitbake -c fetch universe

Cheers,

Richard



