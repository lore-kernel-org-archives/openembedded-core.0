Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87547C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 16:44:05 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.45293.1655829840637419145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 09:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TB8kGlxw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id q15so7815825wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=tmnOHnAjdcUasy39ICpp0xYICuDXSphIe82Uu4bkrKU=;
        b=TB8kGlxwbdQ5NqBxsyv8r8ydjo4R2GrIbb/j2+SZI5qMTluFFveMYzH+pXjbtkV3f5
         HzCdJdUdVCmf8Capmclvbm/gz1D0tIoRCuDl/hHT6a0K9+OCTv2fWRgyqBksykumVlPD
         ageoiD1AiCl6PMJVIw0gxWwtlWTUwyCDUYhS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=tmnOHnAjdcUasy39ICpp0xYICuDXSphIe82Uu4bkrKU=;
        b=sfL3/nEn6IAqa3UYts9tjYSay6PCOv6aIthodNS6w+AgAuaLz7ksoxQJ/jg/sOFY4a
         GyT8AEiFjvOMMCpCviqAQynUe7/3Rf4K2XtyKdlwuoBsYsApIGjAj2fCjkF6SaNhLz5w
         pDOnzwEfxg9/P7xHROBHx4rZXsQsKOHvLOYoRAZB13ewuDfBs37UnfXXrOk/BADM9Usk
         SlgVRtHzMZWKo8ai9oisgPZjPX5InG9FnSw6wWFe8fvs50RnRFUaEfCRZwpbQE42mxyT
         OTxIw+pMKB4/XI2mf8Vjk4O6f4gBTpKA6ZIAZwYZpVRqV20vB10OOZn0l6XTHSFXbTmr
         11iA==
X-Gm-Message-State: AJIora9wffRMFzmNBon+/GcUZKNeP6QeYRGh1Z7wZnT32eMjnRlI1Gqa
	XfZCO8AyT/4F3HokWhT0IRN3pw==
X-Google-Smtp-Source: 
 AGRyM1sLONeDOFLfu5X5c27u+uFMqo2xYq4z8s4bTlbcIbtpbJMRjx0djgkeVWYvDXrovvygfA0Lcg==
X-Received: by 2002:a05:600c:3d0e:b0:39e:fb96:7f21 with SMTP id
 bh14-20020a05600c3d0e00b0039efb967f21mr17061437wmb.133.1655829838981;
        Tue, 21 Jun 2022 09:43:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:47af:4062:8031:47d4?
 ([2001:8b0:aba:5f3c:47af:4062:8031:47d4])
        by smtp.gmail.com with ESMTPSA id
 co13-20020a0560000a0d00b0021b8bb97a47sm8491156wrb.50.2022.06.21.09.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 09:43:58 -0700 (PDT)
Message-ID: 
 <bc38ae69ab2d486042a38d00abbf3dd559639e13.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] connman: implement network interface
 management techniques
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Muhammad Hamza <Muhammad_Hamza@mentor.com>,
	openembedded-core@lists.openembedded.org
Cc: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
Date: Tue, 21 Jun 2022 17:43:57 +0100
In-Reply-To: <20220621140045.3318362-1-muhammad_hamza@mentor.com>
References: <20220621140045.3318362-1-muhammad_hamza@mentor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 16:44:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167166

On Tue, 2022-06-21 at 19:00 +0500, Muhammad Hamza wrote:
> This is required to obtain a managed network interface before connman
> tries to call cleanup_devices function, this will let connman
> create new routing table without bringing down the ethernet interface.
>=20
> Signed-off-by: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
> Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
> ---
>  ...t-network-interface-management-techn.patch | 31 +++++++++++++++++++
>  .../connman/connman_1.41.bb                   |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-connectivity/connman/connman/0001-connma=
n-implement-network-interface-management-techn.patch
>=20
> diff --git a/meta/recipes-connectivity/connman/connman/0001-connman-imple=
ment-network-interface-management-techn.patch b/meta/recipes-connectivity/c=
onnman/connman/0001-connman-implement-network-interface-management-techn.pa=
tch
> new file mode 100644
> index 0000000000..06695ea566
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/0001-connman-implement-ne=
twork-interface-management-techn.patch
> @@ -0,0 +1,31 @@
> +From e6dedb531096f29825bddaf428ca8d3c4ad1df26 Mon Sep 17 00:00:00 2001
> +From: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
> +Date: Tue, 1 Jul 2014 23:47:15 +0530
> +Subject: [PATCH] connman: implement network interface management techniq=
ues
> +
> +This is required to obtain a managed network interface before connman
> +tries to call cleanup_devices function, this will let connman
> +create new routing table without bringing down the ethernet interface.
> +
> +Signed-off-by: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
> +
> +---
> + src/connman.service.in | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/connman.service.in b/src/connman.service.in
> +index 79e75d6..0e7275a 100644
> +--- a/src/connman.service.in
> ++++ b/src/connman.service.in
> +@@ -12,7 +12,10 @@ Conflicts=3Dsystemd-resolved.service
> + Type=3Ddbus
> + BusName=3Dnet.connman
> + Restart=3Don-failure
> +-ExecStart=3D@sbindir@/connmand -n
> ++EnvironmentFile=3D-/tmp/connman.env
> ++ExecStartPre=3D/bin/sh -c "if grep 'nfsroot\|ip=3D' /proc/cmdline; then=
 ETH_IFACE=3D$(ip addr | grep 'eth[0-9]:' | grep 'UP' | sed -e 's,\(eth[0-9=
]\)\(.*\),\1,' -e 's,^.*: ,,' ); NET_ADDR=3D$(cat /proc/cmdline | sed -ne '=
s/^.*ip=3D\([^ :]*\).*$/\1/p'); echo -e 'OPT=3D-I '$ETH_IFACE'\nOPT2=3D'$ET=
H_IFACE'\nNET_ADDR=3D'$NET_ADDR' ' > /tmp/connman.env; fi "
> ++ExecStart=3D/bin/sh -c "if [ \"$NET_ADDR\" =3D \"off\" ] || [ \"$NET_AD=
DR\" =3D \"none\" ]; then /usr/sbin/connmand -n; else /usr/sbin/connmand -n=
 $OPT; fi"
> ++ExecStartPost=3D/bin/sh -c "if [ ! -z \"$OPT\" ] && [ \"$NET_ADDR\" =3D=
 \"dhcp\" ]; then /sbin/udhcpc -i $OPT2; fi"
> + StandardOutput=3Dnull
> + CapabilityBoundingSet=3DCAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_NET_RAW =
CAP_SYS_TIME CAP_SYS_MODULE CAP_SYS_ADMIN
> + ProtectHome=3Dtrue
> diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/rec=
ipes-connectivity/connman/connman_1.41.bb
> index 736b78eaeb..9c09a71f46 100644
> --- a/meta/recipes-connectivity/connman/connman_1.41.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.41.bb
> @@ -5,6 +5,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/${B=
P}.tar.xz \
>             file://0001-connman.service-stop-systemd-resolved-when-we-use=
-co.patch \
>             file://connman \
>             file://no-version-scripts.patch \
> +           file://0001-connman-implement-network-interface-management-te=
chn.patch \
>             "
> =20
>  SRC_URI:append:libc-musl =3D " file://0002-resolve-musl-does-not-impleme=
nt-res_ninit.patch"

This definitely needs upstream discussion.

I'd love to understand if this is causing some of our intermittent
issues on the autobuilder around connectivity but the description
included here doesn't really let me do that either. Is there any more
information on this anywhere?

Cheers,

Richard





