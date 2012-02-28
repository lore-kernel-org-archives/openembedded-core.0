Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S2N8l-0008Lp-7v for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 14:30:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1SDMM9E017798;
	Tue, 28 Feb 2012 13:22:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17526-04; Tue, 28 Feb 2012 13:22:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1SDMEg7017791
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 28 Feb 2012 13:22:15 GMT
Message-ID: <1330435337.9185.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 28 Feb 2012 13:22:17 +0000
In-Reply-To: <1330415917-3451-1-git-send-email-koen@dominion.thruhere.net>
References: <1330415917-3451-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] tcl 8.5.11: fix packaging
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
X-List-Received-Date: Tue, 28 Feb 2012 13:30:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-28 at 08:58 +0100, Koen Kooi wrote:
> Include /usr/lib/tcl8 for the msgcat and test module, force dependency on tcl-lib since shlibs isn't picking it up.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-devtools/tcltk/tcl_8.5.11.bb |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
> index 146021a..a9a41fb 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.5.11.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://../license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11
>      file://../win/license.terms;md5=a47a9be26d03f925fc1fbd2784f27e11 \
>      "
>  
> -PR = "r2"
> +PR = "r3"
>  
>  BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
>                  file://tcl-add-soname.patch"
> @@ -59,7 +59,10 @@ do_install() {
>  
>  PACKAGES =+ "${PN}-lib"
>  FILES_${PN}-lib = "${libdir}/libtcl8.5.so*"
> -FILES_${PN} += "${prefix}/lib/tcl8.5"
> +FILES_${PN} += "${prefix}/lib/tcl8.5 ${prefix}/lib/tcl8"
>  FILES_${PN}-dev += "${libdir}/tclConfig.sh"
>  
> +# isn't getting picked up by shlibs code
> +RDEPENDS_${PN} += "${PN}-lib"
> +
>  BBCLASSEXTEND = "native"


ERROR: Nothing RPROVIDES 'tcl-native-lib-native' (but virtual:native:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly/build/meta/recipes-devtools/tcltk/tcl_8.5.11.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'tcl-native-lib-native' is unbuildable, removing.

This needs to be spelt out as tcl-lib instead of ${PN}-lib...

Cheers,

Richard





