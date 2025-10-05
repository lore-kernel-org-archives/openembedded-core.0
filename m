Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE04CCA472
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 22:26:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.20671.1759703205168667520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 15:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pI6ZiQ6S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595M01VL001514
	for <openembedded-core@lists.openembedded.org>; Sun, 5 Oct 2025 22:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0J3WCWw81PCfuUleS51amTSl
	sOq6hCEESM4gsnk537o=; b=pI6ZiQ6SivXW7U7Hwrl01ekVORCyJSUE9LJjmNJl
	VjjMQGnubirtF1t+tAMr+FPNbY750HFCBJfvaNzO5ERl25mcm70pBDF73vPRD09p
	ulH7NlnZfT5bcm48tW4z7s2ZJcmODKLcXQGAr+MD5zzfjVYkB/4288wNoh79x+E1
	EmVq2qSsTzF6NkwFLORQQSZftwwNVn/pqR4HirRNGlVBQTInl5FvpicCy8Ien9mW
	hXLFzm1sw68kUKdMbS/G6LaCX6GvzzPosAo6zFY3XNJmLopfzuR8T22PdIrVV08x
	dK+0RwxLrC2PTNjbl1ZegNyF0pjDAaBSTGahLFF9llxi6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6tnf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:26:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e56cd1d360so103388811cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 15:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759703203; x=1760308003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0J3WCWw81PCfuUleS51amTSlsOq6hCEESM4gsnk537o=;
        b=NQVZRW+kI6WbxtUOJIGjzbH8/SefjzZCb16biLPrMU5Cg9WoclQ/WnLvC1JjFKFERx
         mVn07w9X83C3C2/0koX0GcZYh+FjBLtnLvf2RbZQas2pvSRevGM3WCY5NLe0UB1nDSF4
         cI6uBRzYTsTU2FiutX8qtpCXTzCoft3BNwp/YRXZcX5xqtn+VDWGraaNOOf+V3+zdoIE
         LTEMAm9HFHJK8KTqMHweDq7gNbkXgWRYS+ghow+gjnD0xptf0JVhlJB9RlMnrCYiXFFi
         45aJfk2Od6eL2Hr0BHM+skJ1/mI0ziHPXwpJLMcZ4rb/7n/+6TvNHIVkmqz6y55J9R89
         XYWA==
X-Gm-Message-State: AOJu0YxI8P6ydWgp6ywW+g3RhHMuCkpSQrIfBJ+d5w0fyJl7EFikONL2
	VfOeQflNkw940NHmb8u0iZyyrIUNjs9Lj9uso/IHlyBq66mLYu0sIMQTCfQ60t1YaJmANh4F5J/
	Td98cAP8L9Nyy+/ZFvNI5HrxXi2p0cZU/R8uhQYR6to6Rfo+cFmwVpu78B2xB/qYK039yncw//B
	QC09MdBkk=
X-Gm-Gg: ASbGncubUtuu7djrAbq4G55frK4do7vx1c1+d+MOHqSkk9mPVtsNr/tnqHgpuNzntlp
	i5LTn9AcJD88b4ZwubEiJTFx4j8FiZq1wuGyytkWITO/LDrUcChUb/f1KOMYjD2wL+jR2ZtsjU5
	ojXvwaabaJibisUJyYixa/3rm2n41QSwNQPaAtj+KR9q/B8ygdCXE4ddpASz0H4gcLXeHlhw6wu
	/iiK1sbf+/KHeaEiFE9QU/fnTHEpwZ0f3L7EqMrneiDe7O+Avgs1LJ+HMmQPhToOgKMmk/+Smuj
	Q2Q6T/fVooxeNYRmjq6RBJWoHtBa76bL3Bhckz2Gq01d4WNmQU7A79OOqZ4k/OpUH2KDvNNM/MD
	dQa8SNmFaLU/OD4m4/teMlvuSNVArNHqgPBclJrsesxAuIzyEWgVTh4i38w==
X-Received: by 2002:a05:622a:1104:b0:4da:3999:2ba2 with SMTP id d75a77b69052e-4e57697542fmr121398461cf.0.1759703203249;
        Sun, 05 Oct 2025 15:26:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQIHqwyXii8y9Ckl1mWLhq0Sp68ZAXyYNG/dujP5yQn+Ht32z2hFzpBhXPNaLKzpiWBeQeTg==
X-Received: by 2002:a05:622a:1104:b0:4da:3999:2ba2 with SMTP id d75a77b69052e-4e57697542fmr121398281cf.0.1759703202750;
        Sun, 05 Oct 2025 15:26:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d358sm4343957e87.81.2025.10.05.15.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:26:32 -0700 (PDT)
Date: Mon, 6 Oct 2025 01:26:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kavinaya S <kavinaya@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 0/1] Add support for custom compatible string via
 optional parameter
Message-ID: <fy44eqwuk3qcppbczolkueen73osknauoovxbrnwxg2zoplzpj@zsbzvn2qajuq>
References: <20250930065117.2625998-1-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930065117.2625998-1-kavinaya@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfXxBvJH3hYflcF
 dz+1V3xwjoOlO89OV+ETthHmZT2sbA+wC1FYXBapyJuPU1S85vPxvZULqs8RACkji7jxLCGTaI7
 cWLK42MVRJxU8E5IPun5wUmKS2dLZ2s+0i6uzECwnhI5612fGiJK8iNodFEYxKgZ1Qp6dGPqJKM
 OEUV7bGzh7MWgkXU0rxiS5Aj+uqb5xXJqCpNQIknLEahF8ws7DuzJL8g3dOYAUC52gu4CxE/Aoj
 mUTW9IOAi84dIB1F347R7JBloOMBt+H7P4HHVEbLu6WMFZxP7fJmvGaNvF5wURmk8q7gwxxJjPV
 Ky8AQI2xd5Nxwvrul3ITH0IZ5VdH0cXp5t2HzSxWoLKrwMDDpl//qzyc2KD7GWjuqZHLjlSTKry
 97Cjm45tnCbpKUris3BfnrFExHFqBA==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e2f0a4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=a7hY3g2sdVyaQG7MBj0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ZznxBXEs6Pifr47y3N_1wlxpKGlBZ5Ya
X-Proofpoint-ORIG-GUID: ZznxBXEs6Pifr47y3N_1wlxpKGlBZ5Ya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224452

On Tue, Sep 30, 2025 at 12:21:16PM +0530, Kavinaya S wrote:
> This update adds flexibility to FIT image generation by introducing
> an optional mechanism to override the DTB compatible string.
> Instead of always extracting the value from the DTB, the generator
> can now use a custom string defined in build metadata. This is
> particularly useful when the FIT configuration requires a different
> compatible value than what is embedded in the DTB.

This misses the _why_ part. What is the problem that you are trying to
solve.

> 
> Key changes:
> Adds a custom_compatible parameter to fitimage_emit_section_dtb().
> Preserves existing behavior when no override is specified.
> 
> Usage:
> To override the default behavior, define in machine configuration
> or local.conf:
> FIT_DTB_COMPATIBLE_OVERRIDE_<dtb-filename.dtb> = "custom-compatible-string"
> 
> This method avoids using custom ITS files, keeps the build process
> consistent, and makes it easy to understand and track changes.

Note: there is no need to send cover letters for a single patch. You can
add all necessary information to your patch.

> 
> Kavinaya S (1):
>   fitimage: Add support for custom compatible string via optional
>     parameter
> 
>  meta/classes-recipe/kernel-fit-image.bbclass |  3 ++-
>  meta/conf/image-fitimage.conf                |  6 ++++++
>  meta/lib/oe/fitimage.py                      | 12 +++++++++---
>  meta/lib/oeqa/selftest/cases/fitimage.py     |  8 ++++++++
>  4 files changed, 25 insertions(+), 4 deletions(-)
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

