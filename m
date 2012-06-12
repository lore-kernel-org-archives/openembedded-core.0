Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SeRjR-0008Px-U2 for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 16:06:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CDtW5r010998
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:55:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10276-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:55:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CDtOFB010991
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 14:55:24 +0100
Message-ID: <1339509322.8065.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2012 14:55:22 +0100
In-Reply-To: <de650fb4dbcc6e2539f9325c58dbe5dd1e94f137.1339495723.git.lianhao.lu@intel.com>
References: <40eb390623c511dadf467d19e146a4dc92b70856.1339495723.git.lianhao.lu@intel.com>
	<de650fb4dbcc6e2539f9325c58dbe5dd1e94f137.1339495723.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2 3/3] classes/image: Allow openssh empty passwords login.
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
X-List-Received-Date: Tue, 12 Jun 2012 14:06:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-06-12 at 18:10 +0800, Lianhao Lu wrote:
> Allow empty passwords login so that the default root user can login in
> through openssh.
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/classes/core-image.bbclass |    2 ++
>  meta/classes/image.bbclass      |   10 +++++++++-
>  2 files changed, 11 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index e2ad0fc..25f5c5a 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -69,4 +69,6 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
>  
>  # Zap the root password if debug-tweaks feature is not enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_root_password ; ",d)}'
> +# Allow openssh accept empty password login if both debug-tweaks and ssh-server-openssh are enabled
> +ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks ssh-server-openssh", "openssh_allow_empty_password; ", "",d)}'
>  
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index fb932b9..3f53271 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -318,6 +318,14 @@ zap_root_password () {
>  	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
>  } 
>  
> +# allow openssh accept login with empty password string
> +openssh_allow_empty_password () {
> +	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
> +		sed 's#.*PermitEmptyPasswords.*#PermitEmptyPasswords yes#' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config >${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config.new
> +		mv -f ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config.new ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
> +	fi
> +}

Can't we just use the -i option here?

>  # Turn any symbolic /sbin/init link into a file
>  remove_init_link () {
>  	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
> @@ -372,7 +380,7 @@ rootfs_trim_schemas () {
>  	done
>  }
>  
> -EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
> +EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup openssh_allow_empty_password

This use of EXPORT_FUNCTIONS looks wrong, you don't need to add this
here and in fact that whole line can probably be removed...

Cheers,

Richard



