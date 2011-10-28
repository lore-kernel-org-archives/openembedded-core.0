Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RJnKC-0002rP-Hc for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 16:22:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9SEGNiC020791
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 15:16:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20151-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 15:16:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9SEGFqb020785
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 15:16:16 +0100
Message-ID: <1319811374.3264.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 28 Oct 2011 15:16:14 +0100
In-Reply-To: <d8a6eb65b86bea7b1262748575a1609c664163ec.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
	<d8a6eb65b86bea7b1262748575a1609c664163ec.1319753141.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 18/18] xserver-nodm-init: use useradd to create xuser
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
X-List-Received-Date: Fri, 28 Oct 2011 14:22:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-28 at 00:06 +0200, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../x11-common/xserver-nodm-init.bb                |   26 ++++---------------
>  1 files changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> index ea4222d..33252cb 100644
> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init.bb
> @@ -2,11 +2,10 @@ DESCRIPTION = "Simple Xserver Init Script (no dm)"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  SECTION = "x11"
> -PR = "r26"
> +PR = "r27"
>  RDEPENDS_${PN} = "sudo"
>  
>  SRC_URI = "file://xserver-nodm \
> -           file://Xusername \
>             file://gplv2-license.patch"
>  
>  S = ${WORKDIR}
> @@ -19,27 +18,14 @@ do_install() {
>      install xserver-nodm ${D}/etc/init.d
>      if [ "${ROOTLESS_X}" = "1" ] ; then
>          install -d ${D}/etc/X11
> -        install Xusername ${D}/etc/X11
>      fi
>  }
>  
> -pkg_postinst_${PN} () {
> -    if [ "x$D" != "x" ] ; then
> -        exit 1
> -    fi
> -
> -    if [ -f /etc/X11/Xusername ]; then
> -        # create the rootless X user, and add user to group tty, video, audio
> -        username=`cat /etc/X11/Xusername`
> -        adduser --disabled-password $username
> -        # FIXME: use addgroup if busybox addgroup is ready
> -        sed -i -e "s/^video:.*/&${username}/g" /etc/group
> -        sed -i -e "s/^tty:.*/&${username}/g" /etc/group
> -        sed -i -e "s/^audio:.*/&${username}/g" /etc/group
> -    fi
> -}
> -
> -inherit update-rc.d
> +inherit update-rc.d useradd
>  
>  INITSCRIPT_NAME = "xserver-nodm"
>  INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
> +
> +USERADD_PACKAGES = "${PN}"
> +USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /etc/X11 --shell /bin/false --groups video,tty,audio --user-group xuser"

You've removed the Xusername file which is used by other parts of the
system. Its only enabled on x86 at this point iirc and will break
things :(. This patch therefore needs more work since the useradd need
to be conditional.

Cheers,

Richard



