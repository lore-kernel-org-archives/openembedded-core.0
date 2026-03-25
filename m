Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB55103A99D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:29:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13882.1774405758552934510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=q34XPvCN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7544e4345f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P1PwTf4022804
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:29:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lxF3H4wZIYy/rLHeZWtUKqMb9KPvQB1MT46ouvmwKzU=; b=q34XPvCN7KqQ
	yXtLkdxlsCPVdnKGe8vilObyJ2UduP2L3wrkq+Lsyaq0xRzV4hsEHua8hlrUvl7W
	kOBmdTkoGtpfC35ic7nyS8q42pqEXeGwascgFwnb61XGQpT0QPx6oIYNXd1VVcE/
	9sIR9ZqlNDPDLsONGSH3W9rZH9Az2l/7mHFxdohMHQO9Xqsld7gebxZmhRzf+qhl
	Vm5LuISn96aYKbzB6s5XJ/N/hfP1UmVTmRy0Hjq/Pg/j11z2PeEuUs9lwHtudUVv
	6U6EblkcyJJQELK4GAPgsLXdzCjS7q2fhRjQf3dGlZ7BSSlpttReaNcz99KMkS6A
	mW7yDeNgMg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pkyc7f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:29:18 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 24 Mar 2026 19:29:17 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 24 Mar 2026 19:29:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] python3-numpy: add cpu-optimization option
Date: Wed, 25 Mar 2026 10:29:16 +0800
Message-ID: <20260325022916.2379819-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <openembedded-core@lists.openembedded.org>
References: <openembedded-core@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAxNyBTYWx0ZWRfX65AA5CpxVwAo
 NwlSTqUSg7tfWvzBz2dwnTbd6TqOxiUxU+0R/Y9QNCuDtGB2RXHbLy1CZAotsBBTHpt0/oto0TC
 0jTGY9sx5/naiw06GCqtAjSvIfRDHaT+NHi67RG2+B0fYuNFynj4p6g/sIOeq1Bi/X3hLMd4Tvt
 umuBNcTkIL/SHxF8bAC33kiZlBQggZdSI1St+KdRlQBDatfeLc+qj0qo5Bo0SSyOliXqtP9Gagx
 u2jSEOgFLQ5ca6LWhzd0wDNxRBJrnDTIzkqjyGXuxz9tUbrwf4iM1I7GC740tE2J+92jxT6v01K
 S/qFFO3T7qwj6x8ZeUrTxP4y14fq08g7BKvxbOzyzWR/VMMVL069v5PmJHJM7zfxCixaIJLGHhK
 iGMy0KERmO4GzLXbAqeyM11i2nfT1xqBzUJfM/dL4mVzMsfrLnnha39l8TL+jzHzZWcAsYFzTZ6
 uSDWLG2ff7oJcfRIKag==
X-Proofpoint-ORIG-GUID: Tibl6TSA5pLLFvYWJMIXN1X71rg5TKFn
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c3487e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=hKpBA07XAAAA:8 a=t7CeM3EgAAAA:8
 a=A9C6oZOalONfMp_F2N4A:9 a=e5PuFNF6PdRcDgRFK7o8:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Tibl6TSA5pLLFvYWJMIXN1X71rg5TKFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233852

Add a cpu-optimization option for disable-optimization [1], disabled by default,
otherwise import numpy failed on qemux86-64 with kvm
[snip]
>>> import numpy as np
...
RuntimeError: NumPy was built with baseline optimizations:
(X86_V2) but your machine doesn't support:
(X86_V2).
[snip]

[1] https://numpy.org/doc/stable/reference/simd/build-options.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python3-numpy_2.4.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.4.3.bb b/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
index 7521a93f99..1c67063e3e 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.4.3.bb
@@ -23,6 +23,7 @@ inherit pkgconfig ptest python_mesonpy github-releases cython
 S = "${UNPACKDIR}/numpy-${PV}"
 
 PACKAGECONFIG[svml] = "-Ddisable-svml=false,-Ddisable-svml=true"
+PACKAGECONFIG[cpu-optimization] = "-Ddisable-optimization=false,-Ddisable-optimization=true"
 
 # the overflow tests fail with compiler-rt on aarch64
 LDFLAGS:append:toolchain-clang:aarch64 = " -rtlib=libgcc -unwindlib=libgcc"
-- 
2.34.1


