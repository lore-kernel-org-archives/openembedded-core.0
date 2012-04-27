Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SNj22-0002tj-1d for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 13:08:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RAwWP6014990
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 11:58:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12866-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 11:58:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3RAwNXd014983
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 11:58:25 +0100
Message-ID: <1335524304.20130.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2012 11:58:24 +0100
In-Reply-To: <f0e5fdf02154f91fc9af370dbc3ac2bfff375aff.1335515558.git.xiaofeng.yan@windriver.com>
References: <cover.1335515558.git.xiaofeng.yan@windriver.com>
	<f0e5fdf02154f91fc9af370dbc3ac2bfff375aff.1335515558.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] gdk-pixbuf: Add --with-x11 when building lsb image
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
X-List-Received-Date: Fri, 27 Apr 2012 11:08:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-04-27 at 16:39 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> LSB Test Suite complain "no library libgdk_pixbuf_xlib-2.0.so.0" \
> because of having "--without-x11" for gdk-pixbuf_2.24.1.bb.
> Use the linuxstdbase override and also make it
> conditional on x11 being in DISTRO_FEATURES for passing lsb test
> 
> [YOCTO #2284]
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> index e31f717..3000c79 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> @@ -19,7 +19,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
>  SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
>  SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  inherit autotools pkgconfig gettext

Your patch will leave it enabled in the non-lsb case under many
circumstances. How about something like:
 
@@ -28,10 +28,13 @@ LIBV = "2.10.0"
 EXTRA_OECONF = "\
   --without-libtiff \
   --with-libpng \
-  --without-x11 \
+  ${X11DEPENDS} \
   --disable-introspection \
 "
 
+X11DEPENDS = "--without-x11"
+X11DEPENDS_linuxstdbase = "${@base_contains('DISTRO_FEATURES', 'x11', '--with-x11', '--without-x11', d)}"
+
 FILES_${PN} = "${bindir}/gdk-pixbuf-query-loaders \
 	${libdir}/lib*.so.*"
 

I'd also like to split the library into a separate package.

Cheers,

Richard



