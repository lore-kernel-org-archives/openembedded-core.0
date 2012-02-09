Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RvYLc-00044T-M6
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 19:03:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Feb 2012 09:55:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104999161"
Received: from unknown (HELO [10.255.14.208]) ([10.255.14.208])
	by azsmga001.ch.intel.com with ESMTP; 09 Feb 2012 09:55:48 -0800
Message-ID: <4F3408A4.7050301@linux.intel.com>
Date: Thu, 09 Feb 2012 09:55:48 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328809480-13730-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1328809480-13730-1-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH 2/2] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Thu, 09 Feb 2012 18:03:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2012 09:44 AM, Andrei Gherzan wrote:
> This fix is for dhclient. It needs libcrypto at runtime and if
> libcrypto is in libdir, it's path can be inaccessible on systems
> where /usr is on nfs for example or dhclient is needed before
> /usr is mounted.
>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   meta/recipes-connectivity/openssl/openssl.inc |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 771f146..45a6422 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -36,10 +36,11 @@ export AS = "${CC} -c"
>   inherit pkgconfig siteinfo
>
>   PACKAGES =+ "libcrypto libssl ${PN}-misc"
> -FILES_libcrypto = "${libdir}/libcrypto.so.*"
> +FILES_libcrypto = "${base_libdir}/libcrypto.so.*"
libcrypto${SOLIBS}


>   FILES_libssl = "${libdir}/libssl.so.*"
>   FILES_${PN} =+ " ${libdir}/ssl/*"
>   FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
> +FILES_${PN}-dev += "${base_libdir}/libcrypto.so"
>
libcrypto${SOLIBSDEV}

These would be better to use than


>   do_configure_prepend_darwin () {
>   	sed -i -e '/version-script=openssl\.ld/d' Configure
> @@ -132,6 +133,10 @@ do_install () {
>   	oe_libinstall -so libcrypto ${D}${libdir}
>   	oe_libinstall -so libssl ${D}${libdir}
>
> +	# Moving libcrypto to /usr
> +	mv ${D}${libdir}/libcrypto* ${D}${base_libdir}/
> +	sed -i s/usr// ${D}/${libdir}/pkgconfig/libcrypto.pc
> +
>   	install -d ${D}${includedir}
>   	cp --dereference -R include/openssl ${D}${includedir}
>   	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl


