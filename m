Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A69C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 08:14:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43478.1693815259180824097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 01:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rw76412H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7611a88504=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3847S60X016081
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Sep 2023 01:14:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=UxPdh
	c7iLgwJ3/Pw75OCMB0nVm4DxaF3+XiaDZeJtok=; b=rw76412HoldmxqP6vqFQu
	6s03bHpHnWHjlPdE40E16g2if8K59OZ2FvxptFv4oXymAln0pnyswjQHaJOFQ+iD
	MByIEiDp9XN68F5JGZZcPlTHwuA+yjeOEU/vZoLeymQrGedqUd+G/NspJ4aDCojS
	p7qrSnOlIXQ3qojMaah2Jzwq6wNkEdDPe+b8mhtfHgtwyuh0NrY+AhqVSTU9KFU8
	/3eso/sBjWWx8oxAzkTPpsJpF8umO3AePw8Ixix4VwrAyB3pN9ybWFh/ChE34cKp
	+PTA72XUQMB36GgIZBCcCyPUYkSGsyyDtV/xbpZJ4YnFwI4RCzdsK1aPsCvROeQh
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b01ayw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 01:14:18 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 01:14:18 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 4 Sep 2023 01:14:12 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] webkitgtk: fix CVE-2023-23529
Date: Mon, 4 Sep 2023 16:14:14 +0800
Message-ID: <20230904081414.697301-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: wV1D3BTRakbKkzuU0pvu4n8vEQET_qba
X-Proofpoint-GUID: wV1D3BTRakbKkzuU0pvu4n8vEQET_qba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_06,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=761
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309040074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 08:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187163

From: Kai Kang <kai.kang@windriver.com>

Backport and rebase patch to fix CVE-2023-23529.

CVE: CVE-2023-23529

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../webkit/webkitgtk/CVE-2023-23529.patch     | 65 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-23529.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23529.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23529.patch
new file mode 100644
index 0000000000..f2e9808ab4
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23529.patch
@@ -0,0 +1,65 @@
+CVE: CVE-2023-23529
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/6cc943c]
+
+With the help from webkit maillist, backport and rebase patch to fix
+CVE-2023-23529.
+
+https://lists.webkit.org/pipermail/webkit-gtk/2023-August/003931.html
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 6cc943c3323a1a1368934c812e5e8ec08f54dcd4 Mon Sep 17 00:00:00 2001
+From: Yusuke Suzuki <ysuzuki@apple.com>
+Date: Fri, 17 Feb 2023 10:39:19 -0800
+Subject: [PATCH] Cherry-pick 259548.63@safari-7615-branch (1b2eb138ef92).
+ rdar://105598149
+
+    [JSC] ToThis object folding should check if AbstractValue is always an object
+    https://bugs.webkit.org/show_bug.cgi?id=251944
+    rdar://105175786
+
+    Reviewed by Geoffrey Garen and Mark Lam.
+
+    ToThis can become Identity for strict mode if it is just primitive values or its object does not have toThis function overriding.
+    This is correct, but folding ToThis to Undefined etc. (not Identity) needs to check that an input only contains objects.
+    This patch adds appropriate checks to prevent from converting ToThis(GlobalObject | Int32) to Undefined for example.
+
+    * Source/JavaScriptCore/dfg/DFGAbstractInterpreterInlines.h:
+    (JSC::DFG::isToThisAnIdentity):
+
+    Canonical link: https://commits.webkit.org/259548.63@safari-7615-branch
+
+Canonical link: https://commits.webkit.org/260455@main
+---
+ .../JavaScriptCore/dfg/DFGAbstractInterpreterInlines.h   | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/Source/JavaScriptCore/dfg/DFGAbstractInterpreterInlines.h b/Source/JavaScriptCore/dfg/DFGAbstractInterpreterInlines.h
+index 928328ffab826..82481455e651d 100644
+--- a/Source/JavaScriptCore/dfg/DFGAbstractInterpreterInlines.h
++++ b/Source/JavaScriptCore/dfg/DFGAbstractInterpreterInlines.h
+@@ -209,7 +209,8 @@ inline ToThisResult isToThisAnIdentity(VM& vm, ECMAMode ecmaMode, AbstractValue&
+         }
+     }
+ 
+-    if ((ecmaMode.isStrict() || (valueForNode.m_type && !(valueForNode.m_type & ~SpecObject))) && valueForNode.m_structure.isFinite()) {
++    bool onlyObjects = valueForNode.m_type && !(valueForNode.m_type & ~SpecObject);
++    if ((ecmaMode.isStrict() || onlyObjects) && valueForNode.m_structure.isFinite()) {
+         bool allStructuresAreJSScope = !valueForNode.m_structure.isClear();
+         bool overridesToThis = false;
+         valueForNode.m_structure.forEach([&](RegisteredStructure structure) {
+@@ -226,9 +227,13 @@ inline ToThisResult isToThisAnIdentity(VM& vm, ECMAMode ecmaMode, AbstractValue&
+             // If all the structures are JSScope's ones, we know the details of JSScope::toThis() operation.
+             allStructuresAreJSScope &= structure->classInfo()->methodTable.toThis == JSScope::info()->methodTable.toThis;
+         });
++
++        // This is correct for strict mode even if this can have non objects, since the right semantics is Identity.
+         if (!overridesToThis)
+             return ToThisResult::Identity;
+-        if (allStructuresAreJSScope) {
++
++        // But this folding is available only if input is always an object.
++        if (onlyObjects && allStructuresAreJSScope) {
+             if (ecmaMode.isStrict())
+                 return ToThisResult::Undefined;
+             return ToThisResult::GlobalThis;
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index edd64b7b11..20f475bebd 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://CVE-2022-46699.patch \
            file://CVE-2022-42867.patch \
            file://CVE-2022-46700.patch \
+           file://CVE-2023-23529.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.34.1


