Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E56AC369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 03:57:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.3663.1745639836572371240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 20:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=D3hpUXLp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q3YsOq002331
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 03:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KN3qpDnQVJ16OdvY7K214Ccd
	TGS71TUREOHxGhfvsXg=; b=D3hpUXLpsm2l1OhV85Wd8CV08G8lBswd5K/1K6DH
	TvFmYV1AURABsRlOxjfByhuoUc/VVUb4yJA/tWrs4+suKDhnhIEpkHOl/UdDT8N+
	JIT7hb1BUex+XbOR5DCJbDU/hCrWK3XC8RIi34Bpd6GVANC8xTBOhr9R3iX8ObP5
	RhV2RlBHKkUuBZQPXrMTZm8bheZyYNeU3SZ2jcLyVxzOT53re1Z19rNhkXH/h05+
	qjkUyKo3MCxVIQarsqwGpDq0OdyNSgcbmY6pOWcz8P19hw228P6vyr+gkUTiIGDp
	iQlto9shN1RzAEGp4MmnkyxFF0b5qE/TSnWU4aqk1Nlemw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5815e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 03:57:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53e316734so477638585a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 20:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745639834; x=1746244634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KN3qpDnQVJ16OdvY7K214CcdTGS71TUREOHxGhfvsXg=;
        b=lcmqY7r/RtISRCHmolBov/5/mgJGcARLKQGACDm36aAd/4qzSvAmiaRtOjLuWASJ0d
         1LLGMtoErMysMX+FcnK5mAMLl5LiE9oTMhCp+bgmFcpbHV1EJuYx5akiMt3cpm9nYVmo
         uBBQKPymYOT4QT7eqj5JYNssyRvr53r+OKNEbMGtt3N3//4hEX4GTV58QhZ145Pv6KS+
         gLygfiYb+LtdFig3JYq8i44HYPmyO8tgV5nDChQYCTS9v59qivNQa5Mf11KUSNKHK7Lh
         CQGbDwDuZaKFK/kq2MDyDi25x1Cdlso1S5QJn0f4tM2LxxcOJL90eRyWeWgRNZ1YPW8u
         SZGw==
X-Gm-Message-State: AOJu0Yx01RAeZtPo0bK3jhfjiF6Ps1mVb56PXckfufcfFxnE3U9JN3tm
	Px6XGhFPLhCNA2rAHcscR875TRP3TptIuIAFbVKfvp+qxVyEJ8IHYAvlSZm7SMBn9fNnG6JMOVX
	fHRIFkCsV/t8UnpmWKToPF8lhvbhsjlQvtbTXSQEJvBCXhgWSGXWiRz1JJ/aPMopt9Mc1n8Njom
	7irnSM5Yeqf44=
X-Gm-Gg: ASbGncsurAQmL7P/2HO1IoMifpkL7goPz+W0ZXhDpR1iycYp1eLjvZ5NXfW2bmkghEr
	KfhJpOWOnahmC0pzeQ+Jyc2UPNCqAVGs6JF0sVE4o/IkFEdiWzrJO/aHQmAY8CMpUetJf4BjVL4
	M9qWunFs/PtZ06S6sfzktdvh5YRifxiELt+gZsSfXdNT1JvHU3V+ubTfNKYI6M8PmvRZMouqVlY
	rdAKWoQ2VYXkSCEiiy9Q82yQXNCs4+E0pZ9JM27TB4VF4006vlodmwbkLjLj/ho3keqzl9cY691
	mu+jqbI7i4PydKbgKGnTWKSfauoW8uD80P6fnogjNaLPY7Hqdgv9eMd5BIjWlhPHgPAaN7cGkBU
	=
X-Received: by 2002:a05:620a:4249:b0:7c5:6b15:1483 with SMTP id af79cd13be357-7c9606b0147mr878354285a.6.1745639834486;
        Fri, 25 Apr 2025 20:57:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpkanAtQGvrQWUalYy04CjnyU2WnYcGl4Xte+bgdwnDrg48HN0ReUhw71vYQ1LNxPth6XVqg==
X-Received: by 2002:a05:620a:4249:b0:7c5:6b15:1483 with SMTP id af79cd13be357-7c9606b0147mr878352985a.6.1745639834195;
        Fri, 25 Apr 2025 20:57:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7f96a1c6sm796236e87.201.2025.04.25.20.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 20:57:13 -0700 (PDT)
Date: Sat, 26 Apr 2025 06:57:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 08/10] mesa: Pass needed clang flags via
 BINDGEN_EXTRA_CLANG_ARGS
Message-ID: <iy4yhfuujjexpoqu5rrd3bqz5nmcoaofbfuqnc5vrfhctj3mpy@ksq4urk5q3xw>
References: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
 <20250425-clang-merge-v3-8-feea6f07d130@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-clang-merge-v3-8-feea6f07d130@gmail.com>
X-Proofpoint-ORIG-GUID: nASGPPkVi4n_rJHMmD9VR-K8f6kkYigl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNiBTYWx0ZWRfX70mw5gk6nM40 f8sxPEmRkJuSbSDFVsbblYVDfIJM5fl7J+t23xdnHHiPdnZMhMLRPWgv0HZ2Bn/cS8q//p6Lf1q ity+8mkG/MMFP/25BoC9BdZuc/ZuJ2CPTwbTbDPpvZWrqyIE0ym0Fsp5vnTH7ZJd68c0eu3eGAD
 lSyOIeoFYEdjNbRGDLXKde4IsyqITDHu/a3bAgzQS6K1MUAVjlXwezA6NZ2sjTThxWaC3qWZLuq jgTdASUZFyQEEdixR/A4h6RXM+HXVhZNumC++UirHm0xgxtu67Fj3KPd/AOUYT2YiLcXo3V5X1L QNV5fZ8NgNW/kf5QA4cr2vCvUEAvwtgx34neG0/uuA5Kcu/kOLagihW4D5hjgKywmf6XkXybeSc
 kQSMWeMBoLP+t1roZfIsX/bF5AYIrhl3YfNsjtBL9mr8LcBQh0Es9qEu8NDNRm8DjoWksAI0
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680c599c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CbRpkjVbj6gFkklgJpQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: nASGPPkVi4n_rJHMmD9VR-K8f6kkYigl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=791 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 03:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215511

On Fri, Apr 25, 2025 at 07:35:10PM -0700, Khem Raj wrote:
> This is needed for clang to find the c++ headers when invoked via
> bindgen
> 
> Fixes
> | /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
> | Unable to generate bindings: clang diagnosed error: /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
> |
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index cd0f02c6d7b7c8de37bdb1695abc70d95f99a919..3ebd96fcb04b5612b293794ca4d124f1d932f54f 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -233,6 +233,7 @@ FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
>  CFLAGS:append:armv5 = " -DMISSING_64BIT_ATOMICS"
>  CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
>  
> +export BINDGEN_EXTRA_CLANG_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"

Ideally this should be handled in meson.bbclass. It already sets bindgen_clang_arguments

>  # Remove the mesa dependency on mesa-dev, as mesa is empty
>  DEV_PKG_DEPENDENCY = ""
>  
> 
> -- 
> 2.49.0
> 
> 

-- 
With best wishes
Dmitry

