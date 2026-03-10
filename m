Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301E5FD2D84
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 13:31:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39987.1773149462570588495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 06:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=joAk/8/Q;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=QEAy2b3q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaWOb789261
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 13:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ko81knvqDQeUZnZaZKt8CBWY
	5/5Cv59vMbXDNphzG7A=; b=joAk/8/Q0FlakIipyLEuTTEffndyVtD4HFXXEJUy
	q/N4JRlHS8ChUeTz+Ii3C2UfMLsRRR+9ySAoAlkHUDoNL+rq/O+o3rD8PUCnVk9a
	9JoUE+EVoIEmBHOd5w1Kdg6ynfM7RpXgPVRjXZVUnTFqzg8zku3ciFG11ZR5X23b
	78jMvUAiJ0f/33ZfTBXZpIYe9JtpVXsreVTmejo8WAj7hnC6WgRO/B8kYOc7TpFn
	w1LSbSqiZlk10Ex75sUduI7gpASkNd/lX/8d6H+KonxKge4opSF4XxeqemnXe9l9
	Hj3AKhdrLXiqBkurmv7hoBU0saPsS9LYgDk+iLYQs+8prA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekv1xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 13:31:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94acebd8d64so18752711241.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 06:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149461; x=1773754261; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ko81knvqDQeUZnZaZKt8CBWY5/5Cv59vMbXDNphzG7A=;
        b=QEAy2b3q1WQ5U35KEgZSKUCmQbeLlklgquGZXSkqJHlLoHB07MoPtXpb05ap2DJ41i
         CN/Vuv7v95u5D3ioA/j/J0/JXAWFzdCn3xreqFNroT51K8arKlJ0OkWzF0GhA5hx0pNl
         cQc2v12Yo7dZWBpC1iNPxhVvr8desl+yRY8MduFayme6HHY27Tcpzqn9b2Q1oMRZm2Q/
         nCSoCxMhDsu3tBoDCKy6RwEmm5pxhqgFgEwJ8Yb7iRffe18eQ7SLNwaGDyJmDpt0IRqi
         Z/Mnkglc0cWAg2jxJQkYxqZGFCJRATG2ZolKmUbMyJaO0pfTQSTarSf60w2OPqmZQdoM
         uW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149461; x=1773754261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ko81knvqDQeUZnZaZKt8CBWY5/5Cv59vMbXDNphzG7A=;
        b=C52OS++HzqGAOunARuioLNKHMBy5u9gNcu59aenpneaaYTFJ61NIn5c1RoH+lLOpaR
         /UKUD2NJgWoim+5CM4uNQoRj1j7ZNJh3xB3qKZCPCVvlZsmKsNnj8eMOb3r1GaujR+Xs
         5E+yZrRW2tag5P0G1S/mNp+mELaG4An2nZij0Zh3uiGCL1EsAV+EFpDPUuA8raONykfJ
         IHUdhi7CDaSlG6rSRbQDh2SUM810RdUkAmIuu9BHZfKa9eF/ORqKYumbsfIHE6e70Xal
         yeRRctncwRt6NaCU4gkiBMfIBznFxlkRVMslz57INjavL3T0hcCeECKH3SGuy4d/M8hh
         AOBA==
X-Gm-Message-State: AOJu0Yx+/pJds0GnydexRnXzcoHyNcfBF74ZvTFb+giaqCeEmITRV6H/
	qUMOoJYuVhIhExgKfDLz6KVdrI/WWVYFaWOM0g2SIDQObucOuyNpKUjFDrvurTX0/fD66rbN1Qp
	oD7bFxRCFVxQe09pbxOQ3RihITRqegoDd9VwrsEJSJ0CaIESCOPnswDxpWv0aZX27sP/Z6HdlYz
	aTTrtv+PQ=
X-Gm-Gg: ATEYQzx7BLQq4R6X7H2xze8TFEhVfYFgVwzIymiGL9M1DM79xdERt1KYAuKGInucxVy
	dI7ZCqAdDYB6A6zFDRKFOPzdv7HOvkG/0dIsrvE3cFb3lNChPHaPa6iKn1VspzWdy+YcVHTN/M2
	TWuKQUU5kFjJpkWjY+I5/ru+nmbHkJhz//ik0lwUX00Omo5gwgdQqoYvoQ0jAv4hmKmiWUlkeyB
	lbwaCcsuVGGhogdxs5yTGLdkMINZeUKNdkdZjXcMztdYKwg0dEL/i2tv4swplq1vFcxmQVvzNfL
	PWnCgqK7AC6p/4r1y1yW5pTQcCyXfaMpH4OYcZ1ZY/l76dVI00qtbLFZsZsHo2otfcFhXsl8dNp
	nR0V20NKxpe6mnDhJ5oxPaZ7+rXKsxb0y32P6HuMiB4GE90v7iWSDfcByS0+k7N2xvzelXvKDYz
	sL91FbWM0jTh1EfGbIjgcVNerIzNzWqREV5A4=
X-Received: by 2002:a05:6102:292a:b0:5ff:2426:94ed with SMTP id ada2fe7eead31-5ffe616744bmr6029226137.28.1773149459381;
        Tue, 10 Mar 2026 06:30:59 -0700 (PDT)
X-Received: by 2002:a05:6102:292a:b0:5ff:2426:94ed with SMTP id ada2fe7eead31-5ffe616744bmr6029119137.28.1773149458270;
        Tue, 10 Mar 2026 06:30:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfd3800sm4685931fa.19.2026.03.10.06.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:30:57 -0700 (PDT)
Date: Tue, 10 Mar 2026 15:30:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: upgrade 20260221 -> 20260309
Message-ID: <t2imob3rqfil3vkl2pfsrulvas4vbfq2a33zd7vgjpx2ne5hvt@26nynfjviqet>
References: <20260310074128.3451158-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310074128.3451158-1-vpuar@qti.qualcomm.com>
X-Proofpoint-GUID: N1pGoFvBnQixwFAbVBqk7_UPB3b-LLSH
X-Proofpoint-ORIG-GUID: N1pGoFvBnQixwFAbVBqk7_UPB3b-LLSH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNyBTYWx0ZWRfXzPFKokvaKT7M
 fA4vL8UKuolaDzJmkdpJcBweTtmYGXoFJ1P+X3SHTP05KM+RgqF9+kLCvZhm8vdq3oA+bcpQ+qO
 4kxwWGWo7ATX63f1RBNUocUuXPQvTXR3sg3VnnMv2aw5TejJMxibS0JrJvnK3j2Jy71CD9nz4LC
 zd941yJS+7jujh0/y8PAtDZl/i8f4XGm5gfEATsAKaE7qNzQal/y4JpPhVifsEBxDhS94g/NtOC
 ctS8ZR9PkP6owpPDqYJ6LierDuyqG2q9NPDvlBFsxhmJFqIUZ9At/xG9as+vQVZXcWNaD8ptgBv
 EwwzST3I7WxluDhB7ZFw0ePi9Aj6g32gYYvWuiAq1ZFVQXe2HL9qc1WK+VfNGMgmlI3EciB3nkM
 INQPsHU3pLhAXo2qAWFjwZSqLom6CMSvPVDTsYuompkSogniMXPORuBg/c5cjprD0Trq19UEqkS
 AG4cDPph77f7K2LB1QA==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b01d16 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=xt9IZqeDl81okkGeRFYA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 13:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232784

On Tue, Mar 10, 2026 at 01:11:28PM +0530, Vivek Puar wrote:
> Upgrade the firmware package to latest release. Add package
> ${PN}-lt8713sx for Lontium LT8713SX DP hub, add audioreach
> firmware for Kaanapali, Lenovo ISH LNLM firmware was renamed so
> add new packages, and modify FILES:${PN} for package
> ${PN}-ish-lnlm-12128606 to pack firmwares properly.
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20260221.bb => linux-firmware_20260309.bb} | 29 ++++++++++++++-----
>  1 file changed, 22 insertions(+), 7 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260221.bb => linux-firmware_20260309.bb} (99%)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260221.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb
> similarity index 99%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260221.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb
> index 168ccaa6d5..1eebb92e1d 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260221.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb
> @@ -314,7 +314,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                      "
>  # WHENCE checksum is defined separately to ease overriding it if
>  # class-devupstream is selected.
> -WHENCE_CHKSUM  = "e3897ca46d046032a2b60b8554caf61d"
> +WHENCE_CHKSUM  = "772c8667ff568e7de3a7794fd420f2f7"
>  
>  # These are not common licenses, set NO_GENERIC_LICENSE for them
>  # so that the license files will be copied from fetched source
> @@ -452,7 +452,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
>  # Pin this to the 20220509 release, override this in local.conf
>  SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
>  
> -SRC_URI[sha256sum] = "bd19acc4c1a02548e09d3df67f987fe6e378df735bab138c1d9e917962056d94"
> +SRC_URI[sha256sum] = "c74cc6f562b58ad5bc6b2b00a61abc29c9e49e06126e7ba34fbca9928e07a96c"
>  
>  inherit allarch
>  
> @@ -763,7 +763,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-qla2xxx ${PN}-qla2xxx-license \
>               ${PN}-rockchip-license ${PN}-rockchip-dptx \
>               ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
> -             ${PN}-lt9611uxc ${PN}-lontium-license \
> +             ${PN}-lt8713sx ${PN}-lt9611uxc ${PN}-lontium-license \
>               ${PN}-wfx-license ${PN}-wfx \
>               ${PN}-whence-license \
>               ${PN}-xc4000-license ${PN}-xc4000 \
> @@ -774,6 +774,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-dell-license ${PN}-ish-lnlm-39ceeaf8 ${PN}-ish-ptl-39ceeaf8 \
>               ${PN}-hp-license ${PN}-ish-lnlm-12128606 \
>               ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad \
> +             ${PN}-ish-lnlm-lenovo-thinkpad-x9-14 ${PN}-ish-lnlm-lenovo-thinkpad-x1 \
>               ${PN}-ish-ptl \
>               ${PN}-advansys-license ${PN}-advansys \
>               ${PN}-aeonsemi-license ${PN}-as21xxx \
> @@ -1324,9 +1325,11 @@ RDEPENDS:${PN}-amdgpu-misc += "${PN}-amdgpu-license"
>  
>  # For lontium
>  LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
> +LICENSE:${PN}-lt8713sx = "Firmware-Lontium"

Please keep this sorted

>  
>  FILES:${PN}-lontium-license = "${nonarch_base_libdir}/firmware/LICENSE.Lontium"
>  FILES:${PN}-lt9611uxc = "${nonarch_base_libdir}/firmware/lt9611uxc_fw.bin*"
> +FILES:${PN}-lt8713sx = "${nonarch_base_libdir}/firmware/lt8713sx_fw.bin*"

Please keep this sorted

>  
>  # For Arm Mali
>  FILES:${PN}-mali-csffw-license = "${nonarch_base_libdir}/firmware/LICENCE.mali_csffw"
> @@ -2459,7 +2462,7 @@ FILES:${PN}-qcom-glymur-adreno = "${nonarch_base_libdir}/firmware/qcom/glymur/ge
>  FILES:${PN}-qcom-glymur-audio = "${nonarch_base_libdir}/firmware/qcom/glymur/adsp*.*"
>  FILES:${PN}-qcom-glymur-compute = "${nonarch_base_libdir}/firmware/qcom/glymur/cdsp*.*"
>  FILES:${PN}-qcom-kaanapali-adreno = "${nonarch_base_libdir}/firmware/qcom/kaanapali/gen80200_zap.mbn*"
> -FILES:${PN}-qcom-kaanapali-audio = "${nonarch_base_libdir}/firmware/qcom/kaanapali/adsp*.*"
> +FILES:${PN}-qcom-kaanapali-audio = "${nonarch_base_libdir}/firmware/qcom/kaanapali/adsp*.* ${nonarch_base_libdir}/firmware/qcom/kaanapali/Kaanapali-MTP-tplg.bin*"

One per line. Also this brings the licence change.

>  FILES:${PN}-qcom-kaanapali-compute = "${nonarch_base_libdir}/firmware/qcom/kaanapali/cdsp*.*"
>  FILES:${PN}-qcom-kaanapali-soccp = "${nonarch_base_libdir}/firmware/qcom/kaanapali/soccp*.*"
>  FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/a702_zap.mbn*"
> @@ -2783,8 +2786,8 @@ FILES:${PN}-hp-license = "${nonarch_base_libdir}/firmware/LICENSE.HP"
>  
>  LICENSE:${PN}-ish-lnlm-12128606 = "Firmware-HP"
>  FILES:${PN}-ish-lnlm-12128606 = " \
> -    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_12128606.bin* \
> -    ${nonarch_base_libdir}/firmware/HP/ish/ish_lnlm_12128606.bin* \
> +    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_12128606_*.bin* \
> +    ${nonarch_base_libdir}/firmware/HP/ish/ish_lnlm_12128606_*.bin* \
>  "
>  RDEPENDS:${PN}-ish-lnlm-12128606 = "${PN}-hp-license"
>  
> @@ -2794,11 +2797,23 @@ FILES:${PN}-lenovo-license = "${nonarch_base_libdir}/firmware/LICENCE.lenovo"
>  
>  LICENSE:${PN}-ish-lnlm-53c4ffad = "Firmware-lenovo"
>  FILES:${PN}-ish-lnlm-53c4ffad = "\
> -    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_53c4ffad_*.bin* \
>      ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4ffad_*.bin* \
>  "
>  RDEPENDS:${PN}-ish-lnlm-53c4ffad = "${PN}-lenovo-license"
>  
> +LICENSE:${PN}-ish-lnlm-lenovo-thinkpad-x9-14 = "Firmware-lenovo"
> +FILES:${PN}-ish-lnlm-lenovo-thinkpad-x9-14 = "\

This will make ish-lnlm-53c4ffad depend on your new packages. Just push
those files into ${PN}-ish-lnlm-53c4ffad.

> +    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_X9-14_2025_5.8.36.09092.bin* \
> +"
> +RDEPENDS:${PN}-ish-lnlm-lenovo-thinkpad-x9-14 = "${PN}-lenovo-license"
> +
> +LICENSE:${PN}-ish-lnlm-lenovo-thinkpad-x1 = "Firmware-lenovo"
> +FILES:${PN}-ish-lnlm-lenovo-thinkpad-x1 = "\
> +    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_X1_2025_5.8.4.7720.bin* \
> +"
> +RDEPENDS:${PN}-ish-lnlm-lenovo-thinkpad-x1 = "${PN}-lenovo-license"
> +
> +
>  LICENSE:${PN}-ish-ptl = "Firmware-intel"
>  FILES:${PN}-ish-ptl = "${nonarch_base_libdir}/firmware/intel/ish/ish_ptl.bin*"
>  RDEPENDS:${PN}-ish-ptl = "${PN}-intel-license"
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

