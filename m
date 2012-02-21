Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rzv31-0002Vs-TB
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 20:06:48 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Feb 2012 10:58:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119770769"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2012 10:58:27 -0800
Message-ID: <4F43E953.9000300@linux.intel.com>
Date: Tue, 21 Feb 2012 10:58:27 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1329295747-25855-1-git-send-email-ken.werner@linaro.org>
In-Reply-To: <1329295747-25855-1-git-send-email-ken.werner@linaro.org>
Cc: Ken Werner <ken.werner@linaro.org>
Subject: Re: [PATCH] Add sanity checks for eglibc locale
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
X-List-Received-Date: Tue, 21 Feb 2012 19:06:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2012 12:49 AM, Ken Werner wrote:
> Add sanity checks that test for the existance of folders. This allows to use
> an external binary toolchain that doesn't have localization support.
> ---
>   meta/recipes-core/eglibc/eglibc-locale.inc  |   20 +++++++++++++++-----
>   meta/recipes-core/eglibc/eglibc-package.inc |    4 +++-
>   2 files changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
> index b4646fa..2e9b4d4 100644
> --- a/meta/recipes-core/eglibc/eglibc-locale.inc
> +++ b/meta/recipes-core/eglibc/eglibc-locale.inc
> @@ -72,11 +72,21 @@ LOCALETREESRC = "${STAGING_INCDIR}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS
>
>   do_install () {
>   	mkdir -p ${D}${bindir} ${D}${datadir} ${D}${libdir}
> -	cp -fpPR ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
> -	cp -fpPR ${LOCALETREESRC}/${libdir}/locale ${D}${libdir}
> -	cp -fpPR ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> -	cp -fpPR ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> -	cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> +	if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> +		cp -fpPR ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
> +	fi
> +	if [ -e ${LOCALETREESRC}/${libdir}/locale ]; then
> +		cp -fpPR ${LOCALETREESRC}/${libdir}/locale ${D}${libdir}
> +	fi
> +	if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> +		cp -fpPR ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> +	fi
> +	if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> +		cp -fpPR ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> +	fi
> +	if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> +		cp -fpPR ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> +	fi
>   	cp -fpPR ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
>   }
>
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index 870b95d..2a1d939 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -91,7 +91,9 @@ do_install_locale () {
>   		mv -f ${D}${libdir}/gconv ${dest}${libdir}
>   	fi
>   	cp -fpPR ${D}${libdir}/* ${dest}${libdir}
> -        mv ${D}${datadir}/i18n ${dest}${datadir}
> +	if [ -e ${D}${datadir}/i18n ]; then
> +		mv ${D}${datadir}/i18n ${dest}${datadir}
> +	fi
>   	cp -fpPR ${D}${datadir}/* ${dest}${datadir}
>   	cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
>   }

Merged into OE-core

Thanks
	Sau!


