Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1D0C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:04:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.11500.1745489090354831366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PxVu1SC9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F5YZ007493
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rgwldgZQBlHcffiFkMH6H3fU
	EzZfggpknZOc0NAFUC0=; b=PxVu1SC9iXloStxbkq7zeu3Q7QolxJlFGDWjP60U
	6mBWYp+7XMhHQ+niNHKVY54DdqTsEi22r5tdKFG/gsDcuGg547klCERb9Ycw3igz
	4OGHcz1048pL1c3SC+9eoK+zLkTtsjOcApcfOOUvaR33verZGoic+WR/kWL96VSs
	r9PpK3x9JMWxRw23q2KgwONZkqjub65ZJ5pqiM+n94v9U8Km5tP0Tz8dANg9ZaNB
	NcoeJTekl3nT7xvXQ7S4P8rx5A/EoXkvcX0VZrIqHpH2ZtrSPBnmipOJCYTvZ/MB
	mHIO8gagCUzCucl1jqWSLLgAb/BGQhfACbWrFfHKemqKIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1n3e0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:04:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c543ab40d3so133874285a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 03:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489088; x=1746093888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgwldgZQBlHcffiFkMH6H3fUEzZfggpknZOc0NAFUC0=;
        b=PDjYUiofDDqXbhQQHUMO8ZH7NBbsM/BEmdJ+c3Z81iNlnntrx7AvwxMkecZmxtksKe
         x1qox0zgF4UC1Sg+I+LODIc1jVfuu6Sf4Fzo3VqO3G1NdG8xx+xxV7s3Vo721ezTt0DP
         WOhU2C/0okeyq1vpdAOySFutS8Pa+z3nf+2icHOqAtqEmelCkNZAhvEFwC3ewNTswzJE
         Kcusg4+CNSKizvyo4qM7R4Zo6sfTVG6YVKbrtL2Ap3ODGCTyd0gx+gmONxuXPp9ORD17
         VQn/Oym0ernMMBso6YSyBrVUqcjHvkZzVXSunoFpbFAqxcN6oHv7RedXPeXc321EJM5N
         wqAg==
X-Gm-Message-State: AOJu0YzjPXoxksup4xSXkgFKFv/ruL1uKK9lmUH4SlL3EeUmnb+6tuYx
	mVvib9Q1rqfCuN48rWM9IBI8mrRR/dNqmG4hPCnKlGPa9RYTHm9ICurHVEM/cJLao240SDCZFHc
	IkTa6noUQcIkH7fMmczlt1ha8//Esn1pIGhnujcMMKX/F0K3ZK0z2b8d0YeCskxrwDWLo0/sBRs
	SXVaQ=
X-Gm-Gg: ASbGnctlGf1OHvALlu+mxBIVWqAWbW0B52PCQ21E/swzeFVra97Fz8/L868CmSjaRlE
	x8Cr5Yi4iC3T3aw4yq0TXE8bHhwXXOWwtZoj5ddeUna4bf5mOx0W1oDv8MHLc8QkkEn4LX8rNtU
	R9Jvk8QJAEgZ/Gf6Jed5jl6hUGnH44rkp2u8dhfzm6Io5sdlK8Fn3uKk2hwGSdi7kKhqvK913Ph
	WvdbWNWgN+8T/PNyiXNsJMDK5ix5jw5SfeiYAZ3H3+TphkzRAJ0HdhjjTgNeKJ8TZ/7+sLrcMzJ
	e2hhgr3Lv52gQ9Te2LfWLb98Zg8ZJ4IvgNOz7ocJyjngBEtY3rCK/sKh3Wv0ahDbmtqqlQgxx4k
	=
X-Received: by 2002:a05:620a:24ce:b0:7c7:9a85:d395 with SMTP id af79cd13be357-7c956f46029mr261886185a.44.1745489088336;
        Thu, 24 Apr 2025 03:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRPDsmZHOQNafpkwY4rHsFmArnGFYWq+3oIkzFuzmSVogyf3pCRP+7n9p6MfpIJ0sbArXZkg==
X-Received: by 2002:a05:620a:24ce:b0:7c7:9a85:d395 with SMTP id af79cd13be357-7c956f46029mr261884585a.44.1745489088002;
        Thu, 24 Apr 2025 03:04:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26288sm175517e87.28.2025.04.24.03.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:04:47 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:04:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: Re: [PATCH 00/11] clang-merge: Bring clang recipes from meta-clang
Message-ID: <zvfx3kfrbicdbv424j4ustmrrjwjg7immyx4lp6ihrnwktgsks@rqy3zvo7xjai>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
X-Proofpoint-GUID: MDBK5A_HNEfEMlNqzpSN6bkuOAoRN1T6
X-Proofpoint-ORIG-GUID: MDBK5A_HNEfEMlNqzpSN6bkuOAoRN1T6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NiBTYWx0ZWRfX1HDSGfKQYSzj BNVCctuZg4qRM9RfcZHeGUM5/JCbpSmjWLfWB2sUvpZdsAamh58IrJjmr6cfIwrM4SBllNjlwgP esvvTjdfeSEJse8kZWgZfYh6H8JQF791QfwFR8tceyw3+4J6nzRVZVlAvTPxjxlYiDZxfZ5InYx
 iQRQhk9YYpQN8FuUI1OW8vfD+nTUDku8ltyGNgMz6VTwliujNj8r3gYgDQCHdvVFIj6jNBD5n0K f5+q0w8NKWvgvWfKwLXXUz0F8QjSgza5EcvXrQdua18lYgtZHuGbPHyn0pVxtLW3LxbLYYGGHKj 5sggyBwcOc+k9F7LD3rVuiWEpt9X0NubPYHrc8ggOG4/nHmEk7IgIcsKaZGW+vv1IYgRizbYnob
 p+mSDjQM3znNrXB2qEgDdJIxOJHpH4h+++TJENwel7Yz24bxgI2JaZU1mRA5jULjPa8M6sPw
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680a0cc1 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=W3HFafzmT_P6l066yiAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215347

On Thu, Apr 24, 2025 at 12:20:34AM -0700, Khem Raj wrote:
> Latest mesa 25+ needs libclang during build for tools like mesa_clc,
> we enahnced already existing llvm recipe to build pieces of clang as
> well, which worked for mesa's needs but broke static clang compiler
> provided by meta-clang due to newfound conflicts, since clang is now
> built with llvm recipe from core and also by meta-clang and they
> compete for same namespace, an attempt to make them co-habit did reveal
> more difficulties. Clang compiler from meta-clang is not able to use
> llvm libraries from core since they patch them differently.
> 
> This patch series therefore brings clang and all recipes that build from
> llvm sources into core. With this changeset, clang recipes can be removed
> from meta-clang there is a pull request for that already [1]
> As an aside, we only build clang once and use it for meta-clang needs
> and core needs.
> 
> With this, meta-clang can depend upon core layer to provide clang and
> related recipes, meta-clang will still provide the toolchain policies
> around clang based toolchains. Clang compiler from core, while usable
> for mesa is not yet fully usable out of box, since we need to workout
> the multi-toolchain architecture for core, which will be done in next
> phase after this merge.
> 
> [1] https://github.com/kraj/meta-clang/pull/1088
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

After fixing the RPROVIDES, this still fails the nativesdk-mesa build if
I enable OpenCL.

ERROR: QA Issue: File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/libMesaOpenCL.so.1.0.0 in package nativesdk-libopencl-mesa contains reference to TMPDIR [buildpaths]

While building OpenCL-enabled Mesa:

/home/lumag/Projects/RPB/build-rpb/tmp-poky/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
Unable to generate bindings: clang diagnosed error: /home/lumag/Projects/RPB/build-rpb/tmp-poky/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found

-- 
With best wishes
Dmitry

