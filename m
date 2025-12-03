Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6B2D116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 06:27:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8944.1764743228596179626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 22:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Zo2huqiO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=443295ddc8=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B34tl0g2510471
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Dec 2025 06:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=tz+M7QEkIea8rMMFVxkJuVAS4UcSF04U36Uh8g2AIV8=; b=Zo2huqiOeqA0
	yoGK0s5362m6V8DpCO/Pm0g70X5SEUAkckN9Nl4Sh2QChbmjfjAZ5UA0PgHKP9Pg
	8W1estZe8pm8YznUbD123L3DPfQxKhHFfo5Ic2YEGS8qHCwYt8Fdy6GC3FyC1xHj
	ClBvOhPJ4kZdwKMFMQUwjORd3CIxPzNLaiiWzTZ/6SxUCXDi9WHdvNJUOIoVtUpY
	3U8s2zawwm4UCDizmOrTExi/pgRYiaPBoKfYLKM3dyTBLC+3q8YXNsw1dsLvsuzu
	Cbmpt+l5E/an3tEdnthPoE2ysx5VPua5BeiSg4XcAsn+O4JORuhcbCYs05L9noro
	rZEv7yywow==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6cenx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 06:27:07 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 2 Dec 2025 22:27:06 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 2 Dec 2025 22:27:05 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V2][PATCH] shadow: disable econf for native
Date: Wed, 3 Dec 2025 14:27:04 +0800
Message-ID: <20251203062704.138197-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <187D937D5EDF22BD.489296@lists.openembedded.org>
References: <187D937D5EDF22BD.489296@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA0OCBTYWx0ZWRfXwedGLqW2DAi+
 XLxWYwhnwDrt6VTjC/beQo6ycpXbuuuskvnWO3OanXWtEIri49A/FodC9hALgqYAe3qgXFV6x84
 yc7AiXyx7GT/RPou1QWhZty4Mcxad23W2UaD/Tnw45nCI8MRqiTbMh4Bsxy2y3YORb/ak+SS9ti
 1UeielcErApaWGG1aq+IRe5UECeIOJeN3jF+B4jytq4Ga9w1fN8Hsczvy2JhwtfwOo9uXW8dLh6
 Q8H4rzDPdEQv21kRls1H8ybMrwwkAMF+2f+RgrC38WQIOpMlmr8ZpB3KyMXMhu0q2YUTByqhXF3
 SXBqnfizhSoLer0/92qAujHBJgKjs4HgABrQ1sbXQayzkyoSJwNsinZD+VuHQwiD43JTXt5+t2A
 2adqUMXl+QuckAIvnqKhBplZ8kP3Iw==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692fd83b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=DgK0dKQ_K_6DdB4U2G4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: rRrqXekMq6ebq-kHgUbGsRoeOVv5NuIc
X-Proofpoint-GUID: rRrqXekMq6ebq-kHgUbGsRoeOVv5NuIc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030048
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B34tl0g2510471
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 06:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227201

From: Changqing Li <changqing.li@windriver.com>

When libeconf is installed on the host and GCC from extended buildtools
is used, the host=E2=80=99s libeconf is detected and -DUSE_ECONF=3D1 gets=
 enabled.
However, the buildtools GCC cannot see the host header files, causing
the shadow-native do_compile fail with error:
../../shadow-4.17.3/lib/getdef.c:22:10: fatal error: libeconf.h: No such =
file or directory

This patch disable econf to workaround above issue.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/shadow/shadow_4.18.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow_4.18.0.bb b/meta/recipes=
-extended/shadow/shadow_4.18.0.bb
index ba65fc7196..42d0d54b3a 100644
--- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.18.0.bb
@@ -46,6 +46,8 @@ EXTRA_OECONF +=3D " \
                  --without-sssd \
                  ${NSCDOPT}"
=20
+CACHED_CONFIGUREVARS:class-native +=3D "ac_cv_lib_econf_econf_readDirs=3D=
no"
+
 CFLAGS:append:libc-musl =3D " -DLIBBSD_OVERLAY"
=20
 NSCDOPT =3D ""
--=20
2.34.1


