Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF47ECAAD3
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 18:42:34 +0000 (UTC)
Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com
 (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.web11.28390.1662403345354996255
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 11:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=kEUpx/Sk;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.3,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=gbzmgNrI1lC0ACJoG9aZUbPCGo755vDfCIx4ADy2Nkc=;
	b=kEUpx/SkwH5yjUB1iTO/LsvH4JxS5Nwt9G18HFwXz3gS8y4JJ7cO0X1OdUgi6Zz9My9/CuHO31618
	 xLoVGNAvntwaEabyeY1WKPvOkCzN1tojsog84qLdWgLCiJ+KpGR5yUNEeRbUsyJqJkecYZCQ2QEruB
	 0vNNATVD19bBvq6dBswLhy6S3mtCg3kS79Pe5RT2rCyK4VO42cUREt6ZNQQtacCYfyPsX4sN8Ilr4c
	 u2tuNX3RmpbFOJB/kJR5E2CJdsrHZEletbxFOuB/rz3VafsVBKVKDSrVaLi8jtEKtRk0Grxlj3Pxna
	 Or6edKo8GMzhQuFDlIM7rCCn5GzG7Aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=gbzmgNrI1lC0ACJoG9aZUbPCGo755vDfCIx4ADy2Nkc=;
	b=6EWZs1c5CaMs2A1dOI05VUvk9d8CQH6OvSzUh9uenYBvB3GX1bTBbHg704n2pmRA5udCj8rx3Bi3e
	 LrpJUJoAw==
X-HalOne-Cookie: df510d68f88bf7ec515a76d462aed962ebb532ea
X-HalOne-ID: 7a9eb86c-2d4a-11ed-824a-d0431ea8bb10
Received: from [192.168.100.34] (ua-213-113-159-147.bbcust.telenor.se
 [213.113.159.147])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 7a9eb86c-2d4a-11ed-824a-d0431ea8bb10;
	Mon, 05 Sep 2022 18:42:22 +0000 (UTC)
Message-ID: <cad3a386-356f-c99b-1e87-3098d2879417@berginkonsult.se>
Date: Mon, 5 Sep 2022 20:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH] rootfs-postcommands.bbclass: avoid moving ssh
 host keys if etc is writable
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20220905142329.34087-1-peter@berginkonsult.se>
 <dbbb813cd6f64ff2b034ab6968ac328a@axis.com>
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <dbbb813cd6f64ff2b034ab6968ac328a@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 18:42:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170325

Thanks for the review. I have addressed them in v2 that is sent.

/Peter

On 2022-09-05 18:15, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Peter Bergin
>> Sent: den 5 september 2022 16:23
>> To: openembedded-core@lists.openembedded.org
>> Cc: Peter Bergin <peter@berginkonsult.se>
>> Subject: [OE-core] [PATCH] rootfs-postcommands.bbclass: avoid moving ssh host keys if etc is writable
>>
>> When using IMAGE_FEATURE read-only-rootfs ssh host keys are moved to volatile
>> storage. If the feature overlayfs-etc is used in addition to read-only-rootfs
>> /etc is writable and the move is not wanted. But in the case also the IMAGE_FEATURE
>> stateless-roots is used the keys will be moved as storage of keys should not
> Correct "stateless-roots" to "stateless-rootfs".
>
>> be wanted in a stateless-rootfs.
>>
>> This change only takes effect in the case IMAGE_FEATURE contains read-only-rootfs.
>> In adddition the following cases are handled:
>>
>>    IMAGE_FEATURES = "read-only-rootfs" --> ssh keys/config handled as ro root
>>    IMAGE_FEATURES = "read-only-rootfs overlayfs-etc" --> ssh keys/config handled as rw root
>>    IMAGE_FEATURES = "read-only-rootfs stateless-rootfs" --> ssh keys/config handled as ro root
>>    IMAGE_FEATURES = "read-only-rootfs overlayfs-etc stateless-rootfs" --> ssh keys/config handled as ro root
>>
>> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
>> ---
>>   .../rootfs-postcommands.bbclass               | 32 +++++++++++--------
>>   1 file changed, 18 insertions(+), 14 deletions(-)
>>
>> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
>> index 215e38e33d..367fe07c09 100644
>> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
>> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
>> @@ -22,7 +22,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
>>   # Create /etc/timestamp during image construction to give a reasonably sane default time setting
>>   ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
>>
>> -# Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
>> +# Tweak files in /etc if read-only-rootfs is enabled
>>   ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
>>
>>   # We also need to do the same for the kernel boot parameters,
>> @@ -111,21 +111,25 @@ read_only_rootfs_hook () {
>>   	# If we're using openssh and the /etc/ssh directory has no pre-generated keys,
>>   	# we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
>>   	# and the keys under /var/run/ssh.
>> -	if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
>> -		if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
>> -			echo "SYSCONFDIR=\${SYSCONFDIR:-/etc/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
>> -			echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
>> -		else
>> -			echo "SYSCONFDIR=\${SYSCONFDIR:-/var/run/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
>> -			echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
>> +	# If overlayfs-etc is used this is not done as /etc is treated as writable
>> +	# If stateless-rootfs is enabled this is always done as we don't want to save keys then
>> +	if ${@ 'false;' if bb.utils.contains('IMAGE_FEATURES', 'overlayfs-etc', True, False, d) and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else 'true;'} then
> It is easier to understand the combined if statement if the
> conditions of the inner if statements are true when the
> conditions of the outer if statement shall be true. Also,
> the ";" belongs outside the ${@...}:
>
> 	if ${@ 'true' if not bb.utils.contains('IMAGE_FEATURES', 'overlayfs-etc', True, False, d) or bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else 'false'}; then
>
>> +	    if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
> Correct the indentation here and below. Indentation of shell
> code in OE Core is done using tabs.
>
>> +		    if [ -e ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key ]; then
>> +			    echo "SYSCONFDIR=\${SYSCONFDIR:-/etc/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
>> +			    echo "SSHD_OPTS=" >> ${IMAGE_ROOTFS}/etc/default/ssh
>> +		    else
>> +			    echo "SYSCONFDIR=\${SYSCONFDIR:-/var/run/ssh}" >> ${IMAGE_ROOTFS}/etc/default/ssh
>> +			    echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
>> +		    fi
>>   		fi
>> -	fi
>>
>> -	# Also tweak the key location for dropbear in the same way.
>> -	if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
>> -		if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
>> -			echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
>> -		fi
>> +	    # Also tweak the key location for dropbear in the same way.
>> +	    if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
>> +		    if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
>> +			    echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
>> +		    fi
>> +	    fi
>>   	fi
>>
>>   	if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
>> --
>> 2.34.1
> //Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170319): https://lists.openembedded.org/g/openembedded-core/message/170319
> Mute This Topic: https://lists.openembedded.org/mt/93479678/3617552
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [peter@berginkonsult.se]
> -=-=-=-=-=-=-=-=-=-=-=-
>

