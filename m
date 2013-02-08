Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1U3x5s-00039d-LQ
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 00:10:56 +0100
Received: by mail-lb0-f180.google.com with SMTP id q12so3375653lbc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 14:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=JVCwZqvGq/aRGM0aNHJPfcBYlgElJvFlE6fHItvCV/c=;
	b=Swjff8Bu55w5yh1P2fQRwDf25gtTR/sIUhI5DPbwIbACyhyGdZw9aQNNqc6XVgZDki
	/pSFWJ9833Od7V7XM4LeGpre6riIjHW8avKw94oyUGzx7LjEORExXaMhveocy6KddbaF
	qfWdrAF42dPNQyvi0c1JhjuNkn3Yl/eyTZ/1UmlEYWiad0bQ9qgL19N12wDD6RR60/sa
	mMA4cOJsAQGRaR8BDsABRlH2F7KYwjNztwwsLSw8MDIbTzEcstDm2bVj5NSERIVpmCnK
	xYYb5qu3DZWx6R6pTzh6+jeTVcdF206qirIzK2zoRVQ+oL05eKj8xznzRjqlvLgC/fw4
	virw==
MIME-Version: 1.0
X-Received: by 10.112.40.137 with SMTP id x9mr2901576lbk.71.1360364102056;
	Fri, 08 Feb 2013 14:55:02 -0800 (PST)
Received: by 10.112.98.170 with HTTP; Fri, 8 Feb 2013 14:55:01 -0800 (PST)
In-Reply-To: <1360335140-8690-1-git-send-email-otavio@ossystems.com.br>
References: <1360335140-8690-1-git-send-email-otavio@ossystems.com.br>
Date: Fri, 8 Feb 2013 23:55:01 +0100
Message-ID: <CAAQYJAsS7KVVOQxAzRO8qh90Adngx6OUvpffQmpoQ68yiZGDXg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/2] tzdata: We shouldn't override the localtime if it is valid
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
X-List-Received-Date: Fri, 08 Feb 2013 23:10:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 8, 2013 at 3:52 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> The code where mistakenly replacing the localtime file setting so we
> end with a copy of file instead of a symbolic link. This fixes it so
> now, we'll only do that in case the link is pointing to invalid data.
>

Hi,

there was the same discussion when I first proposed the Gentoo script:
it wasn't a mistake. it's the old issue /usr not mounted at boot.

See thread: http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/016237.html

Cheers

Andrea


> Change-Id: I16dfa5ea4f293c48bb396f4e23a2ea53e6c9e745
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-extended/tzdata/tzdata_2012d.bb |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-extended/tzdata/tzdata_2012d.bb b/meta/recipes-extended/tzdata/tzdata_2012d.bb
> index 9741101..9ec6715 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2012d.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2012d.bb
> @@ -5,7 +5,7 @@ LICENSE = "PD"
>  LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
>  DEPENDS = "tzcode-native"
>
> -PR = "r2"
> +PR = "r3"
>
>  inherit allarch
>
> @@ -93,12 +93,12 @@ pkg_postinst_${PN} () {
>                 echo "You have an invalid TIMEZONE setting in ${src}"
>                 echo "Your ${etc_lt} has been reset to Universal; enjoy!"
>                 tz="Universal"
> +               echo "Updating ${etc_lt} with $D${datadir}/zoneinfo/${tz}"
> +               if [ -L ${etc_lt} ] ; then
> +                       rm -f "${etc_lt}"
> +               fi
> +               cp -f "$D${datadir}/zoneinfo/${tz}" "${etc_lt}"
>         fi
> -       echo "Updating ${etc_lt} with $D${datadir}/zoneinfo/${tz}"
> -       if [ -L ${etc_lt} ] ; then
> -               rm -f "${etc_lt}"
> -       fi
> -       cp -f "$D${datadir}/zoneinfo/${tz}" "${etc_lt}"
>  }
>
>  # Packages primarily organized by directory with a major city
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


