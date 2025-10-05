Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022E6CAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 22:39:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.20869.1759703956483769651
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 15:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=finrmy2h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595MVkL6022473
	for <openembedded-core@lists.openembedded.org>; Sun, 5 Oct 2025 22:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QK5sE3lzNT++fbvq/x2Qkjx6CyRGTC/sWVMsxre1Tw8=; b=finrmy2hMyc9rxiz
	XeFIDuB0eBxRrkzF+IpEVbG48Doulx1t99yMfwa6REcpkGlQ4jQv+HSYHSbQQgQD
	MhsJHUkC50gm07l+pLmHimnO2K4XJLDJ9trfCMFYKn2rqZscy7p4CC9W+1wh6E4o
	eeBHR6EaGLVbMpuyvWC7fiX24g/9oHbTP1ii9wA5U53qGi70o+jQCncwDAvZbTOM
	isl9TaeVliqFNjH26PmXQXUHi7MBwQ95qHMOLPxVtQAztKLcH/mUB2cHfFOIl/sp
	QqkSyBOHagpLScCfj9CoHGqI/O99BhkjB4yhf/BqWwF1fVVbNxPL8ULLOMke/bkL
	qdPtOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dtrt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:39:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d6a41b5b66so113723231cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 15:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759703954; x=1760308754;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QK5sE3lzNT++fbvq/x2Qkjx6CyRGTC/sWVMsxre1Tw8=;
        b=a2947/THAbXnlHt62QmE4nwGV0H/DUL09QF4BYzdBhh+l2CaPhIT7iJ6ws2Ji04eZU
         Y7g6R/vJ3x0EVme6leFSNXEEhAyVbqoOx/8I0Mbt03Yq2+ZpcH5Y+1J1Fg4yELf458Dv
         JZvXhuFsbzftuZ1J1JS1sYzUV1EZURSZoHCB2/nMxcYs5uJHin3aJIyROZk/gJTGV8gN
         x0GN3DtD3mDCnCn2aLwMpq4RVqQl4WtLCeKqQq9SoXWFUoU4LuMatpmAL99zag1h69q8
         V/3bVaHwg5taJ/EhQvMh8zyOm4TcQnZKSNMUghun9N+GCKCslctMVOtT0HFpQu9vvTff
         imSw==
X-Gm-Message-State: AOJu0Yw/M4BDoPDh2UdqUg8yyfdZ93UmJQsHC48vZJn9pKIEEFjLXU3I
	N5thkQkFTT4+Lam4FiGeYNPuOBgtG2UOHGYBvWBKUpj/o0/m/IXKjl5S7m8dVsrXP6uDCWqoRbl
	D3p2n3ZFBVd7GlRTzupedQpe5QOYbN69ST7FGG3IMg+U3kv9ilYlfTqxFsUwP2ZyaFzqqJJ2TvR
	t6yKCBW/a3XHTQhcs=
X-Gm-Gg: ASbGncta0/9ql14MvZTBssKF1C62uP49CTD1T7S7mRkrNQv3cEruV0CCWWSP7xCvFQ/
	CJq4BXMyMZGHWsKKwcd4WbURqTTnfRd11n8rWP3+YHgTe41xLUxjxbvdkb2Qv/mrH4H+KSxf/LS
	Svfs5Iw9lyOgR55vassxpqYrM1D0CUPadBShc5wZQBy4vVYtPEa2+/Du7lGDekbVvlUf/aV/ryI
	rj3gGM5hQkNNNWu4734PignHsp4EPVJp2+f/aWf8KrD+Emq5S7xTPUv19uPFcWFtkb53eNX/cve
	1IK+SaRf6SHhmLX22g0VjFplsrvh1wKl7Oq4D9DCv8hEkjsvEd0Zp4i4vnbKhShDxEbo5uamctY
	GOUKFC1ucI+yGi/Kh30rcRQ55b2Z8PrdgP2yHWsQ41dTzGdTp8mupYouNsw==
X-Received: by 2002:ac8:5fc3:0:b0:4df:2f33:2601 with SMTP id d75a77b69052e-4e576b42235mr123802661cf.83.1759703954087;
        Sun, 05 Oct 2025 15:39:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgObyJ0KieK5yzJF/0sfKM2g2yH6OxKXix0yxGZEb3/8aMilSjypbgLYZk7u5kZMR7nGaA+A==
X-Received: by 2002:ac8:5fc3:0:b0:4df:2f33:2601 with SMTP id d75a77b69052e-4e576b42235mr123802441cf.83.1759703953555;
        Sun, 05 Oct 2025 15:39:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113f46csm4346574e87.49.2025.10.05.15.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 15:39:11 -0700 (PDT)
Date: Mon, 6 Oct 2025 01:39:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kavinaya S <kavinaya@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 0/1] Add support for custom compatible string via
 optional parameter
Message-ID: <h362wbo5qajrlclm7vufccizdu2kceqdlqemoac6i33qzfmjyt@lkalb5fxc5po>
References: <CAA_5yos1jzc55U=Ct4NSt9B+Mf_ES8yx0YKSrSYu9N94oTHc2w@mail.gmail.com>
 <22989.1759164878731751541@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22989.1759164878731751541@lists.openembedded.org>
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e2f394 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=W1o9KpiOoRotVmjblioA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 1X-SKtyIRdxE8nn1yVVDVw51rL5TXldB
X-Proofpoint-ORIG-GUID: 1X-SKtyIRdxE8nn1yVVDVw51rL5TXldB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX2uWnhqgn0DG1
 vguG2G4+re1TjvA1/Ys5rBFjHwnn03TXpzabnogjXKDrpABmGh24bCJt6X0ez9x5yEjK/eZE0a9
 lxNNCPshwDs1aRENK2XsiGaQPsi7WgwzVz/BhQdXEAB4gBVVTjxspsp8OgkiNwMGJepgSPn8BH/
 cF155ctCRby63bA0amNDMYlJD2XfCB/6/idLJAgw7B0tGsjQF4AjpNIii+g/HoYZUZgo0TqAmgo
 PRaRyDStFdCCtYl0Ff0Hw/RWn0KnwD4nHMMAGidk3eKtFsiZ0AacbbwombhZTlJgE/m2WaQRCx4
 76kcMacCce23FU0oklan1ZE/TTw3whjjt8b+DJ7vyiMgQKvzyk522S3n0OBl5XOtRoKucvot3oA
 iHsTMYf1GwWGa+k0ZrkCY9rJ2eZcCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 595MVkL6022473
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224455

On Mon, Sep 29, 2025 at 09:54:38AM -0700, Kavinaya S wrote:
> Hi Ricardo,

Don't delete the whole message you are responding to. How do we know
what are you talking about?

>=20
> I=E2=80=99ve implemented this change by adding a custom compatible stri=
ng for one specific DTB in my machine.conf:
> FIT_DTB_COMPATIBLE_OVERRIDE:qcs6490-rb3gen2-vision-mezzanine.dtb =3D "q=
com,qcs6490-rb-subtype5"

--=20
With best wishes
Dmitry

