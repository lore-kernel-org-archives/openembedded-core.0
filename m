Return-Path: <rehn.andreas86@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBF5C001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 12:41:04 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web10.19176.1690288853708274995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 05:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CPTMzwRu;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: rehn.andreas86@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-79414715edeso1456701241.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 05:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690288852; x=1690893652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f4ESGzfzqXQ+lsS1+eds7gjk85bN5Es0z4hvyTmvhWU=;
        b=CPTMzwRu97qZzluW8S+kJ6tDryH0s3LC1Jpr+YEy2VK02cCInm6/uDhjMPyd1tHuSL
         Z6Mk8Are/sMEUMO5m0sSBBN+b/RLjXYvJXagtrULGOlkSB2s/EHAv+AZxhbSYhY17tjs
         962Viw8AK4IzSiFM6eNzXROmu+IAEsPCP2BSpfxOil/b/aRtQ39eZR7sMnVDSwxrezl1
         3to6xKhblLsyMRJcMio3Q1z9rVejKODK6UN9eO7rkfMc0b8ySp9Nxrqvt9SsaBAnHjFY
         lZ7aaOC3yjD08w9603iMS2AZWr5LjZBUwgDuwksPwThQpIqIq0b/Ce2Aq4TzS+XmXvJx
         e0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690288852; x=1690893652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4ESGzfzqXQ+lsS1+eds7gjk85bN5Es0z4hvyTmvhWU=;
        b=g4RMUA1F6yYLBA8B+J9nkBVxo6w3imVWaJ0W3cy+PqQiZOvSjnXdMS8NvfOyRFla32
         fQ0BaKlgp1AmNK0D87tllImP7e+Z3SwlAybJVqYsz89qTdfeskqP9ii5VrUK1hqOuqU5
         IIxrswofFKE1jeb1CQhMv+hb+VcXhu3V5/2zgaH27vvM6LtNU+XWgc/MLFulX4pVLR0w
         6Nat17w4Bk6GNPLBmBF9LOu+wh1XnI90ttQStdYAtNTxFN5Gk+/JoMrSq0vglIl9RvK/
         rQwsSgpDJ4djXImkCJVpGf8vXJVhox529+4bcCNzcYGeqc4bhPsw1bLFRsXkXCkGj+9U
         giPA==
X-Gm-Message-State: ABy/qLbPK3ofIJBGkXRaYf86/XGYeqqsNxWwoV9+swlbdfp5tbZOeBVe
	sF8IQ2C3IwFo7SZzmPYsvGsZI5jIyeNwEL1518Vdl1TLOKw=
X-Google-Smtp-Source: APBJJlEuAq/4932OxzuHUE1MTrX9X0hRqytZdpv/VBQMw8aGz3W4i4RCFoh3qOBlQXUaG9+tb2zP3xh/zaTEOe2XpqE=
X-Received: by 2002:a05:6102:250:b0:446:e878:f24 with SMTP id
 a16-20020a056102025000b00446e8780f24mr2848343vsq.14.1690288851836; Tue, 25
 Jul 2023 05:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <7JrI.1690277290613913360.PhKO@lists.openembedded.org>
 <CANNYZj_tCWzW84+yVSRXECpodY=XetmNXzVbMgwcQR5Cn-zORA@mail.gmail.com>
 <CAPmT5DeEKag1p7kebruEyVH2T0nFKxEXw9GOHTSvwKvajf5Lmg@mail.gmail.com> <CA+chaQdGrht-VJORDvwL=QNEmXx5Q7aZqoEPN2vAiTM1DOZJyA@mail.gmail.com>
In-Reply-To: <CA+chaQdGrht-VJORDvwL=QNEmXx5Q7aZqoEPN2vAiTM1DOZJyA@mail.gmail.com>
From: Andreas Rehn <rehn.andreas86@gmail.com>
Date: Tue, 25 Jul 2023 14:40:40 +0200
Message-ID: <CAPmT5Dd6+C=c-yhBMAV-b8=7N8_+qtRg1gN1eTkS7apwzPnQUA@mail.gmail.com>
Subject: Re: [OE-core] dunfell: poky 3.1.27 - full linux-firmware always in image
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000094e35206014f0a82"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 12:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184840

--00000000000094e35206014f0a82
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

before:
"linux-firmware-mt7601u" -> "linux-firmware-mt7601u-license"
"linux-firmware-ralink" -> "linux-firmware-ralink-license"
"linux-firmware-rtl8168" -> "linux-firmware-whence-license"
"linux-firmware-rtl8188" -> "linux-firmware-rtl-license"
"linux-firmware-rtl8192ce" -> "linux-firmware-rtl-license"
"linux-firmware-rtl8192cu" -> "linux-firmware-rtl-license"
"linux-firmware-rtl8192eu" -> "linux-firmware-rtl-license"
"linux-firmware-rtl8192su" -> "linux-firmware-rtl-license"
"linux-firmware-rtl8723" -> "linux-firmware-rtl-license"
"linux-firmware-rtl8821" -> "linux-firmware-rtl-license"

after:
"linux-firmware-adsp-sst" -> "linux-firmware"
"linux-firmware-adsp-sst" -> "linux-firmware-adsp-sst-license"
"linux-firmware-amlogic-vdec" -> "linux-firmware-amlogic-vdec-license"
"linux-firmware-ar3k" -> "linux-firmware-ar3k-license"
"linux-firmware-ar3k" -> "linux-firmware-atheros-license"
"linux-firmware-ar9170" -> "linux-firmware-atheros-license"
"linux-firmware-ath10k" -> "linux-firmware-ath10k-license"
"linux-firmware-ath11k" -> "linux-firmware-ath10k-license"
"linux-firmware-ath6k" -> "linux-firmware-atheros-license"
"linux-firmware-ath9k" -> "linux-firmware-atheros-license"
"linux-firmware-bcm-0bb4-0306" -> "linux-firmware-cypress-license"
"linux-firmware-bcm43143" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm43236b" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm43241b0" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm43241b4" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm43241b5" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm43242a" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4329-fullmac" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4329" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4330" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm43340" -> "linux-firmware-cypress-license"
"linux-firmware-bcm4334" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4335" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm43362" -> "linux-firmware-cypress-license"
"linux-firmware-bcm4339" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm43430a0" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm43430" -> "linux-firmware-cypress-license"
"linux-firmware-bcm43455" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4350c2" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4350" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4354" -> "linux-firmware-cypress-license"
"linux-firmware-bcm43569" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4356" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4356-pcie" -> "linux-firmware-cypress-license"
"linux-firmware-bcm43570" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4358" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm43602" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4366b" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4366c" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4371" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm4373" -> "linux-firmware"
"linux-firmware-bcm4373" -> "linux-firmware-cypress-license"
"linux-firmware-bcm43xx-hdr" -> "linux-firmware-broadcom-license"
"linux-firmware-bcm43xx" -> "linux-firmware-broadcom-license"
"linux-firmware-bnx2-mips" -> "linux-firmware-whence-license"
"linux-firmware-carl9170" -> "linux-firmware-gplv2-license"
"linux-firmware-i915" -> "linux-firmware-i915-license"
"linux-firmware-ibt-11-5" -> "linux-firmware-ibt-license"
"linux-firmware-ibt-12-16" -> "linux-firmware-ibt-license"
"linux-firmware-ibt-17" -> "linux-firmware-ibt-license"
"linux-firmware-ibt-20" -> "linux-firmware-ibt-license"
"linux-firmware-ibt-hw-37-7" -> "linux-firmware-ibt-license"
"linux-firmware-ibt" -> "linux-firmware-ibt-11-5" [style=3Ddotted]
"linux-firmware-ibt" -> "linux-firmware-ibt-12-16" [style=3Ddotted]
"linux-firmware-ibt" -> "linux-firmware-ibt-17" [style=3Ddotted]
"linux-firmware-ibt" -> "linux-firmware-ibt-20" [style=3Ddotted]
"linux-firmware-ibt" -> "linux-firmware-ibt-hw-37-7" [style=3Ddotted]
"linux-firmware-ibt" -> "linux-firmware-ibt-hw-37-8" [style=3Ddotted]
"linux-firmware-ibt" -> "linux-firmware-ibt-license" [style=3Ddotted]
"linux-firmware-ibt" -> "linux-firmware-ibt-misc" [style=3Ddotted]
"linux-firmware-ibt-misc" -> "linux-firmware-ibt-license"
"linux-firmware-ice" -> "linux-firmware-ice-license"
"linux-firmware-imx-sdma-imx6q" -> "linux-firmware-imx-sdma-license"
"linux-firmware-imx-sdma-imx7d" -> "linux-firmware-imx-sdma-license"
"linux-firmware-iwlwifi-135-6" -> "linux-firmware-iwlwifi-license"
"linux-firmware-iwlwifi-3160-17" -> "linux-firmware-iwlwifi-license"
"linux-firmware-iwlwifi-6000-4" -> "linux-firmware-iwlwifi-license"
"linux-firmware-iwlwifi-6000g2a-6" -> "linux-firmware-iwlwifi-license"
"linux-firmware-iwlwifi-6000g2b-6" -> "linux-firmware-iwlwifi-license"
"linux-firmware-iwlwifi-6050-5" -> "linux-firmware-iwlwifi-license"
"linux-firmware-iwlwifi-7260" -> "linux-firmware-iwlwifi-license"
"linux-firmware-iwlwifi-7265d" -> "linux-firmware-iwlwifi-license"
"linux-firmware-iwlwifi-7265" -> "linux-firmware-iwlwifi-license"
"linux-firmware-iwlwifi-8000c" -> "linux-firmware-iwlwifi-license"
"linux-firmware-iwlwifi-8265" -> "linux-firmware-iwlwifi-license"
"linux-firmware-iwlwifi-9000" -> "linux-firmware-iwlwifi-license"
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-135-6" [style=3Ddotted]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-10" [style=3Ddotte=
d]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-12" [style=3Ddotte=
d]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-13" [style=3Ddotte=
d]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-16" [style=3Ddotte=
d]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-17" [style=3Ddotte=
d]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-7" [style=3Ddotted=
]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-8" [style=3Ddotted=
]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-9" [style=3Ddotted=
]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000-4" [style=3Ddotted=
]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2a-5"
[style=3Ddotted]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2a-6"
[style=3Ddotted]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2b-5"
[style=3Ddotted]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2b-6"
[style=3Ddotted]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6050-4" [style=3Ddotted=
]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6050-5" [style=3Ddotted=
]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-7260" [style=3Ddotted]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-7265d" [style=3Ddotted]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-7265" [style=3Ddotted]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-8000c" [style=3Ddotted]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-8265" [style=3Ddotted]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-9000" [style=3Ddotted]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-license" [style=3Ddotte=
d]
"linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-misc" [style=3Ddotted]
"linux-firmware-iwlwifi-misc" -> "linux-firmware-iwlwifi-license"
"linux-firmware" -> "linux-firmware-adsp-sst-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-adsp-sst" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-amlogic-vdec-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-amlogic-vdec" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ar3k-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ar3k" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ar9170" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ath10k-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ath10k" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ath11k" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ath6k" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ath9k" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-atheros-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm-0bb4-0306"
"linux-firmware" -> "linux-firmware-bcm-0bb4-0306" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43143" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43236b" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43241b0" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43241b4" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43241b5" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43242a" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4329-fullmac" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4329" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4330" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43340" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4334" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4335" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43362" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4339" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43430a0" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43430" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43455" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4350c2" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4350" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4354" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43569" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4356-pcie" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4356" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43570" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4358" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43602" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4366b" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4366c" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4371" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm4373" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43xx-hdr" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bcm43xx" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-bnx2-mips" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-broadcom-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-carl9170" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-cypress-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-gplv2-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-i915-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-i915" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ibt-11-5" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ibt-12-16" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ibt-17" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ibt-20" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ibt-hw-37-7" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ibt-hw-37-8" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ibt-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ibt-misc" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ibt" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ice-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ice" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-imx-sdma-imx6q" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-imx-sdma-imx7d" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-imx-sdma-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-135-6" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-3160-10" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-3160-12" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-3160-13" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-3160-16" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-3160-17" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-3160-7" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-3160-8" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-3160-9" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-6000-4" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-6000g2a-5" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-6000g2a-6" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-6000g2b-5" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-6000g2b-6" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-6050-4" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-6050-5" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-7260" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-7265d" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-7265" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-8000c" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-8265" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-9000" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi-misc" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-iwlwifi" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-license"
"linux-firmware" -> "linux-firmware-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-liquidio" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-lontium-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-lt9611uxc" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-marvell-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-mt7601u-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-mt7601u" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-netronome-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-netronome" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-nvidia-gpu" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-nvidia-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-nvidia-tegra-k1" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-nvidia-tegra" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-pcie8897" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-pcie8997" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qat-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qat" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qca" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-adreno-a2xx" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-adreno-a3xx" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-adreno-a4xx" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-adreno-a530" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-adreno-a630" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-adreno-a650" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-adreno-a660" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-apq8096-audio" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-apq8096-modem" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno"
[style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio"
[style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compat"
[style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compute"
[style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors"
[style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-sdm845-audio" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-sdm845-compute" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-sdm845-modem" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-sm8250-audio" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-sm8250-compute" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-venus-1.8" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-venus-4.2" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-venus-5.2" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-venus-5.4" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-vpu-1.0" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-vpu-2.0" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-qcom-yamato-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-radeon-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-radeon" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ralink-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ralink" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-rs9113" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-rs9116" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-rtl8168" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-rtl8188" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-rtl8192ce" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-rtl8192cu" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-rtl8192eu"
"linux-firmware" -> "linux-firmware-rtl8192eu" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-rtl8192su" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-rtl8723" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-rtl8821" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-rtl-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-sd8686" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-sd8688" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-sd8787" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-sd8797" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-sd8801" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-sd8887" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-sd8897" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-sd8997" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-ti-connectivity-license" [style=3Ddotte=
d]
"linux-firmware" -> "linux-firmware-usb8997" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-vt6656-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-vt6656" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-whence-license"
"linux-firmware" -> "linux-firmware-whence-license" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-wl12xx" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-wl18xx" [style=3Ddotted]
"linux-firmware" -> "linux-firmware-wlcommon" [style=3Ddotted]
"linux-firmware-mt7601u" -> "linux-firmware"
"linux-firmware-mt7601u" -> "linux-firmware-mt7601u-license"
"linux-firmware-netronome" -> "linux-firmware-netronome-license"
"linux-firmware-nvidia-gpu" -> "linux-firmware-nvidia-license"
"linux-firmware-nvidia-tegra-k1" -> "linux-firmware-nvidia-license"
"linux-firmware-nvidia-tegra" -> "linux-firmware-nvidia-gpu"
"linux-firmware-nvidia-tegra" -> "linux-firmware-nvidia-license"
"linux-firmware-qat" -> "linux-firmware-qat-license"
"linux-firmware-qca" -> "linux-firmware-ath10k-license"
"linux-firmware-qcom-adreno-a2xx" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-adreno-a2xx" -> "linux-firmware-qcom-yamato-license"
"linux-firmware-qcom-adreno-a4xx" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-adreno-a530" -> "linux-firmware"
"linux-firmware-qcom-adreno-a530" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-adreno-a630" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-adreno-a650" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-adreno-a660" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-apq8096-audio" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-apq8096-modem" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno" ->
"linux-firmware-qcom-license"
"linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno" ->
"linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
"linux-firmware-qcom-sc8280xp-lenovo-x13s-audio" ->
"linux-firmware-qcom-license"
"linux-firmware-qcom-sc8280xp-lenovo-x13s-audio" ->
"linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
"linux-firmware-qcom-sc8280xp-lenovo-x13s-compute" ->
"linux-firmware-qcom-license"
"linux-firmware-qcom-sc8280xp-lenovo-x13s-compute" ->
"linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
"linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors" ->
"linux-firmware-qcom-license"
"linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors" ->
"linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
"linux-firmware-qcom-sdm845-audio" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-sdm845-compute" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-sdm845-modem" -> "linux-firmware-ath10k"
"linux-firmware-qcom-sdm845-modem" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-sm8250-audio" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-sm8250-compute" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-venus-1.8" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-venus-4.2" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-venus-5.2" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-venus-5.4" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-vpu-1.0" -> "linux-firmware-qcom-license"
"linux-firmware-qcom-vpu-2.0" -> "linux-firmware-qcom-license"
"linux-firmware-radeon" -> "linux-firmware-radeon-license"
"linux-firmware-ralink" -> "linux-firmware-ralink-license"
"linux-firmware-rs9113" -> "linux-firmware-whence-license"
"linux-firmware-rs9116" -> "linux-firmware-whence-license"
"linux-firmware-rtl8168" -> "linux-firmware-whence-license"
"linux-firmware-rtl8188" -> "linux-firmware-rtl-license"
"linux-firmware-rtl8192ce" -> "linux-firmware-rtl-license"
"linux-firmware-rtl8192cu" -> "linux-firmware-rtl-license"
"linux-firmware-rtl8192eu" -> "linux-firmware-rtl-license"
"linux-firmware-rtl8192su" -> "linux-firmware-rtl-license"
"linux-firmware-rtl8723" -> "linux-firmware-rtl-license"
"linux-firmware-rtl8821" -> "linux-firmware-rtl-license"
"linux-firmware-sd8686" -> "linux-firmware-marvell-license"
"linux-firmware-sd8688" -> "linux-firmware-marvell-license"
"linux-firmware-sd8787" -> "linux-firmware-marvell-license"
"linux-firmware-sd8797" -> "linux-firmware-marvell-license"
"linux-firmware-sd8801" -> "linux-firmware-marvell-license"
"linux-firmware-sd8887" -> "linux-firmware-marvell-license"
"linux-firmware-sd8897" -> "linux-firmware-marvell-license"
"linux-firmware-sd8997" -> "linux-firmware-marvell-license"
"linux-firmware-usb8997" -> "linux-firmware-marvell-license"
"linux-firmware-vt6656" -> "linux-firmware-vt6656-license"
"linux-firmware-wl12xx" -> "linux-firmware-ti-connectivity-license"
"linux-firmware-wl12xx" -> "linux-firmware-wlcommon"
"linux-firmware-wl18xx" -> "linux-firmware-ti-connectivity-license"
"linux-firmware-wl18xx" -> "linux-firmware-wlcommon"

Am Di., 25. Juli 2023 um 14:20 Uhr schrieb Martin Jansa <
martin.jansa@gmail.com>:

> now figure out what depends on linux-firmware from your image
>
> grep linux-firmware
> buildhistory/images/your-machine/your-libc/your-image/depends.dot
>
> and then git log will help you with the rest (FWIW: I don't see
> linux-firmware in our dunfell images).
>
> On Tue, Jul 25, 2023 at 2:01=E2=80=AFPM Andreas Rehn <rehn.andreas86@gmai=
l.com>
> wrote:
>
>> hey alex,
>> thx for have a look
>>
>> before
>>
>> linux-firmware-mt7601u-license
>> linux-firmware-mt7601u
>> linux-firmware-ralink-license
>> linux-firmware-ralink
>> linux-firmware-rtl8168
>> linux-firmware-rtl8188
>> linux-firmware-rtl8192ce
>> linux-firmware-rtl8192cu
>> linux-firmware-rtl8192eu
>> linux-firmware-rtl8192su
>> linux-firmware-rtl8723
>> linux-firmware-rtl8821
>> linux-firmware-rtl-license
>> linux-firmware-whence-license
>>
>> after
>>
>> libz1 aarch64 1.2.11-r0
>> linux-firmware all 1:20230515-r0
>> linux-firmware-adsp-sst all 1:20230515-r0
>> linux-firmware-adsp-sst-license all 1:20230515-r0
>> linux-firmware-amlogic-vdec all 1:20230515-r0
>> linux-firmware-amlogic-vdec-license all 1:20230515-r0
>> linux-firmware-ar3k all 1:20230515-r0
>> linux-firmware-ar3k-license all 1:20230515-r0
>> linux-firmware-ar9170 all 1:20230515-r0
>> linux-firmware-ath10k all 1:20230515-r0
>> linux-firmware-ath10k-license all 1:20230515-r0
>> linux-firmware-ath11k all 1:20230515-r0
>> linux-firmware-ath6k all 1:20230515-r0
>> linux-firmware-ath9k all 1:20230515-r0
>> linux-firmware-atheros-license all 1:20230515-r0
>> linux-firmware-bcm-0bb4-0306 all 1:20230515-r0
>> linux-firmware-bcm43143 all 1:20230515-r0
>> linux-firmware-bcm43236b all 1:20230515-r0
>> linux-firmware-bcm43241b0 all 1:20230515-r0
>> linux-firmware-bcm43241b4 all 1:20230515-r0
>> linux-firmware-bcm43241b5 all 1:20230515-r0
>> linux-firmware-bcm43242a all 1:20230515-r0
>> linux-firmware-bcm4329 all 1:20230515-r0
>> linux-firmware-bcm4329-fullmac all 1:20230515-r0
>> linux-firmware-bcm4330 all 1:20230515-r0
>> linux-firmware-bcm4334 all 1:20230515-r0
>> linux-firmware-bcm43340 all 1:20230515-r0
>> linux-firmware-bcm4335 all 1:20230515-r0
>> linux-firmware-bcm43362 all 1:20230515-r0
>> linux-firmware-bcm4339 all 1:20230515-r0
>> linux-firmware-bcm43430 all 1:20230515-r0
>> linux-firmware-bcm43430a0 all 1:20230515-r0
>> linux-firmware-bcm43455 all 1:20230515-r0
>> linux-firmware-bcm4350 all 1:20230515-r0
>> linux-firmware-bcm4350c2 all 1:20230515-r0
>> linux-firmware-bcm4354 all 1:20230515-r0
>> linux-firmware-bcm4356 all 1:20230515-r0
>> linux-firmware-bcm4356-pcie all 1:20230515-r0
>> linux-firmware-bcm43569 all 1:20230515-r0
>> linux-firmware-bcm43570 all 1:20230515-r0
>> linux-firmware-bcm4358 all 1:20230515-r0
>> linux-firmware-bcm43602 all 1:20230515-r0
>> linux-firmware-bcm4366b all 1:20230515-r0
>> linux-firmware-bcm4366c all 1:20230515-r0
>> linux-firmware-bcm4371 all 1:20230515-r0
>> linux-firmware-bcm4373 all 1:20230515-r0
>> linux-firmware-bcm43xx all 1:20230515-r0
>> linux-firmware-bcm43xx-hdr all 1:20230515-r0
>> linux-firmware-bnx2-mips all 1:20230515-r0
>> linux-firmware-broadcom-license all 1:20230515-r0
>> linux-firmware-carl9170 all 1:20230515-r0
>> linux-firmware-cypress-license all 1:20230515-r0
>> linux-firmware-gplv2-license all 1:20230515-r0
>> linux-firmware-i915 all 1:20230515-r0
>> linux-firmware-i915-license all 1:20230515-r0
>> linux-firmware-ibt all 1:20230515-r0
>> linux-firmware-ibt-11-5 all 1:20230515-r0
>> linux-firmware-ibt-12-16 all 1:20230515-r0
>> linux-firmware-ibt-17 all 1:20230515-r0
>> linux-firmware-ibt-20 all 1:20230515-r0
>> linux-firmware-ibt-hw-37-7 all 1:20230515-r0
>> linux-firmware-ibt-hw-37-8 all 1:20230515-r0
>> linux-firmware-ibt-license all 1:20230515-r0
>> linux-firmware-ibt-misc all 1:20230515-r0
>> linux-firmware-ice all 1:20230515-r0
>> linux-firmware-ice-license all 1:20230515-r0
>> linux-firmware-imx-sdma-imx6q all 1:20230515-r0
>> linux-firmware-imx-sdma-imx7d all 1:20230515-r0
>> linux-firmware-imx-sdma-license all 1:20230515-r0
>> linux-firmware-iwlwifi all 1:20230515-r0
>> linux-firmware-iwlwifi-135-6 all 1:20230515-r0
>> linux-firmware-iwlwifi-3160-17 all 1:20230515-r0
>> linux-firmware-iwlwifi-6000-4 all 1:20230515-r0
>> linux-firmware-iwlwifi-6000g2a-6 all 1:20230515-r0
>> linux-firmware-iwlwifi-6000g2b-6 all 1:20230515-r0
>> linux-firmware-iwlwifi-6050-5 all 1:20230515-r0
>> linux-firmware-iwlwifi-7260 all 1:20230515-r0
>> linux-firmware-iwlwifi-7265 all 1:20230515-r0
>> linux-firmware-iwlwifi-7265d all 1:20230515-r0
>> linux-firmware-iwlwifi-8000c all 1:20230515-r0
>> linux-firmware-iwlwifi-8265 all 1:20230515-r0
>> linux-firmware-iwlwifi-9000 all 1:20230515-r0
>> linux-firmware-iwlwifi-license all 1:20230515-r0
>> linux-firmware-iwlwifi-misc all 1:20230515-r0
>> linux-firmware-license all 1:20230515-r0
>> linux-firmware-liquidio all 1:20230515-r0
>> linux-firmware-lontium-license all 1:20230515-r0
>> linux-firmware-lt9611uxc all 1:20230515-r0
>> linux-firmware-marvell-license all 1:20230515-r0
>> linux-firmware-mt7601u all 1:20230515-r0
>> linux-firmware-mt7601u-license all 1:20230515-r0
>> linux-firmware-netronome all 1:20230515-r0
>> linux-firmware-netronome-license all 1:20230515-r0
>> linux-firmware-nvidia-gpu all 1:20230515-r0
>> linux-firmware-nvidia-license all 1:20230515-r0
>> linux-firmware-nvidia-tegra all 1:20230515-r0
>> linux-firmware-nvidia-tegra-k1 all 1:20230515-r0
>> linux-firmware-pcie8897 all 1:20230515-r0
>> linux-firmware-pcie8997 all 1:20230515-r0
>> linux-firmware-qat all 1:20230515-r0
>> linux-firmware-qat-license all 1:20230515-r0
>> linux-firmware-qca all 1:20230515-r0
>> linux-firmware-qcom-adreno-a2xx all 1:20230515-r0
>> linux-firmware-qcom-adreno-a3xx all 1:20230515-r0
>> linux-firmware-qcom-adreno-a4xx all 1:20230515-r0
>> linux-firmware-qcom-adreno-a530 all 1:20230515-r0
>> linux-firmware-qcom-adreno-a630 all 1:20230515-r0
>> linux-firmware-qcom-adreno-a650 all 1:20230515-r0
>> linux-firmware-qcom-adreno-a660 all 1:20230515-r0
>> linux-firmware-qcom-apq8096-audio all 1:20230515-r0
>> linux-firmware-qcom-apq8096-modem all 1:20230515-r0
>> linux-firmware-qcom-license all 1:20230515-r0
>> linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno all 1:20230515-r0
>> linux-firmware-qcom-sc8280xp-lenovo-x13s-audio all 1:20230515-r0
>> linux-firmware-qcom-sc8280xp-lenovo-x13s-compat all 1:20230515-r0
>> linux-firmware-qcom-sc8280xp-lenovo-x13s-compute all 1:20230515-r0
>> linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors all 1:20230515-r0
>> linux-firmware-qcom-sdm845-audio all 1:20230515-r0
>> linux-firmware-qcom-sdm845-compute all 1:20230515-r0
>> linux-firmware-qcom-sdm845-modem all 1:20230515-r0
>> linux-firmware-qcom-sm8250-audio all 1:20230515-r0
>> linux-firmware-qcom-sm8250-compute all 1:20230515-r0
>> linux-firmware-qcom-venus-1.8 all 1:20230515-r0
>> linux-firmware-qcom-venus-4.2 all 1:20230515-r0
>> linux-firmware-qcom-venus-5.2 all 1:20230515-r0
>> linux-firmware-qcom-venus-5.4 all 1:20230515-r0
>> linux-firmware-qcom-vpu-1.0 all 1:20230515-r0
>> linux-firmware-qcom-vpu-2.0 all 1:20230515-r0
>> linux-firmware-qcom-yamato-license all 1:20230515-r0
>> linux-firmware-radeon all 1:20230515-r0
>> linux-firmware-radeon-license all 1:20230515-r0
>> linux-firmware-ralink all 1:20230515-r0
>> linux-firmware-ralink-license all 1:20230515-r0
>> linux-firmware-rs9113 all 1:20230515-r0
>> linux-firmware-rs9116 all 1:20230515-r0
>> linux-firmware-rtl-license all 1:20230515-r0
>> linux-firmware-rtl8168 all 1:20230515-r0
>> linux-firmware-rtl8188 all 1:20230515-r0
>> linux-firmware-rtl8192ce all 1:20230515-r0
>> linux-firmware-rtl8192cu all 1:20230515-r0
>> linux-firmware-rtl8192eu all 1:20230515-r0
>> linux-firmware-rtl8192su all 1:20230515-r0
>> linux-firmware-rtl8723 all 1:20230515-r0
>> linux-firmware-rtl8821 all 1:20230515-r0
>> linux-firmware-sd8686 all 1:20230515-r0
>> linux-firmware-sd8688 all 1:20230515-r0
>> linux-firmware-sd8787 all 1:20230515-r0
>> linux-firmware-sd8797 all 1:20230515-r0
>> linux-firmware-sd8801 all 1:20230515-r0
>> linux-firmware-sd8887 all 1:20230515-r0
>> linux-firmware-sd8897 all 1:20230515-r0
>> linux-firmware-sd8997 all 1:20230515-r0
>> linux-firmware-ti-connectivity-license all 1:20230515-r0
>> linux-firmware-usb8997 all 1:20230515-r0
>> linux-firmware-vt6656 all 1:20230515-r0
>> linux-firmware-vt6656-license all 1:20230515-r0
>> linux-firmware-whence-license all 1:20230515-r0
>> linux-firmware-wl12xx all 1:20230515-r0
>> linux-firmware-wl18xx all 1:20230515-r0
>> linux-firmware-wlcommon all 1:20230515-r0
>>
>> Am Di., 25. Juli 2023 um 11:52 Uhr schrieb Alexander Kanavin <
>> alex.kanavin@gmail.com>:
>>
>>> On Tue, 25 Jul 2023 at 11:28, Andreas <rehn.andreas86@gmail.com> wrote:
>>> > i encountered issues with the new poky release on dunfell.
>>> > explicitly linux-firmware: commit hash
>>> a04b507d39d668a02b7ebd990c94194cde16bf2f
>>> >
>>> > i building dunfell images since 1,5 years and my images are normaly
>>> 1,9 GB big.
>>> > however since Sunday 23.07, the image size increases by 1GB due to th=
e
>>> full firmware installation.
>>> >
>>> > i double checked it with the previous commit
>>> 0bf993da8b6e6511a4123ed15421bdd76a4c1f38 and the image size is as expec=
ted.
>>> >
>>> > i hope someone is able to help, because this is an unexpected behavio=
r.
>>> >
>>> > PS: this my first post so please have mercy on me. :)
>>>
>>> Can you enable buildhistory as described in
>>> https://docs.yoctoproject.org/dev/dev-manual/build-quality.html
>>> then build linux-firmware before and after the change, then run
>>> buildhistory-diff? That should highlight where the size increase come
>>> from in its packaging.
>>>
>>> You can also manually inspect linux-firmware's ${WORKDIR}/packages-spit=
/.
>>>
>>> Alex
>>>
>>
>>
>> Andreas
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184838):
>> https://lists.openembedded.org/g/openembedded-core/message/184838
>> Mute This Topic: https://lists.openembedded.org/mt/100346886/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> Martin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
Andreas

--00000000000094e35206014f0a82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">before:<div>&quot;linux-firmware-mt7601u&=
quot; -&gt; &quot;linux-firmware-mt7601u-license&quot;<br>&quot;linux-firmw=
are-ralink&quot; -&gt; &quot;linux-firmware-ralink-license&quot;<br>&quot;l=
inux-firmware-rtl8168&quot; -&gt; &quot;linux-firmware-whence-license&quot;=
<br>&quot;linux-firmware-rtl8188&quot; -&gt; &quot;linux-firmware-rtl-licen=
se&quot;<br>&quot;linux-firmware-rtl8192ce&quot; -&gt; &quot;linux-firmware=
-rtl-license&quot;<br>&quot;linux-firmware-rtl8192cu&quot; -&gt; &quot;linu=
x-firmware-rtl-license&quot;<br>&quot;linux-firmware-rtl8192eu&quot; -&gt; =
&quot;linux-firmware-rtl-license&quot;<br>&quot;linux-firmware-rtl8192su&qu=
ot; -&gt; &quot;linux-firmware-rtl-license&quot;<br>&quot;linux-firmware-rt=
l8723&quot; -&gt; &quot;linux-firmware-rtl-license&quot;<br>&quot;linux-fir=
mware-rtl8821&quot; -&gt; &quot;linux-firmware-rtl-license&quot;<br></div><=
div><br></div><div>after:</div><div>&quot;linux-firmware-adsp-sst&quot; -&g=
t; &quot;linux-firmware&quot;<br>&quot;linux-firmware-adsp-sst&quot; -&gt; =
&quot;linux-firmware-adsp-sst-license&quot;<br>&quot;linux-firmware-amlogic=
-vdec&quot; -&gt; &quot;linux-firmware-amlogic-vdec-license&quot;<br>&quot;=
linux-firmware-ar3k&quot; -&gt; &quot;linux-firmware-ar3k-license&quot;<br>=
&quot;linux-firmware-ar3k&quot; -&gt; &quot;linux-firmware-atheros-license&=
quot;<br>&quot;linux-firmware-ar9170&quot; -&gt; &quot;linux-firmware-ather=
os-license&quot;<br>&quot;linux-firmware-ath10k&quot; -&gt; &quot;linux-fir=
mware-ath10k-license&quot;<br>&quot;linux-firmware-ath11k&quot; -&gt; &quot=
;linux-firmware-ath10k-license&quot;<br>&quot;linux-firmware-ath6k&quot; -&=
gt; &quot;linux-firmware-atheros-license&quot;<br>&quot;linux-firmware-ath9=
k&quot; -&gt; &quot;linux-firmware-atheros-license&quot;<br>&quot;linux-fir=
mware-bcm-0bb4-0306&quot; -&gt; &quot;linux-firmware-cypress-license&quot;<=
br>&quot;linux-firmware-bcm43143&quot; -&gt; &quot;linux-firmware-broadcom-=
license&quot;<br>&quot;linux-firmware-bcm43236b&quot; -&gt; &quot;linux-fir=
mware-broadcom-license&quot;<br>&quot;linux-firmware-bcm43241b0&quot; -&gt;=
 &quot;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-bcm432=
41b4&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;linux=
-firmware-bcm43241b5&quot; -&gt; &quot;linux-firmware-broadcom-license&quot=
;<br>&quot;linux-firmware-bcm43242a&quot; -&gt; &quot;linux-firmware-broadc=
om-license&quot;<br>&quot;linux-firmware-bcm4329-fullmac&quot; -&gt; &quot;=
linux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-bcm4329&quot;=
 -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-=
bcm4330&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;li=
nux-firmware-bcm43340&quot; -&gt; &quot;linux-firmware-cypress-license&quot=
;<br>&quot;linux-firmware-bcm4334&quot; -&gt; &quot;linux-firmware-broadcom=
-license&quot;<br>&quot;linux-firmware-bcm4335&quot; -&gt; &quot;linux-firm=
ware-broadcom-license&quot;<br>&quot;linux-firmware-bcm43362&quot; -&gt; &q=
uot;linux-firmware-cypress-license&quot;<br>&quot;linux-firmware-bcm4339&qu=
ot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmwa=
re-bcm43430a0&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&q=
uot;linux-firmware-bcm43430&quot; -&gt; &quot;linux-firmware-cypress-licens=
e&quot;<br>&quot;linux-firmware-bcm43455&quot; -&gt; &quot;linux-firmware-b=
roadcom-license&quot;<br>&quot;linux-firmware-bcm4350c2&quot; -&gt; &quot;l=
inux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-bcm4350&quot; =
-&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-b=
cm4354&quot; -&gt; &quot;linux-firmware-cypress-license&quot;<br>&quot;linu=
x-firmware-bcm43569&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;=
<br>&quot;linux-firmware-bcm4356&quot; -&gt; &quot;linux-firmware-broadcom-=
license&quot;<br>&quot;linux-firmware-bcm4356-pcie&quot; -&gt; &quot;linux-=
firmware-cypress-license&quot;<br>&quot;linux-firmware-bcm43570&quot; -&gt;=
 &quot;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-bcm435=
8&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;linux-fi=
rmware-bcm43602&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>=
&quot;linux-firmware-bcm4366b&quot; -&gt; &quot;linux-firmware-broadcom-lic=
ense&quot;<br>&quot;linux-firmware-bcm4366c&quot; -&gt; &quot;linux-firmwar=
e-broadcom-license&quot;<br>&quot;linux-firmware-bcm4371&quot; -&gt; &quot;=
linux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-bcm4373&quot;=
 -&gt; &quot;linux-firmware&quot;<br>&quot;linux-firmware-bcm4373&quot; -&g=
t; &quot;linux-firmware-cypress-license&quot;<br>&quot;linux-firmware-bcm43=
xx-hdr&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;lin=
ux-firmware-bcm43xx&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;=
<br>&quot;linux-firmware-bnx2-mips&quot; -&gt; &quot;linux-firmware-whence-=
license&quot;<br>&quot;linux-firmware-carl9170&quot; -&gt; &quot;linux-firm=
ware-gplv2-license&quot;<br>&quot;linux-firmware-i915&quot; -&gt; &quot;lin=
ux-firmware-i915-license&quot;<br>&quot;linux-firmware-ibt-11-5&quot; -&gt;=
 &quot;linux-firmware-ibt-license&quot;<br>&quot;linux-firmware-ibt-12-16&q=
uot; -&gt; &quot;linux-firmware-ibt-license&quot;<br>&quot;linux-firmware-i=
bt-17&quot; -&gt; &quot;linux-firmware-ibt-license&quot;<br>&quot;linux-fir=
mware-ibt-20&quot; -&gt; &quot;linux-firmware-ibt-license&quot;<br>&quot;li=
nux-firmware-ibt-hw-37-7&quot; -&gt; &quot;linux-firmware-ibt-license&quot;=
<br>&quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-11-5&quot=
; [style=3Ddotted]<br>&quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firm=
ware-ibt-12-16&quot; [style=3Ddotted]<br>&quot;linux-firmware-ibt&quot; -&g=
t; &quot;linux-firmware-ibt-17&quot; [style=3Ddotted]<br>&quot;linux-firmwa=
re-ibt&quot; -&gt; &quot;linux-firmware-ibt-20&quot; [style=3Ddotted]<br>&q=
uot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-hw-37-7&quot; [=
style=3Ddotted]<br>&quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmwar=
e-ibt-hw-37-8&quot; [style=3Ddotted]<br>&quot;linux-firmware-ibt&quot; -&gt=
; &quot;linux-firmware-ibt-license&quot; [style=3Ddotted]<br>&quot;linux-fi=
rmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-misc&quot; [style=3Ddotted]=
<br>&quot;linux-firmware-ibt-misc&quot; -&gt; &quot;linux-firmware-ibt-lice=
nse&quot;<br>&quot;linux-firmware-ice&quot; -&gt; &quot;linux-firmware-ice-=
license&quot;<br>&quot;linux-firmware-imx-sdma-imx6q&quot; -&gt; &quot;linu=
x-firmware-imx-sdma-license&quot;<br>&quot;linux-firmware-imx-sdma-imx7d&qu=
ot; -&gt; &quot;linux-firmware-imx-sdma-license&quot;<br>&quot;linux-firmwa=
re-iwlwifi-135-6&quot; -&gt; &quot;linux-firmware-iwlwifi-license&quot;<br>=
&quot;linux-firmware-iwlwifi-3160-17&quot; -&gt; &quot;linux-firmware-iwlwi=
fi-license&quot;<br>&quot;linux-firmware-iwlwifi-6000-4&quot; -&gt; &quot;l=
inux-firmware-iwlwifi-license&quot;<br>&quot;linux-firmware-iwlwifi-6000g2a=
-6&quot; -&gt; &quot;linux-firmware-iwlwifi-license&quot;<br>&quot;linux-fi=
rmware-iwlwifi-6000g2b-6&quot; -&gt; &quot;linux-firmware-iwlwifi-license&q=
uot;<br>&quot;linux-firmware-iwlwifi-6050-5&quot; -&gt; &quot;linux-firmwar=
e-iwlwifi-license&quot;<br>&quot;linux-firmware-iwlwifi-7260&quot; -&gt; &q=
uot;linux-firmware-iwlwifi-license&quot;<br>&quot;linux-firmware-iwlwifi-72=
65d&quot; -&gt; &quot;linux-firmware-iwlwifi-license&quot;<br>&quot;linux-f=
irmware-iwlwifi-7265&quot; -&gt; &quot;linux-firmware-iwlwifi-license&quot;=
<br>&quot;linux-firmware-iwlwifi-8000c&quot; -&gt; &quot;linux-firmware-iwl=
wifi-license&quot;<br>&quot;linux-firmware-iwlwifi-8265&quot; -&gt; &quot;l=
inux-firmware-iwlwifi-license&quot;<br>&quot;linux-firmware-iwlwifi-9000&qu=
ot; -&gt; &quot;linux-firmware-iwlwifi-license&quot;<br>&quot;linux-firmwar=
e-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-135-6&quot; [style=3Ddot=
ted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwi=
fi-3160-10&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&g=
t; &quot;linux-firmware-iwlwifi-3160-12&quot; [style=3Ddotted]<br>&quot;lin=
ux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-13&quot; =
[style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-fi=
rmware-iwlwifi-3160-16&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwi=
fi&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-17&quot; [style=3Ddotted]<=
br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-31=
60-7&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &qu=
ot;linux-firmware-iwlwifi-3160-8&quot; [style=3Ddotted]<br>&quot;linux-firm=
ware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-9&quot; [style=
=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware=
-iwlwifi-6000-4&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot=
; -&gt; &quot;linux-firmware-iwlwifi-6000g2a-5&quot; [style=3Ddotted]<br>&q=
uot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-6000g2a=
-6&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot=
;linux-firmware-iwlwifi-6000g2b-5&quot; [style=3Ddotted]<br>&quot;linux-fir=
mware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-6000g2b-6&quot; [sty=
le=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmwa=
re-iwlwifi-6050-4&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&qu=
ot; -&gt; &quot;linux-firmware-iwlwifi-6050-5&quot; [style=3Ddotted]<br>&qu=
ot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-7260&quo=
t; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux=
-firmware-iwlwifi-7265d&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlw=
ifi&quot; -&gt; &quot;linux-firmware-iwlwifi-7265&quot; [style=3Ddotted]<br=
>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-8000=
c&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;=
linux-firmware-iwlwifi-8265&quot; [style=3Ddotted]<br>&quot;linux-firmware-=
iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-9000&quot; [style=3Ddotted=
]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-=
license&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; =
&quot;linux-firmware-iwlwifi-misc&quot; [style=3Ddotted]<br>&quot;linux-fir=
mware-iwlwifi-misc&quot; -&gt; &quot;linux-firmware-iwlwifi-license&quot;<b=
r>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-adsp-sst-license&qu=
ot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmwa=
re-adsp-sst&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quo=
t;linux-firmware-amlogic-vdec-license&quot; [style=3Ddotted]<br>&quot;linux=
-firmware&quot; -&gt; &quot;linux-firmware-amlogic-vdec&quot; [style=3Ddott=
ed]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ar3k-license&q=
uot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmw=
are-ar3k&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;l=
inux-firmware-ar9170&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -=
&gt; &quot;linux-firmware-ath10k-license&quot; [style=3Ddotted]<br>&quot;li=
nux-firmware&quot; -&gt; &quot;linux-firmware-ath10k&quot; [style=3Ddotted]=
<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ath11k&quot; [sty=
le=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ath6k=
&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-fir=
mware-ath9k&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quo=
t;linux-firmware-atheros-license&quot; [style=3Ddotted]<br>&quot;linux-firm=
ware&quot; -&gt; &quot;linux-firmware-bcm-0bb4-0306&quot;<br>&quot;linux-fi=
rmware&quot; -&gt; &quot;linux-firmware-bcm-0bb4-0306&quot; [style=3Ddotted=
]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43143&quot; [=
style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bc=
m43236b&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;li=
nux-firmware-bcm43241b0&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot=
; -&gt; &quot;linux-firmware-bcm43241b4&quot; [style=3Ddotted]<br>&quot;lin=
ux-firmware&quot; -&gt; &quot;linux-firmware-bcm43241b5&quot; [style=3Ddott=
ed]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43242a&quot=
; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware=
-bcm4329-fullmac&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt;=
 &quot;linux-firmware-bcm4329&quot; [style=3Ddotted]<br>&quot;linux-firmwar=
e&quot; -&gt; &quot;linux-firmware-bcm4330&quot; [style=3Ddotted]<br>&quot;=
linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43340&quot; [style=3Ddot=
ted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4334&quot;=
 [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-=
bcm4335&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;li=
nux-firmware-bcm43362&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; =
-&gt; &quot;linux-firmware-bcm4339&quot; [style=3Ddotted]<br>&quot;linux-fi=
rmware&quot; -&gt; &quot;linux-firmware-bcm43430a0&quot; [style=3Ddotted]<b=
r>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43430&quot; [sty=
le=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43=
455&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-=
firmware-bcm4350c2&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&g=
t; &quot;linux-firmware-bcm4350&quot; [style=3Ddotted]<br>&quot;linux-firmw=
are&quot; -&gt; &quot;linux-firmware-bcm4354&quot; [style=3Ddotted]<br>&quo=
t;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43569&quot; [style=3Dd=
otted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4356-pci=
e&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-fi=
rmware-bcm4356&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &=
quot;linux-firmware-bcm43570&quot; [style=3Ddotted]<br>&quot;linux-firmware=
&quot; -&gt; &quot;linux-firmware-bcm4358&quot; [style=3Ddotted]<br>&quot;l=
inux-firmware&quot; -&gt; &quot;linux-firmware-bcm43602&quot; [style=3Ddott=
ed]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4366b&quot;=
 [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-=
bcm4366c&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;l=
inux-firmware-bcm4371&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; =
-&gt; &quot;linux-firmware-bcm4373&quot; [style=3Ddotted]<br>&quot;linux-fi=
rmware&quot; -&gt; &quot;linux-firmware-bcm43xx-hdr&quot; [style=3Ddotted]<=
br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43xx&quot; [sty=
le=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bnx2-=
mips&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux=
-firmware-broadcom-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&q=
uot; -&gt; &quot;linux-firmware-carl9170&quot; [style=3Ddotted]<br>&quot;li=
nux-firmware&quot; -&gt; &quot;linux-firmware-cypress-license&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-gplv2-l=
icense&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;lin=
ux-firmware-i915-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&quo=
t; -&gt; &quot;linux-firmware-i915&quot; [style=3Ddotted]<br>&quot;linux-fi=
rmware&quot; -&gt; &quot;linux-firmware-ibt-11-5&quot; [style=3Ddotted]<br>=
&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-12-16&quot; [styl=
e=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-17=
&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-fir=
mware-ibt-20&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &qu=
ot;linux-firmware-ibt-hw-37-7&quot; [style=3Ddotted]<br>&quot;linux-firmwar=
e&quot; -&gt; &quot;linux-firmware-ibt-hw-37-8&quot; [style=3Ddotted]<br>&q=
uot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-license&quot; [styl=
e=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-mi=
sc&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-f=
irmware-ibt&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quo=
t;linux-firmware-ice-license&quot; [style=3Ddotted]<br>&quot;linux-firmware=
&quot; -&gt; &quot;linux-firmware-ice&quot; [style=3Ddotted]<br>&quot;linux=
-firmware&quot; -&gt; &quot;linux-firmware-imx-sdma-imx6q&quot; [style=3Ddo=
tted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-imx-sdma-imx=
7d&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-f=
irmware-imx-sdma-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&quo=
t; -&gt; &quot;linux-firmware-iwlwifi-135-6&quot; [style=3Ddotted]<br>&quot=
;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-10&quot; [sty=
le=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwi=
fi-3160-12&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot=
;linux-firmware-iwlwifi-3160-13&quot; [style=3Ddotted]<br>&quot;linux-firmw=
are&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-16&quot; [style=3Ddotted]=
<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-17&q=
uot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmw=
are-iwlwifi-3160-7&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&g=
t; &quot;linux-firmware-iwlwifi-3160-8&quot; [style=3Ddotted]<br>&quot;linu=
x-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-9&quot; [style=3Dd=
otted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-600=
0-4&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-=
firmware-iwlwifi-6000g2a-5&quot; [style=3Ddotted]<br>&quot;linux-firmware&q=
uot; -&gt; &quot;linux-firmware-iwlwifi-6000g2a-6&quot; [style=3Ddotted]<br=
>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-6000g2b-5&qu=
ot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmwa=
re-iwlwifi-6000g2b-6&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -=
&gt; &quot;linux-firmware-iwlwifi-6050-4&quot; [style=3Ddotted]<br>&quot;li=
nux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-6050-5&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi=
-7260&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linu=
x-firmware-iwlwifi-7265d&quot; [style=3Ddotted]<br>&quot;linux-firmware&quo=
t; -&gt; &quot;linux-firmware-iwlwifi-7265&quot; [style=3Ddotted]<br>&quot;=
linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-8000c&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi=
-8265&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linu=
x-firmware-iwlwifi-9000&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot=
; -&gt; &quot;linux-firmware-iwlwifi-license&quot; [style=3Ddotted]<br>&quo=
t;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-misc&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi=
&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-fir=
mware-license&quot;<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmwar=
e-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;=
linux-firmware-liquidio&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot=
; -&gt; &quot;linux-firmware-lontium-license&quot; [style=3Ddotted]<br>&quo=
t;linux-firmware&quot; -&gt; &quot;linux-firmware-lt9611uxc&quot; [style=3D=
dotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-marvell-li=
cense&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linu=
x-firmware-mt7601u-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&q=
uot; -&gt; &quot;linux-firmware-mt7601u&quot; [style=3Ddotted]<br>&quot;lin=
ux-firmware&quot; -&gt; &quot;linux-firmware-netronome-license&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-netrono=
me&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-f=
irmware-nvidia-gpu&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&g=
t; &quot;linux-firmware-nvidia-license&quot; [style=3Ddotted]<br>&quot;linu=
x-firmware&quot; -&gt; &quot;linux-firmware-nvidia-tegra-k1&quot; [style=3D=
dotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-nvidia-teg=
ra&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-f=
irmware-pcie8897&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt;=
 &quot;linux-firmware-pcie8997&quot; [style=3Ddotted]<br>&quot;linux-firmwa=
re&quot; -&gt; &quot;linux-firmware-qat-license&quot; [style=3Ddotted]<br>&=
quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qat&quot; [style=3Ddot=
ted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qca&quot; [st=
yle=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom=
-adreno-a2xx&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &qu=
ot;linux-firmware-qcom-adreno-a3xx&quot; [style=3Ddotted]<br>&quot;linux-fi=
rmware&quot; -&gt; &quot;linux-firmware-qcom-adreno-a4xx&quot; [style=3Ddot=
ted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-adreno-a=
530&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-=
firmware-qcom-adreno-a630&quot; [style=3Ddotted]<br>&quot;linux-firmware&qu=
ot; -&gt; &quot;linux-firmware-qcom-adreno-a650&quot; [style=3Ddotted]<br>&=
quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-adreno-a660&quot;=
 [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-=
qcom-apq8096-audio&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&g=
t; &quot;linux-firmware-qcom-apq8096-modem&quot; [style=3Ddotted]<br>&quot;=
linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-license&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sc=
8280xp-lenovo-x13s-adreno&quot; [style=3Ddotted]<br>&quot;linux-firmware&qu=
ot; -&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-audio&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sc=
8280xp-lenovo-x13s-compat&quot; [style=3Ddotted]<br>&quot;linux-firmware&qu=
ot; -&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-compute&quot; [sty=
le=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-=
sc8280xp-lenovo-x13s-sensors&quot; [style=3Ddotted]<br>&quot;linux-firmware=
&quot; -&gt; &quot;linux-firmware-qcom-sdm845-audio&quot; [style=3Ddotted]<=
br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sdm845-comput=
e&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-fi=
rmware-qcom-sdm845-modem&quot; [style=3Ddotted]<br>&quot;linux-firmware&quo=
t; -&gt; &quot;linux-firmware-qcom-sm8250-audio&quot; [style=3Ddotted]<br>&=
quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sm8250-compute&qu=
ot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmwa=
re-qcom-venus-1.8&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt=
; &quot;linux-firmware-qcom-venus-4.2&quot; [style=3Ddotted]<br>&quot;linux=
-firmware&quot; -&gt; &quot;linux-firmware-qcom-venus-5.2&quot; [style=3Ddo=
tted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-venus-5=
.4&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-f=
irmware-qcom-vpu-1.0&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -=
&gt; &quot;linux-firmware-qcom-vpu-2.0&quot; [style=3Ddotted]<br>&quot;linu=
x-firmware&quot; -&gt; &quot;linux-firmware-qcom-yamato-license&quot; [styl=
e=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-radeon=
-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;l=
inux-firmware-radeon&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -=
&gt; &quot;linux-firmware-ralink-license&quot; [style=3Ddotted]<br>&quot;li=
nux-firmware&quot; -&gt; &quot;linux-firmware-ralink&quot; [style=3Ddotted]=
<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rs9113&quot; [sty=
le=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rs911=
6&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-fi=
rmware-rtl8168&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &=
quot;linux-firmware-rtl8188&quot; [style=3Ddotted]<br>&quot;linux-firmware&=
quot; -&gt; &quot;linux-firmware-rtl8192ce&quot; [style=3Ddotted]<br>&quot;=
linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8192cu&quot; [style=3Ddo=
tted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8192eu&qu=
ot;<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8192eu&quot=
; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware=
-rtl8192su&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot=
;linux-firmware-rtl8723&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot=
; -&gt; &quot;linux-firmware-rtl8821&quot; [style=3Ddotted]<br>&quot;linux-=
firmware&quot; -&gt; &quot;linux-firmware-rtl-license&quot; [style=3Ddotted=
]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd8686&quot; [st=
yle=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd86=
88&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-f=
irmware-sd8787&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &=
quot;linux-firmware-sd8797&quot; [style=3Ddotted]<br>&quot;linux-firmware&q=
uot; -&gt; &quot;linux-firmware-sd8801&quot; [style=3Ddotted]<br>&quot;linu=
x-firmware&quot; -&gt; &quot;linux-firmware-sd8887&quot; [style=3Ddotted]<b=
r>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd8897&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd8997&=
quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firm=
ware-ti-connectivity-license&quot; [style=3Ddotted]<br>&quot;linux-firmware=
&quot; -&gt; &quot;linux-firmware-usb8997&quot; [style=3Ddotted]<br>&quot;l=
inux-firmware&quot; -&gt; &quot;linux-firmware-vt6656-license&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-vt6656&=
quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firm=
ware-whence-license&quot;<br>&quot;linux-firmware&quot; -&gt; &quot;linux-f=
irmware-whence-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot;=
 -&gt; &quot;linux-firmware-wl12xx&quot; [style=3Ddotted]<br>&quot;linux-fi=
rmware&quot; -&gt; &quot;linux-firmware-wl18xx&quot; [style=3Ddotted]<br>&q=
uot;linux-firmware&quot; -&gt; &quot;linux-firmware-wlcommon&quot; [style=
=3Ddotted]<br>&quot;linux-firmware-mt7601u&quot; -&gt; &quot;linux-firmware=
&quot;<br>&quot;linux-firmware-mt7601u&quot; -&gt; &quot;linux-firmware-mt7=
601u-license&quot;<br>&quot;linux-firmware-netronome&quot; -&gt; &quot;linu=
x-firmware-netronome-license&quot;<br>&quot;linux-firmware-nvidia-gpu&quot;=
 -&gt; &quot;linux-firmware-nvidia-license&quot;<br>&quot;linux-firmware-nv=
idia-tegra-k1&quot; -&gt; &quot;linux-firmware-nvidia-license&quot;<br>&quo=
t;linux-firmware-nvidia-tegra&quot; -&gt; &quot;linux-firmware-nvidia-gpu&q=
uot;<br>&quot;linux-firmware-nvidia-tegra&quot; -&gt; &quot;linux-firmware-=
nvidia-license&quot;<br>&quot;linux-firmware-qat&quot; -&gt; &quot;linux-fi=
rmware-qat-license&quot;<br>&quot;linux-firmware-qca&quot; -&gt; &quot;linu=
x-firmware-ath10k-license&quot;<br>&quot;linux-firmware-qcom-adreno-a2xx&qu=
ot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-q=
com-adreno-a2xx&quot; -&gt; &quot;linux-firmware-qcom-yamato-license&quot;<=
br>&quot;linux-firmware-qcom-adreno-a4xx&quot; -&gt; &quot;linux-firmware-q=
com-license&quot;<br>&quot;linux-firmware-qcom-adreno-a530&quot; -&gt; &quo=
t;linux-firmware&quot;<br>&quot;linux-firmware-qcom-adreno-a530&quot; -&gt;=
 &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-qcom-adren=
o-a630&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-f=
irmware-qcom-adreno-a650&quot; -&gt; &quot;linux-firmware-qcom-license&quot=
;<br>&quot;linux-firmware-qcom-adreno-a660&quot; -&gt; &quot;linux-firmware=
-qcom-license&quot;<br>&quot;linux-firmware-qcom-apq8096-audio&quot; -&gt; =
&quot;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-qcom-apq809=
6-modem&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-=
firmware-qcom-sc8280xp-lenovo-x13s-adreno&quot; -&gt; &quot;linux-firmware-=
qcom-license&quot;<br>&quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno=
&quot; -&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-compat&quot; [s=
tyle=3Ddotted]<br>&quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-audio&quot=
; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-qco=
m-sc8280xp-lenovo-x13s-audio&quot; -&gt; &quot;linux-firmware-qcom-sc8280xp=
-lenovo-x13s-compat&quot; [style=3Ddotted]<br>&quot;linux-firmware-qcom-sc8=
280xp-lenovo-x13s-compute&quot; -&gt; &quot;linux-firmware-qcom-license&quo=
t;<br>&quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-compute&quot; -&gt; &q=
uot;linux-firmware-qcom-sc8280xp-lenovo-x13s-compat&quot; [style=3Ddotted]<=
br>&quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors&quot; -&gt; &quot=
;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-qcom-sc8280xp-le=
novo-x13s-sensors&quot; -&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13=
s-compat&quot; [style=3Ddotted]<br>&quot;linux-firmware-qcom-sdm845-audio&q=
uot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-=
qcom-sdm845-compute&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>=
&quot;linux-firmware-qcom-sdm845-modem&quot; -&gt; &quot;linux-firmware-ath=
10k&quot;<br>&quot;linux-firmware-qcom-sdm845-modem&quot; -&gt; &quot;linux=
-firmware-qcom-license&quot;<br>&quot;linux-firmware-qcom-sm8250-audio&quot=
; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-qco=
m-sm8250-compute&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&qu=
ot;linux-firmware-qcom-venus-1.8&quot; -&gt; &quot;linux-firmware-qcom-lice=
nse&quot;<br>&quot;linux-firmware-qcom-venus-4.2&quot; -&gt; &quot;linux-fi=
rmware-qcom-license&quot;<br>&quot;linux-firmware-qcom-venus-5.2&quot; -&gt=
; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-qcom-venu=
s-5.4&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-fi=
rmware-qcom-vpu-1.0&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>=
&quot;linux-firmware-qcom-vpu-2.0&quot; -&gt; &quot;linux-firmware-qcom-lic=
ense&quot;<br>&quot;linux-firmware-radeon&quot; -&gt; &quot;linux-firmware-=
radeon-license&quot;<br>&quot;linux-firmware-ralink&quot; -&gt; &quot;linux=
-firmware-ralink-license&quot;<br>&quot;linux-firmware-rs9113&quot; -&gt; &=
quot;linux-firmware-whence-license&quot;<br>&quot;linux-firmware-rs9116&quo=
t; -&gt; &quot;linux-firmware-whence-license&quot;<br>&quot;linux-firmware-=
rtl8168&quot; -&gt; &quot;linux-firmware-whence-license&quot;<br>&quot;linu=
x-firmware-rtl8188&quot; -&gt; &quot;linux-firmware-rtl-license&quot;<br>&q=
uot;linux-firmware-rtl8192ce&quot; -&gt; &quot;linux-firmware-rtl-license&q=
uot;<br>&quot;linux-firmware-rtl8192cu&quot; -&gt; &quot;linux-firmware-rtl=
-license&quot;<br>&quot;linux-firmware-rtl8192eu&quot; -&gt; &quot;linux-fi=
rmware-rtl-license&quot;<br>&quot;linux-firmware-rtl8192su&quot; -&gt; &quo=
t;linux-firmware-rtl-license&quot;<br>&quot;linux-firmware-rtl8723&quot; -&=
gt; &quot;linux-firmware-rtl-license&quot;<br>&quot;linux-firmware-rtl8821&=
quot; -&gt; &quot;linux-firmware-rtl-license&quot;<br>&quot;linux-firmware-=
sd8686&quot; -&gt; &quot;linux-firmware-marvell-license&quot;<br>&quot;linu=
x-firmware-sd8688&quot; -&gt; &quot;linux-firmware-marvell-license&quot;<br=
>&quot;linux-firmware-sd8787&quot; -&gt; &quot;linux-firmware-marvell-licen=
se&quot;<br>&quot;linux-firmware-sd8797&quot; -&gt; &quot;linux-firmware-ma=
rvell-license&quot;<br>&quot;linux-firmware-sd8801&quot; -&gt; &quot;linux-=
firmware-marvell-license&quot;<br>&quot;linux-firmware-sd8887&quot; -&gt; &=
quot;linux-firmware-marvell-license&quot;<br>&quot;linux-firmware-sd8897&qu=
ot; -&gt; &quot;linux-firmware-marvell-license&quot;<br>&quot;linux-firmwar=
e-sd8997&quot; -&gt; &quot;linux-firmware-marvell-license&quot;<br>&quot;li=
nux-firmware-usb8997&quot; -&gt; &quot;linux-firmware-marvell-license&quot;=
<br>&quot;linux-firmware-vt6656&quot; -&gt; &quot;linux-firmware-vt6656-lic=
ense&quot;<br>&quot;linux-firmware-wl12xx&quot; -&gt; &quot;linux-firmware-=
ti-connectivity-license&quot;<br>&quot;linux-firmware-wl12xx&quot; -&gt; &q=
uot;linux-firmware-wlcommon&quot;<br>&quot;linux-firmware-wl18xx&quot; -&gt=
; &quot;linux-firmware-ti-connectivity-license&quot;<br>&quot;linux-firmwar=
e-wl18xx&quot; -&gt; &quot;linux-firmware-wlcommon&quot;<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Di., 2=
5. Juli 2023 um 14:20=C2=A0Uhr schrieb Martin Jansa &lt;<a href=3D"mailto:m=
artin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">now figure out what=
 depends on linux-firmware from your image<div><br></div><div>grep linux-fi=
rmware buildhistory/images/your-machine/your-libc/your-image/depends.dot<br=
></div><div><br></div><div>and then git log will help you with the rest (FW=
IW: I don&#39;t see linux-firmware in our dunfell images).</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul=
 25, 2023 at 2:01=E2=80=AFPM Andreas Rehn &lt;<a href=3D"mailto:rehn.andrea=
s86@gmail.com" target=3D"_blank">rehn.andreas86@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div dir=3D"ltr"><div>hey alex,</div><div>thx for have a look</div><div><br>=
</div>before<br><br>linux-firmware-mt7601u-license<br>linux-firmware-mt7601=
u<br>linux-firmware-ralink-license<br>linux-firmware-ralink<br>linux-firmwa=
re-rtl8168<br>linux-firmware-rtl8188<br>linux-firmware-rtl8192ce<br>linux-f=
irmware-rtl8192cu<br>linux-firmware-rtl8192eu<br>linux-firmware-rtl8192su<b=
r>linux-firmware-rtl8723<br>linux-firmware-rtl8821<br>linux-firmware-rtl-li=
cense<br>linux-firmware-whence-license<br><br>after<br><br>libz1 aarch64 1.=
2.11-r0<br>linux-firmware all 1:20230515-r0<br>linux-firmware-adsp-sst all =
1:20230515-r0<br>linux-firmware-adsp-sst-license all 1:20230515-r0<br>linux=
-firmware-amlogic-vdec all 1:20230515-r0<br>linux-firmware-amlogic-vdec-lic=
ense all 1:20230515-r0<br>linux-firmware-ar3k all 1:20230515-r0<br>linux-fi=
rmware-ar3k-license all 1:20230515-r0<br>linux-firmware-ar9170 all 1:202305=
15-r0<br>linux-firmware-ath10k all 1:20230515-r0<br>linux-firmware-ath10k-l=
icense all 1:20230515-r0<br>linux-firmware-ath11k all 1:20230515-r0<br>linu=
x-firmware-ath6k all 1:20230515-r0<br>linux-firmware-ath9k all 1:20230515-r=
0<br>linux-firmware-atheros-license all 1:20230515-r0<br>linux-firmware-bcm=
-0bb4-0306 all 1:20230515-r0<br>linux-firmware-bcm43143 all 1:20230515-r0<b=
r>linux-firmware-bcm43236b all 1:20230515-r0<br>linux-firmware-bcm43241b0 a=
ll 1:20230515-r0<br>linux-firmware-bcm43241b4 all 1:20230515-r0<br>linux-fi=
rmware-bcm43241b5 all 1:20230515-r0<br>linux-firmware-bcm43242a all 1:20230=
515-r0<br>linux-firmware-bcm4329 all 1:20230515-r0<br>linux-firmware-bcm432=
9-fullmac all 1:20230515-r0<br>linux-firmware-bcm4330 all 1:20230515-r0<br>=
linux-firmware-bcm4334 all 1:20230515-r0<br>linux-firmware-bcm43340 all 1:2=
0230515-r0<br>linux-firmware-bcm4335 all 1:20230515-r0<br>linux-firmware-bc=
m43362 all 1:20230515-r0<br>linux-firmware-bcm4339 all 1:20230515-r0<br>lin=
ux-firmware-bcm43430 all 1:20230515-r0<br>linux-firmware-bcm43430a0 all 1:2=
0230515-r0<br>linux-firmware-bcm43455 all 1:20230515-r0<br>linux-firmware-b=
cm4350 all 1:20230515-r0<br>linux-firmware-bcm4350c2 all 1:20230515-r0<br>l=
inux-firmware-bcm4354 all 1:20230515-r0<br>linux-firmware-bcm4356 all 1:202=
30515-r0<br>linux-firmware-bcm4356-pcie all 1:20230515-r0<br>linux-firmware=
-bcm43569 all 1:20230515-r0<br>linux-firmware-bcm43570 all 1:20230515-r0<br=
>linux-firmware-bcm4358 all 1:20230515-r0<br>linux-firmware-bcm43602 all 1:=
20230515-r0<br>linux-firmware-bcm4366b all 1:20230515-r0<br>linux-firmware-=
bcm4366c all 1:20230515-r0<br>linux-firmware-bcm4371 all 1:20230515-r0<br>l=
inux-firmware-bcm4373 all 1:20230515-r0<br>linux-firmware-bcm43xx all 1:202=
30515-r0<br>linux-firmware-bcm43xx-hdr all 1:20230515-r0<br>linux-firmware-=
bnx2-mips all 1:20230515-r0<br>linux-firmware-broadcom-license all 1:202305=
15-r0<br>linux-firmware-carl9170 all 1:20230515-r0<br>linux-firmware-cypres=
s-license all 1:20230515-r0<br>linux-firmware-gplv2-license all 1:20230515-=
r0<br>linux-firmware-i915 all 1:20230515-r0<br>linux-firmware-i915-license =
all 1:20230515-r0<br>linux-firmware-ibt all 1:20230515-r0<br>linux-firmware=
-ibt-11-5 all 1:20230515-r0<br>linux-firmware-ibt-12-16 all 1:20230515-r0<b=
r>linux-firmware-ibt-17 all 1:20230515-r0<br>linux-firmware-ibt-20 all 1:20=
230515-r0<br>linux-firmware-ibt-hw-37-7 all 1:20230515-r0<br>linux-firmware=
-ibt-hw-37-8 all 1:20230515-r0<br>linux-firmware-ibt-license all 1:20230515=
-r0<br>linux-firmware-ibt-misc all 1:20230515-r0<br>linux-firmware-ice all =
1:20230515-r0<br>linux-firmware-ice-license all 1:20230515-r0<br>linux-firm=
ware-imx-sdma-imx6q all 1:20230515-r0<br>linux-firmware-imx-sdma-imx7d all =
1:20230515-r0<br>linux-firmware-imx-sdma-license all 1:20230515-r0<br>linux=
-firmware-iwlwifi all 1:20230515-r0<br>linux-firmware-iwlwifi-135-6 all 1:2=
0230515-r0<br>linux-firmware-iwlwifi-3160-17 all 1:20230515-r0<br>linux-fir=
mware-iwlwifi-6000-4 all 1:20230515-r0<br>linux-firmware-iwlwifi-6000g2a-6 =
all 1:20230515-r0<br>linux-firmware-iwlwifi-6000g2b-6 all 1:20230515-r0<br>=
linux-firmware-iwlwifi-6050-5 all 1:20230515-r0<br>linux-firmware-iwlwifi-7=
260 all 1:20230515-r0<br>linux-firmware-iwlwifi-7265 all 1:20230515-r0<br>l=
inux-firmware-iwlwifi-7265d all 1:20230515-r0<br>linux-firmware-iwlwifi-800=
0c all 1:20230515-r0<br>linux-firmware-iwlwifi-8265 all 1:20230515-r0<br>li=
nux-firmware-iwlwifi-9000 all 1:20230515-r0<br>linux-firmware-iwlwifi-licen=
se all 1:20230515-r0<br>linux-firmware-iwlwifi-misc all 1:20230515-r0<br>li=
nux-firmware-license all 1:20230515-r0<br>linux-firmware-liquidio all 1:202=
30515-r0<br>linux-firmware-lontium-license all 1:20230515-r0<br>linux-firmw=
are-lt9611uxc all 1:20230515-r0<br>linux-firmware-marvell-license all 1:202=
30515-r0<br>linux-firmware-mt7601u all 1:20230515-r0<br>linux-firmware-mt76=
01u-license all 1:20230515-r0<br>linux-firmware-netronome all 1:20230515-r0=
<br>linux-firmware-netronome-license all 1:20230515-r0<br>linux-firmware-nv=
idia-gpu all 1:20230515-r0<br>linux-firmware-nvidia-license all 1:20230515-=
r0<br>linux-firmware-nvidia-tegra all 1:20230515-r0<br>linux-firmware-nvidi=
a-tegra-k1 all 1:20230515-r0<br>linux-firmware-pcie8897 all 1:20230515-r0<b=
r>linux-firmware-pcie8997 all 1:20230515-r0<br>linux-firmware-qat all 1:202=
30515-r0<br>linux-firmware-qat-license all 1:20230515-r0<br>linux-firmware-=
qca all 1:20230515-r0<br>linux-firmware-qcom-adreno-a2xx all 1:20230515-r0<=
br>linux-firmware-qcom-adreno-a3xx all 1:20230515-r0<br>linux-firmware-qcom=
-adreno-a4xx all 1:20230515-r0<br>linux-firmware-qcom-adreno-a530 all 1:202=
30515-r0<br>linux-firmware-qcom-adreno-a630 all 1:20230515-r0<br>linux-firm=
ware-qcom-adreno-a650 all 1:20230515-r0<br>linux-firmware-qcom-adreno-a660 =
all 1:20230515-r0<br>linux-firmware-qcom-apq8096-audio all 1:20230515-r0<br=
>linux-firmware-qcom-apq8096-modem all 1:20230515-r0<br>linux-firmware-qcom=
-license all 1:20230515-r0<br>linux-firmware-qcom-sc8280xp-lenovo-x13s-adre=
no all 1:20230515-r0<br>linux-firmware-qcom-sc8280xp-lenovo-x13s-audio all =
1:20230515-r0<br>linux-firmware-qcom-sc8280xp-lenovo-x13s-compat all 1:2023=
0515-r0<br>linux-firmware-qcom-sc8280xp-lenovo-x13s-compute all 1:20230515-=
r0<br>linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors all 1:20230515-r0<br=
>linux-firmware-qcom-sdm845-audio all 1:20230515-r0<br>linux-firmware-qcom-=
sdm845-compute all 1:20230515-r0<br>linux-firmware-qcom-sdm845-modem all 1:=
20230515-r0<br>linux-firmware-qcom-sm8250-audio all 1:20230515-r0<br>linux-=
firmware-qcom-sm8250-compute all 1:20230515-r0<br>linux-firmware-qcom-venus=
-1.8 all 1:20230515-r0<br>linux-firmware-qcom-venus-4.2 all 1:20230515-r0<b=
r>linux-firmware-qcom-venus-5.2 all 1:20230515-r0<br>linux-firmware-qcom-ve=
nus-5.4 all 1:20230515-r0<br>linux-firmware-qcom-vpu-1.0 all 1:20230515-r0<=
br>linux-firmware-qcom-vpu-2.0 all 1:20230515-r0<br>linux-firmware-qcom-yam=
ato-license all 1:20230515-r0<br>linux-firmware-radeon all 1:20230515-r0<br=
>linux-firmware-radeon-license all 1:20230515-r0<br>linux-firmware-ralink a=
ll 1:20230515-r0<br>linux-firmware-ralink-license all 1:20230515-r0<br>linu=
x-firmware-rs9113 all 1:20230515-r0<br>linux-firmware-rs9116 all 1:20230515=
-r0<br>linux-firmware-rtl-license all 1:20230515-r0<br>linux-firmware-rtl81=
68 all 1:20230515-r0<br>linux-firmware-rtl8188 all 1:20230515-r0<br>linux-f=
irmware-rtl8192ce all 1:20230515-r0<br>linux-firmware-rtl8192cu all 1:20230=
515-r0<br>linux-firmware-rtl8192eu all 1:20230515-r0<br>linux-firmware-rtl8=
192su all 1:20230515-r0<br>linux-firmware-rtl8723 all 1:20230515-r0<br>linu=
x-firmware-rtl8821 all 1:20230515-r0<br>linux-firmware-sd8686 all 1:2023051=
5-r0<br>linux-firmware-sd8688 all 1:20230515-r0<br>linux-firmware-sd8787 al=
l 1:20230515-r0<br>linux-firmware-sd8797 all 1:20230515-r0<br>linux-firmwar=
e-sd8801 all 1:20230515-r0<br>linux-firmware-sd8887 all 1:20230515-r0<br>li=
nux-firmware-sd8897 all 1:20230515-r0<br>linux-firmware-sd8997 all 1:202305=
15-r0<br>linux-firmware-ti-connectivity-license all 1:20230515-r0<br>linux-=
firmware-usb8997 all 1:20230515-r0<br>linux-firmware-vt6656 all 1:20230515-=
r0<br>linux-firmware-vt6656-license all 1:20230515-r0<br>linux-firmware-whe=
nce-license all 1:20230515-r0<br>linux-firmware-wl12xx all 1:20230515-r0<br=
>linux-firmware-wl18xx all 1:20230515-r0<br>linux-firmware-wlcommon all 1:2=
0230515-r0<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Am Di., 25. Juli 2023 um 11:52=C2=A0Uhr schrieb Alexander K=
anavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex=
.kanavin@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Tue, 25 Jul 2023 at 11:28, Andreas &lt;<a href=3D"mailto:reh=
n.andreas86@gmail.com" target=3D"_blank">rehn.andreas86@gmail.com</a>&gt; w=
rote:<br>
&gt; i encountered issues with the new poky release on dunfell.<br>
&gt; explicitly linux-firmware: commit hash a04b507d39d668a02b7ebd990c94194=
cde16bf2f<br>
&gt;<br>
&gt; i building dunfell images since 1,5 years and my images are normaly 1,=
9 GB big.<br>
&gt; however since Sunday 23.07, the image size increases by 1GB due to the=
 full firmware installation.<br>
&gt;<br>
&gt; i double checked it with the previous commit 0bf993da8b6e6511a4123ed15=
421bdd76a4c1f38 and the image size is as expected.<br>
&gt;<br>
&gt; i hope someone is able to help, because this is an unexpected behavior=
.<br>
&gt;<br>
&gt; PS: this my first post so please have mercy on me. :)<br>
<br>
Can you enable buildhistory as described in<br>
<a href=3D"https://docs.yoctoproject.org/dev/dev-manual/build-quality.html"=
 rel=3D"noreferrer" target=3D"_blank">https://docs.yoctoproject.org/dev/dev=
-manual/build-quality.html</a><br>
then build linux-firmware before and after the change, then run<br>
buildhistory-diff? That should highlight where the size increase come<br>
from in its packaging.<br>
<br>
You can also manually inspect linux-firmware&#39;s ${WORKDIR}/packages-spit=
/.<br>
<br>
Alex<br>
</blockquote></div><br clear=3D"all"><div><br></div>Andreas<br></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184838): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184838" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184838</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100346886/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100346886/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div><br><div>Andreas</div></div>

--00000000000094e35206014f0a82--

