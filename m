Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA617CB31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 01:43:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1S1hxoe010467
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 27 Feb 2019 17:43:59 -0800 (PST)
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Wed, 27 Feb 2019 17:43:59 -0800
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20190207003537.7135-1-raj.khem@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <983e13de-1319-ca48-a022-6b00d7409569@windriver.com>
Date: Thu, 28 Feb 2019 09:53:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190207003537.7135-1-raj.khem@gmail.com>
X-Originating-IP: [128.224.163.141]
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
X-List-Received-Date: Thu, 28 Feb 2019 01:43:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Just to provide some feedback.
Even with this patch, this annoying QA issue is still there.
WARNING: glibc-locale-2.29-r0 do_package_qa: QA Issue: glibc-locale: 
/glibc-binary-localedata-wo-sn/usr/lib/locale/wo_SN/LC_CTYPE is owned by 
uid 1001, which is the same as the user running bitbake. This may be due 
to host contamination [host-user-contaminated]

Best Regards,
Chen Qi

On 02/07/2019 08:35 AM, Khem Raj wrote:
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
>   meta/recipes-core/glibc/glibc-locale.inc | 44 ++++++++++++++----------
>   1 file changed, 25 insertions(+), 19 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
> index 6384f9cbf1..9b256a5108 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -72,27 +72,33 @@ FILES_localedef = "${bindir}/localedef"
>   LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
>   
>   do_install () {
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
>   	if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
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
>   	fi
> -	cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
> +        for d in . $(find "${LOCALETREESRC}/${datadir}/locale" -type d -printf '%P ') ; do
> +                install -d "${D}${datadir}/locale/$d"
> +                find "${LOCALETREESRC}/${datadir}/locale/$d" -maxdepth 1 -type f \
> +                -exec install -m 0644 -t "${D}${datadir}/locale/$d" {} \;
> +        done
> +	install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
>   }
>   
>   inherit libc-package



