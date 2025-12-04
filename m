Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D4BD1CDBC
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 01:55:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32863.1764813346594210123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 17:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=SEaqDKIz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4433fe26ec=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3JNLdA1105909
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 01:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=10jE2eTSl+4fhyx2NMwT
	bzdGcI/WgsUq0YygIGX1KxM=; b=SEaqDKIzNPlzfWciEOo3YoYF6cGQbDz+Q5ci
	4FWM0z6gLgoDGtmNZxAn/i1lsT4rvFcOURy+xZQGFsGkMDXbbiyCX4sZDCq45hCr
	A3wlZRQymcXknfBsfUFPIyJk2XUvB6zkCqnxww0QHw0ueyi0VQ9QfbULxOiga9JU
	0TqmTDxaQr51vXuVkAOSua0HZ/mvDS/TLLjqOMT2cYEm4e5Sucr5CCnO6RmaFZlh
	EiaXinPXIynA6iuBW3bpRvE4OyomWET1xfe9ZL4iWf71KkwGVyAOpEr+l6S/3fsE
	WkZlj+pOxGD0wVNloouTXIL3YVb/c21EOOwER7HqV8K76nbD8g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21wxer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 01:55:44 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 17:55:43 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 17:55:42 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V3] shadow: disable econf
Date: Thu, 4 Dec 2025 09:55:41 +0800
Message-ID: <20251204015541.974924-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: adDp_gN7fzj18AwsylyCaFGLYVtCsAAk
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=6930ea21 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=64m-eIDTx6xU9cptawUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAxMyBTYWx0ZWRfX9B2HPLUPumX5
 n8jnPjC4QbT8PbDticuuGxZuHd1CBBbe2AfwrrLdCb0r+h8AlNyx8VviePN9DacawhVMtnjiTOq
 6xfKcq/FYRAhrW/MfN+mpTQzdLSrRnvCzSrCHpR8n+hQqpm1hRuZsqrscA5fosfDGxR/0nD00rP
 +3kmeYyeFbOYLZcl1CbPtAOEcGabuTgEJ5fdklfvC+HEUxt3cI5lp/w7D5qPL9tvSNHq2Dopjo1
 9Vbr+mrHqftQQAsN/FgR/5HEAXyPjs6vCJYtVnAyrxBB4/cd6rowERGckiHuReIgWPvn53chgoY
 ZE28a5X2bZzL0d3CEvKfkEGOWfHrURvf/pbjLM40yhPhEnBhKu5CUXyYkzQhgsYwnFSCzjEI5dn
 zKzUU26axdRSvC07kGiJUTBN16oSZg==
X-Proofpoint-ORIG-GUID: adDp_gN7fzj18AwsylyCaFGLYVtCsAAk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040013
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5B3JNLdA1105909
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 01:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227247

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
index ba65fc7196..d9a49d8ccf 100644
--- a/meta/recipes-extended/shadow/shadow_4.18.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.18.0.bb
@@ -46,6 +46,8 @@ EXTRA_OECONF +=3D " \
                  --without-sssd \
                  ${NSCDOPT}"
=20
+CACHED_CONFIGUREVARS +=3D "ac_cv_lib_econf_econf_readDirs=3Dno"
+
 CFLAGS:append:libc-musl =3D " -DLIBBSD_OVERLAY"
=20
 NSCDOPT =3D ""
--=20
2.34.1


