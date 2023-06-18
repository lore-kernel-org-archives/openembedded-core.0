Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B300EB64D7
	for <webhook@archiver.kernel.org>; Sun, 18 Jun 2023 09:37:29 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.2880.1687081046679765356
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 02:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=llyYvG7g;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687081045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DnkN2aSE9zZjh/224xfQmFT3WWI6F58V/LYaYAh7qGM=;
	b=llyYvG7gqePC5lxBuhqiKTOrYDcJkBoUwIteNB8RKvxQfi+FY3P7KMK3Ciy0hMAqf/2dAz
	WDhmFjsuCVCwpLRlTW5ckSEQ9zQbJGfpmo1FpSHTjj7bIhegpjdiirs/RzTMgRAZzfka11
	NN/1EpcJFGXrF+cl0sgKtit0VpNpmV2wxk0r/aaA07SlSCxQyLe3bdDRhEUyxBN9v1GLig
	u6nl4e5q5BWSl8/uobzrb4m+f1w2sQpu8yoqpvXamBIQVg5tsAl/ekDx5A2gn6EEq0Dk+X
	X5iGNSsITkV2pdTOYCy0kLXXbyDCHsekJPaaqjDTjg9K8Xswaq6L/wPj/FGVNA==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 705C860007;
	Sun, 18 Jun 2023 09:37:24 +0000 (UTC)
Date: Sun, 18 Jun 2023 11:37:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Louis Rannou <lrannou@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com
Subject: Re: [OE-core] [PATCH 3/3] base-passwd: add the wheel group
Message-ID: <20230618093724c7508d8b@mail.local>
References: <20230613-sysusersd-v1-0-eaddf3179773@baylibre.com>
 <20230613-sysusersd-v1-3-eaddf3179773@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613-sysusersd-v1-3-eaddf3179773@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 09:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183058

On 15/06/2023 13:43:55+0200, Louis Rannou wrote:
> The wheel group is not declared while it can be used to access the systemd
> journal and to configure printers in CUPS. It can also be used for su and sudo
> permissions.
> 
> So far it was created later in the rootfs postcommand systemd_create_users.
> 
> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> ---
>  .../base-passwd/0007-Add-wheel-group.patch           | 20 ++++++++++++++++++++
>  meta/recipes-core/base-passwd/base-passwd_3.6.1.bb   |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
> new file mode 100644
> index 0000000000..00eaec38a2
> --- /dev/null
> +++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
> @@ -0,0 +1,20 @@
> +
> +We need to have a wheel group which has some system privileges to consult the
> +systemd journal or manage printers with cups.
> +
> +Upstream status says the group does not exist by default.

This should be rephrased because it causes:

Malformed Upstream-Status 'Upstream status' (meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch)
Unknown Upstream-Status value 'says' (meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch)
Patches missing Upstream-Status: 0 (0%)
Patches with malformed Upstream-Status: 1 (0%)


> +
> +Upstream-Status: Inappropriate [enable feature]
> +
> +Signed-off-by: Louis Rannou <lrannou@baylibre.com>
> +Index: base-passwd-3.5.26/group.master
> +===================================================================
> +--- base-passwd-3.5.29.orig/group.master
> ++++ base-passwd-3.5.29/group.master
> +@@ -38,5 +38,6 @@
> + staff:*:50:
> + games:*:60:
> + shutdown:*:70:
> ++wheel:*:80:
> + users:*:100:
> + nogroup:*:65534:
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
> index 853717176d..204016b3e7 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
> @@ -12,6 +12,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
>             file://0004-Add-an-input-group-for-the-dev-input-devices.patch \
>             file://0005-Add-kvm-group.patch \
>             file://0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch \
> +           file://0007-Add-wheel-group.patch \
>             "
>  
>  SRC_URI[sha256sum] = "6ff369be59d586ba63c0c5fcb00f75f9953fe49db88bc6c6428f2c92866f79af"
> 
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182849): https://lists.openembedded.org/g/openembedded-core/message/182849
> Mute This Topic: https://lists.openembedded.org/mt/99546759/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

