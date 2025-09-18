Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C772BCAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 19:23:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.24039.1758223379551949220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 12:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=c0WJoP1E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBjPa3010746
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 19:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NYA2r1Uq/WtNoErgrcSXzB5q
	hz+iDC5XKCljwlNk27w=; b=c0WJoP1E5mum9AKN52Eqsb9ICTPsd198EjJEIq/H
	cnhmcgpsYu68cI1JFU2TnZBs2xVojI0kObvfTBFsHkz4DijnoMkeWfC+vQkGrHJ1
	orXokIaiRUsNSV9Fz3s2r8KcuEWyRhTmKpJljqYkv0Bdv8l5oigIVaul5mC5rxFr
	JAP/PxoOJRSaexPzqz7JY5U0zgY37gMD+Ru3hawmfzUBS68N4zCGvTfDf4CSx8AQ
	+z4dAhqVTJUiWZqUcUwlBThcnQagVHh19TjrgvEvcF/ZXDbS2Mk2mMxsFwhd6UgH
	PzuqWqX6WPVWPtLbMzOXPf4jUghOrHXQoxfaVG8Z8BLUpw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxyqxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 19:22:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7966a34e19dso8880566d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 12:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758223377; x=1758828177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYA2r1Uq/WtNoErgrcSXzB5qhz+iDC5XKCljwlNk27w=;
        b=rqnlFsHa7dIjsMsweIbqgJOtQIGmTrKvU1uAo0QAgWFztFlVW5Mx/xzy6Fwaqn0BtW
         2D6tqljNpXS1magKvHHRoVoRIYHwoYK8SoEVZCwy+vdfZGtT8cWqm4b12wKqJ4DDOca1
         /jhb1QzrmscHpBH38OeQSM277dQDkt9grmWeJOBoygPgWlumpCbsr6E20e6rr8IjVF08
         M+5wpUpvyhW2LyGVj+chsvRIM+g3r7uLbKit+xDErBeEpWSTsf5NKY1dSlrPkV07QKJQ
         KgAi3y4/ic7zdt/GT5H83Jlrvu8vx5tdFtIbIHXw+jbObc7jxY/gckba3NfUGidDgWrw
         38+Q==
X-Gm-Message-State: AOJu0YzkPapkUk/U6R0NtPVDV/O+c05wFvf7W1wX1WwQkEL5zYHL8TJH
	FM5zBeUeIa0f0BnCAzcvav+80AoQMpXDHrESTJI2aw79MhCWXi1lOuaXUM/FLFGLiiAoIeGVdkE
	RnYrbNAMl2lf/nGPeYSOiuVtAU1uCSnpZHOenpo5DgDwgrp896JNbHRn6CRSh2/m+jLca6mmBBA
	o11o3QyjsuDZQukmg=
X-Gm-Gg: ASbGncsyFIdNpfeOSVpc6FTshEpJ74p81YNh+b7BoXNdHuxA3nKlEgkb3fbfpFWRTak
	thBsUQXALbaajDk08bEMrQT82WaD+FfKverMq+Z0C/L50fRV8lpFXurKuMA25uDOMuSw6mUmn+v
	vGQPsYDwes8H2ywqtD2wP1W3JFpGZMbXe2xrzlxaEV1c20f5UaVsdbsyrLDMhGvEHS/Bj5ERA2J
	2ImZbHGyG230H4ZgkWzUvqNpfr1fma4p3a+/XG4i18EKhK6+PXA2oNQBDL2GzSiW7MEiD01v6oa
	SCCvzLsqKCqVbnxmJFqGUoi32yJg+zL4kIt3q1YO4t9V+YH7fodNMttW/y0kp19jiSJPYLsw+yR
	wuRn5P+spfoZc8XH6lfCFfqGdPx6Ftj6KXvemnAWx7L3pwAENoBFj
X-Received: by 2002:a05:6214:c22:b0:777:af69:4fb8 with SMTP id 6a1803df08f44-792621d915cmr55211446d6.4.1758223377059;
        Thu, 18 Sep 2025 12:22:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFalCf/YefGs88Mz7emDNhcYmLq4jv9nRhbLJ3ea5aqdXyCIXxeYo7RQBQTUVwCcjPhOo7dMA==
X-Received: by 2002:a05:6214:c22:b0:777:af69:4fb8 with SMTP id 6a1803df08f44-792621d915cmr55211126d6.4.1758223376366;
        Thu, 18 Sep 2025 12:22:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-579c258c751sm235879e87.41.2025.09.18.12.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 12:22:54 -0700 (PDT)
Date: Thu, 18 Sep 2025 22:22:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: upgrade 20250808 -> 20250917
Message-ID: <jh32d44prsovi74bsjejr5vznxtf24jvisnbemnjthhe777lyd@gtzqezswvsvg>
References: <20250918063521.1301502-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918063521.1301502-1-vpuar@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXy3fM3QlSKfKn
 x14ObPZqAuazkL2ww/EfN5QsGisv1XILKrLLfSWbRtyfC9gUzrCz394HJzojEElBNjInL23dhi2
 vuwADwv8g0+0Nd0woiY6T/cEpyv6OlDgZ0VbMiLwy15+spfekago3ZuH0UPeq2p8syDmuF1liwZ
 5bBrat9AjvhdWhWtfL6rhPqHOp15BwTwtX2cmmnVhlrh8OR2YzP87YdJeXIkq8hgWTxFkLYbOac
 UC3uzACcjT9t589ivzE7IHSDxUCHaPKsJg5zBQ1tUcjwVXyLDuLgqlDOOGPrCZw7pNh/YbWJWpw
 mkqDRzqF+5C4fmq4y2lB4LHwJapZwy5OG4RPKfqWFkDWcJLYme+Z+EH9TvjKtoh10R0Qt5T+MzL
 pNd8xni0
X-Proofpoint-ORIG-GUID: kNa536hxJQdEtCdgfXI8oyrJbM3VlGC0
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cc5c13 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=FbBFmdHKsMKu-4dDvBMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: kNa536hxJQdEtCdgfXI8oyrJbM3VlGC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 19:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223658

On Thu, Sep 18, 2025 at 12:05:21PM +0530, Vivek Puar wrote:
> Add packages ${PN}-qcom-qcs615-{audio, compute} to include DSP firmware
> for qcs615 platform, ${PN}-qcom-x1e80100-compute to include CDSP firmware
> for x1e80100 platform.
> 
> Extend Qualcomm QCS8300 RIDE and SA8775P platform to include audio topology.
> 
> License-Update: additional files
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20250808.bb => linux-firmware_20250917.bb} | 21 +++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250808.bb => linux-firmware_20250917.bb} (99%)
> 
> @@ -2043,8 +2046,10 @@ FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa
>  FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
>  FILES:${PN}-qcom-qcm6490-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/qupv3fw.elf*"
>  FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
> +FILES:${PN}-qcom-qcs615-audio = "${nonarch_base_libdir}/firmware/qcom/qcs615/adsp*.*"
> +FILES:${PN}-qcom-qcs615-compute = "${nonarch_base_libdir}/firmware/qcom/qcs615/cdsp*.*"
>  FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
> -FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.*"
> +FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin*"

This means that the licence for the package also needs to be updated to
include Linaro licence.

>  FILES:${PN}-qcom-qcs8300-compute = "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
>  FILES:${PN}-qcom-qcs8300-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/qcs8300/gpdsp*.*"
>  FILES:${PN}-qcom-qcs8300-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qcs8300/qupv3fw.elf*"
> @@ -2054,7 +2059,7 @@ FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210
>  FILES:${PN}-qcom-qrb4210-modem = "${nonarch_base_libdir}/firmware/qcom/qrb4210/modem*.*"
>  FILES:${PN}-qcom-qrb4210-wifi = "${nonarch_base_libdir}/firmware/qcom/qrb4210/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qrb4210/*"
>  FILES:${PN}-qcom-sa8775p-adreno = "${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"
> -FILES:${PN}-qcom-sa8775p-audio = "${nonarch_base_libdir}/firmware/qcom/sa8775p/adsp*.*"
> +FILES:${PN}-qcom-sa8775p-audio = "${nonarch_base_libdir}/firmware/qcom/sa8775p/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs9100/LEMANS-EVK-tplg.bin*"

This means that the licence for the package also needs to be updated to
include Linaro licence.

>  FILES:${PN}-qcom-sa8775p-compute = "${nonarch_base_libdir}/firmware/qcom/sa8775p/cdsp*.*"
>  FILES:${PN}-qcom-sa8775p-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/sa8775p/gpdsp*.*"
>  FILES:${PN}-qcom-sa8775p-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/sa8775p/qupv3fw.elf*"

Several notes. You missed the following file, please package it
correctly (${PN}-qcom-sm8350-adreno):

./usr/lib/firmware/qcom/sm8350/a660_zap.mbn


-- 
With best wishes
Dmitry

