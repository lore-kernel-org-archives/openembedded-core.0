Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qy1Qu-0000SB-8m for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 14:59:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7TCsSGp002994
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 13:54:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22015-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 13:54:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7TCsJsq002988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 13:54:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <87a9dca42042f94b9de19efa514b2938cc11e486.1314604566.git.xiaofeng.yan@windriver.com>
References: <cover.1314604566.git.xiaofeng.yan@windriver.com>
	<87a9dca42042f94b9de19efa514b2938cc11e486.1314604566.git.xiaofeng.yan@windriver.com>
Date: Mon, 29 Aug 2011 13:54:11 +0100
Message-ID: <1314622451.5939.285.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] dropbear: Change the path to find configuration file and add a configuration file for dropbear
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
X-List-Received-Date: Mon, 29 Aug 2011 12:59:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-29 at 18:48 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> dropbear will check "/etc/pam.d/sshd" which comes from package "openssh" \
> When enabling pam supporting. But if we only install dropbear \
> package without package "openssh", then "dropbear" will not \
> find a configuration file. The changes are as follow for fixing this bug:
> 
> - Change the path to find configuration file (/etc/pam.d/sshd --> /etc/pam.d/dropbear)
> - Add a configuration file "/etc/pam.d/dropbear"
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-core/dropbear/dropbear.inc            |    6 +++++-
>  meta/recipes-core/dropbear/dropbear/dropbear       |    4 ++++
>  .../dropbear/dropbear-configuration-file.patch     |   18 ++++++++++++++++++
>  3 files changed, 27 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear
>  create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-configuration-file.patch
> 
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
> index 5af9ebd..577b288 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -19,7 +19,9 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.gz \
>  	         file://init \
>                   ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} "
>  
> -PAM_SRC_URI = "file://dropbear-enable-pam.patch"
> +PAM_SRC_URI = "file://dropbear-enable-pam.patch \
> +               file://dropbear-configuration-file.patch \
> +               file://dropbear"
>  
>  inherit autotools update-rc.d
>  
> @@ -51,6 +53,7 @@ do_install() {
>  		   ${D}${sysconfdir}/init.d \
>  		   ${D}${sysconfdir}/default \
>  		   ${D}${sysconfdir}/dropbear \
> +		   ${D}${sysconfdir}/pam.d \
>                     ${D}${bindir} \
>  		   ${D}${sbindir} \
>  		   ${D}${localstatedir}
> @@ -68,6 +71,7 @@ do_install() {
>  				  -e 's,/usr/bin,${bindir},g' \
>  				  -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/dropbear
>  	chmod 755 ${D}${sysconfdir}/init.d/dropbear
> +	install -m 0644 ${WORKDIR}/dropbear  ${D}${sysconfdir}/pam.d/

I suspect this won't build in the DISTRO_FEATURES not containing pam
case due to the above file not existing. Please put a check in there to
see if it exists.

Cheers,

Richard



