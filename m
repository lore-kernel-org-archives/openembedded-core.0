Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RvYwm-0005HM-DG
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 19:42:20 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Feb 2012 10:34:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115947679"
Received: from unknown (HELO [10.255.14.208]) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2012 10:34:14 -0800
Message-ID: <4F3411A6.3060703@linux.intel.com>
Date: Thu, 09 Feb 2012 10:34:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328812244-32105-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1328812244-32105-1-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Thu, 09 Feb 2012 18:42:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2012 10:30 AM, Andrei Gherzan wrote:
> This fix is for dhclient. It needs libcrypto at runtime and if
> libcrypto is in libdir, it's path can be inaccessible on systems
> where /usr is on nfs for example or dhclient is needed before
> /usr is mounted.
>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   meta/recipes-connectivity/openssl/openssl.inc      |    8 +++++++-
>   .../recipes-connectivity/openssl/openssl_1.0.0g.bb |    2 +-
>   2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 771f146..76a28ff 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -36,10 +36,11 @@ export AS = "${CC} -c"
>   inherit pkgconfig siteinfo
>
>   PACKAGES =+ "libcrypto libssl ${PN}-misc"
> -FILES_libcrypto = "${libdir}/libcrypto.so.*"
> +FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
>   FILES_libssl = "${libdir}/libssl.so.*"
>   FILES_${PN} =+ " ${libdir}/ssl/*"
>   FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
> +FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
>
>   do_configure_prepend_darwin () {
>   	sed -i -e '/version-script=openssl\.ld/d' Configure
> @@ -132,6 +133,11 @@ do_install () {
>   	oe_libinstall -so libcrypto ${D}${libdir}
>   	oe_libinstall -so libssl ${D}${libdir}
>
> +	# Moving libcrypto to /usr
> +	mkdir -p ${D}/${base_libdir}/
> +	mv ${D}${libdir}/libcrypto* ${D}${base_libdir}/
> +	sed -i s/usr// ${D}/${libdir}/pkgconfig/libcrypto.pc
> +

You still did not fix the case of libdir == base_libdir as Phil pointed out.

Sau!

>   	install -d ${D}${includedir}
>   	cp --dereference -R include/openssl ${D}${includedir}
>   	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
> index 80dfcb3..8ffe931 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
> @@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
>
>   CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
>


