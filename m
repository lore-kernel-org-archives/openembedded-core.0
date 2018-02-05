Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AA1FE78419
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 12:49:11 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w15CnAfw023225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 5 Feb 2018 12:49:11 GMT
Message-ID: <1517834950.3090.80.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <mnhu@prevas.dk>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 05 Feb 2018 12:49:10 +0000
In-Reply-To: <20180205122544.27223-2-mnhu@prevas.dk>
References: <20180205122544.27223-1-mnhu@prevas.dk>
	<20180205122544.27223-2-mnhu@prevas.dk>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH] bind: add packageconfig for python-support
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
X-List-Received-Date: Mon, 05 Feb 2018 12:49:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-02-05 at 13:25 +0100, Martin Hundebøll wrote:
> Break the hard runtime dependency on python3-core by adding a
> (default-on) packageconfig option for python.
> 
> Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
> ---
>  meta/recipes-connectivity/bind/bind_9.10.6.bb | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb
> b/meta/recipes-connectivity/bind/bind_9.10.6.bb
> index 8b8835ba80..2ec7ab44f0 100644
> --- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
> @@ -38,16 +38,19 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --
> enable-threads \
>                   --with-openssl=${STAGING_LIBDIR}/.. \
>                 "
>  
> -inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
> +inherit autotools update-rc.d systemd useradd pkgconfig
>  
>  export PYTHON_SITEPACKAGES_DIR
>  
>  # PACKAGECONFIGs readline and libedit should NOT be set at same time
> -PACKAGECONFIG ?= "readline"
> +PACKAGECONFIG ?= "readline python"
>  PACKAGECONFIG[httpstats] = "--with-libxml2,--without-
> libxml2,libxml2"
>  PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
>  PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
>  PACKAGECONFIG[urandom] = "--with-randomdev=/dev/urandom,--with-
> randomdev=/dev/random,,"
> +PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-
> python,python3-core,python3-core"
> +
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'python',
> 'python3native', '', d)}
>  
>  USERADD_PACKAGES = "${PN}"
>  USERADD_PARAM_${PN} = "--system --home ${localstatedir}/cache/bind
> --no-create-home \
> @@ -60,7 +63,6 @@ SYSTEMD_SERVICE_${PN} = "named.service"
>  
>  PARALLEL_MAKE = ""
>  
> -RDEPENDS_${PN} = "python3-core"
>  RDEPENDS_${PN}-dev = ""
>  
>  PACKAGE_BEFORE_PN += "${PN}-utils"
> @@ -88,7 +90,11 @@ do_install_append() {
>  	install -d "${D}${sysconfdir}/init.d"
>  	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
>  	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
> -	sed -i -e '1s,#!.*python3,#! /usr/bin/python3,'
> ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
> +
> +	if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python',
> 'python', '', d)}" ]; then
> +		sed -i -e '1s,#!.*python3,#! /usr/bin/python3,' \
> +			${D}${sbindir}/dnssec-coverage
> ${D}${sbindir}/dnssec-checkds
> +	fi

Rather than having a broken file, shouldn't it be deleted in the "no
python" case?

Cheers,

Richard
 




