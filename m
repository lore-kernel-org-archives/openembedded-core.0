Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxRO9-0004BA-A1
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 01:34:37 +0200
Received: by yenl13 with SMTP id l13so1321681yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 16:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=nQNb9yb2hGJXJnrqz+8shoZeCqfZnaiGSIN2eb0AQW0=;
	b=QdDHHKkd4pBOGG6NifqA50L8nwAug9iz/OTrkGZx5xAq6FeaWAau8vB+oDr8nYa24K
	NU6nX0g1R6OuDQ6+7bdp5JcN5haLgDtZ8RP8dgkYfPD06ZTMxHXryDe5D47mO1vCdePS
	E4aChBzMeKg1JLrc4i+ITS4do0YRIn2Lj2mN0qihma2hs2apmdWLjYgCVDyG6dgcF2KK
	IOfe7F8YplBbvDl4qIJWWTwzIYaSnxQCqipA8ILXFNXcyBkvHesKjXyC1M11F6tZJZQ3
	vxcjoZQ0UbvZ8i91mJDMZRCB6rfg1cwdnaI0EnT+w3IU2WIEEIfkfqQWLuRjWSfle7hf
	HitQ==
MIME-Version: 1.0
Received: by 10.50.207.36 with SMTP id lt4mr22244igc.5.1344036174887; Fri, 03
	Aug 2012 16:22:54 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Fri, 3 Aug 2012 16:22:54 -0700 (PDT)
In-Reply-To: <b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
References: <cover.1344022584.git.laurentiu.palcu@intel.com>
	<b41b2c46c9de5d3f63bfa146e23e8974a7a6cebf.1344022584.git.laurentiu.palcu@intel.com>
Date: Sat, 4 Aug 2012 01:22:54 +0200
Message-ID: <CALbNGRQjUxm0h2+YA=Tog2_JhWPKGJmdy9QyhOjSQWLRQ1eKOQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] gtk-icon-cache: call postinst scriplet at do_rootfs time
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
X-List-Received-Date: Fri, 03 Aug 2012 23:34:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 3, 2012 at 10:19 PM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
> This will improve first boot time because building the icon cache is
> done on host, with more processing power than the target.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/gtk-icon-cache.bbclass |   10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
> index 01fb2f3..2d82c54 100644
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -1,18 +1,12 @@
>  FILES_${PN} += "${datadir}/icons/hicolor"
>
> -DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']}"
> +DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk+-native"
>
> -# This could run on the host as icon cache files are architecture independent,
> -# but there is no gtk-update-icon-cache built natively.
>  gtk_icon_cache_postinst() {
> -if [ "x$D" != "x" ]; then
> -        exit 1
> -fi
> -
>  # Update the pixbuf loaders in case they haven't been registered yet
>  GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
>
> -for icondir in /usr/share/icons/* ; do
> +for icondir in $D/usr/share/icons/* ; do
>      if [ -d $icondir ] ; then
>          gtk-update-icon-cache -fqt  $icondir
>      fi
> --
> 1.7.9.5
>
Long time ago there was a patch introducing gtk-icon-cache to be only
run once on the machine [1] and I am still using that. At that time I
was asked for a more generic approach. Now I ask:

1. Wouldn't it be better to have gtk-icon-cache run once even on host
2. Or better: How about a postinst 'runonce' framework for host/machine?

Andreas

[1] http://patches.openembedded.org/patch/24179/


