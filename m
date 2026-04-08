Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C4E105D99C
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 03:21:30 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98301.1775618449863393439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 20:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=P4XFZ31a;
 spf=pass (domain: axis.com, ip: 52.101.66.40, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtzFn+MPtTcbSZleTSFBGiCcrLQqR2SdkHQTohRS9XnDI8hzc+EvkzlX5Vx6jBbVyojQvX1pnjTI4vJS7cm/uiJFzlvHINjCXcpsr/iXd7mM7vI1q/SM8IY907LfaFZc0CRdTmmwmuFgn/9Nm2kHg5oMZpdmdGUvfo03k9AlpQE8qsemd/8Ff/jDp2HpfjikY1QLl7L890Z6iT5nrJN0TWiV+L/of1KjBMTpeto8Xw+5YvzHd6NqnDtN4GkvgWdZ0P5Xg/r2/87WwbOwK0QTiz77RHyou3K2EmrdQONIWayrF9xaePz30YB3tgjNgakANXSbWPCVcfAmWOAb7Fv/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nh2KoknuOYzP58d4ZEhaxnwU5wikgjGPiRnISuUHQfA=;
 b=XeWaaDaN2UFNMVx36Ho76CLEhG3+97WLsrDuvZ7FK+UbwoBvak7uh18wQlHzuLGzGcEYs/a5mx0TcGj9iM4qJjZsVg5Inn+QsPXJedDClUqBWZC5V2oiuuFT+ofpNaENfgUih0wHxDGTnWXz6GU37d0wnlH9L1Yer4yvbbef+XJY3LbWTbUH/nAjPspkCMaOv6TAGLZEk5SljGMve/9vV9G06lVyrPEpxPlqY6Bn61HBSFY9xAsAJ0gQxqmuMoR00ZqF9RZPHjo/lBoeOy5Sst8WUDNnPzJd0+kEVlpmGjwdFxmxvI9CpzuLWipuJNn/K6fWXvD58i5ADNRpLKi7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nh2KoknuOYzP58d4ZEhaxnwU5wikgjGPiRnISuUHQfA=;
 b=P4XFZ31ajQfSBGT9vJhT92AjK9vHq2BdNRVN+3bgWlfN5OuqIzw+hGsOqiWxGRU7pbzJRXbhJBJPgDSnNGPBLXuYbZqSPFeSWZ+aD73WNh/2JotET2BrcerQdSJ4PYRQzdCmx3HugYdc3Zi481NjmoP9nFNh89Fh2hqgBTbfwKA=
Received: from DUZPR01CA0329.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::28) by AS8PR02MB9743.eurprd02.prod.outlook.com
 (2603:10a6:20b:61d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 03:20:44 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::30) by DUZPR01CA0329.outlook.office365.com
 (2603:10a6:10:4ba::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 03:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 03:20:43 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 05:20:43 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 05:20:43 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 76D581B42
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 69A151205FC; Wed,  8 Apr 2026 05:20:43 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 06/10] gstreamer1.0-plugins-good: upgrade 1.26.9 -> 1.28.0
Date: Wed, 8 Apr 2026 05:20:19 +0200
Message-ID: <20260408032023.1810147-6-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408032023.1810147-1-pkj@axis.com>
References: <20260408032023.1810147-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FC:EE_|AS8PR02MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 468f76bf-37c4-44a9-97d6-08de951dd1b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|13003099007|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	+XbD1ewHsruptLhONCwkL0KnCloUBSC239oTwNjJL2KMuh2kHtWYtcpsdjmvFNwIGA3KsygJFTHEZba0zDAtokFynoVgtPjRrJM6skK3UpvJsxfXzOCkx1rjjkcicWZHBHgBvA2jZSg81b6rDSiL+BrDq6jhqAv/5T/2h9I9VOYZTYmkgKU5niqM7cJaCCfuTpUml9IU1POgo4G25PaW0l/4CQR80MOKZkjP+PElybkaBpLwxN2cviKDg+etCsyE+q41VyYOOxUds8EEBhFdN5uk5FNEdAWsw8DybnN5Ap9IloZNp7zqgww0jI0pOs2ZPPArjKNLwfsD9u/iQi8qVQ5qEt3+NV7DXLjuICnPgwrzCc1CBa5M3GOpGUjn2nhAvBR7Ie99leOSxPDY6S12dt1elFjn46lYEJOJyAzrkkA4Setqug2J8j/9KRVpsqHlWFgJQocJyuRCDxlJPGcUt528SVy77luKX6BDFLpSm7mMll5EMZiWOyoR7xv2KgyqQ+R9stv03ozi/rM6sTv8CuA4hm5cMtodmVMta1742drAvRm4E+3TWU6mkucFundZasxxNQUACO3eScbjKoN2bwl4G4ylDlaj4JmZImRu+eorNqc2//WpiQMI0h4dU3umlwz1RhIjZGc/ILDeP27zGrU6bsx6hEpxXdjrtWg4g93fCfAm16RYQAYh57icA0nay7W0keOJ8WZ9Frznb66MN/smsa2bG62/4+StwsiwRCE=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(13003099007)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	26JtobKYBsyQ7Q38fBgMaRJovLsMWMK0ANCN1jrf0wNXh4+AkBr4T5oqoMiA++u9jLOJJeoIhPc+UAtjhAhrBl8zhvS89T/Y9ZjfOgK+H8n4ftKwShvZ4GT03+IxFX0SmOwM1ZidkHxSpKu4iHrEod9ha4u8K3Px3YsByqV+pigmNc10okB8NTPuNsyDyFwR+Eq11yOwIFLFAV1tbDXksPiomVK/GJWh93onf90MYsqceSGjXhC2fuyZboQhjA94t6O2+DVWvNVvkpDPb/9dYQ5Jku5fDmHNB0gcsZDl3v+000/ggz2+sTKqdM3StPsqczk4Q6Eo9nVOmRPqAWRCgNFtQrZYaYS5zogDLM/+FnG+i4FBircHDfYTigmyZyxsm0YaBgDzo5FpzIF0myDXggsnsyfZr07eJhCJwdnT48i5TnrSeWjOR+BfuRsDeV7h
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:20:43.7618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 468f76bf-37c4-44a9-97d6-08de951dd1b5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 03:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234799

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 ...ugins-good_1.26.9.bb =3D> gstreamer1.0-plugins-good_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.9=
.bb =3D> gstreamer1.0-plugins-good_1.28.0.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.=
26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.=
0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2=
6.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.=
0.bb
index e7ca26406d..116e328adf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER =3D "https://gitlab.freedesktop.org/gstreamer/gs=
t-plugins-good/-/issues
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-pl=
ugins-good-${PV}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "f38566fb53ae56b7019a039475311756a28eb978a781154d67=
813dcb551ff5fe"
+SRC_URI[sha256sum] =3D "d97700f346fdf9ef5461c035e23ed1ce916ca7a31d6ddad987=
f774774361db77"
=20
 S =3D "${UNPACKDIR}/gst-plugins-good-${PV}"
=20

