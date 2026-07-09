Return-Path: <PritamSrichandan.Sahoo@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3DDC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 12:50:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8465.1783601414384276880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 05:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=T6FuJoR8;
 spf=none, err=permanent DNS error (domain: oak-lpgbuild11.wrs.com, ip: 205.220.178.238, mailfrom: prvs=1650dddb60=psahoo1@oak-lpgbuild11.wrs.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BQUJ32104200;
	Thu, 9 Jul 2026 12:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=2Hu6wdx9D
	N6HQ0zkIMaPJbiDFXJFqN5EjOOqF5Uvb6o=; b=T6FuJoR8U3f7yNQAH+2vDBhuP
	DaBgUL1DU7+M97h/m68g4bpekPXpipq0szmIQoqJuraQC9fTnwHBTo8xcjf5R/1a
	n8ZVvTv99zQ5er7SXOIPjOi+WS1tBIZQoe6S4eZ+7DbmbciO84bdbLUiVMEGQnwo
	SONBvn+KaKF9CVw33qH0bNi2HXu/xMCK2317l7A6KnhfLEGq1OkW1EXCu33uX5eq
	l3wQf13wqAlKiLtXb4+unJ0fGQNoPrgCDKXT4K0Jz1VxG9Y687lHl2p0o/4llsFO
	53ccQMXxtVtqRMvwKzUvQfhhWG9ny/mlsoU2yoQYnMu8lvpe38FDsU7OYKzjg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fa1h20vyh-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 09 Jul 2026 12:50:13 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 9 Jul 2026 05:50:10 -0700
Received: from oak-lpgbuild11.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 9 Jul 2026 05:50:10 -0700
Received: by oak-lpgbuild11.wrs.com (Postfix, from userid 1762445297)
	id B224E404049C; Thu,  9 Jul 2026 12:50:10 +0000 (UTC)
From: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>, <Yi.Zhao@windriver.com>,
        <Shiva.Komati@windriver.com>, <Qi.Chen@windriver.com>,
        <Libo.Chen.CN@windriver.com>, <Jinfeng.Wang.CN@windriver.com>,
        <Shailesh.Masih@windriver.com>, <Tomas.Holmberg@windriver.com>,
        <Haixiao.Yan.CN@windriver.com>, <yoann.congal@smile.fr>,
        "Pritam Srichandan
 Sahoo" <PritamSrichandan.Sahoo@windriver.com>
Subject: [wrynose][PATCH v3 0/1] gnutls: fix CVE-2026-33846
Date: Thu, 9 Jul 2026 12:50:05 +0000
Message-ID: <20260709125006.1802142-1-PritamSrichandan.Sahoo@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a4f9905 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=FmpZbd-4ep5aItF2j40A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNSBTYWx0ZWRfXzy/kIZvjPaDa
 xTUKuulCHTZ8lCmfykePsDa/J7UxGxzNbd7yVZL5U3lDPNhk2h5YEduV0bOdSg5kkLlCrYk2sGw
 UXmghYQzyJSz3u+kDrgEjkFRfduepBYBIech7QviOKvF+P3FeNHC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNSBTYWx0ZWRfX4guwlI+MgenD
 a2b/S5wPvIbqjQhbOUkUGkdnrY1nUcJVKo2wKRtuMif7x335r1ud2jlRSJFLNwo4BsKYG3p3ZWY
 +MHmXx6dq3s9ncy36QAc+qVm5LbQqKnSmeh9LyDELUqB2LRh3GI18nrSh1NyEwpf/jvHtzPv9xL
 UtzYSFVo1s2awM+p5zKM4YEHSM5/UnLCiQ+UzcOtacBEw+lVZ1yILGz/ULLw3W5HcVjxxbe4RZV
 UJyp2rEznD8RxKy5DhXocdM7bzhCjkl2LgGxjAXATVgszGVBaslDG5NiXlNEZ6LYQRV27QFA1wQ
 kp9V8lkzjS8Nfbc51zXeF7CofUALh0DMozB9cTuuEAzDDQ8BK/WUt2TUjAuA00vogQPorx4lqnO
 lA+ay9G0GZY8j64RxXKfwjSS4hb9p94cSyx6sLpGYqEDcGE55O6G+ARQSbKqv0XLwsKIN2CESo6
 IKFXbkn+DaSQD7cK7OQ==
X-Proofpoint-ORIG-GUID: NA9H87WTKn6EeKCX2I40wmN73Xg9knC0
X-Proofpoint-GUID: NA9H87WTKn6EeKCX2I40wmN73Xg9knC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 12:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240578

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

 .../gnutls/gnutls/CVE-2026-33846.patch        | 864 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
 2 files changed, 865 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch

-- 
2.53.0


