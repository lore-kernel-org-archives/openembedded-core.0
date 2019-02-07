Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 856BC6BA22
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 09:00:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z5so5221257wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 01:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=tjmLP0/ePX47cBDByQ3Db/oWlUVxM2x/6vot1cuue2w=;
	b=JO55kvKD1wlPtr2Rhbox2MR9R2Ll5Ehv92Zj1xWI1pYl8nwfGYH7FESDq3pgBIFdB3
	m4DgzQUcHaOeY8/uCYpx+tDTxcrkAtRqYmksxAik4PbQnxWhRfAYs/QIWfU1GEx1H9n0
	0WGHRO0lTrWn0296AWqSjH5ywSVM9xQM2PgiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tjmLP0/ePX47cBDByQ3Db/oWlUVxM2x/6vot1cuue2w=;
	b=F+mcrWYhoK+P8pgDjulSyKnoln4cc+28WZGBW1wLMdwlEVES6O9gxTAZc/50j1Mk1+
	UQLg8PglAPqnUnXfIjscgshsaO6fVHbbvY8Gx5FHcd16J8H5SSfylmQX5gFFZOF6Zquh
	8/VMvMbJbOgz2pxerVn5ss6iRDRUlR9iXwNoJrpQFyH9H3Trpy0/mkq7/tKzB4L2j9TN
	0aJmGR2DmKgk9aDLQJT5Wlx0I5fIKnM9GvWRFy7VrF8CYN+QzGqtCkRoJT297goRtR1m
	fAwCEv49UJjcMqzLDcOx7RfTRcnofifsJNHa4EUx73aciYOd6/jZzdZ0kw81kmz9ejWX
	Uu6Q==
X-Gm-Message-State: AHQUAuY+xnuffCKamApSvy/O/9flWvkc2nzX0txlcCEqdVVOx/H8Cn1M
	VTVRbR9H8/T2OlglMpkNi/qVj/uFwFo=
X-Google-Smtp-Source: AHgI3IZpmAztL/jzSkoRCEuqB+XkQMVcR/BHgzU3jvMhj0klZe3rf5TpEpvpaHbVoOahzximI0wXAA==
X-Received: by 2002:a05:600c:2143:: with SMTP id
	v3mr5091687wml.120.1549530052855; 
	Thu, 07 Feb 2019 01:00:52 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id e2sm6230349wrw.35.2019.02.07.01.00.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Feb 2019 01:00:51 -0800 (PST)
Message-ID: <88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 07 Feb 2019 09:00:50 +0000
In-Reply-To: <20190207003537.7135-1-raj.khem@gmail.com>
References: <20190207003537.7135-1-raj.khem@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] glibc-locale: Rewrite do_install using install utility instead of cp
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
X-List-Received-Date: Thu, 07 Feb 2019 09:00:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-02-06 at 16:35 -0800, Khem Raj wrote:
> This has been a constant source of trouble for build failures due to host-user-contaminated QA
> errors of sort
> 
> ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-es+valencia/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> 
> So far we have tried to mould cp command into not carrying the build
> user permissions into install area but it is never entirely fixed since
> the issue keeps popping up in various scenes
> 
> This patch replaces use of cp with install utility and specifies install
> mode for files explcitly
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-locale.inc | 44 ++++++++++++++----------
>  1 file changed, 25 insertions(+), 19 deletions(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
> index 6384f9cbf1..9b256a5108 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -72,27 +72,33 @@ FILES_localedef = "${bindir}/localedef"
>  LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
>  
>  do_install () {
> -	mkdir -p ${D}${bindir} ${D}${datadir}
> -	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> -		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
> -	fi
> -	if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
> -		mkdir -p ${D}${localedir}
> -		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
> -	fi
> +        install -d ${D}${bindir}
> +        find "${LOCALETREESRC}/${bindir}" -maxdepth 1 -type f \
> +        -exec install -m 0755 -t "${D}${bindir}" {} \;
> +
> +        for d in . $(find "${LOCALETREESRC}/${localedir}" -type d -printf '%P ') ; do
> +                install -d "${D}${localedir}/$d"
> +                find "${LOCALETREESRC}/${localedir}/$d" -maxdepth 1 -type f \
> +                -exec install -m 0644 -t "${D}${localedir}/$d" {} \;
> +        done
>  	if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
> -		mkdir -p ${D}${libdir}
> -		if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> -			cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> -		fi
> -		if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> -			cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> -		fi
> -	fi
> -	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> -		cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> +                for d in . $(find "${LOCALETREESRC}/${libdir}/gconv" -type d -printf '%P ') ; do
> +                        install -d "${D}${libdir}/gconv/$d"
> +                        find "${LOCALETREESRC}/${libdir}/gconv/$d" -maxdepth 1 -type f \
> +                        -exec install -m 0755 -t "${D}${libdir}/gconv/$d" {} \;
> +                done
> +                for d in . $(find "${LOCALETREESRC}/${datadir}/i18n" -type d -printf '%P ') ; do
> +                        install -d "${D}${datadir}/i18n/$d"
> +                        find "${LOCALETREESRC}/${datadir}/i18n/$d" -maxdepth 1 -type f \
> +                        -exec install -m 0644 -t "${D}${datadir}/i18n/$d" {} \;
> +                done
>  	fi
> -	cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
> +        for d in . $(find "${LOCALETREESRC}/${datadir}/locale" -type d -printf '%P ') ; do
> +                install -d "${D}${datadir}/locale/$d"
> +                find "${LOCALETREESRC}/${datadir}/locale/$d" -maxdepth 1 -type f \
> +                -exec install -m 0644 -t "${D}${datadir}/locale/$d" {} \;
> +        done
> +	install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
>  }
>  
>  inherit libc-package

The trouble is this is a workaround. The cp commands should work and
there is some underlying issue in pseudo causing this. We really need
to figure out what that is since this will likely just mean we see the
problem somewhere else :(

I still suspect some kind of inode number reuse problem which these cp
commands trigger...

Cheers,

Richard


