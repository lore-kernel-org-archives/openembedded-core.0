Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95566CD4F21
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 19:04:38 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83624.1778612674844798569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 12:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=dPBa8d/H;
 spf=pass (domain: axis.com, ip: 40.107.162.14, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jROh5+qQAfXjYRO9VRx9sn6BDv85bITXlIBpJKDE14KMmmuQSJUYSr2wHMOF6KxX1ZRLdovXQw1gqMsWax1qS2uajuge7ektFQkBLd+GImIX8R5pqmNORzPRo42rYWhEHFXNx8iQxLcVQ2iRKVcp5bgMZphdqQ3Rg4oHZmNM7ci3HRFTKQprmwSZyrSQzYbmdpHzG5dAEUfpSvPbQwNBMJ7dKsGCDm9/hwVN3xAR9c6wVAZkwEEdpVr4QufV7VtGPNmVfUrChv7d5NQhYUyuN3GuFUbOwsvXuYY7iwAKcH8VmxMhojZABwS61uVyphtDFXQz6r4wJEXNbdevYl4TEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E15XuBkVrVRQLCQwVGsD3aEETGzjorrtgcflAnNP5xU=;
 b=eYfwyS/1eNnBLEAnv6Xd+tr205tLBY2AsC0Lypliww4m5wEoDBZXMA5ELliq0PirdKpa1RuhZX4I3R4zc6kzZSEe2UetQlbG3VExD3NXk7iZN5tKPZ7M243Q/3KMdNapmkEQjEnSWuyx/EKBunuLU9yc+/kbTIwbqisqqSkRVpMZJS5C92XzD7sr86K7vpx++rqR8hq8txlfNvyTDpj4kBGJ36F80RgWnH5K5/aoyAnSqKaeV7VCoEJloXx9jiA6vyRhldZ9gwJB5NgD8Ys6apEtXG1Xw8P8KDP/nZuQp5692+lFvOVHA7dio+KsfHvHbmHMnVhTajfH6WPjfzYRRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E15XuBkVrVRQLCQwVGsD3aEETGzjorrtgcflAnNP5xU=;
 b=dPBa8d/HpxxE73ilrB3X3++MVFJp3KlQWK+Ugw9Dctd6gpeRGpDqtqiS+Ppc0q4c8BF4WMlcmUpHEpSfnRj7tLkz/2jXxyPBi9mlaiv2CdLCSEH0p0oZ4IHW5CT112c3hl7WAj/i6Gsjh5ie0VZLJTh9uTPNlMh2Dzs9qJ/ouy8=
Received: from AS9PR05CA0191.eurprd05.prod.outlook.com (2603:10a6:20b:495::16)
 by VI1PR02MB6077.eurprd02.prod.outlook.com (2603:10a6:800:18f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Tue, 12 May
 2026 19:04:27 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:495:cafe::d6) by AS9PR05CA0191.outlook.office365.com
 (2603:10a6:20b:495::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 19:04:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 19:04:27 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 12 May
 2026 21:04:24 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 12 May
 2026 21:04:24 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 12 May 2026 21:04:24 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 3D6182834
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 21:04:24 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 39503125D1D; Tue, 12 May 2026 21:04:24 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/5] package.bbclass: Add USERMOD_PARAM to PACKAGEVARS
Date: Tue, 12 May 2026 21:04:13 +0200
Message-ID: <20260512190415.948535-4-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512190415.948535-1-pkj@axis.com>
References: <20260512190415.948535-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|VI1PR02MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: bd9b6ce5-3b9f-4ed8-e400-08deb0594a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 
	R1hiB+3/+EhYaE0rdb7xRNB/BofhLUlAOP2eCn5KN8bo8YeAoRyiIA3UYWliQuunFa82ZuJzTAHZ8075affPAhB7ZpRsiIpQoV0pHf7hOWiWs/T2MiE5nBgR7Gzt7slMgSp+Q/3uj+siYX+a/H9OEAZIeG1p7y9BnVjPPjKAKtFW5upZ2+s2MrjishSI4D26HraA8wLjXTqbDK+Hh46qUggHYeN9vBNDPmvYwZtIg9qhe1YTiQcHuxvnBAI9HWDA5OJYmU3Nvp7K3QQDZZ+nsd3DLBqPzVEdbesHVhup08XkWxi1Ou/UZbRK2muhdpFL0EQ0K0WQVRZTAmEVf5WNmHyTB75T0xQ/lOwZfL2lKyT8WbfsLfJG8a1fv1YouHtHri4G6z8OZzVYq6E0fwbNWeNFg58ZkDWyXgBoyM5gLP3D8KV5T8RIyTygJhvDlKKC3MPwswr3UOI87B63O914r7QXkB76F/i50uLhhpBB8wVomXJs05HXO7RvI6Zg5d02baA9sO5HcKy1K8x0vx5eqQmKgvqM+DjAgyPbOGkcTj9La1L/dLrHdpoj/8Z50QyFvMMUGWyKHRFGPrfWYeZcaVz1Hx3X0AX6zt5gOiVEVawcxnL2hye1foe0Qyaes/5MYp+cCIzpDIafYkC2J/htcSrXuIazERzZIIx4jF9cc+X7Mr2j0IhzIXwWuH15v88UF2oIe0EtohtnYAqet4NAqBSQ2UWLC25yRYOmVpfGVx4=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kU3xxl1IjV1QuXLjnazzNv43CI65+s4sXW44kf6yJ9wjIhM2eY8xXGOGmaGg61wxOw8ICUBihkfDMXQicMbZq9RarvepWZmGf9haqLZWvHGFdE2JG5dV4fsf1TQwDTdoP74MsReX5M/+tmt1dGLCiv4UwbD2mWLArViBwzdbb1HtZ/pcM6AomtXwqoZBRlVOELGxmJy044v9H+4ayiGIwbtRRTSqiWV4IQ9YiLN61ENw1d+7FL08Q3q2Zcj7CVAWL1G5ssiaFpnmuVufhRVmquuWBsKpPVAAqePN3b73Vh7lYwFZC2asbHd2rEfFJmwTlmcfJAT+gBQq1OT55TClqzvEEy4RZLDKHImMdxu2BcDT8ZR/j1S8waS3WMcrxghtstr5NQJTRJHw3o6jLgZfRIyRy3ZPqvWrTrO6c31q8ApCunhYVVgHPrv2F77aNDkc
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:04:27.6106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9b6ce5-3b9f-4ed8-e400-08deb0594a30
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 19:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236909

This complements the USERADD_PARAM and GROUPADD_PARAM variables.

[YOCTO#16277]

Co-authored-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index 67148fc1ac..30accaeaa9 100644
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
E PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE =
SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE=
 SKIP_FILEDEPS PRIVATE_LIBS PACKAGE_ADD_METADATA"
+PACKAGEVARS =3D "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS =
RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm pkg_postinst_o=
ntarget INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKG=
E PKGV PKGR USERADD_PARAM GROUPADD_PARAM USERMOD_PARAM CONFFILES SYSTEMD_SE=
RVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTE=
MD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS PACKAGE_ADD_METADATA"
=20
 def gen_packagevar(d, pkgvars=3D"PACKAGEVARS"):
     ret =3D []

