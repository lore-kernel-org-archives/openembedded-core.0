Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FCBCCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 16:52:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.456.1760115159635368710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 09:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=VLQPQxP9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFaNua012546
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 16:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BhoVAljq4Eqgtj+TR2x5NgQmJYIEg8zhBQqODwlS9p8=; b=VLQPQxP9Z1ccz+XL
	13Xul4A62eInTqbW29R9/HbEJKt986xDzZpT2V0PYrM7RNvfrP9UxoPabaIkookr
	EqrhS7mP7o9ak/QA9ufR35k2QfoqGoKe64WZDSh47fQ/V+ur+C25YG9X5YDNdY4P
	sLER3wjcExoBicA6sk8YGo6yFUIQyb5X4Whs4P33Ie7fs5DoGTdqmg9TsH0rUsMu
	ov9WiLORQeL2pYyD0vi0fz/m75vHy7AQK04WldwuT2/JA4bV66rjnF2coUkK5KG4
	OmmheOQy+iW3XGPajXLX0MliVw0yg9+kgg9yZlIqHZxCdsLRVpj5BHzPfAP3qLfJ
	Z3RBaA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49q4x1g727-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 16:52:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-85a0492b5feso1252222485a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 09:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760115158; x=1760719958;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhoVAljq4Eqgtj+TR2x5NgQmJYIEg8zhBQqODwlS9p8=;
        b=ixboEBwkpjvcW4MAG5HZMTrCITut2Ys2GDftbR+zj2xUCmQV6KvNvlvJuaJYbegK/F
         gKgkfzRGVtnizCkZC8IkwwuHWZwLPKXcM4XROF8aPq6LQg4KVFWQL06nV+0o42qWrUWT
         XJidYtgJaw80wrXnNgEqkld7EGd1L6TW6qReQDNxIxzwOIqkfrGrjkVDLYA7p3MlW+Lf
         o2A6Ufsd9NCO3KgX8FxHUjTNve6AVzjc4QHCaL6mDN9o77tvVsV/2g6QsgaMq4WH1ItA
         kIOXwQ82KH64nOe9TBwB5p1uaQ39faQKWXTk19kR7o7V+APdk66BO+PdslH8mCpnLS2p
         nshw==
X-Forwarded-Encrypted: i=1; AJvYcCVuWlZ4x1qa90a8gG5uhwHs5zU3UUVMB3dYBgLRiFq7nsYcTaW1PUPzQfgSIWF+obJVqRfqLOAIEefJxu6aVSiZGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzFZuJ+mV1hfkCpUUK4Eq4nqsp0e5qOM3yolRf81Rv9iWSFTUeJ
	/ayg4BLy5VH5UfDntxEopgI0g8k8ldbgNh23avQNRl3yoAh47X83Zs9KDJdylPOnEss4ydAkMp9
	R5cHXc2xjO3haYZi8iacSFA7Z61ekuep8U/tvu0UPwur0ZnNTHrhgrUF5cKzcTS0kYme+TCUQrl
	a2XZvt19U=
X-Gm-Gg: ASbGncvd9uITzXOMxvOxJU++lYRU4UbAkzcDOofvcw4EyfLmzjyiCGFRqK2cLANSe3I
	woz2WzN73gNZVLfTD2b/0UuD3zt0Ou9fS3tMnbCJV7mNnXtseds/IgUcZFSBa52c62QKY+6o1N2
	licmKGPp8XpenQaIcWmXqCIbb3CfUXbd4XNupd8CtIoj3sHCuz+Fub0SzojYY+VO0QEbj4Go5XR
	0kGooMq6kTV83Dxss0RSWs7K0c6aAhcFljtyldIrcg/G0sX09lT+4Jo25vxOEWM5R4S7BFy14W6
	JG3ZUdfUco8eLSHYqBTbS8Cn2G/tW7gPu+CG1q6sj7FUNpOUKU9qBL8SLxM2dPdSaqqPAHDuj6D
	00WztVnfsu/FYMyw6rjWAImshm0ZbzNy+TP2+CtmhkOjG8wpZ2ZUs
X-Received: by 2002:a05:620a:690e:b0:85f:40ef:4aa8 with SMTP id af79cd13be357-883525c1336mr1723340985a.49.1760115157699;
        Fri, 10 Oct 2025 09:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoG9skK5CX2RaHU9DmjU86G9Y+u4EtqXnDVFa3DnzxephJRs20VnkxLAyjgmJq0LuWDBjqSQ==
X-Received: by 2002:a05:620a:690e:b0:85f:40ef:4aa8 with SMTP id af79cd13be357-883525c1336mr1723334785a.49.1760115157053;
        Fri, 10 Oct 2025 09:52:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f8651sm1015421e87.30.2025.10.10.09.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 09:52:36 -0700 (PDT)
Date: Fri, 10 Oct 2025 19:52:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org,
        "Shinde, Yash" <yash.shinde@windriver.com>,
        Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] rust: building UEFI software in OE
Message-ID: <sflywmxmuqtofdzzfxc5cyyy4szosyeslpoxeddkcfbql6ma7n@o2twrdlqa76e>
References: <rkasjmloevi7fplsyvh2s5z5wxmulvyrewrol6kjlcgn64oe63@5ajr7yfw547a>
 <0f0773981e12d39f55edeb24a82aa5793b3f80b5.camel@linuxfoundation.org>
 <tnqvt5akhc5f77hicxjmbkwjlhsgnccwr5gywc6zntrdepdjc6@4ayi5e3gwgt3>
 <f5f6dea2-85ba-417b-a65f-041a0ba6f0fc@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <f5f6dea2-85ba-417b-a65f-041a0ba6f0fc@windriver.com>
X-Proofpoint-GUID: eDcK4GXnbXeVDTpwWBh45Wddd0u5aydb
X-Authority-Analysis: v=2.4 cv=N4gk1m9B c=1 sm=1 tr=0 ts=68e939d6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=fYTafL6JPhnWwdYNKt4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA5MCBTYWx0ZWRfX9IMwpmU3kGV+
 GtVIWWgeNTxfvPKLi7YCCecbV3QtCflipqKiw15Zx7oZNvSkbhKe8olI3hZ/dETASqw8E5U4Kcn
 sqnF+psjO12QbgbxbsRFSqE3izd76tUOdrGkVFvVH0gjcKOSQFB+pia0GjiEDWki4dtTzcMarx0
 y2t5374lMKIvHluxogFMBFbVqIteOwbkXgjQXuTfmmU2fxaHnMFIYiGHlAgsHV9fUkvsttaGZMK
 7GFiuOggUeZutGcFeEZ0gI5Fi7RlF0j6WEUvB6tUVvPi/XpA5Q+UjNV9Yit0KvXmidVFDtMi1SX
 yhy8rpRG9L3XAyi1o9WKHOFYMNg+55v8XJdgJo9u9ZBppuRLVP8uY6bnXkuMJMRUz3tBBCga5Dd
 fMVrsb3mVtbDo6no17v0F0Cq+78KGQ==
X-Proofpoint-ORIG-GUID: eDcK4GXnbXeVDTpwWBh45Wddd0u5aydb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510100090
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 59AFaNua012546
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 16:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224701

On Fri, Oct 10, 2025 at 12:11:24PM -0400, Randy MacLeod wrote:
> On 2025-10-10 11:36 a.m., Dmitry Baryshkov via lists.openembedded.org w=
rote:
> > On Fri, Oct 10, 2025 at 04:29:44PM +0100, Richard Purdie wrote:
> > > On Fri, 2025-10-10 at 16:27 +0300, Dmitry Baryshkov via lists.opene=
mbedded.org wrote:
> > > > Hi,
> > > >=20
> > > > I have tried using OE to package the UEFI binary built using Rust=
 ([1]).
> > > > So far I can compile the crates with minimal hacks to OE, but the
> > > > linking stage fails. The ccld wrapper tries to use the (non-exist=
ing)
> > > > "aarch64-unknown-uefi-gcc" (and fails). The aarch64-unknown-uefi
> > > > toolchain installed through rustup uses rust-lld for linking, but=
 we
> > > > cannot even try building rust-lld because Rust doesn't allow buil=
ding
> > > > LLD with the external LLVM.
> > > >=20
> > > > So, several connected questions:
> > > >=20
> > > > - What is the reason for rust / rust-llvm split? Would it make se=
nse to
> > > >  =A0 squash them together and enable building of lld (which we wo=
n't use by
> > > >  =A0 default)
> > > There are patches merging them on the list!
> > I think the patches are doing slightly different: they are merging
> > rust-llvm with llvm.
>=20
>=20
> Hi Dmitry,
>=20
> True but we also plan to have a PACKAGECONFIG option for rust to enable
> using lld.

Note, Clang's lld doesn't seem to work (or it needs some additional
magic).

> I'm not sure if we have a patch that could be posted for you to try - Y=
ash,
> Deepesh, Sundeep?
>=20
> As for the reasons that is isn't enabled yet, see other threads on the =
list
> https://lore.kernel.org/openembedded-core/?q=3Dlld
>=20
> specifically those about the build time increase and the ripgrep benchm=
ark :
>=20
> Also, I assume that the work you're doing in outside of oe-core, so if =
so
> should there be a test case and if so where should it live ?

Well, it can be abl2esp itself, it's small enough. Alternatively we can
probably write a minimal test case.

> If anyone else has use cases that work with rust-up but not in Yocto,
> please let us now by email and/or by opening a bug/enhancement in:
> https://bugzilla.yoctoproject.org/

Do you need my entry there?


--=20
With best wishes
Dmitry

