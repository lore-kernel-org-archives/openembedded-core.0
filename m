Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70E4D462B7
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:46:01 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.51])
 by mx.groups.io with SMTP id smtpd.web10.13420.1731509152246411626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 06:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=k8/AWHrf;
 spf=pass (domain: axis.com, ip: 40.107.104.51, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcJmL7rAQJ2FNQ9HQrB3F3qIias40DXDnQXEqlptgqBBd7AsVCHKV+FlBbdyMr3TKBbAZD5Do2YVSKAHdvxVbs+CaMkQ0av5rqWdqjIkDViFDQ+JtBHbFbtcKUfblnUoc0U8m+0wwxYf/MrfE6Z4GRA79VXl4Q8KeiIOZQFwKlztuJVGIFHxBCDbg+Vr/RRxbDh4QkujwW+M3OzPX/iSIJ40eyPy9fOh16w9gKt8HunmtU4RUW6VhxWgmOUVC+TjOGxQ1pF9/Z+uUBKUsJwxiKboBFgyhYeaq641DENMwZwNmMIt5ZzkOnq9umZVPuxOa7fRRuzXP2GpMhBOmMl4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNOnu5JeYXWlF40057iQ0nY5jdRsP4/pTltF7Wj2Luc=;
 b=oYA0PdmrcArm+omykStBJcg0EqTJ+E0VFktnIJgVwn8W4U4MqsMSVe7ONGhhOtuYSONI3WHycD/KTeNA+0SZ/tcW7JM+2RaH0/qQay07E/18sCVD7VVROtgLyLZtyco33DxuUGV/K8CbwxFqc4eFdt7mb8xZx9ao82PKR3nTsQhsBt9kqfCyzDy0GSY8ZjAMFVu7HAANxpnf0X5GqXEEI7XYxk1iJe9Mms3nL60PyjX1lK08i3bpcyiQt4e9l37mOpF/egtKfskgQrrAU5AeEamQcrmZQL3P3xccksTP4YhahmA14u+8ayYOnNkV9tiIxAxPsIc+XkpGGZaPT/Yj8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNOnu5JeYXWlF40057iQ0nY5jdRsP4/pTltF7Wj2Luc=;
 b=k8/AWHrfnjpW6sGE+mU9YpupGdNVnOpIbS+5nk+u9unqW8+xvjUyjzcqSENaCC2PM1eMxN4WrUBi+IxdvlJqF3sw9uYCrW2GNgVnM/LW3gegQExG/cMIRBwcR72693Id/puXHCN/rhLikkdiuLnVG1hoZNmiEuLh2iezHPKFo04=
Received: from DUZPR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::9) by PR3PR02MB6075.eurprd02.prod.outlook.com
 (2603:10a6:102:6d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 14:45:49 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:468:cafe::9d) by DUZPR01CA0042.outlook.office365.com
 (2603:10a6:10:468::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Wed, 13 Nov 2024 14:45:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 14:45:48 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:45:47 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 15:45:47 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id D6C958B4
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:45:47 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 5/6] strace: Fix the ptest path to test-driver
Date: Wed, 13 Nov 2024 15:45:46 +0100
Message-ID: <20241113144547.3121036-6-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241113144547.3121036-1-olani@axis.com>
References: <20241113144547.3121036-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|PR3PR02MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc1e4ef-fb6e-4de9-6a6d-08dd03f1dd50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b0d3tVQOd+Eq+5Eu2kg9ci1g07SBGdUhD2Q+Yn1IgXBxgcUB+5xkVBA/cBos?=
 =?us-ascii?Q?9a/1ruBAAPOyv6nOZUr0R2o/Uux5WGxfPn90DAMW6U88umVBC5BC1G70muUI?=
 =?us-ascii?Q?xgfx9betHzbCHi/AHPk+xS2iyc95rp30dHgm1DvBmqDqn/LW0IVW3jeQ+YxP?=
 =?us-ascii?Q?K1iptKcNJQMb5BluCKb6BBLMCAFinzkrmYrEjrlF/VTkVo3TTVHuciqmEpOJ?=
 =?us-ascii?Q?myZyDsQRUgxPCWh0wdkIYOQuhnY3BDlrYYuECoQXITj+MbGR9Lj25PqAA2wX?=
 =?us-ascii?Q?izw2c6e+gfm4QGMAMk00gXfJnWTfpmzty3m1EdkpLCui0GjjJae2bEMA74yg?=
 =?us-ascii?Q?mohvT/cmVEIhg8Im5YXgji6lCtAmxhrYmkT1e/Oaia7G2ccKxBC6lwXttPYp?=
 =?us-ascii?Q?VelkiZcQXOdn/C4WImiaVbkAOHl8n6yRokjdRxn1j7Jz78I1S28gHEZmxKGG?=
 =?us-ascii?Q?4ljC9FboBKa78ExS5vs3D6KAeUvY9M7ZSEaRETXr+os5fB6ItU9dubx1wNli?=
 =?us-ascii?Q?mIqqjKL1G8Qj7prGKLmftkonkMw1DM2iNJhglP9ToHsWgiHgHdXGAm22Wb2P?=
 =?us-ascii?Q?erzplTerA6Kd1V6NSHZGN0wigxig/SUlD+mn/U8vpiPoAITBv99aaY5iPMbs?=
 =?us-ascii?Q?yO8I6csOIS4lRI+fkH0pCVmGezx+gMa9xvNG5oALo68ycAoRVED1a4ID5CFb?=
 =?us-ascii?Q?XVzVrRgt+Wam6WWtfdUQ+CxgzVPpVt3e4Imo12YhzEEitxAxWLGjvV1Dd9Xz?=
 =?us-ascii?Q?FXkAqQUVrrCTshPCAZfmG7df0auEZ9eZpy7zwVx1HNr+VsonCaz7btWmUMsH?=
 =?us-ascii?Q?qanYXMxUiYreHIV8A8xiqoQl/npVzsvlOlkaCuYnEnVarAE4NrfNWtZaPpxM?=
 =?us-ascii?Q?SwHtH8kyvKQWJUEB3Vqsijzcb1cGlW84T7ZsX8YAzsWjbOGAfpyV7Mhqc+AZ?=
 =?us-ascii?Q?Mb/0SIlhrJmyKSBE4gpbLCbGqSsFIyqwLY9IjiMlTyISEB0S1905gH0xyXZR?=
 =?us-ascii?Q?ZO1fhcJ4MFhxVYGNXyRFIEqGQ/IMODgBoaJxAg6BOIphmKLiIW8hAWt9C2R5?=
 =?us-ascii?Q?tW2z+ydg0Z34ii14Da2K/p05t3FMXAZrx3NoYzMKvtiBLdmIcGver9Syn6XT?=
 =?us-ascii?Q?V46jZ0yY7l3O18L8hSMSxQVXR2DkNKb1bGpUNFAsyZQ62EGqoT25Vi2jNviC?=
 =?us-ascii?Q?EGQHKcnKtBMViBIEYjIsiFCBiF6L88R1iWVLxwk3BLtq8yNWhuc4dGVQH8rk?=
 =?us-ascii?Q?cJUTjID9nsF4deY385kWyLg7v98mSC/Cgr9O9M4Mx3CGqmIFMCrntO50su0E?=
 =?us-ascii?Q?qHP5iYxOTOPMPbk7GW/h8PKN8bd8v4Vhe2T/kipCekfNlIcV9novPnhAbrUy?=
 =?us-ascii?Q?D8o5wAZQH28fyuOoO5gIBC86Gx0ckeAyAstDe+fFVii+VFoAOA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:45:48.9952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc1e4ef-fb6e-4de9-6a6d-08dd03f1dd50
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 14:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207105

From: Ola x Nilsson <olani@axis.com>

Add a sed substitution for ${PTEST_PATH}/tests/Makefile that
transforms
 TEST_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
to
 TEST_LOG_DRIVER =3D $(SHELL) $(top_builddir)/build-aux/test-driver
which is where the test-driver script can be found when installed.

There used to be an oe-core automake patch to do this, but it
broke non-ptest use of automake.

Relates to [YOCTO #15635]

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/recipes-devtools/strace/strace_6.11.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace_6.11.bb b/meta/recipes-dev=
tools/strace/strace_6.11.bb
index 4ab78e7a9b9..1bc8aa99e71 100644
--- a/meta/recipes-devtools/strace/strace_6.11.bb
+++ b/meta/recipes-devtools/strace/strace_6.11.bb
@@ -45,7 +45,9 @@ do_install_ptest() {
 	mkdir -p ${D}${PTEST_PATH}/src
 	install -m 755 ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
 	install -m 644 ${B}/src/config.h ${D}${PTEST_PATH}/src/
-        sed -i -e '/^src/s/strace.*[0-9]/ptest/' ${D}/${PTEST_PATH}/${TEST=
DIR}/Makefile
+	sed -e '/^src/s/strace.*[0-9]/ptest/' \
+	    -e "/^TEST_LOG_DRIVER =3D/s|(top_srcdir)|(top_builddir)|" \
+	    -i ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
=20
 RDEPENDS:${PN}-ptest +=3D "make coreutils grep gawk sed locale-base-en-us"

