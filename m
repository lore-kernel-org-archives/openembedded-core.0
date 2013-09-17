Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 420E96B389
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 13:25:15 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8HDdPJ6022568; Tue, 17 Sep 2013 14:39:26 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eDohHCy87-Gp; Tue, 17 Sep 2013 14:39:25 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8HDdLdS022541
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 17 Sep 2013 14:39:23 +0100
Message-ID: <1379424300.32201.123.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com
Date: Tue, 17 Sep 2013 14:25:00 +0100
In-Reply-To: <5623d6e9d394f968e15d165d65ce3748008be05d.1379038097.git.Qi.Chen@windriver.com>
References: <cover.1379038097.git.Qi.Chen@windriver.com>
	<5623d6e9d394f968e15d165d65ce3748008be05d.1379038097.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: do not automatically remove update-rc.d
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
X-List-Received-Date: Tue, 17 Sep 2013 13:25:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-13 at 10:09 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> In rootfs_uninstall_unneeded function, the update-rc.d package would
> be removed if no 'package-management' and no delayed postinsts.
> 
> However, in update-rc.d.bbclass, the update-rc.d package is only
> recommended. Thus, if NO_RECOMMENDATIONS is enabled or 'update-rc.d'
> is added to BAD_RECOMMENDATIONS, the update-rc.d package will not
> be installed at the first place. Tring to remove it will result in an
> error.
> 
> Also this function assumes that update-rc.d is only used by postinsts.
> This assumption isn't always true. Users may want to write their own
> init scripts and use the update-rc.d tool to manage them.
> 
> [YOCTO #5169]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/image.bbclass |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

This is not correct. The correct behaviour here is to uninstall these
packages *if* they are installed. Just removing it from the list is not
the real fix.

Cheers,

Richard

> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index f1e62f14..f37cd90 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -505,12 +505,12 @@ rootfs_uninstall_unneeded () {
>  	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
>  		if [ -z "$(delayed_postinsts)" ]; then
>  			# All packages were successfully configured.
> -			# update-rc.d, base-passwd, run-postinsts are no further use, remove them now
> +			# base-passwd, run-postinsts are no further use, remove them now
>  			remove_run_postinsts=false
>  			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
>  				remove_run_postinsts=true
>  			fi
> -			rootfs_uninstall_packages update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}
> +			rootfs_uninstall_packages base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}
>  
>  			# Need to remove rc.d files for run-postinsts by hand since opkg won't
>  			# call postrm scripts in offline root mode.



