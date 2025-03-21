Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77835C36002
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 12:55:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.20067.1742560671412472387
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 05:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Rb+mXhbt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATEjm022411
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 12:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6Y427+VDJwE88LzxZ42CnCR/
	GtJLMUtWCzEsknpI9Qs=; b=Rb+mXhbtc5ZCK2+K2vMU5q6dLMYSCPDPohJ1KhYp
	ZHXDPoUxZOLI80HgN2cgl8KzASZlMHlh8NS9x9xSA30PVUlYwtxtH/gMRrh5QUFj
	qAcxtmT3/kFS0oi7jGkx5lgL5AqmxVEUXKQPv+I9VHNVQpAfFAkp1i03Bsu1U7r8
	KOPwqpdXexI55z8Hfa9Wlb71aE9yODlEFE6fw4I4ouYc7e7eUdy4lm4lZKIPJ4OJ
	i+jDlO6cYrn24Mz3HDh0/Atnct8fxfB1dBpgBbYC+jhnH8oYQkXEG2y2V6ZnOFNE
	TzBs80al/ZK16A8sjChhVXuh+lGWdDgxhyBaoy8KhvNONg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fd1dss9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 12:37:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4768a1420b6so33236941cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 05:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560669; x=1743165469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y427+VDJwE88LzxZ42CnCR/GtJLMUtWCzEsknpI9Qs=;
        b=KWBzrphC7UrV4MwWEGXqSB4YfJgTe1pvQ7tfFLaFmvokvnJS+eQg62adgf43QdPsFg
         onstga8IYMznr7cdElsmjaFKKCYPUXKV/55znX534sGJPJ81mr3HTc5XPeEYh3zaOonq
         l7yqwXUanerrbfqyltYLpGl72+1Cn0IEGxTfONOuPNkoA2FRHpxjAFgaaQ9sSk0s3mly
         UQdMT6OP0KsmzZ6LfXdK5zlJWhKjyjFlJZSRUsusOdvhFOtikqAWVUSIheehFhZRrXK3
         TzmZq6Tk2QUrWN041OkTks1DFF93WXenREi0LjNBf15kI27kWmIO4tMDN8K17ll5hhPH
         QOWg==
X-Gm-Message-State: AOJu0YxlFYpuXo6MgDwAdhe+/a0fk1vfKZQ58enduRcrGh79lam7Jt3A
	l5zVC+FiH+aehJIjClg2ct4idRH65xDscLNmwt0/yJoYYrI8iouR9mRhMwXLwyHIjdqFwWuGJK3
	T2FkkBMzxWyXIBaFJOm3KHsHENxnbpFWi0hfVFJX4qZbrjP33io9ozeh9Rw5o0/UjxwivoXCFER
	PxIRNLaU0kX4wN1g==
X-Gm-Gg: ASbGncuCpLZ3uZgs4FOBh67ZeJwRYaCXB10pKYpn7DeFS+UMsD1dXeH0BoFPFGXz39D
	i3/FoMHV4JG/tOUSgW/sWp+5eO66IF7b1lmMKt87pGRr54mUBTLZ9+J+5RaAE6bPgpeL5RXJskq
	vUu4X4ysqIuvhDmDTNEVJ8LLm/Y3Sacc7r5NnXuo24Tk0bCPQ4cUj3boOim/iYLp9hxhSU2vxSk
	xqap9Jx8HKnu0R7QHWxemSTUgenNzTxaU7SlSBGYbBiDcY8+UF2pPPHjkgkFyW4QKwVOH6hP077
	DrBckapswNRVa0SfPpvTpgpH/2SqW6MXDBWliXiun6ijooxcvJjtFA4I/h9Edm1uzn+c1sgQ93u
	9esA=
X-Received: by 2002:a05:622a:4188:b0:476:9e82:6515 with SMTP id d75a77b69052e-4771dd82d6amr50203011cf.23.1742560669163;
        Fri, 21 Mar 2025 05:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw/+IiSeNGssXM1ZEUzPsRYqWAtU5Wz25oUrsKO3tTvqH3b+gWtWwX7pSVukCHO+N/MlImQQ==
X-Received: by 2002:a05:622a:4188:b0:476:9e82:6515 with SMTP id d75a77b69052e-4771dd82d6amr50202411cf.23.1742560668582;
        Fri, 21 Mar 2025 05:37:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d91106esm2356601fa.99.2025.03.21.05.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:37:47 -0700 (PDT)
Date: Fri, 21 Mar 2025 14:37:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Peter Marko <peter.marko@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] spdx30: handle links to inaccessible locations
Message-ID: <exidjcjvhfkvob7yns4tubsqeuajetel5ezaa3gu7aezbksvp3@fuknr23vph64>
References: <20250320121533.39356-1-peter.marko@siemens.com>
MIME-Version: 1.0
In-Reply-To: <20250320121533.39356-1-peter.marko@siemens.com>
X-Proofpoint-ORIG-GUID: KxOtJGymmcozDvTY_w8oXyzTnqbRQ4wn
X-Proofpoint-GUID: KxOtJGymmcozDvTY_w8oXyzTnqbRQ4wn
X-Authority-Analysis: v=2.4 cv=T52MT+KQ c=1 sm=1 tr=0 ts=67dd5d9e cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=a_U1oVfrAAAA:8 a=5qfcX7S9CF9GBXbvNm8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210093
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 12:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213447

On Thu, Mar 20, 2025 at 01:15:33PM +0100, Peter Marko wrote:
> From: Peter Marko <peter.marko@siemens.com>
> 
> This is the same as e105befbe4ee0d85e94c2048a744f0373e2dbcdf on
> additional place in the code.
> 
> When a link is pointing to location inaccessible to build user (e.g. "/root/something"),
> filepath.is_file() throws "PermissionError: [Errno 13] Permission denied".
> Fix this by first checking if it is a link.
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This commit breaks building recipes here:

ERROR: quilt-native-0.68-r0 do_create_spdx: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_create_spdx(d)
     0003:
File: '/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/classes/create-spdx-3.0.bbclass', lineno: 135, function: do_create_spdx
     0131:    "
     0132:
     0133:python do_create_spdx() {
     0134:    import oe.spdx30_tasks
 *** 0135:    oe.spdx30_tasks.create_spdx(d)
     0136:}
     0137:do_create_spdx[vardeps] += "\
     0138:    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
     0139:    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
File: '/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/lib/oe/spdx30_tasks.py', lineno: 537, function: create_spdx
     0533:            )
     0534:
     0535:    cpe_ids = oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION"))
     0536:
 *** 0537:    source_files = add_download_files(d, build_objset)
     0538:    build_inputs |= source_files
     0539:
     0540:    recipe_spdx_license = add_license_expression(
     0541:        d, build_objset, d.getVar("LICENSE"), license_data
File: '/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/lib/oe/spdx30_tasks.py', lineno: 408, function: add_download_files
     0404:                    creationInfo=objset.doc.creationInfo,
     0405:                    name=file_name,
     0406:                    software_primaryPurpose=primary_purpose,
     0407:                    software_downloadLocation=oe.spdx_common.fetch_data_to_uri(
 *** 0408:                        fd, fd.name
     0409:                    ),
     0410:                )
     0411:            )
     0412:
Exception: AttributeError: 'FetchData' object has no attribute 'name'

ERROR: Logfile of failure stored in: /home/lumag/Projects/RPB/build-rpb/tmp-nodistro/work/x86_64-linux/quilt-native/0.68/temp/log.do_create_spdx.3116916
ERROR: Task (/home/lumag/Projects/RPB/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_create_spdx) failed with exit code '1'

Reverting this commit makes the error disappear.

> 
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 0618f2f139..bba11ae930 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -1068,7 +1068,7 @@ def create_rootfs_spdx(d):
>          filenames.sort()
>          for fn in filenames:
>              fpath = Path(dirpath) / fn
> -            if not fpath.is_file() or fpath.is_symlink():
> +            if fpath.is_symlink() or not fpath.is_file():
>                  continue
>  
>              relpath = str(fpath.relative_to(image_rootfs))
> 

-- 
With best wishes
Dmitry

