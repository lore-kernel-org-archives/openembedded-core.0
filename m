Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3648BC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 14:56:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.50623.1745852194108100090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 07:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=mG/oMjRj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SCtFR7012966
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Qohlx30skpisUcejEQIkkZR9WVz5vso6mqyEvihqZ4=; b=mG/oMjRjtRNi519U
	W0BKWLqkSy1vkf9OP8bz2envunMX1T3ATzNoCsZQGTng7zZ0QzZoGXKU0N/K9d7f
	R+cHFKPANA3cafJ4INU5mZskkS4eY6ldczf0OHcIHoHNA2mRej6MJXO/TwskEtmR
	obFueo4rTonfkVx9xE5e1j+H9Y+cw/8h96UcDyPJYAm2C5FS+PQGb1N4OAcjd7f9
	uua/C2onS3E1xXGNUeJEhqXs7oVedqerLXpcYHIWP2ektd2ZdLKwPnoKzVbOmbVZ
	03UZfdJMmK6tWo1hcQq7KisgSNXdKIO4SiHDUQzvwbAs4lmhnBQZVsSOf4xL9v2j
	KhLH9A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5gnu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:56:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff8a2c7912so3738638a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 07:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745852192; x=1746456992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Qohlx30skpisUcejEQIkkZR9WVz5vso6mqyEvihqZ4=;
        b=oWJLytp4tKXyxUF+nijWTzB7k9IZLOehp1nUHCPI99cAEB1nBrx6gv0bSaoXhKfnxD
         RDF0gfM2bTgD6Tawa7PKAX7SqsfCAYFR5AwAZhXY7kkHGx4HYiZOrUeCqiAH8bRh+owu
         cfoqEL9IxNY/Fw2QiVsUQoADpqR2GzHoeelC/mqylr2T0tbgSTJ6xmO3PQM8bZ5McQkQ
         sseAJtsXzgl8yTltWFAWxjPuTmX5Hsr/3PiSEkgGqLzeDAsVBpNAFRYQSm1UuWeL/b6c
         0xV4w7T60sYNzjDr4oXc5ZAc8fREQpih6SKa280XaQdIhGd7yjzmTWVGQ4bdVrnHUU3q
         lwCQ==
X-Gm-Message-State: AOJu0YyVH1bFmH2+Xl6n04IwAKUjMLVPK4mbtir2NqqM8pmPwl17ZqqT
	cE4cqdntgPFuSr5LCI2OTUlpOcdhFa71Xtb83KBG1NaZTjX0CQDKILY2nc1SebXmtgHix9YtnWu
	rM8Ynd2oJWj219UPQuwTtrNLZA96xhSuAMoGTkhV7/DW1FXKluf3vQijxmznQpR3H3kL9PDAITk
	uE596PKYYbPrInKSQ7InrZ/v0tD9Vn9SlGL//dURppguDMbxIfdINWylfA7W7+Eg==
X-Gm-Gg: ASbGnctCX0zu4lNlYAIYvsUCPJkhwjQkYgmtUbsIYOocdAkO5zq675O03q9KFr3zjgk
	/+m+jpJ/9mP2A4AJVgqJfjCrAvli6YkP3JV1lHO/gDGxDxKl1l7wSKiVn/gWGR7vQLUMdADQSej
	W5/5YRFoHsdKwTs8nnaS76J/0=
X-Received: by 2002:a17:90b:4d08:b0:2ee:5c9b:35c0 with SMTP id 98e67ed59e1d1-309f89accd2mr16465867a91.9.1745852192293;
        Mon, 28 Apr 2025 07:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhBSXiwHLIpj4b4Oa936rai/h1RiQ2OYQ+oOKGfeBNGep28kScTunEDb4K19DyJ0XL7bdkO4ZPJ7PgFfm8P3s=
X-Received: by 2002:a17:90b:4d08:b0:2ee:5c9b:35c0 with SMTP id
 98e67ed59e1d1-309f89accd2mr16465839a91.9.1745852191893; Mon, 28 Apr 2025
 07:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
 <20250426-clang-merge-v4-8-42d205904261@gmail.com> <tims4g3kpjke7bfqfbvx2sfc5y2avhiyixn2sm7cgvwmwt7lid@3il6kjlvkpcd>
 <CAMKF1sq=x6caiTm_ixio56zVsg_rjLR9189vKHkQKzF7hD6HDQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq=x6caiTm_ixio56zVsg_rjLR9189vKHkQKzF7hD6HDQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 17:56:20 +0300
X-Gm-Features: ATxdqUEJa7FD5PCsDlkmmoc-flnxVF2sl4wgwwEiFXxrcN6BVMsz-g1_6bMRP70
Message-ID: <CAO9ioeWvPcSRt0kRNiPpnZQU+QDfMc9kbDZ_+PgzpLuzQJSbqQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] mesa: Pass needed clang flags via BINDGEN_EXTRA_CLANG_ARGS
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 6_33ILhUw70GTmitS68rSTiJ-PdALJFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyMyBTYWx0ZWRfX9R4GOsqfA60K NgQxDk4X8fwtTgIRf3VoKZVGwUf+MekXDinIeBQHTcxo+sYgJMg1TPpe+Bwxe2YB4B0/hDhQ9ix 3nTnH3W2nwKtpVOw2BY9lTHwPWY/8om6XajF2kDbP4eheFcjOXDUBeh21KVjbL+PxCQ/pWo9cIM
 BoQd2/uDxHW936456gpZtw+pxOKaDgVoLsVWlFqMPOOj60sm3gjxuuPDE4TYB/QfgP5qbS1GvjO BPmsiAqm42COu99fMww4xc19jWaU72bvh3rnmYSKWy9/FNhzyCAH60iZArm5F34HsJWncBUo3DF ZU/QTlSg2Hp4ca65XOW4YHqnNtBbsB68A0YFg/GD2//mL6oxAuL8wAKQUR0cuwYevmCSw9A+vDS
 44a+x4r3Q1nShNZ2fn4zqbt9GiAy0Fx0h6rMexBv4kG/+OqHfFDHOM46G71NHBTzIEfJYyMV
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680f9721 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=iI0CZyxFEQmHUC52CcUA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 6_33ILhUw70GTmitS68rSTiJ-PdALJFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=667 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280123
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215615

On Mon, 28 Apr 2025 at 17:51, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Apr 28, 2025 at 4:03=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Apr 26, 2025 at 08:16:47PM -0700, Khem Raj wrote:
> > > This is needed for clang to find the c++ headers when invoked via
> > > bindgen
> > >
> > > Fixes
> > > | /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/=
mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal=
 error: 'cassert' file not found
> > > | Unable to generate bindings: clang diagnosed error: /mnt/b/yoe/mast=
er/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysr=
oot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file =
not found
> > > |
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  meta/recipes-graphics/mesa/mesa.inc | 4 ++++
> > >  1 file changed, 4 insertions(+)
> >
> > This way we have two sets of bindgen/clang args: one added by
> > meson.bbclass, one specific for mesa which you patch up here. Please
> > pick up the attached patch instead, it makes sure that there is only on=
e
> > place to specify bindgen args for Clang and documents the reason for SD=
K
> > packages requiring special handling.
>
> This is breaking mesa-native recipe. Why is bindgen invocation special
> for meson? we have other recipes in
> e.g. meta-openembedded which pass this variable from recipes and have
> finer control over
> recipe types that way

mesa-native worked for me, what is your build configuration?

Putting necessary arguments to meson cross file was a recommendation
from Mesa developers. I think we should follow it instead of patching
environment variable in recipes.

>
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

