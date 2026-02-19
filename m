Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414F5E9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 07:44:23 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9185.1771487057668915575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 23:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SdC07wrA;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2876; q=dns/txt;
  s=iport01; t=1771487057; x=1772696657;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Vvcch6omkP6egepgMIBzj6V4Dcg6sFHe/KQxlb5fAWk=;
  b=SdC07wrAGZftXJGd/upUCziaCIYGnAS1yHVLK/ab0csbhKqXjXee4cOf
   JkUsHVhE40PcH61HS+/awx+T/g7ZjRoU+rImftjXacRKr+e7mzrRzKsEE
   kd2738uyaehF2cLk6pTCAxeUH9HHmKSgo9ZyiXuB9bTUGSAxtMtTjDySi
   P1Ar0mbFKYxj/u9Gl/WEV8iHk7R3JHmsmNv2xC3UNIgennwLjPeeRE7ru
   2UfRq6cPd66R5WFcR3oME6qSTBl03qQM1LJCZM7LEPpAV9Z8nS6yFvD1z
   R79Dl2nqxOY4AiMlTKomkUh12YCmDrEqhR82R8t8O05sZehWHtr6vyiuA
   g==;
X-CSE-ConnectionGUID: vh4iMSw1QT6lNYV04hT2oQ==
X-CSE-MsgGUID: vNkDhWTlQ3aUtwVwlyqTOQ==
X-IPAS-Result: =?us-ascii?q?A0CeBgCfvpZp/5P/Ja1aglmCSA9xX0JJA5QngiGeHYF/D?=
 =?us-ascii?q?wEBAQ89FAQBAZIoAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaATgBcgMBAlojIYMCAYJzAgERql6CLIEBg2IBBQJDT9smA?=
 =?us-ascii?q?QUGFAGBOIU8iBlbGAGEeicbG4FygRWDaIEFgVwBAYIthXcEgiKBDoFhJotTh?=
 =?us-ascii?q?gtIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQsbBwWHcw+JBXhugR+BF?=
 =?us-ascii?q?gMLGA1IESw3FBsEPm4Hjj5BgS+BAwF0GiwggV0WARgckwmQLoIhoQ4KKIN0j?=
 =?us-ascii?q?B6VOhozqmsLmHuOCZZQhGiBaDw5gQ4LB3AVO4JnUhkPjjiDaYF/glm6SCI1A?=
 =?us-ascii?q?gQ2AgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:FwJggaO5hsaw/9nvrR30lsFynXyQoLVcMsEvi/4bfWQNrUp30TNVz
 GQfW27VM/iPajf1fYx2ad7j90sEvMTTz9RnSHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVrlV
 e/a+ZWFZgf/gm4saAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+tuUEATBpJBw9opBUd/y
 6REKAxXaSnW0opawJrjIgVtrt4oIM+uOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzM3wsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQvjum2aIWEJYHiqcN9gGCbi
 mL5w2DAWRgnKMOh1j6U606Lv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:hbazaqvInagU8Yisp+WzzG+j7skDY9V00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowEJ30bFh4pgPW
 AKSdkaNOHN
X-Talos-CUID: 9a23:f+9VsmFIuP3h/qRIqmJ59BIVP/s6K0ThknP2EnHgVWZVErqsHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AO2T10g2RyrtRCbkPP9qKb9IloDUj/YKtJEAyrZE?=
 =?us-ascii?q?/4MC5KTNOJDOMlQiQe9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,299,1763424000"; 
   d="scan'208";a="669307975"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Feb 2026 07:44:16 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id B11D7180008B4
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 07:44:16 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 57B87CC12B5; Wed, 18 Feb 2026 23:44:16 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core] [scarthgap] [PATCH 6/7] go 1.22.12: Fix CVE-2025-61732
Date: Wed, 18 Feb 2026 23:44:07 -0800
Message-Id: <20260219074407.3397886-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 07:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231417

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/golang/go.git

Bug details: https://nvd.nist.gov/vuln/detail/CVE-2025-61732
Type: Security Fix
CVE: CVE-2025-61732
Score: 8.6
Patch:  https://github.com/golang/go/commit/14d0bb39c1c4

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index ca0f05f7c8..cc4f98a8fe 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -37,6 +37,7 @@ SRC_URI += "\
     file://CVE-2025-61731.patch \
     file://CVE-2025-68119-dependent.patch \
     file://CVE-2025-68119.patch \
+    file://CVE-2025-61732.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61732.patch b/meta/recipes-devtools/go/go/CVE-2025-61732.patch
new file mode 100644
index 0000000000..523660def2
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61732.patch
@@ -0,0 +1,53 @@
+From fe8c665f1608126e7b644ab07bb0698ad1c0b4b6 Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Tue, 6 Jan 2026 16:09:19 -0500
+Subject: [PATCH] [release-branch.go1.24] cmd/go: remove user-content from doc
+ strings in cgo ASTs.
+
+Thank you to RyotaK (https://ryotak.net) of GMO Flatt Security Inc. for reporting this issue.
+
+Updates #76697
+Fixes #77128
+Fixes CVE-2025-61732
+
+CVE: CVE-2025-61732
+Upstream-Status: Backport [https://github.com/golang/go/commit/14d0bb39c1c4]
+
+Change-Id: Ie2a96b79a813e362cbf8e6cb0e3c2d0c022bcb29
+Reviewed-on: https://go-review.googlesource.com/c/go/+/740001
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+(cherry picked from commit 14d0bb39c1c4093bd02740d14b1a2ca720ced97c)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/cmd/cgo/ast.go | 11 +++--------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/src/cmd/cgo/ast.go b/src/cmd/cgo/ast.go
+index 3cbbeafdca..eb373bdefa 100644
+--- a/src/cmd/cgo/ast.go
++++ b/src/cmd/cgo/ast.go
+@@ -301,17 +301,12 @@ func (f *File) saveExport(x interface{}, context astContext) {
+			error_(c.Pos(), "export comment has wrong name %q, want %q", name, n.Name.Name)
+		}
+
+-		doc := ""
+-		for _, c1 := range n.Doc.List {
+-			if c1 != c {
+-				doc += c1.Text + "\n"
+-			}
+-		}
+-
+		f.ExpFunc = append(f.ExpFunc, &ExpFunc{
+			Func:    n,
+			ExpName: name,
+-			Doc:     doc,
++			// Caution: Do not set the Doc field on purpose
++			// to ensure that there are no unintended artifacts
++			// in the binary. See https://go.dev/issue/76697.
+		})
+		break
+	}
+--
+2.35.6
-- 
2.44.1


