Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3083C54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 13:51:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.11510.1747835516850518997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 06:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=UBis2X8p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XKvw020973
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0dFl6LJFPYVe0GV2P2mzrmV/nQooj2mqcwJNcZQ2oo=; b=UBis2X8pJTk+rW3a
	4xRlTMDfOpK3L8jT1dAPtaEAaTO4ABlAv02vU/PCNmva/Pxogt7TNLWtzZ/j7RW7
	mSLF6ZXVRSYZuk7KUWp6rpIRafoU/36m1/sefoGooOoWaA+vqkIFMVDQNYT7FoYK
	2+3ENcWKTIWf2cQDNCWogghPyOqevbGThHMTtAbYNmxFoifSNYQ6P3Afg1/MYbve
	RTyQGdLsdJA+rI/5tgrwyi13enl6RRhyCL6HgfZiuTMIIIhxzTM2uY4gXiCD9jEf
	rhNZGfsJvre6yS//tAbB3WOelkbLpEj6PJc/6C8FSZaCPFOPOUtKJ3NlTLI9zsJP
	RD+2kw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf03719-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:51:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c8a36d8eso86340886d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835514; x=1748440314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0dFl6LJFPYVe0GV2P2mzrmV/nQooj2mqcwJNcZQ2oo=;
        b=D9Mk30hOD/AeWb2jBLbKu8Efzuo52y1KsFrjZnCHsI+NKlEH7gDlgTrWueK3+Yru9n
         IrhzKvh7ZFuH3eqRQPZsdnzV80N5HDkaVanH8H+M5tJEPhP9OtZQZz3oMJg4BZNXz7d2
         0OqtscySUfGn3dXeeH3gzloDPKgzY2QRQA8z08pybHSkrMP21YuwgPpg+kTD8NPVIHgi
         XQlzFps1Cn7EZp6iDDrkVi2YUzDWa1m0YNdpytMUK//hcyZY2wZTa/R3KmB1CPdh9CFE
         hQDIcH/63f5eOQG6FFPwCileAaONt34UZjcUkyHOY7P3YW5qY2a41bdxtzwWZ0k3GOjh
         5dwg==
X-Gm-Message-State: AOJu0YzUnNSUDg0Esk/AKa4k3wLcV42KTBFmd5LnmFeCqVcqS2RGEbmp
	MAo3xCPCC46KKEnFOMDVeDYYNkzjS3yXo3dDDUzG19k1VnR+vstYp10oQFN6Tg4tGJdbLIvCRwf
	p6rysXBvYfBqMmoTE2i3psBIS/Uy4l0Ogb1rwUPXyjnNamOwaxyyPq5n9G22Tf262t3P4mR2The
	PyRW41rlIXU5RxYvA=
X-Gm-Gg: ASbGncuXzFd6wM2gwD8rWVN0vZVvmEJviYMBX4bKWPmlTijXkiRuyHawNHGOh5QoJWJ
	eohuTw/r0xQiR+OqUgVYXWLxN8wliBsRBCjiCU4fqFG2RKnBn+zxnaCG+UfmUmqe5nOS2Q4SMhv
	YKJcmmax2lWz/NugSJOrwFkHLErGQOIr9rQbbJWc0SAs6hbHqF/98Jga4YcDVvaeyLFZb5oCoCB
	uScWP5seOuDz2+4Ew+naImowz6sIh+GdZTcst+RMxqwl4FhfL1xtGXRPpH1FcQhXU+UBtffNvcT
	aPWQ4uspG8NUEynaxuoJr0uULW7KWMGwsYJ8QrUN2l6ivqFC0lacwWJqX/6lqOFPat+R7LtIqNg
	=
X-Received: by 2002:ad4:5c6b:0:b0:6e8:8798:275d with SMTP id 6a1803df08f44-6f8b06f0796mr345299516d6.0.1747835514283;
        Wed, 21 May 2025 06:51:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCbWcyZxZzsX4AiMXBaEyuCoG7K4PD5jAyk4RzXkrblE/yhLSfDRIw5XY1TSoEI0r3I8WHRA==
X-Received: by 2002:ad4:5c6b:0:b0:6e8:8798:275d with SMTP id 6a1803df08f44-6f8b06f0796mr345299116d6.0.1747835513753;
        Wed, 21 May 2025 06:51:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fdd281e8sm875901e87.76.2025.05.21.06.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:51:52 -0700 (PDT)
Date: Wed, 21 May 2025 16:51:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/5] mesa: don't build empty libgles3-mesa in
 GLVND case
Message-ID: <4arpn73hzoinvoyrqs7j6mknjuhqkcr7xlcl2vd7fbo5nzri5h@rf5y2qu4b4qs>
References: <20250520174529.1173460-1-dmitry.baryshkov@oss.qualcomm.com>
 <ea04af94-be68-4ede-8348-1ab60551b00a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <ea04af94-be68-4ede-8348-1ab60551b00a@gmail.com>
X-Proofpoint-GUID: 4wxhwnSk38zpF8JVUOdKfgMZA6OrkeXJ
X-Proofpoint-ORIG-GUID: 4wxhwnSk38zpF8JVUOdKfgMZA6OrkeXJ
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682dda7c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=CjuVq6z76hi-hFzd76QA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEzNCBTYWx0ZWRfX3Fq4tETUPNJt
 fMfBVYLVKpH6Bi2ocA/oMDchNUrI963Oc+9VwUxme1Urq7DYDd75CT7x0sQj5smvWl5wj75BBOB
 Y8oV/A51ssK/wbICBJjTtWsbXyhDVT4EL2Qoco2owRIkl7f4fl5/udEokxAmM+M78IrCmdF2KnN
 T0GroMZv/uMS8vh1DapQIywjzWIgMcCGeKnlsDerZ8yREFWpiQJY/Brr4P49Re4qCgm/Cj+NvLF
 sdL9QAtgrblJcw8Y4FrgN1HEkSN+Jbf/t87MzJb0VRAxDw7EM9at5/43mnwQ3e3w8EQ7OdLis0x
 lxjBczmKVxOLXzW2oTjbr1XnCwdK5PYOmvt1uQ7oo8VS5ebcfMhSChxqDt+tiL4ydpbtvWf98OI
 T83xwh142xSzURgc0jAQZcaojSymMasmY0zyEXYH1xOQzBR3S3f9PG0WrcdpPXgcqzYzgFhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=873 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210134
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 54L9XKvw020973
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217029

On Wed, May 21, 2025 at 11:03:15AM +0200, B=F6sz=F6rm=E9nyi Zolt=E1n wrot=
e:
> 2025. 05. 20. 19:45 keltez=E9ssel, Dmitry Baryshkov via lists.openembed=
ded.org =EDrta:
> > If GLVND is enabled, there is no libgles2-mesa package to depend on
> > libgles3-mesa. Stop building unused empty package in this case.
> >=20
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   meta/recipes-graphics/mesa/mesa.inc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graph=
ics/mesa/mesa.inc
> > index 288027bbb996..89ae71595991 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -247,7 +247,7 @@ RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-de=
v"
> >   # GLES2 and GLES3 implementations are packaged in a single library =
in libgles2-mesa.
> >   # Add a dependency so the GLES3 dev package is associated with its =
implementation.
> >   RDEPENDS:libgles2-mesa +=3D "libgles3-mesa"
> > -ALLOW_EMPTY:libgles3-mesa =3D "1"
> > +ALLOW_EMPTY:libgles3-mesa =3D "${@bb.utils.contains('PACKAGECONFIG',=
 'glvnd', '', '1', d)}"
>=20
> Why not merge the two packages instead?
> The GLES implementation in Mesa includes both 2.x and 3.x,
> regardless of being standalone lib or ICD.

Might be a good idea, indeed.

--=20
With best wishes
Dmitry

