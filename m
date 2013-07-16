Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5426B18D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 23:48:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jul 2013 16:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,680,1367996400"; d="scan'208";a="371364109"
Received: from unknown (HELO [10.255.13.97]) ([10.255.13.97])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2013 16:47:50 -0700
Message-ID: <51E5DBA6.4030300@linux.intel.com>
Date: Tue, 16 Jul 2013 16:47:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Qi.Chen@windriver.com
References: <cover.1373953711.git.Qi.Chen@windriver.com>
	<bef360c7ce9093d4f5856eaac88928766e6eac7a.1373953711.git.Qi.Chen@windriver.com>
In-Reply-To: <bef360c7ce9093d4f5856eaac88928766e6eac7a.1373953711.git.Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5 3/3] extrausers.bbclass: add a new bbclass
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
X-List-Received-Date: Tue, 16 Jul 2013 23:48:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2013 11:27 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> This class is dedicated to image level user/group configuration.
> It inherits useradd_base.bbclass.
>
> Users need to inherit this class in their layers or local.conf to
> make the setting of EXTRA_USERS_PARAMS effective.
>
> For detailed configuration format of EXTRA_USERS_PARAMS, please
> refer to local.conf.sample.extended.
>
> [YOCTO #4074]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/extrausers.bbclass |   61 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
>   create mode 100644 meta/classes/extrausers.bbclass
>
> diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
> new file mode 100644
> index 0000000..ec66913
> --- /dev/null
> +++ b/meta/classes/extrausers.bbclass
> @@ -0,0 +1,61 @@
> +# This bbclass is mainly used for image level user/group configuration.
> +# Inherit this class if you want to make EXTRA_USERS_PARAMS effective.
> +
> +# Below is an example showing how to use this functionality.
> +# INHERIT += "extrausers"
> +# EXTRA_USERS_PARAMS = "\
> +# useradd,-p '' tester; \
> +# groupadd,developers; \
> +# userdel,nobody; \
> +# groupdel,-g video; \
> +# groupmod,-g 1020 developers; \
> +# usermod,-s /bin/sh tester; \
> +# "
> +
Why use a , here to separate the command from the parameters, you 
already have the ; to separate commands while not use the first item for 
the command and the rest for the parameters.

Sau!

> +
> +inherit useradd_base
> +
> +IMAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS', True))]}"
> +
> +# Image level user / group settings
> +ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
> +
> +# Image level user / group settings
> +set_user_group () {
> +	user_group_settings="${EXTRA_USERS_PARAMS}"
> +	export PSEUDO="${FAKEROOTENV} ${STAGING_DIR_NATIVE}${bindir}/pseudo"
> +	setting=`echo $user_group_settings | cut -d ';' -f1`
> +	remaining=`echo $user_group_settings | cut -d ';' -f2-`
> +	while test "x$setting" != "x"; do
> +		cmd=`echo $setting | cut -d ',' -f1`
> +		opts=`echo $setting | cut -d ',' -f2`
> +		# Different from useradd.bbclass, there's no file locking issue here, as
> +		# this setting is actually a serial process. So we only retry once.
> +		case $cmd in
> +			useradd)
> +				perform_useradd "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
> +				;;
> +			groupadd)
> +				perform_groupadd "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
> +				;;
> +			userdel)
> +				perform_userdel "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
> +				;;
> +			groupdel)
> +				perform_groupdel "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
> +				;;
> +			usermod)
> +				perform_usermod "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
> +				;;
> +			groupmod)
> +				perform_groupmod "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts" 1
> +				;;
> +			*)
> +				bbfatal "Invalid command in EXTRA_USERS_PARAMS: $cmd"
> +				;;
> +		esac
> +		# iterate to the next setting
> +		setting=`echo $remaining | cut -d ';' -f1`
> +		remaining=`echo $remaining | cut -d ';' -f2-`
> +	done
> +}
>

