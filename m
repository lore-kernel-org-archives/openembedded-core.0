Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4339C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 13:03:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.6729.1750251778868440520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 06:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kIJcvYI1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8Yt7b019132
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 13:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XkFx4udWg3cp/AyphAGeynWP
	OkewF1gC4n2BaKB5pDA=; b=kIJcvYI1fDSvIWZG61JjOLCepTvf2pWItxgr/l4F
	GXwGA6hjrpPK5rc4+UrC9kLk6mVEXW31wDOOAPcuKAyaDHB/QCk6jj3ZfoPIb6Iu
	zaBLYbGyAU4o3WO+VrJOKbTG3nb7W+EiDlskvLlacBjPh+CuZQt67sZce4zHCIGM
	I2JRvynkDUjLXT7xFXqFB6XALE24bLEn/ykuynxSfezh/ARIq9Yg3L2EUp5Tc2h2
	mAVzJ5RnnjJSuUvG0WFaASogtnXTNu7HfN+fpRzNLkK2ew4KwQzEyBXoU4Wtki98
	D0fns6QEEmawYv7CjAW811j4+nJ8BVIXG0NqJ5wElQ+Maw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enm3uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 13:02:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311ef4fb5eeso705491a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 06:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251776; x=1750856576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkFx4udWg3cp/AyphAGeynWPOkewF1gC4n2BaKB5pDA=;
        b=l+0SwW89GZ47M6x6NVtlMTjtrSERyyLdY2pXEfPF3CPoSNJBZvdMEpCkCr8DSa5knv
         W+atS/3AKC9pvezn79e4OK4zmv3YsL1OqvoGhEgAy2A+NMImr3ZyKo14p3k5mI0MPj5S
         Z6bJ5GDuSVW6JWL86f4xfYb3bHnRthWg1KqeXDTz08A00Cdhy8PPoozX1pBotkW9ebPI
         QE8mzenX5mNH29AnKF1x5A+m8sfnX4AbovQMZh/VLOd2gfqxMpDOg8VqJuhw9ylrlNLy
         70C4ZfXtISvCJIW9QO/BHq7Wu95B162D8MXGLrr/ywPDbwNQf/et3ujC+AJ05vS68dwR
         zCPA==
X-Gm-Message-State: AOJu0YwZpKN51HV3S6XWwOniG6oAdBkzAhpRwwavKxKYHZ6/JB7hhQN/
	m1UY3/vUQl4I89JPcePi8vI3VOmSQKQ6hzrFFvqogv3A2wLsY2lI3SicGews5QtYM6UwTcYCyR6
	5MiWoIjVU9rbQLrNljpSwIPDlyd6wi2W2T/3yltL7560VqELRNtiIuYhJT7NXZk6LcBCTpkaZiY
	yJFAFzXWOLWOuQGDUYbgiSEJYgBvhIAtolRFVGZy4r7yuwm5IP1Vm429Y4rIC0rwWQB0Yb
X-Gm-Gg: ASbGncslEAG0GI230ZwIwuhRrV8YeQmzoibIBo9Cc4lASN5ctrqNCN3mPlb4fHO8AOX
	ZimEtqmgTJvs9wWy7j0DTLD53zB6UgwbKkOxU0M/BL0IobvnRk+QcXbX2GdhyJFEd21FFDebrG0
	vR/A==
X-Received: by 2002:a17:90b:4c86:b0:311:1617:5bc4 with SMTP id 98e67ed59e1d1-3157c82ac2emr3679235a91.12.1750251776146;
        Wed, 18 Jun 2025 06:02:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGra9esRoj6ghnKHeSUmqLa5BbMEg1KepTFHAzVG9/UHzfaZWeu9roD345s2UR5gL9jMzVStj9ZE+sTwYtO6+k=
X-Received: by 2002:a17:90b:4c86:b0:311:1617:5bc4 with SMTP id
 98e67ed59e1d1-3157c82ac2emr3679196a91.12.1750251775633; Wed, 18 Jun 2025
 06:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250618094550.1335521-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250618094550.1335521-3-dmitry.baryshkov@oss.qualcomm.com> <DB5PR02MB102133C566C13BE6F44D80629EF72A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102133C566C13BE6F44D80629EF72A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 16:02:44 +0300
X-Gm-Features: Ac12FXzZMXhmtHu9VZO4ZMLAxiw788j7TKjgDQsrQaK3r-pDu9rvCX3eCnAGgRM
Message-ID: <CAO9ioeWVwVDx0UWJmQVaE_pF7g+mokFSPXb5B3dJAAAL63Ox-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 3/8] qemux86: drop duplicates with qemu.inc
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: JaE4plEwG6ClhMoSpCrzH6NGEKzVgnF5
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=6852b901 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=3-RhneuVAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=KM7ge_cjLOoro8OB2ZkA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=VLVLkjT_5ZicWzSuYqSo:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: JaE4plEwG6ClhMoSpCrzH6NGEKzVgnF5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExMCBTYWx0ZWRfX7hulz5G468tf
 /PHXSH8Yb+8rN53EXTCGkanld5vIVuDFc2FSoCuZVQW8Pm2WyvGT7+Wkka7iWaM2Le0WGLvMYp9
 zNK2wouBizyHtDpImwHNlf5NzEGNBDWTrY34e1u43Xba7VhpOGiTug5rZ98e7gNzm2ybpFOgfPG
 mxaJPM6RMXayhxAUliDEZ1dL0NshpAumWmctL+XReGn2BA26y76odDrkKI3r+wsiyWZLtys04zN
 CT16WbCnjI0xR7wJ99izafL+0r+T9KaWqh1jFQxqYK+jRJ+El9yCflnUJGPZkIJRWTgIEQv8NNp
 8LnRgec7GnN0yKrNe7fZ/++IxwtGRNUpMCZX2pZB3f63uElo1spwxXIIMm2g9JalXc+GygGUSQg
 IZgIq/dRFnyn5LmmVR6RCZu5MlxL7HzQYZgxIGaNZl6XFFlMVB2vDW6BrQiNiYhT7xfNVlH8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 13:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219009

On Wed, 18 Jun 2025 at 15:52, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Dmitry Baryshkov via lists.openembedded.org
> > Sent: den 18 juni 2025 11:46
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH v4 3/8] qemux86: drop duplicates with qemu.inc
> >
> > qemu.inc already includes PREFERRED_PROVIDER values for xserver and GL
> > libraries. Drop the same values being set in the machine config.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> The subject and commit message for this and the next commit should be
> updated to reflect that the duplicates are in default-providers.inc
> rather than qemu.inc.

When this patch is being applied, the duplicates are present in both
places. But I see your logic, let me send an update.

>
> //Peter
>
> > ---
> >  meta/conf/machine/qemux86.conf | 6 ------
> >  1 file changed, 6 deletions(-)
> >
> > diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
> > index 1e072e1ae285..51f080bd2a51 100644
> > --- a/meta/conf/machine/qemux86.conf
> > +++ b/meta/conf/machine/qemux86.conf
> > @@ -2,12 +2,6 @@
> >  #@NAME: QEMU x86 machine
> >  #@DESCRIPTION: Machine configuration for running an x86 system on QEMU
> >
> > -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> > -PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
> > -PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
> > -PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
> > -PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
> > -
> >  require conf/machine/include/qemu.inc
> >  DEFAULTTUNE ?= "core2-32"
> >  require conf/machine/include/x86/tune-corei7.inc
> > --
> > 2.39.5
>


-- 
With best wishes
Dmitry

