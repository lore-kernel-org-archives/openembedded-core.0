Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F85C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 14:52:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.10445.1752591135250840333
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 07:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SRIZ4S9T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8k5ug026465
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 14:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9hTgMEmsmefi3edxSQW9X64/
	I0wFpvxGaUZIm0Vniaw=; b=SRIZ4S9T2jF3TjuROG+Wpc9bBwAxSkUrl4jJSYcK
	JD+irtreFgGlMaFuDZ+quCUdYsvGbcmqJjqxFrFEtOQYLik5QYLy08ZNVrl7lWj2
	2RAsqFQMqPgKRFP9ajz5bjoro8PK2ok74Xg4RaWkjPyL29BLHJ7ta6Ube24lKDjA
	YOL5zkV7DQvTG99pIdaOwTpkBKe3oqt0TS5gagUyMjtlGP5oX2xUv7lx5l28fte2
	kUP33oGBFhNKmZ6kGDvKrfoPBPFBFt34mVKhrdz8Eil7KaZD2dGs0ueIlf2TIO+I
	zdMweIKL5o/ces6xN7DPazoPc0jDEN6fwKSAxoAhUJr+wA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkruh92x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 14:52:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so1584138685a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 07:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752591132; x=1753195932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hTgMEmsmefi3edxSQW9X64/I0wFpvxGaUZIm0Vniaw=;
        b=smsMNBhceTf4Z7EpBr5QCPGCdwxnTYt3fOsyY0HxeCGy/qpyQk8jdaFhMXxIEn8LWh
         /M9vsj1OBGr1BoI7DHaHsSc5xeUUinO2dO/LKWl9I5aXtF7lWMhCKImc2RaiPfzJzS0a
         hiC5rLNAyl2kRX4twAjMQhEpTD7Fx9ZoTadWKxXdSlATc3p8ZfCvHzJteHMV80CnAuoA
         OUKdQxS4JWBXOnK7bUErpqAoJxMmHyC0Yb4MsgoyPU6AAhZJnTkBCkEHdDao4CQgQGdn
         qWaekn2kBstvKlFJI5YT/SBB9wNCO5pWGt3xHPlwvOTqIP3FiQFnnD884nsIRYgAnkZH
         4xeg==
X-Gm-Message-State: AOJu0YysbcLFTJdJUBYb5MDknAR3gsqkQhpcmRVa0083Nrx2dmMM8TU9
	zMMslVkyaV/AcScBKNRyh0fCUFKQ87/RNAQTR4G+79nP4dyY8+aqrIaPmLWEKrgEWq9FG/jn4Is
	Wjvl8F/1I94VJOIxvIqpJxccGJuemf54/+gfrApPKjV6mCH9T5p4VKeYWWCU+4Buk6xpVF6Hd4j
	giHbU6PoBcc0AX8Rs=
X-Gm-Gg: ASbGncvMiuUxyX6DqkVyLy8R5frqP5o3Up0a3lrBhaqy459qtSO6RGHHBFKTxKSGENX
	IxQZ1Anoki3+2qX+SZO9hkxxbVoaFsYvtmmUaT5o+cvtUtxyxWsOCTAyDCuS6WkuJ3ec4Fc3uGY
	8s+Pf44LIE0FZsSUBjPU+g2Av3b4fDOfCnNV69bhmeEeN0EdH4658jWbKUR52xpyCWVaAKDPpVb
	6A08hVnQ+y8eUYvSZ+KNPXH0Jihb3tYGDXf564ZQshebR9GYDbK2FO+KjN8E7W8rh7L1eC4kOfU
	i8dUw8vw9TsNUTCafExHdHRekMiXmpUAGRLuF88983mjScvs5AW4zVOHNzmRtuE/PNeld6Zogi4
	eeLD2n34KyTRYGqJwJBiYdqz0NRBLkSecuwK4btrvBum08HzQ3WxR
X-Received: by 2002:a05:620a:172a:b0:7e3:3996:f4a0 with SMTP id af79cd13be357-7e339970e06mr441343885a.43.1752591132408;
        Tue, 15 Jul 2025 07:52:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjuhPZhNR698dNcEbGEozkVg61wohy+FOGpBLvrS2UZ+0UYSrD0OOWmKIAp6SwJovRHSNuvA==
X-Received: by 2002:a05:620a:172a:b0:7e3:3996:f4a0 with SMTP id af79cd13be357-7e339970e06mr441338085a.43.1752591131858;
        Tue, 15 Jul 2025 07:52:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b60832sm2293201e87.157.2025.07.15.07.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 07:52:11 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:52:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libclc: split out of clang
Message-ID: <nj7fgmdc26aeloydskcehk7fkkucxmr3bpnzfrmvhji7fpyeh5@bdhms5msviu4>
References: <20250715143139.1829393-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715143139.1829393-1-ross.burton@arm.com>
X-Proofpoint-GUID: r19PeEWurkrjhr8mOdP1MXgVo036XAmV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzNiBTYWx0ZWRfXw4m5vZv2dAKb
 67XLVbkd3g8asnYhitKnhzK6LXgRxvZV4Anp27ZHS5qc/yBrn3F56Awrwq3bLhkqIn/Ts9Sd4j1
 ERda0+Fv3FAGe/5fd7GmfgD/JD3Apw2/XS3kVtrdpZzkp975rKRnTByyW8QR87m/AJvJh097IKI
 R5YgHrDzyurviNkMVYD2a2+o21H9RaONjW/jLyuh346SY4bm+M6eLuByWyOk6RAO7xhNOx5qjh/
 mAtzrAoFtuOm0MjwZUWnfWLiY90hS2DuHhnTLtDTMaReEV6GwBCRRAIrl4TvQOlV4WKEpbzjgVT
 0E05YyfIC85BxigS/BbQFVzpxQuXFomLitxADgtAbAe9vP0xoyly1u3wANiCYLRG+IQWX7yymS/
 A+i+7s9DKOwK4IeQbXjBMF4M5y/G+11YlN51MoE+/T+aErW4zFASZIBuq1/G39wrT0V1+Nlj
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=68766b1e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=7CQSdrXTAAAA:8 a=dFFR_DBTR12WhClkPLgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: r19PeEWurkrjhr8mOdP1MXgVo036XAmV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=852 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 14:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220303

On Tue, Jul 15, 2025 at 03:31:38PM +0100, Ross Burton wrote:
> Split the libclc subproject out of the clang recipe and into a dedicated
> libclc recipe.

I miss the 'why' part of the commit message. Otherwise LGTM.

> 
> Verified that nothing is dropped by adding clang and libclc to an image
> and verifying that the file list is the same before and after this
> change.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/distro/include/maintainers.inc  |  1 +
>  meta/recipes-devtools/clang/clang_git.bb  | 17 +++----
>  meta/recipes-devtools/clang/libclc_git.bb | 54 +++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 11 deletions(-)
>  create mode 100644 meta/recipes-devtools/clang/libclc_git.bb
-- 
With best wishes
Dmitry

