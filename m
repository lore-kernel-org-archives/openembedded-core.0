Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15766C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 11:58:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.44974.1744027094363340744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 04:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RaYh0H3F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378e2rG010581
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 11:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5eiONigq1mdqn/y22Ql0lae0
	4W8Q6e78V7HGpd8vY0M=; b=RaYh0H3FYS+Z5U0uGzBZzeL2IoAcFRDwwkHB8LsC
	qa+jJaIGVfzYvdzWSb8W+SQAyhbrBpsSaffQr9Tp+JcyQoqkUvRYzCXTyFYL60QW
	pZ7yUzJWtYpsID+u4qZ94NJ/6ja2YgjM15e8AM4v+NJkoRUgP9tjw/VohmfmbYVG
	rAn9UZ19UGwJUkaWllLDcLQYDg7Jk4D0aYCdb4GvbNpZDI7ErUh17t6yq/4EDFXj
	B0+ywV0jwMtviZEWi2EcQMpw9VaIsbY7B9IOKF+yUb/FS00kVRkRX5zBDB9YVij8
	LXKsmMwTKJDw54qkgVknlahpV75s5XRJrcn+Ib3ZhvpraQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuc4r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 11:58:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-306b51e31c7so1441123a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 04:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027092; x=1744631892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eiONigq1mdqn/y22Ql0lae04W8Q6e78V7HGpd8vY0M=;
        b=HLswigX4I5jB/IMeJja2PytuYqXACAFa/4F47rw+yzdHS8d5cA8x/0fW/tpnWM+A9f
         21GvGxQvHmJBi7xK93qkIrO1DlfgBMNTUwBysJ1b9Rsb0MHl5P95f56QyP4YQcQMsUmy
         uiJ0YJAoxsDBhL28FyOD23SOIBSUIBp5OWNz0owZfl4yzIgMLFSwa2R7ZqtoIJToIVhp
         r3tBmea8glnw3Zk88DC4Cd+QEUqcKmQuVxkQuJqgbpDogiRREgQp2smVwC5cOZd3ioJp
         X/3/CvogYFSs/n8hfYUF7CJWkKnCdFBV9Coz8vnPEgHHhgY3H7noXHGjhtXhilJSzCxp
         WmaA==
X-Gm-Message-State: AOJu0YzlyhQM7+xs6PkU4gEc3XjJxFsm2s9zCjyVHMO5tRSquj+iQQ9o
	ZW9MfhlIUQBobZ2vevgkdV584+SxvJKJiuxTfVrWMCU8KkVwI8ZvUlknwv1XnH65ftkZDgt8XeJ
	vT6F5K4QYsX3bdXc9avF7A78Eyvhl35VcvPH1h4Gq1vlLmobVVRlqbfIjQK3DcDKnrbfcj4Y9gv
	/qVQPJLLL5PtcbC+sXZN3JdBq5NDzzCC0QPxweWoXLJUcJIinQcy3kUW+tEirjsa7X
X-Gm-Gg: ASbGncsTVj2i4LH93msMeYCczCfU8/O6nuM3qByk+NAaAV939niEyMgTg9E/Olsy8BR
	31NGXGPrEZoexgWttL0mGSxXDI4Lm7AsiWs/5AJqzCnyH+Mm+k1E+EvzCxKGPpf61MOs81SLhHO
	Xl96PYz63Ht6I=
X-Received: by 2002:a17:90b:582f:b0:2fa:157e:c790 with SMTP id 98e67ed59e1d1-306af6e90d7mr10068351a91.5.1744027092404;
        Mon, 07 Apr 2025 04:58:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuwDKkG1DaByvTG6gxOBvPgzKdKqp9sAV+WwbHzAIfbF4VP38XOb6HT8oRr/nLyOw7OAbBaPJZstfHXI8tt6g=
X-Received: by 2002:a17:90b:582f:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-306af6e90d7mr10068329a91.5.1744027092069; Mon, 07 Apr 2025
 04:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
 <20250407-mesa-25-v6-7-29bf4cae8d28@oss.qualcomm.com> <CANNYZj-wiJA=7DE=S8R5FF+APWNRxCn0WtP2hoaWOkAuwHu8Qw@mail.gmail.com>
In-Reply-To: <CANNYZj-wiJA=7DE=S8R5FF+APWNRxCn0WtP2hoaWOkAuwHu8Qw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 14:58:00 +0300
X-Gm-Features: ATxdqUG2uAUELiASaLBw9CHpFukUDcGurOMMgBC_X_9n3dIhG6PXGaEwantCXAU
Message-ID: <CAO9ioeV-xPhbMB8=O14yPue7D7gMN46_GnF4zkBjKxqPsswPoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 07/13] llvm: forcibly disable __isoc23_strtol usage
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: agl_pubWOKWBG5uLDotfpE5QbTX_eRu1
X-Proofpoint-ORIG-GUID: agl_pubWOKWBG5uLDotfpE5QbTX_eRu1
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f3bdd5 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=iGHA9ds3AAAA:8 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8 a=1gi-Yby0Q9lvRgEt9MUA:9 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=734 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 11:58:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214455

On Mon, 7 Apr 2025 at 14:22, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Mon, 7 Apr 2025 at 11:48, Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > In the multiconfig builds the llvm-native build can get reused from the
> > sstate cache with uninative being bypassed. This can result in the
> > undefined __isoc23_strtol symbols (which are supported by the uninative,
> > but not by the host library).
>
> I don't understand. How and where is uninative being bypassed?

See [1] . During multiconfig.MultiConfig.test_multiconfig there are
two additional multiconfs. Both musl and tiny end up not using
uninative. If I understand the issue correctly after reproducing it
locally, multiconfs end up using llvm-native from sstate cache, but
respective functions are not available in host's libc.

[1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1374

-- 
With best wishes
Dmitry

