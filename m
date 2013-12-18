Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EE19C60D03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 08:00:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBI80w7g020204
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Dec 2013 00:00:59 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 18 Dec 2013 00:00:58 -0800
Message-ID: <52B15679.5010400@windriver.com>
Date: Wed, 18 Dec 2013 16:02:01 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1387352773.git.Qi.Chen@windriver.com>
	<1d839acafb980cad80c7f6b7179d965c095d8c15.1387352773.git.Qi.Chen@windriver.com>
	<1E5A9F5D-5734-46B9-A331-B4FC852A58B3@dominion.thruhere.net>
In-Reply-To: <1E5A9F5D-5734-46B9-A331-B4FC852A58B3@dominion.thruhere.net>
X-Originating-IP: [128.224.162.213]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] image.bbclass: add ability to set systemd default target
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
X-List-Received-Date: Wed, 18 Dec 2013 08:00:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/2013 03:53 PM, Koen Kooi wrote:
> Op 18 dec. 2013, om 08:49 heeft Qi.Chen@windriver.com het volgende geschreven:
>
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Add ability to set the default target for systemd images.
>>
>> The default value for the target is derived from checking whether
>> IMAGE_FEATRUES
> typo
>
>> contains 'x11-base' or not. Each image could override
>> this value in its own recipe. For now, we don't need to do any change,
>> because all images that support graphical environment has 'x11-base'
>> in its IMAGE_FEATRUES.
> typo

Thanks for pointing it out.

> And you're missing the actual SYSTEMD_DEFAULT_TARGET in the description.

I'll modify the commit message and send out a new version.

>   If it only works on images, please to something like IMAGE_SYSTEMD_DEFAULT_TARGET

What do you mean by "it only works on images"?

Best Regards,
Chen Qi

>> [YOCTO #3816]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>> meta/classes/image.bbclass |   10 ++++++++++
>> 1 file changed, 10 insertions(+)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index c595721..4c63bc2 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -186,6 +186,9 @@ IMAGE_MANIFEST = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
>> ROOTFS_POSTPROCESS_COMMAND =+ "write_image_manifest ; "
>> # Set default postinst log file
>> POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
>> +# Set default target for systemd images
>> +SYSTEMD_DEFAULT_TARGET ?= '${@base_contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
>> +ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; ", "", d)}'
>>
>> # some default locales
>> IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
>> @@ -596,6 +599,13 @@ postinst_enable_logging () {
>> 	echo "LOGFILE=${POSTINST_LOGFILE}" >> ${IMAGE_ROOTFS}${sysconfdir}/default/postinst
>> }
>>
>> +# Modify systemd default target
>> +set_systemd_default_target () {
>> +	if [ -d ${IMAGE_ROOTFS}${sysconfdir}/systemd/system -a -e ${IMAGE_ROOTFS}${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET} ]; then
>> +		ln -sf ${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET} ${IMAGE_ROOTFS}${sysconfdir}/systemd/system/default.target
>> +	fi
>> +}
>> +
>> # Turn any symbolic /sbin/init link into a file
>> remove_init_link () {
>> 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
>> -- 
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>


