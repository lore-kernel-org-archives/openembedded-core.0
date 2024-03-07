Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB3CC54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 13:43:50 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web11.23427.1709819023821600462
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 05:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@nxp.com header.s=selector2 header.b=ATFfkv8u;
 spf=pass (domain: nxp.com, ip: 40.107.20.79, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuO36iMK6kM8VteWypQqqjkZfSm/NHzzYTfsy11zKLFAY/taJ9wkv1PMCNTUt8NVCOz+cVCXjWI/1rFS5AbPK1YcMWvSXK5K/YgggRZ+dQ426VawFvpAQ27YfnZMzAQkpvFIfj0a3jHIDF6klW080jilqo6rlo/mSdnULYOk0382LmnK61Xx7C/j2i23o7ZrViFj7qq8JBwwliUHL5gJFVT5FB8PquISdyVH15qu6CegaVXHxEZK1h+zhYj8xk6TWgJhXqfWKPnOOmzS+Ns0SH5HKkbAGffxKfcqBf+FeHWAf79ZXMUzBmYZxPyyx8/bOozNuzClNWPWFWfIpDb4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/Zl0FRhxKAMbojGks3T/RyEMndW1p5GybipQ4XDY/I=;
 b=LecvFRWypdAqLo2jeoqx+Y1fJPHT8+Pzy0Axz/QJOhzHKQx57W/8FH+45ZNEag+ZXC1hsgrKatlHz3SEqygSshhg286BFP6uJRHCNJPyksbKsTRQ9jgkOgEUt+9ZDbCgoRBKh4YVQ3GEWm55YXwLcqRJTJA2ZDy2ZV1Db+TPXeWFjEwxKi5/yWM0HgNGpToZrgjmj3TguMXScO/GX3toPxt5C8SX73YRhx4r1fJqcwzPqUKpaXIX34wylLi3s77y/qz5DwP8U1jlU5UNvvSF18KxFVzpjbKOQr16tedJTEznSmxgr5q4ce/I4+4TnX8wJq1E/AHnyvDAP6V3f4zMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/Zl0FRhxKAMbojGks3T/RyEMndW1p5GybipQ4XDY/I=;
 b=ATFfkv8uvcwe6MVDbZ/x01kYb5RnI3wG88MoS3nkfu93PO/19mGysPteMxrWZ2tzCdoGJZAwj4CCJNcxAn6lbK3GwyKtZK7Pd1Cgui9B1lLPvpCEZ0zsQIV0IJgzeQardPK58Ly2QWt3OjfWuIYa1HXuUq6IQ/Z3vLrXbNe7OHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PA4PR04MB7966.eurprd04.prod.outlook.com (2603:10a6:102:c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 13:43:41 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52%4]) with mapi id 15.20.7339.035; Thu, 7 Mar 2024
 13:43:40 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@nxp.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] bmaptool: Add bmap-tools runtime alias for compatibility
Date: Thu,  7 Mar 2024 07:43:16 -0600
Message-ID: <20240307134316.3047342-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0233.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::28) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PA4PR04MB7966:EE_
X-MS-Office365-Filtering-Correlation-Id: c0553eb0-a15f-4f6b-87c2-08dc3eac9929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OPhKETe0pVxXFy1OuuWdZ7NcjKFxYERTmZiO6QLOZWePmwHeoALNWyhKQ96wNx/eJOC4eq2IL0I9iP3dKBrAYMeGh6NL4OlDzoujQgtvsREm25luqc8chb8+JA1BZ1Irfc2QxGVu2pvh4H/9FkOQC2PW9aelwhZwQ2NdGj/SafcqCf8hOhuXwh4PIa/7fKL+ygkNr592x4RMSP6Jx9IrFLitkdrBu8F2idVTL+vKLvUkhusSCFFRYYQyQjBt+1BCuH0rEMwXuaoXxu/OdAI1cNS3bgDYsH+e+SiQULZIso9gYX2f2K7BwrSTQfXUydrCv7X9PCRiaOA0FhzyJJxe+O9qPl5zV9f9QIyFBBLzTog5whfrLf7s8dXwjoCya0tziQm//I4aSzSRZlrSZAn29iiQTabPd1/BlIlo0/KYQabIclMHkke1qEfxggI1WdmxndZDsGYAg7123n196C9nv3kgrqnhj438x7QJgbmxl4tGQpoRUDspMKCyHdIic8PutsywSZ4xUEEN94V48iPd4o0kAh/eWs3IqXf4Df4ZQtvjkekA0VnQMX0b535/c+zvQY5WB/7Ldvg17A/yGqaLPrLnTFnB9gSLbX5QUHVD+pmSb/De+wR/J10phlGuz1eUp5TF2O8eggk+2l1tFjG+Q8N0I15I40WtWMJrjL7g3PDJlEJo2WKmXXyftS1h7pb5+qjFDW0tp6+onp4PkE+lR1Ve6bfluLd9KZngBdeIqNA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TnKGf6QmBQc8twwxUz/z+cZbgHUR+Kvs3PmkUtUgsQPYMBA0Q/8r+2YbA7j4?=
 =?us-ascii?Q?qbbDucz5wa0DufszhrKtm7T7LsIAPVI3T/WtXWQfQ2i5/pq5GmqrlIQz327o?=
 =?us-ascii?Q?4+LVG2YiBDanhB9BDVn6U2XmggPEbkF88CcZasP7lmA9ftRh2uvfWgaD01jl?=
 =?us-ascii?Q?rTs6gwJX3sOuHVQZFdqoex7DEJKqScYzu0lqtlq9EuKEavyzz52+husYHVuz?=
 =?us-ascii?Q?XjqOWLx3kQRFAIsaywj8KrEs/FMRFAmI2s98OaofkXlWkuqnWHhsiKBgul12?=
 =?us-ascii?Q?hWugm8gxi7ZZJy/6Y+EOgusdcWuyrf3KEZH0RAQbYjgnzM6IJhySBTUZ+gmq?=
 =?us-ascii?Q?VZiuqgN7zWQd8i6Ohl6UlTMj0923UmbqLDPAMedgJ7OwYEuQIGR3Iygmoh4E?=
 =?us-ascii?Q?swUkKox80uzvBvS8wVeu4WOf7B2fNGbh5BcEtrFeKLQAB9tuwsJ4EjxBLQP9?=
 =?us-ascii?Q?8Ocsqfe8qkm0VOcs6EwnuZPqWW2ZKDPIgxNZWbIGqUeblclVv6TFP+4jPX0u?=
 =?us-ascii?Q?4kEn5snHRznHyb9Uj8D3gvhutp4mmnXcxO+4Ok9fJu6exhNqyrjMHzAxUXaY?=
 =?us-ascii?Q?Wa6yoRSop9D4kaWzBVW8rE2XtrA1Jme9GTcymGB1WAlUDN59Bt2JpxQh+7LR?=
 =?us-ascii?Q?u8Z/YRTucc3cuNFBicqVNeS7dObs6sF+hPmlUUK5gUfvSekN8h0tBPR6sIRi?=
 =?us-ascii?Q?LdgKwws2nAVj4f4Um7zKhhGlOEbLp6qNi1jwIs589hE6c1XH1O+7112FAQY6?=
 =?us-ascii?Q?Kcqu3ORF2a/uN1xSTywti0rmh/foNwOoiHXRAyMjIzrCPTSZWoZSjiwjc347?=
 =?us-ascii?Q?sTBD1I0p9ZnQiPPj0NnUPRv7b3skIeimaHxhAsiAwgWX9ubOx7qa5N+AeT7Y?=
 =?us-ascii?Q?Ji2+ugO42ajhILHbWhg73tRWiizyVJdRGhMN4VWoLybIzKqMgWrq02+vPH6N?=
 =?us-ascii?Q?KdUv43yTQtjy7K+BEo4rMIkUq5JgC9DzyEX7k868/wYLqvanm8sENUWPvUjP?=
 =?us-ascii?Q?LmlGHc+Shl0C8LvAqwvlLJj7MJ+0T6XPLjpAhwWuEcbH8x/euRwuE0Gpv2MP?=
 =?us-ascii?Q?Y63e+S9th3a0SFL264w38rj28y4um32XKAlwI3gG7E/7R4Gm/+ArhhbJlwHU?=
 =?us-ascii?Q?HOjPtVULSuJqaMcivOXP+ZI2lmaIFYhgjGYXazaRbx2DzmGuZsUqtxCeCzIL?=
 =?us-ascii?Q?bHPlITVucdvCVljqqPYJF+c++asrIzhBaWHt4CvAVaGOJhDiY7emhWvXpJcZ?=
 =?us-ascii?Q?SBVMAkvzzJo/NjhxDw+5uAwLUfUsioKu/AHh1QbI/3vOU4ccO2Vz79YiE14n?=
 =?us-ascii?Q?s3fthpFCeHWmYLnRaZUR/PNhRpbfiL7V24JSP9c3tSNA5/CQaJkuEWDP5kc2?=
 =?us-ascii?Q?0EcC4miW1jZw0LbLaTa902pd7q8uG3mXQNl0cU9/xihddg2bTrLXntbdIVOE?=
 =?us-ascii?Q?5nP+XB3np6619WBKNu/49j71Ejus20yZbEnEGXCFUAiWK0ge0J4BfqzRm+MH?=
 =?us-ascii?Q?tFrSUYjoar/BiIkAudG7Ck3hvEjlvEldvEvQUCGvrJbyM88T9T5eOlLVeMIa?=
 =?us-ascii?Q?N4HmjD9NrDDTczuiyOqV8dhyVM138Vg694MKUxhI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0553eb0-a15f-4f6b-87c2-08dc3eac9929
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 13:43:40.7780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glkW+MfWHI0zK/MGQ8LcsgJW56C9MMrNM/kg9mZp0AefVnAaZ4QWj2LajKxYccBrL9m3/QPw0Z7qvzsrsmmZUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 13:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196791

The rename of bmap-tools to bmaptool creates an incompatibility that
will break package feeds. Restore compatibility by adding bmap-tools as
a runtime alias.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-support/bmaptool/bmaptool_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes-s=
upport/bmaptool/bmaptool_git.bb
index 87328af8c6..f0f3b85902 100644
--- a/meta/recipes-support/bmaptool/bmaptool_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
@@ -28,4 +28,9 @@ RDEPENDS:${PN} =3D "python3-core python3-compression pyth=
on3-misc python3-mmap pyt
=20
 inherit setuptools3
=20
+# For compatibility with layers before scarthgap
+RPROVIDES:${PN} =3D "bmap-tools"
+RREPLACES:${PN} =3D "bmap-tools"
+RCONFLICTS:${PN} =3D "bmap-tools"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


