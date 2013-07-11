Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32F6E60666
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 15:02:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6BF2f5Y014421
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 08:02:41 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Jul 2013 08:02:39 -0700
Message-ID: <51DEC911.7010500@windriver.com>
Date: Thu, 11 Jul 2013 10:02:41 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1373540849.git.Qi.Chen@windriver.com>
	<f54b840a6d0b07950b01024e511292f8e4483fad.1373540849.git.Qi.Chen@windriver.com>
In-Reply-To: <f54b840a6d0b07950b01024e511292f8e4483fad.1373540849.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Thu, 11 Jul 2013 15:02:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/11/13 6:11 AM, Qi.Chen@windriver.com wrote:
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
>   meta/classes/usersettings.bbclass |   48 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 meta/classes/usersettings.bbclass
>
> diff --git a/meta/classes/usersettings.bbclass b/meta/classes/usersettings.bbclass
> new file mode 100644
> index 0000000..e5a5156
> --- /dev/null
> +++ b/meta/classes/usersettings.bbclass
> @@ -0,0 +1,48 @@
> +# This bbclass is mainly used for image level user/group configuration.
> +# Inherit this class if you want to make USER_GROUP_SETTINGS effective.
> +inherit userbase

One request, in the comment above, please put some examples of the using the new 
functionality.  It's not completely clear to me looking at this what may be 
expected of the user.

--Mark

> +
> +IMAGE_INSTALL_append += "${@['', 'base-passwd shadow'][bool(d.getVar('USER_GROUP_SETTINGS', True))]}"
> +
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
> +				;;
> +		esac
> +		# iterate to the next setting
> +		setting=`echo $remaining | cut -d ';' -f1`
> +		remaining=`echo $remaining | cut -d ';' -f2-`
> +	done
> +}
>


