Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76064C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 12:55:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.20055.1742560562519366790
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 05:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aX4qiOuq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LCSdjU026093
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 12:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aToA5FXqbz/sUWo1otjVsvyQ
	O8GNLzi8FUxfWyS+eZo=; b=aX4qiOuqcjhp48PVhdloIf8GGhVsP0iC+B2qX11V
	j0jv7WxpxR7900pBkDoap6L7Yr1zwHvCWuHP3IlbiAGZH79OXVlP7Q1fZIhvEKTQ
	PlDRJHc733Td75JxV/vmF8QymZnG5ygY4Km1Ki0mG/Ky25ohn3XFpDMKmY6CFa8Z
	GuyyzH93B8oHqMJOh1jBO8M79EQmfQ96lgEoe0Q+csv83t9T6bddu1n2ewuSg1Zn
	2ZLHsYWdNvtFyz8w8sPSHC/Zo0X6CBGzEh91qlG6Pz4AgRDLMcagmCiB0nryRIpO
	BrWKNVRfUxdMg5yS0ILld9UmRT2BeaoSdsx2jGodK8s21A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h854g0vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 12:36:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766e03b92bso33769021cf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 05:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560560; x=1743165360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aToA5FXqbz/sUWo1otjVsvyQO8GNLzi8FUxfWyS+eZo=;
        b=SaxOMzToiBFh0xeyZ7HSQbIULgyOrzIkChSXX0POKwc0max3VIGZlzL7KH8P4Ts9Kh
         5xaGa3nVmk53vm2vV4nLDMnOxL5nO8knHwfsN97oF+EqrkErcwrtZfSn9WK7qvJHBwXg
         nK3eJwz6P7GCVWRvCQF3UKbNfXVrD7n7scWmyHesDecWuh/RN1YT5+lL0QlT8SdAhhXK
         juw9UCTFqfSsAT06UiJpDIjMiOQfjk2d5LyPgriXGstdTIInOO8b3eUIOhuIxV3cvbcp
         KW2Ru/WgBJYrogPE0DzMBhw06zI8MslLs/nbX5q1cK7ou+HD99ye8fTSp3sg6xuUjCL+
         axnA==
X-Gm-Message-State: AOJu0Yy5VTCWUYAFlkbMvqmnz/gX6VMuclwfFySXl63+GC6XNMwvN0Of
	eLKN1J56qKigx/laDQzw/mcBuDoJCeOJvn/JLzrrNIHKdPGKNv8ygpBL7Oy1f75nuC9yPQIVN2y
	U8oV4VZg473eRnPpfqPGD0lcvT/OiLVgTH/sbpvQ+K0egrCbBlwrsDLVEohZbahb6hqk7gjwsT4
	wNNi8=
X-Gm-Gg: ASbGncusiUswJhiu0/CgCoEaWat4A/ki/zP/1tg5pxtPhuuCDUEnnt+h0W2lOHIVQm5
	CtJQaKQmiqaWnFSz63+zabcab4Gxk1Ox/EJD37U03jV0EEsrVqMwpAv43Gj6TIZV976ECPpDhx7
	1DcabQLnwGtNjit1XvJBNCslvAqL1Dn4VPOLKQBN5u195Y1v6pWoBrOcWFOHnX5Z9Sj9uq92OjM
	6udoKwsIOdifBpVA8rQP+CicNcIHuSAaqu9O53B1xA6CWeFlbSMz/GPgPdH+CAajXLFUP7VXIFq
	hv0nKaP0kGQ8qkA+19I7XxecoTzhY9nnCoULdyt+ahBB/wB9xSzDv8dc5wJSjp10A/INWEXXQNI
	I7X0=
X-Received: by 2002:a05:622a:558b:b0:476:7112:4add with SMTP id d75a77b69052e-4771dd79275mr50995561cf.18.1742560560452;
        Fri, 21 Mar 2025 05:36:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtj+Np4LjRM1HL7g4tp48T9nbHzPwkr6XekpYx4wKSUiUM4PB/e2eVQJFNSWJVzsEXozu1VA==
X-Received: by 2002:a05:622a:558b:b0:476:7112:4add with SMTP id d75a77b69052e-4771dd79275mr50994981cf.18.1742560559956;
        Fri, 21 Mar 2025 05:35:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647ca43sm174374e87.68.2025.03.21.05.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:35:58 -0700 (PDT)
Date: Fri, 21 Mar 2025 14:35:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] libmatchbox: Upgrade 1.12 -> 1.13
Message-ID: <krepujvxfu6bskjjcont27nt4nprqtbzt3fchyjtfhmpy43zcb@anxpp62fjgyg>
References: <20250319125952.646746-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20250319125952.646746-1-richard.purdie@linuxfoundation.org>
X-Proofpoint-ORIG-GUID: 2YQq9iC2MufrQgjVvKi-kCxeKH_npeKz
X-Authority-Analysis: v=2.4 cv=ZtHtK87G c=1 sm=1 tr=0 ts=67dd5d31 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=hNKAdxe6AAAA:8 a=WLmTcBlQAAAA:8 a=ag1SF4gXAAAA:8 a=iGHA9ds3AAAA:8 a=IuXdh0WtaKwnIGDSdpwA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=RDLnXD3-wqoSaETZ7KGY:22 a=5erps5QdhIy1zGTlbVdq:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 2YQq9iC2MufrQgjVvKi-kCxeKH_npeKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210093
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 12:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213446

On Wed, Mar 19, 2025 at 12:59:52PM +0000, Richard Purdie wrote:
> This includes fixes for gcc 15.
> 
> License fixes were also made in the repository. The license being referred to
> as MIT was in fact HPND so fix the LICENSE on the recipe accordingly.
> 
> Use the new bitbake tag functionality to verify the commit matches the tagged
> version.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../{libmatchbox_1.12.bb => libmatchbox_1.13.bb}           | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta/recipes-graphics/libmatchbox/{libmatchbox_1.12.bb => libmatchbox_1.13.bb} (91%)
> 
> diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
> similarity index 91%
> rename from meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
> rename to meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
> index bf3f5c005d9..6ee30097542 100644
> --- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
> +++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
> @@ -7,7 +7,7 @@ SECTION = "x11/libs"
>  HOMEPAGE = "http://matchbox-project.org/"
>  BUGTRACKER = "http://bugzilla.yoctoproject.com/"
>  
> -LICENSE = "LGPL-2.0-or-later & MIT"
> +LICENSE = "LGPL-2.0-or-later & HPND"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
>                      file://COPYING.MIT;md5=f45ed9332b4f50a35adf2065adde4ca7 \
>                      file://libmb/mbexp.c;endline=20;md5=28c0aef3b23e308464f5dae6a11b0d2f \
> @@ -15,9 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
>  
>  DEPENDS = "virtual/libx11 libxext"
>  
> -#SRCREV for 1.12
> -SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
> -SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
> +SRCREV = "5cd78efa3120efc46497f55c04382be960d1864"
> +SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https;tag=${PV}"

This breaks with:

Parsing recipes...WARNING: /home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb: Exception during build_dependencies for fetcher_hashes_dummyfunc
WARNING: /home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb: Error during finalise of /home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
ERROR: ExpansionError during parsing /home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes_dummyfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which triggered exception FetchError: Fetcher failure: Conflicting revisions (35cd78efa3120efc46497f55c04382be960d1864 from SRCREV and 1.13 from the url) found, please specify one valid value
The variable dependency chain for the failure is: fetcher_hashes_dummyfunc[vardepvalue]

>  
>  S = "${WORKDIR}/git"
>  
> 

-- 
With best wishes
Dmitry

