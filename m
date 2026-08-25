Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E81FC61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:08:43 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28740.1787681314609775727
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=FdtVo8yy;
 spf=pass (domain: axis.com, ip: 52.101.70.66, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRYCYsIXVuxqg9oWQSJHuyHF6Y6loBKg3Ctd8CjT/t4Bf6XLemR359442mOVboADCVdD0VMzreSjTzyFLyk8ZdRCIMxxG1Gpe8Tg88xStLDS19VFhCNV6yRKKnShl6ayM8l0lZCmjYr0ZdVYLI+aOsSoTi0TGfRI24X1me+Z+2AXk96sznayuXaypSdFKwmM51CThHQnhiW8kq1CJCzbTCurMRAj8kOS3uRb6YLkQdZbN3Ej1IZ4Ycj3a0THGSKyf61MlUG5wTyyCF2l9zLNeCoCSyeqSfP/zXtkrqSkeIYZLbLC0B6B2jAb7YsyLh7WCDWXhSPF35wAfvvDzy/GBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96id1ZHJeAmc0uZNF659UgCI4N2l6U2q0n9uQgzNEOs=;
 b=pXtucp2RcurtFKoaYW0tpa3ybEPlHe+XHyDNv3W6MLm9It8Z6Aowm0u9bGanDUUd2Tb5rsz3LfHVbCBWimVdnj0Lleo2TzRkZ9FEnSfO5LksdyRfzi3srCX8gh2enUHFGXSpp+71V48eE5ajPWPkIUxR5CEw0Hyw8vHPth6vzoXtMBci9+ZzOPOpub0qyGDNIM8oSbF/tlT/qlLnI/q9j0PCkBLUZwRZg8ZXXKx9Z7OvQ0Tg55c2WWrM1V5xb+SSWqdc1++8aSs6wca4xoQhJVcFvNw8Uf6ExpdKbjqaAKasgJyLFVr1l3wM6Z7BcYutWZeL0DKedb1MZPEOzt+tVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96id1ZHJeAmc0uZNF659UgCI4N2l6U2q0n9uQgzNEOs=;
 b=FdtVo8yymcmTxuFYxScPK8nof+qKXOAHa0wDnX5D5Z0nlL4clvFh3nAoJf8WhBWdVi66krbq866jZujvN3nrHMGXpQEW1FHF+QcaT/D4LAlS6y9PQnq5i9Ju5rBaAwJQzjL78fdzRAhN3kVVu6iwziNMmfFo+uGTQXj2YpBjxII=
Received: from DU2PR04CA0295.eurprd04.prod.outlook.com (2603:10a6:10:28c::30)
 by AS2PR02MB9929.eurprd02.prod.outlook.com (2603:10a6:20b:60a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 18:08:26 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::5e) by DU2PR04CA0295.outlook.office365.com
 (2603:10a6:10:28c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 18:08:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 18:08:26 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 25 Aug
 2026 20:08:26 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 25 Aug 2026 20:08:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 3DE932CE2
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:08:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 384A312B4CE; Tue, 25 Aug 2026 20:08:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/5] package.bbclass: Remove GROUPMEMS_PARAM from PACKAGEVARS
Date: Tue, 25 Aug 2026 20:08:04 +0200
Message-ID: <20260825180805.2990506-4-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825180805.2990506-1-pkj@axis.com>
References: <20260825180805.2990506-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|AS2PR02MB9929:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fd6931d-6eac-408b-e9a5-08df02d3dc3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	3wneexmGTPRDOaFDg5XI6rbqWGIv9sBQpga7eDuo0vaOJTGTZARZH4pT0HMvw4aYrQIP05+WryJfKtMQTfJ3s8pKlm+wVk8OLpkN6GAB/O7g04SVIpCC9XaMYFIhUgwVQQu9y6hz1T50UPRYBorM7+JxOBkBLGgyNU1xMjIElUO8hz6VxXFA0OxfX/1NKyE+SUrBVAjI0RQJ2xu4ju76hvoeP52KtkK/5mzr5ZoNeEsa66xcJRwtWabpKkpcHRT9DKiNc0RxoSH4UGVctapmXBTeUmlK/Ao6LJqvgu+XyIYYqITKkw7Ofz2iIObcmhcHGk5mLNs9nh1M8BTyaGzMcGzzE64pkmpWIiIUvFk+QeN/LVML6JaZQ8o33QooG7mMbHpKuDDxS/LyW+bJJImVIC/MT0TFygpPOY7ub+pqZSUxSH3XX2wkSKotux5tL14CZCAdq9bBWbtQbvPn1thbhTYJEMFkjYYekKskqncv6j0m3uVpTh10zS2arSyJJAiwtMnajlBSccPZWaYxdrfLDSU1tvMJUxxYe1zmPHKHDb64MDlGadc6Z99BbN0sL0qvxEjrLyLht0PHhz/tGiz9eHUffcovI4gaRnwk9fIY48e/uMxiFQhay4ZOnUvqrYMMkVRoWmEcCEzVFq2JBEWCXcyLUR0bO/+N1ziz7iygkckdNoqXPZz6u1Tz1AxsxdNapnirjKslGi7Mck92cOiGug==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oDQg0rTKMeKXMmZqnP80UUi4pyxq90w1YzkIrFtaqxO2HQU5h2kRm/IGLXr649+0ysl7rJu0dQithhUGHlkNzckxSIF4ziyS/PKw38MG0mIqPRqTlvpkyX0l1VVQm7nPGJKTs+1bBhGyzU4dGBk66L7S/NKonGiDIqrMkK7N5vi5KSF7By9o6WgkXprAWIDE1aMVxvG9TDPUx34PQ8u9rf6+2E+cmPIkOBnQUOsHGbgQypcm7/3kR2O9OJMTp1DKcCM79nKdsMPjOH6kuhGxIDGjDLrUn74cZ5zM5HzA9Me2+Q+RZ8IjNY+dh3bDTG6hJMDTzobs43dPSpLKdfF5sAzl7HcBfC5lULVBEBT/wevyIlB3e23ydFkJQHDjeqXt60UI8blvcYbG2nedXDEZd6FNRZ+h4EhcHCTQuDUPaM9vnWme11YrkYvbQjyf2eFc
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:08:26.5936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd6931d-6eac-408b-e9a5-08df02d3dc3f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9929
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:08:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244252

The GROUPMEMS_PARAM variable has been removed.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index 3d293dead7..1dd30fe8b8 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -438,7 +438,7 @@ python package_depchains() {
=20
 # Since bitbake can't determine which variables are accessed during packag=
e
 # iteration, we need to list them here:
-PACKAGEVARS =3D "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS =
RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm pkg_postinst_o=
ntarget INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKG=
E PKGV PKGR USERADD_PARAM GROUPADD_PARAM USERMOD_PARAM CONFFILES SYSTEMD_SE=
RVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTE=
MD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS PACKAGE_ADD_METADATA"
+PACKAGEVARS =3D "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS =
RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm pkg_postinst_o=
ntarget INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKG=
E PKGV PKGR USERADD_PARAM GROUPADD_PARAM USERMOD_PARAM CONFFILES SYSTEMD_SE=
RVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES SYSTEMD_AUTO_ENABLE S=
KIP_FILEDEPS PRIVATE_LIBS PACKAGE_ADD_METADATA"
=20
 def gen_packagevar(d, pkgvars=3D"PACKAGEVARS"):
     ret =3D []

