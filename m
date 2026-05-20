Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FA8CD5BAB
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:15:01 +0000 (UTC)
Received: from mx-relay22-hz1-if1.hornetsecurity.com (mx-relay22-hz1-if1.hornetsecurity.com [94.100.128.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7301.1779264891388574751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=W2argq5p;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.32, mailfrom: hsimeliere@witekio.com)
Received: from mail-norwayeastazon11023134.outbound.protection.outlook.com ([40.107.159.134]) by mx-gate22-hz1;
 Wed, 20 May 2026 10:14:48 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dj83MH9ngXRytWTHfx9a2V0ZF//nYCkUr6+V1WMDOC0kSnO8uPpNQxQg+36Xwo6zrC8zPXM0RqWb5AEesCTKnSxqzB533IEzrZxiBCKHzV1cl6y2lCuV176HZwmePqY4w/30h/oFuyKAJjjwtoY+/zCz36Y+X7dj87P68LbOA7DR5xAYvh0zG5em4zX2oxVyRaZrYo4S4eUJuoSQwHTVfJWeVHORbUrfrD0wTFls3AeUe4Bq/ZFLrRLGhwKhbkEcz3zvvmRaIUX2vqPgoHm9rfJU/W7L7+PrcaC+QsTyJP6oabmPccuGgFzscgVhm5BxeJs+Trlb6uiGz1tfH/zRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Hw+ZTh++uGXxMHTWK1amlREZJ4dizd6TjtRMiITHq0=;
 b=gPMmLglyKUvn29rG2nMXv7KrQU7flzcNCdryc+xOmBBBX8yMFj3OKI6gWTZzidBI3KgeltDDVCy/hTc8HjaxjEJpC6ZZhbt+i7B+5wRptuBQsgf6hh0VYzHQFONRPnaGcCmy3ivJ96opxc8gReriIeW6DTel+yLCX/us0qkKhSYel8viQgXnT25OMYXwDymyUYkVH5uMYFthTNyC4H3aQPRJfAhq6DGUWcTZGaUWqboIVVnCYdtx30TRlo1vm+hloTlxelyF67GiJeedmTw1GkdiKG1YOLo5g72nZPz3Blxp3GvIMr2wkx7TLZ/dUDfN1qd4VFfr/4rtJpTgC0ZTWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Hw+ZTh++uGXxMHTWK1amlREZJ4dizd6TjtRMiITHq0=;
 b=W2argq5pIC641LzhZJRINbBDvUc/+N7X1zTBR6oP2gxFuqyu0rItyXfSZq+u39cZz5a1kugELk0WyYlaFxl16pJPIwDh2mWTAuI0ZteleSqSoFPZnCVhjNObwqLsCzPMk7Y0V4GVaIWfPH1x1DfJMhZewzSodiH6QKgC2dhytXmfbL73i5k50/ojVGFCJiZl5kFo8R4eWgJmlQdG0XsI07ytEGraWNVUlecIRlGnrclzqjQEw3JwxWE8zblp8e1OdaSKgWd3oxWLQkoJETZvNLcMqH8GJpqYoT2w7xPFPyaSKbRpUmBPQji/cFSTbSJ4DTXocYQY4cmz/pCXAzQPcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DU4P192MB2472.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:573::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 08:14:39 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 08:14:39 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][scarthgap][PATCH 3/7] gnutls: Fix CVE-2026-3833
Date: Wed, 20 May 2026 10:13:59 +0200
Message-ID: <20260520081403.3052797-3-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
References: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0410.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::22) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DU4P192MB2472:EE_
X-MS-Office365-Filtering-Correlation-Id: f04d48a3-4b13-4dd9-683d-08deb647d6f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|376014|52116014|366016|13003099007|22082099003|56012099003|18002099003|12006099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	lZKBNoHbzugHDC1Oi4MZZhrO4bGOJFNiiBa062D8tmeuFps9eoJRTu3wDIfMkFhDO8WUKq0FGGRdqdvTiD58QeuERzFEELCFZ+ZNdrhd9A6NhFxNfnn6R65lAGtkKxK3rjcAR6zBvIyUu90U0T8Bc8eEcNUA7C4Ghpy3aEe8fHw/BPeLGksrjIQj/7ONigt2Fo35vQyqu12yi3LuyEu/5xNltmPoZxIRbjmMonYbLrIbGkdS7XrXFO1h6x3KFGpr5WW78C47VkdOqcsmgYW+azUl/rtaUd3UGuRs72G0s5JMQWUnMxalL2COBsgtFktt68hFHu/UTCBXCVRD2xXYzqCtR//my1Yzzi9Attnh2sXeX1wJpC5EaBKL/ui5k92gNYQQKBksZI0zu8ysUX4H6Wpaqjedl9HomTxzgr4YvSH67kLAbkHxSpDjb90S+WX6yIHvxj1UqKTqNf3FPC1lunNGlx0BXxqCs1Gs9BH17eaiRUuekvNV6EsmJgUPDJ3JTzqI+9YxOhvU/tZXBsWpWLz1QtxObFFLRQt+qPYfOY3g5k9SngKNSmLeTU1MehRUx0ArjzOS+wiV8jK+8JY0i5U3L8DZwud3SgHU2lDjfVPgMYRU4EAOv+4Q0xrdDvlsphHrt9aikAYfI7lpJKu9pBoeQZhT5aBaq5psgvL/0U/ePyuTZpeM2Ucu+zdXcxMF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(52116014)(366016)(13003099007)(22082099003)(56012099003)(18002099003)(12006099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dmfuyHpGBH8EM0/W6gSFk9EAHrILQpumJS5T/GslmBaA3unfrvq2tktxHUsM?=
 =?us-ascii?Q?1AcVqRv/TmQJSqV7h7yOlV/aSxLp0N1o2/AE4roL7fK9GpzSs3rutvtyC4OS?=
 =?us-ascii?Q?W8lylXCIsrf8AI0ov17+cQ/ifjEDOsYn+zMJnqTJi7WncLV3jA0oP/IZ5wtr?=
 =?us-ascii?Q?b9SJG5DgHd+DHJ08cQAnVSxk1dRNTr9yzhp2nzWthGFgHS8yAL26CmyArMT+?=
 =?us-ascii?Q?7Ruk0Rn5XS1cLG0W4/MrLGycBR38Q2dWqcVPRGm/DwPaVZp3ZW8kfn/n5VH5?=
 =?us-ascii?Q?JKJhGqS6cdQZBbWEiHkAzRxM6pEJLyHPMSwQXH7COvacraqoLG2ZaK04ifKd?=
 =?us-ascii?Q?FXhk7QrMJPM81CxHQ5y8TrhdW1b/LH7uRKWh2VpRB35A1td7KzUE10hOqYxv?=
 =?us-ascii?Q?pRHj0f/A3CEah0XtazX+b93pK0TDj8TpHciM7dk002cBtK1gHLjCMoGqq+aV?=
 =?us-ascii?Q?GnHK/2jmZTNL2sCGM/JKJqPyc9GKniuWWkGl+oQltGOTjkz1xto9XCfubPSn?=
 =?us-ascii?Q?VWGz2XldW83ovT1+mcar1hXX3s06jMHcZQYbvNClh1Q/gXd0GbtYwcz9sbqJ?=
 =?us-ascii?Q?VsUOIz+yDbKbEOJ7iXLsAcTU443/ZQLkOqalssOctyjC8VeYrtifxFnoToAI?=
 =?us-ascii?Q?TfpBpIfePzZPq3HbriZ6alBcng3lsWsvGvlKGAtilhyKUNr9PmqNnaUMRn48?=
 =?us-ascii?Q?Xql92pTCvfR9b6Id7jjMnRmIBYW5rA+C9LlQLrcixwHg9WW9Kf9ycX4u2M48?=
 =?us-ascii?Q?bRM2D44cnP6ozXhZJT7E9BRjFZR7NpKnalSm0a9MicMQlrNNhCk9bYZYLGVn?=
 =?us-ascii?Q?aEW451E9daESfTsWGTrUFkSFyJ3UkHCX+pkKFTIS9FRONEmX63S4OOR/Zv8s?=
 =?us-ascii?Q?kKley18W24kAF/BNCDlVM5zZj3zzwc9TCJwVYy+VtYvLQqF/Ez8hV3+5K6e1?=
 =?us-ascii?Q?PKz+XZzBKNGYCtp2mS5qsQ+4vGIu1nIE6TDAEkYs2HmehkZwkbuc8tiFEDjH?=
 =?us-ascii?Q?I5MdddrMYadBJL0IqqwGJVj8VHPwDxyixrY+9zz1eDVrIyUI2/Dvn+QjckPw?=
 =?us-ascii?Q?yaOFQoh8xrBWj4/UfklkbVJVqenVQmBtKTTtopqCFrvJZfW7yIAa3xmqxXjZ?=
 =?us-ascii?Q?s66H/Cq7j5+HDXXzoO57g0wnKA9pLsLnjkzVZKzIIGbR6bGIJXo4ppwlHBMk?=
 =?us-ascii?Q?SkxwPdJnPo/qdRNiTH9GyTjr0HbdjY0ojvFPUncCxqMZBqptgCcJHic8ECKy?=
 =?us-ascii?Q?SaiCmAH1tF1jNSCigqd1teHLdbqkH1DlsvDJNN/aVz5ynpvk4boiYl2DL5n4?=
 =?us-ascii?Q?blVrfZF1SDRKTfKNCBrYHvQTJ9/6sspfz+WVjnPRoEEcbmesIWKAI7AX6uRE?=
 =?us-ascii?Q?v7tXzR7ecbM/s46roJB1OpgYb44Q3lC17xKwAIzItfaQ8APGADFUSGANQ8oQ?=
 =?us-ascii?Q?6otXOXKrg9W6ewEapPrJC9ZYO0WgEniQEgaY7CtpFoS97UG3PjBqizZDVRn/?=
 =?us-ascii?Q?moTp1e7so6Exj5T7KAcUW1pjxhhvr+gxV15EYZP9j4DEJDo+csSSyqCw4pIJ?=
 =?us-ascii?Q?1iP4xCCDLc206ZMgMAFelLFowRPhPcrhZeC5PMymhj8HsYXm9DJ3l85x7VBD?=
 =?us-ascii?Q?mz3e9u9HsrX6B/KMatbZM4NPd6OoUFyovtXCH9ecfEJGasB4vlHQXS5NafWu?=
 =?us-ascii?Q?KzHJngcBlkVbC+4k1hsmlukQNXXBLpCRRrJ7YTObxvRMursTU6n053Otrtts?=
 =?us-ascii?Q?vqqQIiyGQlXBrYoue7qaWX+fouyp+blotPwOiFbCFoG28VTEDhwir3N5r4i0?=
X-MS-Exchange-AntiSpam-MessageData-1: XlQbSfjxLPwmeQ==
X-Exchange-RoutingPolicyChecked: 
	RbtnzCcVeyw6rglMRpc4V+61eOevuruVekl7qau+o+b/T4+1I61c5fSP2TL7i/0/Ya+muIW5wHMGG4ZnA1/w29aoLa/QrUu72EUne8aJoq3z6pg3iL0LsaFxVXtFULuSNLHDLjnUU4nx4+KFvMrimkBUxmsdfcbK3GA9kn9+OOtSg/hCxSfsufHsgsN49cnIpCQz6u24ImxC0b9J/pEa9femopVT2pMX3dJ81y+RYouXCUGKt/Mfy7qtI5MxVTWjCiUFjL0OfDsvJUfhv66DPUyKRqRUHylTyNt4LFgoaOVsYCKHboCAvzSlgF8e6s0liIrbCTX1LRDiYHntWDk9Yw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	M2zujARwrsTa9UrVkXc+Jwx/pETqP7u4s4eSdg6A34KhAqx2iRuPJc5nImKKd7TdCSO5Fte2CdfImmPMWq09ObbGEFOZgDpBf4YNfoqi5fljYICI99tqJnHQqRf0mDh9bC9/DmZtm1J88MBVwZIB5eWIqEEG/AwYR6/KNXVXm1Rl0VS2U+ZF3tF4ogTA95CsFpW6TvvHCeMeqyhPY/5xs2dkUpjUneHzwbQNT3453U5KHlHRvJOBOhC4CTYamuFn3N5DX8ldZ9CgX8K9il7AlMrwR4K3OzkWG4xH7WhfExNFfu6CnT2CtUbVDsO6PYrxNgI79ebPsJROFCySUcVh9YoKpi5k8Habr+kuMr18V8CawTWdYH1CmgdTW3If4GezloHuM+voFAH1BY17kOJTrrJgMHFwcgJTSxf7yQBzK62bA+Mal8mPNIvQOmWR5d+GvBvahv97cOs6jHwLyMzG3VG0rmH6ZZsOigA2f9U0y9e1DATH9tJePrRNPWKLaYfS+WzDmDbkfl1qh6/5Ty1pg7AZrA/2BzBQMU3jv8b5dpyS0LT2vF3Hh1Ga+WE8IAsRi/+8Ng+spERve4uTG41c+aLvGQn+0qnw1+Cc5xfAlGGw43FtmqfwjsU2db17Gss0
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04d48a3-4b13-4dd9-683d-08deb647d6f3
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:14:39.9157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i31+qIYNZMTfEYwQvdpQ0DoMlIBQY4CgiZH64iBLE/L4LwBuXbJ75cqN4y59wMIh6jUTdi7HetGzcT/JgBCbDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P192MB2472
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate22-hz1 with 4gL48L32vYz2BddL
X-cloud-security-connect: mail-norwayeastazon11023134.outbound.protection.outlook.com[40.107.159.134], TLS=1, IP=40.107.159.134
X-cloud-security-Digest: 57eb35a8dbec34689b225d800316cc90
X-cloud-security: scantime:1.769
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237393

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as mentioned in Debian report in [2].

[1] https://gitlab.com/gnutls/gnutls/-/commit/19f6508647bdcd3ce21130201e484d7ca6d962c5
[2] https://security-tracker.debian.org/tracker/CVE-2026-3833

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../gnutls/gnutls/CVE-2026-3833.patch         | 94 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch b/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
new file mode 100644
index 0000000000..cca4ff86f8
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
@@ -0,0 +1,94 @@
+From 2e8c3569d125d188b293d132c040201aae6ceb16 Mon Sep 17 00:00:00 2001
+From: Alexander Sosedkin <asosedkin@redhat.com>
+Date: Mon, 16 Mar 2026 15:29:40 +0100
+Subject: [PATCH] x509/name-constraints: compare domain names case-insensitive
+
+RFC 5280 7.2:
+> When comparing DNS names for equality, conforming implementations
+> MUST perform a case-insensitive exact match on the entire DNS name.
+> When evaluating name constraints, conforming implementations MUST
+> perform a case-insensitive exact match on a label-by-label basis.
+
+Domain name comparison during name constraints processing
+was case-sensitive. For excluded name constraints, this could lead to
+incorrectly accepting domain names that should've been rejected.
+The code for comparing domain names and domain name parts of emails
+has been modified to perform case-insensitive comparison instead.
+
+Reported-by: Oleh Konko <security@1seal.org>
+Reported-by: Joshua Rogers of AISLE Research Team <joshua@joshua.hu>
+Fixes: #1223
+Fixes: #1803
+Fixes: #1852
+Fixes: CVE-2026-3833
+Fixes: GNUTLS-SA-2026-04-29-5
+
+CVE: CVE-2026-3833
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/19f6508647bdcd3ce21130201e484d7ca6d962c5]
+
+CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:H/I:H/A:N
+Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
+(cherry picked from commit 19f6508647bdcd3ce21130201e484d7ca6d962c5)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ lib/x509/name_constraints.c | 23 ++++++++++++++++++++---
+ 1 file changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/lib/x509/name_constraints.c b/lib/x509/name_constraints.c
+index 04722bdf4..dee045d25 100644
+--- a/lib/x509/name_constraints.c
++++ b/lib/x509/name_constraints.c
+@@ -35,6 +35,7 @@
+ #include "x509_int.h"
+ #include "x509_ext_int.h"
+ #include <libtasn1.h>
++#include "c-strcase.h"
+ 
+ #include "ip.h"
+ #include "ip-in-cidr.h"
+@@ -80,7 +81,7 @@ enum name_constraint_relation {
+ 	NC_SORTS_AFTER = 2 /* unrelated constraints */
+ };
+ 
+-/* A helper to compare just a pair of strings with this rich comparison */
++/* Helpers to compare just a pair of strings with this rich comparison */
+ static enum name_constraint_relation
+ compare_strings(const void *n1, size_t n1_len, const void *n2, size_t n2_len)
+ {
+@@ -96,6 +97,22 @@ compare_strings(const void *n1, size_t n1_len, const void *n2, size_t n2_len)
+ 	return NC_EQUAL;
+ }
+ 
++static enum name_constraint_relation
++compare_strings_case_insensitive(const void *n1, size_t n1_len, const void *n2,
++				 size_t n2_len)
++{
++	int r = c_strncasecmp(n1, n2, MIN(n1_len, n2_len));
++	if (r < 0)
++		return NC_SORTS_BEFORE;
++	if (r > 0)
++		return NC_SORTS_AFTER;
++	if (n1_len < n2_len)
++		return NC_SORTS_BEFORE;
++	if (n1_len > n2_len)
++		return NC_SORTS_AFTER;
++	return NC_EQUAL;
++}
++
+ /* Rich-compare DNS names. Example order/relationships:
+  * z.x.a INCLUDED_BY x.a BEFORE y.a INCLUDED_BY a BEFORE x.b BEFORE y.b */
+ static enum name_constraint_relation compare_dns_names(const gnutls_datum_t *n1,
+@@ -121,8 +138,8 @@ static enum name_constraint_relation compare_dns_names(const gnutls_datum_t *n1,
+ 		while (j && n2->data[j - 1] != '.')
+ 			j--;
+ 
+-		rel = compare_strings(&n1->data[i], i_end - i, &n2->data[j],
+-				      j_end - j);
++		rel = compare_strings_case_insensitive(&n1->data[i], i_end - i,
++						       &n2->data[j], j_end - j);
+ 		if (rel == NC_SORTS_BEFORE) /* x.a BEFORE y.a */
+ 			return NC_SORTS_BEFORE;
+ 		if (rel == NC_SORTS_AFTER) /* y.a AFTER x.a */
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index 702a83fc85..69f90a3c01 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -47,6 +47,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://CVE-2026-33846.patch \
            file://CVE-2026-33845-pre.patch \
            file://CVE-2026-33845.patch \
+           file://CVE-2026-3833.patch \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
-- 
2.43.0


