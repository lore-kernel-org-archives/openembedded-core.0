Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QRpI4-0003sf-9S for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:33:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p51HTvaH015648
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 18:29:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10378-10 for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2011 18:29:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p51HTlhW015642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 18:29:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <f1c4bd3cef1b384787b418e737c93cd105635196.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
	<f1c4bd3cef1b384787b418e737c93cd105635196.1306909184.git.sgw@linux.intel.com>
Date: Wed, 01 Jun 2011 18:29:29 +0100
Message-ID: <1306949369.27470.443.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 24/32] bitbake.conf: Create static-dev pacakge for static libraries
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
X-List-Received-Date: Wed, 01 Jun 2011 17:33:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-31 at 23:21 -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/bitbake.conf |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index de94316..4722eb0 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -248,13 +248,18 @@ FILES_${PN}-doc = "${docdir} ${mandir} ${infodir} ${datadir}/gtk-doc \
>  SECTION_${PN}-doc = "doc"
>  
>  FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
> -                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
> +                ${libdir}/*.o ${libdir}/pkgconfig \
>                  ${datadir}/pkgconfig ${datadir}/aclocal \
>                  ${base_libdir}/*.a ${base_libdir}/*.o"
>  SECTION_${PN}-dev = "devel"
>  ALLOW_EMPTY_${PN}-dev = "1"
>  RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
>  
> +FILES_${PN}-static-dev = "${libdir}/*.a ${base_libdir}/*.a"
> +SECTION_${PN}-static-dev = "devel"
> +ALLOW_EMPTY_${PN}-static-dev = "1"

No need for the ALLOW_EMPTY here. The dependencies of -dev packages are
important but it makes no sense for static dv packages.

I've also a slight preference for "staticdev" just to make these clearly
different from -dev packages.

Cheers,

Richard

> +RDEPENDS_${PN}-static-dev = "${PN} (= ${EXTENDPV})"
> +
>  DOTDEBUG-dbg = "${bindir}/.debug ${sbindir}/.debug ${libexecdir}/.debug ${libdir}/.debug \
>              ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug ${libdir}/${PN}/.debug \
>              ${libdir}/matchbox-panel/.debug /usr/src/debug"




