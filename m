Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AB7C7EE30
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 01:35:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.3348.1750988101221576567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 18:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ageLCKd7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJKeAK013200
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 01:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bm68mdlhrjMprVWAA9T0jvXR
	Tt5n4yK2AX50edOA1II=; b=ageLCKd7fG+N2j7PcXInOXsyU7UWH3hZDb9ElvGc
	XFyVskpewfnFrAIH3qZWwaXuKUW8vX3yrxvV6RHqMfM1KVRN0mGzPvlQwymaxMkT
	xW4oCnlbAGJcnCSHfS2zZEu9YJ2cry34ysHR8nOPzvY3qiiXntlbYIG5VL8kvkvc
	oqb08uXZGlidNFdajM0GdvabnSp3YH7Nb6tK8pRhk/WBpwccCup8TkYtjZ124Dhm
	y3TL7inpyhxRT8V3vm3Xmp8oWhxdjwuxSaw6/HY+MyToefSpGqDM0Jhmvzb+J6Yv
	JXPQugLLsD/SyY347dMq4BD+mm69435UuEINKD/suOM5LQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm23p22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 01:34:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so2495639a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 18:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750988099; x=1751592899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bm68mdlhrjMprVWAA9T0jvXRTt5n4yK2AX50edOA1II=;
        b=Ge1toVHWYswcdhJC5oHkA92eCOiv6RQcm9oMRMtPU7Ww9uVX7Yb/ic0sMqCyVf6WiN
         yGuxBKYH3+HP0QhlX4cQQkhr0X0xri0BhOYUwAO9c02hm6dm0qje4iS+eIrTJmAmtgKi
         MpddLE3KPFMC2naEXpxeo7Giu9RRzYG0ccQp3qF38wsnX0DnD1RhcSO/fWa9fZtRO3yg
         WfS7J7CL3aOsPZezpmzcbzHTcCVm3+53n9+ZHGysCcQp7v16pGyknu/+Al6JWssZzJIi
         qY4m9eLPTh1vaX5OcIdRDg2NxgKVLRdDLsscBMoIevGT/tlhNXdQOKC5SiBT3+MolCze
         fqaw==
X-Gm-Message-State: AOJu0YxPmrKYEhHQtLuQ+uPYRKIgEa5ZbcBBPww802RqCPpgdbVOfFW9
	vHKS9BBh68CeRC8KzqUAciY+axaQbXjjh8Tqh8FdFrpmAuGC239UNHiM1jEY6km/sEzpon8KHQS
	7DSraiiXUlgtEqseB1u8nLKHgTOzbg85ixAspDVfJo2HZYnVbaNZMkNh9dLGDqZ5A/P6iyrNTdo
	DrW1410T+z+UxiJjRIJZkU2ynw74omQ6qIOoWvaokCatACR7G1n6o25Owb8A==
X-Gm-Gg: ASbGncuB+C2HMpgc/3KOXa7/4jjlS0eUdaAQr/I0irFFo9DtRkdkbzYctQJCa4sbAMj
	EsDG+97Is7QF60B27JqdeqhlDSdXOy/eTpdkB6oeBLBtEYr34caDHaCZdX22Ryo2WRHAtz1udDA
	lodpKD
X-Received: by 2002:a17:90b:4c4f:b0:314:2a2e:9da9 with SMTP id 98e67ed59e1d1-318c92e1a98mr1616989a91.25.1750988098542;
        Thu, 26 Jun 2025 18:34:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp/FoDitnNCQm56fHm3d7zC4JQrRnkw4AXQ8VyOdBZooFd22v5+b6lnqFPHAaxk+BJUF3gI5P5TLP/awU+3rU=
X-Received: by 2002:a17:90b:4c4f:b0:314:2a2e:9da9 with SMTP id
 98e67ed59e1d1-318c92e1a98mr1616959a91.25.1750988098042; Thu, 26 Jun 2025
 18:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250626194543.2363054-1-vpuar@qti.qualcomm.com>
In-Reply-To: <20250626194543.2363054-1-vpuar@qti.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 04:34:49 +0300
X-Gm-Features: Ac12FXyfahAD8LdIQ53KBksqBvHkRlTneE5ab10B7S0K6pZ2pUayxbMWWdhHZ3w
Message-ID: <CAO9ioeUxY7g+=_7qUDFDAfYgoe=_nEH7cv1HgH__V4ve-roGag@mail.gmail.com>
Subject: Re: [PATCH] linux-firmware: upgrade 20250509 -> 20250613
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685df544 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Ax37FlZVfRim-1LqItkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: QXqI9nNs-0Nk0Zp-mFt1TzbvcQ-edBw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAxMCBTYWx0ZWRfXxcPbFnW6cly7
 uzpwaA9xs2mcbQYHaWkVpgNEqkOPJB0ZEfBPItA8TccP8X9RPSlZR5dPnScY3x4vtXhSb13bsWZ
 0wVLAtlIc2kgziKzpPHOCsT4udgbRpK1FkLVb79JKDDU8SASP+gH/d4CKXDGBBfoI2J2MlahopW
 YsWLEhIqGyW242z2JY0V6u5TlqYIhWPnGk9mJeypNyV3aue8R5a2kBzy4GepgvO/NPLWAZewsR7
 OiEvki+6BnQBqe8yWc+hTHecUcvdvt76pzPJL5X/yb+9+iv3YFY8pJvK/0Hx7kZReQ6+QwIiaYQ
 RdooXvD2NfiYm5kT/nohAkOKk6M27q92OBzvxc5sYFkcLejJVpiwpubgEifkZqX5hlcMQbwwo6l
 ie5grdbNQMmf5iCfMgk4Lzj8oFa8/DyNNqEXASl+uDJfzqwpzeSeWJg+bCTyrGtzGKtBhBGq
X-Proofpoint-ORIG-GUID: QXqI9nNs-0Nk0Zp-mFt1TzbvcQ-edBw7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 01:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219375

On Thu, 26 Jun 2025 at 22:46, Vivek Puar <vpuar@qti.qualcomm.com> wrote:
>
> Adding QUPv3 firmware for QCM6490 and QCS8300 platforms.
>
> Add package ${PN}-qcom-sc8280xp-lenovo-x13s-vpu for Lenovo X13s
> laptop.
>
> License-Update: additional files
>
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20250509.bb => linux-firmware_20250613.bb} | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250509.bb => linux-firmware_20250613.bb} (98%)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb
> similarity index 98%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb
> index ea75271af8..34ece57c8a 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250509.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250613.bb
> @@ -97,7 +97,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                      file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
>                      file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
>                      file://LICENSE.cirrus;md5=662ea2c1a8888f7d79ed7f27c27472e1 \
> -                    file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0 \
> +                    file://LICENCE.cnm;md5=df3992006621b797e36de43f36336e36 \
>                      file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
>                      file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
>                      file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \

I've noticed that this list is not complete anymore, May release got
LICENSE.intel, could you please account for that (in a separate
commit).

> @@ -160,7 +160,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                      "
>  # WHENCE checksum is defined separately to ease overriding it if
>  # class-devupstream is selected.
> -WHENCE_CHKSUM  = "d85e2f182f489a235400712cbfdb017a"
> +WHENCE_CHKSUM  = "131efa2b2bab317f52b081719225dd64"
>
>  # These are not common licenses, set NO_GENERIC_LICENSE for them
>  # so that the license files will be copied from fetched source
> @@ -250,7 +250,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
>  # Pin this to the 20220509 release, override this in local.conf
>  SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
>
> -SRC_URI[sha256sum] = "f2c60d66f226a28130cb5643e6e544d3229673460e127c91ba03f1080cbd703e"
> +SRC_URI[sha256sum] = "d40743337ca8bf9d2587e220ab30dec6a07b52cc5cb4a4ff8d92be14391a7fde"
>
>  inherit allarch
>
> @@ -478,11 +478,11 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
>               ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
>               ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
> -             ${PN}-qcom-qcm6490-adreno \
> -             ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi \
> +             ${PN}-qcom-qcm6490-adreno ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute \
> +             ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \
>               ${PN}-qcom-qcs615-adreno \
>               ${PN}-qcom-qcs8300-adreno ${PN}-qcom-qcs8300-audio ${PN}-qcom-qcs8300-compute \
> -             ${PN}-qcom-qcs8300-generalpurpose \
> +             ${PN}-qcom-qcs8300-generalpurpose ${PN}-qcom-qcs8300-qupv3fw \
>               ${PN}-qcom-qrb4210-adreno \
>               ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
>               ${PN}-qcom-sa8775p-adreno ${PN}-qcom-sa8775p-audio ${PN}-qcom-sa8775p-compute \
> @@ -492,6 +492,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
>               ${PN}-qcom-sc8280xp-lenovo-x13s-compute \
>               ${PN}-qcom-sc8280xp-lenovo-x13s-sensors \
> +             ${PN}-qcom-sc8280xp-lenovo-x13s-vpu \
>               ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
>               ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
>               ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
> @@ -1816,11 +1817,13 @@ LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm6490-wifi  = "Firmware-qcom"
> +LICENSE:${PN}-qcom-qcm6490-qupv3fw = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2"
>  LICENSE:${PN}-qcom-qcs8300-compute = "Firmware-qcom-2"
>  LICENSE:${PN}-qcom-qcs8300-generalpurpose = "Firmware-qcom-2"
> +LICENSE:${PN}-qcom-qcs8300-qupv3fw = "Firmware-qcom-2"

Strangely enough, no. This file is governed by -qcom, not -qcom-2
(BTW, could you please also correct licence for sa8775p-qupv3fw, while
we are at it?)

>  LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
> @@ -1835,6 +1838,7 @@ LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "Firmware-qcom & Firmware-linaro
>  LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "Firmware-qcom"
> +LICENSE:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sdm845-audio = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sdm845-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sdm845-compute = "Firmware-qcom"
> @@ -1899,11 +1903,13 @@ FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qc[ms]649
>  FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/cdsp*.*"
>  FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn"
>  FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
> +FILES:${PN}-qcom-qcm6490-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qcm6490/qupv3fw.elf*"
>  FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
>  FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
>  FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.*"
>  FILES:${PN}-qcom-qcs8300-compute = "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
>  FILES:${PN}-qcom-qcs8300-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/qcs8300/gpdsp*.*"
> +FILES:${PN}-qcom-qcs8300-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qcs8300/qupv3fw.elf*"
>  FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
>  FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
>  FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
> @@ -1919,6 +1925,7 @@ FILES:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${nonarch_base_libdir}/firmware/q
>  FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn*"
>  FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
>  FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
> +FILES:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${nonarch_base_libdir}/firmware/qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn*"
>  FILES:${PN}-qcom-sdm845-adreno = "${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
>  FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
>  FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
> @@ -1980,11 +1987,13 @@ RPROVIDES:${PN}-qcom-qcm6490-compute = "${PN}-qcom-qcs6490-compute"
>  RDEPENDS:${PN}-qcom-qcm6490-ipa = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
>  RPROVIDES:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-qcs6490-wifi"
> +RDEPENDS:${PN}-qcom-qcm6490-qupv3fw = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license"
>  RDEPENDS:${PN}-qcom-qcs8300-compute = "${PN}-qcom-2-license"
>  RDEPENDS:${PN}-qcom-qcs8300-generalpurpose = "${PN}-qcom-2-license"
> +RDEPENDS:${PN}-qcom-qcs8300-qupv3fw = "${PN}-qcom-2-license"
>  RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
> @@ -2001,6 +2010,7 @@ RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-license ${PN}-linar
>  RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sdm845-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
> @@ -2026,6 +2036,7 @@ RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-
>  RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
>  RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
>  RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
> +RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
>
>  LICENSE:${PN}-liquidui = "Firmware-cavium_liquidio"
>  FILES:${PN}-liquidio = "${nonarch_base_libdir}/firmware/liquidio"
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

