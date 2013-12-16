Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E20A66DD22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 20:23:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Dec 2013 12:19:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,497,1384329600"; d="scan'208";a="453179373"
Received: from unknown (HELO [10.255.15.128]) ([10.255.15.128])
	by orsmga002.jf.intel.com with ESMTP; 16 Dec 2013 12:23:00 -0800
Message-ID: <52AF6124.7040101@linux.intel.com>
Date: Mon, 16 Dec 2013 12:23:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Yasir Khan <yasir_khan@mentor.com>, 
	openembedded-core@lists.openembedded.org
References: <1387194688-11022-1-git-send-email-yasir_khan@mentor.com>
In-Reply-To: <1387194688-11022-1-git-send-email-yasir_khan@mentor.com>
Subject: Re: [PATCH V2] openssl.inc: Install c_rehash utility with openssl
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
X-List-Received-Date: Mon, 16 Dec 2013 20:23:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/2013 03:51 AM, Yasir Khan wrote:
> From: mykhani <yasir_khan@mentor.com>
>
> c_rehash utility is not being installed with openssl.It conveniently
> generates hash and symbolic links based on it for CA certificates
> stored locally for SSL based server authentication
>
> Signed-off-by: mykhani <yasir_khan@mentor.com>
> ---
>   meta/recipes-connectivity/openssl/openssl.inc |   11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 78ff7ae..5cb67df 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -34,10 +34,14 @@ export AS = "${CC} -c"
>   inherit pkgconfig siteinfo multilib_header
>
>   PACKAGES =+ "libcrypto libssl ${PN}-misc"
> +
> +#Adding RDEPENDS for perl scripts
> +RDEPENDS_${PN}-misc +="perl"
> +
>   FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
>   FILES_libssl = "${libdir}/libssl.so.*"
>   FILES_${PN} =+ " ${libdir}/ssl/*"
> -FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
> +FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf ${bindir}/c_rehash"
>   FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
>

This patch did not apply cleanly, you might be based on an older version 
of this file.  Please rebase against master.

>   do_configure_prepend_darwin () {
> @@ -148,5 +152,10 @@ do_install () {
>   	oe_multilib_header openssl/opensslconf.h
>   }
>
> +do_install_append() {
> +    # The c_rehash utility isn't installed by the normal installation process.
> +    install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
> +}
> +
Also, I think this should just be part of the do_install lower in this file.

Sau!

>   BBCLASSEXTEND = "native nativesdk"
>
>

