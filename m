Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539ABC001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 13:07:24 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.19835.1690290441608267481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 06:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iCJOMO8e;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-317716a4622so115262f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 06:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690290440; x=1690895240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R18PM/aFA7b5e3eyvGBoqttXcrHhqVS0eJ1930mvCP0=;
        b=iCJOMO8eBAK2wpR75ixufGLlI4Bbu33UGICpkKCipPibC2M3R1MSnIl4XLYnYi8KKn
         pxrVKB3gFhVH6K+xOjdASdkzc1gQ72r6vdZ0f0zlViyedKdYxnmlT55W2oUbbQxlBCyt
         IF4J6XtRxL0FFFpxmRyXylvWTlBIHhqYSbE0WDJuNG0N5Tvs18PV4a9wPgjFklcf9+yM
         bawCXxXf4g/E9KR4WdFF+OmlC3T3nHeYJMtl5us1r4oglz39K0ATkvpn2HMpdCic4mMb
         33rIqfEt3S4SSH+2vYyG2Pdd+vOkjNGLTEWEifLzWr7jgY1i9SnNSo5KbnbshhpMfAdF
         gPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690290440; x=1690895240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R18PM/aFA7b5e3eyvGBoqttXcrHhqVS0eJ1930mvCP0=;
        b=kF4Gtq860XPqChIQEX0lJJSrMISylMySCVGzIbQ/7AMd+TMdttZvHwaNKIHWGBApz6
         9OuSTw1nvswmvaf/UcE4L2fXl+cBfKAVwNwcTfxRjKoy8P+37FbdyNxsbhhxWLe2UPqZ
         w7MppXOYP/XuSLeGy4QURUvJJ/qS1AM3LcwNiCVBM2xs6kT9Ai9LsgXUo1SFalIswaXA
         bw//Ox38ZVGBeaVRfF3H8U1ZkybMhD6cel5XeAg04jraBENFEsxFDcnUBIhIbtYcTGpG
         fMdtAaoeL/YHU6gO/aSkghv3252AmgupHM1EQ3+D+eqEFCYUHAH1kYjoWbYVBdzquXxs
         xBnA==
X-Gm-Message-State: ABy/qLZOFZIqjHIo9mWNCjabDQ7wqqaUaol7+WnSHXaH30yl1mZj5mK/
	klGPjZzeE+h4FFO7ghYsNciqCcMUD94rhN8ZGB4=
X-Google-Smtp-Source: APBJJlHNYDLVIEt5gYJd/is2He8hOQy09x7EOkXp4/R64MvikONcap8zseY396uDXos8IeAC4EQsd09TOV55HcglMtE=
X-Received: by 2002:a5d:504d:0:b0:317:6be9:538a with SMTP id
 h13-20020a5d504d000000b003176be9538amr1186014wrt.20.1690290439845; Tue, 25
 Jul 2023 06:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <7JrI.1690277290613913360.PhKO@lists.openembedded.org>
 <CANNYZj_tCWzW84+yVSRXECpodY=XetmNXzVbMgwcQR5Cn-zORA@mail.gmail.com>
 <CAPmT5DeEKag1p7kebruEyVH2T0nFKxEXw9GOHTSvwKvajf5Lmg@mail.gmail.com>
 <CA+chaQdGrht-VJORDvwL=QNEmXx5Q7aZqoEPN2vAiTM1DOZJyA@mail.gmail.com> <CAPmT5Dd6+C=c-yhBMAV-b8=7N8_+qtRg1gN1eTkS7apwzPnQUA@mail.gmail.com>
In-Reply-To: <CAPmT5Dd6+C=c-yhBMAV-b8=7N8_+qtRg1gN1eTkS7apwzPnQUA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 25 Jul 2023 15:07:03 +0200
Message-ID: <CA+chaQe1B0wmGFVFpxT3io2_YEQ8sFOq95+RUHYfvfmw-umWkw@mail.gmail.com>
Subject: Re: [OE-core] dunfell: poky 3.1.27 - full linux-firmware always in image
To: Andreas Rehn <rehn.andreas86@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003bff9706014f69dc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 13:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184842

--0000000000003bff9706014f69dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That shows you that e.g. linux-firmware-mt7601u now depends on
linux-firmware:

"linux-firmware-mt7601u" -> "linux-firmware"
"linux-firmware-mt7601u" -> "linux-firmware-mt7601u-license"

now use bitbake-getvar or bitbake -e to figure out this happens for you
(doesn't for me). Probably some other layer your're using. If you reply
again with "bitbake -e" output without any initiative to actually debug it
yourself, I won't reply.

On Tue, Jul 25, 2023 at 2:40=E2=80=AFPM Andreas Rehn <rehn.andreas86@gmail.=
com>
wrote:

> before:
> "linux-firmware-mt7601u" -> "linux-firmware-mt7601u-license"
> "linux-firmware-ralink" -> "linux-firmware-ralink-license"
> "linux-firmware-rtl8168" -> "linux-firmware-whence-license"
> "linux-firmware-rtl8188" -> "linux-firmware-rtl-license"
> "linux-firmware-rtl8192ce" -> "linux-firmware-rtl-license"
> "linux-firmware-rtl8192cu" -> "linux-firmware-rtl-license"
> "linux-firmware-rtl8192eu" -> "linux-firmware-rtl-license"
> "linux-firmware-rtl8192su" -> "linux-firmware-rtl-license"
> "linux-firmware-rtl8723" -> "linux-firmware-rtl-license"
> "linux-firmware-rtl8821" -> "linux-firmware-rtl-license"
>
> after:
> "linux-firmware-adsp-sst" -> "linux-firmware"
> "linux-firmware-adsp-sst" -> "linux-firmware-adsp-sst-license"
> "linux-firmware-amlogic-vdec" -> "linux-firmware-amlogic-vdec-license"
> "linux-firmware-ar3k" -> "linux-firmware-ar3k-license"
> "linux-firmware-ar3k" -> "linux-firmware-atheros-license"
> "linux-firmware-ar9170" -> "linux-firmware-atheros-license"
> "linux-firmware-ath10k" -> "linux-firmware-ath10k-license"
> "linux-firmware-ath11k" -> "linux-firmware-ath10k-license"
> "linux-firmware-ath6k" -> "linux-firmware-atheros-license"
> "linux-firmware-ath9k" -> "linux-firmware-atheros-license"
> "linux-firmware-bcm-0bb4-0306" -> "linux-firmware-cypress-license"
> "linux-firmware-bcm43143" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm43236b" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm43241b0" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm43241b4" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm43241b5" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm43242a" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4329-fullmac" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4329" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4330" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm43340" -> "linux-firmware-cypress-license"
> "linux-firmware-bcm4334" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4335" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm43362" -> "linux-firmware-cypress-license"
> "linux-firmware-bcm4339" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm43430a0" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm43430" -> "linux-firmware-cypress-license"
> "linux-firmware-bcm43455" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4350c2" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4350" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4354" -> "linux-firmware-cypress-license"
> "linux-firmware-bcm43569" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4356" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4356-pcie" -> "linux-firmware-cypress-license"
> "linux-firmware-bcm43570" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4358" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm43602" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4366b" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4366c" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4371" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm4373" -> "linux-firmware"
> "linux-firmware-bcm4373" -> "linux-firmware-cypress-license"
> "linux-firmware-bcm43xx-hdr" -> "linux-firmware-broadcom-license"
> "linux-firmware-bcm43xx" -> "linux-firmware-broadcom-license"
> "linux-firmware-bnx2-mips" -> "linux-firmware-whence-license"
> "linux-firmware-carl9170" -> "linux-firmware-gplv2-license"
> "linux-firmware-i915" -> "linux-firmware-i915-license"
> "linux-firmware-ibt-11-5" -> "linux-firmware-ibt-license"
> "linux-firmware-ibt-12-16" -> "linux-firmware-ibt-license"
> "linux-firmware-ibt-17" -> "linux-firmware-ibt-license"
> "linux-firmware-ibt-20" -> "linux-firmware-ibt-license"
> "linux-firmware-ibt-hw-37-7" -> "linux-firmware-ibt-license"
> "linux-firmware-ibt" -> "linux-firmware-ibt-11-5" [style=3Ddotted]
> "linux-firmware-ibt" -> "linux-firmware-ibt-12-16" [style=3Ddotted]
> "linux-firmware-ibt" -> "linux-firmware-ibt-17" [style=3Ddotted]
> "linux-firmware-ibt" -> "linux-firmware-ibt-20" [style=3Ddotted]
> "linux-firmware-ibt" -> "linux-firmware-ibt-hw-37-7" [style=3Ddotted]
> "linux-firmware-ibt" -> "linux-firmware-ibt-hw-37-8" [style=3Ddotted]
> "linux-firmware-ibt" -> "linux-firmware-ibt-license" [style=3Ddotted]
> "linux-firmware-ibt" -> "linux-firmware-ibt-misc" [style=3Ddotted]
> "linux-firmware-ibt-misc" -> "linux-firmware-ibt-license"
> "linux-firmware-ice" -> "linux-firmware-ice-license"
> "linux-firmware-imx-sdma-imx6q" -> "linux-firmware-imx-sdma-license"
> "linux-firmware-imx-sdma-imx7d" -> "linux-firmware-imx-sdma-license"
> "linux-firmware-iwlwifi-135-6" -> "linux-firmware-iwlwifi-license"
> "linux-firmware-iwlwifi-3160-17" -> "linux-firmware-iwlwifi-license"
> "linux-firmware-iwlwifi-6000-4" -> "linux-firmware-iwlwifi-license"
> "linux-firmware-iwlwifi-6000g2a-6" -> "linux-firmware-iwlwifi-license"
> "linux-firmware-iwlwifi-6000g2b-6" -> "linux-firmware-iwlwifi-license"
> "linux-firmware-iwlwifi-6050-5" -> "linux-firmware-iwlwifi-license"
> "linux-firmware-iwlwifi-7260" -> "linux-firmware-iwlwifi-license"
> "linux-firmware-iwlwifi-7265d" -> "linux-firmware-iwlwifi-license"
> "linux-firmware-iwlwifi-7265" -> "linux-firmware-iwlwifi-license"
> "linux-firmware-iwlwifi-8000c" -> "linux-firmware-iwlwifi-license"
> "linux-firmware-iwlwifi-8265" -> "linux-firmware-iwlwifi-license"
> "linux-firmware-iwlwifi-9000" -> "linux-firmware-iwlwifi-license"
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-135-6" [style=3Ddotte=
d]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-10" [style=3Ddot=
ted]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-12" [style=3Ddot=
ted]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-13" [style=3Ddot=
ted]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-16" [style=3Ddot=
ted]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-17" [style=3Ddot=
ted]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-7" [style=3Ddott=
ed]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-8" [style=3Ddott=
ed]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-9" [style=3Ddott=
ed]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000-4" [style=3Ddott=
ed]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2a-5"
> [style=3Ddotted]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2a-6"
> [style=3Ddotted]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2b-5"
> [style=3Ddotted]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2b-6"
> [style=3Ddotted]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6050-4" [style=3Ddott=
ed]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6050-5" [style=3Ddott=
ed]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-7260" [style=3Ddotted=
]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-7265d" [style=3Ddotte=
d]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-7265" [style=3Ddotted=
]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-8000c" [style=3Ddotte=
d]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-8265" [style=3Ddotted=
]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-9000" [style=3Ddotted=
]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-license" [style=3Ddot=
ted]
> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-misc" [style=3Ddotted=
]
> "linux-firmware-iwlwifi-misc" -> "linux-firmware-iwlwifi-license"
> "linux-firmware" -> "linux-firmware-adsp-sst-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-adsp-sst" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-amlogic-vdec-license" [style=3Ddotted=
]
> "linux-firmware" -> "linux-firmware-amlogic-vdec" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ar3k-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ar3k" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ar9170" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ath10k-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ath10k" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ath11k" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ath6k" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ath9k" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-atheros-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm-0bb4-0306"
> "linux-firmware" -> "linux-firmware-bcm-0bb4-0306" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43143" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43236b" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43241b0" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43241b4" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43241b5" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43242a" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4329-fullmac" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4329" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4330" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43340" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4334" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4335" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43362" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4339" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43430a0" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43430" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43455" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4350c2" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4350" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4354" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43569" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4356-pcie" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4356" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43570" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4358" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43602" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4366b" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4366c" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4371" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm4373" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43xx-hdr" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bcm43xx" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-bnx2-mips" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-broadcom-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-carl9170" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-cypress-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-gplv2-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-i915-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-i915" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ibt-11-5" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ibt-12-16" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ibt-17" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ibt-20" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ibt-hw-37-7" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ibt-hw-37-8" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ibt-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ibt-misc" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ibt" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ice-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ice" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-imx-sdma-imx6q" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-imx-sdma-imx7d" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-imx-sdma-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-135-6" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-3160-10" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-3160-12" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-3160-13" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-3160-16" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-3160-17" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-3160-7" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-3160-8" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-3160-9" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-6000-4" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-6000g2a-5" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-6000g2a-6" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-6000g2b-5" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-6000g2b-6" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-6050-4" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-6050-5" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-7260" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-7265d" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-7265" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-8000c" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-8265" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-9000" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi-misc" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-iwlwifi" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-license"
> "linux-firmware" -> "linux-firmware-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-liquidio" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-lontium-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-lt9611uxc" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-marvell-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-mt7601u-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-mt7601u" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-netronome-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-netronome" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-nvidia-gpu" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-nvidia-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-nvidia-tegra-k1" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-nvidia-tegra" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-pcie8897" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-pcie8997" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qat-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qat" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qca" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-adreno-a2xx" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-adreno-a3xx" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-adreno-a4xx" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-adreno-a530" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-adreno-a630" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-adreno-a650" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-adreno-a660" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-apq8096-audio" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-apq8096-modem" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno"
> [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio"
> [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compat"
> [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compute"
> [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors"
> [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-sdm845-audio" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-sdm845-compute" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-sdm845-modem" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-sm8250-audio" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-sm8250-compute" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-venus-1.8" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-venus-4.2" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-venus-5.2" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-venus-5.4" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-vpu-1.0" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-vpu-2.0" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-qcom-yamato-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-radeon-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-radeon" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ralink-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ralink" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-rs9113" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-rs9116" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-rtl8168" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-rtl8188" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-rtl8192ce" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-rtl8192cu" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-rtl8192eu"
> "linux-firmware" -> "linux-firmware-rtl8192eu" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-rtl8192su" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-rtl8723" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-rtl8821" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-rtl-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-sd8686" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-sd8688" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-sd8787" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-sd8797" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-sd8801" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-sd8887" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-sd8897" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-sd8997" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-ti-connectivity-license" [style=3Ddot=
ted]
> "linux-firmware" -> "linux-firmware-usb8997" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-vt6656-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-vt6656" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-whence-license"
> "linux-firmware" -> "linux-firmware-whence-license" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-wl12xx" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-wl18xx" [style=3Ddotted]
> "linux-firmware" -> "linux-firmware-wlcommon" [style=3Ddotted]
> "linux-firmware-mt7601u" -> "linux-firmware"
> "linux-firmware-mt7601u" -> "linux-firmware-mt7601u-license"
> "linux-firmware-netronome" -> "linux-firmware-netronome-license"
> "linux-firmware-nvidia-gpu" -> "linux-firmware-nvidia-license"
> "linux-firmware-nvidia-tegra-k1" -> "linux-firmware-nvidia-license"
> "linux-firmware-nvidia-tegra" -> "linux-firmware-nvidia-gpu"
> "linux-firmware-nvidia-tegra" -> "linux-firmware-nvidia-license"
> "linux-firmware-qat" -> "linux-firmware-qat-license"
> "linux-firmware-qca" -> "linux-firmware-ath10k-license"
> "linux-firmware-qcom-adreno-a2xx" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-adreno-a2xx" -> "linux-firmware-qcom-yamato-license"
> "linux-firmware-qcom-adreno-a4xx" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-adreno-a530" -> "linux-firmware"
> "linux-firmware-qcom-adreno-a530" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-adreno-a630" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-adreno-a650" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-adreno-a660" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-apq8096-audio" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-apq8096-modem" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno" ->
> "linux-firmware-qcom-license"
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno" ->
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio" ->
> "linux-firmware-qcom-license"
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio" ->
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compute" ->
> "linux-firmware-qcom-license"
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compute" ->
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors" ->
> "linux-firmware-qcom-license"
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors" ->
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
> "linux-firmware-qcom-sdm845-audio" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-sdm845-compute" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-sdm845-modem" -> "linux-firmware-ath10k"
> "linux-firmware-qcom-sdm845-modem" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-sm8250-audio" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-sm8250-compute" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-venus-1.8" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-venus-4.2" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-venus-5.2" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-venus-5.4" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-vpu-1.0" -> "linux-firmware-qcom-license"
> "linux-firmware-qcom-vpu-2.0" -> "linux-firmware-qcom-license"
> "linux-firmware-radeon" -> "linux-firmware-radeon-license"
> "linux-firmware-ralink" -> "linux-firmware-ralink-license"
> "linux-firmware-rs9113" -> "linux-firmware-whence-license"
> "linux-firmware-rs9116" -> "linux-firmware-whence-license"
> "linux-firmware-rtl8168" -> "linux-firmware-whence-license"
> "linux-firmware-rtl8188" -> "linux-firmware-rtl-license"
> "linux-firmware-rtl8192ce" -> "linux-firmware-rtl-license"
> "linux-firmware-rtl8192cu" -> "linux-firmware-rtl-license"
> "linux-firmware-rtl8192eu" -> "linux-firmware-rtl-license"
> "linux-firmware-rtl8192su" -> "linux-firmware-rtl-license"
> "linux-firmware-rtl8723" -> "linux-firmware-rtl-license"
> "linux-firmware-rtl8821" -> "linux-firmware-rtl-license"
> "linux-firmware-sd8686" -> "linux-firmware-marvell-license"
> "linux-firmware-sd8688" -> "linux-firmware-marvell-license"
> "linux-firmware-sd8787" -> "linux-firmware-marvell-license"
> "linux-firmware-sd8797" -> "linux-firmware-marvell-license"
> "linux-firmware-sd8801" -> "linux-firmware-marvell-license"
> "linux-firmware-sd8887" -> "linux-firmware-marvell-license"
> "linux-firmware-sd8897" -> "linux-firmware-marvell-license"
> "linux-firmware-sd8997" -> "linux-firmware-marvell-license"
> "linux-firmware-usb8997" -> "linux-firmware-marvell-license"
> "linux-firmware-vt6656" -> "linux-firmware-vt6656-license"
> "linux-firmware-wl12xx" -> "linux-firmware-ti-connectivity-license"
> "linux-firmware-wl12xx" -> "linux-firmware-wlcommon"
> "linux-firmware-wl18xx" -> "linux-firmware-ti-connectivity-license"
> "linux-firmware-wl18xx" -> "linux-firmware-wlcommon"
>
> Am Di., 25. Juli 2023 um 14:20 Uhr schrieb Martin Jansa <
> martin.jansa@gmail.com>:
>
>> now figure out what depends on linux-firmware from your image
>>
>> grep linux-firmware
>> buildhistory/images/your-machine/your-libc/your-image/depends.dot
>>
>> and then git log will help you with the rest (FWIW: I don't see
>> linux-firmware in our dunfell images).
>>
>> On Tue, Jul 25, 2023 at 2:01=E2=80=AFPM Andreas Rehn <rehn.andreas86@gma=
il.com>
>> wrote:
>>
>>> hey alex,
>>> thx for have a look
>>>
>>> before
>>>
>>> linux-firmware-mt7601u-license
>>> linux-firmware-mt7601u
>>> linux-firmware-ralink-license
>>> linux-firmware-ralink
>>> linux-firmware-rtl8168
>>> linux-firmware-rtl8188
>>> linux-firmware-rtl8192ce
>>> linux-firmware-rtl8192cu
>>> linux-firmware-rtl8192eu
>>> linux-firmware-rtl8192su
>>> linux-firmware-rtl8723
>>> linux-firmware-rtl8821
>>> linux-firmware-rtl-license
>>> linux-firmware-whence-license
>>>
>>> after
>>>
>>> libz1 aarch64 1.2.11-r0
>>> linux-firmware all 1:20230515-r0
>>> linux-firmware-adsp-sst all 1:20230515-r0
>>> linux-firmware-adsp-sst-license all 1:20230515-r0
>>> linux-firmware-amlogic-vdec all 1:20230515-r0
>>> linux-firmware-amlogic-vdec-license all 1:20230515-r0
>>> linux-firmware-ar3k all 1:20230515-r0
>>> linux-firmware-ar3k-license all 1:20230515-r0
>>> linux-firmware-ar9170 all 1:20230515-r0
>>> linux-firmware-ath10k all 1:20230515-r0
>>> linux-firmware-ath10k-license all 1:20230515-r0
>>> linux-firmware-ath11k all 1:20230515-r0
>>> linux-firmware-ath6k all 1:20230515-r0
>>> linux-firmware-ath9k all 1:20230515-r0
>>> linux-firmware-atheros-license all 1:20230515-r0
>>> linux-firmware-bcm-0bb4-0306 all 1:20230515-r0
>>> linux-firmware-bcm43143 all 1:20230515-r0
>>> linux-firmware-bcm43236b all 1:20230515-r0
>>> linux-firmware-bcm43241b0 all 1:20230515-r0
>>> linux-firmware-bcm43241b4 all 1:20230515-r0
>>> linux-firmware-bcm43241b5 all 1:20230515-r0
>>> linux-firmware-bcm43242a all 1:20230515-r0
>>> linux-firmware-bcm4329 all 1:20230515-r0
>>> linux-firmware-bcm4329-fullmac all 1:20230515-r0
>>> linux-firmware-bcm4330 all 1:20230515-r0
>>> linux-firmware-bcm4334 all 1:20230515-r0
>>> linux-firmware-bcm43340 all 1:20230515-r0
>>> linux-firmware-bcm4335 all 1:20230515-r0
>>> linux-firmware-bcm43362 all 1:20230515-r0
>>> linux-firmware-bcm4339 all 1:20230515-r0
>>> linux-firmware-bcm43430 all 1:20230515-r0
>>> linux-firmware-bcm43430a0 all 1:20230515-r0
>>> linux-firmware-bcm43455 all 1:20230515-r0
>>> linux-firmware-bcm4350 all 1:20230515-r0
>>> linux-firmware-bcm4350c2 all 1:20230515-r0
>>> linux-firmware-bcm4354 all 1:20230515-r0
>>> linux-firmware-bcm4356 all 1:20230515-r0
>>> linux-firmware-bcm4356-pcie all 1:20230515-r0
>>> linux-firmware-bcm43569 all 1:20230515-r0
>>> linux-firmware-bcm43570 all 1:20230515-r0
>>> linux-firmware-bcm4358 all 1:20230515-r0
>>> linux-firmware-bcm43602 all 1:20230515-r0
>>> linux-firmware-bcm4366b all 1:20230515-r0
>>> linux-firmware-bcm4366c all 1:20230515-r0
>>> linux-firmware-bcm4371 all 1:20230515-r0
>>> linux-firmware-bcm4373 all 1:20230515-r0
>>> linux-firmware-bcm43xx all 1:20230515-r0
>>> linux-firmware-bcm43xx-hdr all 1:20230515-r0
>>> linux-firmware-bnx2-mips all 1:20230515-r0
>>> linux-firmware-broadcom-license all 1:20230515-r0
>>> linux-firmware-carl9170 all 1:20230515-r0
>>> linux-firmware-cypress-license all 1:20230515-r0
>>> linux-firmware-gplv2-license all 1:20230515-r0
>>> linux-firmware-i915 all 1:20230515-r0
>>> linux-firmware-i915-license all 1:20230515-r0
>>> linux-firmware-ibt all 1:20230515-r0
>>> linux-firmware-ibt-11-5 all 1:20230515-r0
>>> linux-firmware-ibt-12-16 all 1:20230515-r0
>>> linux-firmware-ibt-17 all 1:20230515-r0
>>> linux-firmware-ibt-20 all 1:20230515-r0
>>> linux-firmware-ibt-hw-37-7 all 1:20230515-r0
>>> linux-firmware-ibt-hw-37-8 all 1:20230515-r0
>>> linux-firmware-ibt-license all 1:20230515-r0
>>> linux-firmware-ibt-misc all 1:20230515-r0
>>> linux-firmware-ice all 1:20230515-r0
>>> linux-firmware-ice-license all 1:20230515-r0
>>> linux-firmware-imx-sdma-imx6q all 1:20230515-r0
>>> linux-firmware-imx-sdma-imx7d all 1:20230515-r0
>>> linux-firmware-imx-sdma-license all 1:20230515-r0
>>> linux-firmware-iwlwifi all 1:20230515-r0
>>> linux-firmware-iwlwifi-135-6 all 1:20230515-r0
>>> linux-firmware-iwlwifi-3160-17 all 1:20230515-r0
>>> linux-firmware-iwlwifi-6000-4 all 1:20230515-r0
>>> linux-firmware-iwlwifi-6000g2a-6 all 1:20230515-r0
>>> linux-firmware-iwlwifi-6000g2b-6 all 1:20230515-r0
>>> linux-firmware-iwlwifi-6050-5 all 1:20230515-r0
>>> linux-firmware-iwlwifi-7260 all 1:20230515-r0
>>> linux-firmware-iwlwifi-7265 all 1:20230515-r0
>>> linux-firmware-iwlwifi-7265d all 1:20230515-r0
>>> linux-firmware-iwlwifi-8000c all 1:20230515-r0
>>> linux-firmware-iwlwifi-8265 all 1:20230515-r0
>>> linux-firmware-iwlwifi-9000 all 1:20230515-r0
>>> linux-firmware-iwlwifi-license all 1:20230515-r0
>>> linux-firmware-iwlwifi-misc all 1:20230515-r0
>>> linux-firmware-license all 1:20230515-r0
>>> linux-firmware-liquidio all 1:20230515-r0
>>> linux-firmware-lontium-license all 1:20230515-r0
>>> linux-firmware-lt9611uxc all 1:20230515-r0
>>> linux-firmware-marvell-license all 1:20230515-r0
>>> linux-firmware-mt7601u all 1:20230515-r0
>>> linux-firmware-mt7601u-license all 1:20230515-r0
>>> linux-firmware-netronome all 1:20230515-r0
>>> linux-firmware-netronome-license all 1:20230515-r0
>>> linux-firmware-nvidia-gpu all 1:20230515-r0
>>> linux-firmware-nvidia-license all 1:20230515-r0
>>> linux-firmware-nvidia-tegra all 1:20230515-r0
>>> linux-firmware-nvidia-tegra-k1 all 1:20230515-r0
>>> linux-firmware-pcie8897 all 1:20230515-r0
>>> linux-firmware-pcie8997 all 1:20230515-r0
>>> linux-firmware-qat all 1:20230515-r0
>>> linux-firmware-qat-license all 1:20230515-r0
>>> linux-firmware-qca all 1:20230515-r0
>>> linux-firmware-qcom-adreno-a2xx all 1:20230515-r0
>>> linux-firmware-qcom-adreno-a3xx all 1:20230515-r0
>>> linux-firmware-qcom-adreno-a4xx all 1:20230515-r0
>>> linux-firmware-qcom-adreno-a530 all 1:20230515-r0
>>> linux-firmware-qcom-adreno-a630 all 1:20230515-r0
>>> linux-firmware-qcom-adreno-a650 all 1:20230515-r0
>>> linux-firmware-qcom-adreno-a660 all 1:20230515-r0
>>> linux-firmware-qcom-apq8096-audio all 1:20230515-r0
>>> linux-firmware-qcom-apq8096-modem all 1:20230515-r0
>>> linux-firmware-qcom-license all 1:20230515-r0
>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno all 1:20230515-r0
>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-audio all 1:20230515-r0
>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-compat all 1:20230515-r0
>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-compute all 1:20230515-r0
>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors all 1:20230515-r0
>>> linux-firmware-qcom-sdm845-audio all 1:20230515-r0
>>> linux-firmware-qcom-sdm845-compute all 1:20230515-r0
>>> linux-firmware-qcom-sdm845-modem all 1:20230515-r0
>>> linux-firmware-qcom-sm8250-audio all 1:20230515-r0
>>> linux-firmware-qcom-sm8250-compute all 1:20230515-r0
>>> linux-firmware-qcom-venus-1.8 all 1:20230515-r0
>>> linux-firmware-qcom-venus-4.2 all 1:20230515-r0
>>> linux-firmware-qcom-venus-5.2 all 1:20230515-r0
>>> linux-firmware-qcom-venus-5.4 all 1:20230515-r0
>>> linux-firmware-qcom-vpu-1.0 all 1:20230515-r0
>>> linux-firmware-qcom-vpu-2.0 all 1:20230515-r0
>>> linux-firmware-qcom-yamato-license all 1:20230515-r0
>>> linux-firmware-radeon all 1:20230515-r0
>>> linux-firmware-radeon-license all 1:20230515-r0
>>> linux-firmware-ralink all 1:20230515-r0
>>> linux-firmware-ralink-license all 1:20230515-r0
>>> linux-firmware-rs9113 all 1:20230515-r0
>>> linux-firmware-rs9116 all 1:20230515-r0
>>> linux-firmware-rtl-license all 1:20230515-r0
>>> linux-firmware-rtl8168 all 1:20230515-r0
>>> linux-firmware-rtl8188 all 1:20230515-r0
>>> linux-firmware-rtl8192ce all 1:20230515-r0
>>> linux-firmware-rtl8192cu all 1:20230515-r0
>>> linux-firmware-rtl8192eu all 1:20230515-r0
>>> linux-firmware-rtl8192su all 1:20230515-r0
>>> linux-firmware-rtl8723 all 1:20230515-r0
>>> linux-firmware-rtl8821 all 1:20230515-r0
>>> linux-firmware-sd8686 all 1:20230515-r0
>>> linux-firmware-sd8688 all 1:20230515-r0
>>> linux-firmware-sd8787 all 1:20230515-r0
>>> linux-firmware-sd8797 all 1:20230515-r0
>>> linux-firmware-sd8801 all 1:20230515-r0
>>> linux-firmware-sd8887 all 1:20230515-r0
>>> linux-firmware-sd8897 all 1:20230515-r0
>>> linux-firmware-sd8997 all 1:20230515-r0
>>> linux-firmware-ti-connectivity-license all 1:20230515-r0
>>> linux-firmware-usb8997 all 1:20230515-r0
>>> linux-firmware-vt6656 all 1:20230515-r0
>>> linux-firmware-vt6656-license all 1:20230515-r0
>>> linux-firmware-whence-license all 1:20230515-r0
>>> linux-firmware-wl12xx all 1:20230515-r0
>>> linux-firmware-wl18xx all 1:20230515-r0
>>> linux-firmware-wlcommon all 1:20230515-r0
>>>
>>> Am Di., 25. Juli 2023 um 11:52 Uhr schrieb Alexander Kanavin <
>>> alex.kanavin@gmail.com>:
>>>
>>>> On Tue, 25 Jul 2023 at 11:28, Andreas <rehn.andreas86@gmail.com> wrote=
:
>>>> > i encountered issues with the new poky release on dunfell.
>>>> > explicitly linux-firmware: commit hash
>>>> a04b507d39d668a02b7ebd990c94194cde16bf2f
>>>> >
>>>> > i building dunfell images since 1,5 years and my images are normaly
>>>> 1,9 GB big.
>>>> > however since Sunday 23.07, the image size increases by 1GB due to
>>>> the full firmware installation.
>>>> >
>>>> > i double checked it with the previous commit
>>>> 0bf993da8b6e6511a4123ed15421bdd76a4c1f38 and the image size is as expe=
cted.
>>>> >
>>>> > i hope someone is able to help, because this is an unexpected
>>>> behavior.
>>>> >
>>>> > PS: this my first post so please have mercy on me. :)
>>>>
>>>> Can you enable buildhistory as described in
>>>> https://docs.yoctoproject.org/dev/dev-manual/build-quality.html
>>>> then build linux-firmware before and after the change, then run
>>>> buildhistory-diff? That should highlight where the size increase come
>>>> from in its packaging.
>>>>
>>>> You can also manually inspect linux-firmware's
>>>> ${WORKDIR}/packages-spit/.
>>>>
>>>> Alex
>>>>
>>>
>>>
>>> Andreas
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#184838):
>>> https://lists.openembedded.org/g/openembedded-core/message/184838
>>> Mute This Topic: https://lists.openembedded.org/mt/100346886/3617156
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>>> Martin.Jansa@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
> Andreas
>

--0000000000003bff9706014f69dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That shows you that e.g. linux-firmware-mt7601u now depend=
s on linux-firmware:<div><br></div><div>&quot;linux-firmware-mt7601u&quot; =
-&gt; &quot;linux-firmware&quot;<br>&quot;linux-firmware-mt7601u&quot; -&gt=
; &quot;linux-firmware-mt7601u-license&quot;<br></div><div><br></div><div>n=
ow use bitbake-getvar or bitbake -e to figure out this happens for you (doe=
sn&#39;t for me). Probably some other layer your&#39;re using. If you reply=
 again with &quot;bitbake -e&quot; output without any initiative to actuall=
y debug it yourself, I won&#39;t reply.=C2=A0</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 25, 2023 at =
2:40=E2=80=AFPM Andreas Rehn &lt;<a href=3D"mailto:rehn.andreas86@gmail.com=
">rehn.andreas86@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">before:<div>&qu=
ot;linux-firmware-mt7601u&quot; -&gt; &quot;linux-firmware-mt7601u-license&=
quot;<br>&quot;linux-firmware-ralink&quot; -&gt; &quot;linux-firmware-ralin=
k-license&quot;<br>&quot;linux-firmware-rtl8168&quot; -&gt; &quot;linux-fir=
mware-whence-license&quot;<br>&quot;linux-firmware-rtl8188&quot; -&gt; &quo=
t;linux-firmware-rtl-license&quot;<br>&quot;linux-firmware-rtl8192ce&quot; =
-&gt; &quot;linux-firmware-rtl-license&quot;<br>&quot;linux-firmware-rtl819=
2cu&quot; -&gt; &quot;linux-firmware-rtl-license&quot;<br>&quot;linux-firmw=
are-rtl8192eu&quot; -&gt; &quot;linux-firmware-rtl-license&quot;<br>&quot;l=
inux-firmware-rtl8192su&quot; -&gt; &quot;linux-firmware-rtl-license&quot;<=
br>&quot;linux-firmware-rtl8723&quot; -&gt; &quot;linux-firmware-rtl-licens=
e&quot;<br>&quot;linux-firmware-rtl8821&quot; -&gt; &quot;linux-firmware-rt=
l-license&quot;<br></div><div><br></div><div>after:</div><div>&quot;linux-f=
irmware-adsp-sst&quot; -&gt; &quot;linux-firmware&quot;<br>&quot;linux-firm=
ware-adsp-sst&quot; -&gt; &quot;linux-firmware-adsp-sst-license&quot;<br>&q=
uot;linux-firmware-amlogic-vdec&quot; -&gt; &quot;linux-firmware-amlogic-vd=
ec-license&quot;<br>&quot;linux-firmware-ar3k&quot; -&gt; &quot;linux-firmw=
are-ar3k-license&quot;<br>&quot;linux-firmware-ar3k&quot; -&gt; &quot;linux=
-firmware-atheros-license&quot;<br>&quot;linux-firmware-ar9170&quot; -&gt; =
&quot;linux-firmware-atheros-license&quot;<br>&quot;linux-firmware-ath10k&q=
uot; -&gt; &quot;linux-firmware-ath10k-license&quot;<br>&quot;linux-firmwar=
e-ath11k&quot; -&gt; &quot;linux-firmware-ath10k-license&quot;<br>&quot;lin=
ux-firmware-ath6k&quot; -&gt; &quot;linux-firmware-atheros-license&quot;<br=
>&quot;linux-firmware-ath9k&quot; -&gt; &quot;linux-firmware-atheros-licens=
e&quot;<br>&quot;linux-firmware-bcm-0bb4-0306&quot; -&gt; &quot;linux-firmw=
are-cypress-license&quot;<br>&quot;linux-firmware-bcm43143&quot; -&gt; &quo=
t;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-bcm43236b&q=
uot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmw=
are-bcm43241b0&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&=
quot;linux-firmware-bcm43241b4&quot; -&gt; &quot;linux-firmware-broadcom-li=
cense&quot;<br>&quot;linux-firmware-bcm43241b5&quot; -&gt; &quot;linux-firm=
ware-broadcom-license&quot;<br>&quot;linux-firmware-bcm43242a&quot; -&gt; &=
quot;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-bcm4329-=
fullmac&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;li=
nux-firmware-bcm4329&quot; -&gt; &quot;linux-firmware-broadcom-license&quot=
;<br>&quot;linux-firmware-bcm4330&quot; -&gt; &quot;linux-firmware-broadcom=
-license&quot;<br>&quot;linux-firmware-bcm43340&quot; -&gt; &quot;linux-fir=
mware-cypress-license&quot;<br>&quot;linux-firmware-bcm4334&quot; -&gt; &qu=
ot;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-bcm4335&qu=
ot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmwa=
re-bcm43362&quot; -&gt; &quot;linux-firmware-cypress-license&quot;<br>&quot=
;linux-firmware-bcm4339&quot; -&gt; &quot;linux-firmware-broadcom-license&q=
uot;<br>&quot;linux-firmware-bcm43430a0&quot; -&gt; &quot;linux-firmware-br=
oadcom-license&quot;<br>&quot;linux-firmware-bcm43430&quot; -&gt; &quot;lin=
ux-firmware-cypress-license&quot;<br>&quot;linux-firmware-bcm43455&quot; -&=
gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-bcm=
4350c2&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;lin=
ux-firmware-bcm4350&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;=
<br>&quot;linux-firmware-bcm4354&quot; -&gt; &quot;linux-firmware-cypress-l=
icense&quot;<br>&quot;linux-firmware-bcm43569&quot; -&gt; &quot;linux-firmw=
are-broadcom-license&quot;<br>&quot;linux-firmware-bcm4356&quot; -&gt; &quo=
t;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-bcm4356-pci=
e&quot; -&gt; &quot;linux-firmware-cypress-license&quot;<br>&quot;linux-fir=
mware-bcm43570&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&=
quot;linux-firmware-bcm4358&quot; -&gt; &quot;linux-firmware-broadcom-licen=
se&quot;<br>&quot;linux-firmware-bcm43602&quot; -&gt; &quot;linux-firmware-=
broadcom-license&quot;<br>&quot;linux-firmware-bcm4366b&quot; -&gt; &quot;l=
inux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-bcm4366c&quot;=
 -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;linux-firmware-=
bcm4371&quot; -&gt; &quot;linux-firmware-broadcom-license&quot;<br>&quot;li=
nux-firmware-bcm4373&quot; -&gt; &quot;linux-firmware&quot;<br>&quot;linux-=
firmware-bcm4373&quot; -&gt; &quot;linux-firmware-cypress-license&quot;<br>=
&quot;linux-firmware-bcm43xx-hdr&quot; -&gt; &quot;linux-firmware-broadcom-=
license&quot;<br>&quot;linux-firmware-bcm43xx&quot; -&gt; &quot;linux-firmw=
are-broadcom-license&quot;<br>&quot;linux-firmware-bnx2-mips&quot; -&gt; &q=
uot;linux-firmware-whence-license&quot;<br>&quot;linux-firmware-carl9170&qu=
ot; -&gt; &quot;linux-firmware-gplv2-license&quot;<br>&quot;linux-firmware-=
i915&quot; -&gt; &quot;linux-firmware-i915-license&quot;<br>&quot;linux-fir=
mware-ibt-11-5&quot; -&gt; &quot;linux-firmware-ibt-license&quot;<br>&quot;=
linux-firmware-ibt-12-16&quot; -&gt; &quot;linux-firmware-ibt-license&quot;=
<br>&quot;linux-firmware-ibt-17&quot; -&gt; &quot;linux-firmware-ibt-licens=
e&quot;<br>&quot;linux-firmware-ibt-20&quot; -&gt; &quot;linux-firmware-ibt=
-license&quot;<br>&quot;linux-firmware-ibt-hw-37-7&quot; -&gt; &quot;linux-=
firmware-ibt-license&quot;<br>&quot;linux-firmware-ibt&quot; -&gt; &quot;li=
nux-firmware-ibt-11-5&quot; [style=3Ddotted]<br>&quot;linux-firmware-ibt&qu=
ot; -&gt; &quot;linux-firmware-ibt-12-16&quot; [style=3Ddotted]<br>&quot;li=
nux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-17&quot; [style=3Ddot=
ted]<br>&quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-20&qu=
ot; [style=3Ddotted]<br>&quot;linux-firmware-ibt&quot; -&gt; &quot;linux-fi=
rmware-ibt-hw-37-7&quot; [style=3Ddotted]<br>&quot;linux-firmware-ibt&quot;=
 -&gt; &quot;linux-firmware-ibt-hw-37-8&quot; [style=3Ddotted]<br>&quot;lin=
ux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-license&quot; [style=
=3Ddotted]<br>&quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt=
-misc&quot; [style=3Ddotted]<br>&quot;linux-firmware-ibt-misc&quot; -&gt; &=
quot;linux-firmware-ibt-license&quot;<br>&quot;linux-firmware-ice&quot; -&g=
t; &quot;linux-firmware-ice-license&quot;<br>&quot;linux-firmware-imx-sdma-=
imx6q&quot; -&gt; &quot;linux-firmware-imx-sdma-license&quot;<br>&quot;linu=
x-firmware-imx-sdma-imx7d&quot; -&gt; &quot;linux-firmware-imx-sdma-license=
&quot;<br>&quot;linux-firmware-iwlwifi-135-6&quot; -&gt; &quot;linux-firmwa=
re-iwlwifi-license&quot;<br>&quot;linux-firmware-iwlwifi-3160-17&quot; -&gt=
; &quot;linux-firmware-iwlwifi-license&quot;<br>&quot;linux-firmware-iwlwif=
i-6000-4&quot; -&gt; &quot;linux-firmware-iwlwifi-license&quot;<br>&quot;li=
nux-firmware-iwlwifi-6000g2a-6&quot; -&gt; &quot;linux-firmware-iwlwifi-lic=
ense&quot;<br>&quot;linux-firmware-iwlwifi-6000g2b-6&quot; -&gt; &quot;linu=
x-firmware-iwlwifi-license&quot;<br>&quot;linux-firmware-iwlwifi-6050-5&quo=
t; -&gt; &quot;linux-firmware-iwlwifi-license&quot;<br>&quot;linux-firmware=
-iwlwifi-7260&quot; -&gt; &quot;linux-firmware-iwlwifi-license&quot;<br>&qu=
ot;linux-firmware-iwlwifi-7265d&quot; -&gt; &quot;linux-firmware-iwlwifi-li=
cense&quot;<br>&quot;linux-firmware-iwlwifi-7265&quot; -&gt; &quot;linux-fi=
rmware-iwlwifi-license&quot;<br>&quot;linux-firmware-iwlwifi-8000c&quot; -&=
gt; &quot;linux-firmware-iwlwifi-license&quot;<br>&quot;linux-firmware-iwlw=
ifi-8265&quot; -&gt; &quot;linux-firmware-iwlwifi-license&quot;<br>&quot;li=
nux-firmware-iwlwifi-9000&quot; -&gt; &quot;linux-firmware-iwlwifi-license&=
quot;<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-135-6&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt=
; &quot;linux-firmware-iwlwifi-3160-10&quot; [style=3Ddotted]<br>&quot;linu=
x-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-12&quot; [=
style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-fir=
mware-iwlwifi-3160-13&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwif=
i&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-16&quot; [style=3Ddotted]<b=
r>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-316=
0-17&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &qu=
ot;linux-firmware-iwlwifi-3160-7&quot; [style=3Ddotted]<br>&quot;linux-firm=
ware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-8&quot; [style=
=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware=
-iwlwifi-3160-9&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot=
; -&gt; &quot;linux-firmware-iwlwifi-6000-4&quot; [style=3Ddotted]<br>&quot=
;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-6000g2a-5&=
quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;li=
nux-firmware-iwlwifi-6000g2a-6&quot; [style=3Ddotted]<br>&quot;linux-firmwa=
re-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-6000g2b-5&quot; [style=
=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware=
-iwlwifi-6000g2b-6&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&q=
uot; -&gt; &quot;linux-firmware-iwlwifi-6050-4&quot; [style=3Ddotted]<br>&q=
uot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-6050-5&=
quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;li=
nux-firmware-iwlwifi-7260&quot; [style=3Ddotted]<br>&quot;linux-firmware-iw=
lwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-7265d&quot; [style=3Ddotted]=
<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-7=
265&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quo=
t;linux-firmware-iwlwifi-8000c&quot; [style=3Ddotted]<br>&quot;linux-firmwa=
re-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-8265&quot; [style=3Ddot=
ted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwi=
fi-9000&quot; [style=3Ddotted]<br>&quot;linux-firmware-iwlwifi&quot; -&gt; =
&quot;linux-firmware-iwlwifi-license&quot; [style=3Ddotted]<br>&quot;linux-=
firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlwifi-misc&quot; [style=
=3Ddotted]<br>&quot;linux-firmware-iwlwifi-misc&quot; -&gt; &quot;linux-fir=
mware-iwlwifi-license&quot;<br>&quot;linux-firmware&quot; -&gt; &quot;linux=
-firmware-adsp-sst-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&q=
uot; -&gt; &quot;linux-firmware-adsp-sst&quot; [style=3Ddotted]<br>&quot;li=
nux-firmware&quot; -&gt; &quot;linux-firmware-amlogic-vdec-license&quot; [s=
tyle=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-aml=
ogic-vdec&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;=
linux-firmware-ar3k-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&=
quot; -&gt; &quot;linux-firmware-ar3k&quot; [style=3Ddotted]<br>&quot;linux=
-firmware&quot; -&gt; &quot;linux-firmware-ar9170&quot; [style=3Ddotted]<br=
>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ath10k-license&quot;=
 [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-=
ath10k&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;lin=
ux-firmware-ath11k&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&g=
t; &quot;linux-firmware-ath6k&quot; [style=3Ddotted]<br>&quot;linux-firmwar=
e&quot; -&gt; &quot;linux-firmware-ath9k&quot; [style=3Ddotted]<br>&quot;li=
nux-firmware&quot; -&gt; &quot;linux-firmware-atheros-license&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm-0bb=
4-0306&quot;<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm-0=
bb4-0306&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;l=
inux-firmware-bcm43143&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot;=
 -&gt; &quot;linux-firmware-bcm43236b&quot; [style=3Ddotted]<br>&quot;linux=
-firmware&quot; -&gt; &quot;linux-firmware-bcm43241b0&quot; [style=3Ddotted=
]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43241b4&quot;=
 [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-=
bcm43241b5&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot=
;linux-firmware-bcm43242a&quot; [style=3Ddotted]<br>&quot;linux-firmware&qu=
ot; -&gt; &quot;linux-firmware-bcm4329-fullmac&quot; [style=3Ddotted]<br>&q=
uot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4329&quot; [style=3D=
dotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4330&qu=
ot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmwa=
re-bcm43340&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quo=
t;linux-firmware-bcm4334&quot; [style=3Ddotted]<br>&quot;linux-firmware&quo=
t; -&gt; &quot;linux-firmware-bcm4335&quot; [style=3Ddotted]<br>&quot;linux=
-firmware&quot; -&gt; &quot;linux-firmware-bcm43362&quot; [style=3Ddotted]<=
br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4339&quot; [sty=
le=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43=
430a0&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linu=
x-firmware-bcm43430&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&=
gt; &quot;linux-firmware-bcm43455&quot; [style=3Ddotted]<br>&quot;linux-fir=
mware&quot; -&gt; &quot;linux-firmware-bcm4350c2&quot; [style=3Ddotted]<br>=
&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4350&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4354=
&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-fir=
mware-bcm43569&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &=
quot;linux-firmware-bcm4356-pcie&quot; [style=3Ddotted]<br>&quot;linux-firm=
ware&quot; -&gt; &quot;linux-firmware-bcm4356&quot; [style=3Ddotted]<br>&qu=
ot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43570&quot; [style=3D=
dotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4358&qu=
ot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmwa=
re-bcm43602&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quo=
t;linux-firmware-bcm4366b&quot; [style=3Ddotted]<br>&quot;linux-firmware&qu=
ot; -&gt; &quot;linux-firmware-bcm4366c&quot; [style=3Ddotted]<br>&quot;lin=
ux-firmware&quot; -&gt; &quot;linux-firmware-bcm4371&quot; [style=3Ddotted]=
<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4373&quot; [st=
yle=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4=
3xx-hdr&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;li=
nux-firmware-bcm43xx&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -=
&gt; &quot;linux-firmware-bnx2-mips&quot; [style=3Ddotted]<br>&quot;linux-f=
irmware&quot; -&gt; &quot;linux-firmware-broadcom-license&quot; [style=3Ddo=
tted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-carl9170&quo=
t; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmwar=
e-cypress-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt=
; &quot;linux-firmware-gplv2-license&quot; [style=3Ddotted]<br>&quot;linux-=
firmware&quot; -&gt; &quot;linux-firmware-i915-license&quot; [style=3Ddotte=
d]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-i915&quot; [sty=
le=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-1=
1-5&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-=
firmware-ibt-12-16&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&g=
t; &quot;linux-firmware-ibt-17&quot; [style=3Ddotted]<br>&quot;linux-firmwa=
re&quot; -&gt; &quot;linux-firmware-ibt-20&quot; [style=3Ddotted]<br>&quot;=
linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-hw-37-7&quot; [style=3D=
dotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-hw-37-=
8&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-fi=
rmware-ibt-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&g=
t; &quot;linux-firmware-ibt-misc&quot; [style=3Ddotted]<br>&quot;linux-firm=
ware&quot; -&gt; &quot;linux-firmware-ibt&quot; [style=3Ddotted]<br>&quot;l=
inux-firmware&quot; -&gt; &quot;linux-firmware-ice-license&quot; [style=3Dd=
otted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ice&quot; [=
style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-im=
x-sdma-imx6q&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &qu=
ot;linux-firmware-imx-sdma-imx7d&quot; [style=3Ddotted]<br>&quot;linux-firm=
ware&quot; -&gt; &quot;linux-firmware-imx-sdma-license&quot; [style=3Ddotte=
d]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-135-6&q=
uot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmw=
are-iwlwifi-3160-10&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&=
gt; &quot;linux-firmware-iwlwifi-3160-12&quot; [style=3Ddotted]<br>&quot;li=
nux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-13&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi=
-3160-16&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;l=
inux-firmware-iwlwifi-3160-17&quot; [style=3Ddotted]<br>&quot;linux-firmwar=
e&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-7&quot; [style=3Ddotted]<br=
>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160-8&quot;=
 [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-=
iwlwifi-3160-9&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &=
quot;linux-firmware-iwlwifi-6000-4&quot; [style=3Ddotted]<br>&quot;linux-fi=
rmware&quot; -&gt; &quot;linux-firmware-iwlwifi-6000g2a-5&quot; [style=3Ddo=
tted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-6000=
g2a-6&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linu=
x-firmware-iwlwifi-6000g2b-5&quot; [style=3Ddotted]<br>&quot;linux-firmware=
&quot; -&gt; &quot;linux-firmware-iwlwifi-6000g2b-6&quot; [style=3Ddotted]<=
br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-6050-4&quo=
t; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmwar=
e-iwlwifi-6050-5&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt;=
 &quot;linux-firmware-iwlwifi-7260&quot; [style=3Ddotted]<br>&quot;linux-fi=
rmware&quot; -&gt; &quot;linux-firmware-iwlwifi-7265d&quot; [style=3Ddotted=
]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-7265&quo=
t; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmwar=
e-iwlwifi-8000c&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; =
&quot;linux-firmware-iwlwifi-8265&quot; [style=3Ddotted]<br>&quot;linux-fir=
mware&quot; -&gt; &quot;linux-firmware-iwlwifi-9000&quot; [style=3Ddotted]<=
br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-license&qu=
ot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmwa=
re-iwlwifi-misc&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; =
&quot;linux-firmware-iwlwifi&quot; [style=3Ddotted]<br>&quot;linux-firmware=
&quot; -&gt; &quot;linux-firmware-license&quot;<br>&quot;linux-firmware&quo=
t; -&gt; &quot;linux-firmware-license&quot; [style=3Ddotted]<br>&quot;linux=
-firmware&quot; -&gt; &quot;linux-firmware-liquidio&quot; [style=3Ddotted]<=
br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-lontium-license&qu=
ot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmwa=
re-lt9611uxc&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &qu=
ot;linux-firmware-marvell-license&quot; [style=3Ddotted]<br>&quot;linux-fir=
mware&quot; -&gt; &quot;linux-firmware-mt7601u-license&quot; [style=3Ddotte=
d]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-mt7601u&quot; [=
style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ne=
tronome-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; =
&quot;linux-firmware-netronome&quot; [style=3Ddotted]<br>&quot;linux-firmwa=
re&quot; -&gt; &quot;linux-firmware-nvidia-gpu&quot; [style=3Ddotted]<br>&q=
uot;linux-firmware&quot; -&gt; &quot;linux-firmware-nvidia-license&quot; [s=
tyle=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-nvi=
dia-tegra-k1&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &qu=
ot;linux-firmware-nvidia-tegra&quot; [style=3Ddotted]<br>&quot;linux-firmwa=
re&quot; -&gt; &quot;linux-firmware-pcie8897&quot; [style=3Ddotted]<br>&quo=
t;linux-firmware&quot; -&gt; &quot;linux-firmware-pcie8997&quot; [style=3Dd=
otted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qat-license=
&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-fir=
mware-qat&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;=
linux-firmware-qca&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&g=
t; &quot;linux-firmware-qcom-adreno-a2xx&quot; [style=3Ddotted]<br>&quot;li=
nux-firmware&quot; -&gt; &quot;linux-firmware-qcom-adreno-a3xx&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-ad=
reno-a4xx&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;=
linux-firmware-qcom-adreno-a530&quot; [style=3Ddotted]<br>&quot;linux-firmw=
are&quot; -&gt; &quot;linux-firmware-qcom-adreno-a630&quot; [style=3Ddotted=
]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-adreno-a650=
&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-fir=
mware-qcom-adreno-a660&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot;=
 -&gt; &quot;linux-firmware-qcom-apq8096-audio&quot; [style=3Ddotted]<br>&q=
uot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-apq8096-modem&quot=
; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware=
-qcom-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &q=
uot;linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno&quot; [style=3Ddotted]<=
br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sc8280xp-leno=
vo-x13s-audio&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &q=
uot;linux-firmware-qcom-sc8280xp-lenovo-x13s-compat&quot; [style=3Ddotted]<=
br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sc8280xp-leno=
vo-x13s-compute&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; =
&quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors&quot; [style=3Ddotte=
d]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sdm845-aud=
io&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-f=
irmware-qcom-sdm845-compute&quot; [style=3Ddotted]<br>&quot;linux-firmware&=
quot; -&gt; &quot;linux-firmware-qcom-sdm845-modem&quot; [style=3Ddotted]<b=
r>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sm8250-audio&q=
uot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmw=
are-qcom-sm8250-compute&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot=
; -&gt; &quot;linux-firmware-qcom-venus-1.8&quot; [style=3Ddotted]<br>&quot=
;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-venus-4.2&quot; [styl=
e=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-v=
enus-5.2&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;l=
inux-firmware-qcom-venus-5.4&quot; [style=3Ddotted]<br>&quot;linux-firmware=
&quot; -&gt; &quot;linux-firmware-qcom-vpu-1.0&quot; [style=3Ddotted]<br>&q=
uot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-vpu-2.0&quot; [sty=
le=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-=
yamato-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &=
quot;linux-firmware-radeon-license&quot; [style=3Ddotted]<br>&quot;linux-fi=
rmware&quot; -&gt; &quot;linux-firmware-radeon&quot; [style=3Ddotted]<br>&q=
uot;linux-firmware&quot; -&gt; &quot;linux-firmware-ralink-license&quot; [s=
tyle=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ral=
ink&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-=
firmware-rs9113&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; =
&quot;linux-firmware-rs9116&quot; [style=3Ddotted]<br>&quot;linux-firmware&=
quot; -&gt; &quot;linux-firmware-rtl8168&quot; [style=3Ddotted]<br>&quot;li=
nux-firmware&quot; -&gt; &quot;linux-firmware-rtl8188&quot; [style=3Ddotted=
]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8192ce&quot; =
[style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-r=
tl8192cu&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;l=
inux-firmware-rtl8192eu&quot;<br>&quot;linux-firmware&quot; -&gt; &quot;lin=
ux-firmware-rtl8192eu&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; =
-&gt; &quot;linux-firmware-rtl8192su&quot; [style=3Ddotted]<br>&quot;linux-=
firmware&quot; -&gt; &quot;linux-firmware-rtl8723&quot; [style=3Ddotted]<br=
>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8821&quot; [style=
=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl-lic=
ense&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux=
-firmware-sd8686&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt;=
 &quot;linux-firmware-sd8688&quot; [style=3Ddotted]<br>&quot;linux-firmware=
&quot; -&gt; &quot;linux-firmware-sd8787&quot; [style=3Ddotted]<br>&quot;li=
nux-firmware&quot; -&gt; &quot;linux-firmware-sd8797&quot; [style=3Ddotted]=
<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd8801&quot; [sty=
le=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd888=
7&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-fi=
rmware-sd8897&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &q=
uot;linux-firmware-sd8997&quot; [style=3Ddotted]<br>&quot;linux-firmware&qu=
ot; -&gt; &quot;linux-firmware-ti-connectivity-license&quot; [style=3Ddotte=
d]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-usb8997&quot; [=
style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-vt=
6656-license&quot; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &qu=
ot;linux-firmware-vt6656&quot; [style=3Ddotted]<br>&quot;linux-firmware&quo=
t; -&gt; &quot;linux-firmware-whence-license&quot;<br>&quot;linux-firmware&=
quot; -&gt; &quot;linux-firmware-whence-license&quot; [style=3Ddotted]<br>&=
quot;linux-firmware&quot; -&gt; &quot;linux-firmware-wl12xx&quot; [style=3D=
dotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmware-wl18xx&quo=
t; [style=3Ddotted]<br>&quot;linux-firmware&quot; -&gt; &quot;linux-firmwar=
e-wlcommon&quot; [style=3Ddotted]<br>&quot;linux-firmware-mt7601u&quot; -&g=
t; &quot;linux-firmware&quot;<br>&quot;linux-firmware-mt7601u&quot; -&gt; &=
quot;linux-firmware-mt7601u-license&quot;<br>&quot;linux-firmware-netronome=
&quot; -&gt; &quot;linux-firmware-netronome-license&quot;<br>&quot;linux-fi=
rmware-nvidia-gpu&quot; -&gt; &quot;linux-firmware-nvidia-license&quot;<br>=
&quot;linux-firmware-nvidia-tegra-k1&quot; -&gt; &quot;linux-firmware-nvidi=
a-license&quot;<br>&quot;linux-firmware-nvidia-tegra&quot; -&gt; &quot;linu=
x-firmware-nvidia-gpu&quot;<br>&quot;linux-firmware-nvidia-tegra&quot; -&gt=
; &quot;linux-firmware-nvidia-license&quot;<br>&quot;linux-firmware-qat&quo=
t; -&gt; &quot;linux-firmware-qat-license&quot;<br>&quot;linux-firmware-qca=
&quot; -&gt; &quot;linux-firmware-ath10k-license&quot;<br>&quot;linux-firmw=
are-qcom-adreno-a2xx&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br=
>&quot;linux-firmware-qcom-adreno-a2xx&quot; -&gt; &quot;linux-firmware-qco=
m-yamato-license&quot;<br>&quot;linux-firmware-qcom-adreno-a4xx&quot; -&gt;=
 &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-qcom-adren=
o-a530&quot; -&gt; &quot;linux-firmware&quot;<br>&quot;linux-firmware-qcom-=
adreno-a530&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;li=
nux-firmware-qcom-adreno-a630&quot; -&gt; &quot;linux-firmware-qcom-license=
&quot;<br>&quot;linux-firmware-qcom-adreno-a650&quot; -&gt; &quot;linux-fir=
mware-qcom-license&quot;<br>&quot;linux-firmware-qcom-adreno-a660&quot; -&g=
t; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-qcom-apq=
8096-audio&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;lin=
ux-firmware-qcom-apq8096-modem&quot; -&gt; &quot;linux-firmware-qcom-licens=
e&quot;<br>&quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno&quot; -&gt=
; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-qcom-sc82=
80xp-lenovo-x13s-adreno&quot; -&gt; &quot;linux-firmware-qcom-sc8280xp-leno=
vo-x13s-compat&quot; [style=3Ddotted]<br>&quot;linux-firmware-qcom-sc8280xp=
-lenovo-x13s-audio&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&=
quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-audio&quot; -&gt; &quot;linux=
-firmware-qcom-sc8280xp-lenovo-x13s-compat&quot; [style=3Ddotted]<br>&quot;=
linux-firmware-qcom-sc8280xp-lenovo-x13s-compute&quot; -&gt; &quot;linux-fi=
rmware-qcom-license&quot;<br>&quot;linux-firmware-qcom-sc8280xp-lenovo-x13s=
-compute&quot; -&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-compat&=
quot; [style=3Ddotted]<br>&quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-se=
nsors&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-fi=
rmware-qcom-sc8280xp-lenovo-x13s-sensors&quot; -&gt; &quot;linux-firmware-q=
com-sc8280xp-lenovo-x13s-compat&quot; [style=3Ddotted]<br>&quot;linux-firmw=
are-qcom-sdm845-audio&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<b=
r>&quot;linux-firmware-qcom-sdm845-compute&quot; -&gt; &quot;linux-firmware=
-qcom-license&quot;<br>&quot;linux-firmware-qcom-sdm845-modem&quot; -&gt; &=
quot;linux-firmware-ath10k&quot;<br>&quot;linux-firmware-qcom-sdm845-modem&=
quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware=
-qcom-sm8250-audio&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&=
quot;linux-firmware-qcom-sm8250-compute&quot; -&gt; &quot;linux-firmware-qc=
om-license&quot;<br>&quot;linux-firmware-qcom-venus-1.8&quot; -&gt; &quot;l=
inux-firmware-qcom-license&quot;<br>&quot;linux-firmware-qcom-venus-4.2&quo=
t; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-qc=
om-venus-5.2&quot; -&gt; &quot;linux-firmware-qcom-license&quot;<br>&quot;l=
inux-firmware-qcom-venus-5.4&quot; -&gt; &quot;linux-firmware-qcom-license&=
quot;<br>&quot;linux-firmware-qcom-vpu-1.0&quot; -&gt; &quot;linux-firmware=
-qcom-license&quot;<br>&quot;linux-firmware-qcom-vpu-2.0&quot; -&gt; &quot;=
linux-firmware-qcom-license&quot;<br>&quot;linux-firmware-radeon&quot; -&gt=
; &quot;linux-firmware-radeon-license&quot;<br>&quot;linux-firmware-ralink&=
quot; -&gt; &quot;linux-firmware-ralink-license&quot;<br>&quot;linux-firmwa=
re-rs9113&quot; -&gt; &quot;linux-firmware-whence-license&quot;<br>&quot;li=
nux-firmware-rs9116&quot; -&gt; &quot;linux-firmware-whence-license&quot;<b=
r>&quot;linux-firmware-rtl8168&quot; -&gt; &quot;linux-firmware-whence-lice=
nse&quot;<br>&quot;linux-firmware-rtl8188&quot; -&gt; &quot;linux-firmware-=
rtl-license&quot;<br>&quot;linux-firmware-rtl8192ce&quot; -&gt; &quot;linux=
-firmware-rtl-license&quot;<br>&quot;linux-firmware-rtl8192cu&quot; -&gt; &=
quot;linux-firmware-rtl-license&quot;<br>&quot;linux-firmware-rtl8192eu&quo=
t; -&gt; &quot;linux-firmware-rtl-license&quot;<br>&quot;linux-firmware-rtl=
8192su&quot; -&gt; &quot;linux-firmware-rtl-license&quot;<br>&quot;linux-fi=
rmware-rtl8723&quot; -&gt; &quot;linux-firmware-rtl-license&quot;<br>&quot;=
linux-firmware-rtl8821&quot; -&gt; &quot;linux-firmware-rtl-license&quot;<b=
r>&quot;linux-firmware-sd8686&quot; -&gt; &quot;linux-firmware-marvell-lice=
nse&quot;<br>&quot;linux-firmware-sd8688&quot; -&gt; &quot;linux-firmware-m=
arvell-license&quot;<br>&quot;linux-firmware-sd8787&quot; -&gt; &quot;linux=
-firmware-marvell-license&quot;<br>&quot;linux-firmware-sd8797&quot; -&gt; =
&quot;linux-firmware-marvell-license&quot;<br>&quot;linux-firmware-sd8801&q=
uot; -&gt; &quot;linux-firmware-marvell-license&quot;<br>&quot;linux-firmwa=
re-sd8887&quot; -&gt; &quot;linux-firmware-marvell-license&quot;<br>&quot;l=
inux-firmware-sd8897&quot; -&gt; &quot;linux-firmware-marvell-license&quot;=
<br>&quot;linux-firmware-sd8997&quot; -&gt; &quot;linux-firmware-marvell-li=
cense&quot;<br>&quot;linux-firmware-usb8997&quot; -&gt; &quot;linux-firmwar=
e-marvell-license&quot;<br>&quot;linux-firmware-vt6656&quot; -&gt; &quot;li=
nux-firmware-vt6656-license&quot;<br>&quot;linux-firmware-wl12xx&quot; -&gt=
; &quot;linux-firmware-ti-connectivity-license&quot;<br>&quot;linux-firmwar=
e-wl12xx&quot; -&gt; &quot;linux-firmware-wlcommon&quot;<br>&quot;linux-fir=
mware-wl18xx&quot; -&gt; &quot;linux-firmware-ti-connectivity-license&quot;=
<br>&quot;linux-firmware-wl18xx&quot; -&gt; &quot;linux-firmware-wlcommon&q=
uot;<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Am Di., 25. Juli 2023 um 14:20=C2=A0Uhr schrieb Martin Jans=
a &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr">now figure out what depends on linux-firmware from =
your image<div><br></div><div>grep linux-firmware buildhistory/images/your-=
machine/your-libc/your-image/depends.dot<br></div><div><br></div><div>and t=
hen git log will help you with the rest (FWIW: I don&#39;t see linux-firmwa=
re in our dunfell images).</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 25, 2023 at 2:01=E2=80=AFPM And=
reas Rehn &lt;<a href=3D"mailto:rehn.andreas86@gmail.com" target=3D"_blank"=
>rehn.andreas86@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div>hey alex,</=
div><div>thx for have a look</div><div><br></div>before<br><br>linux-firmwa=
re-mt7601u-license<br>linux-firmware-mt7601u<br>linux-firmware-ralink-licen=
se<br>linux-firmware-ralink<br>linux-firmware-rtl8168<br>linux-firmware-rtl=
8188<br>linux-firmware-rtl8192ce<br>linux-firmware-rtl8192cu<br>linux-firmw=
are-rtl8192eu<br>linux-firmware-rtl8192su<br>linux-firmware-rtl8723<br>linu=
x-firmware-rtl8821<br>linux-firmware-rtl-license<br>linux-firmware-whence-l=
icense<br><br>after<br><br>libz1 aarch64 1.2.11-r0<br>linux-firmware all 1:=
20230515-r0<br>linux-firmware-adsp-sst all 1:20230515-r0<br>linux-firmware-=
adsp-sst-license all 1:20230515-r0<br>linux-firmware-amlogic-vdec all 1:202=
30515-r0<br>linux-firmware-amlogic-vdec-license all 1:20230515-r0<br>linux-=
firmware-ar3k all 1:20230515-r0<br>linux-firmware-ar3k-license all 1:202305=
15-r0<br>linux-firmware-ar9170 all 1:20230515-r0<br>linux-firmware-ath10k a=
ll 1:20230515-r0<br>linux-firmware-ath10k-license all 1:20230515-r0<br>linu=
x-firmware-ath11k all 1:20230515-r0<br>linux-firmware-ath6k all 1:20230515-=
r0<br>linux-firmware-ath9k all 1:20230515-r0<br>linux-firmware-atheros-lice=
nse all 1:20230515-r0<br>linux-firmware-bcm-0bb4-0306 all 1:20230515-r0<br>=
linux-firmware-bcm43143 all 1:20230515-r0<br>linux-firmware-bcm43236b all 1=
:20230515-r0<br>linux-firmware-bcm43241b0 all 1:20230515-r0<br>linux-firmwa=
re-bcm43241b4 all 1:20230515-r0<br>linux-firmware-bcm43241b5 all 1:20230515=
-r0<br>linux-firmware-bcm43242a all 1:20230515-r0<br>linux-firmware-bcm4329=
 all 1:20230515-r0<br>linux-firmware-bcm4329-fullmac all 1:20230515-r0<br>l=
inux-firmware-bcm4330 all 1:20230515-r0<br>linux-firmware-bcm4334 all 1:202=
30515-r0<br>linux-firmware-bcm43340 all 1:20230515-r0<br>linux-firmware-bcm=
4335 all 1:20230515-r0<br>linux-firmware-bcm43362 all 1:20230515-r0<br>linu=
x-firmware-bcm4339 all 1:20230515-r0<br>linux-firmware-bcm43430 all 1:20230=
515-r0<br>linux-firmware-bcm43430a0 all 1:20230515-r0<br>linux-firmware-bcm=
43455 all 1:20230515-r0<br>linux-firmware-bcm4350 all 1:20230515-r0<br>linu=
x-firmware-bcm4350c2 all 1:20230515-r0<br>linux-firmware-bcm4354 all 1:2023=
0515-r0<br>linux-firmware-bcm4356 all 1:20230515-r0<br>linux-firmware-bcm43=
56-pcie all 1:20230515-r0<br>linux-firmware-bcm43569 all 1:20230515-r0<br>l=
inux-firmware-bcm43570 all 1:20230515-r0<br>linux-firmware-bcm4358 all 1:20=
230515-r0<br>linux-firmware-bcm43602 all 1:20230515-r0<br>linux-firmware-bc=
m4366b all 1:20230515-r0<br>linux-firmware-bcm4366c all 1:20230515-r0<br>li=
nux-firmware-bcm4371 all 1:20230515-r0<br>linux-firmware-bcm4373 all 1:2023=
0515-r0<br>linux-firmware-bcm43xx all 1:20230515-r0<br>linux-firmware-bcm43=
xx-hdr all 1:20230515-r0<br>linux-firmware-bnx2-mips all 1:20230515-r0<br>l=
inux-firmware-broadcom-license all 1:20230515-r0<br>linux-firmware-carl9170=
 all 1:20230515-r0<br>linux-firmware-cypress-license all 1:20230515-r0<br>l=
inux-firmware-gplv2-license all 1:20230515-r0<br>linux-firmware-i915 all 1:=
20230515-r0<br>linux-firmware-i915-license all 1:20230515-r0<br>linux-firmw=
are-ibt all 1:20230515-r0<br>linux-firmware-ibt-11-5 all 1:20230515-r0<br>l=
inux-firmware-ibt-12-16 all 1:20230515-r0<br>linux-firmware-ibt-17 all 1:20=
230515-r0<br>linux-firmware-ibt-20 all 1:20230515-r0<br>linux-firmware-ibt-=
hw-37-7 all 1:20230515-r0<br>linux-firmware-ibt-hw-37-8 all 1:20230515-r0<b=
r>linux-firmware-ibt-license all 1:20230515-r0<br>linux-firmware-ibt-misc a=
ll 1:20230515-r0<br>linux-firmware-ice all 1:20230515-r0<br>linux-firmware-=
ice-license all 1:20230515-r0<br>linux-firmware-imx-sdma-imx6q all 1:202305=
15-r0<br>linux-firmware-imx-sdma-imx7d all 1:20230515-r0<br>linux-firmware-=
imx-sdma-license all 1:20230515-r0<br>linux-firmware-iwlwifi all 1:20230515=
-r0<br>linux-firmware-iwlwifi-135-6 all 1:20230515-r0<br>linux-firmware-iwl=
wifi-3160-17 all 1:20230515-r0<br>linux-firmware-iwlwifi-6000-4 all 1:20230=
515-r0<br>linux-firmware-iwlwifi-6000g2a-6 all 1:20230515-r0<br>linux-firmw=
are-iwlwifi-6000g2b-6 all 1:20230515-r0<br>linux-firmware-iwlwifi-6050-5 al=
l 1:20230515-r0<br>linux-firmware-iwlwifi-7260 all 1:20230515-r0<br>linux-f=
irmware-iwlwifi-7265 all 1:20230515-r0<br>linux-firmware-iwlwifi-7265d all =
1:20230515-r0<br>linux-firmware-iwlwifi-8000c all 1:20230515-r0<br>linux-fi=
rmware-iwlwifi-8265 all 1:20230515-r0<br>linux-firmware-iwlwifi-9000 all 1:=
20230515-r0<br>linux-firmware-iwlwifi-license all 1:20230515-r0<br>linux-fi=
rmware-iwlwifi-misc all 1:20230515-r0<br>linux-firmware-license all 1:20230=
515-r0<br>linux-firmware-liquidio all 1:20230515-r0<br>linux-firmware-lonti=
um-license all 1:20230515-r0<br>linux-firmware-lt9611uxc all 1:20230515-r0<=
br>linux-firmware-marvell-license all 1:20230515-r0<br>linux-firmware-mt760=
1u all 1:20230515-r0<br>linux-firmware-mt7601u-license all 1:20230515-r0<br=
>linux-firmware-netronome all 1:20230515-r0<br>linux-firmware-netronome-lic=
ense all 1:20230515-r0<br>linux-firmware-nvidia-gpu all 1:20230515-r0<br>li=
nux-firmware-nvidia-license all 1:20230515-r0<br>linux-firmware-nvidia-tegr=
a all 1:20230515-r0<br>linux-firmware-nvidia-tegra-k1 all 1:20230515-r0<br>=
linux-firmware-pcie8897 all 1:20230515-r0<br>linux-firmware-pcie8997 all 1:=
20230515-r0<br>linux-firmware-qat all 1:20230515-r0<br>linux-firmware-qat-l=
icense all 1:20230515-r0<br>linux-firmware-qca all 1:20230515-r0<br>linux-f=
irmware-qcom-adreno-a2xx all 1:20230515-r0<br>linux-firmware-qcom-adreno-a3=
xx all 1:20230515-r0<br>linux-firmware-qcom-adreno-a4xx all 1:20230515-r0<b=
r>linux-firmware-qcom-adreno-a530 all 1:20230515-r0<br>linux-firmware-qcom-=
adreno-a630 all 1:20230515-r0<br>linux-firmware-qcom-adreno-a650 all 1:2023=
0515-r0<br>linux-firmware-qcom-adreno-a660 all 1:20230515-r0<br>linux-firmw=
are-qcom-apq8096-audio all 1:20230515-r0<br>linux-firmware-qcom-apq8096-mod=
em all 1:20230515-r0<br>linux-firmware-qcom-license all 1:20230515-r0<br>li=
nux-firmware-qcom-sc8280xp-lenovo-x13s-adreno all 1:20230515-r0<br>linux-fi=
rmware-qcom-sc8280xp-lenovo-x13s-audio all 1:20230515-r0<br>linux-firmware-=
qcom-sc8280xp-lenovo-x13s-compat all 1:20230515-r0<br>linux-firmware-qcom-s=
c8280xp-lenovo-x13s-compute all 1:20230515-r0<br>linux-firmware-qcom-sc8280=
xp-lenovo-x13s-sensors all 1:20230515-r0<br>linux-firmware-qcom-sdm845-audi=
o all 1:20230515-r0<br>linux-firmware-qcom-sdm845-compute all 1:20230515-r0=
<br>linux-firmware-qcom-sdm845-modem all 1:20230515-r0<br>linux-firmware-qc=
om-sm8250-audio all 1:20230515-r0<br>linux-firmware-qcom-sm8250-compute all=
 1:20230515-r0<br>linux-firmware-qcom-venus-1.8 all 1:20230515-r0<br>linux-=
firmware-qcom-venus-4.2 all 1:20230515-r0<br>linux-firmware-qcom-venus-5.2 =
all 1:20230515-r0<br>linux-firmware-qcom-venus-5.4 all 1:20230515-r0<br>lin=
ux-firmware-qcom-vpu-1.0 all 1:20230515-r0<br>linux-firmware-qcom-vpu-2.0 a=
ll 1:20230515-r0<br>linux-firmware-qcom-yamato-license all 1:20230515-r0<br=
>linux-firmware-radeon all 1:20230515-r0<br>linux-firmware-radeon-license a=
ll 1:20230515-r0<br>linux-firmware-ralink all 1:20230515-r0<br>linux-firmwa=
re-ralink-license all 1:20230515-r0<br>linux-firmware-rs9113 all 1:20230515=
-r0<br>linux-firmware-rs9116 all 1:20230515-r0<br>linux-firmware-rtl-licens=
e all 1:20230515-r0<br>linux-firmware-rtl8168 all 1:20230515-r0<br>linux-fi=
rmware-rtl8188 all 1:20230515-r0<br>linux-firmware-rtl8192ce all 1:20230515=
-r0<br>linux-firmware-rtl8192cu all 1:20230515-r0<br>linux-firmware-rtl8192=
eu all 1:20230515-r0<br>linux-firmware-rtl8192su all 1:20230515-r0<br>linux=
-firmware-rtl8723 all 1:20230515-r0<br>linux-firmware-rtl8821 all 1:2023051=
5-r0<br>linux-firmware-sd8686 all 1:20230515-r0<br>linux-firmware-sd8688 al=
l 1:20230515-r0<br>linux-firmware-sd8787 all 1:20230515-r0<br>linux-firmwar=
e-sd8797 all 1:20230515-r0<br>linux-firmware-sd8801 all 1:20230515-r0<br>li=
nux-firmware-sd8887 all 1:20230515-r0<br>linux-firmware-sd8897 all 1:202305=
15-r0<br>linux-firmware-sd8997 all 1:20230515-r0<br>linux-firmware-ti-conne=
ctivity-license all 1:20230515-r0<br>linux-firmware-usb8997 all 1:20230515-=
r0<br>linux-firmware-vt6656 all 1:20230515-r0<br>linux-firmware-vt6656-lice=
nse all 1:20230515-r0<br>linux-firmware-whence-license all 1:20230515-r0<br=
>linux-firmware-wl12xx all 1:20230515-r0<br>linux-firmware-wl18xx all 1:202=
30515-r0<br>linux-firmware-wlcommon all 1:20230515-r0<br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Di., 25. Juli 2=
023 um 11:52=C2=A0Uhr schrieb Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 25 Jul 2023 at=
 11:28, Andreas &lt;<a href=3D"mailto:rehn.andreas86@gmail.com" target=3D"_=
blank">rehn.andreas86@gmail.com</a>&gt; wrote:<br>
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
</blockquote></div>

--0000000000003bff9706014f69dc--

