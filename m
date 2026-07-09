Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E382C4450F
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 12:21:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2681.1783575398001631331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 22:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NIBg1msv;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild11.wrs.com, ip: 205.220.166.238, mailfrom: prvs=1650dddb60=psahoo1@oak-lpgbuild11.wrs.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669513lE1489909;
	Wed, 8 Jul 2026 22:31:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=MH5iObWlX
	ZLI3PNWM+f59oPyKvrr36Tafz028ieN7mE=; b=NIBg1msvfSaQkF8eL2ZqnHf5N
	66QGhA5IS0YyRqv1htDEOhkBLE0cvyonhuNkLag1cG8LHAGONMAj/HAJ7lZGN99d
	6Dg96xU8fYv+guRoUVu4IR3pyzxLMpPEBvUu0NnxiW4fphg9F9X2zHrDm10W7+BH
	nQO6m/KvlwEfa2/lDJxqEZQjMnvgh1tl0aTXtNKbZnFAnoHJ8J11ov9YVDniOICp
	H+0MW98w+icUgP1HEpOFi6gARlQHc1+tppaEc0HnnuffQ9HvlVd3ubo9dYVnh4o2
	YTMy6IGHfetgcxAxvdPVMwdOi5BDpqEp+kU2jXy+EhFdSDnPvCJmk55D/dKUw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fa1atr93a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 Jul 2026 22:31:10 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Jul 2026 22:31:09 -0700
Received: from oak-lpgbuild11.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Jul 2026 22:31:09 -0700
Received: by oak-lpgbuild11.wrs.com (Postfix, from userid 1762445297)
	id 1DF93404049C; Thu,  9 Jul 2026 05:31:09 +0000 (UTC)
From: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, <Yi.Zhao@windriver.com>,
        <Shiva.Komati@windriver.com>, <Qi.Chen@windriver.com>,
        <Libo.Chen.CN@windriver.com>, <Jinfeng.Wang.CN@windriver.com>,
        <Shailesh.Masih@windriver.com>, <Tomas.Holmberg@windriver.com>,
        <Haixiao.Yan.CN@windriver.com>, <yoann.congal@smile.fr>,
        "Pritam Srichandan
 Sahoo" <PritamSrichandan.Sahoo@windriver.com>
Subject: [wrynose][PATCH v2 0/2] gnutls: fix CVE-2026-33846
Date: Thu, 9 Jul 2026 05:31:04 +0000
Message-ID: <20260709053106.1630373-1-PritamSrichandan.Sahoo@windriver.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: AEMh6GfooSY9uWce30Xyyphr0U2tbApN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA0OSBTYWx0ZWRfX0qEeniU9cr0x
 RUF97XsM84EQCIe5DifPb1isbdKofcaokOx4E9tahT96elgMuB09surXISA7TLJ830OMKaz9VIk
 Q4scn2vSxnT5FkVc2ZBgP/sfvpH+2HZmgvF1qnvKH1lDB3meJGopP2WzGI4Ek31UV+dmFAKGxpE
 XTQHXI8ST0lf1k9Dn3Olp+WLQFg5uUDdKdjzHPuONLd0XaXJ5zpL4ZBCtz/I2ROVvGiz7JRPCrO
 CqY947H6bdaua0tm0dAeTCnOcCSDJCxuCCI+zB4yUH24dLMtlqqCU6AYjrbcZhBBtbcv2fsgozF
 1GDADaON86H9+TlBDijr31gm18RBuwtgEqT/E8e303NpEIbbrrkYoby/6xVFuSGyr2oU5kYMQ5y
 NBrouRevI+SWZJXrgnjpWsY61cUIRSzGFftKnKYnG0iZqK4x3nZgMgEtvtZp0XsuzFmtJg55cC0
 CbTveHyT9Kq5CcPHGQA==
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4f321e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=FmpZbd-4ep5aItF2j40A:9
X-Proofpoint-GUID: AEMh6GfooSY9uWce30Xyyphr0U2tbApN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA0OSBTYWx0ZWRfX/7Z5Jjx9t8Ck
 Funfg0pIt9hUXJsg9DmFVjrjvdI6oKQYfsSbFw1/W5Kg2tFX/63YXCcMdmk6ikUEMHvmOKbrSQI
 WCPI0OFV/7GOnoKKzTNUcgD1eGzwBxzMGNBa67Q5cv1f76Hy+sCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090049
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240873

Changes in v2:
- Added a separate commit to fix musl build failure for the
  mini-dtls-fragments test (missing LDADD for gnulib).

v1:
- Only contained the CVE fix. The musl build failed due to
  missing link to gnulib in the new test binary.

v2:
- Added the musl build fix as a separate commit. Build now
  succeeds with musl.

Tested with:
  echo 'MACHINE = "qemuarm64"' >> conf/local.conf
  echo 'TCLIBC = "musl"' >> conf/local.conf
  bitbake gnutls

Pritam Srichandan Sahoo (2):
  gnutls: fix CVE-2026-33846
  gnutls: link mini-dtls-fragments test to gnulib

 ...ts-mini-dtls-framents-link-to-gnulib.patch |  25 +
 .../gnutls/gnutls/CVE-2026-33846.patch        | 862 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   2 +
 3 files changed, 889 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-mini-dtls-framents-link-to-gnulib.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch

-- 
2.53.0


