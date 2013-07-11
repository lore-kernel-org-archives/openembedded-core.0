Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 1298661663
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 12:58:33 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Jul 2013 05:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1043,1363158000"; d="scan'208";a="329849393"
Received: from unknown (HELO helios.localnet) ([10.252.122.35])
	by azsmga001.ch.intel.com with ESMTP; 11 Jul 2013 05:58:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Qi.Chen@windriver.com
Date: Thu, 11 Jul 2013 13:58:17 +0100
Message-ID: <6939690.qrXmoo12No@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <f54b840a6d0b07950b01024e511292f8e4483fad.1373540849.git.Qi.Chen@windriver.com>
References: <cover.1373540849.git.Qi.Chen@windriver.com>
	<f54b840a6d0b07950b01024e511292f8e4483fad.1373540849.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 3/3] usersettings.bbclass: add a new bbclass
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
X-List-Received-Date: Thu, 11 Jul 2013 12:58:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 11 July 2013 19:11:39 Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> This class is dedicated to image level user/group configuration.
> It inherits userbase.bbclass.
> 
> Users need to inherit this class in their layers or local.conf to
> make the setting of USER_GROUP_SETTINGS effective.
> 
> For detailed configuration format of USER_GROUP_SETTINGS, please
> refer to local.conf.sample.extended.
> 
> [YOCTO #4074]
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/usersettings.bbclass |   48
> +++++++++++++++++++++++++++++++++++++ 1 file changed, 48 insertions(+)
>  create mode 100644 meta/classes/usersettings.bbclass
> 
> diff --git a/meta/classes/usersettings.bbclass
> b/meta/classes/usersettings.bbclass new file mode 100644
> index 0000000..e5a5156
> --- /dev/null
> +++ b/meta/classes/usersettings.bbclass
> @@ -0,0 +1,48 @@
> +# This bbclass is mainly used for image level user/group configuration.
> +# Inherit this class if you want to make USER_GROUP_SETTINGS effective.
> +inherit userbase
> +
> +IMAGE_INSTALL_append += "${@['', 'base-passwd shadow'][bool(d.getVar('USER_GROUP_SETTINGS', True))]}"

This is a bit ugly. We should avoid using _append += since it is confusing,
and we have base_conditional for things like this. I'd suggest:

IMAGE_INSTALL_append = "${@base_conditional('USER_GROUP_SETTINGS', '1', ' base-passwd shadow', '', d)}"

> +# Image level user / group settings
> +ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
> +
> +# Image level user / group settings
> +set_user_group () {
> +	user_group_settings="${USER_GROUP_SETTINGS}"
> +	export PSEUDO="${FAKEROOTENV} ${STAGING_DIR_NATIVE}${bindir}/pseudo"
> +	setting=`echo $user_group_settings | cut -d ';' -f1`
> +	remaining=`echo $user_group_settings | cut -d ';' -f2-`
> +	while test "x$setting" != "x"; do
> +		action=`echo $setting | cut -d ',' -f1`
> +		opts=`echo $setting | cut -d ',' -f2`
> +		# Different from useradd.bbclass, there's no file locking issue here, as
> +		# this setting is actually a serial process. So we only retry once.
> +		case $action in
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
> +				bbfatal "Incorrect setting for USER_GROUP_SETTINGS"

Could you please make it report $action in the error so it's clear which
value is invalid?

> +				;;
> +		esac
> +		# iterate to the next setting
> +		setting=`echo $remaining | cut -d ';' -f1`
> +		remaining=`echo $remaining | cut -d ';' -f2-`
> +	done
> +}

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

