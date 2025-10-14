Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992D7CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 15:46:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.197.1760456777942908234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 08:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HZBmiaEn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87VGa022187
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rju8OXMJJLx1HyA8qz3jMQHt
	7OdrH8HW5Z1vYU0fkHo=; b=HZBmiaEnZj5omcdr3g221NCa69V6AUnEKeqqH04B
	BY82O5Oeod8X94wmgiUomE2tb2OddgCvAJPb1I2lgdQuvuozFasJtKR2dGO9YluL
	JO4oZ+zLGTAjRjtwrRuo3DyOGNdyv9aRPJOqfgF2sFyuqRprGpqxjdXobiHhRrKq
	GIpYdRYpwSRW3PXoBFvlbU5SlFwfNAld3+FFgyN2pvj7yjbyJ/L1APRk3800NMS0
	PDot9xQatqWGF5tG4wfbsapDoI8dCU8rdtSw4Rah+HeQIbMLrLaAycAKoHlTuOf8
	if08hPL9+njy7JwYx16HWOmXhlqm8YGLUBxqXXNBeHwyHA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwkckc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:46:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso15057250a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 08:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760456777; x=1761061577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rju8OXMJJLx1HyA8qz3jMQHt7OdrH8HW5Z1vYU0fkHo=;
        b=mTJ+NlzSAp1Kz49MccAJ4TqrUgPceVqSvB34evkST0Ymi7sWNQvO01rHuavOe83HAZ
         QF8NfjkOnBzD8obXIDHJmzcljgGpTV4tLtHJUyeQW3hPCSrLsjhzS5SeIDrKCU6/+ICM
         ld5VnzXxT24moVxqkoJzT30cthpYoFP8w7I94vZJE/YwuBuCxQoxamxq+V66PpKGaRKy
         8CUlP/kPFZE8Hw9sd52J9DWLp3RwYNwwzvAuO7VRg+zC1VIFoqtlP2Prh5D1m33/55sw
         Z0ppmKFIaHo90DPOWlH7F7s5g8YoHx2wFHCY7SwGx3MvMl5SO63jWWo7/bJdoEBamFZ2
         gDCg==
X-Forwarded-Encrypted: i=1; AJvYcCUoe3f31Z5OdNm8gkNfhzBNxnGwRW4RxD3p1s+tin1VJr01h0cPJnxdyWs+9OzOcXoTvDGpX0FpgP7uN6SLVYNb3A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yztr+V8klPUukDeFGlabvKRbA1RZEJ+YdU0PUcW5Lo9jqMdllBQ
	VNu0YdJ08JJQ5bWz/h8zoQMktcb4CcNayl2DB2oOmpkyvTZvBczGxScYzJsxPogrfHxqts1wtlp
	bPGlAEq6CCKLNymgKZROa1z5ky/EdGYdszOJa7KHuSXsHpGkzI0BhZhURuxW4zLgwuNoyiZTlyd
	pkpxDCAB2njwCd1XCSTq99tfa3B4QL9Bb5F2xy59b+U+J6lOXmhEfkDwwXxg==
X-Gm-Gg: ASbGncu+IhG2gwkA/BfxjoW6ez04AJsBzJwlnFvjtiTsQYya/WBTO9fzrOLpmkcwBOh
	lOM91JP57ERBmBEzP30azOIHDA2wZ3Y6xwXn/lMG6WLYZKUGw120p9UHn70VLDxxBijSfP6eYPv
	XkPpxzAl2JvZnX5qKNcXc=
X-Received: by 2002:a17:90b:350e:b0:329:ca48:7090 with SMTP id 98e67ed59e1d1-33b513ebc36mr31832744a91.37.1760456776577;
        Tue, 14 Oct 2025 08:46:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1f2l5XNqjN/YxhyosiEV9Gc9j/NUjdqtAAtGuqwc1214aoP915ImdWxNb5T3o2JMX1KFROKDoKI4+d1BRBTI=
X-Received: by 2002:a17:90b:350e:b0:329:ca48:7090 with SMTP id
 98e67ed59e1d1-33b513ebc36mr31832710a91.37.1760456776032; Tue, 14 Oct 2025
 08:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251010120125.2868011-5-dmitry.baryshkov@oss.qualcomm.com>
 <0E1D022C-354A-4064-9537-8835AB5B5332@arm.com> <CAO9ioeVxazVkNT9Wk5YcuHGAaLUbi9S+XPhPM3tZbZDDdK-3_g@mail.gmail.com>
 <CANNYZj-P=sCLCkjvpCibgMh4fsmu0J9W9bL2_gtFStPwamFfHg@mail.gmail.com>
In-Reply-To: <CANNYZj-P=sCLCkjvpCibgMh4fsmu0J9W9bL2_gtFStPwamFfHg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 18:46:05 +0300
X-Gm-Features: AS18NWAQ_M_RpXrOsyUuDBE74Midqt_2YQ8MYOMyb5bh73NNVs74VeIpI92iElI
Message-ID: <CAO9ioeUV+NzcQU5LY4YLdH+2eSjb_QWMWkjeGVYRTZQ-MCOUZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] mesa: drop useless freedreno-fdperf PACKAGECONFIG
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX72jWsCKJ5VZR
 fhrByiZafB9UqcYrxJi17BwHpdUhsWklkJbuAcWLhhr1pxly1qAnedPinBbA61r1fViDoGgy+8S
 4+GkEMuZfxeSc1vXqz4v5IdcjhlV8KQCQI9Lvgojrdhj50ys5wLXlicWFgmSoCVW1fNFhgFuWZA
 BStrmjSxdwNvx88EiNmZXv/NojvBON5o0l57BNZeqMcmZ3SHm6VQ7JFgvES8CbpYDLzm1wDzgDU
 /AWVe3wr7Ebg4ZA2MiQ5B/KWvTfuLMtz6qCnF6MPWDW9BsQoA4fb+KC80vbsd7jGm4l8W/9JO3j
 ZLHc80vvw8RfZwoX1mSBq0QxNnYLO12z6fdwx+Wth1rodROW61k2CvVZ+7lQ+Qw3RoGgv2veI9f
 qKFQmhQffiPEQO6LDELi0z0rfS7MdQ==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ee7049 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
 a=SMrfV2YZmzO6B9_ShicA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: -PniuYgEuab6LF-F_FgSnRoOM_zyO1Dv
X-Proofpoint-ORIG-GUID: -PniuYgEuab6LF-F_FgSnRoOM_zyO1Dv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224838

On Tue, 14 Oct 2025 at 18:28, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 14 Oct 2025 at 17:23, Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> > Well... It also requires freedreno to be enabled in the PACKAGECONFIG
> > (which is done only by meta-qcom, which already has meta-oe as
> > LAYERRECOMMENDS).
> > I added freedreno-fdperf two years ago, but I don't think it serves
> > its purpose: there is no link between it and meta-oe, there are no
> > config options being toggled by it, it simply pulls in a dependency in
> > order to enable one of the tools. If libconfig was a part of OE-Core,
> > it would not have existed from the beginning. No other drivers have
> > such "split out" tools, etc. Thus, I think, it's a lesser evil to
> > merge it into the freedreno tools handling rather than having a
> > separate PACKAGECONFIG entry.
>
> The mesa build items that require the libconfig dependency should be
> enabled through an explicit meson option rather than something
> floating that checks for presence of libconfig, and the necessary
> patch should be offered upstream first.

Ack, I can propose that patch upstream.

-- 
With best wishes
Dmitry

