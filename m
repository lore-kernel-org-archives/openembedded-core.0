Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TA8bu-0005xA-E9
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 02:09:18 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Sep 2012 16:56:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,388,1344236400"; d="scan'208";a="142782271"
Received: from unknown (HELO helios.localnet) ([10.252.121.181])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Sep 2012 16:56:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 08 Sep 2012 00:56:48 +0100
Message-ID: <3797326.nJL3Eer77d@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1347041849-1559-1-git-send-email-sgw@linux.intel.com>
References: <1347041849-1559-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
Cc: Marc Ferland <marc.ferland@gmail.com>
Subject: Re: [PATCH] openssh: allow root login when debug-tweaks is enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Sep 2012 00:09:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 07 September 2012 11:17:29 Saul Wold wrote:
> This allows root to login over ssh with an empty password just like
> dropbear when the debug-tweaks are enabled, it's important to disable
> debug-tweaks for a production system as this will leave open a security
> hole!
> 
> Thanks to Marc for the settings.
> Cc: Marc Ferland <marc.ferland@gmail.com>
> 
> [Yocto #3078]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
> b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb index 31202d4..fcd082c
> 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
> @@ -7,7 +7,7 @@ SECTION = "console/network"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
> 
> -PR = "r3"
> +PR = "r4"
> 
>  DEPENDS = "zlib openssl"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> @@ -75,6 +75,13 @@ do_install_append () {
>  			install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
>  		fi
>  	done
> +	for i in ${IMAGE_FEATURES};
> +	do
> +		if [ ${i} = "debug-tweaks" ]; then
> +			sed -i -e "s/^#PermitRootLogin/PermitRootLogin/"
> ${D}${sysconfdir}/ssh/sshd_config +			sed -i -e "s/^#PermitEmptyPasswords
> no/PermitEmptyPasswords yes/" ${D}${sysconfdir}/ssh/sshd_config +		fi
> +	done
>  	install -d ${D}${sysconfdir}/init.d
>  	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
>  	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin

I'm a bit confused by this because I thought this issue had already been 
solved. Unfortunately when I looked back I see the patch was never merged:

http://patches.openembedded.org/patch/29693/

I agree with Phil, we really don't want to replicate dropbear's usage of 
IMAGE_FEATURES outside of image handling code - in fact there is a bug in the 
Yocto Project bugzilla (#2578) against me to remove this for dropbear.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


