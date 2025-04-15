Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBD9C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 06:58:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.14228.1744700328479944471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 23:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EcxeH9vi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15KYW020376
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 06:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7nLb4BSjyDD+ZyC8FAUdQ+q3BHvq7rzEd/K7rjpg58=; b=EcxeH9viBQedtTXm
	vKULK8IJ7Jgzr/Yc+Op6ouWFgoxBiGziMe8yfErsv98J+qnZp9X4gmWnQzCQ/cCP
	MpORHPYr817GYRuQ+ztP4iE34CkKjjWTmU2ypRddkZgIGZxtbJiNVmVOPsx5OpkQ
	ElDFV90PAcQ5pQWr5qlk150aSSjI36cpaj8mv53x754YnKFgeDkkSa+f39SflILN
	kexvXhJd+1wS1edMbbzgwVMFQFCQWhcDliYmO1hzWpGZmbfbJk6SWfB2aGcGHENa
	2gn5Li+Wq3pdEmNwphDXmcHmXJq8bxQKl5A3W0rvTV1eLM6tJXTMzTHu0NpMX5lz
	cvjQWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj96xue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 06:58:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c549ea7166so806472485a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 23:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700326; x=1745305126;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7nLb4BSjyDD+ZyC8FAUdQ+q3BHvq7rzEd/K7rjpg58=;
        b=mjLjvVKN5wamGNqTeY6LAnFJdPVswCMO1WDzhjNagCe70ZR8lNft77V0LVi5km62Ji
         0OUSceS8LRyX7YRIdtgHlp/go9lklJU43SB0w1jwnVuPT+lONxL3+lztHP3FOFQWtrI4
         Hxziu7MtoTXqz0UXzXlOl1E0tIFOiDIgpanX93FNYq7EclY4s/ilA3ryNCS/FAXpOYCy
         E7KpfzVSCE2i8YdIUWVDDy+Fld2XSmjfFvMkxJObr4DBfm5F1wn2QEancoAWsiEwDPj8
         UACFzlDi1dv8RqMT3o3SYMAm/qimbtfcEhfq/6FAsDNNadz+TKhJtldT+fjZZrnGHlIq
         uLGw==
X-Gm-Message-State: AOJu0YxNsD5cWLJ+eMexQdTn/ijsQwx3Ax/NsdJOdKkfTabR+5hl9vdY
	IDlwddmR/r3Z6Wo5IEPbOxwWWFGncIb7CX+xmZw5sL4CNCpC5rJ61APrx77BKJ4LVJ4UW8OC74b
	wODzvAGvpjz7LW0UwREYLJP7dcq0GQT89pEb9jUjjWsEBGzCkPC2+owCwXFFKF8xV7yL23vtJEC
	dGPLecrFKYv/4=
X-Gm-Gg: ASbGncsuuUlO2KdYjKrLpJm75ff2WicWKcMRk0ijxeRJcOKgeDtbBEylmk/MdasiDP1
	r8R6rCZPBI4EaSTeA9QNu+ZMIogazQ8kR4Fvg9KzJgkCX0A3uLM91I4XvAov90DdmRWlA7VDY4f
	xP8Qm8INTQ8lKJcXhAcOdTyJRWaEU0BeuAqdU2TjrHMH4YDcbjIWTHcaCsT12tUU09zr/qq5/Lm
	CGF/pX4ZAwzl/UVYfbiLWn2WV5aLvPGZr8xLugCm0kb9ZqNEX/XDtbdkOdo7kz0tiXOi7o64kQ0
	4S5DLYjpcLndRmftdF/HVhbNpUIZUYVB4m83K7O+cpkh/1t5Pkg4d+5Ap1zc
X-Received: by 2002:a05:620a:4694:b0:7c5:4949:23f9 with SMTP id af79cd13be357-7c7af0d408emr1930425785a.18.1744700326580;
        Mon, 14 Apr 2025 23:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGamATCClbXtjALU6AqJq3v7R4GJPbyomkyPYeMePbL/dJMIyv4hbJwEah5SfUPVEC24G1okw==
X-Received: by 2002:a05:620a:4694:b0:7c5:4949:23f9 with SMTP id af79cd13be357-7c7af0d408emr1930424385a.18.1744700326182;
        Mon, 14 Apr 2025 23:58:46 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f505728sm6323240a12.64.2025.04.14.23.58.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Apr 2025 23:58:45 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [OE-core] [PATCH 2/2] mesa-demos: fix detection of GLX headers
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <20250414192210.18008-2-ross.burton@arm.com>
Date: Tue, 15 Apr 2025 08:58:35 +0200
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B7704B37-D137-461F-BC6E-55D654F4A251@oss.qualcomm.com>
References: <20250414192210.18008-1-ross.burton@arm.com>
 <20250414192210.18008-2-ross.burton@arm.com>
To: ross.burton@arm.com
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-ORIG-GUID: Iub0GKCSwClERbYx6ZZetbra_siZ3-z-
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fe03a7 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IQEsc5u+BqvcbVO/417rXg==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8 a=Q4-j1AaZAAAA:8 a=7CQSdrXTAAAA:8 a=QX4gbG5DAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=PXg3UkOy9UI20OKBJTcA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Iub0GKCSwClERbYx6ZZetbra_siZ3-z-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 06:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214824



> Op 14 apr 2025, om 21:22 heeft Ross Burton via lists.openembedded.org =
<ross.burton=3Darm.com@lists.openembedded.org> het volgende geschreven:
>=20
> Backport a patch from upstream to fix the build when glx.pc isn't =
found,
> but the glx headers are available. As libglvnd is the only provider of
> glx.pc and by default we build without libglvnd, this is common.
>=20
> This solves the problem where mesa-demo is missing the GLX demos, such
> as glxgears.

Thanks for that! I was wondering why I had lots of *gears, but not the =
GLX ones I needed for testing GLX :)

regards,

Koen


>=20
> [ YOCTO #15825 ]
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> ...eson-fix-glx-detection-without-glvnd.patch | 46 +++++++++++++++++++
> .../recipes-graphics/mesa/mesa-demos_9.0.0.bb |  1 +
> 2 files changed, 47 insertions(+)
> create mode 100644 =
meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-glx-detection-without=
-glvnd.patch
>=20
> diff --git =
a/meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-glx-detection-witho=
ut-glvnd.patch =
b/meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-glx-detection-witho=
ut-glvnd.patch
> new file mode 100644
> index 00000000000..f16ba4a24c4
> --- /dev/null
> +++ =
b/meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-glx-detection-witho=
ut-glvnd.patch
> @@ -0,0 +1,46 @@
> +=46rom e16117fc92688d76a042ad2c590c77d5a987a4ac Mon Sep 17 00:00:00 =
2001
> +From: Erik Faye-Lund <erik.faye-lund@collabora.com>
> +Date: Fri, 24 Mar 2023 13:31:58 +0100
> +Subject: [PATCH] meson: fix glx-detection without glvnd
> +
> +When build without GLVND, Mesa provides GLX as a part of libGL, just
> +like XQuartz does on MacOS. There's nothing really macOS specific =
about
> +this fallback, so let's drop the condition.
> +
> +And just for good measure, let's add in dep_gl as a dependency for
> +the header-check here, in case some one decides to install libGL =
outside
> +of the default include directory.
> +
> +Fixes: 34300551 ("meson: explicitly check for glx dependency")
> +Closes: https://gitlab.freedesktop.org/mesa/demos/-/issues/36
> +Reviewed-by: Hoe Hao Cheng <haochengho12907@gmail.com>
> +
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + meson.build | 9 +++++----
> + 1 file changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index c1853f94..bc3278e1 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -99,10 +99,11 @@ if not dep_glu.found() and host_machine.system() =
!=3D 'darwin'
> + endif
> +=20
> + dep_glx =3D dependency('glx', required: false, disabler : true)
> +-if not dep_glx.found() and host_machine.system() =3D=3D 'darwin'
> +-  # xquartz doesn't have a glx.pc, but it does have the header. And =
all the
> +-  # symbols reside in libGL, so let's just use that.
> +-  if cc.check_header('GL/glx.h', dependencies: dep_x11)
> ++if not dep_glx.found()
> ++  # Both Mesa build without GLVND and XQuartz lacks a glx.pc, but =
does
> ++  # provide the header. And all the symbols reside in libGL, so =
let's
> ++  # just use that.
> ++  if cc.check_header('GL/glx.h', dependencies: [dep_x11, dep_gl])
> +     dep_glx =3D dep_gl
> +   endif
> + endif
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb =
b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
> index 0301b553611..d92f1ddc5ba 100644
> --- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D =
"file://src/xdemos/glxgears.c;beginline=3D1;endline=3D20;md5=3D9142
>                     =
file://src/xdemos/glxdemo.c;beginline=3D1;endline=3D8;md5=3Db01d5ab1aee94d=
35b7efaa2ef48e1a06"
>=20
> SRC_URI =3D "https://archive.mesa3d.org/demos/${BPN}-${PV}.tar.xz \
> +           file://0001-meson-fix-glx-detection-without-glvnd.patch \
>            "
> SRC_URI[sha256sum] =3D =
"3046a3d26a7b051af7ebdd257a5f23bfeb160cad6ed952329cdff1e9f1ed496b"
>=20
> --=20
> 2.43.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214808): =
https://lists.openembedded.org/g/openembedded-core/message/214808
> Mute This Topic: https://lists.openembedded.org/mt/112263751/9418801
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[koen.kooi@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


