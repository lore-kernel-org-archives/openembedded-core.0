Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5525CAC59A
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 06:17:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26094.1757917037786846179
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 23:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KjZgimgc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13531ce467=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F4dbVm3224261;
	Mon, 15 Sep 2025 06:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=AZ5hkvOyXTgIgsYt0fwIpwOU1CXcjy5lWAHv7yjDWvo=; b=
	KjZgimgcYy0G26SAopk+4tns9P5kbscWkGnSOCjMuQXqVZjF6dXBP2Ukm38IGgeh
	EdwyWQRUU/tWtuuF7Uk30rNerdEuxQtWMSQ5OKxT0uEkHtU6E1GspfGyEFcOhzNS
	CRl3yVm8eVqohOoyfJKVdRoW+AulRZysHD6D1HiEyH9sEizPMWY8bUMBN8WoJ4ff
	NfCujQpd2eWeEgK2TWTZOPWGWGpWg7aXmwTLPXcRYl7moZr1ThRzDYHH1Whdn03Z
	wHds0t7WHdC5NTooRdI0lHHgqEJ/zbKMZ8iRY28YMVtBORQOzuxU1ffHl+bQIC02
	VBnd3jwDSVvQPvVqu90fMQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494yk79puv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 15 Sep 2025 06:17:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 14 Sep 2025 23:17:48 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Sun, 14 Sep 2025 23:17:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH v2 3/8] harfbuzz: set FULL_OPTLEVEL for FULL_OPTIMIZATION
Date: Mon, 15 Sep 2025 14:17:38 +0800
Message-ID: <20250915061743.313230-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915061743.313230-1-hongxu.jia@windriver.com>
References: <20250915061743.313230-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=GZYXnRXL c=1 sm=1 tr=0 ts=68c7af6b cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8 a=cQB7R35s4zw8nPZc72UA:9
 a=VLVLkjT_5ZicWzSuYqSo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7h3qkdrPJHSSv2EiulZVSi04OurF1mW9
X-Proofpoint-ORIG-GUID: 7h3qkdrPJHSSv2EiulZVSi04OurF1mW9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NSBTYWx0ZWRfXxmnpq7zqcLsA
 +Mho6dCoAGoFG1WonYFuf0+uhjyhlCSRERaAc2vz2aCvuHQXKMZ4Nkw55g97ylEqmv8XZ0gRoa+
 soksQMPL+Su8pTmT0s1X0TtZ4BG/nSh8Tgt6dPaPUwJEpOj1OVm5mSUNEOlnMVIpWtkb4WAuXMY
 Wrfv/X7VrRBiYElUy9pnp7L+VHeY+W3hawMheYGB8f0ebWFbTgBgH9MteL2y4LL8EQ60jqWErjM
 1vTpOBzQ3P1d5O2oFl0eA5QBllnnEtuz965JmvE684a3ITRe3LKxsHkJL0UkGKhlRocxU7U03D+
 3e4UkWXWaffFQVG/nuaFs/ktJtPenFIdQ1sxXC9XchKG5dAadk84QM/66x9VyM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 06:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223379

Due to commit [distro/include: Add debug_build.inc when DEBUG_BUILD is
enabled] applied, it adds a new variable FULL_OPTLEVEL for optimization level
of FULL_OPTIMIZATION.

Use FULL_OPTLEVEL to instead of FULL_OPTIMIZATION

Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
index 9e0e42b7174..9934ddcc5d1 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
@@ -21,7 +21,7 @@ GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
 
 # As per upstream CONFIG.md, it is recommended to always build with -Os.
-FULL_OPTIMIZATION = "-Os ${DEBUG_LEVELFLAG}"
+FULL_OPTLEVEL = "-Os"
 
 EXTRA_OEMESON = "-Dtests=disabled"
 
-- 
2.34.1


