Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4VRx-0006VK-L1 for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 12:15:13 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GAG55T009816; Fri, 16 Sep 2011 11:16:06 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ih22UGMtMlei; Fri, 16 Sep 2011 11:16:05 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GAG13Y009800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 16 Sep 2011 11:16:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 11:09:49 +0100
In-Reply-To: <1316161201-769-1-git-send-email-koen@dominion.thruhere.net>
References: <1316161201-769-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316167797.25993.70.camel@ted>
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC 1/2] gstreamer: sync packaging with OE .dev
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
X-List-Received-Date: Fri, 16 Sep 2011 10:15:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-16 at 10:20 +0200, Koen Kooi wrote:
> some text here

It took all my restraint to not just reply with:
"""
NAK

<insert reason for NAK here, I can't be bothered to type it>
"""

We've been around in a few circles with this. The problem is that if we
apply this patch we have no clue which gst-plugin from the good, the bad
and the ugly provides something you're after to include in an image.
This results in bitbake being pretty clueless about whether a given
build will succeed or not. In general I'm not a fan of having
non-deterministic builds as they tend to annoy users.

If this position isn't acceptable then we'll probably have to move to a
situation where we list which plugins each of the packages builds and
drop the dyanmic provides. That is a maintenance pain and I don't take
that step lightly but I don't see any other options. I'm open to
suggestions though.

Cheers,

Richard

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../gstreamer/gst-plugins-package.inc              |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> index 796df14..dae9416 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> @@ -6,8 +6,8 @@ python populate_packages_prepend () {
>  	glibdir = bb.data.expand('${libdir}', d)
>  
>  	do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
> -	do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', bb.data.expand('${PN}-%s', d), 'GStreamer plugin for %s', postinst=postinst, extra_depends=bb.data.expand('${PN}',d))
> -	do_split_packages(d, gst_libdir, 'libgst(.*)\.l?a$', bb.data.expand('${PN}-%s-dev', d), 'GStreamer plugin for %s (development files)', extra_depends=bb.data.expand('${PN}-dev',d))
> +	do_split_packages(d, gst_libdir, '^libgst(.*)\.so$', 'gst-plugin-%s', 'GStreamer plugin for %s', postinst=postinst, extra_depends='')
> +	do_split_packages(d, gst_libdir, '^libgst(.*)\.l?a$', 'gst-plugin-%s-dev', 'GStreamer plugin for %s (development files)', extra_depends='')
>  	
>  	pn = bb.data.getVar('PN', d, 1)
>  	metapkg =  pn + '-meta'




