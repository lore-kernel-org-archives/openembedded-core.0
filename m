Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DB9C5DF70
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 08:47:05 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4318.1787042824058477350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 01:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=kctHFCrY;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=S+DsPZ2T;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 052EB1400164;
	Tue, 18 Aug 2026 04:47:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 18 Aug 2026 04:47:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787042823;
	 x=1787129223; bh=XfoiFp8Mj6BWtq9a46NWf9bGf7i/Dh1vW4ddkN0epM8=; b=
	kctHFCrYGtrm8NsPNY/+dRCLQZnuroTwIf3YCnoiFLgLrsQ7WjwEDMNDBxvApF0P
	JmsuDmw1jYjbDlPINk+K0vfgGEx2hTDGmU7DPZoqYV2kBT5aiSDBYB8Phgmb+Neb
	3MO7F14GR7/3URGCtYFjDUCyp8AKcBnQf9GZN/tuFBkLO6yFHMXKurP6O7gRIrEW
	mFRd2o0kgGv8ZvGzYUldiVoMzKaD48lCGXgIS3MzW+P9VMwR8vD1INrnM37xQSmY
	fQPgt8hWj2lx65vIdFMNcGjFKPDsIxwQx53sherzvZJrQ7fQCJjng+nhTWxj9gvH
	7JW8glInCfEWhcyHsXuoNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787042823; x=1787129223; bh=X
	foiFp8Mj6BWtq9a46NWf9bGf7i/Dh1vW4ddkN0epM8=; b=S+DsPZ2TyxneXQrLd
	pQOsFy4vj184RYrq4dtNedMtaw/TOMJxmli3uXdVcrsvHq9rdb+XmlyJ8zHmvuGJ
	3LJmpJ8JOIdQBGKLFSTG8rM/0FdFg/ZEVUBBeVRE9HnB7LBHQxtlBWnPJ5LTUXul
	Ie0EoBAFa6RjyMautEjXCy4VlBboFhH03eNOQDLd6+ezKHyF2kpMzJAZP+1UAHbo
	vQTag/ZtREtwCcX+CXl2+xvJi0ZH5ZYaSbJgSPLvzVl6C6785JU2gCniVoeyVC8L
	TRjT6sXInwLYRwKCx7cEoAplBrwLpRHh1SS50a6r/kKfb+MxdP6D7J5dqa8dbXdV
	SJXvA==
X-ME-Sender: <xms:BhyEavtchv7KnJskejNPzoawCLkA1VEPNjsnf9DDvbYfkjwObvV6xQ>
    <xme:BhyEauZh_Z9Go1Eo9maF-496EZfRN8Nt59jchCQc7A4u9mI5Rl3uiwsWIcN8qe108
    JZdOTbJkLedK3-qD59-W_w9Q7DFwqcyaaCl4MARjVxhSGjI8pHFYSo>
X-ME-Received: <xmr:BhyEaqXQpWKqzPPPoziMcy9FtpTMz5IKefbMmpDQmv0Owfs25t-M5kEkZzuCx4wlho5DIxLM3VbWKY6GdYboT5Bw5eSRZomVdFWcpVg>
X-ME-Proxy-Cause: dmFkZTFnlXZfO2gp9WbSXdme+PtQ9aSQJLPuljdqFlveWBT3/iSYGVhSSckOg+9pOXFsvY
    Jdg1Q+PZxW1c8NdD7TXyXp3EA9ysGqUgSlPvy3RLYaYOQqCIkYbonW/O6FCCFT/45EeQo9
    es7SRGd/2P8uVTHuMDYjnLDtF1X/2u5uAnuwSqEVh2B4t+jfiGZpT4EvBRyrB7d6YuXmJW
    VMfCfjGX0dKd3jKb8SK+O0Lv/eB+yydgPVO/yyaa2PoIy0cujHFY8dHeJfj8CoR6z8vkDW
    NsAi/LmPUvjftS8+aJoGnKGW0dDOrnI2pDO9DxIV294IkIC/NNWfii0bmIQOuOCYXV+QY8
    dezNC6eigeLfYknq3s+E2CjeXt6yYO6/r78B9ifUtrX9OIfN0/EeJ6dQ6wh4vAAuEnfCg0
    yWRlkfWefOFXrrQZ8ODdhZoL7sllo3vMBPJNnwLWlD+RPdKvTYVK+uoXb59pp+C3Rw4Y0Z
    /oDO+JlI/CKMy1qEZtCQ6M7HHY7s9OsT1QXtBqmpTQ2AuwcEXWelkaD0xB9zj9ZHZ9Ktfr
    FMKa1w0IFahjezjjEkgy0dFBMfSQYkP7D0DTNwjKlZbfNfRmzirZPDJVElGaEuyJbcSTkC
    3CgKEZFzYXySejxQSpRVwbPdShjCav0lnUMHH9xbNErUlte6wXwr7x0uzfTA
X-ME-Proxy: <xmx:BhyEaq7_wQWWRUcRdbqXCYNtJfN0i1zN5Fs6eMjUH4YBG6fYXbJrbw>
    <xmx:BhyEatjjTDMnrvBtzm_CWu1yTb-Ix4ZBScgnxtBdgt1Kg8bdbmqkOw>
    <xmx:BhyEapcKY_mLolYqg_4U7XC7ZjF0KwUCpp7H-L9bkZ-qGvJNuIn2MQ>
    <xmx:BhyEaqc0YRQOFce49vXcyxsL8q4MqlC1mMTj9zeBoIGAa27iA_SQjA>
    <xmx:BhyEanwgT3-WQ35tmJz6un1-PaFjMisnR4wJe_WWztUpIBsj1pPk-Yzc>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Aug 2026 04:47:02 -0400 (EDT)
Message-ID: <501364c2da036830fd46896e7f8997e16d2848d2.camel@pbarker.dev>
Subject: Re: [PATCH] initramfs-framework: add opt-in root-only udev trigger
From: Paul Barker <paul@pbarker.dev>
To: Wenwen Fu <wenwfu@qti.qualcomm.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2026 09:47:01 +0100
In-Reply-To: <20260812092842.2060157-1-wenwfu@qti.qualcomm.com>
References: <20260812092842.2060157-1-wenwfu@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 08:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243671

Hi,

Thanks for the patch, I have a couple of feedback comments.

On Wed, 2026-08-12 at 17:28 +0800, Wenwen Fu wrote:
> The initramfs udev module replays add events for the complete device tree
> and waits for every resulting event. An initramfs that only mounts a root
> partition does not need to coldplug unrelated devices.
>=20
> Add an opt-in initramfs.udev-root-only kernel parameter. When root uses
> PARTLABEL or PARTUUID, trigger only the matching block device. For
> PARTLABEL roots, match the PARTNAME property exposed by udev. Keep the
> existing full trigger as the default so current users and other initramfs
> modules retain their existing behaviour.
>=20
> If the requested root cannot be matched safely, or a targeted trigger
> fails, fall back to the original full coldplug.

This explains the mechanism, but not why we would want the option to
avoid the current behaviour. Does the current behaviour cause problems,
is it too slow, etc?

>=20
> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---
>  .../initrdscripts/initramfs-framework/udev    | 30 ++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/m=
eta/recipes-core/initrdscripts/initramfs-framework/udev
> index 4898b89246..7fa26ef807 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
> @@ -35,6 +35,29 @@ udev_enabled() {
>  	return 0
>  }
> =20
> +udev_trigger_root_device() {
> +	case "${bootparam_root:-}" in
> +		PARTLABEL=3D?*)
> +			root_match=3D"PARTNAME=3D${bootparam_root#PARTLABEL=3D}"
> +			;;
> +		PARTUUID=3D?*)
> +			root_match=3D"PARTUUID=3D${bootparam_root#PARTUUID=3D}"
> +			;;
> +		*)
> +			return 1
> +			;;
> +	esac
> +
> +	root_devices=3D$(udevadm trigger --dry-run --verbose \
> +		--subsystem-match=3Dblock "--property-match=3D$root_match") || return =
1
> +
> +	# udevadm succeeds even when no devices match, so check its dry-run out=
put.
> +	[ -n "$root_devices" ] || return 1
> +
> +	udevadm trigger --subsystem-match=3Dblock \
> +		"--property-match=3D$root_match" --action=3Dadd

The commit message says that there is a fallback to the original full
coldplug if the targeted trigger fails, but the return status of this
command is ignored.

> +}
> +
>  udev_run() {
>  	add_module_pre_hook "udev_shutdown_hook_handler"
> =20
> @@ -45,6 +68,11 @@ udev_run() {
>  	sh -c "exec 4< /dev/console" || { exec 0> /dev/null; exec 1> /dev/null;=
 exec 2> /dev/null; }
> =20
>  	$_UDEV_DAEMON --daemon
> -	udevadm trigger --action=3Dadd
> +	if [ "${bootparam_initramfs_udev_root_only:-}" =3D "1" ] &&

I don't think this enabling condition isn't explained clearly in the
commit message.

> +	   udev_trigger_root_device; then
> +		debug "Triggered udev for root partition only"
> +	else
> +		udevadm trigger --action=3Dadd
> +	fi
>  	udevadm settle
>  }

Best regards,

--=20
Paul Barker


