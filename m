Return-Path: <PritamSrichandan.Sahoo@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CED8C44501
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 15:33:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12406.1783611207439654190
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 08:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LmXMhL+8;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild11.wrs.com, ip: 205.220.178.238, mailfrom: prvs=1650dddb60=psahoo1@oak-lpgbuild11.wrs.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669EdQEI2440672;
	Thu, 9 Jul 2026 15:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=HkOUomL8f
	YoiHFGyQHbhr+rSfgYLjLhfIzGeAieLgq8=; b=LmXMhL+8qH/I/ObEx5cax94j+
	qOSl9M08PEGi4cvqyMBxC/4iBMlDP9XYmtOkB8VKT1f+PskDAkXU9aLz9yL0tEFz
	jovlbF0nbiH2g2GF0PurnfcMZFQ420EOQcI08mmPXdvhoYaWPZqPnocb8I7lc5pS
	E0GstkVpLGC/C2rr5FqkxVjXnMvyCbga+GcV4xFjyELaU6yb/2074PROrHyeJuQZ
	okgPOd0EcHgtAjQwIvpTe60Ghy8zZ/14a/8xevlt6eup3FseKTGkN+eFKZ4DiBqd
	K9NxQvDQfeYeiRJkdmNBpoDQ8Foy5XbB7W2SOJeKbvRYSyQJnNGDEQsgm+TvQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fa1h215jr-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 09 Jul 2026 15:33:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 9 Jul 2026 08:33:22 -0700
Received: from oak-lpgbuild11.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 9 Jul 2026 08:33:22 -0700
Received: by oak-lpgbuild11.wrs.com (Postfix, from userid 1762445297)
	id ED1AD404061B; Thu,  9 Jul 2026 15:33:22 +0000 (UTC)
From: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, <Yi.Zhao@windriver.com>,
        <Shiva.Komati@windriver.com>, <Qi.Chen@windriver.com>,
        <Libo.Chen.CN@windriver.com>, <Jinfeng.Wang.CN@windriver.com>,
        <Shailesh.Masih@windriver.com>, <Tomas.Holmberg@windriver.com>,
        <Haixiao.Yan.CN@windriver.com>, <yoann.congal@smile.fr>,
        "Pritam Srichandan
 Sahoo" <PritamSrichandan.Sahoo@windriver.com>
Subject: [wrynose][PATCH v4] gnutls: fix CVE-2026-33846
Date: Thu, 9 Jul 2026 15:33:20 +0000
Message-ID: <20260709153321.2000551-1-PritamSrichandan.Sahoo@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a4fbf46 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=1_5am0pH4Q679M9krJkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE1MyBTYWx0ZWRfX2ELmfAi+biUI
 NaEJDxa6JVqIXgYJ3EeeGkSCwA7BPz/buzVR7qncgAvJH77Hk0ca3+FWvEb5/I6u859CiahnEi5
 ZLqKfXedLOP+a/+mSBISbMY3as8QGFXjPZhIcomD2ceM5D/NB1we
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE1MyBTYWx0ZWRfX1mtpy/Yfwfi6
 X336WaDePvG9WGDpiVgwfZn90jDFerEfC4awsbJ7zRGAHGL8q59F1LSOXCMeSBSKKKSIM+vyudJ
 KoxxxFJbNzPJZGBl9SKlxC6Vlwh11PifKUWL+SAEfdDuubmCnKePpXdwJIosdWigZ56jUpUoGXt
 YDDhu32++njkvoV5f8a8F1U9B9TugL1uDUgfgH3UOxQ+Qs+FklIRXfGJrJQeSl/CuZpxZu2pVU9
 xE/hLWZ3HspOpxv7HWjYHUWY1P+ATo5Gr5b1EceV8y1tckvUPnQBDvoSHfcwxGuiPOK12QjBtv4
 DQFbLzZ1jpg5R8QmEkLfMzYMXC01QRCAfeHRgsYn7hPRn8Ir8FLA6iQLzEs2vf/nguTiTh/eMRW
 DnhwZ/O5y5wpWUxyNKKy/K6v/L08tnTXIEeCHlw44JGKwPJ5Zck5LZIGbym0CJ4JLKDJCpQjSUE
 TV//asB4cRBmfM8gyQg==
X-Proofpoint-ORIG-GUID: GhPZYBSl5ofijvM4eiEfSQc_TsAVMt9f
X-Proofpoint-GUID: GhPZYBSl5ofijvM4eiEfSQc_TsAVMt9f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090153
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 15:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240587

Changes in v4:
- Split combined patch into 8 individual patch files, one per
  upstream commit.
- Each patch includes:
  - Upstream-Status: Backport [<upstream commit URL>]
  - CVE: CVE-2026-33846
  - Signed-off-by from upstream author and submitter
- Single recipe commit that adds all 8 patches to SRC_URI,
  preserving bisectability.

Changes in v3:
- Squashed CVE fix and musl LDADD fix into a single commit to
  preserve bisectability as suggested by Yoann Congal.

Changes in v2:
- Added a separate commit to fix musl build failure for the
  mini-dtls-fragments test (missing LDADD for gnulib).

v1:
- Only contained the CVE fix. The musl build failed due to
  missing link to gnulib in the new test binary.

Tested with:
  echo 'MACHINE = "qemuarm64"' >> conf/local.conf
  echo 'TCLIBC = "musl"' >> conf/local.conf
  bitbake gnutls

Pritam Srichandan Sahoo (1):
  gnutls: fix CVE-2026-33846

 ...fragments-implement-a-basic-DTLS-tes.patch | 258 ++++++++++++++++++
 ...merge_handshake_packet-using-recv_bu.patch |  96 +++++++
 ...s-add-more-checks-to-DTLS-reassembly.patch |  65 +++++
 ...fragments-extend-with-a-1816-reprodu.patch | 159 +++++++++++
 ...fragments-extend-with-fragmenting-Cl.patch | 149 ++++++++++
 ...ch-DTLS-datagrams-by-sequence-number.patch |  42 +++
 ...fragments-1839-mismatching-message_s.patch | 104 +++++++
 ...ts-mini-dtls-framents-link-to-gnulib.patch |  27 ++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   8 +
 9 files changed, 908 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-fragments-implement-a-basic-DTLS-tes.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0002-buffers-shorten-merge_handshake_packet-using-recv_bu.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0003-buffers-add-more-checks-to-DTLS-reassembly.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0004-tests-mini-dtls-fragments-extend-with-a-1816-reprodu.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0005-tests-mini-dtls-fragments-extend-with-fragmenting-Cl.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0006-buffers-match-DTLS-datagrams-by-sequence-number.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0007-tests-mini-dtls-fragments-1839-mismatching-message_s.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/0008-tests-mini-dtls-framents-link-to-gnulib.patch

-- 
2.53.0


