Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87960C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 13:05:01 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.10455.1739451896112423280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 05:04:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nZa687o2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DA73WM000335
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 13:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xt0Us0+Ox+An8zcf5xqvMpq9T+VZFBr85H5UQa8XHl8=; b=nZa687o2zl1DO9Rr
	Q8Kt8wts6aZAUSiqemeVlPBeFYScWz5yRSyMvfvh7q94yHoBgDxJmYtuk4BzzFpS
	di5NCnM3LCyd+z3VgGd4oQx+ShTosik9Mz8l3Dck/ap7AgXJyHHDFkm2j7bUL4IG
	9e6uzYBhL0+mLvDsUxeYnTtAoNeklTJL/bKE/gQkb5xG+NEkgodL4nTZ/LRRF4E/
	49thrAhc3X7zG3bg9W2Cj8Ek0QkcdtvM2WWuBEZoDOzGn3LB75KVboahOnX2iAC9
	RJqGOor/W8NIzcUkgOY8Aj66KMRQPhd0JEybVo1w0Ez7LqsD+Aw3fCYb+9/fVNw5
	fN6VxQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq00emt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 13:04:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e65a429164so22608646d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 05:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739451894; x=1740056694;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xt0Us0+Ox+An8zcf5xqvMpq9T+VZFBr85H5UQa8XHl8=;
        b=AYzdY3JzbADY7oTYx8XwlhAe8imEafYRwG1J00S9Zth0v0OPZZv+Gv82LheXLW8Wo/
         rCPRoCXooTnFlv1elEIx2xdHwqk0jo8YIsGwjxMSEdxzFz/cPhvAdM8f1Nn6xOCRIUaA
         umUIxx1mScB2ih7j+OMyXZg23LzwWXR+4chqu49756OZNTEBoeT8GvcrG6U5OAoxzVpL
         T+Nm62WJMh4ac2YDW9xPVfH3noautUWIkm7fSZuGZFlTtQIEyXUVOX2IosDApkhmv2M8
         NkWcocGfnTgUZm0G7u3fbnYyTbRO4lcJxuadgLDsoZOjzfO6whZbEHzicIBoXbvjsUl4
         j7Rw==
X-Gm-Message-State: AOJu0YzG9opa/K6qWSu4F6fNZchVtv7aGq57y9Qh8ygUm+UIySTxPX4m
	XbDo02FA/NRZnXzty3smlIMA/UihPLui+rOrLnliHIyrFhN++f33gE7wsJQ/0ZqbgwTM5YOhi+W
	MATrcHnMprKS+P+0Hq4MWewKiLFb4DcWzXMgp+gh7XXqxpRFqAV/ieqYSwKU0M5LkgcYPfcio53
	cMyWSunGkoWuc=
X-Gm-Gg: ASbGncuievstQt/IRxdl6gPIjohHw1d9qghVCrIGqZr+pp+lYSOniBs7k8z6aAnyk2/
	eKLFOfTffv0gPK5j4JEgN/ZeWWxOlxG57MdOsfmj/g00ornvydyuJzbXeiZAA0aqOCjL1Ma6d59
	Y5QedrrBnR9mQmKieXvdyT6wwmnuY70DIVv9m7IVE9V98v9PG9w+YbGh4MlGpHAJiq+9GDtP5Dn
	KkCxd3RSBOkwE1G14YLYpDm85tvWsGGwwH7Gp397kjWfpz1Dxy7Q/Bkh3k1vXHS5mtegMQINEqh
	lCy0hXa8CkXtdvhFD4PF2yNuISwyIbf7hVA=
X-Received: by 2002:a05:6214:766:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6e6591bfb29mr69636996d6.5.1739451894138;
        Thu, 13 Feb 2025 05:04:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDvP5PcyfgvSCCt9p25Trtdl9C8kMjbk7KC/3mwmwKYEJI+JcDz/znrk6R7PWbcJ3hle7Cog==
X-Received: by 2002:a05:6214:766:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6e6591bfb29mr69636566d6.5.1739451893779;
        Thu, 13 Feb 2025 05:04:53 -0800 (PST)
Received: from smtpclient.apple ([82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5339d635sm130030566b.140.2025.02.13.05.04.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2025 05:04:53 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [OE-core] [PATCH] package_ipk: Use preferred for of
 --force-postinstall
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <20250210164649.395225-1-richard.purdie@linuxfoundation.org>
Date: Thu, 13 Feb 2025 14:04:42 +0100
Cc: richard.purdie@linuxfoundation.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <96237056-391B-4957-BA30-89D86B66FB5C@oss.qualcomm.com>
References: <20250210164649.395225-1-richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Proofpoint-GUID: 3ej73O9wW1ZRQFc3NI2p4lFS6zEqno5S
X-Proofpoint-ORIG-GUID: 3ej73O9wW1ZRQFc3NI2p4lFS6zEqno5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_06,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=676 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 13:05:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211329



> Op 10 feb 2025, om 17:46 heeft Richard Purdie via =
lists.openembedded.org =
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> het =
volgende geschreven:

[OE-core] [PATCH] package_ipk: Use preferred for of --force-postinstall

Nitpick: the subject lacks the 'm' in for(m).

regards,

Koen


>=20
> opkg accepts both - and _ in its options but use the help text
> preferred format. =46rom https://github.com/yoctoproject/poky/pull/14
> from Philipp-Alexander Blum <blum@gessler.de>.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta/classes-global/package_ipk.bbclass | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/package_ipk.bbclass =
b/meta/classes-global/package_ipk.bbclass
> index 209568ae5f1..3e72c4c4941 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -17,7 +17,7 @@ PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
> # Program to be used to build opkg packages
> OPKGBUILDCMD ??=3D 'opkg-build -Z zstd -a "${ZSTD_DEFAULTS}"'
>=20
> -OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
> +OPKG_ARGS +=3D "--force-postinstall --prefer-arch-to-version"
> OPKG_ARGS +=3D "${@['', =
'--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") =3D=3D "1"]}"
> OPKG_ARGS +=3D "${@['', '--add-exclude ' + ' --add-exclude =
'.join((d.getVar('PACKAGE_EXCLUDE') or =
"").split())][(d.getVar("PACKAGE_EXCLUDE") or "").strip() !=3D ""]}"
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211105): =
https://lists.openembedded.org/g/openembedded-core/message/211105
> Mute This Topic: https://lists.openembedded.org/mt/111105521/9418801
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[koen.kooi@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


