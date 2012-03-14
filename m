Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7nm9-0001X8-DU for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 13:57:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2ECnD0B007695
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 12:49:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05480-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 12:49:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2ECn3eu007689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 12:49:03 GMT
Message-ID: <1331729342.18586.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 12:49:02 +0000
In-Reply-To: <947982d54b42df85d30c9a7b5e67a0c0a16bb949.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
	<947982d54b42df85d30c9a7b5e67a0c0a16bb949.1331713807.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 12/14] gpgme: fix packaging warnings
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
X-List-Received-Date: Wed, 14 Mar 2012 12:57:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-14 at 01:33 -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-support/gpgme/gpgme_1.3.1.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-support/gpgme/gpgme_1.3.1.bb b/meta/recipes-support/gpgme/gpgme_1.3.1.bb
> index 9ffedba..33858bf 100644
> --- a/meta/recipes-support/gpgme/gpgme_1.3.1.bb
> +++ b/meta/recipes-support/gpgme/gpgme_1.3.1.bb
> @@ -14,7 +14,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
>  SRC_URI[md5sum] = "90afa8436ce2b2683c001c824bd22601"
>  SRC_URI[sha256sum] = "15ef27a875ae0d79d7446fd931deda11438e724ffbeac74449ed19cba23df4d4"
>  DEPENDS = "libgpg-error libassuan pth"
> -PR = "r0"
> +PR = "r1"
>  
>  EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
>                  --with-gpg=${bindir}/gpg --without-gpgsm"
> @@ -26,3 +26,7 @@ FILES_${PN}-pth = "${libdir}/libgpgme-pth.so.*"
>  FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
>  FILES_${PN} = "${libdir}/libgpgme.so.*"
>  FILES_${PN}-dev += "${bindir}/gpgme-config ${datadir}/common-lisp/source/gpgme/*"
> +
> +do_install_append() {
> +	rm -rf ${D}/usr/libexec
> +}

Since this is an empty directory, could you just do a rmdir here please?

The reason is that if the package then does start installing files
there, we'd hit a build failure.

Cheers,

Richard




