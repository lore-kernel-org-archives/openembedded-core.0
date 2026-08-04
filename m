Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CF6C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:24:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15113.1785846292033260112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=RyiZgr41;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=Q5l9xt/Z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CBql3300213
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Aug 2026 12:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2FnEQZnydKIEOLBRvdcOxOu6KeI6KaivMSPZcg9yKaU=; b=RyiZgr41yN922w1p
	TZGH41u1neAE4QMrrWz523UEosuT7TcWo8AzTWLjdOtxuzkapsqEC7OeGLTjr9ZL
	uDotnDGAIveLhKg2JCKQkC7bNt2un+wtlddj8zDQtysz7CbFuu8CxFrZNZy2+lKw
	kLruTQK8HRZi5D4id04QmN09bd8+q7grvWTFLIcYhfJGYjm9K7wZymzlM9+Fbzap
	v4IrscoRD7PV3AA1WzaeINTtGYgQy+isIUPChqIymVoVJuWIt9TpqjCrOXzWNfq2
	TdGe4gHfLOWeT+HyScdLQzyITymF/Jx0Enx6xQll3LXqZqpJCqxX8YZUCbr/WPyL
	ingV+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p8bhnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:24:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso1118391cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 05:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846290; x=1786451090; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2FnEQZnydKIEOLBRvdcOxOu6KeI6KaivMSPZcg9yKaU=;
        b=Q5l9xt/ZTyRNHYkaC7hy8u9QspItsApooxHpIdI4qqVnKvq8r5LaKKwjYdwpny/+K8
         LFxe4nXqZ6kbOIN4oNrgfozntZTbBT8g+OlDkfPQMncVUXc5+H/t2HN1liSiIzwhl/Pv
         efiUV5LNPUV9nlTtb+efqRJUaaL1b4Z5in71fde3bbLwDg+dVZqU2m343AGDbSfey16+
         jy8ZSj5katEg0bvWuKWu+x0b7KfY2d09Ggk6HvzUwv8nGK+cnawW7rM6knlsb/yRE/Xh
         KNsOR99dzMigM/DPMSgI0peL3uykJ1OfxdI1/3RTdNYFofPeJSIeky2l0DPmLFt+q12L
         +/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846290; x=1786451090;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2FnEQZnydKIEOLBRvdcOxOu6KeI6KaivMSPZcg9yKaU=;
        b=sHPljCVuL6t3NHfT3UCNP7srfN3KincbA4ef0YEpnA23JWKtqG2RfScMRRhzt1SIKu
         vOsaMjOSOA+73cnphzw7U6pPgq2FNhoh3Z0oPKjgHRxXPBx3NJkfrpDMfx+bIY+T7aeU
         BXiTSyTwcXz9DEHFaWS+T4r9hnH32twncit1iG/qWqf7r47OAIQ3lftbabze4YYSfYua
         rAQzMZI4Y8F/6l7tzDBnKln6aTrZZ+3I/Dg30aAebRV6LdAWZu0urn0+We1WXRewWs1Q
         zTy6DOFlIK92JhT7yu8PWbeueN+mFnAAZPDkeAs03B6BG7ktVNVMjoisBqaIP68llXA6
         0RYw==
X-Gm-Message-State: AOJu0YwGYHYs50oBe0Z1Sil5gIiydPhdhROnS7X1ESVeV/Vkr4Eby5YA
	Wv8WrZalmN4O6hfmdmeygyApODp+3qAQys5/qkxcHfUFG0Hvphje3Z1Yb4Boe3aspnbiW+5P9sO
	0hVeYov55s2jUMbOXOuNSfA0TEuL30DDXdQCqlAlNIq0oJLcfquyGXWEYqyYEPiT44c7BWAX+bK
	KUmQdvWx4=
X-Gm-Gg: AR+sD107yM9iVJlUQRuMBPpno2MWJZM32g5Z0UU98tv4oD/CgLdtaVh6zBeQUfbA8Fp
	QhUjSAOowlXJVXVXeJPs5Yq3XWY2akbnNXXn4lXa7rKSFByO2lVVM/i4XlySE+k9GuE80JJ9yro
	pSrY/2KVak0nDb1J8cBwaGVXtJr0bhwMljVIxvCLxoIXL3L+CFTTzCMxo/s3gREBbKHFghxMCKJ
	GzAH/jOeuoEk6EJX0hRs/G9Bv/AR7mtPfGYhszJ7Y0TOQ+hdxu9a+R2BiD4yqECoU4tq0e5y4zD
	l2kZvc1WxSxz8eRsQDulJsxYgO62HX9a2WLvEk5hiVmNmjrPsMvUAecFMU6F0bf4SSOl2SH7fVH
	1mZvH7VRXeHicP49d++6IJ5gq03+TnVr4rm8u1OSYpHWQoNDHgrwZeHRxXkGs0DByxAl9i7FRq3
	5B3yoba0E1jeBZNg==
X-Received: by 2002:a05:622a:2509:b0:52b:4e1f:941d with SMTP id d75a77b69052e-52b5666d93cmr271246671cf.6.1785846290036;
        Tue, 04 Aug 2026 05:24:50 -0700 (PDT)
X-Received: by 2002:a05:622a:2509:b0:52b:4e1f:941d with SMTP id d75a77b69052e-52b5666d93cmr271246101cf.6.1785846289521;
        Tue, 04 Aug 2026 05:24:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f810dc89dsm15512031fa.12.2026.08.04.05.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:24:48 -0700 (PDT)
Date: Tue, 4 Aug 2026 15:24:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] rpm: Enable PACKAGECONFIG[acl audit selinux] by
 DISTRO_FEATURES
Message-ID: <nvgg2pt3ksylrazgnihfdkqnfaht7bn25mj5tdfqtw5l6v2bbu@ssha5wbn5fui>
References: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
 <831673f23f130b01228e0252fbb750b459062fcb.1784039919.git.joerg.sommer@navimatix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <831673f23f130b01228e0252fbb750b459062fcb.1784039919.git.joerg.sommer@navimatix.de>
X-Authority-Analysis: v=2.4 cv=A5xc+aWG c=1 sm=1 tr=0 ts=6a71da12 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BitpZ73Vrm9YMc2e5VsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX4QMocpSEL2nA
 kB9VDFq9mhX5OmiHWt/vQssstujbTdcfKuJLzoeqQ+vlycXaDWpBrIr8QXSsICf5N+9Yw+kUlPv
 NIPnfXQ1o+iDHRc//tKLzsIFBKzzbvdVgVHbm04c2vqsf+GQK9EoRyqg7azEUtWgkIhak+jy4Dz
 xk0r0tI7THY0tiODyyDq/L9RL8pJnZHbqIPmHGNTR6tfEMHHQU+YVqZtgIWRYOtOenAf3sGoeU8
 4oA8FzDrRwXBD1fipON0JGnqTj/9+QlrNfud8o0W0D683sr7Sbwb+NMjH3+6BH4uVa3GOiyCZrD
 fEAZn3w5f7iX7MYG29pORst2WMa41JotNL59X1Ibj6jKJNKs6Ni0eyYXUkA0SLqMYLUGEFjpkwt
 aaqgl6fYtYS3FV1LnegCYhaVvcEBh3/SySuXaQb0SRgXNJL7Z1tHCqsaJNrmuoc84WpZ+HeRhDB
 IAHC3rD1NmZaRGTAUIw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX3NvL3v8V7h2H
 x8VJVsF+y+Tn9KkygDx23JMMFdEf2F0JBPfXi0GOueJcjcooMeGpZamcqHpE4ikJxTOSZs6bMkG
 BjTNYOpNlfrqVQrTXeztMG2AEkM0XoU=
X-Proofpoint-ORIG-GUID: mJMgeCqidC97eC7PvwWfISrGqv4jMUyh
X-Proofpoint-GUID: mJMgeCqidC97eC7PvwWfISrGqv4jMUyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040099
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 6748CBql3300213
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242748

On Tue, Jul 14, 2026 at 04:41:39PM +0200, J=F6rg Sommer wrote:
> From: J=F6rg Sommer <joerg.sommer@navimatix.de>
>=20
> Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  meta/recipes-devtools/rpm/rpm_4.20.1.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-dev=
tools/rpm/rpm_4.20.1.bb
> index ba967ec1fa..17e75c3e14 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
> @@ -64,7 +64,10 @@ BBCLASSEXTEND =3D "native nativesdk"
>  # https://github.com/llvm/llvm-project/issues/82541
>  TOOLCHAIN =3D "gcc"
> =20
> -PACKAGECONFIG ??=3D "archive"
> +PACKAGECONFIG ??=3D "\
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit selinux', d)} \

This broke SDK builds for SELinux-enabled distros since nativesdk-rpm
depends on nativesdk-libselinux, but it is not there by default. [1]
should fix the issue, if it gets accepted.

[1] https://lore.kernel.org/r/20260804114749.625810-1-dmitry.baryshkov@os=
s.qualcomm.com/

Otherwise, we'd need to drop this patch.=20

> +    archive \
> +"
> =20
>  PACKAGECONFIG[plugins] =3D "-DENABLE_PLUGINS=3DON,-DENABLE_PLUGINS=3DO=
FF"
>  PACKAGECONFIG[testsuite] =3D "-DENABLE_TESTSUITE=3DON,-DENABLE_TESTSUI=
TE=3DOFF"
> --=20
> 2.53.0
>=20
>=20

--=20
With best wishes
Dmitry

