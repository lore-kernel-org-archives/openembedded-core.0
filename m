Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D090ECAAD4
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 00:19:41 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.5840.1661818770956794491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 17:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 27U0FRDt004963;
	Mon, 29 Aug 2022 19:15:28 -0500
Message-ID: <fc5ef086-5e6b-854d-4686-d39a07aeef8f@kernel.crashing.org>
Date: Mon, 29 Aug 2022 19:15:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH] rootfs-postcommands: Make /etc/timestamp
 consistent with image
Content-Language: en-US
To: wak@google.com, openembedded-core@lists.openembedded.org
References: <20220829235935.670738-1-wak@google.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20220829235935.670738-1-wak@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 00:19:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170042



On 8/29/22 6:59 PM, William A. Kennington III via lists.openembedded.org wrote:
> This makes the determination of the timestamp for the /etc/timestamp
> file consistent with mtimes in the generated image. This is desirable to
> make the built image reproducible with the git commit date instead of
> the current date.

This is only going to pay attention to poky, or oe-core...  the rootfs will vary 
with a change to ANY layer in the system.

If you really want to be consistent you would need to iterate over all of the 
layers and look at every file in the system for the timestamp (or if they're git 
repositories last commit in each layer..)

All of this doesn't seem like it really makes sense to me which is why a static 
timestamp was defined previously.

(with the previous change to the time stamps, I've had more then one user get 
concerned they were 'using old software' when they just built something from 
scratch -- this will get even more confusing if it's only based on the 
oe-core/poky repository.)

--Mark

> Change-Id: I7d9fe32906aa93baf53948aa40b7a98fb05dd384
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>   meta/classes-recipe/rootfs-postcommands.bbclass | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
> index 215e38e33d..8d710186d7 100644
> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> @@ -312,12 +312,14 @@ python write_image_manifest () {
>   # Can be used to create /etc/timestamp during image construction to give a reasonably
>   # sane default time setting
>   rootfs_update_timestamp () {
> -	if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" != "" ]; then
> -		# Convert UTC into %4Y%2m%2d%2H%2M%2S
> -		sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
> -	else
> -		sformatted=`date -u +%4Y%2m%2d%2H%2M%2S`
> +	if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> +		REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct 2>/dev/null` || true
> +		if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> +			REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
> +		fi
>   	fi
> +	# Convert UTC into %4Y%2m%2d%2H%2M%2S
> +	sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
>   	echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
>   	bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatted"
>   }
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170041): https://lists.openembedded.org/g/openembedded-core/message/170041
> Mute This Topic: https://lists.openembedded.org/mt/93339153/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

