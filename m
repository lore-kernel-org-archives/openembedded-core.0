Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3554C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 07:34:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.28995.1744270456832314504
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 00:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=akZLXAQk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75Neh028891
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 07:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecvWAt3L1+wldHgWTK9Bob3cn9iotF+TSi0TExh8MiE=; b=akZLXAQkurAt/v6m
	7LUDOSP9IAdkSlTm/5bT2O9sSMK21xXGhNl6Yntd1fc1wW5557/3w2g9+Cu6JS49
	LCa62EXl7NxG5L6tvazCAMrN3R4/SvT1nKe094CfuaeKlq2oKE7ZJucMJ0R0bqHI
	ypm6OT9PiOXWy4PW8uiU84qgCFJR3mnQmiAla9EOvyb33AxyREL0x22wfNUc8h1c
	EG9HvYXp9ldpHQ/vWTjnCOtge6nJRQ3qNt3j179x4euBuU+n34CjLbxWOoRWOb5d
	DneehsLZU3RoY+g+UiUt36faVO937hrUGmA7C7djXKx+9WXyqjlcOSuUoGYg3gJu
	n2GhuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbup1jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 07:34:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c549ea7166so83041285a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 00:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744270454; x=1744875254;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecvWAt3L1+wldHgWTK9Bob3cn9iotF+TSi0TExh8MiE=;
        b=pQ8ErIkRcp2CG3Sm1WTb7cQ8yXAwWPfpyE0jkVQ1Vj77DH0c2AmKQh64gkdCgnewWW
         4r8htZxhhuGs2tRp9OZ4fq2yau23z7nvGAeFF0PdznCh4/P9T2HRoN7Kff0yZtDsbXDC
         IyIxVYStrSnyhrntUoo1wDtlkhGiWMaI2VAtbUtf5GNobv4twvUnXRqxfcJqkj48y2rI
         lAbAATaFyjofza+t4xfzS7hD7qarDgm14+Gveh47LaV9lZexj6A4MYp1TpHPyY1Uuf1H
         0GGHv7lkPClJAPQfLaF4sEo7Ad3JP1IKaoJivQAC41V8LdwDIiykoAgadSiYlcahUoii
         eIfQ==
X-Gm-Message-State: AOJu0YwvOD56RfW+p5kUu5obbq64Ydi/XZ6iAckcdixn+urgJvJI1olk
	71kHd2fttHkM/eG3lQxK+JUTbaIm2ohXhuBs9VPoTFVpAiHZVk25CkuDxDZ1FEwg2WXvhAHou84
	hWC7Lf9WVqCudopKVwIw39BhQZjW6i8PJDlrtG1TDQu/HVop1+2u6Y6dPvc7BRiiRwaCgJqb2+2
	UOUhY=
X-Gm-Gg: ASbGncs4K6UIZOkrEVBhWOBLPWNUezh82OqlBYnHs7TNEf0tCCh6wxmfpdGKhcgKOSV
	ukduDCug3XlWAkLcWTnEzgmf1c81ttZbkiDkHYbM/YNZIK+Coet1Z25bxpuyygeRWErnsEUB2ky
	ub5oG2CmZZvz4D/wV0DOQZKSBHc7criCPjHvyHLp27ZPSaRQeCt4sH5BEMPnUQ8XNcQsaamffna
	vtSgErINAY8FoC5adJuH3MGmVoPJbSDgjc/6YqJ2/Ra/hRDarnJFuiJs8VZHGU+knN3KPZ37EPn
	R1p4EsTCbx8SZ5xyThZXm/+3hHobVgFPALn8zTnd06rdtnYzORuW3LsBa+vK31+lg1M=
X-Received: by 2002:a05:620a:258d:b0:7c5:3b3b:c9da with SMTP id af79cd13be357-7c7a76bf593mr259016085a.40.1744270454451;
        Thu, 10 Apr 2025 00:34:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSn6ckoCRoFPS/jdj56S2xXZI+nbxOeN76849nJQ4yEssiNGBsyMGgrx1JNcRazc7bgazmoQ==
X-Received: by 2002:a05:620a:258d:b0:7c5:3b3b:c9da with SMTP id af79cd13be357-7c7a76bf593mr259014785a.40.1744270454087;
        Thu, 10 Apr 2025 00:34:14 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbc065b3sm1868692a12.18.2025.04.10.00.34.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Apr 2025 00:34:13 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [OE-core] [PATCH] systemd: Allow overriding PNI name policies
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <20250409101545.5936-1-eichest@gmail.com>
Date: Thu, 10 Apr 2025 09:34:03 +0200
Cc: openembedded-core@lists.openembedded.org,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AAAA74B5-1C74-4FCD-8FDE-ADA8C89EBB30@oss.qualcomm.com>
References: <20250409101545.5936-1-eichest@gmail.com>
To: eichest@gmail.com
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-GUID: ma9yBSi0B5YPtdwJl4N897I5yeX-hdeS
X-Proofpoint-ORIG-GUID: ma9yBSi0B5YPtdwJl4N897I5yeX-hdeS
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f77477 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IQEsc5u+BqvcbVO/417rXg==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=m8ToADvmAAAA:8 a=EUspDBNiAAAA:8 a=XyrK6LsUcMECObIr6DEA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 07:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214625



> Op 9 apr 2025, om 12:15 heeft Stefan Eichenberger via =
lists.openembedded.org <eichest=3Dgmail.com@lists.openembedded.org> het =
volgende geschreven:
>=20
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>=20
> Add two new variables, PNI_NAME_POLICY and PNI_ALTNAMES_POLICY, to =
allow
> overriding the default Predictable Network Interface (PNI) name and
> alternative name policies respectively.
>=20
> This allows setting different name policies via a .bbappend file if =
the
> defaults are not suitable for a specific use case.

Nice! This scratches an itch I had for a looooong time now :)

regards,

Koen

>=20
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
> meta/recipes-core/systemd/systemd_257.4.bb | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_257.4.bb =
b/meta/recipes-core/systemd/systemd_257.4.bb
> index 24aad11c0a..00edd702fb 100644
> --- a/meta/recipes-core/systemd/systemd_257.4.bb
> +++ b/meta/recipes-core/systemd/systemd_257.4.bb
> @@ -273,6 +273,10 @@ WATCHDOG_TIMEOUT ??=3D "60"
> # and the watchdog is enabled. (defaults is no hardware watchdog use)
> WATCHDOG_RUNTIME_SEC ??=3D ""
>=20
> +# Predictable network interface name policies
> +PNI_NAME_POLICY ??=3D "keep kernel database onboard slot path mac"
> +PNI_ALTERNATIVE_NAMES_POLICY ??=3D "database onboard slot path mac"
> +
> do_install() {
> meson_do_install
>=20
> @@ -398,12 +402,8 @@ do_install() {
> fi
>=20
> if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', =
d)}; then
> - if ! grep -q '^NamePolicy=3D.*mac' =
${D}${nonarch_libdir}/systemd/network/99-default.link; then
> - sed -i '/^NamePolicy=3D/s/$/ mac/' =
${D}${nonarch_libdir}/systemd/network/99-default.link
> - fi
> - if ! grep -q 'AlternativeNamesPolicy=3D.*mac' =
${D}${nonarch_libdir}/systemd/network/99-default.link; then
> - sed -i '/AlternativeNamesPolicy=3D/s/$/ mac/' =
${D}${nonarch_libdir}/systemd/network/99-default.link
> - fi
> + sed -i 's/^NamePolicy=3D.*/NamePolicy=3D${PNI_NAME_POLICY}/' =
${D}${nonarch_libdir}/systemd/network/99-default.link
> + sed -i =
's/^AlternativeNamesPolicy=3D.*/AlternativeNamesPolicy=3D${PNI_ALTERNATIVE=
_NAMES_POLICY}/' ${D}${nonarch_libdir}/systemd/network/99-default.link
> else
> # Actively disable Predictable Network Interface Names
> sed -i =
's/^NamePolicy=3D.*/NamePolicy=3D/;s/^AlternativeNamesPolicy=3D.*/Alternat=
iveNamesPolicy=3D/' =
${D}${nonarch_libdir}/systemd/network/99-default.link
> --=20
> 2.45.2
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214582): =
https://lists.openembedded.org/g/openembedded-core/message/214582
> Mute This Topic: https://lists.openembedded.org/mt/112169516/9418801
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[koen.kooi@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


