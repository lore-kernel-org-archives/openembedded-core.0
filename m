Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SzlM8-0004hP-Nt
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 11:18:08 +0200
Received: by ghbz2 with SMTP id z2so1231438ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 02:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=NDcfQL/FCUW7RfzyK4npN1PE2wyWT2TkQ1PBlUhqHfM=;
	b=LyJULd1HPmXNYSbGXlePJ04/ogq/3lgGpUVc3NnfV90Nn1TjJ26CXElxrc/DcWuKNV
	dAu8JDuutuD+8KtOiCdKgcIkwpthzwpPswb2Yv2W3WzKuMZJVC4+H0GO7jFoZ7ycTeMD
	9soK0J7gpknUgLmr5LDqgExS4GS2Ggp0+qIkgTS1I6sOaQUoRvE1G12qh0pmjuLcPuQw
	LfTbr5vDKsB1G3ROBAdrDS2yUWbCKb72XalOnR47+8cZ7zq9LLanV1kn8rX3rAAL1r3G
	EwDVecg71UkjLznpFLKMI8bCwKtlArISet4D+UehlWQ5EQBkCuWmyKUCtAAxs28/lJgX
	2m1g==
MIME-Version: 1.0
Received: by 10.50.15.202 with SMTP id z10mr1092477igc.50.1344589578638; Fri,
	10 Aug 2012 02:06:18 -0700 (PDT)
Received: by 10.64.35.82 with HTTP; Fri, 10 Aug 2012 02:06:18 -0700 (PDT)
In-Reply-To: <fe6bc6ae795704c38559f30e7feb9b694363ab49.1344479229.git.jackie.huang@windriver.com>
References: <cover.1344479229.git.jackie.huang@windriver.com>
	<fe6bc6ae795704c38559f30e7feb9b694363ab49.1344479229.git.jackie.huang@windriver.com>
Date: Fri, 10 Aug 2012 11:06:18 +0200
Message-ID: <CALbNGRSNeWuYDanj0DSzEAwZQzAv0AALvQinw5JEpNuq4Pxa2Q@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gdk-pixbuf: fix the postinstall script failure when no icon is installed
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
X-List-Received-Date: Fri, 10 Aug 2012 09:18:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 9, 2012 at 4:30 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> If gtk+ is added to core-image-minimal, postinstall script failed on boot:
>
> Running postinst /etc/rpm-postinsts/104...
> gtk-update-icon-cache: No theme index file.
> ERROR: postinst /etc/rpm-postinsts/104 failed.
>
> This patch fixed the postinstall script to check for the icon
> file first and not run the gtk-update-icon-cache if no icon
> is installed.
>
> [YOCTO #2905]
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |   10 ++++++++--
>  1 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> index 484fb12..159bdae 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb
> @@ -21,7 +21,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
>  SRC_URI[md5sum] = "72f39b34b20f68148c1609bd27415412"
>  SRC_URI[sha256sum] = "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1"
>
> -PR = "r4"
> +PR = "r5"
>
>  inherit autotools pkgconfig gettext
>
> @@ -62,7 +62,13 @@ fi
>
>  GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/${LIBV}/loaders gdk-pixbuf-query-loaders --update-cache
>
> -test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  -q ${datadir}/icons/hicolor
> +if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
> +    for icondir in /usr/share/icons/*; do
> +        if [ -d ${icondir} ]; then
> +            gtk-update-icon-cache -q ${icondir}
> +        fi
> +    done
> +fi
>  }
>
>  PACKAGES_DYNAMIC += "gdk-pixbuf-loader-*"
> --
> 1.7.4
>
Maybe I missed something: Wouldn't it be better to remove inherit
gtk-update-icon-cache for those recipes failing?

Andreas


