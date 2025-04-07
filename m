Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C27C3601A
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 06:01:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.40486.1744005715814962786
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 23:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=U+7eB3tr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5375rApB000372
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 06:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dzr6vL9HfZ7YBAWf1hd5ydUID2yGhq7E/Rlhu6RZ0Rs=; b=U+7eB3trbL6rB7q+
	KAssibcFdJHg+Se5Nk5BDCtYH0QrrG9SRp03zU+FJNT7WSJGnbnEkR2BQVc8XY6Y
	GrKhVeYqLMpAjTKsjfPOgUaICyjjMGXcmiOT/GySYLpIhs1AbVjxLnBS109DnLq7
	IaqDFH4ALbqbemx3oQ+uIrbiKaH54LiIHD7tk0mIA/pgowUfQ8Mr4HbiPC381ING
	pUrszmjwsGLHP0sTvrmMGqXDuMWbLyVAAiVe6FEqASsPlhT5oWOErc2WHagId0ep
	lRtvjODxkeGhV6S+/Nv6sA7ZKHUfoNEAz/8okBg1dTcxUfx8pc8jVUbeXB0TCFHc
	tEuBJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2k3nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 06:01:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c791987cf6so10816085a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 23:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744005713; x=1744610513;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzr6vL9HfZ7YBAWf1hd5ydUID2yGhq7E/Rlhu6RZ0Rs=;
        b=uJ78w4bGO7UdzCCnv9LHVHzb/hQbmfSfHJL0r52kMx86ub0wT1VeJjqrY9kYiofMaN
         EY71iy6BIVqiNkEai69W4LXJkvqPWLZmYkLc4fJ1pBfmSy5wj6vAIK6rJDZ3W3snCWZ7
         H5x+pAcJGQaNYHA+pH+B2VkFz1lBSf28divBer3sY6ntTg/3hnohHSVIN3MYF5dkK5jS
         PtIRTSjtzOD9dypPDQzM/LAzwhPXhWfS2439i8+ku+U9rNvFwIJdii6bsbmowwpVe4Pi
         8NGbthjHGVGchGFrSFRmzt0jBdPvjUvbNkzegO0v2W7bEEg7SumLu71bdQwcpq1bDiP/
         Of7A==
X-Gm-Message-State: AOJu0YwQ7rlNJFW9HaeE+PspW5yF3fErfwLyQvbu+u5/jM/2d8y8gMn0
	KPjbdiisclOiuSJXhvziUXQkhTcihlIfVzDMZbjz7vg/5hxdJQqKeuW7+u/syt3fWNgoG8xU9bi
	Z6Ch5ZQSAGf+gp0ZR2lTxe9UAZ7SKc5q8w7psf23j0wqGyICeQwMfFA0OJgZcgIcmo8X8JwBRAc
	755dE=
X-Gm-Gg: ASbGncvUjPUalvU8QUvicWGyMg9oGsxNVgCwJE++K5wJ07B0e4JwtJUtX8Uwu1Ra7Ri
	JAYBcv1ZLRWdFHkk+D4Vq5Hl9kQN32HXPKi58ppWZWlvOPESkPtY2Z2sjNgdR2JxvPtLM7E9Tm1
	uSfqaP363JbtfGH2BsMTIEuASJB1TASfOCVRDoSa5q6EOSrlAJgmBMwIKnmJMMimkYviG7uqcR7
	RjnDl6o9fQqtE92nV4WSwGgVzo3lsJ0+oPNbU+aLsjH8CtaA6L7/UO1J3dLztiMfyZSGimCyqUc
	kVQ0oryksaWZBT/LpCQGZZUqaTTApCyoJLOTYBG5bQmIrLJrWEHYj82ClYFqOIBW
X-Received: by 2002:a05:620a:25d4:b0:7c5:58b0:42c1 with SMTP id af79cd13be357-7c775a388c5mr1242700885a.34.1744005713505;
        Sun, 06 Apr 2025 23:01:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEOLBTNCtL7nQIlA1GbYIRMF6WSWzB7+h6qv6y0RIjJdRbUcz/6t60M/yy07FxwOB8ZVP6Vg==
X-Received: by 2002:a05:620a:25d4:b0:7c5:58b0:42c1 with SMTP id af79cd13be357-7c775a388c5mr1242699585a.34.1744005713204;
        Sun, 06 Apr 2025 23:01:53 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d479sm687889766b.36.2025.04.06.23.01.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Apr 2025 23:01:52 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [OE-core] [PATCH v3 04/11] core-image-initramfs-boot: add option
 to build systemd based initrd
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <20250404162932.447699-5-mikko.rapeli@linaro.org>
Date: Mon, 7 Apr 2025 08:01:41 +0200
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0C447E0A-971B-4C9D-A8B4-9293962BF92F@oss.qualcomm.com>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-5-mikko.rapeli@linaro.org>
To: mikko.rapeli@linaro.org
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-ORIG-GUID: g_RPQQP9JlxpTHprnID2JZQqA0cDMyxL
X-Proofpoint-GUID: g_RPQQP9JlxpTHprnID2JZQqA0cDMyxL
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f36a52 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IQEsc5u+BqvcbVO/417rXg==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ggKkMSF-MNz9apa6l6IA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 06:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214396

Op 4 apr 2025, om 18:29 heeft Mikko Rapeli via lists.openembedded.org =
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> het volgende =
geschreven:
>=20
> If "systemd-initramfs" is in DISTRO_FEATURES then convert
> core-image-initramfs-boot from shell scripts to systemd.
> The resulting initramfs is much bigger than shell script one but
> supports much more features like disk encryption and TPM devices.
> Also includes udev which can load any drivers needed to mount
> rootfs.

Are packaged based kernel updates finally working with this?

regards,

Koen

>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> .../images/core-image-initramfs-boot.bb       | 20 ++++++++++++++++---
> 1 file changed, 17 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb =
b/meta/recipes-core/images/core-image-initramfs-boot.bb
> index 7258944751..c66c28db76 100644
> --- a/meta/recipes-core/images/core-image-initramfs-boot.bb
> +++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
> @@ -4,7 +4,23 @@ LICENSE =3D "MIT"
>=20
> INITRAMFS_SCRIPTS ?=3D "initramfs-framework-base =
initramfs-module-udev"
>=20
> -PACKAGE_INSTALL =3D "${INITRAMFS_SCRIPTS} =
${VIRTUAL-RUNTIME_base-utils} base-passwd"
> +inherit image
> +
> +PACKAGE_INSTALL =3D " \
> +    ${VIRTUAL-RUNTIME_base-utils} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd-initramfs', ' \
> +        base-files \
> +        coreutils \
> +        e2fsprogs-mke2fs \
> +        os-release-initrd \
> +        util-linux-blkid \
> +        util-linux-mount \
> +        util-linux-umount \
> +        ${VIRTUAL-RUNTIME_init_manager} \
> +        ${VIRTUAL-RUNTIME_dev_manager} \
> +    ', '${INITRAMFS_SCRIPTS}', d)} \
> +    base-passwd \
> +"
>=20
> # Ensure the initramfs only contains the bare minimum
> IMAGE_FEATURES =3D ""
> @@ -18,5 +34,3 @@ IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
> IMAGE_NAME_SUFFIX ?=3D ""
> IMAGE_ROOTFS_SIZE =3D "8192"
> IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
> -
> -inherit image
> --=20
> 2.43.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214355): =
https://lists.openembedded.org/g/openembedded-core/message/214355
> Mute This Topic: https://lists.openembedded.org/mt/112087527/9418801
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[koen.kooi@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

