Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78586C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 20:23:19 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.26455.1739391796776615379
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 12:23:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=c7rtT1+G;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-545054d78edso48813e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 12:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739391795; x=1739996595; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NpIWMNqnMRj7oNgXEVrDQOQo4bO6HuoOBtBh0kiWUd0=;
        b=c7rtT1+GJpUnqy2vJwOsTlFX0o+0Wbg6C9W1F+gVhr4erraJs6vMC9Zy5HH62Hgli8
         aAXyocUUnA6DPPMtW7Nl3BkdSExo3z/NosyQNprU981E/uarOQgjYvPjRS9vj5E3cpHP
         iNrxRJrdev6uifHdhHS0uGQOSB0Dst6T4jhlr50aq1noRHzz5U8ng9nYSnvB+GAbjZw/
         0oXLKP2JD+vRThAXey6QFGQbJJs9gF0zmAzmESt3w4txEKHTnQCS/jM/ohqZXsqVTGU6
         SmLMkiJwY81L+1qj5Y9Xvf/qOgAYVZMHfHlXngs+gQinlY2a4qR1E3IpTPVAXbND0NrU
         ABtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739391795; x=1739996595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpIWMNqnMRj7oNgXEVrDQOQo4bO6HuoOBtBh0kiWUd0=;
        b=cOWnnOvTtZLwSlXr7oLyDDfMT9I62XSy2uCoUys9g6iG4/nNDe2MtBOqJefJ5xpGic
         xAadOoY8Wz1hvlr7dYEoC610/CcMXDj/x1jAaa/ZDOb5r4RSaalFjXR6AUvENKbtqFQn
         rLfJC31p1Y1o5tXdRakA+CzqEXJI6o5YMCMa+2Nho467WQaMcxtHU8DjNBkY0GID7BOq
         BMB4NSNoivjEce2fmzjA2agVRZndAKfFThWX7T9pWSLKivUZTYgHH4+UkMpsfJmvK1P7
         9Cq5/N514+e1WWrbvSJriAN0d5vlnbRS2kRbhvASJcOtO3bzyXL5sFDUepXvaxQgW8J0
         QUJg==
X-Gm-Message-State: AOJu0YysCBlUZFsdECbNpAvvMWw70hzp8enXRY0zZABTA2BK6aML9Oeh
	1051N/LtC+ubuz3+YdbDjNiWpzDjfi5DtOM+s9xPqGDBuLoaN9yBXQUZ6oNN2Yg=
X-Gm-Gg: ASbGncvyTzIUTQCP5dxvAMVNt5vmkWNo+oPEcvUwgTV9e4HFRe060uYDHQmcHAm49wI
	IYkp/VZMSIJOgWTRTOZF9y1stnFThPx13syGRa16zxbUlLBUd5tlJTlRNAaf6h2k8kAPNjPRypi
	5I98BJVpGYCAfPbxei7a8yyVGZdqAOS54V3w9N0sFic/SfdjF9noLTJlEtVDJHo25/SJtjSQ+3Y
	AxaGZg2vvx/Iffokir4zIf8mvPlzo70j1dnWB4FI0FeU6NvTQQjdExn0iDnH9QH7NuCkX05yZpY
	LqIow6AocdvbS9SM43YBgmTjaDT6beMLNB/3d1K5nMGkXWhR7NjBLxX7nkBxjSLrJT7yr/c=
X-Google-Smtp-Source: AGHT+IFEBFN5QaWkm9aMkYuR+oKnxBTBtm1WodNEkdzd8+x5IO+8gC//hJh1AIXJfNNVE1FGxfwnTw==
X-Received: by 2002:a05:6512:3c87:b0:545:b9a:b4b4 with SMTP id 2adb3069b0e04-54518194f92mr1499566e87.52.1739391794438;
        Wed, 12 Feb 2025 12:23:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54501574a3fsm1582295e87.252.2025.02.12.12.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:23:14 -0800 (PST)
Date: Wed, 12 Feb 2025 22:23:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vivek Puar <quic_vpuar@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] linux-firmware: upgrade 20250109 -> 20250211
Message-ID: <3euq5c44kceeu4uowy3xoom6mp7bfameofky24u5fecpsvj7jh@p4dbwfnpctci>
References: <20250212174726.1533501-1-quic_vpuar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212174726.1533501-1-quic_vpuar@quicinc.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 20:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211277

On Wed, Feb 12, 2025 at 11:17:26PM +0530, Vivek Puar wrote:
> Add DSP firmware for Qualcomm SA8775P / QCS9100
> platforms to ${PN}-qcom-sa8775p-{audio, compute, generalpurpose}
> packages, and updating it with correct license information.
> 
> Add QCA6698AQ package ${PN}-ath11k-qca6698aq
> to ath11k firmware.
> 
> Add bluetooth WCN3950 package ${PN}-qca-wcn3950
> to qca firmware.

You've missed several other files:

$ dpkg-deb -c tmp-rpb/deploy/ipk/all/linux-firmware_20250211-r0_all.ipk | grep qcom
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcm6490/
lrwxrwxrwx root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcm6490/wpss.mbn -> ../../ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcs6490/
lrwxrwxrwx root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/qcs6490/wpss.mbn -> ../../ath11k/WCN6750/hw1.0/qcm6490/wpss.mbn
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/
-rw-r--r-- root/root     73528 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adsp_dtbs.elf
-rw-r--r-- root/root       697 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adspr.jsn
-rw-r--r-- root/root       536 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adsps.jsn
-rw-r--r-- root/root       731 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/adspua.jsn
-rw-r--r-- root/root       537 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn
-rw-r--r-- root/root     40760 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/cdsp_dtbs.elf
-rw-r--r-- root/root       534 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/cdspr.jsn
-rw-r--r-- root/root  22043064 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcadsp8380.mbn
-rw-r--r-- root/root   3072424 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qccdsp8380.mbn
-rw-r--r-- root/root     12088 2025-02-10 14:55 ./usr/lib/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn

$ dpkg-deb -c tmp-rpb/deploy/ipk/all/linux-firmware-qca-misc_20250211-r0_all.ipk
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qca/
drwxr-xr-x root/root         0 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/
-rw-r--r-- root/root    161716 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpbtfw21.tlv
-rw-r--r-- root/root      6614 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpnv21.b206
-rw-r--r-- root/root      6702 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpnv21.b207
-rw-r--r-- root/root      6614 2025-02-10 14:55 ./usr/lib/firmware/qca/QCA6698/hpnv21.bin
-rw-r--r-- root/root      1641 2025-02-10 14:55 ./usr/lib/firmware/qca/cmnv13s.bin
-rw-r--r-- root/root      1641 2025-02-10 14:55 ./usr/lib/firmware/qca/cmnv13t.bin

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

Applying: linux-firmware: upgrade 20250109 -> 20250211
<PATH>/layers/openembedded-core/.git/rebase-apply/patch:51: trailing whitespace.
SRC_URI[sha256sum] = "2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d"

>  
>  inherit allarch
>  

-- 
With best wishes
Dmitry

