Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145B4C61CE8
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 14:43:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.10331.1749998600545621108
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 07:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SNN2WqwI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FAl9bu018163
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 14:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ngtiH3yVkmfyWmEHQnIDx68c
	/O9U2mih9DBWF/7XKqE=; b=SNN2WqwIPopG6+PQTEhbBrx4RJQSWR4f/h+KQdHv
	XEZ1vtS/quqW0aYnHkswY8qlZo81iT79VJ9MvP0/W1phhPVG/oLxXidvGlC9bBa1
	TapuhvxwUgvT/m1pRscrVPSRXf8SL5jh/s7WkBQsNyv9k/tzbS7uAiYL9ihfn4Ve
	GPowEkNk5udZHCll8/3JcXOZIq0CthrMNRPPkYg5K0P0VDX63jrI+25sddSNnFBE
	Ki/TC6TmovNCO9qGeCxIgzXujErAgwvFnXw85gnbieJ6czpjtJY8qv0eR8sVhfWy
	HSsrwIxVZp6CujjcIgXizmj85ZZJ6mEc7EYSRW8AEzw65Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791ena0k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 14:43:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fab979413fso72746396d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 07:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749998598; x=1750603398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngtiH3yVkmfyWmEHQnIDx68c/O9U2mih9DBWF/7XKqE=;
        b=I6Yc+R1GlPtKDarPweJNDoVeU4LIQPR13R1jAfTakK9S/guN+Q25+CHkPALHG6Dmhv
         t+XfASixsx2rXLh5nKDP7llPXCC7IZiKW52T02WOHokD54uake29Nbmj65Tp/VTsGZPU
         duf1VA6sd5EixH43ntMd4ipKB6BHGmM7Gvfdta9v/W9TDI9bMt+RCucdgVAM2345m0I0
         okhHv8nQlF+tB2aS0EzPT5cfl9teUwOeRg7Ao5k6MwW6OI7X85WkaLSqS6Bp00Y92F9k
         HDBzpFVV4qZ6MDeEoNMw2IOqXKkmrzlIkUo6oFBaJrN19fZC9pAPD5hP/q77YsyvGsba
         CZDA==
X-Gm-Message-State: AOJu0YyZzAzQly7T68lGgQ42pjsGSkyyz0vQuOV5HoUKs0YFaVJeGBTA
	CmNhLilky8fdan23mMNMGDLGR0CKCDpEOtPjXb1vLrUyoXngniEelCRI10awPey2yRmzEjVwsOl
	5z2BOA+9HzOVrrP7FJcGGAuw/0ckohkCyzOWsud3TwKhny3viqIcXlB8zaPPsv6RylVkpL9QPUJ
	WN+iSmHoE=
X-Gm-Gg: ASbGnct4b4kRsunvSVL2C1PJjduqNrx+qjukVJ6uIyviS02tWLEJlH7ZmSGcyyiZVU5
	xf3Ej1gHs0Wrwp2kEN7ZYvgHK+unSPE8ue+d6BUzmXNVAHvFsFhqkD5fm2h3UL7cDTJf6NJOkZg
	aB7w70IR/ds++/28JMtjxOcztXRBeWMZmjhEQhWtTjZlB6OXjFkhB71Uc/pK3geygUYr4Zd4eqk
	v0/RPOFZWWerBeT025Pg/OeYcJY7mY8+Qbkng1PRYGLndUSE8l4KFA6Imwgw3svxwndPRgAaqjB
	IirX/+dPF4yb4/WfQtU5Uo7wHB5S5D1KYn6tyr6u2nFF4BHQ2tZS6DI3DUV0JvLrBnbYetKdVxg
	9bOu0glxIkmaiGAGnUd/ANnPXfL2Y6GMbHsc=
X-Received: by 2002:a05:6214:468a:b0:6f6:e701:9612 with SMTP id 6a1803df08f44-6fb47798782mr111702636d6.34.1749998598561;
        Sun, 15 Jun 2025 07:43:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsm5yPP+HLG59iox6mV2CgXZesnuhdfsP3LQT2xNSAmjp2Pqrj/5MBdlbevSskCY0WTwf6OA==
X-Received: by 2002:a05:6214:468a:b0:6f6:e701:9612 with SMTP id 6a1803df08f44-6fb47798782mr111702376d6.34.1749998598136;
        Sun, 15 Jun 2025 07:43:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b378371e9sm11881661fa.46.2025.06.15.07.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 07:43:16 -0700 (PDT)
Date: Sun, 15 Jun 2025 17:43:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 3/3] libglvnd: migrate from meta-oe
Message-ID: <jms22nqr2qeioio6eedqr3vkgy67gylw7nsxqsgphhfjmguawc@erofbsr4t553>
References: <20250613120358.2011626-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250613120358.2011626-3-dmitry.baryshkov@oss.qualcomm.com>
 <DAMA532J68XE.3FVM6GD3KHACL@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAMA532J68XE.3FVM6GD3KHACL@bootlin.com>
X-Proofpoint-ORIG-GUID: pAE4DXCoY2cN16sYBVslGuMwKgaIeFmw
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=684edc07 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=rvKSzka4aqQLb60ijzEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: pAE4DXCoY2cN16sYBVslGuMwKgaIeFmw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDEwOCBTYWx0ZWRfX6RkXa7IU1k/F
 NGWIc7moXvl+9JZkTo3hU+M+Q50cpwfXxCjbYH8r3B84tHZFSPGD2iiHQ0AlktEoSNxndlfGIof
 gw48d+KzVt1Vds4uIrPYRmUAX/OlDyIcCZVuoRbvUclg0mwexqLTwAmI7DPa9ZUMVL7eXkxIwe8
 YBaBZ3FNJQYveRnVs4/2H6lOb1EnJ2WxTX/wU5q2Ot6DeWhWJh3x3i4/qxRDddsn/btBtQ7JsA1
 2YikIO2jjB/BibSfzWsXnMMCFm4ttgbVGeI2mI/0IJKL8rQfebaJnEBJ25UcPmAzLOCcaPYWYKi
 Tr3nD8/rQt4ib28//OzQKFJ0L2OaWfiZ61YuhVN+fWF21qhBYRBAt67BwGbh6qpFwTaXU3rH5eo
 Rg1hqLfb2K7nueFcuENwTSkNsHf+ykh3kcDiB9SwkYXDvMHzrtJMeHqiMwVjcwHqTse1Av5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506150108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 14:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218746

On Sat, Jun 14, 2025 at 03:11:03PM +0200, Mathieu Dubois-Briand wrote:
> On Fri Jun 13, 2025 at 2:03 PM CEST, Dmitry Baryshkov via lists.openembedded.org wrote:
> > libglvnd is a vendor-neutral approach to handling OpenGL / OpenGL ES /
> > EGL / GLX libraries. It has been proposed and initially implemented by
> > NVIDIA in order to simplify coinstallation of GL drivers provided by
> > different vendors. Major Linux distributions (Debian, Ubuntu, Fedora,
> > etc.) have already switched to libglvnd.
> >
> > Having libglvnd in OE-Core simplifies integration of this ABI into
> > distro and BSP layers (e.g. it will help meta-tegra, which currently
> > provides its own version of the recipe).
> >
> > Import recipe for libglvnd from the meta-oe layer (changes: fix virtual
> > package names, add add the SUMMARY data, drop git@ from SRC_URI).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> Hi Dmitry,
> 
> Thanks for your patch.
> 
> > +PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,libx11 libxext xorgproto,,virtual-libglx-icd"
> 
> It looks like this dependency is not present in oe-core:
> 
> WARNING: Nothing RPROVIDES 'nativesdk-virtual-libglx-icd' (but virtual:nativesdk:/srv/pokybuild/yocto-worker/a-full/build/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb RDEPENDS on or otherwise requires it)

I see. I had a plan to convert glvnd to DISTRO_FEATURE later, but let's
include it in, so that we can block glvnd globally.

> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1799/steps/13/logs/stdio
> 
> -- 
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
> 

-- 
With best wishes
Dmitry

