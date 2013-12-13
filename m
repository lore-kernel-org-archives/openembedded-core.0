Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9069B6DDFD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 18:43:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Dec 2013 10:39:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,480,1384329600"; d="scan'208";a="424359686"
Received: from unknown (HELO [10.255.12.47]) ([10.255.12.47])
	by orsmga001.jf.intel.com with ESMTP; 13 Dec 2013 10:43:41 -0800
Message-ID: <52AB555C.6050705@linux.intel.com>
Date: Fri, 13 Dec 2013 10:43:40 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Yasir Khan <yasir_khan@mentor.com>, 
	openembedded-core@lists.openembedded.org
References: <1386958134-20626-1-git-send-email-yasir_khan@mentor.com>
In-Reply-To: <1386958134-20626-1-git-send-email-yasir_khan@mentor.com>
Subject: Re: [PATCH] openssl_1.0.1e: Install c_rehash utility with openssl
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
X-List-Received-Date: Fri, 13 Dec 2013 18:43:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/2013 10:08 AM, Yasir Khan wrote:
> From: mykhani <yasir_khan@mentor.com>
>
> c_rehash utility is not being installed with openssl. It conveniently
> generates hash and symbolic links based on it for CA certificates
> stored locally for SSL based server authentication
>
> Signed-off-by: mykhani <yasir_khan@mentor.com>
> ---
>   meta/recipes-connectivity/openssl/openssl_1.0.1e.bb |   10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> index ac27dba..f52877c 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
> @@ -4,6 +4,9 @@ require openssl.inc
>   # if they are available.
>   DEPENDS += "ocf-linux"
>
> +# Perl is needed for the c_rehash script
> +RDEPENDS_${PN} += "perl"
> +
>   CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>
>   PR = "${INC_PR}.0"
> @@ -53,3 +56,10 @@ PARALLEL_MAKEINST = ""
>   do_configure_prepend() {
>     cp ${WORKDIR}/find.pl ${S}/util/find.pl
>   }
> +
> +do_install_append() {
> +    # The c_rehash utility isn't being installed by the normal installation process.
> +    # It conveniently generates both hash and symbolic links based on hash for CA certificates.
> +    install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
> +}
> +
Let's package this in a separate package such as ${PN}-misc, and then 
the perl dependency can be for that package only, I see that -misc 
already has some perl scripts but no RDEPENDS (it really should).

I am not sure that this tool and perl will be wanted on on embedded 
machines using openssl.

Also, I think this can go in the openssl.inc file instead of the .bb

Sau!

Sau!

>

