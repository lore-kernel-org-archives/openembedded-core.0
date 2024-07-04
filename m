Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3945BC3065C
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:15:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.136])
 by mx.groups.io with SMTP id smtpd.web10.5132.1720077337086300969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=ABsbsFrG;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.136, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCHuGomqdVPPVXrn951BJ/Pb2HReW6AaMyHsuZys9ii1ij6NVLuDFokrShHB2bkhqaxv9S8fzbi2y3BYBIqlzEaIJQ6X13gX9622X5i2VLgtbIm3hcdvBb9b6FaA67jlpSpIikJg2N0T9Y2Rc0YOGQT9YPvI9Sc4+zZtq22U0M+6+IQMYUwDNWtLzhSgeRIfgqWpxGW8Y4cAhwAB1nkNgw8gUVyC1/zG4HaVQYMCRfli5hf6Zr4HdxAPOHcgalQuQ58x955v6rjpd8jOy6boZtBH7wChw82zUZFAv2S3EHXRnC5Q23gta14aO6ULddnFhE+WnoOVROB+SC0E15nvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylPTsU34GkDLnJtOHzsGNkRapCcWCgRdBvVz3EjdVJ8=;
 b=bKdhoS2tzrwr5pDcNZBE/APSf3zQ7gXBxOcKiGmBJt+4J2UjKH7B5TVJrkzT94G06WdCBM57A9k0y5lob9Rjnm4MrmOQJp8Uy2DpCgO+OQAUESC6OJml+yIZxM42gEjzv0dAVi9FcRqzbc39XpoSciptGE7IlFR/+U33f/Dl3ccQlkZdUJWPns4UuuOl8EjNZIfmqYVN3jjHJW/2aZA5Ds0fmnqOOwbeM+fAJJV4hnZnvRU+2EGt/WKZHvaK3Rs5UEm1nZwPmHbqup/hhCmQ/RB3of0LKFZPS4aIwAkcQSIp033FT+MaiIwJ3MTMSd0xVg0IWbJjRR3lk3Cy0b+NBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylPTsU34GkDLnJtOHzsGNkRapCcWCgRdBvVz3EjdVJ8=;
 b=ABsbsFrGDsT7GAsZ563dad8+VmUP5Qv2ZDZhf2D+2DZSmzapx3nslIwrixhRNp6I39eMrIJtNUZZXSpmcwZmMerVjw1Nyy6u+FXBRo7waeQRUn81LRzrhz1sDd7uCJ3GiF0mPpflScm+R+IlGrYL+0HPSw81EnUpyAjFdF/nzO8jgIpOEKojMIKKc9YtPvFBElZ+jqPfC8Ib2f8s9Wn00iJKqfAyPiW649sGbbWya1M6nrIK9p0crNHgbVpUk03+zBlCqdK84Bq0B0gJCzdJCv6+VcZ1o7ICDrIE/q6Zj4m5lLDSfm4xg14ZYGN1yO/as78ZttaiC53WW3VebaHCSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6971.eurprd06.prod.outlook.com (2603:10a6:102:90::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 07:15:34 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 07:15:34 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/2] systemd: Mitigate /var/tmp type mismatch issue
Date: Thu,  4 Jul 2024 07:15:18 +0000
Message-ID: <20240704071519.566147-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00002E2F.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::7) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6971:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ae853f-5b08-4158-fed6-08dc9bf91890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1azm8klCO1jTre62nYPcXmGetstvYJnbOabiHYj0YEAr7EDpW8Ds71923oFW?=
 =?us-ascii?Q?oF27w8C057zq5ps6SEbcWq+bCbHdTBrXUyRMQAknZpLWthisRegZszuSXHs3?=
 =?us-ascii?Q?cVu1LiRxpHD4smoiKN0gKocSNqXZ0o5WOrfSGYLaIIyJe0Z0oDKo+WId7DUn?=
 =?us-ascii?Q?RD0jSqIxgqebNdkF/SZ5IC64LFNFk1oMVgByhO4pCIIh68zWnka0CxSlmEth?=
 =?us-ascii?Q?5xtXHRmL5O6NStyGI/mUVeY21LS7xZjxeUbEUZZhnRy732kiWhuLgU5wCsz/?=
 =?us-ascii?Q?G3DZYAlh6nWKWicGUkoXxIvEOImy1EltYTD4/fu33fPsjG3we73/Q/vKuC6p?=
 =?us-ascii?Q?mZRVnALH72+DYUpFMRKv6qDBiYrkm0VCAoayGZ04w0hc2kObtKeFOpAt0YZw?=
 =?us-ascii?Q?UZjfDBzQHTBhtKjq9tcVUWoY4XEzZllUM79OIalcaGIxo3jpgp1wCwpAYh7v?=
 =?us-ascii?Q?qo261BEEnpduv2E+4OO8tBBDgtcKj5t6wQTJvkTu2CorbWiNZiPm+8TWsJ+w?=
 =?us-ascii?Q?B8fZKg/ePm6utCoZGdV0nmEakY2+NATOf7vn1iir4m8gLQSLvXYG3535erC2?=
 =?us-ascii?Q?LqZ2wUhN15vPDZZKdxfzRPsbir0YxH+Jai+ZruLzVETmRjQC54SqOgc9tRQ0?=
 =?us-ascii?Q?YFtAGmYwZvUzqxOpmg7FYLJ87ddvYTq3BWNX9Nnq4ilN68nwrn5eQTfMvrWD?=
 =?us-ascii?Q?1pOInbynMLmmODVyCsSnITnjtobR9e+BfAph4HkHMW+GIxGkz5cd57H5jy15?=
 =?us-ascii?Q?8QtW3erBA0Yq+zx+lp6fJ/opC+qfhJRHBL/A+oX+vfAgb2HzvXIzjWQuVGmx?=
 =?us-ascii?Q?NddcTfYvzf5t3+Ag6RbfrNC+0Ba9BtDPS3AHE8sFr2Vd65TdTUGpKG5EwRvy?=
 =?us-ascii?Q?KTTeR5Qs5/me7/sEBL6n9RfP87ukBvIG07W5x/SD1FvXYf9afOaPqXRKkX2m?=
 =?us-ascii?Q?EvcLKVfi4++CNZwkqJk3ZZfqA/A1nj+AQxvprSarI00VdI64j6do8du+R9sJ?=
 =?us-ascii?Q?JQeivwGt5GA4kyZHOiTQ4qS6AxOBN9Q2ReThfhWIOmVeAIfZv8g7N3pC//GA?=
 =?us-ascii?Q?yn0V/E0KVoIT2bLhdkqTa/Da3xvjtugr9W2oaPS0420O+Twen4aI3pRli+BR?=
 =?us-ascii?Q?kpn/YJO16Cru5KfDD3gJbb+rzZVEPESmVV6HotO6a84O2C7iHuK7VCwpufPa?=
 =?us-ascii?Q?jyuuBAqDGabVMyqTAzpu8K7XQAsYA45XGgemyBJqfqLS7Bo1yQp0xQ33++61?=
 =?us-ascii?Q?0rtpSDV+tJJsGCZtsUPe1hx0rC3/3VPULGB6zRGbED7IWfsI/iML23zpP71X?=
 =?us-ascii?Q?WrcOiyz5e58bsAh7wCLZ+upiRx4HZPCHUg4djuety52qmeIPlXe5fhkIGccM?=
 =?us-ascii?Q?ZokYjBBSqIg8HBSsxRx6kxqmXYZxBTTPStTPDmIh533fCxiYMA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3xtn2suzGSZp7ux55B6uBpB/amOL59qQXSfGcgbTi0Ga63k7Ju/tY7L2Gc5w?=
 =?us-ascii?Q?rJ/VH1w4JElEuOUBHES7fs1OkoQ3yEAZIaOGSSCk549JLdx8fm4qmB+Pvz8y?=
 =?us-ascii?Q?WmrKulw29EvPulhpxR0t+Z9jz8xNAqwmKka0+qIY4d/wNL0GrdwWnpeOInSH?=
 =?us-ascii?Q?3uMltmcl18qAS2tPAShJ04rUtSPmdElHpG7v7L+hBnDEJzXEAymdgX0M+iug?=
 =?us-ascii?Q?3mwec/zFwYqgWXeMt+xkLOOyPbxwnTJCVDR/WqNb4PsC9KLt6vUTbaaA/OAM?=
 =?us-ascii?Q?IsZ/FLaD4XWbDxgwgRN1buZrPy5fw+09hBWah3iTJetaz4/KRXaJZXfLPtyP?=
 =?us-ascii?Q?xg9rSekWTph6X55zX8M2KkK2hwIGt66KnjAntvgWN2PP2pqf3tR4y6Ct8sMa?=
 =?us-ascii?Q?K7y7X0gZNZrBmFX/ZeF0Uo1bztnp/cLrN6DD0kxhZIpJ3cWtECutY+XK20iS?=
 =?us-ascii?Q?rYamhngbbEVmr4ElMrKS6jRauPSTlijo91Qp4B/y8EIuD4Wc1d+9RNeWJRn1?=
 =?us-ascii?Q?NZAK244TuEKOtS2D2i1fBhSzJvcQrHAj63dklMDoH9j/Qj82jQdzQ3KAHIaK?=
 =?us-ascii?Q?DpoQIaRQ5P4qTiVX2W4UeYhtVhA2KwcDs/ZuAKsakf0dZgoyIjAAsKO0RJJf?=
 =?us-ascii?Q?XlYXC69buQoY5LrrxCChVleOpIqIiIzMHt++p57NIpCPS+0A3mVy3NRAR9Xy?=
 =?us-ascii?Q?X4q58mzkkjrGVf2G/sdTCIPYkLn/KXl+7JYr4EJXAMZXEDLH2qlLMkZz99rv?=
 =?us-ascii?Q?+j07FDZ6KRdOY/LHnzh6g/KXQz0T5pKoueU1I1u4/zVuGFLMfd+ijgKE1wnm?=
 =?us-ascii?Q?rC1twRkCMkGq66Q/E1XkeX2gKEa0VGilL4sv/y7j/LzWitEhoBVLm5SigTE5?=
 =?us-ascii?Q?4wH4PyKdo02sQtHM/lwDGLeY1Um1uCAbcpvj2riQfBvhkKrQzZBMTwYbptWE?=
 =?us-ascii?Q?L1kQv3xKoaVs9CADrMGZY0Y3bzduQC9XEUA4yPyFXlbEgt1L+VlBd/NsVlbb?=
 =?us-ascii?Q?RavhQageTLPOyGI/LBgZF/jZiYRbSt2zaMZD55K3c90iEeP33sQl9cL09fnP?=
 =?us-ascii?Q?KkrlfG2xTtaxMd54cmZKGWG917ujEZA2dmc6QO3jXunvAI8Pgcl4tIa5TNfp?=
 =?us-ascii?Q?iUvMhVbU5SEa4gHkBV4oT3dQENMzJH/RaS9+w9833xryIDLSnsSgjZBEKSmB?=
 =?us-ascii?Q?9qAc3le3U6F6veiXIJxbN4IMTR1ykkNF9k22giuaQI8P/bdIVCX6KaeHvkmL?=
 =?us-ascii?Q?+7s2BLJ70eagH2nAa5aZvjTPbaR4HJUEm9zN79KEh6dZb0yZHmGTdmzL6/O2?=
 =?us-ascii?Q?IEsZK3TijGLnZqw4DckmSxdNZfC566MXc1lm+nkOg0SOTaKjpGYoZdmdMQgk?=
 =?us-ascii?Q?yML94VloY9Zov/2llJUCDneeGhcg2yvC+zk6r9LjRJhPWuxFcZZJ2djksvHv?=
 =?us-ascii?Q?OjlIWCftciJm7Ouf3ck6EFbIpMqatvKPxTzQFUuIlPn3sfLb7LvgZHiZ3jM0?=
 =?us-ascii?Q?+pEjZc0l94QAwqomYUHJqGUa6Bteu23GS/E25BLtI9Dj0y2VvdDD4Tm5EGIm?=
 =?us-ascii?Q?7bTrQIL8DMZ2bVh3LH2NHGewELhhjkCqUN4TohNXdovWq/fchtJd2HcohDaT?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ae853f-5b08-4158-fed6-08dc9bf91890
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 07:15:34.2468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8uV//wN9NyvxM54W1ljcAuHgqp07gsb34wSOgrkpxkMFrIxUz43VLiuRZ1/4VWSBrBORyo1si5cBeA8QT80PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6971
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201520

From: Niko Mauno <niko.mauno@vaisala.com>

The base-files recipe provides /var/tmp -> /var/volatile/tmp symlink
which is in conflict with systemd upstream tmpfiles.d/tmp.conf which
defines it as a directory (or subvolume on btrfs).

This generates following error in journal:

  Jul 03 15:37:21 qemux86-64 systemd-tmpfiles[158]: "/var/tmp" already exis=
ts and is not a directory.

Mitigate the issue by defining /var/tmp as symlink corresponding to
the one created by base-files.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/systemd/systemd/00-create-volatile.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/me=
ta/recipes-core/systemd/systemd/00-create-volatile.conf
index c4277221a2..043b2ef1d8 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -6,3 +6,4 @@
 d		/run/lock		1777	-	-	-
 d		/var/volatile/log		-	-	-	-
 d		/var/volatile/tmp		1777	-	-
+L		/var/tmp		-	-	-	-	/var/volatile/tmp
--=20
2.39.2


