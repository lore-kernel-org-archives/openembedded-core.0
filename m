Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A300D31A2C
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 09:04:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6405.1768381457207411895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 01:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J0hGioiV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5474771f1a=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E5cSQB2773568
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=iTRJ77kWSntOB+k3FXM9
	m2tZm6PajsL424FIV/fuFnE=; b=J0hGioiVdIFfKkLjgTYQ0UGjo5YTzzva2doK
	xoYLSN2OW1yHkRzRQdWRX4/5T2ohYeepGzwTxwztXOtoTU3vCf/cDEmBR1EjMNSM
	PO9RmB8lU/5tTGdTxv6Lz3egoTtI4ZAkJfUfIbBIC418EOFIgcMh7/4fQhyQAal1
	98HRDnU5pOfau8N0xoWGn3Mplfgm9raof2tJ4yKvkdmcet0R5XeyioYolG6ywQYO
	pAWRVWJoM/I1ztImOHyBpwHDU+Y2RTQfA0km92OSsGFN4EglxFf57YT/ddsQD6fp
	DABnxXKu0AEP3Nh20xbp+mfGLK8nKJT/bbFOpdtOaS7xYnA3vA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkdr2m807-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:04:15 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 14 Jan 2026 01:04:14 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 14 Jan 2026 01:04:14 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sanity.bbclass: Lower the length of TMPDIR limit to 300
Date: Wed, 14 Jan 2026 17:04:13 +0800
Message-ID: <20260114090413.586488-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7PxavJg985fxgAm3mia_QNb_W8c5GIQD
X-Authority-Analysis: v=2.4 cv=fLo0HJae c=1 sm=1 tr=0 ts=69675c0f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=HMG2ayM1AAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pKvnJipwrYfUzYSC_JwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 7PxavJg985fxgAm3mia_QNb_W8c5GIQD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3MiBTYWx0ZWRfX0KlPcDzVMmdQ
 FxAI2bCSl1rBenJy8bmaoIfgtFGygux9fn8TGlaFVcNfSl0GeviY3sd1d3pbcI34jockR6hHnNO
 qfmeR7AsO3jcGc4SzT8tYFdjOpjUIUWX0yEJeRYwSTMWREXh4LbSi2ipDEA91sZ2txx5tqoSHI+
 wJ2XR1jaJLmnOfCt1WlPskXJn0GpNIpwpV7EFuMqrTX9TkL8f7dyd8DPHfdmjX53puGwIfg0m29
 tNmLhSaDxfYez/u92lxEz3Yf6VL20my1VYKcOxQ1imwdeFka4HkCaD2KbHRXuh/yzSGhQn2heYc
 nYZZTSMxbE1SJqADr3YgQO7KZPB1ni8l35A7sqgechSo53lJIC0xNXfw1MRjKl7vYWwWwLEMc1b
 teLtzhWVpsK8YMuxGEsq/VBfsIsFthGcjXkkFnpAcGf0s2mBJ3YcwUiwILIrsRndDCKPGYg7jYR
 ZmZJPSY6Hmy966kP6DQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229308

From: Changqing Li <changqing.li@windriver.com>

With TMPDIR set to 400, gtk+3-native compile failed with failure:
ninja: fatal: posix_spawn: Argument list too long

Refer [1], one of the meson.build of gtk3, the list of files is long,
and with a long path, there files list will make arguments huge for
ninja. Refer [2], the open issue for ninja, meson need to improve
to make this work, and there is a fix for this, refer [3], but we can
still reproduce this issue with poky, I open an new issue for meson,
refer [4], and meantime, change our TMPDIR limit to 300 to avoid
this kind of issue. I also tested with 350, not works.

[1] https://github.com/gooroom/gtk3/blob/gooroom-3.0/gtk/meson.build
[2] https://github.com/ninja-build/ninja/issues/1261
[3] https://github.com/mesonbuild/meson/pull/7245
[4] https://github.com/mesonbuild/meson/issues/15423

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-global/sanity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index c89ff2c51f..376f6e66af 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -803,8 +803,8 @@ def check_sanity_version_change(status, d):
     if not oes_bb_conf:
         status.addresult('You are not using the OpenEmbedded version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n')
 
-    # The length of TMPDIR can't be longer than 400
-    status.addresult(check_path_length(tmpdir, "TMPDIR", 400))
+    # The length of TMPDIR can't be longer than 300
+    status.addresult(check_path_length(tmpdir, "TMPDIR", 300))
 
     # Check that TOPDIR does not contain non ascii chars (perl_5.40.0, Perl-native and shadow-native build failures)
     status.addresult(check_non_ascii(topdir, "TOPDIR"))
-- 
2.34.1


