Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TEKXP-0007DF-L8
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 15:41:59 +0200
Received: by eaad12 with SMTP id d12so273421eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 06:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=x8Gu0pDfXvUzLmNlfS8OwVn/LHEQ83VWikZdIUE2FI4=;
	b=sWG9+uyB8WnHjgkNiYHIa9N1hxL2MQdQsTrjHk7jpddmyYeJ/M8S8mkVNKVgzhXyVe
	t5iC49FYuAMvkzXrtCXcEiJuJCpr+/xEq4ky7i5mjcTpwsWrs+z5ZIiuoa7mcXbHJAda
	q7Q8Ja03CUo8ZXae9FVuzfspTSSTF6cTwPeF0DISUuc0PyGvrDCW70D0mtDj0H9UCWzu
	XrhhZmyoQI4QARhQUpLEuQ4JtoAqsQSe0y3ZA8ybOThvO3EMJeOoe1DYnmwZ7CWwVYqo
	AWI+a9NPLVNyIWAiUPOojr+pqnz6LdoTRY4td+5I3M7MBjzAt5ssTW83V6x6KLO9Lhqv
	ITNg==
Received: by 10.14.220.134 with SMTP id o6mr3596320eep.35.1348061355595; Wed,
	19 Sep 2012 06:29:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 19 Sep 2012 06:28:44 -0700 (PDT)
In-Reply-To: <e12955c6d49bceb6c271574551b5feb76c51fa3b.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<e12955c6d49bceb6c271574551b5feb76c51fa3b.1348052899.git.laurentiu.palcu@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Sep 2012 06:28:44 -0700
Message-ID: <CAMKF1soiz=RjQEGd+bGidaMJKCVcja6wvUJeyyFfaUuPsXUUqg@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 4/7] gtk-icon-cache: run the icon generation at rootfs time
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
X-List-Received-Date: Wed, 19 Sep 2012 13:41:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 19, 2012 at 4:49 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
> This change will allow for the icon cache generation at rootfs time and
> only once, at the end. So, even though there will be many packages
> depending on gtk+, the icon cache generation will be done once.
> Hopefully, this will lower the target's first boot time significantly
> by using the power of the host machine to generate the cache.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/gtk-icon-cache.bbclass |   21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
> index 01fb2f3..f65b11c 100644
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -1,12 +1,24 @@
>  FILES_${PN} += "${datadir}/icons/hicolor"
>
> -DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']}"
> +DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk+-native"
>
> -# This could run on the host as icon cache files are architecture independent,
> -# but there is no gtk-update-icon-cache built natively.
>  gtk_icon_cache_postinst() {
>  if [ "x$D" != "x" ]; then
> -        exit 1
> +    if [ ! -f $INTERCEPT_DIR/update_icon_cache ]; then
> +        cat << "EOF" > $INTERCEPT_DIR/update_icon_cache
> +#!/bin/bash -x

Do you really need bash for this script to run ? if so then can it be
written so that it works on posixly shells.

> +
> +# Update the native pixbuf loader's cache
> +gdk-pixbuf-query-loaders --update-cache
> +
> +for icondir in $D/usr/share/icons/* ; do
> +    if [ -d $icondir ] ; then
> +        gtk-update-icon-cache -fqt  $icondir
> +    fi
> +done
> +EOF
> +    fi
> +    exit 0
>  fi
>
>  # Update the pixbuf loaders in case they haven't been registered yet
> @@ -17,6 +29,7 @@ for icondir in /usr/share/icons/* ; do
>          gtk-update-icon-cache -fqt  $icondir
>      fi
>  done
> +
>  }
>
>  gtk_icon_cache_postrm() {
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


