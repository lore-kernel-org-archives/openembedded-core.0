Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908DAE67A71
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:56:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12824.1772521015024375980
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WRJsqUPp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235ZmGL3800683
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 06:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=bUu9xdIpBpk33Rjr+gj/F0XkjJ84xlxECK9rL31mlmo=; b=WRJsqUPpLYzn
	JMfpdtqsXQGV8gZB8KfRBjKAljvfHnewqA7rIet0JZTf9ojkP0Pe4mA2tJKwSIzk
	tpMM5l0Hm8IEHsyD318J2xxa8dQYKTZDJpSUeQ7A8EXtDiXpkW8nSC9NZS7DgR+A
	CsckwCLp9PNEx6BdKTjj9i5Cm0YUI8Dqb5lzyZZVkXPFTzqs44IeuQo/lCVD5LDu
	sg/bkuc8kXUsO7pPT/R4iJP2WzaWQKxbc5EeGQ2u52D0BDvlajASFB2lETwrjHVz
	OeX3lm7qPoFqtBlnNixQJwd1yOsPVoag0IlgmILIPBvb3sjER4Huf/GPzEgiSw/2
	OUmUcozysQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvkdfp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:53 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:52 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 12/19] python3-pycparser: upgrade 2.23 -> 3.0
Date: Tue, 3 Mar 2026 14:56:33 +0800
Message-ID: <20260303065640.2541884-12-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: w8A3m4D_dH_v5UuTfps0ll6BdJbipIqf
X-Proofpoint-ORIG-GUID: w8A3m4D_dH_v5UuTfps0ll6BdJbipIqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX+HmVZJacgsMA
 NDWxq8Uz+s9LeG8xty0BDnGzg96xvGCOZ3+J3jgEtpC+E8zd8Z06PhHkp7C1hJ4kubQ32WjllT1
 7kAV9WPxLEnCvow4Rndc2fkbxasLRVOiGhoqpRHxMt1W8Ie30w/Xgu1MFknfpyptsx0kJRDwZTO
 q88krmFvCglru5vnDLJQ7a8huTPQxW29dnAhOmfGpoQcOwJWMAuUKOYI7ot4KNFscyJOHSSuhda
 9CtK+sxdgO0uMFtKbH4kgK+oDEbBCD/XlqIUErg/8qVLMgzEwz7fFCZDtlhUmGWSnr5H0hVj7q1
 eXbtyuNl1lEbunufgiHsW/4OMcl7FC2O+2KX3nYJP+/ng30QYHzu/cDZdrc92hRHLVjd7G6NgGc
 OtIJIQIV5lW0JSWEwpW8eqE8+lzrAtIwvL7LoTbnFfYAVviOJoARNapQpf/6I6glMu8+gPfmqdo
 ztpH1WMFQ5m+SVsWpvg==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a68635 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=s9ZypoOxAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=TtnIGiIJVc-uLIUf8dEA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232250

Convert to python_setuptools_build_meta to fix

  WARNING: python3-pycparser-3.0-r0 do_check_backend: QA Issue:
  inherits setuptools3 but has pyproject.toml with setuptools.build_meta,
  use the correct class [pep517-backend]

What's Changed [1]

- Removed dependency on PLY, by rewriting pycparser to use a hand-written lexer
  and recursive-descent parser for C. No API changes / functionality changes
  intended - the same AST is produced.
- Add support for Python 3.14 and drop EOL 3.8 by @hugovk in #581
- Update _ast_gen.py to be in sync with c_ast.py by @simonlindholm in #582

[1] https://github.com/eliben/pycparser/releases/tag/release_v3.00

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{python3-pycparser_2.23.bb => python3-pycparser_3.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pycparser_2.23.bb => python3-pycparser_3.0.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-pycparser_2.23.bb b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-pycparser_2.23.bb
rename to meta/recipes-devtools/python/python3-pycparser_3.0.bb
index a33a6553b4..c17be9b2d4 100644
--- a/meta/recipes-devtools/python/python3-pycparser_2.23.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"
 
-SRC_URI[sha256sum] = "78816d4f24add8f10a06d6f05b4d424ad9e96cfebf68a4ddc99c65c0720d00c2"
+SRC_URI[sha256sum] = "600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


