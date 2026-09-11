Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F116DC88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 18:56:57 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46949.1789153013913715455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 11:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Wopcpzo4;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482e067e908so883335f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 11:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789153012; x=1789757812; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7fQ+T+tklYB9dWGDc4oy47qFCou7AmvHShHLLzrXvA=;
        b=Wopcpzo4u+JYzOBFA1/w1nQni9vMKtquzBcnHsHK2zY6STeLbEqhWbfOIaxHM6CMMV
         8S7gBHG0U8RzUXc51AeL1Ef0pdKcC+i+vbItE1yVcHeMDQzLwraxajKkmhWG0B2Ylo8b
         ZE0bXoD6Vvbd9oFUfy49++8WxfPMIXzosPGpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153012; x=1789757812;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7fQ+T+tklYB9dWGDc4oy47qFCou7AmvHShHLLzrXvA=;
        b=qOgL7Iq0lS8odWvnYEXWzkgJF8Y12SYXhoWUKv1324r2JtF9LkJIKokWLFbMFKJlAi
         WTCJtVt0eBB5MKhPqxy1ki2/IBQnNrjFnESlWGjCVzajFwjpLBljBX0cc4G90TIqMcPe
         yoEosRgKALwjwQ6UP+DV0to3MN5j9jiBoz61JtBYxQ3bpr3l7lF7NuLKyEEI3eK35oRu
         lACRm8xtCOQeqR5QWFO0CIzTjFj/cRvosScg8gbVTCvaxFgoWXZbGrBRtZ6MjRPHBm8N
         f6LmIoge29FslWW8RskVBHITJpsMC5pyvpmmPiGmU9vLjYVm9jBjpCsdfcSZx/UFMdiQ
         i4Cg==
X-Forwarded-Encrypted: i=1; AKwUvBwSld0KGuqn6lA56iEKNh4GJvq2VjKDDhqYZ62vj/o1KoAxJSBSY22wkrZx0zRqacMra1zjv4sZE4ULX20ipRBt5g==@lists.openembedded.org
X-Gm-Message-State: AFuF++mABMi/49Wubu9T92faoURetQAPjJEf46W4Q1uc/RT6Shb1Mm47
	lHD4JJpCcTSrVv19l2iE7s/+IyX1hewh+vSywISv6yYEMXBjEMgD2NzvBr6pmJ3voPA=
X-Gm-Gg: AYBFou2/A92kmrxgzMDQ2BJm6a6qHMEzpR7TzX25FsEH09jy7yvZOxObJHPSEq4SSGw
	5EHvLzGKHd85cVjPUUbqZPThJ09sJv0JxqUWt4zeTzcnw4wNIio9Up9ui5GuyWBXl4Wc9NHoGc5
	sA0hoFAyx9AvsHbh/oFQidSwX0kR9EQLZjrD3w6hNeQeNen6Lloog42aJbBpZlSIak24l024Vej
	bxjbhfV6JKjLXDxV6Bo2ifVU6OLat6O0aKl5jVA1TN5QJTj5I61ok1n/0jCC4YxxWqxaP9jEF/v
	/MCdwkZcfupYqM8vXcvjgb12kGeAYlUlsHJ+ax7H58+3LoBpU9dlUH6sMOGl63Hc+Tmp1lJHRf9
	YvkkCe5nlzsJUBN3DTZYgBWtaJABHSvIycJ9b5VK2nu33fwxVaj89ia/CSuW8bN8E1mBkcG0S1K
	3i9aoP7kHmkoHm/uVPVNS7Uk9TAuC6sN0oO/sU8ppcvLlNLpfe6tnlnfMiqJ05x1vpMMx1jbl6q
	tRNXB6NsOjwYkkXjc/r3HCm4tACgblrLyKZT76QKEyQZKEk4XNLkhc29TTYfak=
X-Received: by 2002:a05:6000:178f:b0:485:9b35:a20e with SMTP id ffacd0b85a97d-486eb36cf54mr6383659f8f.56.1789153011958;
        Fri, 11 Sep 2026 11:56:51 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm7884781f8f.32.2026.09.11.11.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 11:56:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 20:56:51 +0200
Message-Id: <DLCPT6JMUAFL.3O5FRF4W086BP@smile.fr>
To: <wenwfu@qti.qualcomm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] initramfs-framework: avoid processes when
 parsing cmdline
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260911151416.1946900-1-wenwfu@qti.qualcomm.com>
In-Reply-To: <20260911151416.1946900-1-wenwfu@qti.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 18:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245664

On Fri Sep 11, 2026 at 5:14 PM CEST, Wenwen Fu via lists.openembedded.org w=
rote:
> Use shell parameter expansion rather than external cut and sed commands
> while parsing kernel command-line parameters in the initramfs.
>
> On the target initramfs, 100 command-line parser runs took 13.48 s
> before this change and 0.51 s afterwards. This reduces the per-run
> cost from 134.8 ms to 5.1 ms.
>
> Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
> ---
>  meta/recipes-core/initrdscripts/initramfs-framework/init | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/m=
eta/recipes-core/initrdscripts/initramfs-framework/init
> index 67590ad765..62d8ccfd0c 100755
> --- a/meta/recipes-core/initrdscripts/initramfs-framework/init
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
> @@ -104,13 +104,14 @@ for p in `cat /proc/cmdline`; do
>  		continue
>  	fi
> =20
> -	opt=3D`echo $p | cut -d'=3D' -f1`
> -	opt=3D`echo $opt | sed -e 'y/.-/__/'`
> -	if [ "`echo $p | cut -d'=3D' -f1`" =3D "$p" ]; then
> +	key=3D${p%%=3D*}
> +	opt=3D${key//./_}

Hello,

Isn't this only available in busybox if and only if it was compiled
with CONFIG_ASH_BASH_COMPAT? Can you check if that works with more
minimal busybox?

> +	opt=3D${opt//-/_}
> +	if [ "$key" =3D "$p" ]; then
>  		# opt parameter
>  		eval "bootparam_${opt}=3Dtrue"
>  	else
> -		value=3D"`echo $p | cut -d'=3D' -f2-`"	# Option value
> +		value=3D${p#*=3D}	# Option value
>  		value_lstripped=3D${value#\"}
>  		value_rstripped=3D${value%\"}
> =20

Regards,
--=20
Yoann Congal
Smile ECS


