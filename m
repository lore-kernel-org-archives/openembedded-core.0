Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67BCFC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:34:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.51294.1743086039989882930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Sav83b9y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RENgl2005277
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9D7iaVFQHAEUvXgpygkedX2qzEXZjv5GdH8SK2S+S5E=; b=Sav83b9y1E6YCB6v
	DOyP2obMhc1YxT+ui1bOjnNbdZMWtXXVBF8bRyCDan2VQEi0GXqTBvPwxE6aM4dg
	ieDbyl5de6JJYtpLqvYhwEmpmzZnt88iJ5kbWwbb7tqXgt7LUARVbVudZzPapgqV
	6axhq/IAijW/0ks2BYLCCYAxlA3YDVQFoRwfKNDWL7/FL26JRc49xdzykKSVw1u5
	7WcCn1JF2xFc7HNGs2wgg3o6A+Wljrhtn5wgN4g0LsNI53moL2XDcGoMhDKwmokj
	bB0TXEQN4rQywu8lkjJZdP9LMLshkbNNuBATdS6hbGY+/q85wYK/1TjSbRiCod38
	bykE7g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktenfngm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:33:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff58318acaso2870448a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 07:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086037; x=1743690837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9D7iaVFQHAEUvXgpygkedX2qzEXZjv5GdH8SK2S+S5E=;
        b=s2CzK/eogghWD5tny5WIqGr4xl8q81f42UjtCWOSdC5Y1V2yjnYGD79wpaKEX+tesc
         g3LG+CW1CxHBVqtUpYl1qoIun+XZHdwliNWHz4eeJ5XcC1zMgcngXRWaBUpDGQt03tVW
         NK0sCUw1saYWBoSRZjgXBa0o07RQjKXNwmjyQvJmcCSlo3rz9Fcfux7LDOwtnyRorebh
         hy4XvUmL2/vAP2quWbxeatVALGBOYd3N08m1086MKSnyBX+24AeP6vsiJyv3D1ySsgfM
         Yte+wEtJCBdAr0REEFYgSdCXlbMVPltlHMb7CGlqGpscrjehMP1C5k/CaetBLGIkliAW
         9YQw==
X-Gm-Message-State: AOJu0Yw1xyoxoA1a8yvO9JBfNWOisfk+FeiWatLXtbLHT5JSn9fbGcq1
	4JdVHdbh1JWrcoTJNJrkqogVICcXkOfDMcxNm8eHT6OL4vJdZFObd44jQvNvRbsty+zg500duP0
	CmJTjV5UG4X2+G3j8Fcq4OlTCwdZPai/NxSXwA0ILE8M6C6jpAgIV5cowYKluOYF9UPIxhz3ovK
	BncelRIlhZD51PiS5YyL7Pm7sz55PoT6jvAuzV2ikWFHPJE9dYFoTFZw==
X-Gm-Gg: ASbGnctA/LcPmJHvcmDaVnKVr3kF0xSw5PxWaqwDw1TXn4ywiZlxomgJtSnN6v1h6rV
	SsdHANVt6jSZJsQTHximRqkN0DX7EkMB0m/P6tX3vFyL9OWV/1ALsw1gqu12yKGtTxxhNC09OyK
	DtRFP8+WVhpZTrDm0N+03vlo1XDBPw
X-Received: by 2002:a17:90b:3eca:b0:2ff:592d:23bc with SMTP id 98e67ed59e1d1-303a7c5a48amr5844225a91.4.1743086037473;
        Thu, 27 Mar 2025 07:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuqZ98L2NUl1KLz0gVi/Nw5p9Xef/j0VEV2ZINpE0LcLu5TJllsmxJT6Gjez0hUS2FcKcz6Rf9jhAYe4joOKs=
X-Received: by 2002:a17:90b:3eca:b0:2ff:592d:23bc with SMTP id
 98e67ed59e1d1-303a7c5a48amr5844179a91.4.1743086036848; Thu, 27 Mar 2025
 07:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250327135520.3920189-5-dmitry.baryshkov@oss.qualcomm.com> <330A44DD-3537-4BB7-9D9C-279AE88921F7@arm.com>
In-Reply-To: <330A44DD-3537-4BB7-9D9C-279AE88921F7@arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 16:33:45 +0200
X-Gm-Features: AQ5f1JqrfaNo4XkaZElBM6P-n0YrI5fCo8fCJVVT2aJBG_ZA7jlBfh5bqZ3uWxQ
Message-ID: <CAO9ioeWov6KKabzi4LcVPbON_07_NtEb6PNJwOc1B3ZW6891HQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/8] llvm: import YOCTO_ALTERNATE_LIBDIR patch
 from meta-clang
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e561d7 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=7CQSdrXTAAAA:8 a=Q4-j1AaZAAAA:8 a=jour3KitnczWllB1C9AA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: cXUDUJ03PdtMgw-vQlVLi2PcahPQqYPO
X-Proofpoint-ORIG-GUID: cXUDUJ03PdtMgw-vQlVLi2PcahPQqYPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213752

On Thu, 27 Mar 2025 at 16:30, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 27 Mar 2025, at 13:55, Dmitry Baryshkov via lists.openembedded.org <dm=
itry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > Cross-building of mesa requires us to be able to provide target-specifi=
c
> > value for --libdir.  Update the cross-environment llvm-config patch fro=
m
> > meta-clang in order to allow overriding the --libdir output.
>
> Is this actually needed now that mesa uses Meson and we can (and do) expl=
icitly tell it where to find llvm-config?  This is obviously a horrible hac=
k and the meson/llvm configuration should be sufficient to do the right thi=
ng.  If it=E2=80=99s not, then we need to talk to the meson maintainers.

I must admit, here I mostly followed the existing approach. The
problem is that Mesa queries the llvm-config and/or LLVM_LIBRARY_DIR
variable instead of just using get_option('libdir'). As you can see in
the following patches in some cases I manually patched mesa to use
'libdir' directly.

Maybe you are right and it's better to drop this and always use
get_option('libdir') in mesa's scripts. WDYT?


--=20
With best wishes
Dmitry

