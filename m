Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id F33726A59E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 23:20:31 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Jul 2013 16:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1023,1363158000"; d="scan'208";a="265639002"
Received: from unknown (HELO [10.255.13.85]) ([10.255.13.85])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Jul 2013 16:20:32 -0700
Message-ID: <51DB4940.2000606@linux.intel.com>
Date: Mon, 08 Jul 2013 16:20:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1373003615.git.Qi.Chen@windriver.com>
	<341a64b50c13dec0bf01feb5c74d5b32815a7191.1373003615.git.Qi.Chen@windriver.com>
In-Reply-To: <341a64b50c13dec0bf01feb5c74d5b32815a7191.1373003615.git.Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: add a method to add/delete/modify user/group settings
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
X-List-Received-Date: Mon, 08 Jul 2013 23:20:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2013 11:07 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> We may want to add a user or group which does not logically belong to
> any specific package. For example, we may want to add a user with the
> name 'tester' to our image. Besides, we may want to delete or modify
> user/group in our image.
>
> This patch adds a variable, USER_GROUP_SETTINGS, which is dedicated
> to these tasks. The configuration format is detailed in the local.conf.
> sample.extended file.
>
> This patch also adds a function, set_user_group, which happens at
> the end of the ROOTFS_POSTPROCESS_COMMAND. It handles the settings
> in the USER_GROUP_SETTINGS variable.
>
> [YOCTO #4074]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/image.bbclass |   48 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 380ed8e..8ce97be 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -179,6 +179,8 @@ ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks"
>   ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'
>   # Set default postinst log file
>   POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
> +# Image level user / group settings
> +ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
>
>   # some default locales
>   IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
> @@ -528,6 +530,52 @@ postinst_enable_logging () {
>   	echo "LOGFILE=${POSTINST_LOGFILE}" >> ${IMAGE_ROOTFS}${sysconfdir}/default/postinst
>   }
>
> +# Image level user / group settings
> +set_user_group () {
> +	user_group_settings="${USER_GROUP_SETTINGS}"
> +	export PSEUDO="${FAKEROOTENV} ${STAGING_DIR_NATIVE}${bindir}/pseudo"
> +	# login.def may no be present in rootfs, if so, we use that one in sysroot as a default
> +	if [ ! -e ${IMAGE_ROOTFS}${sysconfdir}/login.defs ]; then
> +		cp ${STAGING_DIR_TARGET}/${sysconfdir}/login.defs ${IMAGE_ROOTFS}${sysconfdir}/login.defs
> +		target_login_def="no"
> +	fi
Since this gets run every time for image creation, we can be sure an 
image won't be using someform of login, so finding login.defs might not 
be the best thing to do.

take the poky.tiny example and failures:
> cp: cannot stat '/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/poky-tiny/build/build/tmp/sysroots/qemux86//etc/login.defs': No such file or directory
> ERROR: Function failed: do_rootfs (log file is located at /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/poky-tiny/build/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.24531)
> NOTE: recipe core-image-minimal-1.0-r0: task do_rootfs: Failed

Sau!



> +	setting=`echo $user_group_settings | cut -d ';' -f1`
> +	remaining=`echo $user_group_settings | cut -d ';' -f2-`
> +	while test "x$setting" != "x"; do
> +		user_group=`echo $setting | cut -d ',' -f1`
> +		action=`echo $setting | cut -d ',' -f2`
> +		opts=`echo $setting | cut -d ',' -f3`
> +		# determine the command according to user_group and action
> +		if [ "$user_group" = "USER" ]; then
> +			cmd_prefix="user"
> +		elif [ "$user_group" = "GROUP" ]; then
> +			cmd_prefix="group"
> +		else
> +			echo "Error: invalid setting of $user_group in the USER_GROUP_SETTINGS"
> +			exit 1
> +		fi
> +		if [ "$action" = "ADD" ]; then
> +			cmd_suffix="add"
> +		elif [ "$action" = "DEL" ]; then
> +			cmd_suffix="del"
> +		elif [ "$action" = "MOD" ]; then
> +			cmd_suffix="mod"
> +		else
> +			echo "Error: invalid setting of $user_group in the USER_GROUP_SETTINGS"
> +			exit 1
> +		fi
> +		cmd=$cmd_prefix$cmd_suffix
> +		echo "using commond <$cmd> for setting <$setting> ..."
> +		eval $PSEUDO $cmd -R ${IMAGE_ROOTFS} $opts
> +		# iterate to the next setting
> +		setting=`echo $remaining | cut -d ';' -f1`
> +		remaining=`echo $remaining | cut -d ';' -f2-`
> +	done
> +	if [ "$target_login_def" = "no" ]; then
> +		rm -f ${IMAGE_ROOTFS}${sysconfdir}/login.defs
> +	fi
> +}
> +
>   # Turn any symbolic /sbin/init link into a file
>   remove_init_link () {
>   	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
>

