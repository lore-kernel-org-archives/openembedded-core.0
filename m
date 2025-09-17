Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E5CCAC599
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 15:03:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.25818.1758121414148464347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 08:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IhbsiRNW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8Xjbe014321
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 15:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q/gFzheelGCqwvF5qs0qzLEg
	+SR1EZobd1D/0ik6Jq8=; b=IhbsiRNW3RnK2CYsWuiGGMccSqNUSqtnW/cNmxxq
	B6noNMlcSMx055YupPMr66exefZICW9OSPZlfhIrhkZjC0Fzd6BZODFYcR8BKLly
	V7/A4yqns4iJ3T8Ts0PaqpQrBkZJjehw2v0lupZ2ba8AmPOUwEvS4Bmc8/lMK2bU
	cj6vC4cUMDKKHtOTtfQfXFD08kbJL6VQQi1/VnIDPoeboPHVa6xNDGNOCNDxdJjF
	HEkHtmqLnfDzahhpyGgTSlRWidhQ4FII/DcgOT3YdPx2NnWdrinl7NXBWbJVSo0I
	AFNSyRoE2wDz657u8dxbAsYM/PHAkUqFOJf/I17zVjoX5w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxu2u2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 15:03:32 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-74598fb3053so4163038a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 08:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758121410; x=1758726210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/gFzheelGCqwvF5qs0qzLEg+SR1EZobd1D/0ik6Jq8=;
        b=I8mM5t68bPVMHe7HELIDtxZDlGonKGTgYph3BwJ3TxCgRU9v/X90iQzE75uxmUuiee
         i/in9jyT36nt7ecwpWtfe7vcBduOTqSY/52qTJUBmidfvcGD/KnuFWUMyF47dU6Hx79s
         su9k+NSb9x7YNVyg9PbHxI8zdXS97ER8z0H3Hr3FHCBg8TZV7tiHYGJAcyx1HeS14jqg
         ajoh3pDs8oXcCebShh2nksl9iU2eMH4mwnMSMsh9nC3WThiEevAgQfe8LxtVs3vRxZ1c
         ccoTaDjxIaml/G2rS0RUfvjprR9QVQSmClFkJc4fbkDClbJhfDlP4XQctkO1MqOWcSLQ
         Rjsg==
X-Gm-Message-State: AOJu0YwfxECCUK1oh6grUgDzihI1sN0d8Yqb3x060yU9u+q0MLY1JaWq
	u6jpvkKl8FtTXMwVmkomhveIWujTxx44ERbCaAkViqcWnrOShOwEhn6pSnrteIO4UGLKIn9+OtD
	LrGyDMpXfapD2ntLAc2b6PYSGSlUDrI4n9dso5IFrmG5k2TXCDX7wtJGdweT0fHfp+nCcCAEtDX
	1NdfWqubrrnO4Hh+8=
X-Gm-Gg: ASbGnct7b+tU6OrpGf1eckezHOtJBTPB3nxtIugNr2e8tGR9wM1gxJHykxV/bXY85qT
	+Hv/t7c/i2N7r6FBF/KEQmQFhaC+oeU2Ji/jNQhDcg/U+Cb3TE3ehHmwiMYsO3X1oG9+RBlKk/s
	nbCUC3OC9RK9A0/FPLjDU6okKIykTDB7TZmk93Y6AzbZisRjiWhLmWTRW2PKjJ0DKzZv+miQsjK
	1FQqb34ZUSflYspI6D2yRSEJ5YL89+dgr+B9Xkltm9EimmHaFwxEZqcnKjZTjlkF9shwsUUaU4q
	wDhi0zz7TfaWS8N5x15FcqdQ0yPqvcxkQcGpK13XUDkl6tCgTJAHxYdm0lRZd8pW/lNDIBAUnJW
	SjN9S43a+V/DrC2uTjL28v58/+GFHqlsm3mWkm3vrb+vDm4rXZNZc
X-Received: by 2002:a05:6830:917:b0:745:a095:22a2 with SMTP id 46e09a7af769-7630e767408mr1111986a34.7.1758121410073;
        Wed, 17 Sep 2025 08:03:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuWJENTdVX83iDAzZAL/TBL2Hi108wRBXSbGtBGNMLDIkfKQD1OOXOEGI4OLpncNNLEa0vMg==
X-Received: by 2002:a05:6830:917:b0:745:a095:22a2 with SMTP id 46e09a7af769-7630e767408mr1111843a34.7.1758121408221;
        Wed, 17 Sep 2025 08:03:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460d4b5sm5377439e87.97.2025.09.17.08.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 08:03:25 -0700 (PDT)
Date: Wed, 17 Sep 2025 18:03:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] mesa: clean up libopencl-mesa dependencies
Message-ID: <btfz745rktkkrjova3v6fqqgkyhflgyatfy7ycu455jqdsc6ja@feq7hskq6lby>
References: <20250916093738.1636562-1-ross.burton@arm.com>
 <20250916093738.1636562-3-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916093738.1636562-3-ross.burton@arm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7Al+DiLlhlIo
 9brJaX3VY3zd2w6ssYNandOeXi6/KkWaNjPxUUvmzbmmOEBErczlH1oZugx8LMiYKVkIShE8h1p
 ry/8R7NDAOJ3n1vUHQbHrqxMinkb7P8BO//0dDxD+9dgkl3ag6K1p4kjhbj8dlkSu4Bt+cWW2P4
 3mhaG7xrmIglOzqEDKPIYMES2rDuXVx9nUwFeOBnUqwleJ/PpYGqoYNFU8Pg6I+8b04aeUqeQZI
 wGshAVP4p8ofu20Pg8rw+plsNzokWKS3geMUaG10mxWJcqIZXijX05ZDtLUYkGnyOuLBrX1c2NR
 g5Uaf21wgRsH0X2HmaHlyUcDcN+jxWqH+/sMtQD3dVWVHlCbLT3ATVRb4KbPyBglqYH/bk+DqaN
 JI64lQ/7
X-Proofpoint-ORIG-GUID: VA8GeTgyB6yXaDK3oNnHUqiPl9sRutu9
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=68cacdc4 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=Nyp_n3nw-LhEeNEQAkQA:9
 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: VA8GeTgyB6yXaDK3oNnHUqiPl9sRutu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 15:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223611

On Tue, Sep 16, 2025 at 10:37:38AM +0100, Ross Burton wrote:
> The libraries in spirv-tools and spirv-llvm-translator are linked to
> libopencl, so the correct dependencies are generated automatically.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

