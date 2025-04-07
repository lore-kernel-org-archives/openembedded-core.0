Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D90C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 08:58:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.42167.1744016306246403827
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 01:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fscZEjfs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dn5r009945
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 08:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0jMEmaAzRChipImlwijkWaS3h7SCuuN4i0vF/885aqs=; b=fscZEjfsa+OyYggZ
	J+lekmOBkQ2pJyphXpZMhwcekQsVDHLeduzyfq8nV4ROa7izaN03vUecUXkqTM8Z
	DJeCI1yV8xE2KxxLIo3Pd+3FpO6H69Ug67XD1Ab7kwSBSdmAxnriNDXPSbqC3EZd
	e4Y+po50837777Uxd/ZB0GASFiDFpBOXf2sP149P86C6CwOTgMaYll/4y56rafjR
	FTTYYVsQTeOd7DQg5sy659EaelDeJk/I5LRmmzFO35n7rDH6j5ieS68bFpY3IrkX
	KFZQuElwt6sz2D44XyZAlqRGWHCHVi/eTJkPGIfvszldrn0m1m8UPUROnt0Jywzq
	iz/WVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm3kpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 08:58:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d9d8890fso970339885a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 01:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016304; x=1744621104;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jMEmaAzRChipImlwijkWaS3h7SCuuN4i0vF/885aqs=;
        b=lNCSiKfFx6Bvd6ATs7qQKeeLeQdnhm4JpOHLiuT5dIEAdLMatlK5h7m9dgaGaqfgmo
         Ys0temKjw+Rpez6n1vAeCr//FMLp2f8hFPcjel7UnYA/n/mAQyI0QYOrFnufMpeIWyxM
         tgb9jfcSpu4Z4VkVWXzbsSOsHgcE3vJugg8Hr6xjSyoAvNC+BdIjMDghvCrVIHkE58Et
         qf4l8tzRT6KKzQvqDHzxvVDkHtz+6AF/Z7SX3SsUKx6j50YSuHCRFx7/LZrcIIFtWyeE
         /Sh4Q4Gt/cFjzfi40xJmo2ypZod8YaRL9lSJOTwUVTF58HZjud1mTpU/UCRHYO1CbRmO
         Hk8A==
X-Gm-Message-State: AOJu0YzTRYqkE63c1UISYhLOWJEq1/bi2POAuS1HGAiDmOl3z8Y9Aopf
	nCRhU7SS1Is7kYWZF4wmwUPKZT6CG1/H+GAudELTQPWIc9PmAOrxWouafNUuNR/r+eadiXmNKQc
	Ut5oqC8DCX2SQFOQYc22xxr47QIYAAv72qDw3Jbh/UTNj/A50+olAz/hR0SYC34V6YBFwEW3zNS
	4Fwb8=
X-Gm-Gg: ASbGnctEJlu7JtIXeZZnk461JoFXzc9zA05HVLWCeCbvBRQkX1NaFlTKc5aGzb0ZRqN
	EhDeTO5mKSY8jMTSxV8KEPl9fwbk3/LEgRCvrJ85fZTuSqpMelQKnTL61sXrMBDFvfGtmeeCZPC
	T4NwrCuDMGGDK6PI7BXEvV8G+8drECQFHfxzKkdRcgfXe0kQtY+RnI088B97aHi0z3tIUXbVvKA
	wATHeE21vP17Z3Y3PKanr6JP3+OzuIDfPV2nE0fnvaHTnPiWquSB/yAGNRXosdIMlGi9STzwMiv
	aPmJ5l32buJEhaorWuoAy2xetZawfSiWVbRxCBjzku1FONrK6ziQE4kb8EwI+76adN9WSw==
X-Received: by 2002:a05:620a:4084:b0:7c5:a542:10a with SMTP id af79cd13be357-7c76c97dd4bmr2538022285a.10.1744016303899;
        Mon, 07 Apr 2025 01:58:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMOEz11GE82Nng0sksHPKz+HWxhG4H9U6AvELxgqXUtMVXSVPfQCTCR94gSudfiEqR1N7okA==
X-Received: by 2002:a05:620a:4084:b0:7c5:a542:10a with SMTP id af79cd13be357-7c76c97dd4bmr2538020285a.10.1744016303528;
        Mon, 07 Apr 2025 01:58:23 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087ed1c68sm6108260a12.17.2025.04.07.01.58.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Apr 2025 01:58:22 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [OE-core] [PATCH v3 04/11] core-image-initramfs-boot: add option
 to build systemd based initrd
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <Z_Nsx9Qntl9ghZwK@nuoska>
Date: Mon, 7 Apr 2025 10:58:12 +0200
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F2BE3AD0-A0B2-4760-B4EB-E4D18D4CD2DB@oss.qualcomm.com>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-5-mikko.rapeli@linaro.org>
 <0C447E0A-971B-4C9D-A8B4-9293962BF92F@oss.qualcomm.com>
 <Z_Nsx9Qntl9ghZwK@nuoska>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-GUID: esnbrlulBjOEuq9LQvu7MVQVi3dn6D-J
X-Proofpoint-ORIG-GUID: esnbrlulBjOEuq9LQvu7MVQVi3dn6D-J
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f393b1 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IQEsc5u+BqvcbVO/417rXg==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZWHEYfMF7RufeT5cdC4A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 08:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214405



> Op 7 apr 2025, om 08:12 heeft Mikko Rapeli <mikko.rapeli@linaro.org> =
het volgende geschreven:
>=20
> Hi,
>=20
> On Mon, Apr 07, 2025 at 08:01:41AM +0200, Koen Kooi wrote:
>> Op 4 apr 2025, om 18:29 heeft Mikko Rapeli via lists.openembedded.org =
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> het volgende =
geschreven:
>>>=20
>>> If "systemd-initramfs" is in DISTRO_FEATURES then convert
>>> core-image-initramfs-boot from shell scripts to systemd.
>>> The resulting initramfs is much bigger than shell script one but
>>> supports much more features like disk encryption and TPM devices.
>>> Also includes udev which can load any drivers needed to mount
>>> rootfs.
>>=20
>> Are packaged based kernel updates finally working with this?
>=20
> Sorry, I don't get this question. What is package based kernel =
updates?

Using package management to update a kernel, e.g, 'opkg update ; opkg =
upgrade'.

regards,

Koen


>=20
> Cheers,
>=20
> -Mikko
>=20
>> regards,
>>=20
>> Koen
>>=20
>>>=20
>>> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>>> ---
>>> .../images/core-image-initramfs-boot.bb       | 20 =
++++++++++++++++---
>>> 1 file changed, 17 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb =
b/meta/recipes-core/images/core-image-initramfs-boot.bb
>>> index 7258944751..c66c28db76 100644
>>> --- a/meta/recipes-core/images/core-image-initramfs-boot.bb
>>> +++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
>>> @@ -4,7 +4,23 @@ LICENSE =3D "MIT"
>>>=20
>>> INITRAMFS_SCRIPTS ?=3D "initramfs-framework-base =
initramfs-module-udev"
>>>=20
>>> -PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} =
${VIRTUAL-RUNTIME_base-utils} base-passwd"
>>> +inherit image
>>> +
>>> +PACKAGE_INSTALL =3D " \
>>> +    ${VIRTUAL-RUNTIME_base-utils} \
>>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd-initramfs', ' =
\
>>> +        base-files \
>>> +        coreutils \
>>> +        e2fsprogs-mke2fs \
>>> +        os-release-initrd \
>>> +        util-linux-blkid \
>>> +        util-linux-mount \
>>> +        util-linux-umount \
>>> +        ${VIRTUAL-RUNTIME_init_manager} \
>>> +        ${VIRTUAL-RUNTIME_dev_manager} \
>>> +    ', '${INITRAMFS_SCRIPTS}', d)} \
>>> +    base-passwd \
>>> +"
>>>=20
>>> # Ensure the initramfs only contains the bare minimum
>>> IMAGE_FEATURES =3D ""
>>> @@ -18,5 +34,3 @@ IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
>>> IMAGE_NAME_SUFFIX ?=3D ""
>>> IMAGE_ROOTFS_SIZE =3D "8192"
>>> IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
>>> -
>>> -inherit image
>>> --=20
>>> 2.43.0
>>>=20
>>>=20
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#214355): =
https://lists.openembedded.org/g/openembedded-core/message/214355
>>> Mute This Topic: https://lists.openembedded.org/mt/112087527/9418801
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: =
https://lists.openembedded.org/g/openembedded-core/unsub =
[koen.kooi@oss.qualcomm.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



