Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A32BD44154
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 09:19:53 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9081.1765531188234081428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 01:19:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=TkQVpuA9;
 spf=pass (domain: phytec.de, ip: 40.107.130.82, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJwxuIptXWKow+ygTCPepUnu29WCaSYb4Mf2q4k6zGeAbH7nu6u2+8WwY4SWjvLO8RhnAiN+kObo7KG+0hrd0NOuN2zMyB7qynGNRiSkf0j8iwasfMtj+/Jil+UQDvCgv5+Dyjf4/1CH5+ruAoCYXvMBdSHyRaaEIZIN78OIYQ6g8X8Fj1hnpHYKCPjqMeP19r4tG+aAisMu6EhQKBw866KpQd9hWWNTVVdrvEgYTIsbwybQvWBNdniEBX34Y6wdC4QFhPTNBxXQQBT4YCkYCYhSGuIbzO4jijoiCV4Nk0Pd0+rD0CHVAjmGIHAeel3WmSEzHvsHmKzq1AgrjW8ZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vr74p+0wk9he1ZiyGGZWYhU6MUP4aV6ZMwrj4aG2k0k=;
 b=qLrZ40Pk7W0IptoXzEzJVcaWf4YlQ86wdSiPtuJuxwf5uVXc7tckZFMQV+E2dJ+PhrjTE+rAkoIS/yOzO+JGOz/pGAjwc0/SLBze71f3i1WgglAY4Mldhco/p7NAhUOAztQ/peaJXGDcpTHv6bU54C2mhf46ZuFN+zxF2BBX5AtdyLuy95RtKxczO7rq5pLdi4BsDKxkDjaV8ewDh+UIZN94Pcotc0SjwEBbFDLqPr7D/Adyhlfzw5eH8HxT8C9yQEJ2EoLtvNzmWjQ+CSq2ZU1p2j9O+UdJccOVapf4gUvaM02xs6IoC0eR9hOFeYXR5loorfA4takmTk+VfB5RAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vr74p+0wk9he1ZiyGGZWYhU6MUP4aV6ZMwrj4aG2k0k=;
 b=TkQVpuA9DbWTdafxhBrkN/QTT3eIiUeACh8qY3NaIlbmjkybuYBUw7orcre/fo0XJFoVcc7fyHqTZfmmV6qUAunXKaabjPmCwEKYrh9l/wTDq3EwHIzU3YhDoWp5lWA2YbXGzX8/E+0KJnKzZtwXI7zV7XxbGBA3zmV8s9Bq7NpBJ6a6zIx1FfzD3Tn7yTiwBH1Y6WaV1FwRfkpnr+xcEvmORuQ3Itj1lVHBRZvUWMGl92W06VKwLGSm1zwk8gO0XnJ836feVrz9pdf6KK/DIV7RRcVVOiyGLSZt/RZQjVdJdb6+TbvHV0i8hCNUoTLhsj6LdTx4o8Du035tdjiVzg==
Received: from AM6P194CA0002.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::15)
 by PR3P195MB0729.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:32::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 09:19:42 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:209:90:cafe::d2) by AM6P194CA0002.outlook.office365.com
 (2603:10a6:209:90::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 09:19:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 09:19:42 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 12 Dec
 2025 10:19:41 +0100
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 3/5] cargo-update-recipe-crates: Consistently use single quotes in Python
Date: Fri, 12 Dec 2025 10:19:24 +0100
Message-ID: <20251212091927.3741063-3-m.schwan@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212091927.3741063-1-m.schwan@phytec.de>
References: <20251212091927.3741063-1-m.schwan@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|PR3P195MB0729:EE_
X-MS-Office365-Filtering-Correlation-Id: 311d3bb7-d16e-4ef9-026f-08de395f955b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DIjJhrdF8iuqMds6YJ6Ez9dKSRsLcG/hFSsZkuC2i7ifByz2FRW6D2Jac6XO?=
 =?us-ascii?Q?/s+6Fwn1f30NbITFUnbyKds8+um7lOTGa5Uvw/LijBF+4ZYo8DT0EVoft/IC?=
 =?us-ascii?Q?nrCUeuKTXDBK7zExv4h9qxsQUA5SHDb23ejd2X3aoudZZasZ/p8HrxYL6yUv?=
 =?us-ascii?Q?ruKmTbSAMi9WFPCmdcUIRNjgGMs5qA64tXDCW0InKjLqAp5MooQgDQwMYNhz?=
 =?us-ascii?Q?XApErqbH7lfMnsCStChSo+VBLaZLePuAiblXwpXr2jRpsNW2fT84LFiqHaZL?=
 =?us-ascii?Q?k1X0n3LK+ZSTUEHgVN3UinMnIZAjXvqGebWYKcCVkKzos+Oso9RGgTiLtR/6?=
 =?us-ascii?Q?XIs7pHPRCwpu2Z4j1Mj+1McmwsirUQMbI0cTrAdJ1hXqH+HRqOo5BiV1rOOj?=
 =?us-ascii?Q?cQAUD6hG9+Ck3eA9LrMvXgWEYyIEFh6u3ZzfRnuPc8AwkdqqXp9N9RGOR2pA?=
 =?us-ascii?Q?gJknfwE8uvdoVkARf5boALBsDIBhLq6RIBb31OY9IRF0+WkDdnj1GIslRa6C?=
 =?us-ascii?Q?7H+52nxMwMjJqp1iXZslvXsRMouzFQmnpEwYEGkeZnQSDMQgscArfqTd6lU6?=
 =?us-ascii?Q?AedTm8AKnky/h1eofRTLtLIK0XKULPV5QS4mEZN3Dfy45szsedcULLVzjVLa?=
 =?us-ascii?Q?//dwVOEkFiQtESNs3PBp1/NlRK7xZltqUOXTlixnonyzkcFF2/oIn7CTnohW?=
 =?us-ascii?Q?5v/vAknEXAber2I8I4jilA+rrcJPIkM8/2wLTqYO8hVJQIH2uXb4Eh6Jr9Vy?=
 =?us-ascii?Q?9ffAxG8SPr1OyYxBDokzNGOwOeVVALFYRQb8PLI0swIFSv2b5ZdQKY1wT4b2?=
 =?us-ascii?Q?G//4i++8ekRJK6P8rJvSnglk07LXl00yulX24zaseUcpFKDi7VIDV7OJ2wBI?=
 =?us-ascii?Q?a1Y+cyuOZMlJ/onh4oVqvxGhYZEUU6qV8+B6cG3xilWGHCCkbS+7nHkQaE9b?=
 =?us-ascii?Q?ZADEHBip5BIDNk3jHxWz55AzEPZyFP7FZ+FQXK6GThvsp8/gS8+sJ+islEwy?=
 =?us-ascii?Q?Fqm8hfJARE2lRVqLgWNCmUs5mCY/vlDXo1znES17OOa3MseQXVpH1IycDFUz?=
 =?us-ascii?Q?mctmmiVMDsA2DvokWQwRuk6H7KwYHOmPx1erF7cxhBcVcP1HMvkwkmiHH6nj?=
 =?us-ascii?Q?HCydxm/n77W0U+tpgxIDGUwcizcRoAW6M1O3N7OOx2IbSX75/Cp3vm/UGgM8?=
 =?us-ascii?Q?sMQKDdfJpHwL3REtEgA5t1ZlqhqlpHIaOsSzXuLH7GHYYFJqxwXD3RvI27/W?=
 =?us-ascii?Q?OATnaCM9hp8kQAWPqlTgdOR/yTLeCGioyk2LVVI96HdbzWTMu/83IGS0FF3Q?=
 =?us-ascii?Q?fSVoxk8aWIvGXDLlWJ9WkcpgAn5azr+yUOoNPdg9iFjz+AvHEvhzHczZvz4r?=
 =?us-ascii?Q?RJRwmLTKehZyEdY63xyWv2dY5Fy14elSLmmuLKZRRTZrNmUnMe9qdTVkNgxd?=
 =?us-ascii?Q?n42r8M1VLajGJMxfG9OUmpTyWYikRe5WDs9LBgXZyGRmmLjXCXY/ATwXCfKo?=
 =?us-ascii?Q?Xt4avCzlz5bfMCvz5WOueFdrXX1zjNTm4OaN3W2lWVM6aH6ItiZAh6CO8tYr?=
 =?us-ascii?Q?TKemVTWTvb6kq1qr3eU=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:19:42.3205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 311d3bb7-d16e-4ef9-026f-08de395f955b
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB0729
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 09:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227575

For the Python function do_update_crates(), consistently use single
quotes for Python strings. No functional changes.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
Changes in v2:
  - Split changes into multiple patches, for improved readability
---
 meta/classes-recipe/cargo-update-recipe-crates.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/=
classes-recipe/cargo-update-recipe-crates.bbclass
index d3745392bd..6e82bd4a51 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -45,7 +45,7 @@ python do_update_crates() {
         # we need to rename crates with name and version to have a unique =
key
         cksum_list =3D ''
         for c in crates_candidates:
-            rename =3D "%s-%s" % (c['name'], c['version'])
+            rename =3D '%s-%s' % (c['name'], c['version'])
             c_list +=3D '\n    crate://crates.io/%s/%s \\' % (c['name'], c=
['version'])
             if 'checksum' in c:
                 cksum_list +=3D '\nSRC_URI[%s.sha256sum] =3D "%s"' % (rena=
me, c['checksum'])
@@ -56,7 +56,7 @@ python do_update_crates() {
         return c_list
=20
     import os
-    crates =3D d.expand("# Autogenerated with 'bitbake -c update_crates ${=
PN}'\n\n")
+    crates =3D d.expand('# Autogenerated with \'bitbake -c update_crates $=
{PN}\'\n\n')
     found =3D False
     for root, dirs, files in os.walk(cargo_lock_src_dir):
         # ignore git and patches directories
@@ -76,5 +76,5 @@ python do_update_crates() {
         bb.error(f'Unable to find any Cargo.lock in {cargo_lock_src_dir}')
     open(target_file, 'w').write(crates)
=20
-    bb.note(f"Successfully update crates inside '{target_file}'")
+    bb.note(f'Successfully update crates inside \'{target_file}\'')
 }
--=20
2.43.0


