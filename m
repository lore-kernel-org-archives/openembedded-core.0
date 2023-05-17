Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01DBC77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 05:42:27 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.43])
 by mx.groups.io with SMTP id smtpd.web11.43061.1684302143348879584
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 22:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=QVnwrSGY;
 spf=pass (domain: siemens.com, ip: 40.107.22.43, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+Ms3wCM6avrW36y8OtO9ql153x7UcD5NyiGxvQRMJ45qUN4XDULC3fzg5MthOUwghRHSMLLoj5vuCL4KnT5YjCQcrIt9NnuI7eviC5phRV4YMCNij7rsUDsP8vSqLWgid67zA1LVYmwQ/JqbMclcIa50raptNZqSTdR1U0FqytlL99nKuXIH5BEFPVuGmBcqLe/11cJNUY2t0fzvWTptEKTZLYKPbkCGkFRDAxE7TIIHhcv0mdMqS+y7v7Ex46F2Eqv1pmN1/rj1WHVk5GQv4hMwPoup4HJPFLNXebMFhJ6WsKqYEJjQ0hiiAlXWK9qGSZ+jJuXe8kCGZgtEPpBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KROrHr6yiCPD6DZOf+a8uXmR7rpNJDJOe19XyAMc8Y=;
 b=mRORacjDCMs0dQegpcF1cew1R7zaTsgC4WIzlkLfjM/wiFVY5evfhzY/Ra2l/yevhT3tR/b1+kBDNntEOLzCkSRmLupwXT62JPPSriLkvrukIE1T0yyhwNB3yfpmyoJwjHUGi51/t/gGa5j2gCZ7jxMcQqQDZyF2ineDnIg08oqo4VBgC6jGtcRjFKxmbNu/7TZybvJFgZZcd3KAkW4SucS518J+phcu8Kr2nJZIwbMo3kqGQoF4NdI/n4E3EG5iZhEHjJwvaeGx4hBDFbHyBqHzgsqUoKXgKdRVHXg8jXSuo6BWWo44oGQosn3wZlzvv5YjdoDu7sjabqF1PlUKow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KROrHr6yiCPD6DZOf+a8uXmR7rpNJDJOe19XyAMc8Y=;
 b=QVnwrSGYsAmp+EHaKdho1uT+SWkCCVUul/afmEUQbErxt1BuEIIWT7fSQZta7DUFpP6GREMeSZJmSKq6vzcWkAP7clu56U/4o7E5Aijj3QmexsJiEFEmnyBzYlmMXVt3f1muZ2VQEIYgffL7x5pVIMpMsiGPZG/d4tuVxBRiNDSNcX69JCQuLeRHZB2Jje/xJDTOP12YB82BpFgs8s35sXWQhCrgS/p9sRxGX/28cRPUGf7qrv6Fyk+w/IZYBuEK13urDd1x73YcXV0S+I662ALCpT29BuZqUTEv9dKZvjN1AuX9zT/0ujl/j9KskSdR4LJykDcjggUtO0UrxkwdNA==
Received: from DUZPR01CA0061.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::19) by AS2PR10MB6662.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:55d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 05:42:20 +0000
Received: from DB5EUR01FT097.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:3c2:cafe::30) by DUZPR01CA0061.outlook.office365.com
 (2603:10a6:10:3c2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17 via Frontend
 Transport; Wed, 17 May 2023 05:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 DB5EUR01FT097.mail.protection.outlook.com (10.152.5.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17 via Frontend Transport; Wed, 17 May 2023 05:42:20 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 17 May 2023 07:42:19 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.107.77) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 17 May 2023 07:42:16 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v2] cve-check: add option to add additional patched CVEs
Date: Wed, 17 May 2023 07:41:38 +0200
Message-ID: <20230517054138.33459-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505111814.491483-1-andrej.valek@siemens.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.107.77]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT097:EE_|AS2PR10MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b5bc29-ca1b-4026-4617-08db56997b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yWQg+drjscoW8EH/QXWCSskKlhACQdgCEUGRviYmQagHmlXsUR8S4qAn5oh+nixj8S3mC6ihvAg8wr2WO1KCALw4Lmxk4FPnRZ58pY9lTZH4BlO0WjjjeRWDJvU7pj8mg8chDnWMA1r56IO7wN98qkCieFT//VJat9JnZRAH8ULhtXcCyJBHoMEQt0hPIrhf7sAJjend6n3nc0WNamz1dhTE5AD2IvnEQLTEsObAi2e5D8NU8WmDr96Akaql4F6Gtcs/DIn8OgrwwBpygV7ljCMjUFS6F7MmnYNSAXUF/6IsS8OKusY/yu3nvYE/3D+ztJANZYqTz+yis/zStsOjIXNOAgCZA2ff23544gb+IVw+aStqIzhXOFXHQePwwwn3mSFhdC7Ei6sOn99QRGXZpq5hTz58tdhFD1W+wsd0QpP6dcZYzEaxLiqEs7x8ua7I3sv0VyNyjPeiyR3Mo7MnYWOlcDNLup7iZRx8jH2FkW00OZqQgAPbzCtT3Pg2sQjxARthV7UbZNDSnb+GKE04KePb1AEx3+y+aQIYE1CxV2+0PvUgsE+r7Cz5TRt0zRvderTkM+Uc6sj2b8gBA2cEWZMAkKEBegdn3r9JaquU0ofiWhV/UUKql82x2UAn/8jDZqskqUMutFNXXRXh3+X7lbhooNkuepyLVKxjbn0qsSTPE+OKUffyqrP/YJ19XaYxZfA3L/fMbnBk8fmrKmm503A9B69OQ+m1jYla40fSk2VKwDhFlnx6LHacDV1xGjqgpf7pj3krjfVd33rxyeSdSg==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(36840700001)(46966006)(40470700004)(82310400005)(16526019)(186003)(2906002)(40460700003)(86362001)(107886003)(1076003)(26005)(83380400001)(40480700001)(2616005)(956004)(336012)(36860700001)(36756003)(47076005)(81166007)(356005)(82740400003)(82960400001)(6666004)(41300700001)(4326008)(6916009)(70206006)(70586007)(316002)(478600001)(44832011)(5660300002)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 05:42:20.2364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b5bc29-ca1b-4026-4617-08db56997b63
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT097.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 05:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181444

- Replace CVE_CHECK_IGNORE with CVE_STATUS + [CVE_STATUS_REASONING] to be
more flexible. CVE_STATUS should contains flag for each CVE with accepted
values "Ignored" or "Not applicable". It allows to add a status for CVEs
which could be fixed externally.
- Optional CVE_STATUS_REASONING flag variable could contains a reason
why the CVE status was used. It will be added in csv/json report like
a new "reason" entry.
- All listed CVEs in CVE_CHECK_IGNORE are copied to CVE_STATUS with
value "Ignored" like a fallback.

Example of usage:
CVE_STATUS[CVE-1234-0001] =3D "Not applicable" or "Ignored"
CVE_STATUS[CVE-1234-0002] =3D "Not applicable"
CVE_STATUS_REASONING[CVE-1234-0002] =3D "Issue only applies on windows"

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/cve-check.bbclass | 30 +++++++++++++++++++++++++-----
 meta/lib/oe/cve_check.py       |  6 ++++++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index bd9e7e7445c..e081095037c 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -70,13 +70,17 @@ CVE_CHECK_COVERAGE ??=3D "1"
 # Skip CVE Check for packages (PN)
 CVE_CHECK_SKIP_RECIPE ?=3D ""
=20
-# Ingore the check for a given list of CVEs. If a CVE is found,
-# then it is considered patched. The value is a string containing
-# space separated CVE values:
+# Ignore the check for a given CVE. Each of CVE has to be mentioned
+# separately with optional reason, why it has to ignored.
 #
-# CVE_CHECK_IGNORE =3D 'CVE-2014-2524 CVE-2018-1234'
+# CVE_STATUS[CVE-1234-0001] =3D "Not applicable" or "Ignored"
+# CVE_STATUS[CVE-1234-0002] =3D "Ignored"
+# CVE_STATUS_REASONING[CVE-1234-0002] =3D "Issue only applies on windows"
 #
+# CVE_CHECK_IGNORE is depracated and CVE_STATUS has to be used instead.
+# Keep CVE_CHECK_IGNORE like a fallback.
 CVE_CHECK_IGNORE ?=3D ""
+CVE_STATUS ?=3D ""
=20
 # Layers to be excluded
 CVE_CHECK_LAYER_EXCLUDELIST ??=3D ""
@@ -88,6 +92,12 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
 # set to "alphabetical" for version using single alphabetical character as=
 increment release
 CVE_VERSION_SUFFIX ??=3D ""
=20
+python () {
+    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
+    for cve in d.getVar("CVE_CHECK_IGNORE").split():
+        d.setVarFlags("CVE_STATUS", {cve: "Ignored"})
+}
+
 def generate_json_report(d, out_path, link_path):
     if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
         import json
@@ -282,7 +292,11 @@ def check_cves(d, patched_cves):
         bb.note("Recipe has been skipped by cve-check")
         return ([], [], [], [])
=20
-    cve_ignore =3D d.getVar("CVE_CHECK_IGNORE").split()
+    # Convert CVE_STATUS into ignored CVEs
+    cve_ignore =3D []
+    for cve, status in (d.getVarFlags("CVE_STATUS") or {}).items():
+        if status in ["Not applicable", "Ignored"]:
+            cve_ignore.append(cve)
=20
     import sqlite3
     db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
@@ -455,6 +469,9 @@ def cve_write_data_text(d, patched, unpatched, ignored,=
 cve_data):
         else:
             unpatched_cves.append(cve)
             write_string +=3D "CVE STATUS: Unpatched\n"
+        has_reason =3D d.getVarFlag("CVE_STATUS_REASONING", cve)
+        if has_reason:
+            write_string +=3D "CVE REASON: %s\n" % has_reason
         write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev2"]
         write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev3"]
@@ -576,6 +593,9 @@ def cve_write_data_json(d, patched, unpatched, ignored,=
 cve_data, cve_status):
             "status" : status,
             "link": issue_link
         }
+        has_reason =3D d.getVarFlag("CVE_STATUS_REASONING", cve)
+        if has_reason:
+            cve_item["reason"] =3D has_reason
         cve_list.append(cve_item)
=20
     package_data["issue"] =3D cve_list
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index dbaa0b373a3..f47dd9920ef 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -130,6 +130,12 @@ def get_patched_cves(d):
         if not fname_match and not text_match:
             bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
=20
+    # Search for additional patched CVEs
+    for cve, status in (d.getVarFlags("CVE_STATUS") or {}).items():
+        if status =3D=3D "Patched":
+            bb.debug(2, "CVE %s is additionally patched" % cve)
+            patched_cves.add(cve)
+
     return patched_cves
=20
=20
--=20
2.40.1


