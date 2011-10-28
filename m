Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RJiRh-000056-VA for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 11:09:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9S93ndJ014999
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 10:03:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14404-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 10:03:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9S93gCc014993
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 10:03:43 +0100
Message-ID: <1319792621.22423.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 28 Oct 2011 10:03:41 +0100
In-Reply-To: <1319684838-24527-1-git-send-email-msm@freescale.com>
References: <1312980634.6733.62.camel@phil-desktop>
	<1319684838-24527-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Fix libgcc nativesdk to install libgcc.a in good location for tools
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
X-List-Received-Date: Fri, 28 Oct 2011 09:09:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-26 at 22:07 -0500, Matthew McClintock wrote:
> This fixes an issue where we cannot find -lgcc when linking. We
> update the path to libgcc.a so the library can be installed
> correctly
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> I really doubt this is the correct fix and I'm no expert but it's
> here for comments. This fixes a real u-boot cross compile build
> issue

This patch looks very very confused to me. Firstly your subject summary
talks about libgcc-nativesdk. This is the compiler used to generate
binaries for SDKMACHINE so I seriously doubt you're using nativesdk to
build uboot.

> The previous mv command was failing as the files did not exist
> and I also rejiggered the packages since I was not sure if
> gdb-cross-canadian-powerpc-dev was included in my tarball of
> the toolchain
> 
>  meta/recipes-devtools/gcc/libgcc_4.6.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
> index 63a46ec..7f3ac55 100644
> --- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
> +++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
> @@ -8,9 +8,8 @@ PACKAGES = "\
>    ${PN}-dev \
>    "
>  
> -FILES_${PN} = "${base_libdir}/libgcc*.so.*"
> +FILES_${PN} = "${base_libdir}/libgcc*"

This is changing the packging of libgcc too, not just libgcc-nativesdk.
It is not correct to be putting the dynamic linking symlinks in anything
but the -dev package so the above and the line below are therefore wrong
too.

>  FILES_${PN}-dev = " \
> -  ${base_libdir}/libgcc*.so \
>    ${libdir}/${TARGET_SYS}/${BINV}/crt* \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
>  
> @@ -29,9 +28,10 @@ do_install () {
>  	if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then
>  		mv ${D}${libdir}/nof/libgcc* ${D}${base_libdir}
>  	else
> -		mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
> +		cp ${D}${libdir}/${TARGET_SYS}/${BINV}/libgcc* ${D}${base_libdir}
>  	fi

Equally, you're moving a static library from the -dev package into the
main package which is wrong, you only need that if you're doing
development.

Are you sure your problem is not that you didn't have the libgcc-dev
package installed?

Cheers,

Richard



