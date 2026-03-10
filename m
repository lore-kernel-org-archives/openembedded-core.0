Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E717FD4F04
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 16:07:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43888.1773158840291035964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 09:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NjzYSw9o;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=hqERanlJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaUP0303863
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 16:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KTkWvb6qo2zvBM8PzHfZ2ep+
	F/GfGC8WqeNOuEhnKQo=; b=NjzYSw9oXQWGU/JY9XWEtUxGXgqbn0lEacVt3S/x
	B17VwkEXsM74nmAlnviSokrgsrW5jalbHeactcCG5+GSG+Wg0fsZjaOhU2XPTk9h
	GoWjfUTgalLfyWN+cmJVcE6hWpvn0DChc2pDePYvE9HGhsYEELC3UcnatfPxFgSb
	yj91xtzHDilGUi5i5Z8qKIda/erhxVB3Y/mGKV8VsRfY7luPLrEP8Yu7dVaN8O4/
	nw56MIyr9l7JYbgUyh7pkMUEJZJSnFPZERPi/uWnPTU7TULsod4Ba8aCNjySgRGV
	m1I55bbBUDZDcLEjCGVHWR69oiXfCzs2o3fLeOqwJltYPQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf1am6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 16:07:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917afa521so2831171cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773158839; x=1773763639; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KTkWvb6qo2zvBM8PzHfZ2ep+F/GfGC8WqeNOuEhnKQo=;
        b=hqERanlJV83chMVpixu0M5AM96lZMDBC1q154MmJrY0pTx4/0T+rtzb5gTQZb/tg5i
         mGDArHrTW7XtwBYcA46kYBn6YQwGz1EaTBCrquPIJEz6BJspGAVjPwdoliKu5OmXqXwX
         gNAFbT1d647AucMUPMbFTtiHaDDb8q1xEY4LYeujHudFqrhy61rh28XNkE2pc4rmtW+G
         7L5cLaJckClnJisXmT5oJPYDtbzajJeIdrNDKgmPV7DykENb0PTGL3aZMspTSUSjT/Si
         3FM9xMME8GV3A3xfYq9pjPUzk+47P/oQ238/sDTyTtQRRYSJcTT1q95eNRtUbwbFhnng
         RRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773158839; x=1773763639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTkWvb6qo2zvBM8PzHfZ2ep+F/GfGC8WqeNOuEhnKQo=;
        b=L+Y3zef1P8OA4yzzzuOCYf0VU+aGIbKsDJ+1SvVxJpBR5A4/4z42O7uu8IjQZ/5wsG
         IbN/1zza8Xt3CD8PbG/gl7cD8P4TlMCEc/eaf66Pg8ZRbac36x4CClzWOtPyNzrYJ0ar
         1+dJ/TSzoLA/uRS4rLEFO3pGst+3Jhz4BokhJ9E1WBflbCJ6fUMLSryyWU62Vrjjb4yX
         04WnnOVd4E6x7a1Oq+gaOqFn97VRQiJQoUr6JtuSSefqatPOgZoC8479LW8lHEWt+qjI
         Rj0/9SHABnXIzBf/iLpuaZqOnqjJdFgDsXfax+06rzIVu7YW3g4NN2scYn1ne9lsLZja
         8K1g==
X-Gm-Message-State: AOJu0Yx4ExcF8jc6AJr5+PGINw4xMYVUnSiL9hkjR90E3UPlHQjECggf
	FTWNrJWTEHlqbcZVDrQdcKzSdw9DebdS/i3zuC3yx76o0kKZCIlPHZpPHHBSUivUCO+s/PKq0yi
	rWV9WkA0bXAK052dlVkSeuhU09+eGDsAbld/Crf8vxHNmEoiQUvPCzGtwX5aY8QjqVqQ7qDv/qb
	U0gNBGpqY=
X-Gm-Gg: ATEYQzx9M1VEzlJsDDguYZeVjEqP6uL0DFjTqw9Bs6tBhXp7wJFBdDz3zNe3w1uheTG
	NanDsuLLBwmnn89xk+dImdIwf5+otWkNhueXlZLJq08aHpxzamVum4bKA7+0LPmQKU41WadTMFb
	auWPr1BIKoefYVCDO8/y4rCqMX+3k8t24wHVfC+SYs99lYCln1VOyklmfCcKGLvMgpMwsO+1d+Z
	//zoelb2ZZSESU3A23XVqermwtgI2rdhcDoTpYCFYC53HNvtTZR+c0oPTvKMmS5enRPIIBKGi9D
	XM8HymZ3Cif88TiTDBECm88dp/x5U3sXcXjntJgWSHquX6+bGwSMZyNti7/+cWqXeAHLXdqmQpI
	jXHg5ZY43IgJ+K3lpMj+nw4jitctV8Ya4kkkQeHXJyrCUNB4SoKyZTG8Onedd92AOg84ced4tC7
	Pp7ZO8PxF4iaHI2h2gkvR9DRF1YN6Wdzt6Rj0=
X-Received: by 2002:a05:622a:8c:b0:4f7:a06d:c4df with SMTP id d75a77b69052e-50926126c6cmr45054031cf.33.1773158838576;
        Tue, 10 Mar 2026 09:07:18 -0700 (PDT)
X-Received: by 2002:a05:622a:8c:b0:4f7:a06d:c4df with SMTP id d75a77b69052e-50926126c6cmr45052211cf.33.1773158836469;
        Tue, 10 Mar 2026 09:07:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01ccd4sm2889561e87.8.2026.03.10.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 09:07:15 -0700 (PDT)
Date: Tue, 10 Mar 2026 18:07:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] linux-firmware: upgrade 20260221 -> 20260309
Message-ID: <unpnfuddmccndnkgu7ppmfgx6xvkmketrw3aa4xxxbeyp3hinr@xuj3lhre5dmk>
References: <20260310154646.3780697-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310154646.3780697-1-vpuar@qti.qualcomm.com>
X-Proofpoint-GUID: 2Jgs2dMqB55TV1GovxNBfWaFZXR80N90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE0MCBTYWx0ZWRfX42jV2xpNA2VT
 0kkz03mIDxTTtE6cHme0h6L9Z1M785OMp68s/k0/sqNd9n6z1j1t03AvTwSAXw3tfWYQJsNxXoZ
 ngqv8jdMhsG3B27c3jMe6UTy5cuCyDbNZEAXmSeceyZXVJSh4UmkB43jGlLA+1F9tOeYXX3fAxy
 3AANcDnNrDgHxFkRiPv75TcJes26VLBXIqF7mq1kdaH4T/ouGvjBhfBOJXLakJwlBCmRtsaurp0
 AbUjsk8MByzFZNWk4cYtub27qTf+4aIoBVcf3kquQoBkApqAxPC94iJfNyN6j6O4J2LCBRYyaK3
 ga6CC5dCNgp4JRc1hSIXG+RaStSXILYpHz6qc+ePtYVdqQXQShmaC4RNHiH8zHYnTDzW4rooGOx
 ZlGZNTxD7HzvRTuxasGDXPnkrGOzoiLyJ+IctXjGo8HuwfyYgHEJHQ+YKZFJbkZoSeQQOEN8q4V
 snxj8hLUZVvDEr1AKKw==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b041b7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=xax980A8BmGidevOf80A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 2Jgs2dMqB55TV1GovxNBfWaFZXR80N90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 16:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232799

On Tue, Mar 10, 2026 at 09:16:46PM +0530, Vivek Puar wrote:
> Upgrade the firmware package to latest release. Add package
> ${PN}-lt8713sx for Lontium LT8713SX DP hub, add audioreach
> firmware and license for Kaanapali, Lenovo ISH LNLM firmware
> was renamed so add those files  in ${PN}-ish-lnlm-53c4ffad
> package, and modify FILES:${PN} for package ${PN}-ish-lnlm-12128606
> to pack firmwares properly.
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20260221.bb => linux-firmware_20260309.bb} | 24 ++++++++++++-------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260221.bb => linux-firmware_20260309.bb} (99%)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

