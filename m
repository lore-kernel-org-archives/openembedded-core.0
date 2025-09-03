Return-Path: <nicolas.dechesne@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892A2CA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 13:12:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.12036.1756905125848942108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 06:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=K0GFSCPo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: nicolas.dechesne@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF1Bf023145
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Sep 2025 13:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Viox5vIT5rmFGHJsVQPXJt5dBUFe8+KqYMhP4ngLuEM=; b=K0GFSCPoOdBjPNM3
	wASHv4tdZGP1Fb+12kdaeq6p9ZaWxqbPtq4sb7TNeI3H59zOjFLgmqwGnAziJYVU
	Z4gw0Gkn+It/gQ/xriVes+QJEEZSNJ3IIEvcUKAdc5FjO79/KcmOXU+uiS2Fkd/R
	Uy6lR0DbVnziTxK2o/rh6uA8xawV7tmeX0VGfnWTqMf5bVBngkZjs4U1nVVqj5yZ
	nZk2a6MBvoWTGlq7aC8bfFiJuxQgfwc0P3CRvVLl/bUS/v7jX81eQLRQRIXuWY65
	1S/uu6VvaySHU/TLrtbXoix7u4XVZSvsxPDRnelCeQTng0g3fwe1veDbzdJPcfFP
	D70nVg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ekwe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 13:12:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70dfcc589d8so66997786d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 06:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756905124; x=1757509924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Viox5vIT5rmFGHJsVQPXJt5dBUFe8+KqYMhP4ngLuEM=;
        b=EM/OArei6nlW1Cu7ryANS+Z0C9z+fyU9xiLWl+1Q2oAD6nKRcfEk7MQK4k1aWqCOl9
         EeLTjzCzr0zB6pGhCnbvS7DbgRzF9w92rIZW09Pk2yavF569kILiysUmMXPKO6A1Rb3G
         1sIFZ2bQayBiU579GnldJK62iksSSWMlQEpKDOWylfo+vQPrASx7ggS6BOxqFTFCxd31
         7U2HPf8PLQdK5BwMmHIwrm1wF/HMSl66yo9RAaEE4UNxQHXd2zHytESStnq8BXDGb27X
         qLe09EE2DG5o4oavhtupqxhUh4Vei0Pys7YO0gYKP0Jd7DN3vpWf/sKZghQB9sTv26WQ
         9lTA==
X-Gm-Message-State: AOJu0Yz2p6//WpTGytl7LDztahG4x1Fpuv0giY7CORkGYJf+akgM91nI
	uNb/7ioPkLfv/2tRVZcRu8bA1zeFjyvfeM/1PDc0grFZuTN2l+IVjogLLFD78pwLi31HVRPnuGc
	gB4yeeCxfJbTP+DnLo7a5soDa7kN7SZRna8kK4LVF8IRWLfa6c9sPekD6qi4PtnaA7Lg4ADgWng
	HzKNwxvw3DLSPmKW2RyDeti4CGBiGGadzrvHIbddqPwnxsCzn2ppp+HTImHA==
X-Gm-Gg: ASbGncuoTUcZLIDfeAU/zbUc9WOlByW3IYrr2jHWC8yNd/PNv2DVJRBvgL+XZPqPQS1
	XtrW4VP10dx5e9HiHfibCJc69toHtqU7wKfefDCxTjzNGbxraDOeAXzLxuF6e0H+Lv1t57MIsNe
	R7oWtwSQD/HU9IK0Kim4g18Hc=
X-Received: by 2002:a05:6214:1305:b0:70f:4ee6:ebc7 with SMTP id 6a1803df08f44-70fac898ed9mr169444846d6.40.1756905123778;
        Wed, 03 Sep 2025 06:12:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOgW6Ei5NovxZ6ULbIXTGWdlwy85XCUYe6EyAJyZwf2jTUxtxwo1uJGscRmbC1YvHJHAtJuUygF9I70KWX8hs=
X-Received: by 2002:a05:6214:1305:b0:70f:4ee6:ebc7 with SMTP id
 6a1803df08f44-70fac898ed9mr169444116d6.40.1756905122885; Wed, 03 Sep 2025
 06:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <CABWbsgC2qLDQfnS4oumgLSuS8TWCk=1a3j8yTxN17_UFjMxuxQ@mail.gmail.com>
 <CAMKF1spFSu-EOfuxdBasDs2SQ3S0DRpnbLNyWkRGO77Bp8p7vg@mail.gmail.com>
In-Reply-To: <CAMKF1spFSu-EOfuxdBasDs2SQ3S0DRpnbLNyWkRGO77Bp8p7vg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:11:51 +0200
X-Gm-Features: Ac12FXyKzBatAqIDY-jwm7UVqJ-ewjBnE04RJcV6atN3kY75ZTM77cYkUYdOvJo
Message-ID: <CABWbsgBgN=m0Oq487DZpZ7fTmNbb67TJ97=W9TWP-WP=2LbYDA@mail.gmail.com>
Subject: Re: [OE-core] yocto-check-layer and DISTRO
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: HEssoc9z-mhrmv0ZDEZlGaciKGTRPw4i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfXwVbDDypCEJnd
 n0j8Q/zIBY92PijYzmRtZvecuEoLd6Ly7pQCQcrpflSjSb+UE6cv0F158ZfRWAhKqP7lhkYN/Zg
 17YMB2bFSibWWSd4R+I23llyT19q1MExDJV3ksL4js4PeI4PvzI4UuHvuqiFy5egj/m1NJZxZah
 tazEpesK3RjmNcmY1cH//La7SPyaUcOi5V4U28w4SBp0NLhyS2Ez7sKocBNJeTL7VCVOqIsAkFV
 Dq3WcGM8KEjR+TPWNIFMB3D4MCkKpNmM3PWdRtwcylzO+jpTSUy1HnksTioMAoAB6PWhQzZoY2a
 +2Zbn/4VlnwIDY1mSgM39r0jJ40vLABslSxs/jkGXF9ovSBo5zzze049LPidqCvGL0XUxHR+wf6
 Ki0KvP83
X-Proofpoint-ORIG-GUID: HEssoc9z-mhrmv0ZDEZlGaciKGTRPw4i
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b83ea5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=uV3wdj5S_1LJmMz9sn4A:9 a=QEXdDO2ut3YA:10 a=bUYPNviu4PgA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 13:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222861

On Tue, Sep 2, 2025 at 5:12=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Sep 1, 2025 at 8:25=E2=80=AFAM Nicolas Dechesne via
> lists.openembedded.org
> <nicolas.dechesne=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > hi,
> >
> > I recently came into a situation where yocto-check-layer failed in
> > Yocto A/B for meta-qcom [1], while yocto-check-layer was not failing
> > in our CI [2].
> >
> > After investigation, we found out that DISTRO is different in both
> > cases (poky vs nodistro). This problem in particular was in a mesa
> > file in meta-qcom, and with nodistro mesa is skipped ("skipped: one of
> > 'vulkan opengl' needs to be in DISTRO_FEATURES").
> >
> > yocto-check-layer obviously depends on DISTRO (and MACHINE? and
> > others?). However I could not find any reference of what they need to
> > be set when testing a layer for YP compatible status [3].
> >
> > I guess we need to clarify what that means to be YP compatible, and
> > what defaults are being used for that. Or suggest that we run it
> > against both nodistro and poky?
> >
>
> If I read https://www.yoctoproject.org/compatible-registration/
> then it talks about OE-core + bitbake

Ok, that makes sense. But now we also know that using oe-core and
nodistro leads to 'skipped' recipes because some features are not
enabled by default. I believe this is a problem we need to deal with.
Do we want a specific config/distro to be used for compliance check?

>
> > Any thoughts on that?
> >
>
> meta-poky is a distro layer which is YP compatible and AB jobs test again=
st
> poky distro.

sure meta-poky is compliant, but then AB jobs is testing all the
layers compatibility against poky and not oe-core/nodistro which is
conflicting with what we are saying above.

>
> > cheers
> > nico
> >
> >
> > [1] https://autobuilder.yoctoproject.org/valkyrie/#/builders/85/builds/=
606
> > [2] https://github.com/qualcomm-linux/meta-qcom/issues/1029
> > [3] https://docs.yoctoproject.org/dev-manual/layers.html#making-sure-yo=
ur-layer-is-compatible-with-yocto-project
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#222666): https://lists.openembedded.org/g/openembed=
ded-core/message/222666
> > Mute This Topic: https://lists.openembedded.org/mt/115009504/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

