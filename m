Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EF6EC8740
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 16:22:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17632.1694103722282206422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 09:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OytKGGCa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76142ca2fc=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 387Co371005402
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Sep 2023 16:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=nclORMMu0mBjonbv2AkWqUsm6ldVu7GXP/AxHIinol0=; b=
	OytKGGCaSRflzp6OBe5RnWTQ1r80TBfkje8bEBRdC7wT4iF9dm2V8i0G3SW/bgDP
	kkdHN5rtMAJjHGuX9BEEPHhGCoeV5RBBtmbWKxln7+lpnlfmVrLmRXriLhGedqXF
	MhatIogaG7RgnC1pZYGehs9qLdUhCU6jsbWQm5QZ8pQbv3sXnk5uU9SfLgp4gWmv
	GV/7EAwK4pyK9/lT5MOfDbCTGhpddcngrFgdochaQPPyH5a21inKJwT7z7mFIoPN
	3+kUioB+0GhvYgidL98wU3ERdGyIOH07WDwWl9XKUi8HJkzocHmO2Hd861dvD/jI
	osLjLBnfuKys5Zv/Ms8YUg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k3kge-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 16:22:01 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 7 Sep 2023 09:21:59 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 7 Sep 2023 09:21:58 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH 2/2] webkitgtk: fix CVE-2023-32435
Date: Fri, 8 Sep 2023 00:21:55 +0800
Message-ID: <20230907162155.2441494-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230907162155.2441494-1-kai.kang@windriver.com>
References: <20230907162155.2441494-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mffXEfCr9nsmV7dg25kca1fzDreai2ZI
X-Proofpoint-ORIG-GUID: mffXEfCr9nsmV7dg25kca1fzDreai2ZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=836
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309070146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 16:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187392

From: Kai Kang <kai.kang@windriver.com>

Backport and rebase patch to fix CVE-2023-32435 for webkitgtk 2.38.6:

* drop the patches for the files WasmAirIRGenerator64.cpp and
  WasmAirIRGeneratorBase.h which are involved in 2.40.0
* drop test cases as well

CVE: CVE-2023-32435

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../webkit/webkitgtk/CVE-2023-32435.patch     | 59 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.38.6.bb  |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-32435.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2023-32435.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-32435.patch
new file mode 100644
index 0000000000..c6ac6b4a1c
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-32435.patch
@@ -0,0 +1,59 @@
+CVE: CVE-2023-32435
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/50c7aae]
+
+Backport and rebase patch to fix CVE-2023-32435 for webkitgtk 2.38.6:
+
+* drop the patches for the files WasmAirIRGenerator64.cpp and
+  WasmAirIRGeneratorBase.h which are involved in 2.40.0
+* drop test cases as well
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 50c7aaec2f53ab3b960f1b299aad5009df6f1967 Mon Sep 17 00:00:00 2001
+From: Justin Michaud <justin_michaud@apple.com>
+Date: Wed, 8 Feb 2023 14:41:34 -0800
+Subject: [PATCH] Fixup air pointer args if they are not valid in BBQ
+ https://bugs.webkit.org/show_bug.cgi?id=251890 rdar://105079565
+
+Reviewed by Mark Lam and Yusuke Suzuki.
+
+We are not fixing up air args if their offsets don't fit into the instruction
+in a few cases.
+
+Here are some examples:
+
+MoveDouble 28480(%sp), %q16 ; too big
+MoveVector 248(%sp), %q16 ; not 16-byte aligned
+
+Let's fix up these arguments. We also fix a missing validation check
+when parsing exception tags exposed by this test.
+
+* Source/JavaScriptCore/wasm/WasmAirIRGenerator64.cpp:
+(JSC::Wasm::AirIRGenerator64::addReturn):
+* Source/JavaScriptCore/wasm/WasmAirIRGeneratorBase.h:
+(JSC::Wasm::AirIRGeneratorBase::emitPatchpoint):
+
+oops
+
+Canonical link: https://commits.webkit.org/260038@main
+---
+ Source/JavaScriptCore/wasm/WasmSectionParser.cpp  |  2 +
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/Source/JavaScriptCore/wasm/WasmSectionParser.cpp b/Source/JavaScriptCore/wasm/WasmSectionParser.cpp
+index 6b8f9016..a5f3a88b 100644
+--- a/Source/JavaScriptCore/wasm/WasmSectionParser.cpp
++++ b/Source/JavaScriptCore/wasm/WasmSectionParser.cpp
+@@ -917,6 +917,8 @@ auto SectionParser::parseException() -> PartialResult
+         WASM_PARSER_FAIL_IF(!parseVarUInt32(typeNumber), "can't get ", exceptionNumber, "th Exception's type number");
+         WASM_PARSER_FAIL_IF(typeNumber >= m_info->typeCount(), exceptionNumber, "th Exception type number is invalid ", typeNumber);
+         TypeIndex typeIndex = TypeInformation::get(m_info->typeSignatures[typeNumber]);
++        auto signature = TypeInformation::getFunctionSignature(typeIndex);
++        WASM_PARSER_FAIL_IF(!signature.returnsVoid(), exceptionNumber, "th Exception type cannot have a non-void return type ", typeNumber);
+         m_info->internalExceptionTypeIndices.uncheckedAppend(typeIndex);
+     }
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
index 4cef133c19..813198df5f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
+           file://CVE-2023-32435.patch \
            file://CVE-2023-32439.patch \
            "
 SRC_URI[sha256sum] = "1c614c9589389db1a79ea9ba4293bbe8ac3ab0a2234cac700935fae0724ad48b"
-- 
2.34.1


