Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36D8CA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 18:33:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.1148.1755628413571430988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 11:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=a7UpBBps;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGsaBF007244
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 18:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aeYpm5e/CaYrH4rVORMz+j61
	1S+p/TFFQiwaL3G18bU=; b=a7UpBBpsHhVZVkp2PjGR+PlMDopALasFneBEZg9B
	LdKYzQEbwjYXSOdA5hv2E4jJzNk1+qpEGwEvImlJg9s+u+Vbi8YxCpZaQYWCQIzy
	NJKz1+aebXkN537NBCGoZ7c/yIH6APtkfVhKAo64nAFruIubz2uooScdb0lgrGK4
	cJct/CIhwWiTD8bfNAy3ARVS8zu8ouv44zK6w/VshB7ICnjk09pHBOyjPLjxMW9w
	6QhN/2hJ7apvcWFvQVsKFIyU++E9zZ7ZJmPmLsWHKi+4KrrokNB94AKV6dCsc4gB
	ZWY1RA/Bg/dbkK8I2uaadKchCakPdgicVHT88g7SSp505g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj749pa8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 18:33:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a928da763so132261426d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 11:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628411; x=1756233211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeYpm5e/CaYrH4rVORMz+j611S+p/TFFQiwaL3G18bU=;
        b=EG7ToDjvF1p2qMGYz/T0hws4++Uwq58z2mg99JmPhRA9SVPcwm6ofdFzRHXRNM6HS5
         3WXZIxX0gq1wBwVufrPvQgFVZqwXLJXoYBdVsdTa97Z3nmuebsgXgVfOYx/ly8vljply
         g4O7J656G7CN7Y9GgASn7bHeeaM+qW4bkB/r7PG91efGPwBFh/AYeFU6hJnqLfYMKh/5
         ivBWP4kxnFinqK+JA6CxQiEvzONAEWEM5w+7jZiMm7tGpsuxTLcBasS0sEko0AlGLMF+
         HpdyDmUw8QPZS3l299RrstMkxCgsRIIjbQDRf59D1afNAPEEIX+YRNtWFw4nHUfjSCrI
         lC9Q==
X-Gm-Message-State: AOJu0Yw+1LM9jJO5Tq8VFKrge0lYoQqnV8OJFrkVEAJOu0NJRxOeABvj
	v/vCCFfFBsXg+LKE52L4rrKDrxp/MssDoWySZq33+3K8OVkWBBEiKhbuwuuWa9PUlCijbifR5N2
	C9UUr/XchxLmBnbl9YHoNub/jrXBr80YUSib0txf519HdhABJ3sEBbCfSzQALJIIijLe/W3FZXn
	URxzjIVws=
X-Gm-Gg: ASbGncv+3qEoH4Q1g8D7blHo25sQD0iuK2tyhiD8oTfWl6+xSVoKOC2qAK99aEOSmOB
	KWn6Cw4Ph4bpoEgw8/TZ+q1RBpoZTodWbre1Y+aGxHPGgFZtlIwvbDLRxCn7yVwb6hiRsSPeUFG
	qahDh+lXHUTx+gOLt4MCoJ/sZUdP8xKqphMr88FF7yRpnBcYLbaPnkvS9HHd1ok9ta/9Rl0+abm
	w2LHhrse5eUVZpIMOWq7EP+nd1q8kncxU5U1OVFLul6rJyEJKTJGVYstV/hNLCglPJgWjVEUJRC
	uF86RpuguhigW0klsBdwX8P6Y32/A1f86t/wlcw9lkXQtTP7V6B8Atdm7hJAyHju45f1U/pESDQ
	j2DrcgvyAHJ4Kc6dfqDZdBdgyr6/BixN4ZGD/et6843lczqtXYHhG
X-Received: by 2002:ad4:5c4c:0:b0:70b:afbb:d667 with SMTP id 6a1803df08f44-70d76f46958mr693526d6.7.1755628411447;
        Tue, 19 Aug 2025 11:33:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT1OfPYC8BCBZAPutoB9xIp2RoMs0lO2aZFrNAOiTQW5aIt1yqFdIve0zE1gqodGV6Q7t+cA==
X-Received: by 2002:ad4:5c4c:0:b0:70b:afbb:d667 with SMTP id 6a1803df08f44-70d76f46958mr692936d6.7.1755628410805;
        Tue, 19 Aug 2025 11:33:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a473b57sm23355651fa.29.2025.08.19.11.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:33:29 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:33:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>,
        Trevor Woerner <twoerner@gmail.com>, Ross Burton <ross.burton@arm.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v5 0/9] mesa: lighten up target's libclc dependencies and
 fix panfrost support
Message-ID: <4zywwcinlosbv6iemiwcfhnsxcxjj7re6zwl4hjekrszb7nrlj@up7jwnlnwazm>
References: <20250819-mesa-libclc-panfrost-v5-0-b8b89e6af908@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-mesa-libclc-panfrost-v5-0-b8b89e6af908@cherry.de>
X-Proofpoint-GUID: YNZ0OhjOIsulfle7pF6XCxwxK2vNIl5w
X-Proofpoint-ORIG-GUID: YNZ0OhjOIsulfle7pF6XCxwxK2vNIl5w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX9LbNIdYURTQN
 NT1Ptb7efvXWMSbxCFoFhF6IVzMnk3aDk+e9DgFB6YApfhIW7SpeLGYQc/KnkfhTb38uUNPvXBS
 Brfd5Sp3lBD2JjWriDxNYEHE6bvW0rEFUe449NnNsfA0I3KY/T++aXU+DezxKRtVY0AD6dBBOrf
 dQDW99R4Xio9AVWmSSceplcF0sHBsqcMQEIkyaKZ1acDFSGRuPPQDQW8VIuTJDg2yqUvZXnA4rg
 Y8C11yE3QnLx+BrXm/OUL9V0wZHcgR39WpcYSlH4DzeeY65He+oZGgNCeVcwfISlKFAkRABioVN
 pOfweYCgaSJ3hDEPa5XX2/IdGNqKRzs8p12/YCoZOqwwSVu2XlCd/IgFU3p+25Woe4IqXsGQpZC
 hurRtdpe
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a4c37d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=2vK5742W2NiYS6pK0uMA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 18:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222126

On Tue, Aug 19, 2025 at 10:16:00AM +0200, Quentin Schulz wrote:
> @Otavio, can I add the new mesa-tools-native recipe under your
> maintainership in meta/conf/distro/include/maintainers.inc, it is after
> all still mesa?
> 
> Panfrost support has been broken for a while already because it now
> requires libclc which isn't enforced by default. This fixes this
> oversight.
> 
> While re-adding support for panfrost, the build time for libclc were a
> bit too much to my taste and I tried to figure out if we could lighten
> up the dependencies for the target recipe and it seems to be the case.
> 
> libclc brings very expensive dependencies such as llvm and clang.
> Building clang and llvm for each target architecture is very expensive,
> but mesa allows to depend on prebuilt host binaries (mesa-clc and
> precomp-compiler). Those are built by mesa as well, but can be compiled
> in mesa-native instead of mesa, making the dependency expensive but only
> once regardless of the number of target architectures to build for.
> Ideally the mesa-clc and precomp-compiler would only be compiled in
> mesa-native if target mesa requires libclc support, however this is not
> possible as a target recipe cannot impact or depend on a native recipe's
> configuration. We thus have two choices, always build libclc in
> mesa-native with its heavy dependencies and impact every build or force
> the user to modify the mesa-native recipe in a custom layer (as a native
> recipe cannot use target's OVERRIDES). The latter is unacceptable so the
> former seems to be the only option. Another big downside is that
> mesa-native currently builds drivers (amd, nouveau, svga) which we may
> have absolutely no interest in building, increasing the build time and
> possibly dependencies list).
> 
> A third choice is to spin-off the native mesa recipe with libclc support
> into a new recipe without drivers and only what's necessary to build
> mesa-clc and precomp-compiler binaries.
> This allows to keep a "clean" mesa-native recipe for whoever needs those
> drivers built-in (e.g. for testing, for qemu-native, or whatever else)
> and only bring the libclc dependency when required by the target recipe.
> 
> Because libclc is now only built for the host, opencl support now needs
> to explicitly bring libclc and others to build as libclc won't bring it
> in the build environment anymore.
> 
> Note that this was essentially only build tested (run tested on RK3588
> with panfrost though).
> 
> I tried to enable OpenCL support but it triggers a buildpaths QA error,
> which can be worked around with the following patch:

A much easier fix would be the following. Please consider incorporating
it.

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index d38f96429ceb..ab1290dfbb84 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -127,7 +127,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"

 # "opencl" also requires gallium-llvm to be present in PACKAGECONFIG!
 # Be sure to enable it for the target and for the native build.
-PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native libclc spirv-tools spirv-llvm-translator"
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native libclc spirv-tools spirv-llvm-translator"

 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"



-- 
With best wishes
Dmitry

