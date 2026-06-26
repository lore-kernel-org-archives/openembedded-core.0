Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4285EC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:43:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38124.1782488615635582152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=K3t6h83j;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Z6/0EFSW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QF453U1470032
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1IYkWDts1PRRxDoKpSvSpUp3
	x1EGqMKPsGimxJJAWn4=; b=K3t6h83jhzV16SG2NU81+dQB2t9MaAQObEJ6lU1y
	x3gQxzxBOnUoJAOhJjvW6FyLFQzjsSc4pTrb1TEQhGaAHBhV4bp/35KWfg3w5Rvs
	FerL6rs0Wz4vGdilCyTUBrQhs84D2MhT6yE3jnupaX0BScC7wdFUtZCE5s42cLqF
	obgPuvMCIJJcTI/jmxSFjNjiEXrOlYazr45ev6Bpe6ueiRVJDNybdag5/cl/Yo7r
	dE/t0klMBuJyCNc2x/cOPK2NIMVelnMboz/u/v5f3npNVpvGJ4408FEcnYJFIrRI
	rFW8+hhPXYvdSogDA6VcwnulUsYg9ixzX7PVpj656aKzxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eeqbee2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:43:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9254309dfd4so227824185a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 08:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782488613; x=1783093413; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1IYkWDts1PRRxDoKpSvSpUp3x1EGqMKPsGimxJJAWn4=;
        b=Z6/0EFSWChC6XPtocYdPkVUE6qB3K/a1JtUSkPKPmaMvNCvHoJ8yBht8sFowG0YyI1
         18HBs1OzcdCbpQ4j/DIAasO1EGdDD4JghsVeCyOwitzX7F9nGzuwnPmFgTU4V6GCC6Fp
         ibkBmDaB0QlNqvPXXd9Ch6DNqoFTCSwQjeinxJj1yXtPbNHMH6DzJwMoNI2fDcQu4JHe
         fWH3XfvVWWy56kLNvBFJtWfCHr2InabccG3hfJX1tWq7z42TmNnBUiUIkavTkVZSqT7D
         GxegeYx7ccgCjMiWSqT1QpVX03i5OmFb9sh2lncQK/8hrWpkqGKQvDKDyxQFgq3H4IEg
         mZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488613; x=1783093413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IYkWDts1PRRxDoKpSvSpUp3x1EGqMKPsGimxJJAWn4=;
        b=S/HV3PVPg7K5WHIX/1ToUjeKqQehcHWAt9AMG9LKH/PC3plO+BSFscFroGl9OeOVN8
         QP235gkfLqHh0qBKRjtMCDYl7ty3zsadiavW4FSKlHrGS0SsAtXLn9cipdPkQfJgIwkd
         xBkaooOQuvPA15my4FAtPkGzBZdV2ojbYAOGX7n0+N59Nh+dd/vpX/Jd6TnYpWGLfXNs
         MoVpj3B06mFJmWuGLyRLFmwNau9YOnR2L13iRMpFyInrQX2wQaQWAuV/lGIjJ3nBnXig
         8UM/218pt+dts6XyNHNntgT/BYWjOfmY6EdPRtLd/ldfFe5NehaNCMAMS3Hhs40vj1c4
         azFw==
X-Gm-Message-State: AOJu0YxhmbFom1dTCzmOW0A8wzx8qJMe7gW8RTX/AUI8TpMLTPDq/HIk
	UsaQ6EZLLCOyl9+ORGWe8FFGRDUgeHq/17BHXWMrF00FvUES7tAI5xXs1kjTDC4IfWT3OLvds63
	EVm20fKCKiuDxi0SXo0KJcy3uVES2d5XwLK4OQVxMFZ6NX0H4XRSlXs66Idir6R1s8+YAWd7LoR
	/z0G545VY=
X-Gm-Gg: AfdE7cniZJhG8K/EAKY5m6JLz4h3KugOM388RV4ALAg+V9akP6ZRzH4pa2pbrsb0VPQ
	zSluJyE6qQieTdHqsBMnRGr0WJk96FivXeMkm6VjawgAZsw/O79crFEinGlMvwUFR1YPWHnv9tp
	/7psW3+aoP0KLf+rZ4B21SgM6iyjtJlhR/v3kBwTkyIk8HdzDvG3EqY85wxS1IeOcSq+iYChQkp
	0reOEAY6a3Tmm7OF+qopIMYZvWicl+iHAIdzzCmvVM6y4bWx/dK5A9Ctspjm1Qxugx6IAutDHjo
	IweZMIbvA5jHllV0/oJlWIyP+gE7w+APrJxuEE8EP2xXqo0P0GD1FMWjwGABEnPd1dK+ehpw1AF
	teqU6zAk+uDAPetUyxitXaqUSXTbxOTmvjy79M2AhX16aRKWpPssClPq+gTKJR3X6FKeogZ3FKO
	C9eC8u5CGY3ep3d/0/kYCcJkX1
X-Received: by 2002:a05:620a:31a7:b0:92b:4ce5:6391 with SMTP id af79cd13be357-92b4ce5758emr143154585a.15.1782488613367;
        Fri, 26 Jun 2026 08:43:33 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:92b:4ce5:6391 with SMTP id af79cd13be357-92b4ce5758emr143150585a.15.1782488612732;
        Fri, 26 Jun 2026 08:43:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ae9f2e420csm1723240e87.46.2026.06.26.08.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 08:43:31 -0700 (PDT)
Date: Fri, 26 Jun 2026 18:43:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] linux-firmware: upgrade 20260519 -> 20260622
Message-ID: <b3n7cj5acxqtu6ddhvegwantzaifuqqucp3insbgf7jou7wefn@xty3iofctcb5>
References: <20260624035302.2472686-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624035302.2472686-1-vpuar@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEyOSBTYWx0ZWRfX19bQKLo6xzSc
 h/tJ+pJpsvTNAPWH2H1X41qQIEv2XykvApb8L4KsLcZNbOuYpi3XEDCpaJAFsvIo9xzxgnMudrX
 xQeeqftAwwsGNbeo/YdU8KfHStFK77pyN/R3JcrZY9m+vmpzBuFHWOsBt4fuzYCb5BdJPNqxb2D
 6fIjQB/rvNUMs5Ho8iuEnMXRGH+dhW3kX7bT7Lfz9RSMA2+5X4Z2z4yZRXmiR41sTmkOLBJuzMZ
 CUSoAGB45dxiugCTRoflaYXESTqenn9SFzxFo+Mudgi8RskdAKDLvTMv40YCZMHVEq2KYqQ8Bcm
 y1rKgiX1C8DEB1WN8TCTXZB5yg7J+Srue7fY3bg8ocqLmBkD5A69KFVW0Gea9OGO0qGj7hHWkNd
 L2WHBP7nbMZQWRATVqXCIM4JdXLP8uk8UWHdB2tPb57IpBHrZULJ0x6rbvquUPev5sJ4KewtJKH
 UeTRSpK5HKsFbYwkxkg==
X-Proofpoint-ORIG-GUID: 4KOBXxyPEfLAr2_zw62CoYgh-UHVv1O_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEyOSBTYWx0ZWRfX5pYUyIRNrn0U
 0zrTEWYBJEMeXVM11nq9TCLudq1F+Ctym/xn4wYW0nUmQoOE1g1jq5a2EEM9g4v0O/OYNOuKyKU
 MAMbh4GkBexjMDe+6pKuBoTNmdOv1bE=
X-Proofpoint-GUID: 4KOBXxyPEfLAr2_zw62CoYgh-UHVv1O_
X-Authority-Analysis: v=2.4 cv=MLpQXsZl c=1 sm=1 tr=0 ts=6a3e9e26 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=y1JxGrKy7lSW6rs6uzwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239651

On Wed, Jun 24, 2026 at 09:23:02AM +0530, Vivek Puar wrote:
> Upgrade the firmware package to latest release. Add RCA firmware for
> tas257x, add firmware for NXP IW61x SDIO WiFi device, bluetooth firmware
> for NFA725B (QCA2066), add BCS calibration firmware for QCC2072. Add gpu,
> audio and modem packages for QCOM shikra board.
> 
> Firmware licenses and few that are not at the top level (qca/NOTICE.txt,
> qcom/NOTICE.txt, wfx/LICENCE.wf200) are moved to a LICENSES directory as
> per the REUSE specification. Update LIC_FILES_CHKSUM, NO_GENERIC_LICENSE
> and do_install accordingly. Remove REMOVE_UNLICENSED entries for firmware
> files that were deleted upstream.
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20260519.bb => linux-firmware_20260622.bb} | 574 +++++++++---------
>  1 file changed, 286 insertions(+), 288 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260519.bb => linux-firmware_20260622.bb} (87%)
> 
> @@ -750,7 +716,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
>               ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
>               ${PN}-qcom-sdx35-foxconn-firehose ${PN}-qcom-sdx61-foxconn-firehose \
> -             ${PN}-qcom-shikra-compute ${PN}-qcom-shikra-qupv3fw \
> +             ${PN}-qcom-shikra-adreno ${PN}-qcom-shikra-compute ${PN}-qcom-shikra-audio \

Keep the line sorted.

> +             ${PN}-qcom-shikra-modem ${PN}-qcom-shikra-qupv3fw \
>               ${PN}-qcom-sm8150-adreno \
>               ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
>               ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
> @@ -2430,7 +2419,10 @@ LICENSE:${PN}-qcom-sdm845-modem = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sdx35-foxconn-firehose = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sdx61-foxconn-firehose = "Firmware-qcom"
> +LICENSE:${PN}-qcom-shikra-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-shikra-compute = "Firmware-qcom-2"
> +LICENSE:${PN}-qcom-shikra-audio = "Firmware-qcom-2"

audio should be between adreno and compute.

> +LICENSE:${PN}-qcom-shikra-modem = "Firmware-qcom-2"
>  LICENSE:${PN}-qcom-shikra-qupv3fw = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sm8150-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
> @@ -2594,7 +2586,10 @@ FILES:${PN}-qcom-sdm845-modem = "${firmwaredir}/qcom/sdm845/mba.mbn* ${firmwared
>  FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${firmwaredir}/qcom/sdm845/Thundercomm/db845c/slpi*.*"
>  FILES:${PN}-qcom-sdx35-foxconn-firehose = "${firmwaredir}/qcom/sdx35/foxconn/xbl_s_devprg_ns.melf*"
>  FILES:${PN}-qcom-sdx61-foxconn-firehose = "${firmwaredir}/qcom/sdx61/foxconn/prog_firehose_lite.elf*"
> +FILES:${PN}-qcom-shikra-adreno = "${nonarch_base_libdir}/firmware/qcom/shikra/a704_zap.mbn*"
>  FILES:${PN}-qcom-shikra-compute = "${firmwaredir}/qcom/shikra/cdsp*.*"
> +FILES:${PN}-qcom-shikra-audio = "${nonarch_base_libdir}/firmware/qcom/shikra/lpaicp*.*"

The same.

> +FILES:${PN}-qcom-shikra-modem = "${nonarch_base_libdir}/firmware/qcom/shikra/cqs/qdsp6sw.mbn*"
>  FILES:${PN}-qcom-shikra-qupv3fw = "${firmwaredir}/qcom/shikra/qupv3fw.elf*"
>  FILES:${PN}-qcom-sm8150-adreno = "${firmwaredir}/qcom/sm8150/a640*.*"
>  FILES:${PN}-qcom-sm8250-adreno = "${firmwaredir}/qcom/sm8250/a650*.*"
> @@ -2756,7 +2751,10 @@ RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sdx35-foxconn-firehose = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sdx61-foxconn-firehose = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-shikra-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-shikra-compute = "${PN}-qcom-2-license"
> +RDEPENDS:${PN}-qcom-shikra-audio = "${PN}-qcom-2-license"

The same.

> +RDEPENDS:${PN}-qcom-shikra-modem = "${PN}-qcom-2-license"
>  RDEPENDS:${PN}-qcom-shikra-qupv3fw = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sm8150-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

