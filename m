Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C17C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 11:46:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.49885.1743421601848692649
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 04:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hrb3pSaH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kddH028154
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 11:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gkJrQR/Q9thE5MV15bfJLI3h
	47I8WJssjvkNAUUX7ls=; b=hrb3pSaHmsHfX7D6YoVyeXDpK1RInvXD3hb4G62R
	8B7hexKx3zYZmiSzP48MY4imU4tZr+WWJ29XvdnjXqDdfEnd21XIc6W0jdmLsyJ6
	YK3F5sJK8szjfttp5ReF9ryz7gNap6EO8xiRD2fBW2wLsjEr29AZInEUFguNoogO
	ceHRMY4/RwJf9poYYLK//A5+9UVccSRnAXi50sSl2kUg3/U6p4mNw2wcNRJ5eWAe
	DA3+G69768KVaNSJPUktXXXLjuM8h/oiosdO2UMD6da6K2kG7VAL3FWEaXjKGaZs
	gxyjBk4ZupRrpcAC7YSHJNk7tUEr1QVDFBn3glHbcKukXg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhmjpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 11:46:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff78dd28ecso7797214a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 04:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743421600; x=1744026400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkJrQR/Q9thE5MV15bfJLI3h47I8WJssjvkNAUUX7ls=;
        b=tTg8wYOM55UP1gv9RJ05g0ZLbZXNrAVxFEOR1dOQLXzwDepDtkbTGFCdDZ/OGk27ld
         8owPNk53MunS60WQavIj0En+d4p92Fh1SuqPJZmrMM/OGeW1thtphrMa+iOvIUPMqFfn
         dF1DJ/p+dD+9oNJfCq35thgT8boeLQ//b19kLDzyCr1GLJGNi+AY9LekhI4ED69tddTq
         Jy9/HWptazHS4UGC7Qm/uBtIo+ez9bGjcxCGJEE0tg3ebPgas2rJ1nSktIDArR/99cqa
         lU913HZCWGCTcM4xsip+7DGEDqB/HwEAbRrjgxq+DGgz9E9KVDJeHJMjfyKztmBLk8Az
         Vwag==
X-Gm-Message-State: AOJu0YwkAOQTNwPe0vnLc3CZ3TW1w5voY2IoDS2EX9bao/Bmehyj0okU
	Cs0XN421nVUndcR2QKXR8oMXIrttqZVBuqLUNdhJky1Pj2qObxiaUDRlTpnpLdhNNeQp7FmfN18
	tIpFDn50Gw6IFht2L6+a4bxRKkMUzIIdXDGgZ8w+oHBvQQKAgpa+AZjhzQz3ihdzF29XjhlIKs3
	it7Voo7VJGgP1XjpDfaZNc6VVfiezevzELbqhhFKWvMO7rugWHqysvmA==
X-Gm-Gg: ASbGnctcqZpfTKds12bLv9StEXoMj9UNzwbSme7dVTlncSGed/B7fI4+PqQTTed3lAs
	phYm1EZ3j2kDeGEa+sDZvYAI1+uoT3hObWDlFAfN9yS2edwyM51d/zE7e552hDczC8SnPOlY=
X-Received: by 2002:a17:90b:53c3:b0:305:2d9b:f8d1 with SMTP id 98e67ed59e1d1-30532164b3cmr15780244a91.24.1743421600194;
        Mon, 31 Mar 2025 04:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoA46VS1+CGPtb0TWl77VS4ygD5cNq0NIVZs8wcOVHl4jnmAxBbkZaLzzCY5mUQNFdpf0TXSO2gYekw3aoy9c=
X-Received: by 2002:a17:90b:53c3:b0:305:2d9b:f8d1 with SMTP id
 98e67ed59e1d1-30532164b3cmr15780216a91.24.1743421599812; Mon, 31 Mar 2025
 04:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
 <20250329-mesa-25-v3-6-f4d0328eb867@oss.qualcomm.com> <CANNYZj_ARKe=acvg5WCquKCSuwsxBm4fmRLKDuQVt94gXbo3Vw@mail.gmail.com>
In-Reply-To: <CANNYZj_ARKe=acvg5WCquKCSuwsxBm4fmRLKDuQVt94gXbo3Vw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 14:46:28 +0300
X-Gm-Features: AQ5f1JqlL7F2q904P_uKTqQ7zb9sXej1G9xBzKHatNAFuPIUu1WBURaDqag9R6A
Message-ID: <CAO9ioeUReR8R6-AJK8koR8gOhSeavah_dzF+XO1RCzw8RzA2Xw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 6/9] llvm: add SPIRV-LLVM-Translator support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: zLW_Z5ZwH-O4243wJD8QZycJ4VIvrNWy
X-Proofpoint-ORIG-GUID: zLW_Z5ZwH-O4243wJD8QZycJ4VIvrNWy
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67ea80a1 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8 a=I6gZxNHF7taFUYQ6wWMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=945 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 11:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213968

On Mon, 31 Mar 2025 at 13:14, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Sat, 29 Mar 2025 at 21:07, Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> > @@ -23,9 +23,18 @@ MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
> >
> >  LLVM_RELEASE = "${PV}"
> >
> > +SRCREV_spirv = "68edc9d3d10ff6ec6353803a1bc60a5c25e7b715"
> > +SPIRV_BRANCH = "llvm_release_200"
>
> This can be similarly set from PV using oe.utils.trim_version. That
> way there's no need to manually rewrite the value on version updates:

Good idea, thanks!

>
> https://github.com/KhronosGroup/SPIRV-LLVM-Translator/branches/active
>
> Alex



-- 
With best wishes
Dmitry

