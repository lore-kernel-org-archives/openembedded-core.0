Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A981F60E97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 13:33:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBJDXOGI016823; Thu, 19 Dec 2013 13:33:25 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Sq9PjhsY8-4A; Thu, 19 Dec 2013 13:33:24 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBJDXJCe016819
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 19 Dec 2013 13:33:20 GMT
Message-ID: <1387459994.6402.69.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yasir Khan <yasir_khan@mentor.com>
Date: Thu, 19 Dec 2013 13:33:14 +0000
In-Reply-To: <1387268915-28265-1-git-send-email-yasir_khan@mentor.com>
References: <1387268915-28265-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] openssl.inc: Install c_rehash utility with openssl
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
X-List-Received-Date: Thu, 19 Dec 2013 13:33:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-12-17 at 13:28 +0500, Yasir Khan wrote:
> From: mykhani <yasir_khan@mentor.com>
> 
> c_rehash utility is not being installed with openssl.It conveniently
> generates hash and symbolic links based on it for CA certificates
> stored locally for SSL based server authentication
> 
> Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Unfortunately this commit has increased our benchmark build time by
approximately 3 minutes on a 1 hour 25 minute build time which is quite
a regression :(.

Would you be able to help figure out how we can regain some of the
performance?

Cheers,

Richard

> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 3bfe569..cdb1809 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -13,6 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
>  
>  DEPENDS = "perl-native-runtime"
>  
> +# Adding RDEPENDS for perl scripts
> +RDEPENDS_${PN}-misc +="perl"
> +
>  SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>            "
>  S = "${WORKDIR}/openssl-${PV}"
> @@ -37,7 +40,7 @@ PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
>  FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
>  FILES_libssl = "${libdir}/libssl.so.*"
>  FILES_${PN} =+ " ${libdir}/ssl/*"
> -FILES_${PN}-misc = "${libdir}/ssl/misc"
> +FILES_${PN}-misc = "${libdir}/ssl/misc ${bindir}/c_rehash"
>  FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
>  
>  # Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
> @@ -157,6 +160,8 @@ do_install () {
>  	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
>  
>  	oe_multilib_header openssl/opensslconf.h
> +	# The c_rehash utility isn't installed by the normal installation process.
> +	install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
>  }
>  
>  BBCLASSEXTEND = "native nativesdk"



