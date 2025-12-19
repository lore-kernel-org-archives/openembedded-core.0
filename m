Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA541E6689D
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 21:43:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27208.1766180585581519727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 13:43:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=AAPma4/m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=444801525a=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ5bowC3548124
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 21:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=gxX+Nw4KS4p91Y0PcKjJ
	hSeo5oWy51EeHcLCTvxTRyU=; b=AAPma4/mh0SBeGiCOcqgC8xaJQqhPY2nr6Xm
	ZDa10DSz5PP1QnxNtVgfeASJD1V/f4JH7NujXkshwYVhyU1GMsexJgybHUQZM3GS
	on9UDdnl81bkiizomDEpVYCa+x5LEHy7KN8VGenBO++w9AWrXMS2vhV17y63Z6zi
	VEbLH/F5a89mOiJYlQYuIbcR8NmyBzpjuJSKqQcQR1Ap1Z9jAQJZ18+ru2D5/JDS
	5OfgF+lpv2OAy08J+Dy2EJm3VjOI3vn9ybCd2r1eyHW9Z7lDWzuNd6wPI6Ns8nOZ
	/A+do8vTXvWkN9Jg7XdaS5CclNCCCGoVJbU/X0UY8/TyszDLaQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b4r2x1crv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 21:43:04 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 19 Dec 2025 13:43:03 -0800
Received: from pop-os.wrs.com (10.11.232.110) by ala-exchng01.corp.ad.wrs.com
 (10.11.224.121) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Fri, 19 Dec 2025 13:43:02 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ed: upgrade 1.22.2 -> 1.22.3
Date: Fri, 19 Dec 2025 16:43:02 -0500
Message-ID: <20251219214302.2212274-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: GgZvq532qDrEou0v4RberYJ8W8o8Ib7n
X-Authority-Analysis: v=2.4 cv=Qbdrf8bv c=1 sm=1 tr=0 ts=6945c6e8 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=0P9tRGyYAhKlgAHoTzwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: GgZvq532qDrEou0v4RberYJ8W8o8Ib7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDE4MSBTYWx0ZWRfX1o62FKM3cD0q
 FIKqq3XJje6/rvyR5PJYvNrP5lE8AfSyg/XzyUt2s0LBo8LOwdJP2SOjIrcHd4DwPILyd7/SVl1
 V0hGYvFTJ3BMzLNPdide2sHOj1/X3oJkCL7HQC+cb3L5d3cVZLjbNzvUeQNlIwjlN3XeTsQGvva
 +bmLRIFm99uvozdlmtyANXnSjEzYrXv1Ql1pWTWdBzeRZIa2DPBDLV88Kba2hkBLPmZLMbQzXHo
 BB1Xw+A5DohAvqPoozQLAeR0CxRzDmQNEzExcK+KAoDA2RCUc8bV0R6/Eur2DvYIXuo74q6Ozlm
 EUVIddQc2fWEXuLJJKvWDLrfl8uSHHJ+yDnhTp9r+jK5c+TDbWvvz5MrKILHfq12PflZE/mBy9s
 aFf+tU+6ugjYtQJbr0HjpoOt/ESE3QM0XVIiDJOS/v5gN6Xc5m1yszdtbVnpHKnqt+4CknXtR5W
 wJ2T/n0UMkrvWUWasNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_07,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190181
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BJ5bowC3548124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 21:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228246

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Changes in version 1.22.3:
   * The change to print the file name escaped when replaced into a shell
     command has been reverted. (Reported by S=C3=B6ren Tempel).
   * When '--unsafe-names' is not specified, only the control characters =
\a,
     \b, \t, \v, \f, \n, \r, \033, and \177 are now rejected in file name=
s.
   * 'make check' now checks file names with non-ASCII characters coded
     either in ISO-8859-1 or in UTF-8.
   * 'EXIT STATUS' now has its own section in the man page.
Testing:
   root@qemux86-64:~# ed -V
   GNU ed 1.22.3
   ...

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-extended/ed/{ed_1.22.2.bb =3D> ed_1.22.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ed/{ed_1.22.2.bb =3D> ed_1.22.3.bb} (93%)

diff --git a/meta/recipes-extended/ed/ed_1.22.2.bb b/meta/recipes-extende=
d/ed/ed_1.22.3.bb
similarity index 93%
rename from meta/recipes-extended/ed/ed_1.22.2.bb
rename to meta/recipes-extended/ed/ed_1.22.3.bb
index 80d4e116ac..1a5a28a039 100644
--- a/meta/recipes-extended/ed/ed_1.22.2.bb
+++ b/meta/recipes-extended/ed/ed_1.22.3.bb
@@ -19,7 +19,7 @@ bindir =3D "${base_bindir}"
 SRC_URI =3D "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI =3D "${GNU_MIRROR}/ed/"
=20
-SRC_URI[sha256sum] =3D "f58d15242056e15af76f13f34c60d890fa2a2d5cb0abef91=
c115e4d83794ffe3"
+SRC_URI[sha256sum] =3D "47a55ddfc52d4a1ff6f7559fbd00cf948a16b6cf151ec520=
392761aeae4e97be"
=20
 EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
=20
--=20
2.34.1


