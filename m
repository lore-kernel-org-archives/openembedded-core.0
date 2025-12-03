Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3586D1266D
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 05:22:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8163.1764739338365219575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 21:22:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QEfeez88;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4432e9699e=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B34uMIO1120387
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Dec 2025 21:22:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=cjv/9GgcNpmXdBUz0hQy
	Q9Y5mADccKfxHxvwrbS4qDo=; b=QEfeez88rGtiPXdOg3or6bx/nS64//P6rvAA
	dNviIkvMEmXUuzj+9zUdbumh6/yjlBLfv8XgHtWOIE+JxVjMZrdhivz26KZW1th9
	xpZX092Wl1OWIgteQxFas7fuKp8xk45i5R3gbAVG3y6RJ95T4xKdsL80NLsPmzb6
	Xw5hShPn20bVOsLiQf8G1fJ4BYKqZrRfTzh67sbZk4BAZ+sO8kAKNPPFRKIRCrbU
	b8ymjvH2jttpFGwBHy46gNyJeERNNYyfexmB/BuxrFY/jHw5eDy7RK99GqB1hwx5
	1+kp47wLC2cThvA/SPePAMedVn4GC/TPxWztUxGx7ujINmwJ/Q==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mv3d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 21:22:17 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 2 Dec 2025 21:22:17 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 2 Dec 2025 21:22:17 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] oeqa/sdk/cases/meson.py: fix assertion for multilib
Date: Wed, 3 Dec 2025 05:22:17 +0000
Message-ID: <20251203052217.525069-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: MTjgwBQRzPyKPvKTDrjfMVD1mWRg8tHy
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=692fc909 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=Hti7gpGalilrelmGPPoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MTjgwBQRzPyKPvKTDrjfMVD1mWRg8tHy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAzOSBTYWx0ZWRfX0+quJp35/B6c
 qHzE8CpAv2IpI9j70Rv+ESVReeuLapqLVY8BNZ4DugVA3D+EBRAUeJnGXZpJCoqGm+ZJdUvTvB4
 yL0/b5I8e0OHg5XkYNVrDprtI/NTIgusIHuuYOFv4zSDcq1LwK2Hrub5APxOhQWZp6Hb/Kj8Fif
 ag9ukYXEmSUn/uewr8b5cg3Clv8M8F2Qcwo5idE+G5R6fQJQCAmhN6H74FmZzitx1Dbovg/q0I1
 c+RbZnDkfj2qmQdkbmgOBzTBFsUQ6qa/lUQRF7ffE3Mzw4e2oCN6QjqERZCgogHhhgOxF6Aw3JL
 1eLI6uKuw6fkyvpPOsUeyjn9NQJVmlXa7zdnuWFFO4pYMwPlE2yoSSNuZnjQs1cU23FbLfZvjH/
 Yd4KATBFZnfuqSGRZRvgfUseWNNkHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 05:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227199

From: Chen Qi <Qi.Chen@windriver.com>

In case of multilib, the values of CC and HOST_ARCH in self.td are
not valid for lib32. We need to use the env vars sourced by the
env script.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/sdk/cases/meson.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/meson.py b/meta/lib/oeqa/sdk/cases/meson.py
index a809ca3a53..7419988922 100644
--- a/meta/lib/oeqa/sdk/cases/meson.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -39,11 +39,11 @@ class MesonTestBase(OESDKTestCase):
 
         # Check that the cross-compiler used is the one we set.
         data = json.loads(self._run(f"meson introspect --compilers {builddir}"))
-        self.assertIn(self.td.get("CC").split()[0], data["host"]["c"]["exelist"])
+        self.assertIn(self._run("echo $CC").split()[0], data["host"]["c"]["exelist"])
 
         # Check that the target architectures was set correctly.
         data = json.loads(self._run(f"meson introspect --machines {builddir}"))
-        self.assertEqual(data["host"]["cpu"], self.td["HOST_ARCH"])
+        self.assertEqual(data["host"]["cpu"], self._run("echo -n $OECORE_MESON_HOST_CPU"))
 
         self._run(f"meson compile -C {builddir} -v")
 
-- 
2.43.0


