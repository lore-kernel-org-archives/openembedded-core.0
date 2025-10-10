Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA5DCCD18E
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 17:25:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.237.1760117109257306930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 10:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Lsu8Yhkv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFa7Ia011732
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 17:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YyGlHxVlr04yH/RA5KsQuucl
	3/OrCUfTRgnsUNJ/sRk=; b=Lsu8YhkvWQNDdnp5ZyApNKs3Ja0rPxALbMj+X2x6
	LkJBHGsy2D52S1tGpcJSLVFMvfLWkKDRGoQG+FnUMVqNlisxXgtzcWBP15nhrCOr
	vaK17Oe5fC50eTq6aS9EWjVNHtPnDCdEpngdQ85QGdAk2z5894lTVc+1Q338NYUy
	GU6kXI9J2256zVZeXcRGduz23qPekOpVE57cejv4QcDoh49STfJSqD+hWtC+PMNX
	L9RfT6u1j9Zlek6WEo3yeaRGL89EDdvpOMLCDEoVERNp5YxMETQnmHiOqsTEDCYX
	HTGtodKhVKkAAB4sRmhXG01vDjUikespOQ6kVWLsGbAwuA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49q4x1g9x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 17:25:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-87561645c1cso979445785a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 10:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760117107; x=1760721907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyGlHxVlr04yH/RA5KsQuucl3/OrCUfTRgnsUNJ/sRk=;
        b=d3K+a5n8Lt/1IvGTC+4jZHocZNUaVo/3sscyCtiQ409pHEyhM0N0yJg/JNFkmpG8Ju
         c7Qr2EK9phxvxwAKCz+Ms1cluTkXEESvJxIQx7JWHLF4P+nbYEEUMJmnohYA8IOx62Nd
         SfK7qpRmEBL4yLw0Kmol8kVipD/tez//OLtpQOr/HZLrjyZq4MGkqrWr9Yi581RFXgHa
         2L8GPLdL6xCbkeKu923p50OzCSROuZHI1rTCRj4rOn+QASqW3xhkvOJcGQ2TaOg7S205
         qTuHUD5LGAc7/jQDxIz1WmntlaqY62VUUP05IbCRH5gU/Et7K43vi7euZq5jxH5JAqnh
         /TnQ==
X-Gm-Message-State: AOJu0YzLaHaAF8RUWYg6wI6DYcDRPVtTjbiT/xxYU+b3bAA0iuMmx2YF
	JCmnoBufvFlplSQgySPy5Muc9Vv2zvT4L/CUssE/qNZ9a59pssnBP+WM/WOi91d4F/uHQSY06Fb
	bKls2kdaC1/tLLIE4T7zD504LdbBXOE0o3k1bkWfu97+zFnoAxB3ycif9aEK02sAOk9diGfXAYy
	0c5uxb3Z5N4dtx5IE=
X-Gm-Gg: ASbGnctiFdBoUk8Z49TL82/3/shnxe+IP82V1sF2b70se4/ZLq9u6Z4dYjzTlcHQXve
	kPTo+gt6iKJ7yyyitoihl7W08WXDUq0OJGCcvnS9bsRWMOrgtc3PehPxz/32YnQ3OXd++2APn/f
	tyf4sF2kx+NF3EcB6P2HRvVQ045jnf2yRHiGdl7Lau5RGm8UFYCuU2Fk56lxtBtSzNoEbQ2lWCo
	walWAnJ51MHzyx+dhcxODdAzrRV+KyVemA5mQd5R/ciYNUayizQjdYGug8oT+vj5eOAOb8Dozi+
	AHm5L8Opm+UNHg7nJHXHuWR1Tj6jlS4eP/xfiF5NRSpHHTwLnMlrSjPH092EjEGbW24d69MngwT
	bBl+6K7uvfj38Wn6a6n1ZwwSQd/GgDZe9BozTT0svhuQVQk2U5Amz
X-Received: by 2002:a05:622a:44a:b0:4b5:ee26:5366 with SMTP id d75a77b69052e-4e6eace16d5mr167544291cf.26.1760117106993;
        Fri, 10 Oct 2025 10:25:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/fY+er0qXIEZ+zE846/W83OUNKR8AAdpbG5aPWscG9wsKuF582Mr/1Wie9kpdFk/cgBdELg==
X-Received: by 2002:a05:622a:44a:b0:4b5:ee26:5366 with SMTP id d75a77b69052e-4e6eace16d5mr167543791cf.26.1760117106393;
        Fri, 10 Oct 2025 10:25:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f8asm1054523e87.18.2025.10.10.10.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 10:25:05 -0700 (PDT)
Date: Fri, 10 Oct 2025 20:25:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/5] mesa: add opencl -> clang build dependency
Message-ID: <gjten3nkwmqfiybe7a5egcj4cjyfab2bz7rkwobs7fkqypkx7z@iwabgmbi3mhr>
References: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
 <c413c47186075616e27fde37b51984487e69ad71.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c413c47186075616e27fde37b51984487e69ad71.camel@linuxfoundation.org>
X-Proofpoint-GUID: ezlr5FdScHEqYjN06cEsuN_zeGBy3O2w
X-Authority-Analysis: v=2.4 cv=N4gk1m9B c=1 sm=1 tr=0 ts=68e94174 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=C9hAIuDGHAtm3V_s0TYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA5MCBTYWx0ZWRfX/qoP+MkoRBil
 0PatcdpY/+K0gctuMjKZZCBV45VCsqxPGOE3EcIjHonZtNqfZspiaXGiuFyxnrpEXps31LGd33H
 //WYqR4BldFKYgTu5hAsBowzgeQyBNlExbutmZKgp03mLHP+uWy9KlSE8qacOL/Md4o2X/uuoRJ
 g/G8jlruKLMM8jz6NHU1hNNRrHP8dS7KNHPUPsZHBv5m4or6R6P80xG8WUH5eKOfGmB0l683YI3
 WIdM/7fJyrA5sbAeSiLc5lN1NXFJwk/GqvadWjh536xCXjhthzuxcPxeygXokVsURrRq0BplQwi
 yJcBsZc/xKcQxrVBrkf3eWmVF+f8Uld8hNjZFgcGBTSHf/kVzZ23xQegclgY9HJuM46iRjhu5C/
 eIv4ZGFdQeoRFpIeSwyCRXKzStTK7w==
X-Proofpoint-ORIG-GUID: ezlr5FdScHEqYjN06cEsuN_zeGBy3O2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510100090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 17:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224703

On Fri, Oct 10, 2025 at 04:42:28PM +0100, Richard Purdie wrote:
> On Fri, 2025-10-10 at 14:59 +0300, Dmitry Baryshkov via lists.openembedded.org wrote:
> > With the commits 448f4a84cb22 ("llvm: add recipe for just the LLVM
> > libraries") and d76dc362c8e1 ("clang: use llvm recipe") the 'llvm'
> > dependency inside mesa.inc does no longer pull in the clang libraries,
> > failing RustiCL build as it can not find Clang libaries.
> > 
> > Add direct dependency on the clang in order to fulfill build-time deps.
> > 
> > Fixes: d76dc362c8e1 ("clang: use llvm recipe")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > 
> > Note, this fixes the build issue, so it would be nice to pick this up
> > even if there are review comments for other patches in the series.
> > 
> > BTW: would it be possible to enable OpenCL in one of autobuilder
> > configurations to spot out such issues? Or would it make sense to enable
> > the 'opencl' DISTRO_FEATURE for poky?
> 
> I'm not against the idea but it isn't quite that simple due to the
> meta-oe dependency...

Strangely enough, Mesa's ICD doesn't depend on the OpenCL headers and so
it seems to be buildable even w/o meta-oe. Alternatively we can pull
OpenCL into OE-Core, if it's better.

The only downside that I can imagine that that mesa will depend on Rust
and full target Clang, increasing the build time.

-- 
With best wishes
Dmitry

