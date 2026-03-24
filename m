Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D26FEC10E
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 20:40:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7142.1774384830037038289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 13:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hKPI29EJ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=D3pKOHAL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJniMb2075395
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 20:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UaS6Njc22lhwJgv9P/hHI9bi
	uJfAloGvmC+mEglm5Sg=; b=hKPI29EJkUgdbpCzc1cwElmfILpPr+wZvKWRN5ub
	8m6X1tfRd9kSvmSpNI8ziKeEkfYF9LzP63V6TiYPrunxn5tnomtBRvRTcLpOZyiE
	fdJWLBpZ2OWJHBR8AiWVFPEmJpq019lRWVMUr0rN29UEOcaL8y2EvrV4p4eYkRaB
	0nL2FIvR8cNeGjXQrFrD5PUEkCUuytkAKB7Re66qfgw2gGmcmL0KClIi2/QhK4Cb
	itSLX6NBX1DUnzI8oKNqNymU/+CU7kOok9t+M2pSOnTgh5vwTMpoRa/6GjueOPAG
	0xD0/0vOF3xfMo1QDLJ//wB0rIH/jAz7uKIzvdHsQLKfRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4141052t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 20:40:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2cbe7223so97458341cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 13:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774384828; x=1774989628; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UaS6Njc22lhwJgv9P/hHI9biuJfAloGvmC+mEglm5Sg=;
        b=D3pKOHAL4GaTSck5//d5vL4RyGItaSR4WAB71OZJd8NA5XiNWiuEXEOKG+bEIlDeBC
         QX6e0PxErTdxWef6dwkOescdmzscdwH73bG1EiRPNsQP/5r2gVFJ4cBxBDLsuXE3/tdD
         mOZ0pm6QiNeSfRWj2HAt1jn6feXhNJOzIK190bffAnmicZiW8RYkMJKUTBR8TwmIYk7x
         WCUGWx5PveEsdn7rzYRs0MuTYOImHyU3QEChybrjwOikwQSnvWAfxe/QrPyO9WnCej2W
         7xHD1s0n6o1YjVDDgle8d+OXPdH7aqZsdAWjCxCPzc7xiE2w1pl3htMlJpUhmdnNAmQi
         P2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774384828; x=1774989628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaS6Njc22lhwJgv9P/hHI9biuJfAloGvmC+mEglm5Sg=;
        b=k085DWIaSd745PKasPMHs4EJ5nT8wwvmgiVouYU5b1GIlzGrtbkRTKeVN2NUZs+ZO0
         fmMcPzhHlMhbVXjmhwQSrYw0rzNVmsVVvvqceTsOuTyY2ov0FYEHQyOTdAxiLaruj5uv
         ALOPyEzzdeMlRPYqxDq3NyfagGbCfhRUKzMp/9sMpewCBQaredRAisBC6Ucc0vuybsXt
         VPMrFOTgDgctUqp5iLS8xxUB1foUV+UH+1Ib04mUd6FU9PeOhOPHrW4H3yEaBTpBWSG4
         +VMZmXmmSE1C4VRF5On4EzhcDYYLur+BxWk8KmwQJp5uao2RJeQL7jy8AVMCiO1y/yIY
         +TOA==
X-Gm-Message-State: AOJu0Yzi2RZkUoksQOd2dTDVmY7KIEpZYJ6tWM/tFbWC1cZsT2OIiR+b
	sOGHyyoay2j2nFtpPIx8gMAzWkF+sdgyxYVIDUrBAI1fRb5DSGmEZ/2bkraMM9XAs9Zvp/NF+H/
	xlprdiNsPPSMpuhYbFn764zWSiL/ZVou/65YKb8rMUSlrlxToDtan7utqLDZyPLKJ8lCTy4TP6N
	ICtJor5oU=
X-Gm-Gg: ATEYQzzmp6oN9/nmic1dB4gdrisQBpGM5olvpVvXyn+WDXBQ/wocw9o5IpQ/Rcc53bB
	HJSMh1CScw28p4K77fwU+V1rtvwvzcl0n9yVa0Ifd8jZTeAzNfgwf8RaeCc5vQLsUBqux4EvSEB
	oaiMlUVyKvz4l5ZEFlUK8lOJy6/Jv3cTtovTm8YqhZAVWypmhROdbXwclPviRrLKekk1pX1OT2G
	x3BoXQjXa9iEWd0SqP9u4Uk+Ue+MwlxFHxJfz5cvgrrYcqiSwOPCEva5+vNiSy5ASbB87ZCYndI
	nUHqYLJj/c54uqyNpr7Y8tbe2LiYg2zkV9JV7JkITQD44XD5f6hqoQpMnbbtwrkCJMTDzyA7tG6
	ARJMU3ArxbTpNmWN+mjSg7rmYlvh6r9/WlqR/Ykhh5dup91RGhu5OnXVHK8hGa4f0NbawDNko48
	0vJtBGKKdl5tFuE8251bK8agGzGcGUDSpJ7U8=
X-Received: by 2002:a05:622a:251a:b0:50b:51f7:c660 with SMTP id d75a77b69052e-50b80eaa066mr16762281cf.61.1774384828411;
        Tue, 24 Mar 2026 13:40:28 -0700 (PDT)
X-Received: by 2002:a05:622a:251a:b0:50b:51f7:c660 with SMTP id d75a77b69052e-50b80eaa066mr16761941cf.61.1774384827971;
        Tue, 24 Mar 2026 13:40:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192ab9sm3401002e87.4.2026.03.24.13.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:40:26 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:40:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] default-providers: use Mesa a a default
 provider for OpenCL and Vulkan
Message-ID: <yov4vdeww4hxou2kapd2hd3zibz7agemf6jpy52gb4kpglz4iz@ayptqu3c3yek>
References: <20260324084454.2971108-1-dmitry.baryshkov@oss.qualcomm.com>
 <20260324084454.2971108-2-dmitry.baryshkov@oss.qualcomm.com>
 <a6b6254789bebfa3bedff02d74074bb519d4578f.camel@linuxfoundation.org>
 <557juevkfprqpnwyaknejeeihtmyywjy5ykx3wypb7zg47z6px@vl2bcnwir4ph>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <557juevkfprqpnwyaknejeeihtmyywjy5ykx3wypb7zg47z6px@vl2bcnwir4ph>
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c2f6bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Q4-j1AaZAAAA:8
 a=PRCdaraTq_o-jmoU7q0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: WvBaYg--P4kAJxgEVf8T2c3MtZf5_sHf
X-Proofpoint-ORIG-GUID: WvBaYg--P4kAJxgEVf8T2c3MtZf5_sHf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MCBTYWx0ZWRfX/kiKKZ0s5seG
 5MTKDhbEYQh1uc01pLYME8ctifZbxgLc6szzWcAyocOw38fVT52cKy3+wAdopgZMpj1UJKj9zCF
 /BP606UsqUFjS0h9xnvjCzLNoeJd1cWDFhxDQrfyV9fx2ONkBatml1HHKO9i2iFlpYqVYchdNXj
 Hk9m1bjZAFmPz3ru0L2kBIls772cNptzefBRGcSn7/pMPGj7V6+YsGf7NXZvuLgoSTRXR312YKA
 QwfthK0IVvNBetz7qXuwFqDPH9OCt3L/Z8I0/DfGWv1aM76IZ3H9AavIb8Rdiw5Zx2v8HpbN8d8
 CxfVU2xv5DoL+MGZHqkgxGUqqOfO+kpssEjU6n2POMoP+U2/LvLBeN9Up1yF0hx8+zaxEOyxFkc
 HJtaAC0sdZ6GSAzekwn95lPLBd4ZXad/WhG37VtbUxO8XS6awNUk8J0p/kPRvKcDLQulmiXzlCy
 TsweYFScvmMKT4a+DHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 20:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233825

On Tue, Mar 24, 2026 at 08:22:40PM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 24, 2026 at 11:46:34AM +0000, Richard Purdie wrote:
> > On Tue, 2026-03-24 at 10:44 +0200, Dmitry Baryshkov via lists.openembedded.org wrote:
> > > Without DEFAULT_RPROVIDERs for the virtual packages OE behaviour is
> > > not deterministic, it's not always obvious, which package will be
> > > selected to fulfill the dependency.
> > 
> > Can you be more specific about how it isn't deterministic? We should
> > fix that.
> 
> I'm sorry for being not explicit. It is not deterministic if the layer
> includes other ICD implementations (meta-qcom, meta-freescale, etc.)
> You can point out that it's the layer's reposnsibility to handle
> providers in this case. However I think that having a predefined default
> would be benefitable (and at least would force those layers to override
> those providers instead of depending on the undefined behaviour).
> 
> In particular, I stumbled upon this in meta-qcom when the package
> manager (rpm) was happily selecting the Adreno Vulkan ICD just because
> it ended up being the first one.

And I was misunderstanding the DEFAULT_RPROVIDERs story. Please ignore
this.

-- 
With best wishes
Dmitry

