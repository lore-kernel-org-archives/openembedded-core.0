Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518CDC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 11:21:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.31887.1744284079719232784
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 04:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=J6OiMpo3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75d8Z000661
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XjwLhx05a1ZlLesP5w2CLHAU
	Rm9pB9nWQ6qhtKeOQo0=; b=J6OiMpo3POW0k84MMvPPlitcRNJTKoCzmcPItnRb
	jdJi+CNFUtPDQGCGLaRJfuu90TtMXlR9RV5vMea/Ti3Rn5CGhBugZBia7k8c+S9s
	MSnHFzPDlfD8DMFZAcrACWfdNUjsGC9d6J+dQQi0EZdyyVPLWbDiwTUOfrdVnL8d
	xh9ak6GH0OHm0WuXaHKKKdLpWZ7medykkaiO06u5ZzzNNyj7ctU2skkQ4axPhkIG
	JgSVb6zYRdGzydKfsTA4IL2/MJ5KQtE8CXagNCnvwc/yv+dFFBwnwpmQBkr4RWQQ
	+qZASlqxojNhAgqAOHu8TsaYWH1lh879CJoU+0OGp1PpgA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2xp72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:21:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f99a9524so17714736d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 04:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744284077; x=1744888877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjwLhx05a1ZlLesP5w2CLHAURm9pB9nWQ6qhtKeOQo0=;
        b=eXxGGDA+OfQBi0wB/Bpn9S0pW+wAQJQCUtuHP50C2kz9OypAogCbPKGOEkM6i9a054
         Lfg7OAx37JULOzAFBS1k38DpF9cnApBROk0vRBQqxx3AezKQ/FG6BBfc53iTgeLr+KZD
         /xIdxLwcensgpYK2fPqdzUmBq5lXfdOxf4zCddN/T5TpCQDZ5PAM9AV1cRm5Kw/Imktm
         PIj3MkWreDk0ZS5lhzZb8140d0LN0nCgYXwmEhN0TDLDNtiosry2mkAYQbKjFTTPv9Y8
         7xe7eozy4W690yXSDNwo0Gebry6gsAZbP9TwC8kOIV0VQfp9+ZtrsAuJsVGf35NNOYYh
         RLvA==
X-Forwarded-Encrypted: i=1; AJvYcCXxpU2Pu6EJlN09/NPpY89jhkFTSnX8o+54NRdA/0FgaLcLMHm2KsVW6NtALK0uc4jTP1Fqm/0WzBv9V52+E2PMgA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwcBYxXQklRqvaVb0I9ldC5IT2pLuPu5SStVHoCjiOOoKYTSYwU
	KrTrs3LJxhojdPk4Epfq/xyJO+TcP6NQ6WrxGRCI+oiw+7ZMjpsH6Zg7PADWrfysuOFFYJ5vmjf
	LfMVlQa3uSVZpyDAt77e9awUWzVKepgiTah4Supjh8EIthXcC2xQXpLInSELZue1CB++EUpXw9V
	PMQGA=
X-Gm-Gg: ASbGncuYIXWT637QcBtYOVj9qBGE+YDvhzpwYuYtRhYAaaRHbiLUuTUgcfXfpSC/MK+
	Z0CGI/Qed8HCbauiL4gHQ2u3VchQR0oGjNvwu82W7RWkhKWrRePTO92vD9h8Nd10PTj1HbG1go3
	6Vw6zXxhYVZvZhJp/T0T0e7JNdBruBbvcfWapLxFn0WrPF4gpiI/jKrCV5Hbgc8FvRSrNWUcBrc
	82/xT7ERvqp0S9uvpp4E8jlNyDULFI71nY4fFQ4t/lXLx25j6tzxzylJigiNXC1jpgm7Dmm2cXK
	QoiJ1N9OBPDSPDS0JB9JOp/27Jooge4qHKIb96X/m1pABVakPhJ2A0hkq2Avt1ZxAypxTkmJTFY
	=
X-Received: by 2002:a05:620a:240d:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7c7a7684f98mr260413785a.34.1744284077554;
        Thu, 10 Apr 2025 04:21:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+Sj3ZQDwzu6CF2ZXXjLMPPy6bc3YpVxhH5BtwLSxKfK6RZraNO2PUGeREqZ8JhTO31ZaJ8A==
X-Received: by 2002:a05:620a:240d:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7c7a7684f98mr260411185a.34.1744284077252;
        Thu, 10 Apr 2025 04:21:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d51de66sm121432e87.220.2025.04.10.04.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 04:21:16 -0700 (PDT)
Date: Thu, 10 Apr 2025 14:21:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: quic_vkraleti@quicinc.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libinput: split udev rules into a separate
 package
Message-ID: <5xm5ehw5pf5olcfqvlh2t6jqn5bq2uged36gjvoovjj7ihg7r2@fbsiin2cu6wr>
References: <20250406180920.262141-1-quic_vkraleti@quicinc.com>
 <CANNYZj-JtbiNz37guCB_mJbOb19GJSDTpmAyY0_ZtDHr7yM7Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-JtbiNz37guCB_mJbOb19GJSDTpmAyY0_ZtDHr7yM7Sg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: PHQHqkN5dc21Zl13TDe17-al88vMeYZB
X-Proofpoint-GUID: PHQHqkN5dc21Zl13TDe17-al88vMeYZB
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f7a9ae cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=q0G2iXmA-L_sMPESdL0A:9 a=CjuIK1q_8ugA:10 a=0lgtpPvCYYIA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=647 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214645

On Mon, Apr 07, 2025 at 12:04:15PM +0200, Alexander Kanavin wrote:
> On Sun, 6 Apr 2025 at 20:09, Viswanath Kraleti via
> lists.openembedded.org
> <quic_vkraleti=quicinc.com@lists.openembedded.org> wrote:
> >
> > Packaging udev rules separately would be helpful in case other packages
> > need only libinput udev rules but don't require the library itself.
> 
> Can you give examples of such packages? I'm not sure I understand why
> someone would expect the rules to be present on target, but not the
> library, if libinput upstream always installs both.

Basically, we wanted to have a packagegroup selecting libinput, but we
can not select libinput from archall package since the libinput package
gets renamed. It would be logical to make packagegroups / distro
packages to depend on the libinput-udev and then let libinput-udev pull
in libinput10 as a dependency.

-- 
With best wishes
Dmitry

