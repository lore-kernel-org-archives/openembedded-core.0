Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sgz6k-00085c-9j
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 16:08:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 06:57:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155455377"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 06:57:53 -0700
Message-ID: <4FE08561.9080604@linux.intel.com>
Date: Tue, 19 Jun 2012 06:57:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340112263.git.lianhao.lu@intel.com>
	<c4e1a065c0a9417fb466ab2e23c3dddddfd5000e.1340112263.git.lianhao.lu@intel.com>
In-Reply-To: <c4e1a065c0a9417fb466ab2e23c3dddddfd5000e.1340112263.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 1/3] classes/image: Allow openssh empty passwords login.
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
X-List-Received-Date: Tue, 19 Jun 2012 14:08:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/19/2012 06:33 AM, Lianhao Lu wrote:
> Allow empty passwords login so that the default root user can login in
> through openssh.
>
> Signed-off-by: Lianhao Lu<lianhao.lu@intel.com>
> ---
>   meta/classes/core-image.bbclass |    2 ++
>   meta/classes/image.bbclass      |   10 +++++++++-
>   2 files changed, 11 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index e2ad0fc..25f5c5a 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -69,4 +69,6 @@ ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
>
>   # Zap the root password if debug-tweaks feature is not enabled
>   ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_root_password ; ",d)}'
> +# Allow openssh accept empty password login if both debug-tweaks and ssh-server-openssh are enabled
> +ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks ssh-server-openssh", "openssh_allow_empty_password; ", "",d)}'
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index fb932b9..3f53271 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -318,6 +318,14 @@ zap_root_password () {
>   	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
>   }
>
> +# allow openssh accept login with empty password string
> +openssh_allow_empty_password () {
> +	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
> +		sed 's#.*PermitEmptyPasswords.*#PermitEmptyPasswords yes#' ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config>${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config.new
> +		mv -f ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config.new ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config
> +	fi
Why not use sed -i here?

Sau!

> +}
> +
>   # Turn any symbolic /sbin/init link into a file
>   remove_init_link () {
>   	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
> @@ -372,7 +380,7 @@ rootfs_trim_schemas () {
>   	done
>   }
>
> -EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
> +EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup openssh_allow_empty_password
>
>   do_fetch[noexec] = "1"
>   do_unpack[noexec] = "1"


