Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9C8C02198
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 02:47:17 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.2755.1739414828945849957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 18:47:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dqLZLowR;
 spf=pass (domain: linaro.org, ip: 209.85.128.177, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6efe4e3d698so3801367b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 18:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739414828; x=1740019628; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5kxkb5SXzuW5nrMSS16AjhBvuZPHo3pjEYWjZd2DLNo=;
        b=dqLZLowRKq9b4mP1b7qzC2DdHv1duSJijYKTajS1Emw/RoXhuv41JT2W8gpjCAmct1
         E7S1X308pln/bBuRY7shbhkqq1iIKb6TD8hX//A9ZL+kY0rAuogkOZOxAoCAYrCLyFkX
         8sctfSL7Lz3q57VUrIPDQ575SdNN7RsgeXooIZc68/41hAYQgP5/nNl1qNdw1paGOu0r
         3VleLcc8TlIWZ+bJQ6S7hRL1rvQZ/hqm5DkVqs2OLrJVLfRK2oKas6tZuTpSoGskpu4M
         sQ+LZGffirzxero/W5FK0U22d8JCkJTiAu59TOqjvDnHlgSYVR/E+3m6mj/NH0XFwD+c
         WcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739414828; x=1740019628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5kxkb5SXzuW5nrMSS16AjhBvuZPHo3pjEYWjZd2DLNo=;
        b=pZVr6B2qBkZXSVbOWYVpUw38cxu6raHp08qHCJcOfkFIlC9NxQ5EJVmndY8BrEamHm
         6hTo8Yct3pqnGxEDu6LOIv3JoBi6kuMuvAq7RAta4wAfsF3TjVhZm7Y0COJsAm+Zs+Lh
         ErZD3mU9Y+wwh9Fa0O1Jy2JdbkcXzlWgSooiaIytVIDQzfH/8uowR59pjCg4vGSL6F8y
         g8v1sRvLQmvIr940/QyCDaSqAe9dHzciJIE7jmSinN+IHpKxczqo6omwIi6DxAiN0TkX
         nuwjphzP2IHzPnffnHAOLjgxFfKF4yDB7WdnxjBDGJDwU2k84U/00ISaZ07+gzgmyfNX
         2YOw==
X-Gm-Message-State: AOJu0Yy23+XEcDaNtG1f6DQZtTJvZgyBfAnmw/H5K5H6JPcoQ5FOSHKI
	cf8u2ZyzM/5eq3nshGUDc0KcNXI+6tA6/aFwncCP+u91I74Fx2AN3iJ/2gK9qmb7/L9rXqcDaje
	9PEAsC/5ktNvPKlr8Qthkgfusg+3tpBOcUfvQZQ==
X-Gm-Gg: ASbGnctKW83m3N9hGh6ChQFbniXFH1MrtAjqE0u1hakgCDKDy9Nu9nu1LwR7pcR/SDP
	I+F3Xdq6DyWQTFLg8bpBnxylYZN2+cXH2bgkLCeiLfPriJkuihDBho4jnhjxgDaL4MKXp6h30xJ
	NrKwuj4TZRC3pykwSs14ca8AS3vbju
X-Google-Smtp-Source: AGHT+IGgLEIVebgkBquHUP0f+CrfdcLtpdvMEsE42TEIgzioYUoKbqHzudZVHRgwYLw4Z+uHaor1sWXyr+KKjamUvRc=
X-Received: by 2002:a05:690c:9692:b0:6f9:544f:67dc with SMTP id
 00721157ae682-6fb1f171e84mr64115347b3.1.1739414828030; Wed, 12 Feb 2025
 18:47:08 -0800 (PST)
MIME-Version: 1.0
References: <20250212174726.1533501-1-quic_vpuar@quicinc.com>
 <3euq5c44kceeu4uowy3xoom6mp7bfameofky24u5fecpsvj7jh@p4dbwfnpctci> <52ed2610-bd10-4f3b-999d-7d6afe08b772@quicinc.com>
In-Reply-To: <52ed2610-bd10-4f3b-999d-7d6afe08b772@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Feb 2025 04:46:57 +0200
X-Gm-Features: AWEUYZn2hOPXa3tBQ8gMA4F8ZYBXG73TMVgmygnm_Ox_V7jX_pbgXkK3E_kKTa4
Message-ID: <CAA8EJpoLs1zi3sqead-a8C07A4mGd8YZwQJmZdeO2p0B8z14hg@mail.gmail.com>
Subject: Re: [PATCH v2] linux-firmware: upgrade 20250109 -> 20250211
To: Vivek Puar <quic_vpuar@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 02:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211287

On Thu, 13 Feb 2025 at 04:41, Vivek Puar <quic_vpuar@quicinc.com> wrote:

Please don't ever compose or send HTML email to the public mailing
lists. Your response has killed all quotation levels.

>
> On 2/13/2025 1:53 AM, Dmitry Baryshkov wrote:
>
> On Wed, Feb 12, 2025 at 11:17:26PM +0530, Vivek Puar wrote:
>
> Add DSP firmware for Qualcomm SA8775P / QCS9100
> platforms to ${PN}-qcom-sa8775p-{audio, compute, generalpurpose}
> packages, and updating it with correct license information.
>
> Add QCA6698AQ package ${PN}-ath11k-qca6698aq
> to ath11k firmware.
>
> Add bluetooth WCN3950 package ${PN}-qca-wcn3950
> to qca firmware.
>
> You've missed several other files:
>
> $ dpkg-deb -c tmp-rpb/deploy/ipk/all/linux-firmware_20250211-r0_all.ipk | grep qcom
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcm6490/
> lrwxrwxrwx root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcm6490/wpss.mbn -> ../../ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcs6490/
> lrwxrwxrwx root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcs6490/wpss.mbn -> ../../ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn

These two files should go to linux-firmware-qcom-qcm6490-wifi package.

> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/
> -rw-r--r-- root/root     73528 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adsp_dtbs.elf
> -rw-r--r-- root/root       697 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adspr.jsn
> -rw-r--r-- root/root       536 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adsps.jsn
> -rw-r--r-- root/root       731 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adspua.jsn
> -rw-r--r-- root/root       537 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn
> -rw-r--r-- root/root     40760 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/cdsp_dtbs.elf
> -rw-r--r-- root/root       534 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/cdspr.jsn
> -rw-r--r-- root/root  22043064 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcadsp8380.mbn
> -rw-r--r-- root/root   3072424 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qccdsp8380.mbn
> -rw-r--r-- root/root     12088 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn

And these files belong to 'Lenovo T14 G6'. They should be handled in a
way similar to the existing Lenovo X13s packages.

>
> $ dpkg-deb -c tmp-rpb/deploy/ipk/all/linux-firmware-qca-misc_20250211-r0_all.ipk
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qca/
> drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/
> -rw-r--r-- root/root    161716 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpbtfw21.tlv
> -rw-r--r-- root/root      6614 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpnv21.b206
> -rw-r--r-- root/root      6702 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpnv21.b207
> -rw-r--r-- root/root      6614 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpnv21.bin
> -rw-r--r-- root/root      1641 2025-02-10 14:55 ./usr/lib/firmware/qca/cmnv13s.bin
> -rw-r--r-- root/root      1641 2025-02-10 14:55 ./usr/lib/firmware/qca/cmnv13t.bin
>
> Will add these files.

Thanks!

>
> License-Update: additional files
>
> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  ...20250109.bb => linux-firmware_20250211.bb} | 36 ++++++++++++++++---
>  1 file changed, 32 insertions(+), 4 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250109.bb => linux-firmware_20250211.bb} (98%)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
> similarity index 98%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
> index b932300742..e3a29a284f 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250109.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
> @@ -55,6 +55,7 @@ LICENSE = "\
>      & Firmware-powervr \
>      & Firmware-qat \
>      & Firmware-qcom \
> +    & Firmware-qcom-2 \
>      & Firmware-qcom-yamato \
>      & Firmware-qla1280 \
>      & Firmware-qla2xxx \
> @@ -132,6 +133,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                      file://LICENSE.powervr;md5=83045ed2a2cda15b4eaff682c98c9533 \
>                      file://LICENCE.qat_firmware;md5=72de83dfd9b87be7685ed099a39fbea4 \
>                      file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
> +                    file://LICENSE.qcom-2;md5=165287851294f2fb8ac8cbc5e24b02b0 \
>                      file://LICENSE.qcom_yamato;md5=d0de0eeccaf1843a850bf7a6777eec5c \
>                      file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
>                      file://LICENCE.qla2xxx;md5=505855e921b75f1be4a437ad9b79dff0 \
> @@ -158,7 +160,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                      "
>  # WHENCE checksum is defined separately to ease overriding it if
>  # class-devupstream is selected.
> -WHENCE_CHKSUM  = "c90a25ccbd027eb8d61b2943ab68447c"
> +WHENCE_CHKSUM  = "65c2919e6511a0d348a009ac419375b7"
>
>  # These are not common licenses, set NO_GENERIC_LICENSE for them
>  # so that the license files will be copied from fetched source
> @@ -212,6 +214,7 @@ NO_GENERIC_LICENSE[Firmware-phanfw] = "LICENCE.phanfw"
>  NO_GENERIC_LICENSE[Firmware-powervr] = "LICENSE.powervr"
>  NO_GENERIC_LICENSE[Firmware-qat] = "LICENCE.qat_firmware"
>  NO_GENERIC_LICENSE[Firmware-qcom] = "LICENSE.qcom"
> +NO_GENERIC_LICENSE[Firmware-qcom-2] = "LICENSE.qcom-2"
>  NO_GENERIC_LICENSE[Firmware-qcom-yamato] = "LICENSE.qcom_yamato"
>  NO_GENERIC_LICENSE[Firmware-qla1280] = "LICENCE.qla1280"
>  NO_GENERIC_LICENSE[Firmware-qla2xxx] = "LICENCE.qla2xxx"
> @@ -247,7 +250,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
>  # Pin this to the 20220509 release, override this in local.conf
>  SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
>
> -SRC_URI[sha256sum] = "a12cb38f4793394bf56c6702be29b6e4f09deca0714943bba98a492030651570"
> +SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
>
> Applying: linux-firmware: upgrade 20250109 -> 20250211
> <PATH>/layers/openembedded-core/.git/rebase-apply/patch:51: trailing whitespace.
> SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"
>
> Will remove these whitespace warning.
>
>
>  inherit allarch
>
>
> Regards,
> Vivek



-- 
With best wishes
Dmitry

