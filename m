Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BD6CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 02:09:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.21998.1758420539801731579
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Sep 2025 19:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=iwH2qz8w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L1fsVM022849
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 02:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VePoUrYWDTZV1qkDjAPcznpe
	cC2CFBRkqNXNuW6QVwc=; b=iwH2qz8wLzkE/2n5Tehr4GhR0QQv1qHdmw6BJgU2
	MbRG8pfwJRccRK43lYt7MReafR35ZjxubGjjhZJh48KTI2dwgVOgU5rFy/pz47rP
	grz0Ilg1aRPIrV3VCNNBtdtmd/XYRdcKU1bWaX+o4dbfdLda81xA2GUvPTANeYz3
	qEYmFlqz5yNKFyQyKTpwMWlXpv21i9tU+x3Pjxn/IwYZANjPgLiQGuipW/YWmB4M
	jeJzWSPXqYX+0441CwswfnZ/MotFwjd2ojIG1PezmMYYU4djWddsuqU3ZfzLMvaE
	5l4Iz4Yan5OzykrDDK2BdFo4/pO0M1TsktBZKfNfEfY0MA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7ssnhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 02:08:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f9673e56so63646961cf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 19:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758420538; x=1759025338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VePoUrYWDTZV1qkDjAPcznpecC2CFBRkqNXNuW6QVwc=;
        b=fzpVOXq3mTRr7dJJSuujSkE8W04XZpLmvzjPwY2iib3zQkQsT1Mz+SzWDZIniTg2Fc
         pRfU87dqKuUm8yq/a9bdP1DxWucbcX0mVPDsHs7XKWeho/S8k3WoTtKfsZ/lcvDRT3Qm
         0Fj/KdkD5cJ0ujxtAbeU+dDkCN7Xbxe/x+PZsBGSTpFqRcAtClFKaFJImLld2g/IAJ3u
         9TPPN+1bbx3ha17KjYFFv9737GZtTpitzU+hcwNVmqxVLDN81phk6stJppv2+kD06ciH
         ihdDFM5cRPRqzdD+a6mt21Xgh9h3oXrJmZzmhJFFWq3mb3oYF4LLYewNCyGeJRBGD0ls
         /iNA==
X-Gm-Message-State: AOJu0YzIX770y/sdE2ErNbFvDN10mUvSlPzNBUrL2VpSHZNVDUeNV2KY
	6npjCkNX9BS4G9Q8hLfsHbgL/mPRMQ0/j8H4hvtVapAkoaJIsJGlq/i+aJBYDSZBtRalpqhfyil
	94G5uSs3e3r/W4LYpD3dzZvqr1DjUC2A2KVDVqzWBPGpta6ro0qSUmMW/UPYDyj7rDxHxSS6Odt
	sSe8f/t/0=
X-Gm-Gg: ASbGncvw6oxbajVBiVFQXBjF9gO8Rbe5xmAH4k2GMamBk532JF8zDrJNJMxFfZQf484
	QJYfUQXBxKZ4AZue65k1pU+tiXs1thmXqG+TLx5ZtY/4N4/AgX/ktM5F+uBlMudf6s0fKVlZPBC
	O+71CGaQ8GZrvcwtouPhl54Ttt7zIh1TYrZZNgmGuvqgjLeiXA01Wwhp2MNmSSA65o9NZGzU89y
	sFCTDIBU8reXLXdv55viNVYgakhlY3/wBzy5Fl9cUmDtL8FJX4t1lGVPBu0Ypk8nrh+9aUe+ILP
	mF1ABNC4b+euH+KakglPK5sWoum6/XlPWOVTMAiYbqoCmNO+5Vj+4NyIc+TP1x+p/EfBKOu66Oo
	csFgKd41eV0oLg8VxEcKSfvWcMyhGv2OwNe4Lg3LRmc5f1Vk2buaq
X-Received: by 2002:a05:622a:4c:b0:4b7:92f1:d641 with SMTP id d75a77b69052e-4c06ef892dcmr104459531cf.22.1758420537768;
        Sat, 20 Sep 2025 19:08:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8XdRhsJ4oDoDiVddRZN987RB9RSEg1apZMWJqj+H3vfTYKCUEEMjhC4GzUOwb7ETMZQcSmA==
X-Received: by 2002:a05:622a:4c:b0:4b7:92f1:d641 with SMTP id d75a77b69052e-4c06ef892dcmr104459381cf.22.1758420537196;
        Sat, 20 Sep 2025 19:08:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5792480aa6esm1913314e87.137.2025.09.20.19.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 19:08:56 -0700 (PDT)
Date: Sun, 21 Sep 2025 05:08:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] linux-firmware: upgrade 20250808 -> 20250917
Message-ID: <titjnkxilbv4oazhccrtbyji4rpntj5uep4aidv7cczo3ufqsp@x4daibydjf55>
References: <20250920153223.2091521-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920153223.2091521-1-vpuar@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX7TaccEDKC9PS
 NcDBYvW5v2Z3VV+xL9fRHvRdcMpLmXiU969h+3PoaoXVafpRLDt7n8nSDHVdLexw0Iol1SOVuFu
 qKUTb7Df6MVnVgrSsa428nTGGJKdbE1/z7vg7QQWxaC2c2D60IkVi2g+V/0CpiDejSoubLe0gb3
 Lm46YCoDbb9CzWaaIvLjU+EEKUMGPzpbQoTx8hnU1T6R9CIS3FffiHrQnH+jujGb4tTOnkEdALU
 3VoKa0esNMXvKCsizT/w6MsJNu63Eq5Svy3vsRKJkyUGzGqnGOjDzQXDsY4IuuAa/3VxwHn/Gor
 F7OoaK3cdTuXvf/QYNKVDDvAJUIgLxMV7P9lMGdTFQNGGWa+GVZZcXl6yd6k9knbWzduDz/9ByG
 +rffQJQ+
X-Proofpoint-ORIG-GUID: W__dXfnbCQ_nSGQj3uzR51UV_hFz2Tsf
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68cf5e3b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wkNF1-zqWbDbu-822RAA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: W__dXfnbCQ_nSGQj3uzR51UV_hFz2Tsf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 02:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223785

On Sat, Sep 20, 2025 at 09:02:23PM +0530, Vivek Puar wrote:
> Add packages ${PN}-qcom-qcs615-{audio, compute} to include DSP firmware
> for qcs615 platform, ${PN}-qcom-x1e80100-compute to include CDSP firmware
> for x1e80100 platform, and ${PN}-qcom-sm8350-adreno to include the GPU
> firmware for SM8350.
> 
> Extend Qualcomm QCS8300 RIDE and SA8775P platform to include audio topology
> and include linaro license with both the packages.

Nit: in future please describe why you are performing the change.

For this patch:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> License-Update: additional files
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20250808.bb => linux-firmware_20250917.bb} | 37 +++++++++++++------
>  1 file changed, 25 insertions(+), 12 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250808.bb => linux-firmware_20250917.bb} (98%)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
> similarity index 98%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
> index be38a8edf3..76ddf23411 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250808.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
> @@ -246,7 +246,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                      "
>  # WHENCE checksum is defined separately to ease overriding it if
>  # class-devupstream is selected.
> -WHENCE_CHKSUM  = "8417bc58fbaf0ae741a2bc8214db61f4"
> +WHENCE_CHKSUM  = "714332457b96406b3ccff321b60680b1"
>  
>  # These are not common licenses, set NO_GENERIC_LICENSE for them
>  # so that the license files will be copied from fetched source
> @@ -379,7 +379,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
>  # Pin this to the 20220509 release, override this in local.conf
>  SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
>  
> -SRC_URI[sha256sum] = "c029551b45a15926c9d7a5df1a0b540044064f19157c57fc11d91fd0aade837f"
> +SRC_URI[sha256sum] = "120575b756915a11e736f599316a756b6a29a76d6135ad86208868b21c58fb75"
>  
>  inherit allarch
>  
> @@ -610,7 +610,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
>               ${PN}-qcom-qcm6490-adreno ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute \
>               ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \
> -             ${PN}-qcom-qcs615-adreno \
> +             ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs615-audio ${PN}-qcom-qcs615-compute \
>               ${PN}-qcom-qcs8300-adreno ${PN}-qcom-qcs8300-audio ${PN}-qcom-qcs8300-compute \
>               ${PN}-qcom-qcs8300-generalpurpose ${PN}-qcom-qcs8300-qupv3fw \
>               ${PN}-qcom-qrb4210-adreno \
> @@ -630,7 +630,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
>               ${PN}-qcom-sm8550-audio-tplg \
>               ${PN}-qcom-sm8650-audio-tplg \
> -             ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio \
> +             ${PN}-qcom-sm8350-adreno \
> +             ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio ${PN}-qcom-x1e80100-compute \
>               ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
>               ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute ${PN}-qcom-x1e80100-lenovo-t14s-g6-vpu \
>               ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio \
> @@ -1949,14 +1950,16 @@ LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm2290-wifi = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm6490-adreno = "Firmware-qcom"
> -LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
> +LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom & Firmware-linaro"
>  LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm6490-wifi  = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm6490-qupv3fw = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
> +LICENSE:${PN}-qcom-qcs615-audio = "Firmware-qcom"
> +LICENSE:${PN}-qcom-qcs615-compute = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
> -LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2"
> +LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2 & Firmware-linaro"
>  LICENSE:${PN}-qcom-qcs8300-compute = "Firmware-qcom-2"
>  LICENSE:${PN}-qcom-qcs8300-generalpurpose = "Firmware-qcom-2"
>  LICENSE:${PN}-qcom-qcs8300-qupv3fw = "Firmware-qcom"
> @@ -1966,7 +1969,7 @@ LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qrb4210-modem = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qrb4210-wifi = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sa8775p-adreno = "Firmware-qcom"
> -LICENSE:${PN}-qcom-sa8775p-audio = "Firmware-qcom-2"
> +LICENSE:${PN}-qcom-sa8775p-audio = "Firmware-qcom-2 & Firmware-linaro"
>  LICENSE:${PN}-qcom-sa8775p-compute = "Firmware-qcom-2"
>  LICENSE:${PN}-qcom-sa8775p-generalpurpose = "Firmware-qcom-2"
>  LICENSE:${PN}-qcom-sa8775p-qupv3fw = "Firmware-qcom"
> @@ -1987,8 +1990,10 @@ LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
>  LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
> +LICENSE:${PN}-qcom-sm8350-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom"
> +LICENSE:${PN}-qcom-x1e80100-compute = "Firmware-qcom"
>  LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "Firmware-qcom & Firmware-linaro"
>  LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "Firmware-qcom"
> @@ -2045,8 +2050,10 @@ FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa
>  FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
>  FILES:${PN}-qcom-qcm6490-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/qupv3fw.elf*"
>  FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
> +FILES:${PN}-qcom-qcs615-audio = "${nonarch_base_libdir}/firmware/qcom/qcs615/adsp*.*"
> +FILES:${PN}-qcom-qcs615-compute = "${nonarch_base_libdir}/firmware/qcom/qcs615/cdsp*.*"
>  FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
> -FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.*"
> +FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin*"
>  FILES:${PN}-qcom-qcs8300-compute = "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
>  FILES:${PN}-qcom-qcs8300-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/qcs8300/gpdsp*.*"
>  FILES:${PN}-qcom-qcs8300-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qcs8300/qupv3fw.elf*"
> @@ -2056,7 +2063,7 @@ FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210
>  FILES:${PN}-qcom-qrb4210-modem = "${nonarch_base_libdir}/firmware/qcom/qrb4210/modem*.*"
>  FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qrb4210/*"
>  FILES:${PN}-qcom-sa8775p-adreno = "${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
> -FILES:${PN}-qcom-sa8775p-audio = "${nonarch_base_libdir}/firmware/qcom/sa8775p/adsp*.*"
> +FILES:${PN}-qcom-sa8775p-audio = "${nonarch_base_libdir}/firmware/qcom/sa8775p/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs9100/LEMANS-EVK-tplg.bin*"
>  FILES:${PN}-qcom-sa8775p-compute = "${nonarch_base_libdir}/firmware/qcom/sa8775p/cdsp*.*"
>  FILES:${PN}-qcom-sa8775p-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/sa8775p/gpdsp*.*"
>  FILES:${PN}-qcom-sa8775p-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/sa8775p/qupv3fw.elf*"
> @@ -2079,8 +2086,10 @@ FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/c
>  FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
>  FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8550/*tplg.bin*"
>  FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
> +FILES:${PN}-qcom-sm8350-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8350/a660_zap.mbn*"
>  FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
>  FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
> +FILES:${PN}-qcom-x1e80100-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/cdsp*.*"
>  FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
>  FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin*"
>  FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*cdsp*.*"
> @@ -2124,7 +2133,7 @@ RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcm2290-wifi = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcm6490-adreno = "${PN}-qcom-license"
>  RPROVIDES:${PN}-qcom-qcm6490-adreno = "${PN}-qcom-qcs6490-adreno"
> -RDEPENDS:${PN}-qcom-qcm6490-audio = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-qcm6490-audio = "${PN}-qcom-license ${PN}-linaro-license"
>  RPROVIDES:${PN}-qcom-qcm6490-audio = "${PN}-qcom-qcs6490-audio"
>  RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
>  RPROVIDES:${PN}-qcom-qcm6490-compute = "${PN}-qcom-qcs6490-compute"
> @@ -2133,8 +2142,10 @@ RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
>  RPROVIDES:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-qcs6490-wifi"
>  RDEPENDS:${PN}-qcom-qcm6490-qupv3fw = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-qcs615-audio = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-qcs615-compute = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
> -RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license"
> +RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-qcs8300-compute = "${PN}-qcom-2-license"
>  RDEPENDS:${PN}-qcom-qcs8300-generalpurpose = "${PN}-qcom-2-license"
>  RDEPENDS:${PN}-qcom-qcs8300-qupv3fw = "${PN}-qcom-license"
> @@ -2146,7 +2157,7 @@ RDEPENDS:${PN}-qcom-qrb4210-modem = "${PN}-qcom-license"
>  # c.f. https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=650e88378e76d5fad3997a5398f1ade47a74d924
>  RDEPENDS:${PN}-qcom-qrb4210-wifi = "${PN}-qcom-license ${PN}-qcom-qcm2290-wifi"
>  RDEPENDS:${PN}-qcom-sa8775p-adreno = "${PN}-qcom-license"
> -RDEPENDS:${PN}-qcom-sa8775p-audio = "${PN}-qcom-2-license"
> +RDEPENDS:${PN}-qcom-sa8775p-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-sa8775p-compute = "${PN}-qcom-2-license"
>  RDEPENDS:${PN}-qcom-sa8775p-generalpurpose = "${PN}-qcom-2-license"
>  RDEPENDS:${PN}-qcom-sa8775p-qupv3fw = "${PN}-qcom-license"
> @@ -2167,8 +2178,10 @@ RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
> +RDEPENDS:${PN}-qcom-sm8350-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-x1e80100-compute = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-license ${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${PN}-qcom-license"
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

