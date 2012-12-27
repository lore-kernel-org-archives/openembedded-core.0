Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ToIKN-0007cm-Dk
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 19:37:26 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Dec 2012 10:22:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,363,1355126400"; d="scan'208";a="185345997"
Received: from unknown (HELO [10.255.14.22]) ([10.255.14.22])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Dec 2012 10:22:15 -0800
Message-ID: <50DC91D7.10306@linux.intel.com>
Date: Thu, 27 Dec 2012 10:22:15 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1356576405.git.Qi.Chen@windriver.com>
	<819997e2cad5d6a4bf2621fb7cc443105ca0fc87.1356576405.git.Qi.Chen@windriver.com>
In-Reply-To: <819997e2cad5d6a4bf2621fb7cc443105ca0fc87.1356576405.git.Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] image.bbclass: add two hook funtions to support read-only rootfs
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
X-List-Received-Date: Thu, 27 Dec 2012 18:37:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/2012 06:57 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> read_only_rootfs_hook: this funtion is invoked only if 'read-only-rootfs'
> is in IMAGE_FEATURES. It tweaks some basic files and makes populate-
> volatile.sh script run at rootfs time.
>
> choose_volatile_conf_file: this function properly chooses the right
> conf file for volatile storage handling according to the IMAGE_FEATURES.
>
> [YOCTO #3406]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/image.bbclass |   29 +++++++++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 8bf718a..15d42d0 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -394,6 +394,35 @@ zap_root_password () {
>   	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
>   }
>
> +# A hook function to support read-only-rootfs IMAGE_FEATURES
> +read_only_rootfs_hook () {
> +	# Tweak the mount option in fstab
> +	sed '/rootfs/ s/defaults/ro/' < ${IMAGE_ROOTFS}/etc/fstab > ${IMAGE_ROOTFS}/etc/fstab.new
> +	mv ${IMAGE_ROOTFS}/etc/fstab.new ${IMAGE_ROOTFS}/etc/fstab
> +	# Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
> +	sed 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' < ${IMAGE_ROOTFS}/etc/default/rcS > ${IMAGE_ROOTFS}/etc/default/rcS.new
> +	mv ${IMAGE_ROOTFS}/etc/default/rcS.new ${IMAGE_ROOTFS}/etc/default/rcS
For the above 2 sed/mv, can't you use sed -i instead, cuts down on the 
exec overhead.

Sau!

> +	# Run populate-volatile.sh at rootfs time to set up basic files
> +	# and directories to support read-only rootfs.
> +	if [ ! -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
> +		echo "${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh doesn't exist."
> +		exit 1
> +	else
> +		${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
> +	fi
> +}
> +
> +# Choose the correct config file for volatile storage handling according to the image type
> +choose_volatile_conf_file () {
> +	if ${@base_contains("IMAGE_FEATURES", "x11-sato", "true", "false" ,d)}; then
> +		cp ${IMAGE_ROOTFS}/etc/default/volatiles_stage/volatiles-readonly-sato \
> +			${IMAGE_ROOTFS}/etc/default/volatiles/00_core_readonly
> +	else
> +		cp ${IMAGE_ROOTFS}/etc/default/volatiles_stage/volatiles-readonly-minimal \
> +			${IMAGE_ROOTFS}/etc/default/volatiles/00_core_readonly
> +	fi
> +}
> +
>   # allow openssh accept login with empty password string
>   openssh_allow_empty_password () {
>   	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
>


