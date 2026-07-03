Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FB0C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 14:05:22 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93935.1783087515420160760
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 07:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fl64SvKG;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47488efcf30so408682f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 07:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783087513; x=1783692313; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoD6Y+edj+FdPa+Y5gSoSVgxwUjdrMfGApP0phIgeXI=;
        b=fl64SvKGjF1LwltEtFxnCu2RaRWrpsPmLHB7Yh4bT2Od6ytYMWsUsnCZh79XuiQnsU
         oXN4eFACqH09aaZu8OEyE7u9JzJfYolHKAfa/SM8Gj+77JJMr+wCenAXVRLd3R5chl1p
         tQBv++k/FHJ0T2L2+Bhp53mX3pd42JJWSDaL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783087513; x=1783692313;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zoD6Y+edj+FdPa+Y5gSoSVgxwUjdrMfGApP0phIgeXI=;
        b=XJCrgqqJryiHGF/wvNyX9OHeLAyXpj2ZfQN89tGIIEnNwG2ZAPcp0bTdXbrrQKjrh/
         UDz4Q3QZiFF+0o6kIYU7LzMKxl26bDKp6AcSexAntwu/w7y7TR9x2gumsEE4+Dxc0zGN
         DEXXgHtbOw76zyNQ9BBSlujN0mGo8fuav5nfUkw/pafmDPpmCKzTIbFZvtXfbaojvNI1
         sSN8YO+cWO/GOQLQLzKSDg2yZAgM00dkrVl9A9UdEjV8L4S5wBSdWrgwDS6TLxgBuFoo
         E1jJ28ClnsXbCoXoHSsvVDxt6xYb4ICVlAJMVH0HXnlNYXYgmZmeJNwoZRshJhv/EAVG
         vQew==
X-Forwarded-Encrypted: i=1; AHgh+RopF9TijmNSnGOzwawZrmUzdZA1bJxkGonqxO0CO4BBfGmhWRaL8pqHVg1aDlGbyufmZhVKCDVWqqwgbA62pjiO4g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKQrdAQoLT9xr83j0Y7OXQeLosILRX0G8V7VnS5MY4RhBHiXWf
	ZoC0dHfOdd/TU2B+piCumuJOnVEXIftFs6izDyB5t2zYwA8/qh9gbsS0tJKcg/2JauU=
X-Gm-Gg: AfdE7ck9Qie3QZKTriq5nOAL21QyWUYBbeP4zJGbCUV7CvdFOeXr82CFJ8YD4dVRasO
	i7LQGsVhchgrit04v/DpUIBoZpYXD/kGhDSZoH71rP/9u+XH+WQTwHACt71gpZl+fIfMEwumKz2
	9PlNfeShOlzGQ1H+Qchkf1afsVA36ehODeWkL1oLgMKbosPqc+EjPqYBgHD+SP2ORdLAKnA+Sj3
	boO3QzVPkr4SXZFWG3k3fCTTbMWi6RV/m2IhpxRek3350m50kdz4sNNhCo60JmgdiTWW4PG189q
	JBw+m95Pmih1o+nE+iJEeoOf+OOkC1I52iUDbse/39oIigLcqbA94GY9lidRf7SPg6RtbPTBud6
	ZGJ/IzaYPjLao0KQktKY2Fmb7/9xhqmY8E7wjG2M/Z24A9YdQECbJ3wlVE8am4BDx7lr61JAqzc
	Li7ouEKLCxhgsxA1WZJeQrFCO/xqNLOjzkdPnurrm9p9sw+4gV9T4SpQ0QtnCcYF5wMcFHarprq
	KW51g==
X-Received: by 2002:a05:6000:2589:b0:475:f0f0:9eee with SMTP id ffacd0b85a97d-4775b1769a8mr15962008f8f.51.1783087513526;
        Fri, 03 Jul 2026 07:05:13 -0700 (PDT)
Received: from localhost (2a01cb001331aa0075403fb2c9c4e210.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:7540:3fb2:c9c4:e210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c9b5sm19858321f8f.20.2026.07.03.07.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 07:05:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 16:05:12 +0200
Message-Id: <DJOZRR1VTCJW.2SE2Y5O7ORO5Y@smile.fr>
Cc: <jinwang.li@oss.qualcomm.com>, <xiuzhuo.shang@oss.qualcomm.com>,
 <mengshi.wu@oss.qualcomm.com>, <cheng.jiang@oss.qualcomm.com>,
 <quic_chezhou@quicinc.com>, <shuai.zhang@oss.qualcomm.com>
To: "Wei Deng" <wei.deng@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH 2/4] bluez5: Fix sending extra bytes with
 MGMT_OP_ADD_EXT_ADV_DATA
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260626093920.1079859-1-wei.deng@oss.qualcomm.com>
 <20260626093920.1079859-2-wei.deng@oss.qualcomm.com>
In-Reply-To: <20260626093920.1079859-2-wei.deng@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 14:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240112

On Fri Jun 26, 2026 at 11:39 AM CEST, Wei Deng wrote:
> From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
>
> MGMT_OP_ADD_EXT_ADV_DATA expects the command to be of struct mgmt_cp_add_=
ext_adv_data not mgmt_cp_add_advertising.
>
> Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  ...sending-extra-bytes-with-MGMT_OP_ADD.patch | 33 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-advertis=
ing-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index c09a759244e..1600107b878 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -72,6 +72,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
>             file://0001-tools-Work-around-broken-stdin-handling-in-home-m=
ade.patch \
>             file://0001-gatt-client-Fix-use-after-free-caused-by-reentran=
t-c.patch \
>             file://0001-transport-Fix-set-volume-failure-with-invalid-dev=
ice.patch \
> +           file://0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_=
ADD.patch \
>             "
>  S =3D "${UNPACKDIR}/bluez-${PV}"
> =20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix=
-sending-extra-bytes-with-MGMT_OP_ADD.patch b/meta/recipes-connectivity/blu=
ez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch
> new file mode 100644
> index 00000000000..0a737413679
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sendin=
g-extra-bytes-with-MGMT_OP_ADD.patch
> @@ -0,0 +1,33 @@
> +From b16441fbb7a24325f7c7d0c5ecedc88b46ddd439 Mon Sep 17 00:00:00 2001
> +From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
> +Date: Thu, 4 Jun 2026 17:32:27 +0800
> +Subject: [PATCH] advertising: Fix sending extra bytes with
> + MGMT_OP_ADD_EXT_ADV_DATA
> +
> +MGMT_OP_ADD_EXT_ADV_DATA expects the command to be of size of
> +struct mgmt_cp_add_ext_adv_data not mgmt_cp_add_advertising.
> +
> +Upstream-Status: Backport [2a6968b40378dca5650e18e03ad0407738c47be5]

Hello,

For next patches, please provide a full URL when possible, that is way
easier to check.
In that case: https://github.com/bluez/bluez/commit/2a6968b40378dca5650e18e=
03ad0407738c47be5

That said, I'll proceed with the series.

Thanks!

> +Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> +Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
> +---
> + src/advertising.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/src/advertising.c b/src/advertising.c
> +index 8970e65f7..0cb37d4ae 100644
> +--- a/src/advertising.c
> ++++ b/src/advertising.c
> +@@ -1487,8 +1487,7 @@ static void add_adv_params_callback(uint8_t status=
, uint16_t length,
> + 		}
> + 	}
> +=20
> +-	param_len =3D sizeof(struct mgmt_cp_add_advertising) + adv_data_len +
> +-							scan_rsp_len;
> ++	param_len =3D sizeof(*cp) + adv_data_len + scan_rsp_len;
> +=20
> + 	cp =3D malloc0(param_len);
> + 	if (!cp) {
> +--=20
> +2.43.0
> +


--=20
Yoann Congal
Smile ECS


