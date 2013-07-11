Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF066AE7C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 02:56:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6B2u9WK026386
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Jul 2013 19:56:09 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 10 Jul 2013 19:56:09 -0700
Message-ID: <51DE1EC8.2090902@windriver.com>
Date: Thu, 11 Jul 2013 10:56:08 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1373437638.git.Qi.Chen@windriver.com>
	<d076b1371417dcdb46fddbc6dd12685148832d0c.1373437638.git.Qi.Chen@windriver.com>
	<51DDBDDB.8080604@linux.intel.com>
In-Reply-To: <51DDBDDB.8080604@linux.intel.com>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] image.bbclass: add a method to add/delete/modify user/group settings
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
X-List-Received-Date: Thu, 11 Jul 2013 02:56:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2013 04:02 AM, Saul Wold wrote:
> On 07/09/2013 11:28 PM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> We may want to add a user or group which does not logically belong to
>> any specific package. For example, we may want to add a user with the
>> name 'tester' to our image. Besides, we may want to delete or modify
>> user/group in our image.
>>
>> This patch adds a variable, USER_GROUP_SETTINGS, which is dedicated
>> to these tasks. The configuration format is detailed in the local.conf.
>> sample.extended file.
>>
>> This patch also adds a function, set_user_group, which happens at
>> the end of the ROOTFS_POSTPROCESS_COMMAND. It handles the settings
>> in the USER_GROUP_SETTINGS variable.
>>
> After seeing the poky-tiny changes, which I will NAK, I am going to 
> recommend that we need to share a common base between this and the 
> existing useradd bbclass since you are both doing the same work.
>
> Also, I think what ever the top level looks like, it should be in a 
> class of it's own that can be inherited, such that it won't affect 
> other images, like a tiny or other distros that don't include login 
> support.
>
> I understand the difference and usage of useradd is targeting packages 
> and feeds, while this work is targeted towards customizing a final 
> image that is not truly part of the package feed.
>
> Sau!
>

Thanks for your suggestion. That's definitely a better approach.
I'll rework on this feature.

Best Regards,
Chen Qi

>> This logic here is quite similar to that of useradd.bbclass. If we
>> need to add or modify user/group settings, base-passwd and shadow
>> are pulled into the RDEPENDS and thus installed on target.
>>
>
>
>> [YOCTO #4074]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/image.bbclass |   42 
>> ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 380ed8e..a76289c 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -12,6 +12,8 @@ LICENSE = "MIT"
>>   PACKAGES = ""
>>   DEPENDS += "${MLPREFIX}qemuwrapper-cross 
>> ${MLPREFIX}depmodwrapper-cross"
>>   RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} 
>> ${NORMAL_FEATURE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL}"
>> +# Add to IMAGE_INSTALL base-passwd and shadow if USER_GROUP_SETTINGS 
>> is set
>> +IMAGE_INSTALL_append += "${@['', 'base-passwd 
>> shadow'][bool(d.getVar('USER_GROUP_SETTINGS', True))]}"
>>   RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
>>
>>   INHIBIT_DEFAULT_DEPS = "1"
>> @@ -179,6 +181,8 @@ ROOTFS_POSTPROCESS_COMMAND += 
>> '${@base_contains("IMAGE_FEATURES", "debug-tweaks"
>>   ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", 
>> "debug-tweaks", "postinst_enable_logging; ", "",d)}'
>>   # Set default postinst log file
>>   POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
>> +# Image level user / group settings
>> +ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
>>
>>   # some default locales
>>   IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
>> @@ -528,6 +532,44 @@ postinst_enable_logging () {
>>       echo "LOGFILE=${POSTINST_LOGFILE}" >> 
>> ${IMAGE_ROOTFS}${sysconfdir}/default/postinst
>>   }
>>
>> +# Image level user / group settings
>> +set_user_group () {
>> +    user_group_settings="${USER_GROUP_SETTINGS}"
>> +    export PSEUDO="${FAKEROOTENV} 
>> ${STAGING_DIR_NATIVE}${bindir}/pseudo"
>> +    setting=`echo $user_group_settings | cut -d ';' -f1`
>> +    remaining=`echo $user_group_settings | cut -d ';' -f2-`
>> +    while test "x$setting" != "x"; do
>> +        user_group=`echo $setting | cut -d ',' -f1`
>> +        action=`echo $setting | cut -d ',' -f2`
>> +        opts=`echo $setting | cut -d ',' -f3`
>> +        # determine the command according to user_group and action
>> +        if [ "$user_group" = "USER" ]; then
>> +            cmd_prefix="user"
>> +        elif [ "$user_group" = "GROUP" ]; then
>> +            cmd_prefix="group"
>> +        else
>> +            echo "Error: invalid setting of $user_group in the 
>> USER_GROUP_SETTINGS"
>> +            exit 1
>> +        fi
>> +        if [ "$action" = "ADD" ]; then
>> +            cmd_suffix="add"
>> +        elif [ "$action" = "DEL" ]; then
>> +            cmd_suffix="del"
>> +        elif [ "$action" = "MOD" ]; then
>> +            cmd_suffix="mod"
>> +        else
>> +            echo "Error: invalid setting of $user_group in the 
>> USER_GROUP_SETTINGS"
>> +            exit 1
>> +        fi
>> +        cmd=$cmd_prefix$cmd_suffix
>> +        echo "using commond <$cmd> for setting <$setting> ..."
>> +        eval $PSEUDO $cmd -R ${IMAGE_ROOTFS} $opts
>> +        # iterate to the next setting
>> +        setting=`echo $remaining | cut -d ';' -f1`
>> +        remaining=`echo $remaining | cut -d ';' -f2-`
>> +    done
>> +}
>> +
>>   # Turn any symbolic /sbin/init link into a file
>>   remove_init_link () {
>>       if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
>>
>
>


