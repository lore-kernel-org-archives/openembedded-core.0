Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2191374197
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 07:41:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t817fN6g006915
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Sep 2015 00:41:23 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 1 Sep 2015 00:41:22 -0700
Message-ID: <55E556A1.8010904@windriver.com>
Date: Tue, 1 Sep 2015 15:41:21 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1439976330-20413-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1439976330-20413-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][v2] glibc: package nscd related files
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
X-List-Received-Date: Tue, 01 Sep 2015 07:41:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-Roy

On 2015年08月19日 17:25, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> install nscd related configuration file, startup files, and package them,
> make nscd easy to startup
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-core/glibc/glibc-package.inc | 40 ++++++++++++++++++++++++++++++-
>   meta/recipes-core/glibc/glibc.inc         |  2 +-
>   2 files changed, 40 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index def0e0c..9bded67 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -49,7 +49,8 @@ FILES_libsotruss = "${libdir}/audit/sotruss-lib.so"
>   FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
>   FILES_${PN}-dev += "${bindir}/rpcgen ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
>   FILES_${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
> -FILES_nscd = "${sbindir}/nscd*"
> +FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_unitdir}/system/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
> +              ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd"
>   FILES_${PN}-mtrace = "${bindir}/mtrace"
>   FILES_tzcode = "${bindir}/tzselect ${sbindir}/zic ${sbindir}/zdump"
>   FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
> @@ -105,6 +106,29 @@ do_install_append () {
>   			rmdir ${D}${sysconfdir}
>   		fi
>   	fi
> +
> +	if echo ${PN}|grep -q "glibc-initial"; then
> +		return
> +	fi
> +
> +	install -d ${D}${sysconfdir}/init.d
> +	install -d ${D}${localstatedir}/db/nscd
> +	install -m 0755 ${S}/nscd/nscd.init ${D}${sysconfdir}/init.d/nscd
> +	install -m 0755 ${S}/nscd/nscd.conf ${D}${sysconfdir}/nscd.conf
> +	sed -i "s%daemon%start-stop-daemon --start --exec%g" ${D}${sysconfdir}/init.d/nscd
> +
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${S}/nscd/nscd.service ${D}${systemd_unitdir}/system/
> +
> +	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +		install -d ${D}${sysconfdir}/tmpfiles.d
> +		echo "d /run/nscd 755 root root -" \
> +			> ${D}${sysconfdir}/tmpfiles.d/nscd.conf
> +	else
> +		install -d ${D}${sysconfdir}/default/volatiles
> +		echo "d root root 0755 /var/run/nscd none" \
> +			> ${D}${sysconfdir}/default/volatiles/98_nscd
> +	fi
>   }
>
>   do_install_append_aarch64 () {
> @@ -174,3 +198,17 @@ glibc_package_preprocess () {
>   		rm -rf ${PKGD}${exec_prefix}/lib
>   	fi
>   }
> +
> +pkg_postinst_nscd () {
> +	if [ -z "$D" ]; then
> +		if command -v systemd-tmpfiles >/dev/null; then
> +			systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/nscd.conf
> +		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
> +			${sysconfdir}/init.d/populate-volatile.sh update
> +		fi
> +	fi
> +}
> +CONFFILES_nscd="${sysconfdir}/nscd.conf"
> +
> +SYSTEMD_PACKAGES = "nscd"
> +SYSTEMD_SERVICE_nscd = "nscd.service"
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index 74ad0b5..03ffb2f 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -41,7 +41,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers
>   #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
>   PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
>   PROVIDES += "virtual/libintl virtual/libiconv"
> -inherit autotools texinfo distro_features_check
> +inherit autotools texinfo distro_features_check systemd
>   require glibc-options.inc
>
>   # The main purpose of setting this variable is to prevent users from accidently
>

-- 
Best Reagrds,
Roy | RongQing Li

