Return-Path: <rehn.andreas86@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC48C001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 14:35:34 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web10.21957.1690295728332270374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 07:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iogBTtrS;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: rehn.andreas86@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-48137f8b118so4480709e0c.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690295727; x=1690900527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iqZgSySLQ6+sfh2Db7FMp+GFNv3Pb4zGcgfbFn51PjU=;
        b=iogBTtrSdFXUc+u370wAoGAQo8iHho1nNKmlT7rV1PcfAI46oWo/lVN/vRVQz96SfI
         1al1qKekxaehAUKnA4O/f40qPOtnMbsjGquM6zQ/P+eZ3osGGlCBy65XU+kCwhBx8hgj
         lNcgBTfLht96V2hAgmnhbK2kvJqrp/vr92iibWsWTA+3QK7vYcIkO8w9bQ/updCgh9gU
         wpgJkGq6buLQ77uLqCcNWbwNtwip5UTp3/z1Igb2S7NI1gScSMjmPrVzy0J6y+J8eQDy
         xyTch1Y58K/pDl64IXUbQCmyatcZXuCELUxOpaXp9wh4hyk1isP3rJGtrFXWIUTBq/B+
         CMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690295727; x=1690900527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqZgSySLQ6+sfh2Db7FMp+GFNv3Pb4zGcgfbFn51PjU=;
        b=ELLrMZfGMbO0hfV/HIuGA0jyoongZtJxE3n3YXL+u3CdZfQpeABW9X8y2x6lW8GTF+
         9SJB7NuiPXHVwQRet+pyUOZ7U3SuMWaJUU6ScK7+q5TiRhr2VMOrWbNyLindKTP3VE8D
         lErLZ+eeoSrASEJRrqWF0LMF4Rr9A7LWaR0VacPS25isfF2L1kaF9MmID1q/RS9AtJim
         3fNWIuZ2iJffypFkq1lNizdJjSp7i0vlpJ7tAZPql2JwH0m1IKmLnvBSZpqqnBqTDDiy
         9QeNMsERVHP6P5FVLAUn7QlCP0X7vLhHQ7GjDluaypGxrs/0YISVgKIoLo63Pz+S0dY8
         LkTQ==
X-Gm-Message-State: ABy/qLaHQuB5P0cgaJ82NSUq2RH+NvgMypZSVtAZJMeGSxACwUs+Ckbf
	KMekpzE7UuKCg0BilgrtmkARXx+xpWR901SepB8=
X-Google-Smtp-Source: APBJJlHVorA3WxWr5N5BfTskOiM1HtgFy/GzEsTOZLEhsQApemIiPNO6e/a/XbjkHELoyELpwCgPUaFRvco98oTVkLE=
X-Received: by 2002:a1f:a9cd:0:b0:458:8ee3:cad9 with SMTP id
 s196-20020a1fa9cd000000b004588ee3cad9mr785849vke.8.1690295727009; Tue, 25 Jul
 2023 07:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <7JrI.1690277290613913360.PhKO@lists.openembedded.org>
 <CANNYZj_tCWzW84+yVSRXECpodY=XetmNXzVbMgwcQR5Cn-zORA@mail.gmail.com>
 <CAPmT5DeEKag1p7kebruEyVH2T0nFKxEXw9GOHTSvwKvajf5Lmg@mail.gmail.com>
 <CA+chaQdGrht-VJORDvwL=QNEmXx5Q7aZqoEPN2vAiTM1DOZJyA@mail.gmail.com>
 <CAPmT5Dd6+C=c-yhBMAV-b8=7N8_+qtRg1gN1eTkS7apwzPnQUA@mail.gmail.com>
 <CA+chaQe1B0wmGFVFpxT3io2_YEQ8sFOq95+RUHYfvfmw-umWkw@mail.gmail.com> <CANNYZj_HzGe+h74s41K7J9+8UDhYfzvQgAP-shYOP65y0Jqr=A@mail.gmail.com>
In-Reply-To: <CANNYZj_HzGe+h74s41K7J9+8UDhYfzvQgAP-shYOP65y0Jqr=A@mail.gmail.com>
From: Andreas Rehn <rehn.andreas86@gmail.com>
Date: Tue, 25 Jul 2023 16:35:15 +0200
Message-ID: <CAPmT5DfH1JECMt2YYkrPPtu-DB6bbxCZo73OxUH_fkz6YE7LqQ@mail.gmail.com>
Subject: Re: [OE-core] dunfell: poky 3.1.27 - full linux-firmware always in image
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005fb54c060150a433"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 14:35:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184846

--0000000000005fb54c060150a433
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

I tried a bit and as Martin suggested -
if I remove `linux-firmware-mt7601u` the issue is gone.

as you can see in my list, there are also other packages depending on
linux-firmware

"linux-firmware-adsp-sst" -> "linux-firmware"
"linux-firmware-bcm4373" -> "linux-firmware"
"linux-firmware-mt7601u" -> "linux-firmware"
"linux-firmware-qcom-adreno-a530" -> "linux-firmware"

looks like a ring dependency

if you add one of the the mentioned packages, you should see the same issue

Am Di., 25. Juli 2023 um 15:18 Uhr schrieb Alexander Kanavin <
alex.kanavin@gmail.com>:

> Indeed, does this issue happen on plain poky dunfell build with no
> other layers added to it? If it doesn't, then it's very difficult to
> give help because it becomes a never ending exchange of 'try this' and
> 'try that' - not a good use of anyone's time. You need to demonstrate
> how we can reproduce the issue on our side.
>
> Alex
>
> On Tue, 25 Jul 2023 at 15:07, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> >
> > That shows you that e.g. linux-firmware-mt7601u now depends on
> linux-firmware:
> >
> > "linux-firmware-mt7601u" -> "linux-firmware"
> > "linux-firmware-mt7601u" -> "linux-firmware-mt7601u-license"
> >
> > now use bitbake-getvar or bitbake -e to figure out this happens for you
> (doesn't for me). Probably some other layer your're using. If you reply
> again with "bitbake -e" output without any initiative to actually debug i=
t
> yourself, I won't reply.
> >
> > On Tue, Jul 25, 2023 at 2:40=E2=80=AFPM Andreas Rehn <rehn.andreas86@gm=
ail.com>
> wrote:
> >>
> >> before:
> >> "linux-firmware-mt7601u" -> "linux-firmware-mt7601u-license"
> >> "linux-firmware-ralink" -> "linux-firmware-ralink-license"
> >> "linux-firmware-rtl8168" -> "linux-firmware-whence-license"
> >> "linux-firmware-rtl8188" -> "linux-firmware-rtl-license"
> >> "linux-firmware-rtl8192ce" -> "linux-firmware-rtl-license"
> >> "linux-firmware-rtl8192cu" -> "linux-firmware-rtl-license"
> >> "linux-firmware-rtl8192eu" -> "linux-firmware-rtl-license"
> >> "linux-firmware-rtl8192su" -> "linux-firmware-rtl-license"
> >> "linux-firmware-rtl8723" -> "linux-firmware-rtl-license"
> >> "linux-firmware-rtl8821" -> "linux-firmware-rtl-license"
> >>
> >> after:
> >> "linux-firmware-adsp-sst" -> "linux-firmware"
> >> "linux-firmware-adsp-sst" -> "linux-firmware-adsp-sst-license"
> >> "linux-firmware-amlogic-vdec" -> "linux-firmware-amlogic-vdec-license"
> >> "linux-firmware-ar3k" -> "linux-firmware-ar3k-license"
> >> "linux-firmware-ar3k" -> "linux-firmware-atheros-license"
> >> "linux-firmware-ar9170" -> "linux-firmware-atheros-license"
> >> "linux-firmware-ath10k" -> "linux-firmware-ath10k-license"
> >> "linux-firmware-ath11k" -> "linux-firmware-ath10k-license"
> >> "linux-firmware-ath6k" -> "linux-firmware-atheros-license"
> >> "linux-firmware-ath9k" -> "linux-firmware-atheros-license"
> >> "linux-firmware-bcm-0bb4-0306" -> "linux-firmware-cypress-license"
> >> "linux-firmware-bcm43143" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm43236b" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm43241b0" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm43241b4" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm43241b5" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm43242a" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4329-fullmac" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4329" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4330" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm43340" -> "linux-firmware-cypress-license"
> >> "linux-firmware-bcm4334" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4335" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm43362" -> "linux-firmware-cypress-license"
> >> "linux-firmware-bcm4339" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm43430a0" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm43430" -> "linux-firmware-cypress-license"
> >> "linux-firmware-bcm43455" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4350c2" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4350" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4354" -> "linux-firmware-cypress-license"
> >> "linux-firmware-bcm43569" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4356" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4356-pcie" -> "linux-firmware-cypress-license"
> >> "linux-firmware-bcm43570" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4358" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm43602" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4366b" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4366c" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4371" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm4373" -> "linux-firmware"
> >> "linux-firmware-bcm4373" -> "linux-firmware-cypress-license"
> >> "linux-firmware-bcm43xx-hdr" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bcm43xx" -> "linux-firmware-broadcom-license"
> >> "linux-firmware-bnx2-mips" -> "linux-firmware-whence-license"
> >> "linux-firmware-carl9170" -> "linux-firmware-gplv2-license"
> >> "linux-firmware-i915" -> "linux-firmware-i915-license"
> >> "linux-firmware-ibt-11-5" -> "linux-firmware-ibt-license"
> >> "linux-firmware-ibt-12-16" -> "linux-firmware-ibt-license"
> >> "linux-firmware-ibt-17" -> "linux-firmware-ibt-license"
> >> "linux-firmware-ibt-20" -> "linux-firmware-ibt-license"
> >> "linux-firmware-ibt-hw-37-7" -> "linux-firmware-ibt-license"
> >> "linux-firmware-ibt" -> "linux-firmware-ibt-11-5" [style=3Ddotted]
> >> "linux-firmware-ibt" -> "linux-firmware-ibt-12-16" [style=3Ddotted]
> >> "linux-firmware-ibt" -> "linux-firmware-ibt-17" [style=3Ddotted]
> >> "linux-firmware-ibt" -> "linux-firmware-ibt-20" [style=3Ddotted]
> >> "linux-firmware-ibt" -> "linux-firmware-ibt-hw-37-7" [style=3Ddotted]
> >> "linux-firmware-ibt" -> "linux-firmware-ibt-hw-37-8" [style=3Ddotted]
> >> "linux-firmware-ibt" -> "linux-firmware-ibt-license" [style=3Ddotted]
> >> "linux-firmware-ibt" -> "linux-firmware-ibt-misc" [style=3Ddotted]
> >> "linux-firmware-ibt-misc" -> "linux-firmware-ibt-license"
> >> "linux-firmware-ice" -> "linux-firmware-ice-license"
> >> "linux-firmware-imx-sdma-imx6q" -> "linux-firmware-imx-sdma-license"
> >> "linux-firmware-imx-sdma-imx7d" -> "linux-firmware-imx-sdma-license"
> >> "linux-firmware-iwlwifi-135-6" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware-iwlwifi-3160-17" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware-iwlwifi-6000-4" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware-iwlwifi-6000g2a-6" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware-iwlwifi-6000g2b-6" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware-iwlwifi-6050-5" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware-iwlwifi-7260" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware-iwlwifi-7265d" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware-iwlwifi-7265" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware-iwlwifi-8000c" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware-iwlwifi-8265" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware-iwlwifi-9000" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-135-6"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-10"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-12"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-13"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-16"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-17"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-7"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-8"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-3160-9"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000-4"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2a-5"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2a-6"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2b-5"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6000g2b-6"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6050-4"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-6050-5"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-7260" [style=3Ddot=
ted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-7265d"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-7265" [style=3Ddot=
ted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-8000c"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-8265" [style=3Ddot=
ted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-9000" [style=3Ddot=
ted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-license"
> [style=3Ddotted]
> >> "linux-firmware-iwlwifi" -> "linux-firmware-iwlwifi-misc" [style=3Ddot=
ted]
> >> "linux-firmware-iwlwifi-misc" -> "linux-firmware-iwlwifi-license"
> >> "linux-firmware" -> "linux-firmware-adsp-sst-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-adsp-sst" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-amlogic-vdec-license" [style=3Ddot=
ted]
> >> "linux-firmware" -> "linux-firmware-amlogic-vdec" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ar3k-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ar3k" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ar9170" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ath10k-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ath10k" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ath11k" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ath6k" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ath9k" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-atheros-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm-0bb4-0306"
> >> "linux-firmware" -> "linux-firmware-bcm-0bb4-0306" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43143" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43236b" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43241b0" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43241b4" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43241b5" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43242a" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4329-fullmac" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4329" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4330" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43340" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4334" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4335" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43362" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4339" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43430a0" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43430" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43455" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4350c2" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4350" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4354" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43569" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4356-pcie" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4356" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43570" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4358" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43602" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4366b" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4366c" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4371" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm4373" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43xx-hdr" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bcm43xx" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-bnx2-mips" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-broadcom-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-carl9170" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-cypress-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-gplv2-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-i915-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-i915" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ibt-11-5" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ibt-12-16" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ibt-17" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ibt-20" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ibt-hw-37-7" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ibt-hw-37-8" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ibt-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ibt-misc" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ibt" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ice-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ice" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-imx-sdma-imx6q" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-imx-sdma-imx7d" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-imx-sdma-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-135-6" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-3160-10" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-3160-12" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-3160-13" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-3160-16" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-3160-17" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-3160-7" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-3160-8" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-3160-9" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-6000-4" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-6000g2a-5" [style=3Ddotted=
]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-6000g2a-6" [style=3Ddotted=
]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-6000g2b-5" [style=3Ddotted=
]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-6000g2b-6" [style=3Ddotted=
]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-6050-4" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-6050-5" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-7260" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-7265d" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-7265" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-8000c" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-8265" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-9000" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi-misc" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-iwlwifi" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-license"
> >> "linux-firmware" -> "linux-firmware-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-liquidio" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-lontium-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-lt9611uxc" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-marvell-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-mt7601u-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-mt7601u" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-netronome-license" [style=3Ddotted=
]
> >> "linux-firmware" -> "linux-firmware-netronome" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-nvidia-gpu" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-nvidia-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-nvidia-tegra-k1" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-nvidia-tegra" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-pcie8897" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-pcie8997" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qat-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qat" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qca" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-adreno-a2xx" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-adreno-a3xx" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-adreno-a4xx" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-adreno-a530" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-adreno-a630" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-adreno-a650" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-adreno-a660" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-apq8096-audio" [style=3Ddotte=
d]
> >> "linux-firmware" -> "linux-firmware-qcom-apq8096-modem" [style=3Ddotte=
d]
> >> "linux-firmware" -> "linux-firmware-qcom-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno"
> [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio"
> [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compat"
> [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compute"
> [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors"
> [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-sdm845-audio" [style=3Ddotted=
]
> >> "linux-firmware" -> "linux-firmware-qcom-sdm845-compute" [style=3Ddott=
ed]
> >> "linux-firmware" -> "linux-firmware-qcom-sdm845-modem" [style=3Ddotted=
]
> >> "linux-firmware" -> "linux-firmware-qcom-sm8250-audio" [style=3Ddotted=
]
> >> "linux-firmware" -> "linux-firmware-qcom-sm8250-compute" [style=3Ddott=
ed]
> >> "linux-firmware" -> "linux-firmware-qcom-venus-1.8" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-venus-4.2" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-venus-5.2" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-venus-5.4" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-vpu-1.0" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-vpu-2.0" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-qcom-yamato-license" [style=3Ddott=
ed]
> >> "linux-firmware" -> "linux-firmware-radeon-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-radeon" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ralink-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ralink" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-rs9113" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-rs9116" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-rtl8168" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-rtl8188" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-rtl8192ce" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-rtl8192cu" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-rtl8192eu"
> >> "linux-firmware" -> "linux-firmware-rtl8192eu" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-rtl8192su" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-rtl8723" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-rtl8821" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-rtl-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-sd8686" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-sd8688" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-sd8787" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-sd8797" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-sd8801" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-sd8887" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-sd8897" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-sd8997" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-ti-connectivity-license"
> [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-usb8997" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-vt6656-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-vt6656" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-whence-license"
> >> "linux-firmware" -> "linux-firmware-whence-license" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-wl12xx" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-wl18xx" [style=3Ddotted]
> >> "linux-firmware" -> "linux-firmware-wlcommon" [style=3Ddotted]
> >> "linux-firmware-mt7601u" -> "linux-firmware"
> >> "linux-firmware-mt7601u" -> "linux-firmware-mt7601u-license"
> >> "linux-firmware-netronome" -> "linux-firmware-netronome-license"
> >> "linux-firmware-nvidia-gpu" -> "linux-firmware-nvidia-license"
> >> "linux-firmware-nvidia-tegra-k1" -> "linux-firmware-nvidia-license"
> >> "linux-firmware-nvidia-tegra" -> "linux-firmware-nvidia-gpu"
> >> "linux-firmware-nvidia-tegra" -> "linux-firmware-nvidia-license"
> >> "linux-firmware-qat" -> "linux-firmware-qat-license"
> >> "linux-firmware-qca" -> "linux-firmware-ath10k-license"
> >> "linux-firmware-qcom-adreno-a2xx" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-adreno-a2xx" ->
> "linux-firmware-qcom-yamato-license"
> >> "linux-firmware-qcom-adreno-a4xx" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-adreno-a530" -> "linux-firmware"
> >> "linux-firmware-qcom-adreno-a530" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-adreno-a630" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-adreno-a650" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-adreno-a660" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-apq8096-audio" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-apq8096-modem" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno" ->
> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno" ->
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
> >> "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio" ->
> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-sc8280xp-lenovo-x13s-audio" ->
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
> >> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compute" ->
> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compute" ->
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
> >> "linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors" ->
> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors" ->
> "linux-firmware-qcom-sc8280xp-lenovo-x13s-compat" [style=3Ddotted]
> >> "linux-firmware-qcom-sdm845-audio" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-sdm845-compute" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-sdm845-modem" -> "linux-firmware-ath10k"
> >> "linux-firmware-qcom-sdm845-modem" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-sm8250-audio" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-sm8250-compute" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-venus-1.8" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-venus-4.2" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-venus-5.2" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-venus-5.4" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-vpu-1.0" -> "linux-firmware-qcom-license"
> >> "linux-firmware-qcom-vpu-2.0" -> "linux-firmware-qcom-license"
> >> "linux-firmware-radeon" -> "linux-firmware-radeon-license"
> >> "linux-firmware-ralink" -> "linux-firmware-ralink-license"
> >> "linux-firmware-rs9113" -> "linux-firmware-whence-license"
> >> "linux-firmware-rs9116" -> "linux-firmware-whence-license"
> >> "linux-firmware-rtl8168" -> "linux-firmware-whence-license"
> >> "linux-firmware-rtl8188" -> "linux-firmware-rtl-license"
> >> "linux-firmware-rtl8192ce" -> "linux-firmware-rtl-license"
> >> "linux-firmware-rtl8192cu" -> "linux-firmware-rtl-license"
> >> "linux-firmware-rtl8192eu" -> "linux-firmware-rtl-license"
> >> "linux-firmware-rtl8192su" -> "linux-firmware-rtl-license"
> >> "linux-firmware-rtl8723" -> "linux-firmware-rtl-license"
> >> "linux-firmware-rtl8821" -> "linux-firmware-rtl-license"
> >> "linux-firmware-sd8686" -> "linux-firmware-marvell-license"
> >> "linux-firmware-sd8688" -> "linux-firmware-marvell-license"
> >> "linux-firmware-sd8787" -> "linux-firmware-marvell-license"
> >> "linux-firmware-sd8797" -> "linux-firmware-marvell-license"
> >> "linux-firmware-sd8801" -> "linux-firmware-marvell-license"
> >> "linux-firmware-sd8887" -> "linux-firmware-marvell-license"
> >> "linux-firmware-sd8897" -> "linux-firmware-marvell-license"
> >> "linux-firmware-sd8997" -> "linux-firmware-marvell-license"
> >> "linux-firmware-usb8997" -> "linux-firmware-marvell-license"
> >> "linux-firmware-vt6656" -> "linux-firmware-vt6656-license"
> >> "linux-firmware-wl12xx" -> "linux-firmware-ti-connectivity-license"
> >> "linux-firmware-wl12xx" -> "linux-firmware-wlcommon"
> >> "linux-firmware-wl18xx" -> "linux-firmware-ti-connectivity-license"
> >> "linux-firmware-wl18xx" -> "linux-firmware-wlcommon"
> >>
> >> Am Di., 25. Juli 2023 um 14:20 Uhr schrieb Martin Jansa <
> martin.jansa@gmail.com>:
> >>>
> >>> now figure out what depends on linux-firmware from your image
> >>>
> >>> grep linux-firmware
> buildhistory/images/your-machine/your-libc/your-image/depends.dot
> >>>
> >>> and then git log will help you with the rest (FWIW: I don't see
> linux-firmware in our dunfell images).
> >>>
> >>> On Tue, Jul 25, 2023 at 2:01=E2=80=AFPM Andreas Rehn <rehn.andreas86@=
gmail.com>
> wrote:
> >>>>
> >>>> hey alex,
> >>>> thx for have a look
> >>>>
> >>>> before
> >>>>
> >>>> linux-firmware-mt7601u-license
> >>>> linux-firmware-mt7601u
> >>>> linux-firmware-ralink-license
> >>>> linux-firmware-ralink
> >>>> linux-firmware-rtl8168
> >>>> linux-firmware-rtl8188
> >>>> linux-firmware-rtl8192ce
> >>>> linux-firmware-rtl8192cu
> >>>> linux-firmware-rtl8192eu
> >>>> linux-firmware-rtl8192su
> >>>> linux-firmware-rtl8723
> >>>> linux-firmware-rtl8821
> >>>> linux-firmware-rtl-license
> >>>> linux-firmware-whence-license
> >>>>
> >>>> after
> >>>>
> >>>> libz1 aarch64 1.2.11-r0
> >>>> linux-firmware all 1:20230515-r0
> >>>> linux-firmware-adsp-sst all 1:20230515-r0
> >>>> linux-firmware-adsp-sst-license all 1:20230515-r0
> >>>> linux-firmware-amlogic-vdec all 1:20230515-r0
> >>>> linux-firmware-amlogic-vdec-license all 1:20230515-r0
> >>>> linux-firmware-ar3k all 1:20230515-r0
> >>>> linux-firmware-ar3k-license all 1:20230515-r0
> >>>> linux-firmware-ar9170 all 1:20230515-r0
> >>>> linux-firmware-ath10k all 1:20230515-r0
> >>>> linux-firmware-ath10k-license all 1:20230515-r0
> >>>> linux-firmware-ath11k all 1:20230515-r0
> >>>> linux-firmware-ath6k all 1:20230515-r0
> >>>> linux-firmware-ath9k all 1:20230515-r0
> >>>> linux-firmware-atheros-license all 1:20230515-r0
> >>>> linux-firmware-bcm-0bb4-0306 all 1:20230515-r0
> >>>> linux-firmware-bcm43143 all 1:20230515-r0
> >>>> linux-firmware-bcm43236b all 1:20230515-r0
> >>>> linux-firmware-bcm43241b0 all 1:20230515-r0
> >>>> linux-firmware-bcm43241b4 all 1:20230515-r0
> >>>> linux-firmware-bcm43241b5 all 1:20230515-r0
> >>>> linux-firmware-bcm43242a all 1:20230515-r0
> >>>> linux-firmware-bcm4329 all 1:20230515-r0
> >>>> linux-firmware-bcm4329-fullmac all 1:20230515-r0
> >>>> linux-firmware-bcm4330 all 1:20230515-r0
> >>>> linux-firmware-bcm4334 all 1:20230515-r0
> >>>> linux-firmware-bcm43340 all 1:20230515-r0
> >>>> linux-firmware-bcm4335 all 1:20230515-r0
> >>>> linux-firmware-bcm43362 all 1:20230515-r0
> >>>> linux-firmware-bcm4339 all 1:20230515-r0
> >>>> linux-firmware-bcm43430 all 1:20230515-r0
> >>>> linux-firmware-bcm43430a0 all 1:20230515-r0
> >>>> linux-firmware-bcm43455 all 1:20230515-r0
> >>>> linux-firmware-bcm4350 all 1:20230515-r0
> >>>> linux-firmware-bcm4350c2 all 1:20230515-r0
> >>>> linux-firmware-bcm4354 all 1:20230515-r0
> >>>> linux-firmware-bcm4356 all 1:20230515-r0
> >>>> linux-firmware-bcm4356-pcie all 1:20230515-r0
> >>>> linux-firmware-bcm43569 all 1:20230515-r0
> >>>> linux-firmware-bcm43570 all 1:20230515-r0
> >>>> linux-firmware-bcm4358 all 1:20230515-r0
> >>>> linux-firmware-bcm43602 all 1:20230515-r0
> >>>> linux-firmware-bcm4366b all 1:20230515-r0
> >>>> linux-firmware-bcm4366c all 1:20230515-r0
> >>>> linux-firmware-bcm4371 all 1:20230515-r0
> >>>> linux-firmware-bcm4373 all 1:20230515-r0
> >>>> linux-firmware-bcm43xx all 1:20230515-r0
> >>>> linux-firmware-bcm43xx-hdr all 1:20230515-r0
> >>>> linux-firmware-bnx2-mips all 1:20230515-r0
> >>>> linux-firmware-broadcom-license all 1:20230515-r0
> >>>> linux-firmware-carl9170 all 1:20230515-r0
> >>>> linux-firmware-cypress-license all 1:20230515-r0
> >>>> linux-firmware-gplv2-license all 1:20230515-r0
> >>>> linux-firmware-i915 all 1:20230515-r0
> >>>> linux-firmware-i915-license all 1:20230515-r0
> >>>> linux-firmware-ibt all 1:20230515-r0
> >>>> linux-firmware-ibt-11-5 all 1:20230515-r0
> >>>> linux-firmware-ibt-12-16 all 1:20230515-r0
> >>>> linux-firmware-ibt-17 all 1:20230515-r0
> >>>> linux-firmware-ibt-20 all 1:20230515-r0
> >>>> linux-firmware-ibt-hw-37-7 all 1:20230515-r0
> >>>> linux-firmware-ibt-hw-37-8 all 1:20230515-r0
> >>>> linux-firmware-ibt-license all 1:20230515-r0
> >>>> linux-firmware-ibt-misc all 1:20230515-r0
> >>>> linux-firmware-ice all 1:20230515-r0
> >>>> linux-firmware-ice-license all 1:20230515-r0
> >>>> linux-firmware-imx-sdma-imx6q all 1:20230515-r0
> >>>> linux-firmware-imx-sdma-imx7d all 1:20230515-r0
> >>>> linux-firmware-imx-sdma-license all 1:20230515-r0
> >>>> linux-firmware-iwlwifi all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-135-6 all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-3160-17 all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-6000-4 all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-6000g2a-6 all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-6000g2b-6 all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-6050-5 all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-7260 all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-7265 all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-7265d all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-8000c all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-8265 all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-9000 all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-license all 1:20230515-r0
> >>>> linux-firmware-iwlwifi-misc all 1:20230515-r0
> >>>> linux-firmware-license all 1:20230515-r0
> >>>> linux-firmware-liquidio all 1:20230515-r0
> >>>> linux-firmware-lontium-license all 1:20230515-r0
> >>>> linux-firmware-lt9611uxc all 1:20230515-r0
> >>>> linux-firmware-marvell-license all 1:20230515-r0
> >>>> linux-firmware-mt7601u all 1:20230515-r0
> >>>> linux-firmware-mt7601u-license all 1:20230515-r0
> >>>> linux-firmware-netronome all 1:20230515-r0
> >>>> linux-firmware-netronome-license all 1:20230515-r0
> >>>> linux-firmware-nvidia-gpu all 1:20230515-r0
> >>>> linux-firmware-nvidia-license all 1:20230515-r0
> >>>> linux-firmware-nvidia-tegra all 1:20230515-r0
> >>>> linux-firmware-nvidia-tegra-k1 all 1:20230515-r0
> >>>> linux-firmware-pcie8897 all 1:20230515-r0
> >>>> linux-firmware-pcie8997 all 1:20230515-r0
> >>>> linux-firmware-qat all 1:20230515-r0
> >>>> linux-firmware-qat-license all 1:20230515-r0
> >>>> linux-firmware-qca all 1:20230515-r0
> >>>> linux-firmware-qcom-adreno-a2xx all 1:20230515-r0
> >>>> linux-firmware-qcom-adreno-a3xx all 1:20230515-r0
> >>>> linux-firmware-qcom-adreno-a4xx all 1:20230515-r0
> >>>> linux-firmware-qcom-adreno-a530 all 1:20230515-r0
> >>>> linux-firmware-qcom-adreno-a630 all 1:20230515-r0
> >>>> linux-firmware-qcom-adreno-a650 all 1:20230515-r0
> >>>> linux-firmware-qcom-adreno-a660 all 1:20230515-r0
> >>>> linux-firmware-qcom-apq8096-audio all 1:20230515-r0
> >>>> linux-firmware-qcom-apq8096-modem all 1:20230515-r0
> >>>> linux-firmware-qcom-license all 1:20230515-r0
> >>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno all 1:20230515-r0
> >>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-audio all 1:20230515-r0
> >>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-compat all 1:20230515-r0
> >>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-compute all 1:20230515-r0
> >>>> linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors all 1:20230515-r0
> >>>> linux-firmware-qcom-sdm845-audio all 1:20230515-r0
> >>>> linux-firmware-qcom-sdm845-compute all 1:20230515-r0
> >>>> linux-firmware-qcom-sdm845-modem all 1:20230515-r0
> >>>> linux-firmware-qcom-sm8250-audio all 1:20230515-r0
> >>>> linux-firmware-qcom-sm8250-compute all 1:20230515-r0
> >>>> linux-firmware-qcom-venus-1.8 all 1:20230515-r0
> >>>> linux-firmware-qcom-venus-4.2 all 1:20230515-r0
> >>>> linux-firmware-qcom-venus-5.2 all 1:20230515-r0
> >>>> linux-firmware-qcom-venus-5.4 all 1:20230515-r0
> >>>> linux-firmware-qcom-vpu-1.0 all 1:20230515-r0
> >>>> linux-firmware-qcom-vpu-2.0 all 1:20230515-r0
> >>>> linux-firmware-qcom-yamato-license all 1:20230515-r0
> >>>> linux-firmware-radeon all 1:20230515-r0
> >>>> linux-firmware-radeon-license all 1:20230515-r0
> >>>> linux-firmware-ralink all 1:20230515-r0
> >>>> linux-firmware-ralink-license all 1:20230515-r0
> >>>> linux-firmware-rs9113 all 1:20230515-r0
> >>>> linux-firmware-rs9116 all 1:20230515-r0
> >>>> linux-firmware-rtl-license all 1:20230515-r0
> >>>> linux-firmware-rtl8168 all 1:20230515-r0
> >>>> linux-firmware-rtl8188 all 1:20230515-r0
> >>>> linux-firmware-rtl8192ce all 1:20230515-r0
> >>>> linux-firmware-rtl8192cu all 1:20230515-r0
> >>>> linux-firmware-rtl8192eu all 1:20230515-r0
> >>>> linux-firmware-rtl8192su all 1:20230515-r0
> >>>> linux-firmware-rtl8723 all 1:20230515-r0
> >>>> linux-firmware-rtl8821 all 1:20230515-r0
> >>>> linux-firmware-sd8686 all 1:20230515-r0
> >>>> linux-firmware-sd8688 all 1:20230515-r0
> >>>> linux-firmware-sd8787 all 1:20230515-r0
> >>>> linux-firmware-sd8797 all 1:20230515-r0
> >>>> linux-firmware-sd8801 all 1:20230515-r0
> >>>> linux-firmware-sd8887 all 1:20230515-r0
> >>>> linux-firmware-sd8897 all 1:20230515-r0
> >>>> linux-firmware-sd8997 all 1:20230515-r0
> >>>> linux-firmware-ti-connectivity-license all 1:20230515-r0
> >>>> linux-firmware-usb8997 all 1:20230515-r0
> >>>> linux-firmware-vt6656 all 1:20230515-r0
> >>>> linux-firmware-vt6656-license all 1:20230515-r0
> >>>> linux-firmware-whence-license all 1:20230515-r0
> >>>> linux-firmware-wl12xx all 1:20230515-r0
> >>>> linux-firmware-wl18xx all 1:20230515-r0
> >>>> linux-firmware-wlcommon all 1:20230515-r0
> >>>>
> >>>> Am Di., 25. Juli 2023 um 11:52 Uhr schrieb Alexander Kanavin <
> alex.kanavin@gmail.com>:
> >>>>>
> >>>>> On Tue, 25 Jul 2023 at 11:28, Andreas <rehn.andreas86@gmail.com>
> wrote:
> >>>>> > i encountered issues with the new poky release on dunfell.
> >>>>> > explicitly linux-firmware: commit hash
> a04b507d39d668a02b7ebd990c94194cde16bf2f
> >>>>> >
> >>>>> > i building dunfell images since 1,5 years and my images are
> normaly 1,9 GB big.
> >>>>> > however since Sunday 23.07, the image size increases by 1GB due t=
o
> the full firmware installation.
> >>>>> >
> >>>>> > i double checked it with the previous commit
> 0bf993da8b6e6511a4123ed15421bdd76a4c1f38 and the image size is as expecte=
d.
> >>>>> >
> >>>>> > i hope someone is able to help, because this is an unexpected
> behavior.
> >>>>> >
> >>>>> > PS: this my first post so please have mercy on me. :)
> >>>>>
> >>>>> Can you enable buildhistory as described in
> >>>>> https://docs.yoctoproject.org/dev/dev-manual/build-quality.html
> >>>>> then build linux-firmware before and after the change, then run
> >>>>> buildhistory-diff? That should highlight where the size increase co=
me
> >>>>> from in its packaging.
> >>>>>
> >>>>> You can also manually inspect linux-firmware's
> ${WORKDIR}/packages-spit/.
> >>>>>
> >>>>> Alex
> >>>>
> >>>>
> >>>>
> >>>> Andreas
> >>>>
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#184838):
> https://lists.openembedded.org/g/openembedded-core/message/184838
> >>>> Mute This Topic: https://lists.openembedded.org/mt/100346886/3617156
> >>>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b
> [Martin.Jansa@gmail.com]
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>
> >>
> >> Andreas
>
Andreas

--0000000000005fb54c060150a433
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hey,<div><br></div><div>I tried a bit and=
 as Martin suggested -</div><div>if I remove `linux-firmware-mt7601u` the i=
ssue is gone.</div><div><br></div><div>as you can see in my list, there are=
 also other packages depending on linux-firmware</div><div><br></div><div>&=
quot;linux-firmware-adsp-sst&quot; -&gt; &quot;linux-firmware&quot;<br></di=
v><div>&quot;linux-firmware-bcm4373&quot; -&gt; &quot;linux-firmware&quot;<=
br></div><div>&quot;linux-firmware-mt7601u&quot; -&gt; &quot;linux-firmware=
&quot;<br></div><div>&quot;linux-firmware-qcom-adreno-a530&quot; -&gt; &quo=
t;linux-firmware&quot;<br></div><div><br></div><div>looks like a ring depen=
dency</div><div><br></div><div>if you add one of the the mentioned packages=
, you should see the same issue</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">Am Di., 25. Juli 2023 um 15:18=C2=A0Uh=
r schrieb Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">a=
lex.kanavin@gmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Indeed, does this issue happen on plain poky dunfell build w=
ith no<br>
other layers added to it? If it doesn&#39;t, then it&#39;s very difficult t=
o<br>
give help because it becomes a never ending exchange of &#39;try this&#39; =
and<br>
&#39;try that&#39; - not a good use of anyone&#39;s time. You need to demon=
strate<br>
how we can reproduce the issue on our side.<br>
<br>
Alex<br>
<br>
On Tue, 25 Jul 2023 at 15:07, Martin Jansa &lt;<a href=3D"mailto:martin.jan=
sa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; That shows you that e.g. linux-firmware-mt7601u now depends on linux-f=
irmware:<br>
&gt;<br>
&gt; &quot;linux-firmware-mt7601u&quot; -&gt; &quot;linux-firmware&quot;<br=
>
&gt; &quot;linux-firmware-mt7601u&quot; -&gt; &quot;linux-firmware-mt7601u-=
license&quot;<br>
&gt;<br>
&gt; now use bitbake-getvar or bitbake -e to figure out this happens for yo=
u (doesn&#39;t for me). Probably some other layer your&#39;re using. If you=
 reply again with &quot;bitbake -e&quot; output without any initiative to a=
ctually debug it yourself, I won&#39;t reply.<br>
&gt;<br>
&gt; On Tue, Jul 25, 2023 at 2:40=E2=80=AFPM Andreas Rehn &lt;<a href=3D"ma=
ilto:rehn.andreas86@gmail.com" target=3D"_blank">rehn.andreas86@gmail.com</=
a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; before:<br>
&gt;&gt; &quot;linux-firmware-mt7601u&quot; -&gt; &quot;linux-firmware-mt76=
01u-license&quot;<br>
&gt;&gt; &quot;linux-firmware-ralink&quot; -&gt; &quot;linux-firmware-ralin=
k-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8168&quot; -&gt; &quot;linux-firmware-when=
ce-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8188&quot; -&gt; &quot;linux-firmware-rtl-=
license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8192ce&quot; -&gt; &quot;linux-firmware-rt=
l-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8192cu&quot; -&gt; &quot;linux-firmware-rt=
l-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8192eu&quot; -&gt; &quot;linux-firmware-rt=
l-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8192su&quot; -&gt; &quot;linux-firmware-rt=
l-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8723&quot; -&gt; &quot;linux-firmware-rtl-=
license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8821&quot; -&gt; &quot;linux-firmware-rtl-=
license&quot;<br>
&gt;&gt;<br>
&gt;&gt; after:<br>
&gt;&gt; &quot;linux-firmware-adsp-sst&quot; -&gt; &quot;linux-firmware&quo=
t;<br>
&gt;&gt; &quot;linux-firmware-adsp-sst&quot; -&gt; &quot;linux-firmware-ads=
p-sst-license&quot;<br>
&gt;&gt; &quot;linux-firmware-amlogic-vdec&quot; -&gt; &quot;linux-firmware=
-amlogic-vdec-license&quot;<br>
&gt;&gt; &quot;linux-firmware-ar3k&quot; -&gt; &quot;linux-firmware-ar3k-li=
cense&quot;<br>
&gt;&gt; &quot;linux-firmware-ar3k&quot; -&gt; &quot;linux-firmware-atheros=
-license&quot;<br>
&gt;&gt; &quot;linux-firmware-ar9170&quot; -&gt; &quot;linux-firmware-ather=
os-license&quot;<br>
&gt;&gt; &quot;linux-firmware-ath10k&quot; -&gt; &quot;linux-firmware-ath10=
k-license&quot;<br>
&gt;&gt; &quot;linux-firmware-ath11k&quot; -&gt; &quot;linux-firmware-ath10=
k-license&quot;<br>
&gt;&gt; &quot;linux-firmware-ath6k&quot; -&gt; &quot;linux-firmware-athero=
s-license&quot;<br>
&gt;&gt; &quot;linux-firmware-ath9k&quot; -&gt; &quot;linux-firmware-athero=
s-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm-0bb4-0306&quot; -&gt; &quot;linux-firmwar=
e-cypress-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43143&quot; -&gt; &quot;linux-firmware-bro=
adcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43236b&quot; -&gt; &quot;linux-firmware-br=
oadcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43241b0&quot; -&gt; &quot;linux-firmware-b=
roadcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43241b4&quot; -&gt; &quot;linux-firmware-b=
roadcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43241b5&quot; -&gt; &quot;linux-firmware-b=
roadcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43242a&quot; -&gt; &quot;linux-firmware-br=
oadcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4329-fullmac&quot; -&gt; &quot;linux-firmw=
are-broadcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4329&quot; -&gt; &quot;linux-firmware-broa=
dcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4330&quot; -&gt; &quot;linux-firmware-broa=
dcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43340&quot; -&gt; &quot;linux-firmware-cyp=
ress-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4334&quot; -&gt; &quot;linux-firmware-broa=
dcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4335&quot; -&gt; &quot;linux-firmware-broa=
dcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43362&quot; -&gt; &quot;linux-firmware-cyp=
ress-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4339&quot; -&gt; &quot;linux-firmware-broa=
dcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43430a0&quot; -&gt; &quot;linux-firmware-b=
roadcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43430&quot; -&gt; &quot;linux-firmware-cyp=
ress-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43455&quot; -&gt; &quot;linux-firmware-bro=
adcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4350c2&quot; -&gt; &quot;linux-firmware-br=
oadcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4350&quot; -&gt; &quot;linux-firmware-broa=
dcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4354&quot; -&gt; &quot;linux-firmware-cypr=
ess-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43569&quot; -&gt; &quot;linux-firmware-bro=
adcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4356&quot; -&gt; &quot;linux-firmware-broa=
dcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4356-pcie&quot; -&gt; &quot;linux-firmware=
-cypress-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43570&quot; -&gt; &quot;linux-firmware-bro=
adcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4358&quot; -&gt; &quot;linux-firmware-broa=
dcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43602&quot; -&gt; &quot;linux-firmware-bro=
adcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4366b&quot; -&gt; &quot;linux-firmware-bro=
adcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4366c&quot; -&gt; &quot;linux-firmware-bro=
adcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4371&quot; -&gt; &quot;linux-firmware-broa=
dcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm4373&quot; -&gt; &quot;linux-firmware&quot=
;<br>
&gt;&gt; &quot;linux-firmware-bcm4373&quot; -&gt; &quot;linux-firmware-cypr=
ess-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43xx-hdr&quot; -&gt; &quot;linux-firmware-=
broadcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bcm43xx&quot; -&gt; &quot;linux-firmware-broa=
dcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-bnx2-mips&quot; -&gt; &quot;linux-firmware-wh=
ence-license&quot;<br>
&gt;&gt; &quot;linux-firmware-carl9170&quot; -&gt; &quot;linux-firmware-gpl=
v2-license&quot;<br>
&gt;&gt; &quot;linux-firmware-i915&quot; -&gt; &quot;linux-firmware-i915-li=
cense&quot;<br>
&gt;&gt; &quot;linux-firmware-ibt-11-5&quot; -&gt; &quot;linux-firmware-ibt=
-license&quot;<br>
&gt;&gt; &quot;linux-firmware-ibt-12-16&quot; -&gt; &quot;linux-firmware-ib=
t-license&quot;<br>
&gt;&gt; &quot;linux-firmware-ibt-17&quot; -&gt; &quot;linux-firmware-ibt-l=
icense&quot;<br>
&gt;&gt; &quot;linux-firmware-ibt-20&quot; -&gt; &quot;linux-firmware-ibt-l=
icense&quot;<br>
&gt;&gt; &quot;linux-firmware-ibt-hw-37-7&quot; -&gt; &quot;linux-firmware-=
ibt-license&quot;<br>
&gt;&gt; &quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-11-5=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-12-1=
6&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-17&q=
uot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-20&q=
uot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-hw-3=
7-7&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-hw-3=
7-8&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-lice=
nse&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-ibt&quot; -&gt; &quot;linux-firmware-ibt-misc=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-ibt-misc&quot; -&gt; &quot;linux-firmware-ibt=
-license&quot;<br>
&gt;&gt; &quot;linux-firmware-ice&quot; -&gt; &quot;linux-firmware-ice-lice=
nse&quot;<br>
&gt;&gt; &quot;linux-firmware-imx-sdma-imx6q&quot; -&gt; &quot;linux-firmwa=
re-imx-sdma-license&quot;<br>
&gt;&gt; &quot;linux-firmware-imx-sdma-imx7d&quot; -&gt; &quot;linux-firmwa=
re-imx-sdma-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-135-6&quot; -&gt; &quot;linux-firmwar=
e-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-3160-17&quot; -&gt; &quot;linux-firmw=
are-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-6000-4&quot; -&gt; &quot;linux-firmwa=
re-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-6000g2a-6&quot; -&gt; &quot;linux-fir=
mware-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-6000g2b-6&quot; -&gt; &quot;linux-fir=
mware-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-6050-5&quot; -&gt; &quot;linux-firmwa=
re-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-7260&quot; -&gt; &quot;linux-firmware=
-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-7265d&quot; -&gt; &quot;linux-firmwar=
e-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-7265&quot; -&gt; &quot;linux-firmware=
-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-8000c&quot; -&gt; &quot;linux-firmwar=
e-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-8265&quot; -&gt; &quot;linux-firmware=
-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-9000&quot; -&gt; &quot;linux-firmware=
-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-135-6&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-3160-10&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-3160-12&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-3160-13&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-3160-16&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-3160-17&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-3160-7&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-3160-8&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-3160-9&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-6000-4&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-6000g2a-5&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-6000g2a-6&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-6000g2b-5&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-6000g2b-6&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-6050-4&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-6050-5&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-7260&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-7265d&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-7265&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-8000c&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-8265&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-9000&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-license&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi&quot; -&gt; &quot;linux-firmware-iwlw=
ifi-misc&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-iwlwifi-misc&quot; -&gt; &quot;linux-firmware=
-iwlwifi-license&quot;<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-adsp-sst-lic=
ense&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-adsp-sst&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-amlogic-vdec=
-license&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-amlogic-vdec=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ar3k-license=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ar3k&quot; [=
style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ar9170&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ath10k-licen=
se&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ath10k&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ath11k&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ath6k&quot; =
[style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ath9k&quot; =
[style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-atheros-lice=
nse&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm-0bb4-030=
6&quot;<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm-0bb4-030=
6&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43143&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43236b&qu=
ot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43241b0&q=
uot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43241b4&q=
uot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43241b5&q=
uot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43242a&qu=
ot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4329-full=
mac&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4329&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4330&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43340&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4334&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4335&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43362&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4339&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43430a0&q=
uot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43430&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43455&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4350c2&qu=
ot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4350&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4354&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43569&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4356-pcie=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4356&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43570&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4358&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43602&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4366b&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4366c&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4371&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm4373&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43xx-hdr&=
quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bcm43xx&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-bnx2-mips&qu=
ot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-broadcom-lic=
ense&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-carl9170&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-cypress-lice=
nse&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-gplv2-licens=
e&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-i915-license=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-i915&quot; [=
style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-11-5&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-12-16&qu=
ot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-17&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-20&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-hw-37-7&=
quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-hw-37-8&=
quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-license&=
quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt-misc&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ibt&quot; [s=
tyle=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ice-license&=
quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ice&quot; [s=
tyle=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-imx-sdma-imx=
6q&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-imx-sdma-imx=
7d&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-imx-sdma-lic=
ense&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-135-=
6&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160=
-10&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160=
-12&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160=
-13&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160=
-16&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160=
-17&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160=
-7&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160=
-8&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-3160=
-9&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-6000=
-4&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-6000=
g2a-5&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-6000=
g2a-6&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-6000=
g2b-5&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-6000=
g2b-6&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-6050=
-4&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-6050=
-5&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-7260=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-7265=
d&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-7265=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-8000=
c&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-8265=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-9000=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-lice=
nse&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi-misc=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-iwlwifi&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-license&quot=
;<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-license&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-liquidio&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-lontium-lice=
nse&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-lt9611uxc&qu=
ot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-marvell-lice=
nse&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-mt7601u-lice=
nse&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-mt7601u&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-netronome-li=
cense&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-netronome&qu=
ot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-nvidia-gpu&q=
uot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-nvidia-licen=
se&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-nvidia-tegra=
-k1&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-nvidia-tegra=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-pcie8897&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-pcie8997&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qat-license&=
quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qat&quot; [s=
tyle=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qca&quot; [s=
tyle=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-adreno-=
a2xx&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-adreno-=
a3xx&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-adreno-=
a4xx&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-adreno-=
a530&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-adreno-=
a630&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-adreno-=
a650&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-adreno-=
a660&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-apq8096=
-audio&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-apq8096=
-modem&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-license=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sc8280x=
p-lenovo-x13s-adreno&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sc8280x=
p-lenovo-x13s-audio&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sc8280x=
p-lenovo-x13s-compat&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sc8280x=
p-lenovo-x13s-compute&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sc8280x=
p-lenovo-x13s-sensors&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sdm845-=
audio&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sdm845-=
compute&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sdm845-=
modem&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sm8250-=
audio&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-sm8250-=
compute&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-venus-1=
.8&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-venus-4=
.2&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-venus-5=
.2&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-venus-5=
.4&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-vpu-1.0=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-vpu-2.0=
&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-qcom-yamato-=
license&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-radeon-licen=
se&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-radeon&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ralink-licen=
se&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ralink&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rs9113&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rs9116&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8168&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8188&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8192ce&qu=
ot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8192cu&qu=
ot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8192eu&qu=
ot;<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8192eu&qu=
ot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8192su&qu=
ot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8723&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl8821&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-rtl-license&=
quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd8686&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd8688&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd8787&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd8797&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd8801&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd8887&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd8897&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-sd8997&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-ti-connectiv=
ity-license&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-usb8997&quot=
; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-vt6656-licen=
se&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-vt6656&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-whence-licen=
se&quot;<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-whence-licen=
se&quot; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-wl12xx&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-wl18xx&quot;=
 [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware&quot; -&gt; &quot;linux-firmware-wlcommon&quo=
t; [style=3Ddotted]<br>
&gt;&gt; &quot;linux-firmware-mt7601u&quot; -&gt; &quot;linux-firmware&quot=
;<br>
&gt;&gt; &quot;linux-firmware-mt7601u&quot; -&gt; &quot;linux-firmware-mt76=
01u-license&quot;<br>
&gt;&gt; &quot;linux-firmware-netronome&quot; -&gt; &quot;linux-firmware-ne=
tronome-license&quot;<br>
&gt;&gt; &quot;linux-firmware-nvidia-gpu&quot; -&gt; &quot;linux-firmware-n=
vidia-license&quot;<br>
&gt;&gt; &quot;linux-firmware-nvidia-tegra-k1&quot; -&gt; &quot;linux-firmw=
are-nvidia-license&quot;<br>
&gt;&gt; &quot;linux-firmware-nvidia-tegra&quot; -&gt; &quot;linux-firmware=
-nvidia-gpu&quot;<br>
&gt;&gt; &quot;linux-firmware-nvidia-tegra&quot; -&gt; &quot;linux-firmware=
-nvidia-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qat&quot; -&gt; &quot;linux-firmware-qat-lice=
nse&quot;<br>
&gt;&gt; &quot;linux-firmware-qca&quot; -&gt; &quot;linux-firmware-ath10k-l=
icense&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-adreno-a2xx&quot; -&gt; &quot;linux-firm=
ware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-adreno-a2xx&quot; -&gt; &quot;linux-firm=
ware-qcom-yamato-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-adreno-a4xx&quot; -&gt; &quot;linux-firm=
ware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-adreno-a530&quot; -&gt; &quot;linux-firm=
ware&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-adreno-a530&quot; -&gt; &quot;linux-firm=
ware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-adreno-a630&quot; -&gt; &quot;linux-firm=
ware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-adreno-a650&quot; -&gt; &quot;linux-firm=
ware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-adreno-a660&quot; -&gt; &quot;linux-firm=
ware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-apq8096-audio&quot; -&gt; &quot;linux-fi=
rmware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-apq8096-modem&quot; -&gt; &quot;linux-fi=
rmware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno&quot; -&gt; =
&quot;linux-firmware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno&quot; -&gt; =
&quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-compat&quot; [style=3Ddotted=
]<br>
&gt;&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-audio&quot; -&gt; &=
quot;linux-firmware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-audio&quot; -&gt; &=
quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-compat&quot; [style=3Ddotted]=
<br>
&gt;&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-compute&quot; -&gt;=
 &quot;linux-firmware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-compute&quot; -&gt;=
 &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-compat&quot; [style=3Ddotte=
d]<br>
&gt;&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors&quot; -&gt;=
 &quot;linux-firmware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors&quot; -&gt;=
 &quot;linux-firmware-qcom-sc8280xp-lenovo-x13s-compat&quot; [style=3Ddotte=
d]<br>
&gt;&gt; &quot;linux-firmware-qcom-sdm845-audio&quot; -&gt; &quot;linux-fir=
mware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-sdm845-compute&quot; -&gt; &quot;linux-f=
irmware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-sdm845-modem&quot; -&gt; &quot;linux-fir=
mware-ath10k&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-sdm845-modem&quot; -&gt; &quot;linux-fir=
mware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-sm8250-audio&quot; -&gt; &quot;linux-fir=
mware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-sm8250-compute&quot; -&gt; &quot;linux-f=
irmware-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-venus-1.8&quot; -&gt; &quot;linux-firmwa=
re-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-venus-4.2&quot; -&gt; &quot;linux-firmwa=
re-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-venus-5.2&quot; -&gt; &quot;linux-firmwa=
re-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-venus-5.4&quot; -&gt; &quot;linux-firmwa=
re-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-vpu-1.0&quot; -&gt; &quot;linux-firmware=
-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-qcom-vpu-2.0&quot; -&gt; &quot;linux-firmware=
-qcom-license&quot;<br>
&gt;&gt; &quot;linux-firmware-radeon&quot; -&gt; &quot;linux-firmware-radeo=
n-license&quot;<br>
&gt;&gt; &quot;linux-firmware-ralink&quot; -&gt; &quot;linux-firmware-ralin=
k-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rs9113&quot; -&gt; &quot;linux-firmware-whenc=
e-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rs9116&quot; -&gt; &quot;linux-firmware-whenc=
e-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8168&quot; -&gt; &quot;linux-firmware-when=
ce-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8188&quot; -&gt; &quot;linux-firmware-rtl-=
license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8192ce&quot; -&gt; &quot;linux-firmware-rt=
l-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8192cu&quot; -&gt; &quot;linux-firmware-rt=
l-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8192eu&quot; -&gt; &quot;linux-firmware-rt=
l-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8192su&quot; -&gt; &quot;linux-firmware-rt=
l-license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8723&quot; -&gt; &quot;linux-firmware-rtl-=
license&quot;<br>
&gt;&gt; &quot;linux-firmware-rtl8821&quot; -&gt; &quot;linux-firmware-rtl-=
license&quot;<br>
&gt;&gt; &quot;linux-firmware-sd8686&quot; -&gt; &quot;linux-firmware-marve=
ll-license&quot;<br>
&gt;&gt; &quot;linux-firmware-sd8688&quot; -&gt; &quot;linux-firmware-marve=
ll-license&quot;<br>
&gt;&gt; &quot;linux-firmware-sd8787&quot; -&gt; &quot;linux-firmware-marve=
ll-license&quot;<br>
&gt;&gt; &quot;linux-firmware-sd8797&quot; -&gt; &quot;linux-firmware-marve=
ll-license&quot;<br>
&gt;&gt; &quot;linux-firmware-sd8801&quot; -&gt; &quot;linux-firmware-marve=
ll-license&quot;<br>
&gt;&gt; &quot;linux-firmware-sd8887&quot; -&gt; &quot;linux-firmware-marve=
ll-license&quot;<br>
&gt;&gt; &quot;linux-firmware-sd8897&quot; -&gt; &quot;linux-firmware-marve=
ll-license&quot;<br>
&gt;&gt; &quot;linux-firmware-sd8997&quot; -&gt; &quot;linux-firmware-marve=
ll-license&quot;<br>
&gt;&gt; &quot;linux-firmware-usb8997&quot; -&gt; &quot;linux-firmware-marv=
ell-license&quot;<br>
&gt;&gt; &quot;linux-firmware-vt6656&quot; -&gt; &quot;linux-firmware-vt665=
6-license&quot;<br>
&gt;&gt; &quot;linux-firmware-wl12xx&quot; -&gt; &quot;linux-firmware-ti-co=
nnectivity-license&quot;<br>
&gt;&gt; &quot;linux-firmware-wl12xx&quot; -&gt; &quot;linux-firmware-wlcom=
mon&quot;<br>
&gt;&gt; &quot;linux-firmware-wl18xx&quot; -&gt; &quot;linux-firmware-ti-co=
nnectivity-license&quot;<br>
&gt;&gt; &quot;linux-firmware-wl18xx&quot; -&gt; &quot;linux-firmware-wlcom=
mon&quot;<br>
&gt;&gt;<br>
&gt;&gt; Am Di., 25. Juli 2023 um 14:20 Uhr schrieb Martin Jansa &lt;<a hre=
f=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.co=
m</a>&gt;:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; now figure out what depends on linux-firmware from your image<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; grep linux-firmware buildhistory/images/your-machine/your-libc=
/your-image/depends.dot<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; and then git log will help you with the rest (FWIW: I don&#39;=
t see linux-firmware in our dunfell images).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue, Jul 25, 2023 at 2:01=E2=80=AFPM Andreas Rehn &lt;<a hr=
ef=3D"mailto:rehn.andreas86@gmail.com" target=3D"_blank">rehn.andreas86@gma=
il.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; hey alex,<br>
&gt;&gt;&gt;&gt; thx for have a look<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; before<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; linux-firmware-mt7601u-license<br>
&gt;&gt;&gt;&gt; linux-firmware-mt7601u<br>
&gt;&gt;&gt;&gt; linux-firmware-ralink-license<br>
&gt;&gt;&gt;&gt; linux-firmware-ralink<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8168<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8188<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8192ce<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8192cu<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8192eu<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8192su<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8723<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8821<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl-license<br>
&gt;&gt;&gt;&gt; linux-firmware-whence-license<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; after<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; libz1 aarch64 1.2.11-r0<br>
&gt;&gt;&gt;&gt; linux-firmware all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-adsp-sst all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-adsp-sst-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-amlogic-vdec all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-amlogic-vdec-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ar3k all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ar3k-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ar9170 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ath10k all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ath10k-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ath11k all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ath6k all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ath9k all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-atheros-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm-0bb4-0306 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43143 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43236b all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43241b0 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43241b4 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43241b5 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43242a all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4329 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4329-fullmac all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4330 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4334 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43340 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4335 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43362 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4339 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43430 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43430a0 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43455 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4350 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4350c2 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4354 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4356 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4356-pcie all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43569 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43570 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4358 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43602 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4366b all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4366c all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4371 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm4373 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43xx all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bcm43xx-hdr all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-bnx2-mips all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-broadcom-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-carl9170 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-cypress-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-gplv2-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-i915 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-i915-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ibt all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ibt-11-5 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ibt-12-16 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ibt-17 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ibt-20 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ibt-hw-37-7 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ibt-hw-37-8 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ibt-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ibt-misc all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ice all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ice-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-imx-sdma-imx6q all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-imx-sdma-imx7d all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-imx-sdma-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-135-6 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-3160-17 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-6000-4 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-6000g2a-6 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-6000g2b-6 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-6050-5 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-7260 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-7265 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-7265d all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-8000c all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-8265 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-9000 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-iwlwifi-misc all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-liquidio all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-lontium-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-lt9611uxc all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-marvell-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-mt7601u all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-mt7601u-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-netronome all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-netronome-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-nvidia-gpu all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-nvidia-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-nvidia-tegra all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-nvidia-tegra-k1 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-pcie8897 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-pcie8997 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qat all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qat-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qca all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-adreno-a2xx all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-adreno-a3xx all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-adreno-a4xx all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-adreno-a530 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-adreno-a630 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-adreno-a650 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-adreno-a660 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-apq8096-audio all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-apq8096-modem all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-sc8280xp-lenovo-x13s-adreno all 1:2023=
0515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-sc8280xp-lenovo-x13s-audio all 1:20230=
515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-sc8280xp-lenovo-x13s-compat all 1:2023=
0515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-sc8280xp-lenovo-x13s-compute all 1:202=
30515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-sc8280xp-lenovo-x13s-sensors all 1:202=
30515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-sdm845-audio all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-sdm845-compute all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-sdm845-modem all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-sm8250-audio all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-sm8250-compute all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-venus-1.8 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-venus-4.2 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-venus-5.2 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-venus-5.4 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-vpu-1.0 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-vpu-2.0 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-qcom-yamato-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-radeon all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-radeon-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ralink all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ralink-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-rs9113 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-rs9116 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8168 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8188 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8192ce all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8192cu all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8192eu all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8192su all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8723 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-rtl8821 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-sd8686 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-sd8688 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-sd8787 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-sd8797 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-sd8801 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-sd8887 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-sd8897 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-sd8997 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-ti-connectivity-license all 1:20230515-r0<b=
r>
&gt;&gt;&gt;&gt; linux-firmware-usb8997 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-vt6656 all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-vt6656-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-whence-license all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-wl12xx all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-wl18xx all 1:20230515-r0<br>
&gt;&gt;&gt;&gt; linux-firmware-wlcommon all 1:20230515-r0<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Am Di., 25. Juli 2023 um 11:52 Uhr schrieb Alexander Kanav=
in &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kan=
avin@gmail.com</a>&gt;:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On Tue, 25 Jul 2023 at 11:28, Andreas &lt;<a href=3D"m=
ailto:rehn.andreas86@gmail.com" target=3D"_blank">rehn.andreas86@gmail.com<=
/a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt; &gt; i encountered issues with the new poky release on=
 dunfell.<br>
&gt;&gt;&gt;&gt;&gt; &gt; explicitly linux-firmware: commit hash a04b507d39=
d668a02b7ebd990c94194cde16bf2f<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; i building dunfell images since 1,5 years and my =
images are normaly 1,9 GB big.<br>
&gt;&gt;&gt;&gt;&gt; &gt; however since Sunday 23.07, the image size increa=
ses by 1GB due to the full firmware installation.<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; i double checked it with the previous commit 0bf9=
93da8b6e6511a4123ed15421bdd76a4c1f38 and the image size is as expected.<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; i hope someone is able to help, because this is a=
n unexpected behavior.<br>
&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt; &gt; PS: this my first post so please have mercy on me=
. :)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Can you enable buildhistory as described in<br>
&gt;&gt;&gt;&gt;&gt; <a href=3D"https://docs.yoctoproject.org/dev/dev-manua=
l/build-quality.html" rel=3D"noreferrer" target=3D"_blank">https://docs.yoc=
toproject.org/dev/dev-manual/build-quality.html</a><br>
&gt;&gt;&gt;&gt;&gt; then build linux-firmware before and after the change,=
 then run<br>
&gt;&gt;&gt;&gt;&gt; buildhistory-diff? That should highlight where the siz=
e increase come<br>
&gt;&gt;&gt;&gt;&gt; from in its packaging.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; You can also manually inspect linux-firmware&#39;s ${W=
ORKDIR}/packages-spit/.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Alex<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Andreas<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt;&gt;&gt; View/Reply Online (#184838): <a href=3D"https://lists.open=
embedded.org/g/openembedded-core/message/184838" rel=3D"noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1848=
38</a><br>
&gt;&gt;&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org=
/mt/100346886/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/mt/100346886/3617156</a><br>
&gt;&gt;&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@l=
ists.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.open=
embedded.org</a><br>
&gt;&gt;&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/o=
penembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Ja=
nsa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
&gt;&gt;&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Andreas<br>
</blockquote></div><div>Andreas</div></div>

--0000000000005fb54c060150a433--

