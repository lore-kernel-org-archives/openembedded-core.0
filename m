Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TA7ad-00088q-CK for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 01:03:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q87MpTI3001708;
	Fri, 7 Sep 2012 23:51:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00407-05; Fri,  7 Sep 2012 23:51:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q87MpITx001701
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 7 Sep 2012 23:51:19 +0100
Message-ID: <1347058278.9270.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 07 Sep 2012 23:51:18 +0100
In-Reply-To: <1347054694-21086-1-git-send-email-mark.hatle@windriver.com>
References: <1347054694-21086-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] base-files: provide a mechanism to skip creation of the hostname file
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
X-List-Received-Date: Fri, 07 Sep 2012 23:03:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-07 at 16:51 -0500, Mark Hatle wrote:
> From: Mark Asselstine <mark.asselstine@windriver.com>
> 
> The existence of a /etc/hostname file causes any hostname provided on
> the kernel command line or via dhcp to be overwritten by the
> initscripts 'init.d/hostname.sh'. This change allows you to set a
> value of "" for 'hostname' which will skip the creation of the
> /etc/hostname file by the base-files package.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb |   12 +++++++-----
>  1 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 6bab040..cda13f4 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -107,10 +107,12 @@ do_install () {
>  }
>  
>  do_install_basefilesissue () {
> -	if [ -n "${MACHINE}" -a "${hostname}" = "openembedded" ]; then
> -		echo ${MACHINE} > ${D}${sysconfdir}/hostname
> -	else
> -		echo ${hostname} > ${D}${sysconfdir}/hostname
> +	if [ "${hostname}" != "" ]; then
> +		if [ -n "${MACHINE}" -a "${hostname}" = "openembedded" ]; then
> +			echo ${MACHINE} > ${D}${sysconfdir}/hostname
> +		else
> +			echo ${hostname} > ${D}${sysconfdir}/hostname
> +		fi
>  	fi


Is this missing a hostname ??= "openembedded" perhaps?

Cheers,

Richard

>  	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
> @@ -144,5 +146,5 @@ FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -CONFFILES_${PN} = "${sysconfdir}/fstab ${sysconfdir}/hostname"
> +CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname'][(d.getVar('hostname', True) != '')]}"
>  




