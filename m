Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B356C001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 13:18:14 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.20103.1690291092404539214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 06:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=i4zwXyHY;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f954d7309fso6949304e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690291090; x=1690895890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKvPZsP7wxs34v59Xb6Ygrlm22QTInYfVVWZLCPPhes=;
        b=i4zwXyHYUzx9J9/N4q3c8MwOGpgg0A8KqeuLB/Oh87H3yM8tLP6tEbkKLM4kIMR5eU
         IDoyegg6vECI8W/MjNpNaSgCm6TM0D5OlvGH6egN7eHYpNxtBsSBo7KA4R8lN0IPxa1c
         pNRyXP5acFqKPmHhZfnYlF8gnIpTNqRjMgco0ZbTQDJ7pj6N5kr4dttdg1x/N96KPsc4
         1q9BbgfGYcL0uZ0UonFmCQ3/8EGNMBspumpisRPpnh44lPsFqPHvrLvAT8Fz3hiToank
         5ItQ9xMw5zvBbsVQPwEiaLoAZ74FoQ4aIzzoJAiOBiIJN0lS3Y/QIhT+uMOdPEG3Nl82
         dSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690291090; x=1690895890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKvPZsP7wxs34v59Xb6Ygrlm22QTInYfVVWZLCPPhes=;
        b=N4fa+nZ2nAbdlvQ/X5/WSk6RzHuYN8hC4VvOdzt9W2A2wK7XGp31q9rRtVuP+eZUAi
         +j0j/A+dR6bCYtOEZcmz3H70ys6PbEobupZawKShhLv6Y++JM0Z5gyXrFpY/mNNodOdI
         ljJiDKuKi+ZBcz7wqIBZezoAidpbH9X1nFzqE4u/PhlosOb3g9+AoojGEMZR1ErKKWou
         RK7R9y79M3I18ZUt0C3nMdh0bac6AbPNDi+nM7Yy9iWP3qnRhVeEwYMf713p7oL1piao
         1o7VNvH9hYUszC/RuXkz5y+r2xKI9zU2NWFLup35RwFyokYvn1KCLbFLWCDHHvCS342W
         LTBg==
X-Gm-Message-State: ABy/qLZ6aPNpx/3CjfJDdRwU8VhnxBjIlHs2p4hAZUq0IbQiyX4XoiId
	OzIlrsBnYfU7CrsEpuXbYDEQQ3c48v7gRFiE6aI=
X-Google-Smtp-Source: APBJJlEu06UHh7rWQ/xckmX9iR5IFTAgzvXgkAebFNN4dYz6jgYOYWVuhsI0OBr3uDsO/QpkwWys93YRd3LMcZeAztE=
X-Received: by 2002:a05:6512:1285:b0:4fd:ddbc:157d with SMTP id
 u5-20020a056512128500b004fdddbc157dmr1019338lfs.7.1690291089834; Tue, 25 Jul
 2023 06:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <7JrI.1690277290613913360.PhKO@lists.openembedded.org>
 <CANNYZj_tCWzW84+yVSRXECpodY=XetmNXzVbMgwcQR5Cn-zORA@mail.gmail.com>
 <CAPmT5DeEKag1p7kebruEyVH2T0nFKxEXw9GOHTSvwKvajf5Lmg@mail.gmail.com>
 <CA+chaQdGrht-VJORDvwL=QNEmXx5Q7aZqoEPN2vAiTM1DOZJyA@mail.gmail.com>
 <CAPmT5Dd6+C=c-yhBMAV-b8=7N8_+qtRg1gN1eTkS7apwzPnQUA@mail.gmail.com> <CA+chaQe1B0wmGFVFpxT3io2_YEQ8sFOq95+RUHYfvfmw-umWkw@mail.gmail.com>
In-Reply-To: <CA+chaQe1B0wmGFVFpxT3io2_YEQ8sFOq95+RUHYfvfmw-umWkw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Jul 2023 15:17:57 +0200
Message-ID: <CANNYZj_HzGe+h74s41K7J9+8UDhYfzvQgAP-shYOP65y0Jqr=A@mail.gmail.com>
Subject: Re: [OE-core] dunfell: poky 3.1.27 - full linux-firmware always in image
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Andreas Rehn <rehn.andreas86@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 13:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184843

Indeed, does this issue happen on plain poky dunfell build with no
other layers added to it? If it doesn't, then it's very difficult to
give help because it becomes a never ending exchange of 'try this' and
'try that' - not a good use of anyone's time. You need to demonstrate
how we can reproduce the issue on our side.

Alex

On Tue, 25 Jul 2023 at 15:07, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> That shows you that e.g. linux-firmware-mt7601u now depends on linux-firm=
ware:
>
> "linux-firmware-mt7601u" -> "linux-firmware"
> "linux-firmware-mt7601u" -> "linux-firmware-mt7601u-license"
>
> now use bitbake-getvar or bitbake -e to figure out this happens for you (=
doesn't for me). Probably some other layer your're using. If you reply agai=
n with "bitbake -e" output without any initiative to actually debug it your=
self, I won't reply.
>
> On Tue, Jul 25, 2023 at 2:40=E2=80=AFPM Andreas Rehn <rehn.andreas86@gmai=
l.com> wrote:
>>
>> before:
>> "linux-firmware-mt7601u" -> "linux-firmware-mt7601u-license"
>> "linux-firmware-ralink" -> "linux-firmware-ralink-license"
>> "linux-firmware-rtl8168" -> "linux-firmware-whence-license"
>> "linux-firmware-rtl8188" -> "linux-firmware-rtl-license"
>> "linux-firmware-rtl8192ce" -> "linux-firmware-rtl-license"
>> "linux-firmware-rtl8192cu" -> "linux-firmware-rtl-license"
>> "linux-firmware-rtl8192eu" -> "linux-firmware-rtl-license"
>> "linux-firmware-rtl8192su" -> "linux-firmware-rtl-license"
>> "linux-firmware-rtl8723" -> "linux-firmware-rtl-license"
>> "linux-firmware-rtl8821" -> "linux-firmware-rtl-license"
>>
>> after:
>> "linux-firmware-adsp-sst" -> "linux-firmware"
>> "linux-firmware-adsp-sst" -> "linux-firmware-adsp-sst-license"
>> "linux-firmware-amlogic-vdec" -> "linux-firmware-amlogic-vdec-license"
>> "linux-firmware-ar3k" -> "linux-firmware-ar3k-license"
>> "linux-firmware-ar3k" -> "linux-firmware-atheros-license"
>> "linux-firmware-ar9170" -> "linux-firmware-atheros-license"
>> "linux-firmware-ath10k" -> "linux-firmware-ath10k-license"
>> "linux-firmware-ath11k" -> "linux-firmware-ath10k-license"
>> "linux-firmware-ath6k" -> "linux-firmware-atheros-license"
>> "linux-firmware-ath9k" -> "linux-firmware-atheros-license"
>> "linux-firmware-bcm-0bb4-0306" -> "linux-firmware-cypress-license"
>> "linux-firmware-bcm43143" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm43236b" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm43241b0" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm43241b4" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm43241b5" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm43242a" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4329-fullmac" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4329" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4330" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm43340" -> "linux-firmware-cypress-license"
>> "linux-firmware-bcm4334" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4335" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm43362" -> "linux-firmware-cypress-license"
>> "linux-firmware-bcm4339" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm43430a0" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm43430" -> "linux-firmware-cypress-license"
>> "linux-firmware-bcm43455" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4350c2" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4350" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4354" -> "linux-firmware-cypress-license"
>> "linux-firmware-bcm43569" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4356" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4356-pcie" -> "linux-firmware-cypress-license"
>> "linux-firmware-bcm43570" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4358" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm43602" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4366b" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4366c" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4371" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm4373" -> "linux-firmware"
>> "linux-firmware-bcm4373" -> "linux-firmware-cypress-license"
>> "linux-firmware-bcm43xx-hdr" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bcm43xx" -> "linux-firmware-broadcom-license"
>> "linux-firmware-bnx2-mips" -> "linux-firmware-whence-license"
>> "linux-firmware-carl9170" -> "linux-firmware-gplv2-license"
>> "linux-firmware-i915" -> "linux-firmware-i915-license"
>> "linux-firmware-ibt-11-5" -> "linux-firmware-ibt-license"
>> "linux-firmware-ibt-12-16" -> "linux-firmware-ibt-license"
>> "linux-firmware-ibt-17" -> "linux-firmware-ibt-license"
>> "linux-firmware-ibt-20" -> "linux-firmware-ibt-license"
>> "linux-firmware-ibt-hw-37-7" -> "linux-firmware-ibt-license"
>> "linux-firmware-ibt" -> "linux-firmware-ibt-11-5" [style=3Ddotted]
>> "linux-firmware-ibt" -> "linux-firmware-ibt-12-16" [style=3Ddotted]
>> "linux-firmware-ibt" -> "linux-firmware-ibt-17" [style=3Ddotted]
>> "linux-firmware-ibt" -> "linux-firmware-ibt-20" [style=3Ddotted]
>> "linux-firmware-ibt" -> "linux-firmware-ibt-hw-37-7" [style=3Ddotted]
>> "linux-firmware-ibt" -> "linux-firmware-ibt-hw-37-8" [style=3Ddotted]
>> "linux-firmware-ibt" -> "linux-firmware-ibt-license" [style=3Ddotted]
>> "linux-firmware-ibt" -> "linux-firmware-ibt-misc" [style=3Ddotted]
>> "linux-firmware-ibt-misc" -> "linux-firmware-ibt-license"
>> "linux-firmware-ice" -> "linux-firmware-ice-license"
>> "linux-firmware-imx-sdma-imx6q" -> "linux-firmware-imx-sdma-license"
>> "linux-firmware-imx-sdma-imx7d" -> "linux-firmware-imx-sdma-license"
>> "linux-firmware-iwlwifi-135-6" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware-iwlwifi-3160-17" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware-iwlwifi-6000-4" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware-iwlwifi-6000g2a-6" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware-iwlwifi-6000g2b-6" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware-iwlwifi-6050-5" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware-iwlwifi-7260" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware-iwlwifi-7265d" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware-iwlwifi-7265" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware-iwlwifi-8000c" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware-iwlwifi-8265" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware-iwlwifi-9000" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-135-6" [style=3Ddott=
ed]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-10" [style=3Ddo=
tted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-12" [style=3Ddo=
tted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-13" [style=3Ddo=
tted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-16" [style=3Ddo=
tted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-17" [style=3Ddo=
tted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-7" [style=3Ddot=
ted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-8" [style=3Ddot=
ted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-9" [style=3Ddot=
ted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000-4" [style=3Ddot=
ted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2a-5" [style=3D=
dotted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2a-6" [style=3D=
dotted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2b-5" [style=3D=
dotted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2b-6" [style=3D=
dotted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6050-4" [style=3Ddot=
ted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6050-5" [style=3Ddot=
ted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-7260" [style=3Ddotte=
d]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-7265d" [style=3Ddott=
ed]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-7265" [style=3Ddotte=
d]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-8000c" [style=3Ddott=
ed]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-8265" [style=3Ddotte=
d]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-9000" [style=3Ddotte=
d]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-license" [style=3Ddo=
tted]
>> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-misc" [style=3Ddotte=
d]
>> "linux-firmware-iwlwifi-misc" -> "linux-firmware-iwlwifi-license"
>> "linux-firmware" -> "linux-firmware-adsp-sst-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-adsp-sst" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-amlogic-vdec-license" [style=3Ddotte=
d]
>> "linux-firmware" -> "linux-firmware-amlogic-vdec" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ar3k-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ar3k" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ar9170" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ath10k-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ath10k" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ath11k" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ath6k" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ath9k" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-atheros-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm-0bb4-0306"
>> "linux-firmware" -> "linux-firmware-bcm-0bb4-0306" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43143" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43236b" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43241b0" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43241b4" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43241b5" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43242a" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4329-fullmac" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4329" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4330" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43340" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4334" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4335" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43362" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4339" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43430a0" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43430" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43455" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4350c2" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4350" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4354" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43569" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4356-pcie" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4356" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43570" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4358" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43602" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4366b" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4366c" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4371" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm4373" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43xx-hdr" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bcm43xx" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-bnx2-mips" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-broadcom-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-carl9170" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-cypress-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-gplv2-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-i915-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-i915" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ibt-11-5" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ibt-12-16" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ibt-17" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ibt-20" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ibt-hw-37-7" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ibt-hw-37-8" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ibt-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ibt-misc" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ibt" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ice-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ice" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-imx-sdma-imx6q" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-imx-sdma-imx7d" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-imx-sdma-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-135-6" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-3160-10" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-3160-12" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-3160-13" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-3160-16" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-3160-17" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-3160-7" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-3160-8" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-3160-9" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-6000-4" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-6000g2a-5" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-6000g2a-6" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-6000g2b-5" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-6000g2b-6" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-6050-4" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-6050-5" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-7260" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-7265d" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-7265" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-8000c" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-8265" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-9000" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi-misc" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-iwlwifi" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-license"
>> "linux-firmware" -> "linux-firmware-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-liquidio" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-lontium-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-lt9611uxc" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-marvell-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-mt7601u-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-mt7601u" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-netronome-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-netronome" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-nvidia-gpu" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-nvidia-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-nvidia-tegra-k1" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-nvidia-tegra" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-pcie8897" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-pcie8997" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qat-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qat" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qca" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-adreno-a2xx" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-adreno-a3xx" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-adreno-a4xx" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-adreno-a530" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-adreno-a630" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-adreno-a650" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-adreno-a660" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-apq8096-audio" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-apq8096-modem" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno" [s=
tyle=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio" [st=
yle=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [s=
tyle=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compute" [=
style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors" [=
style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-sdm845-audio" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-sdm845-compute" [style=3Ddotted=
]
>> "linux-firmware" -> "linux-firmware-qcom-sdm845-modem" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-sm8250-audio" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-sm8250-compute" [style=3Ddotted=
]
>> "linux-firmware" -> "linux-firmware-qcom-venus-1.8" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-venus-4.2" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-venus-5.2" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-venus-5.4" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-vpu-1.0" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-vpu-2.0" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-qcom-yamato-license" [style=3Ddotted=
]
>> "linux-firmware" -> "linux-firmware-radeon-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-radeon" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ralink-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ralink" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-rs9113" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-rs9116" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-rtl8168" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-rtl8188" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-rtl8192ce" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-rtl8192cu" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-rtl8192eu"
>> "linux-firmware" -> "linux-firmware-rtl8192eu" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-rtl8192su" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-rtl8723" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-rtl8821" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-rtl-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-sd8686" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-sd8688" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-sd8787" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-sd8797" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-sd8801" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-sd8887" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-sd8897" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-sd8997" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-ti-connectivity-license" [style=3Ddo=
tted]
>> "linux-firmware" -> "linux-firmware-usb8997" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-vt6656-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-vt6656" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-whence-license"
>> "linux-firmware" -> "linux-firmware-whence-license" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-wl12xx" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-wl18xx" [style=3Ddotted]
>> "linux-firmware" -> "linux-firmware-wlcommon" [style=3Ddotted]
>> "linux-firmware-mt7601u" -> "linux-firmware"
>> "linux-firmware-mt7601u" -> "linux-firmware-mt7601u-license"
>> "linux-firmware-netronome" -> "linux-firmware-netronome-license"
>> "linux-firmware-nvidia-gpu" -> "linux-firmware-nvidia-license"
>> "linux-firmware-nvidia-tegra-k1" -> "linux-firmware-nvidia-license"
>> "linux-firmware-nvidia-tegra" -> "linux-firmware-nvidia-gpu"
>> "linux-firmware-nvidia-tegra" -> "linux-firmware-nvidia-license"
>> "linux-firmware-qat" -> "linux-firmware-qat-license"
>> "linux-firmware-qca" -> "linux-firmware-ath10k-license"
>> "linux-firmware-qcom-adreno-a2xx" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-adreno-a2xx" -> "linux-firmware-qcom-yamato-license=
"
>> "linux-firmware-qcom-adreno-a4xx" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-adreno-a530" -> "linux-firmware"
>> "linux-firmware-qcom-adreno-a530" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-adreno-a630" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-adreno-a650" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-adreno-a660" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-apq8096-audio" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-apq8096-modem" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno" -> "linux-firmware-qco=
m-license"
>> "linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno" -> "linux-firmware-qco=
m-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
>> "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio" -> "linux-firmware-qcom=
-license"
>> "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio" -> "linux-firmware-qcom=
-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
>> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compute" -> "linux-firmware-qc=
om-license"
>> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compute" -> "linux-firmware-qc=
om-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
>> "linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors" -> "linux-firmware-qc=
om-license"
>> "linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors" -> "linux-firmware-qc=
om-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
>> "linux-firmware-qcom-sdm845-audio" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-sdm845-compute" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-sdm845-modem" -> "linux-firmware-ath10k"
>> "linux-firmware-qcom-sdm845-modem" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-sm8250-audio" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-sm8250-compute" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-venus-1.8" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-venus-4.2" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-venus-5.2" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-venus-5.4" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-vpu-1.0" -> "linux-firmware-qcom-license"
>> "linux-firmware-qcom-vpu-2.0" -> "linux-firmware-qcom-license"
>> "linux-firmware-radeon" -> "linux-firmware-radeon-license"
>> "linux-firmware-ralink" -> "linux-firmware-ralink-license"
>> "linux-firmware-rs9113" -> "linux-firmware-whence-license"
>> "linux-firmware-rs9116" -> "linux-firmware-whence-license"
>> "linux-firmware-rtl8168" -> "linux-firmware-whence-license"
>> "linux-firmware-rtl8188" -> "linux-firmware-rtl-license"
>> "linux-firmware-rtl8192ce" -> "linux-firmware-rtl-license"
>> "linux-firmware-rtl8192cu" -> "linux-firmware-rtl-license"
>> "linux-firmware-rtl8192eu" -> "linux-firmware-rtl-license"
>> "linux-firmware-rtl8192su" -> "linux-firmware-rtl-license"
>> "linux-firmware-rtl8723" -> "linux-firmware-rtl-license"
>> "linux-firmware-rtl8821" -> "linux-firmware-rtl-license"
>> "linux-firmware-sd8686" -> "linux-firmware-marvell-license"
>> "linux-firmware-sd8688" -> "linux-firmware-marvell-license"
>> "linux-firmware-sd8787" -> "linux-firmware-marvell-license"
>> "linux-firmware-sd8797" -> "linux-firmware-marvell-license"
>> "linux-firmware-sd8801" -> "linux-firmware-marvell-license"
>> "linux-firmware-sd8887" -> "linux-firmware-marvell-license"
>> "linux-firmware-sd8897" -> "linux-firmware-marvell-license"
>> "linux-firmware-sd8997" -> "linux-firmware-marvell-license"
>> "linux-firmware-usb8997" -> "linux-firmware-marvell-license"
>> "linux-firmware-vt6656" -> "linux-firmware-vt6656-license"
>> "linux-firmware-wl12xx" -> "linux-firmware-ti-connectivity-license"
>> "linux-firmware-wl12xx" -> "linux-firmware-wlcommon"
>> "linux-firmware-wl18xx" -> "linux-firmware-ti-connectivity-license"
>> "linux-firmware-wl18xx" -> "linux-firmware-wlcommon"
>>
>> Am Di., 25. Juli 2023 um 14:20 Uhr schrieb Martin Jansa <martin.jansa@gm=
ail.com>:
>>>
>>> now figure out what depends on linux-firmware from your image
>>>
>>> grep linux-firmware buildhistory/images/your-machine/your-libc/your-ima=
ge/depends.dot
>>>
>>> and then git log will help you with the rest (FWIW: I don't see linux-f=
irmware in our dunfell images).
>>>
>>> On Tue, Jul 25, 2023 at 2:01=E2=80=AFPM Andreas Rehn <rehn.andreas86@gm=
ail.com> wrote:
>>>>
>>>> hey alex,
>>>> thx for have a look
>>>>
>>>> before
>>>>
>>>> linux-firmware-mt7601u-license
>>>> linux-firmware-mt7601u
>>>> linux-firmware-ralink-license
>>>> linux-firmware-ralink
>>>> linux-firmware-rtl8168
>>>> linux-firmware-rtl8188
>>>> linux-firmware-rtl8192ce
>>>> linux-firmware-rtl8192cu
>>>> linux-firmware-rtl8192eu
>>>> linux-firmware-rtl8192su
>>>> linux-firmware-rtl8723
>>>> linux-firmware-rtl8821
>>>> linux-firmware-rtl-license
>>>> linux-firmware-whence-license
>>>>
>>>> after
>>>>
>>>> libz1 aarch64 1.2.11-r0
>>>> linux-firmware all 1:20230515-r0
>>>> linux-firmware-adsp-sst all 1:20230515-r0
>>>> linux-firmware-adsp-sst-license all 1:20230515-r0
>>>> linux-firmware-amlogic-vdec all 1:20230515-r0
>>>> linux-firmware-amlogic-vdec-license all 1:20230515-r0
>>>> linux-firmware-ar3k all 1:20230515-r0
>>>> linux-firmware-ar3k-license all 1:20230515-r0
>>>> linux-firmware-ar9170 all 1:20230515-r0
>>>> linux-firmware-ath10k all 1:20230515-r0
>>>> linux-firmware-ath10k-license all 1:20230515-r0
>>>> linux-firmware-ath11k all 1:20230515-r0
>>>> linux-firmware-ath6k all 1:20230515-r0
>>>> linux-firmware-ath9k all 1:20230515-r0
>>>> linux-firmware-atheros-license all 1:20230515-r0
>>>> linux-firmware-bcm-0bb4-0306 all 1:20230515-r0
>>>> linux-firmware-bcm43143 all 1:20230515-r0
>>>> linux-firmware-bcm43236b all 1:20230515-r0
>>>> linux-firmware-bcm43241b0 all 1:20230515-r0
>>>> linux-firmware-bcm43241b4 all 1:20230515-r0
>>>> linux-firmware-bcm43241b5 all 1:20230515-r0
>>>> linux-firmware-bcm43242a all 1:20230515-r0
>>>> linux-firmware-bcm4329 all 1:20230515-r0
>>>> linux-firmware-bcm4329-fullmac all 1:20230515-r0
>>>> linux-firmware-bcm4330 all 1:20230515-r0
>>>> linux-firmware-bcm4334 all 1:20230515-r0
>>>> linux-firmware-bcm43340 all 1:20230515-r0
>>>> linux-firmware-bcm4335 all 1:20230515-r0
>>>> linux-firmware-bcm43362 all 1:20230515-r0
>>>> linux-firmware-bcm4339 all 1:20230515-r0
>>>> linux-firmware-bcm43430 all 1:20230515-r0
>>>> linux-firmware-bcm43430a0 all 1:20230515-r0
>>>> linux-firmware-bcm43455 all 1:20230515-r0
>>>> linux-firmware-bcm4350 all 1:20230515-r0
>>>> linux-firmware-bcm4350c2 all 1:20230515-r0
>>>> linux-firmware-bcm4354 all 1:20230515-r0
>>>> linux-firmware-bcm4356 all 1:20230515-r0
>>>> linux-firmware-bcm4356-pcie all 1:20230515-r0
>>>> linux-firmware-bcm43569 all 1:20230515-r0
>>>> linux-firmware-bcm43570 all 1:20230515-r0
>>>> linux-firmware-bcm4358 all 1:20230515-r0
>>>> linux-firmware-bcm43602 all 1:20230515-r0
>>>> linux-firmware-bcm4366b all 1:20230515-r0
>>>> linux-firmware-bcm4366c all 1:20230515-r0
>>>> linux-firmware-bcm4371 all 1:20230515-r0
>>>> linux-firmware-bcm4373 all 1:20230515-r0
>>>> linux-firmware-bcm43xx all 1:20230515-r0
>>>> linux-firmware-bcm43xx-hdr all 1:20230515-r0
>>>> linux-firmware-bnx2-mips all 1:20230515-r0
>>>> linux-firmware-broadcom-license all 1:20230515-r0
>>>> linux-firmware-carl9170 all 1:20230515-r0
>>>> linux-firmware-cypress-license all 1:20230515-r0
>>>> linux-firmware-gplv2-license all 1:20230515-r0
>>>> linux-firmware-i915 all 1:20230515-r0
>>>> linux-firmware-i915-license all 1:20230515-r0
>>>> linux-firmware-ibt all 1:20230515-r0
>>>> linux-firmware-ibt-11-5 all 1:20230515-r0
>>>> linux-firmware-ibt-12-16 all 1:20230515-r0
>>>> linux-firmware-ibt-17 all 1:20230515-r0
>>>> linux-firmware-ibt-20 all 1:20230515-r0
>>>> linux-firmware-ibt-hw-37-7 all 1:20230515-r0
>>>> linux-firmware-ibt-hw-37-8 all 1:20230515-r0
>>>> linux-firmware-ibt-license all 1:20230515-r0
>>>> linux-firmware-ibt-misc all 1:20230515-r0
>>>> linux-firmware-ice all 1:20230515-r0
>>>> linux-firmware-ice-license all 1:20230515-r0
>>>> linux-firmware-imx-sdma-imx6q all 1:20230515-r0
>>>> linux-firmware-imx-sdma-imx7d all 1:20230515-r0
>>>> linux-firmware-imx-sdma-license all 1:20230515-r0
>>>> linux-firmware-iwlwifi all 1:20230515-r0
>>>> linux-firmware-iwlwifi-135-6 all 1:20230515-r0
>>>> linux-firmware-iwlwifi-3160-17 all 1:20230515-r0
>>>> linux-firmware-iwlwifi-6000-4 all 1:20230515-r0
>>>> linux-firmware-iwlwifi-6000g2a-6 all 1:20230515-r0
>>>> linux-firmware-iwlwifi-6000g2b-6 all 1:20230515-r0
>>>> linux-firmware-iwlwifi-6050-5 all 1:20230515-r0
>>>> linux-firmware-iwlwifi-7260 all 1:20230515-r0
>>>> linux-firmware-iwlwifi-7265 all 1:20230515-r0
>>>> linux-firmware-iwlwifi-7265d all 1:20230515-r0
>>>> linux-firmware-iwlwifi-8000c all 1:20230515-r0
>>>> linux-firmware-iwlwifi-8265 all 1:20230515-r0
>>>> linux-firmware-iwlwifi-9000 all 1:20230515-r0
>>>> linux-firmware-iwlwifi-license all 1:20230515-r0
>>>> linux-firmware-iwlwifi-misc all 1:20230515-r0
>>>> linux-firmware-license all 1:20230515-r0
>>>> linux-firmware-liquidio all 1:20230515-r0
>>>> linux-firmware-lontium-license all 1:20230515-r0
>>>> linux-firmware-lt9611uxc all 1:20230515-r0
>>>> linux-firmware-marvell-license all 1:20230515-r0
>>>> linux-firmware-mt7601u all 1:20230515-r0
>>>> linux-firmware-mt7601u-license all 1:20230515-r0
>>>> linux-firmware-netronome all 1:20230515-r0
>>>> linux-firmware-netronome-license all 1:20230515-r0
>>>> linux-firmware-nvidia-gpu all 1:20230515-r0
>>>> linux-firmware-nvidia-license all 1:20230515-r0
>>>> linux-firmware-nvidia-tegra all 1:20230515-r0
>>>> linux-firmware-nvidia-tegra-k1 all 1:20230515-r0
>>>> linux-firmware-pcie8897 all 1:20230515-r0
>>>> linux-firmware-pcie8997 all 1:20230515-r0
>>>> linux-firmware-qat all 1:20230515-r0
>>>> linux-firmware-qat-license all 1:20230515-r0
>>>> linux-firmware-qca all 1:20230515-r0
>>>> linux-firmware-qcom-adreno-a2xx all 1:20230515-r0
>>>> linux-firmware-qcom-adreno-a3xx all 1:20230515-r0
>>>> linux-firmware-qcom-adreno-a4xx all 1:20230515-r0
>>>> linux-firmware-qcom-adreno-a530 all 1:20230515-r0
>>>> linux-firmware-qcom-adreno-a630 all 1:20230515-r0
>>>> linux-firmware-qcom-adreno-a650 all 1:20230515-r0
>>>> linux-firmware-qcom-adreno-a660 all 1:20230515-r0
>>>> linux-firmware-qcom-apq8096-audio all 1:20230515-r0
>>>> linux-firmware-qcom-apq8096-modem all 1:20230515-r0
>>>> linux-firmware-qcom-license all 1:20230515-r0
>>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno all 1:20230515-r0
>>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-audio all 1:20230515-r0
>>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-compat all 1:20230515-r0
>>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-compute all 1:20230515-r0
>>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors all 1:20230515-r0
>>>> linux-firmware-qcom-sdm845-audio all 1:20230515-r0
>>>> linux-firmware-qcom-sdm845-compute all 1:20230515-r0
>>>> linux-firmware-qcom-sdm845-modem all 1:20230515-r0
>>>> linux-firmware-qcom-sm8250-audio all 1:20230515-r0
>>>> linux-firmware-qcom-sm8250-compute all 1:20230515-r0
>>>> linux-firmware-qcom-venus-1.8 all 1:20230515-r0
>>>> linux-firmware-qcom-venus-4.2 all 1:20230515-r0
>>>> linux-firmware-qcom-venus-5.2 all 1:20230515-r0
>>>> linux-firmware-qcom-venus-5.4 all 1:20230515-r0
>>>> linux-firmware-qcom-vpu-1.0 all 1:20230515-r0
>>>> linux-firmware-qcom-vpu-2.0 all 1:20230515-r0
>>>> linux-firmware-qcom-yamato-license all 1:20230515-r0
>>>> linux-firmware-radeon all 1:20230515-r0
>>>> linux-firmware-radeon-license all 1:20230515-r0
>>>> linux-firmware-ralink all 1:20230515-r0
>>>> linux-firmware-ralink-license all 1:20230515-r0
>>>> linux-firmware-rs9113 all 1:20230515-r0
>>>> linux-firmware-rs9116 all 1:20230515-r0
>>>> linux-firmware-rtl-license all 1:20230515-r0
>>>> linux-firmware-rtl8168 all 1:20230515-r0
>>>> linux-firmware-rtl8188 all 1:20230515-r0
>>>> linux-firmware-rtl8192ce all 1:20230515-r0
>>>> linux-firmware-rtl8192cu all 1:20230515-r0
>>>> linux-firmware-rtl8192eu all 1:20230515-r0
>>>> linux-firmware-rtl8192su all 1:20230515-r0
>>>> linux-firmware-rtl8723 all 1:20230515-r0
>>>> linux-firmware-rtl8821 all 1:20230515-r0
>>>> linux-firmware-sd8686 all 1:20230515-r0
>>>> linux-firmware-sd8688 all 1:20230515-r0
>>>> linux-firmware-sd8787 all 1:20230515-r0
>>>> linux-firmware-sd8797 all 1:20230515-r0
>>>> linux-firmware-sd8801 all 1:20230515-r0
>>>> linux-firmware-sd8887 all 1:20230515-r0
>>>> linux-firmware-sd8897 all 1:20230515-r0
>>>> linux-firmware-sd8997 all 1:20230515-r0
>>>> linux-firmware-ti-connectivity-license all 1:20230515-r0
>>>> linux-firmware-usb8997 all 1:20230515-r0
>>>> linux-firmware-vt6656 all 1:20230515-r0
>>>> linux-firmware-vt6656-license all 1:20230515-r0
>>>> linux-firmware-whence-license all 1:20230515-r0
>>>> linux-firmware-wl12xx all 1:20230515-r0
>>>> linux-firmware-wl18xx all 1:20230515-r0
>>>> linux-firmware-wlcommon all 1:20230515-r0
>>>>
>>>> Am Di., 25. Juli 2023 um 11:52 Uhr schrieb Alexander Kanavin <alex.kan=
avin@gmail.com>:
>>>>>
>>>>> On Tue, 25 Jul 2023 at 11:28, Andreas <rehn.andreas86@gmail.com> wrot=
e:
>>>>> > i encountered issues with the new poky release on dunfell.
>>>>> > explicitly linux-firmware: commit hash a04b507d39d668a02b7ebd990c94=
194cde16bf2f
>>>>> >
>>>>> > i building dunfell images since 1,5 years and my images are normaly=
 1,9 GB big.
>>>>> > however since Sunday 23.07, the image size increases by 1GB due to =
the full firmware installation.
>>>>> >
>>>>> > i double checked it with the previous commit 0bf993da8b6e6511a4123e=
d15421bdd76a4c1f38 and the image size is as expected.
>>>>> >
>>>>> > i hope someone is able to help, because this is an unexpected behav=
ior.
>>>>> >
>>>>> > PS: this my first post so please have mercy on me. :)
>>>>>
>>>>> Can you enable buildhistory as described in
>>>>> https://docs.yoctoproject.org/dev/dev-manual/build-quality.html
>>>>> then build linux-firmware before and after the change, then run
>>>>> buildhistory-diff? That should highlight where the size increase come
>>>>> from in its packaging.
>>>>>
>>>>> You can also manually inspect linux-firmware's ${WORKDIR}/packages-sp=
it/.
>>>>>
>>>>> Alex
>>>>
>>>>
>>>>
>>>> Andreas
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#184838): https://lists.openembedded.org/g/openembe=
dded-core/message/184838
>>>> Mute This Topic: https://lists.openembedded.org/mt/100346886/3617156
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[Martin.Jansa@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>
>> Andreas

