Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TtoLI-0000DA-G5
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Jan 2013 00:49:01 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jan 2013 15:33:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,455,1355126400"; d="scan'208";a="272905928"
Received: from unknown (HELO [10.255.14.194]) ([10.255.14.194])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2013 15:33:37 -0800
Message-ID: <50F0A151.20609@linux.intel.com>
Date: Fri, 11 Jan 2013 15:33:37 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1357465230.git.Qi.Chen@windriver.com>
	<589cb89b315809bf657c394c4ad5e7aac83d43e5.1357465230.git.Qi.Chen@windriver.com>
In-Reply-To: <589cb89b315809bf657c394c4ad5e7aac83d43e5.1357465230.git.Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V6 2/6] image.bbclass: add two funtions to support readonly rootfs
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
X-List-Received-Date: Fri, 11 Jan 2013 23:49:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2013 01:44 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> read_only_rootfs_hook: this funtion is invoked only if 'read-only-rootfs'
> is in IMAGE_FEATURES. It tweaks some basic files and makes populate-
> volatile.sh script run at rootfs time.
>
> choose_volatile_conf: this function is exported and should be overriden
> by the specific image recipe. Config files specific to read-only rootfs
> are closely related to the image types. So these config file should be
> provided by the corresponding image recipes.
> In addition, this function adds support to customized config files for
> customized images.
>
> [YOCTO #3406]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/image.bbclass |   29 ++++++++++++++++++++++++-----
>   1 file changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index d3a416d..0cd49f0 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -167,6 +167,7 @@ inherit ${IMAGE_CLASSES}
>   IMAGE_POSTPROCESS_COMMAND ?= ""
>   MACHINE_POSTPROCESS_COMMAND ?= ""
>   ROOTFS_POSTPROCESS_COMMAND_prepend = "run_intercept_scriptlets; "
> +ROOTFS_POSTPROCESS_COMMAND_prepend = "choose_volatile_conf; "
>
>   # some default locales
>   IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
> @@ -185,6 +186,11 @@ do_build[nostamp] = "1"
>   # task, so that we have a single fakeroot context for the whole process.
>   do_rootfs[umask] = "022"
>
> +choose_volatile_conf () {
> +        # This task should be overriden by the specific image recipe.
> +        # It is used to install the correct conf file for volatile storage
> +        # handling to support read-only rootfs.
> +}
>
>   run_intercept_scriptlets () {
>   	if [ -d ${WORKDIR}/intercept_scripts ]; then
> @@ -396,6 +402,21 @@ zap_root_password () {
>   	mv ${IMAGE_ROOTFS}/etc/passwd.new ${IMAGE_ROOTFS}/etc/passwd
>   }
>
> +# A hook function to support read-only-rootfs IMAGE_FEATURES
> +read_only_rootfs_hook () {
> +	# Tweak the mount option in fstab
> +	sed -i '/rootfs/ s/defaults/ro/' ${IMAGE_ROOTFS}/etc/fstab
> +	# Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
> +	if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
> +		sed -i 's/ROOTFS_READ_ONLY=no/ROOTFS_READ_ONLY=yes/' ${IMAGE_ROOTFS}/etc/default/rcS
> +	fi
> +	# Run populate-volatile.sh at rootfs time to set up basic files
> +	# and directories to support read-only rootfs.
> +	if [ -e ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
> +		${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
> +	fi
> +}
> +
>   # allow openssh accept login with empty password string
>   openssh_allow_empty_password () {
>   	if [ -e ${IMAGE_ROOTFS}${sysconfdir}/ssh/sshd_config ]; then
> @@ -458,11 +479,9 @@ rootfs_trim_schemas () {
>   	done
>   }
>
> -EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup
> +EXPORT_FUNCTIONS zap_root_password remove_init_link do_rootfs make_zimage_symlink_relative set_image_autologin rootfs_update_timestamp rootfs_no_x_startup choose_volatile_conf
>
> -do_fetch[noexec] = "1"
> -do_unpack[noexec] = "1"
> -do_patch[noexec] = "1"
> +# do_fetch, do_unpack and do_patch are needed to copy conf files to workdir
>   do_configure[noexec] = "1"
>   do_compile[noexec] = "1"
>   do_install[noexec] = "1"
> @@ -472,4 +491,4 @@ do_package_write_ipk[noexec] = "1"
>   do_package_write_deb[noexec] = "1"
>   do_package_write_rpm[noexec] = "1"
>
> -addtask rootfs before do_build
> +addtask rootfs before do_build after do_patch
>
Why is this needed, and will it continue to be needed if we move to the 
*-volatile-conf packages?

Sau!



