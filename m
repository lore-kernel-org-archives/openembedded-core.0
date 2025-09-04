Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462B4CA1014
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 03:40:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.31405.1756957232302260335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 20:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=glLgqliX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=134255f852=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5843eMxC2248631;
	Thu, 4 Sep 2025 03:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=zhltP6AIP
	Iryk12bamqg33CjGUawoLyuxaAaOaMJ2QU=; b=glLgqliXav4d/QNswgJP983M9
	3h7CmJGjXxE8zV8dVYa9/XtL/5E1fa5WeVaZW0BsUVT6osfawGxfNetXWiCz/C9D
	5qVYScdwUu6qZxnGdKh+MWiAY8MyKkCmrxKrdpXCMtBxrqizuooXaZfcdSQqKMZ7
	KsRqrP8anpIovFhBsamxRCLJqEbYMF4rHFeTMh7yVFFuzZd3rtfHwhv3H9iBntjj
	lPPw8/FHhlkDq2waMptJuSVol9xb3sdfvJsSNhta2SsnKwg+JO+WsIiMwfhuNV1Y
	qCmAVGJ+jHmp9ruj+Q3i5S/dcrl89lZt4HOikg53mmo2axcsQYChm3KB1TFCA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y0ygr2ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 04 Sep 2025 03:40:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 3 Sep 2025 20:38:49 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 3 Sep 2025 20:38:49 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [PATCH v3 0/2] automake: 1.17 -> 1.18.1
Date: Wed, 3 Sep 2025 20:40:37 -0700
Message-ID: <cover.1756957117.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDAzNCBTYWx0ZWRfX4MljZYhlOdx9
 FbyePNe6p3OsrXG2ZK+fHc1TXIcn0BN6VUNacSX/FhlY6PRhQtXvu0rVWe9beZ2016Ag49hOZN0
 nYQASez++OvPVcTTLUzNbKovxS8zqsj9JeKR/idcyrfbNwymt16GyMhmtoxo16/234MPKML2Wmn
 2gKmlxVcxOPcxICjEU9qQpZyZDnH50/QAuUsbVLSGSLR5VP4TqZqZauBoZXFjKwxRqz5qN6LCxN
 Bhexs2WJNa6KOenhlnC/emI/1G1VOe29V/NeijA1ZbxUlvcHTesmw0b6hWve4Rf36kkXCNHIuB6
 7MrUmRWAaQpUWbYPGgzkjM9cFrS0POJ1ojmg8aCpX6pi9oj0X/DJk0r7ER0ZBg=
X-Authority-Analysis: v=2.4 cv=T86MT+KQ c=1 sm=1 tr=0 ts=68b90a2e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=fuzfE7A_dYdV6NSxSoIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: G1ay4JKPX02Fed57BG9gGTEdz8EgvXpi
X-Proofpoint-GUID: G1ay4JKPX02Fed57BG9gGTEdz8EgvXpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 03:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222890

From: Robert Yang <liezhi.yang@windriver.com>

* V3
  - Upgarde to 1.18.1 (v2 is 1.18)

* V2:
  - Drop 0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch as Ross
    suggested.
  - Take a pull request from github to fix libcheck's build error with automake
    1.18.1.

* V1
  - Initial version

// Robert

The following changes since commit 0a849dc7edeecb6c16a8a0fe347015d6d85e9dfd:

  vte: upgrade 0.78.2 -> 0.80.3 (2025-09-01 23:07:03 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/pu
  https://github.com/robertlinux/yocto/tree/rbt/pu

Robert Yang (2):
  automake: 1.17 -> 1.18.1
  libcheck: Fix do_install error with automake 1.18.1

 ...report-error-when-the-path-of-Perl-c.patch | 34 -----------
 .../{automake_1.17.bb => automake_1.18.1.bb}  |  3 +-
 ...0001-Fix-texinfo-errors-and-warnings.patch | 60 +++++++++++++++++++
 .../libcheck/libcheck_0.15.2.bb               |  5 +-
 4 files changed, 65 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/0001-configure-don-t-report-error-when-the-path-of-Perl-c.patch
 rename meta/recipes-devtools/automake/{automake_1.17.bb => automake_1.18.1.bb} (85%)
 create mode 100644 meta/recipes-support/libcheck/libcheck/0001-Fix-texinfo-errors-and-warnings.patch

-- 
2.49.0


