Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF90C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 11:29:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.32277.1744284568455317659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 04:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DeX9mRyi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75IIu028831
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VSFCWYHqZ2e4LjYWLbZZVxZh
	i9tgfYrWj4xiQFKICEE=; b=DeX9mRyiCdzY86iIY1vYOBj9xKrJtsBrG9Rjo2Nv
	jFviXlqHj80Ha8zyvmbJ6ywBiUYuX1JRmhGUn9Fy3ulDUt9AZSimdWVv0Vdk4vQy
	ph4UT4WFluDr2ZdhMGMFUqU9C4Bqjh0/DTjGoIE19lzsKbdj7y2cUyzvsG2SUXY2
	31HjslVK5QdbxT5ncffoYLDBoh8vrpP2SDPR9SczPJZUkpcXC8BX0qhA2n1wQdtJ
	RqFZ3DtohvcvoFiiBiiR7Unhd7YgB1p89YML1il4Cys2egAtBR0TRRNGHmcxHjnQ
	3HRgwd4ZmMUPPPk1338mNeP6ojamktupGCSf5DgNtL5WRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbupra6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:29:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c791987cf6so157178485a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 04:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744284566; x=1744889366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSFCWYHqZ2e4LjYWLbZZVxZhi9tgfYrWj4xiQFKICEE=;
        b=aq/ihXGjPLvjUFLn0arZD3dt/m8z0/pVShqh4SV3wIn6pEzyEWVwwAikSNALpmcrAV
         Hq2pAsMA/nleMgr0Q9kCGKcCnZwkZ8Y60rWSoySta9UYOuTQ1LL82WoE1UbWiPgV1POH
         8h1aDxKB2WIP2nok9AximdqdBoqZK0qj4y0PcXYCZONJdviKpWiQjv4eICL4B+19MtL7
         YRafjpmr56qdGK+KyamRm2braks5joBtK4DQAQFkhkmXdCdesQpAxgrRWQl1koDYV/pW
         IwMImaq5jKierfx2LY5Xzgbzhkq9nxG7eguOXpFBet0qq8vcRPiiMpRHfWuSTFohAfQ4
         QM0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcAvsdcZ+z47bzkln7VIhMjqC7AIHc+WHjkaGSlYdiK6tHHFWM20Nx1sC0/o6F0Q3qNoMFpvTiWsJJCxqotwbZ1g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyiy7Au3YRR9dD9Gye8MLspjgbKy9CleEenzbh8G4pVdf7uep+f
	l3sApjnMZE2mHvg0hzf/tZys7Wqn3L/qtX0VwhRe5hOBFn52sIPg/mMEkhFIechFUS+DusJLRID
	DqPjydDLpN0vFRvolUeoWZOt0u4/PI+8Bbvr6q3Wvuq3KeKL2ET//G11+txF8oF77Ir4DeyBO+n
	j0INk=
X-Gm-Gg: ASbGncsZ86uK6Qye0E5kOf6ocRPIsIwOZ5OIzp2GkUfR35SNSUdJ/zQuMlQxZuhFd7S
	hwwO6EmwjAdM0dM8aouH/ThcBY1z690blNv++XWdaVW48zYvhfCBx5FGGombT1P/4tRcYFKkObt
	cKI1HNfPYHar8ztDsepOhWIhnpAJnOxwNR8e+mhoMln7X/qdqqowFqw95IUJm+dTY2KEEa8I7oh
	O009acd/KGVOKWBBVN/7dsU+5liNCo0Mv4vHfX0YK0MHZXMdpyiPCvx9hd2cTvtgNP0GuRhXjCT
	4/0VZH239QtFrLQxeZ1gFMULJ2ZmvkTep0UuPcU+BAJyFlFZpx3qBx3mjavglGY0TpQw3vqyNWo
	=
X-Received: by 2002:a05:620a:2893:b0:7c5:5909:18e5 with SMTP id af79cd13be357-7c7a814d9abmr239023485a.3.1744284566703;
        Thu, 10 Apr 2025 04:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGNaWgyUhkCeh3UfZ2PfKG6kDuLA15QfVTiQXwDA+iesTrJEushw1ar+2xCTxIUpJYVB3EHg==
X-Received: by 2002:a05:620a:2893:b0:7c5:5909:18e5 with SMTP id af79cd13be357-7c7a814d9abmr239021585a.3.1744284566430;
        Thu, 10 Apr 2025 04:29:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5200aasm122497e87.235.2025.04.10.04.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 04:29:25 -0700 (PDT)
Date: Thu, 10 Apr 2025 14:29:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: quic_vkraleti@quicinc.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libinput: split udev rules into a separate
 package
Message-ID: <3mmfhxscjnsdpimcrsw72sjvumxh5cnjrntro3ko7etgtjmqzc@slvytxctp6lv>
References: <20250406180920.262141-1-quic_vkraleti@quicinc.com>
 <CANNYZj-JtbiNz37guCB_mJbOb19GJSDTpmAyY0_ZtDHr7yM7Sg@mail.gmail.com>
 <5xm5ehw5pf5olcfqvlh2t6jqn5bq2uged36gjvoovjj7ihg7r2@fbsiin2cu6wr>
 <CANNYZj_7xdpUO9fAtvgqEi07n5CqEHaqeKaAnUjufmS57oTf6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj_7xdpUO9fAtvgqEi07n5CqEHaqeKaAnUjufmS57oTf6g@mail.gmail.com>
X-Proofpoint-GUID: _JrT2UsU6XrJNybo_qTeo12o1e-rF4Hc
X-Proofpoint-ORIG-GUID: _JrT2UsU6XrJNybo_qTeo12o1e-rF4Hc
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f7ab97 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ISKeXBN4RVodPBka2XYA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=844 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214647

On Thu, Apr 10, 2025 at 01:25:48PM +0200, Alexander Kanavin wrote:
> On Thu, 10 Apr 2025 at 13:21, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > Basically, we wanted to have a packagegroup selecting libinput, but we
> > can not select libinput from archall package since the libinput package
> > gets renamed. It would be logical to make packagegroups / distro
> > packages to depend on the libinput-udev and then let libinput-udev pull
> > in libinput10 as a dependency.
> 
> This sounds like a workaround for a different issue, so it helps if
> you come forward with the issue and show how to reproduce it, rather
> than hide behind vague terms like 'other packages'.

The commit message definitely needs to be improved. Anyway, here is an
error that we've faced:

ERROR: packagegroup-qcom-1.0-r0 do_package_write_ipk: An allarch
packagegroup shouldn't depend on packages which are dynamically renamed
(libinput to libinput10)

-- 
With best wishes
Dmitry

