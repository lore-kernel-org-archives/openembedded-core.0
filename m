Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF87D3E76B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 18:00:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2321.1765389614400631112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 10:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=khRPYIu8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Dtww2I8Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAAU0sM1603105
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wFAl5wn6wZApiBjkvGwX9bG3
	/FZolBOZm+LDJoJieII=; b=khRPYIu8lo4vdB5hcExxZcge1xj8dm/U7mk+1C35
	iR4KftOwk6fNGVV41evP3Fxmt7WIBQx6+Zm6eoCkYMU4IRjT/sD1YjtiOokoecS9
	drraP920c/LZKdpUG9bLKFilajzlySIvsnmPoyYITZR2aXoFsEnKe9UlJlLWWQCG
	s/ED9+SoS5HWT55gcPnAah1YophYqbO+m2r489sHmdnvGwEgTb32MRexFniU1CSc
	XL8y+7eJj2G8I8KZQKoFNjt9aODvtkgU7oOmQ12r44s7BXa32SfLpOOW1Kk1rYIz
	uJx0MW/TWX9bTOGLv07ZMbICh6O+A9isqrN8Ld9rO1RbHA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay75q9epr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:00:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340c07119bfso217449a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765389612; x=1765994412; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wFAl5wn6wZApiBjkvGwX9bG3/FZolBOZm+LDJoJieII=;
        b=Dtww2I8QpKVGEs42to9IpUUCOalq54D0yRugjFoWhKt+UXF47IcosfWoTCLVPoEI9v
         weNFRYd0K8bvJtChXQcnP/OTcfdRoVLzfXkVx+Mq5ziac7l+EW3luQ9WpqNL98+K8ad0
         CBeXSicbmRvfPkI/LK+2FbOb93V0/9BnZaBgaHHpfkGOlUj2CklTF1w2g4yTO08iuLTD
         Zyke1rbMlAvgdvep6l+ljjq3EU2iJFmCxh29lRedw+y2oO9eWr0VHtz9AG9zaSMxstHT
         Pj/0MpH7kpXoZvcu7bQ+U7/ECQxaO1HfirwoC8e70z+nwyHEMAM82QXLWCU6VkDm14Rd
         jLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389612; x=1765994412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFAl5wn6wZApiBjkvGwX9bG3/FZolBOZm+LDJoJieII=;
        b=Gm9x6/fIyN8rbJ9iWHH4PjjInoWeiijrFvmlywNyoK53SYwmtXD8pUJqjnwyAsaFCJ
         A2FOYFRihEUgcM/o/u5uTyX2de3miLTyv1GPep6akt5fjf3Ff/y9VdcIZgL+BJeOUa69
         CeDC8MoFZ58iVHxNSTw+GGkQ+g/fiCQeC/9UO1gBv7DX1EJjoq7lD72XkdN7pNbUO/OF
         42Kii25YML4ygtrwsHeWLxBK6yt1H2P6l6+7iNcqt3soR8a7WDyDcBORI5v3o0h2oMjV
         YqASJCRAYTidB7FxLOYZSQopslKDeR9SwG8VWViMehWjmPMUeNhneEetRs6ZgQkNgltF
         +MfQ==
X-Gm-Message-State: AOJu0YxigR0OwRyEVYgIoCYUHYbA0MilxUzgE+JhC8iHIFyNpAZX034v
	YZKYtEUVSxAxsMLgOYm4YYEJjJYEIFBtVH4oMOrFY9j7bowe3T1SLdqS3AjDHsxkx+LQW2FhjP3
	PBfuy07dc+ydDRUVEW0veusncvMs9SDoYxcGgXPjpxsBAEH+2KSX+EBibObL+pGz8qe2skk3qzk
	c11vUYjM8I2TQ93bipqffKZElyHuu2N4xXDttTdM9O7E7milaPfbgymzR+9LYub1caXQ==
X-Gm-Gg: AY/fxX6I4sWmPG0PIqBIk1K00koyEHppvaz0BQ38ZOaJaBscfYdWJ2beTOA62/puDpu
	JHa7juX4KXtFEwQaN9LbHu+l14XjO1L2LiLgbilGrroEeXRt03QPIfirsb03gAv/1waQWGlXzAx
	eRtKFo339UrXX6eMZWh6X3EM1XK6DBvW/UVkZufmQDBnuCk6pO96uKNCK9gIikARJQLtFnBm9tg
	OynVA+w
X-Received: by 2002:a17:90b:4b0d:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-34a728a1d1emr3029124a91.13.1765389612247;
        Wed, 10 Dec 2025 10:00:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaJw5gNTtf/WMIm3YA+lyGWYHGMaSkpxP7EPjw+wt6y58nTQol1ZERqag7ha09LPDWVKvONaD7LScW7c+zI2k=
X-Received: by 2002:a17:90b:4b0d:b0:32e:a5ae:d00 with SMTP id
 98e67ed59e1d1-34a728a1d1emr3029061a91.13.1765389611540; Wed, 10 Dec 2025
 10:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20251210043728.847548-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251210043728.847548-4-dmitry.baryshkov@oss.qualcomm.com>
 <DEUJN3MKRQKB.3HDWIDZ835RP7@bootlin.com> <DEUO1OQO7N35.1HMYKQAHAWR3A@bootlin.com>
In-Reply-To: <DEUO1OQO7N35.1HMYKQAHAWR3A@bootlin.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 20:00:00 +0200
X-Gm-Features: AQt7F2q_4q8BKTYipUPUgftZQPZc2dFEsA4GBypCDirMCIik06m4MrrWZeAuzUk
Message-ID: <CAO9ioeVhFtK9C=ojUc-oDGrCzrC6YWHZPRRP_+vAGAHEr8mSgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/4] mesa: upgrade 25.2.5 -> 25.3.1
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 4QB9QjDNJ9yIhMOomAheOQDyk0l6RTVG
X-Proofpoint-ORIG-GUID: 4QB9QjDNJ9yIhMOomAheOQDyk0l6RTVG
X-Authority-Analysis: v=2.4 cv=NtrcssdJ c=1 sm=1 tr=0 ts=6939b52d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=LcC5-ItTgs3dqIkAQuoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE0NiBTYWx0ZWRfX2UocgF2aI9HD
 amzTCVQ4iaH46ed8u8ItP8GiJdAF2ggD2Loi3Us70XwqVwt9qfp23deqtRmkHrgRLmAH0/YRUsS
 PV/xbYcU6rBeOvHhyQBoMShbt3pFlww2gyKOxqUE4Cir1B5+f0byAHnQKeWKNGG8Q5fltvgD5qP
 YwRZlrbU9mz178NuIeNh+Keksy8SWTPdX2+/8Jo6MmU1iTYB+1e/t+xSTRLE5Huxh9/vJtLCRke
 j4xe6AVGeccSRPNXMHntGrdnnMSkNXy8rTx3rBSLbgUPep9V4VcI4JgG4ejiWOXStaL4ikqFLVv
 Z/wzQHKEK5zCmJUrhE8uEEMrDA5KXLB6uF/Zlk0YzniNrd1J69MP6pO/L44WamikBYiXOyWIC60
 UZVEtzJeb82OHqmqpq2jWPOzGK8Oug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227493

On Wed, 10 Dec 2025 at 18:10, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Wed Dec 10, 2025 at 1:42 PM CET, Mathieu Dubois-Briand wrote:
> > On Wed Dec 10, 2025 at 5:37 AM CET, Dmitry Baryshkov via lists.openembedded.org wrote:
> >> Upgrade Mesa to the latest release. Drop VDPAU tracker (dropped
> >> upstream). Add support for ethosu and rocket Gallium drivers.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> >
> > Hi Dmitry,
> >
> > Thanks for your patches.
> >
> > It looks like the new version is not building correctly for armv5:
> >
> > ERROR: mesa-2_25.3.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/qemuarmv5/build/build/tmp/work/armv5e-poky-linux-gnueabi/mesa/25.3.1/temp/run.do_compile.92740' failed with exit code 1
> > ...
> > | In file included from ../sources/mesa-25.3.1/src/virtio/venus-protocol/vn_protocol_driver_cs.h:11,
> > |                  from ../sources/mesa-25.3.1/src/virtio/venus-protocol/vn_protocol_driver_types.h:11,
> > |                  from ../sources/mesa-25.3.1/src/virtio/venus-protocol/vn_protocol_driver_handles.h:11,
> > |                  from ../sources/mesa-25.3.1/src/virtio/venus-protocol/vn_protocol_driver_structs.h:11,
> > |                  from ../sources/mesa-25.3.1/src/virtio/venus-protocol/vn_protocol_driver_transport.h:12,
> > |                  from ../sources/mesa-25.3.1/src/virtio/vulkan/vn_ring.c:10:
> > | ../sources/mesa-25.3.1/src/virtio/vulkan/vn_ring.c:18:1: error: static assertion failed: "vn_ring_shared requires lock-free 32-bit atomic_uint"
> > |    18 | static_assert(ATOMIC_INT_LOCK_FREE == 2 && sizeof(atomic_uint) == 4,
> > |       | ^~~~~~~~~~~~~
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2673
> >
> > Can you have a look at the issue?
> >
> > Thanks,
> > Mathieu
>
> Just a quick follow-up: it looks like the issue does not come from the
> update but probably from another commit in this series. I dropped just
> the last commit and still got the error:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2675

I've sent v3, fixing the error. Indeed the issue existed even before
the update. We didn't have the driver enabled.

-- 
With best wishes
Dmitry

