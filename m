Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6BACD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:52:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.996.1781625115858891454
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 08:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mqbPL+z8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06273c465f=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFh5ag3689879
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 15:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=RFmdXAO+6LL78GzQveGSNahsGB/RTNOu+xMLGwZkCuI=; b=mqbPL+z89WuY
	dSXg8Te01IKX7xkhE+y1XvZl2XBAF5dnHZp0JCn1lN6lVjMKhZ80EPh8lsKkYQMr
	WoWRcJPLhEHCBypn2yOha51T6zV4emX5LPJGxcXPeFZgDWNkLNIIiUbUPVurjn2S
	vU9T2nd2t9DBXsksvMHkEIIIDrEbhmql8Pru4iMp8t/m3hRkYXb1jYz1exqKLo/C
	Gwyz7KpXXz3kKtIXclmmg7BhW3U0y6CBPdF2CKMtqKn4GV/DJ0+mbHjkY5wwcARW
	NhTKs9d8zc9mnZli/F4pvF41RIyfOMZChgW9I8I/rWL4HgIGGBVxMJFEFd3LJFxb
	cSOltyPaIw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eu0vs0r0a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 15:51:54 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Jun 2026 08:51:53 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Jun 2026 08:51:53 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4 1/2] strace: Append BPN to FILESPATH to help devtool
Date: Tue, 16 Jun 2026 08:51:51 -0700
Message-ID: <0b67fc315b54be36e0ea82fa54bd22ff1e3d62e8.1781624800.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1781624800.git.liezhi.yang@windriver.com>
References: <cover.1781624800.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IsIutr/g c=1 sm=1 tr=0 ts=6a31711a cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=GyRy196VEcYVeFsRrC4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Y5d9zjQPUkkUiO5iyVefu3NusBSrE7Ju
X-Proofpoint-ORIG-GUID: Y5d9zjQPUkkUiO5iyVefu3NusBSrE7Ju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE2MiBTYWx0ZWRfX5RjGwpSWsDAI
 y96OLADyxOl5LjaGX05BG378u+Z1/Ep4UtFtUw5iq1Vp1+D9uPeyVzv7MkHa3axmxCPkUy22o8b
 vKuvq/yWLHnRWTnnoeWe0E5GlQ1kFRdMRyBpr8DwadtBFe43yh3EbFN6LdqgZv3CNNNnyXANUqM
 bVRjVL3YJ6pYbInqmuBp9QLLbsbPw3n0n+oDrhM2TFV0a1mcbOOZaNhafgcurkERYXbjr58Ay5/
 6jNRGXIKpkPo+aT6joFMZ9qUywA0j/yDoqKWSx4fFOpSs50Q0pBd2ax0qXnL4ctinW8GO8s6iPc
 sy6WLloiAT0Hth/gSPebCQ0IVmReQpHRZEU/BSiHfkS7uI6kBLvjV9oVxJ5JQzjTuU2sVBAeTJZ
 16WnxPk8Lo3H42aUZjGtcpqW7VriBhyo0F15Xy3J/a7PAoXW+UDaW5Kj+XggAxD8FkfoHySter7
 wtn7Lc9ph4SXF0gi4rA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE2MiBTYWx0ZWRfX39KytpUMDLqk
 l39q9677RPSSvKiEPf0KP3XCejDk9eF9gh7yOk1GT7gHs0S7Hb6qHZ+2+DA5+IB0IIN8mh2Kilo
 9cTLpoQx3UcOGD3Kd0LAqJ+VZVbqypFhS5yzVPiJ8IszCa8Wf1fS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 15:52:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238913

From: Robert Yang <liezhi.yang@windriver.com>

The 'devtool finish" added 0001-Ignore-pwritev-pwrite64-tests-on-musl.patch to
strace/files rather than strace/strace

This is because the 0001-Ignore-pwritev-pwrite64-tests-on-musl.patch is a
conditional patch:

SRC_URI:append:libc-musl = "\
           file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
           "

So the devtool won't copy it into workspace, then bb.utils.which() can't find
it, and will return the last section in FILESPATH which is strace/files, I
can't a regular way to fix it because that's how the bb.utils.which() and
localpath works. But there a workaround, add the following line to the recipe
can fix the problem:

FILESPATH .= ":${FILE_DIRNAME}/${BPN}"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/strace/strace_6.19.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace_6.19.bb b/meta/recipes-devtools/strace/strace_6.19.bb
index 7b8d4851fb..b92bfc4f31 100644
--- a/meta/recipes-devtools/strace/strace_6.19.bb
+++ b/meta/recipes-devtools/strace/strace_6.19.bb
@@ -22,6 +22,10 @@ SRC_URI:append:libc-musl = "\
            "
 SRC_URI[sha256sum] = "e076c851eec0972486ec842164fdc54547f9d17abd3d1449de8b120f5d299143"
 
+# To help "devtool finish" can add 0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
+# into strace/strace rather than strace/files.
+FILESPATH .= ":${FILE_DIRNAME}/${BPN}"
+
 # remove at next version upgrade or when output changes
 PR = "r1"
 HASHEQUIV_HASH_VERSION .= ".1"
-- 
2.49.0


