Return-Path: <quent_55@hotmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87CC4CDD578
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 13:07:43 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.100])
 by mx.groups.io with SMTP id smtpd.web11.19375.1726751261108949362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 06:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@hotmail.com header.s=selector1 header.b=BsMH+U+d;
 spf=pass (domain: hotmail.com, ip: 40.92.90.100, mailfrom: quent_55@hotmail.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mx4gx8sEFvDv0EStz2qRq3FW0WJ1iWdBD2kzJZmj/jXsLRVCCw3rILDWEKSKGGqQZKYrCe+TIX5+EGuJI/JQubu9vg3+oGgQR/m3KrzZP+Cs+8wx6SX1VeyXvgN7j2uxqbayvoMEma2lAMF9FeUuH1rrxYWfWh6tS+lA86avjDqJqoD6DqnMjKsB4SDhd0FhtKpvZEmfREnK8xHXDu1uzwhRnNbYYOQCVT/OPPmYL6Wuk4HhS4M9UT0omSYF2CfmiBGaXXXY1xZcOo46yvQiX422GuAT7v3X9QeUve8YwUhZHh2d6++YP4ay5tSKojPXLGt5Qv3rkrpmhMEvVgtW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+N3Y1lkps2shmb7xoJ0/N6ALjEwfFF+dhIJxwwc1D0=;
 b=CsxMCk+0NBtBzT+sdwQD+K2Ob0XcpOwIMgDEBmYl1uSxyUcQbv5ZqZZpNQuyeJEBc8HysKBd0p7+/jOkSfKvd2VFIzYmaLbfjDgeQBxx7dNe72BvraPq+M52F2xVaO+YgGsZlJsP7Hp/kMdlwmixU6XEIGqLM/skadQoJPJrqFssUT4kzxUrhPPvH2zH3cgi728FtbqEov29h5HA1+o+9yzvJl//77aEwIAP8SzHUHjlx5MnUuWaZki10Piobn7zQcGb2AmkKRDwILlYbk7XaXKgrbWowkPSCqP8n7CGR5T7L+Sn8TwCcMKzN5rUWhyxqnS6yREk0Cw5vBob206NYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+N3Y1lkps2shmb7xoJ0/N6ALjEwfFF+dhIJxwwc1D0=;
 b=BsMH+U+d5AlS4rQFU7Zj0I3MsC/RbBRMj3k3jGxVxXqPsAk+CfIx5qEhv5X05VxjNCT/dxzbfx4nEs3GbaorLf5Beo3VWe2Ww8t7tBW1yTMRHN1o6/+Xcd2rw2kImqm9Qv3Zwmm+2SMsMU5bNZoiVmkZsLcpoG2gRx/scIhQx+kCWEz8vzqr+cj3KgJhbee4IVM6+XpZpY+Izao4ocYbcVo9qZdiLRgdbAuCSjIVm+mLQfvlFu16I8WxThlbqM9JIfb/kUQZEmO5lA22FPZoy1ETUwyiLgoGBTNiktDHAwKIKH5NsfVMxUJH7axxea6aExDXEAOoYURCrHIYKAsvuw==
Received: from AS4P195MB1645.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:505::17)
 by DB5P195MB2379.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.18; Thu, 19 Sep
 2024 13:07:33 +0000
Received: from AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 ([fe80::1055:1602:12e4:49c0]) by AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 ([fe80::1055:1602:12e4:49c0%3]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 13:07:33 +0000
From: Katawann <quent_55@hotmail.com>
To: openembedded-core@lists.openembedded.org
CC: Katawann <quent_55@hotmail.com>
Subject: [PATCH 1/1] cve-check: add field "modified" to JSON report
Date: Thu, 19 Sep 2024 15:07:15 +0200
Message-ID: <AS4P195MB164512A19F27C4435F4ECA48EB632@AS4P195MB1645.EURP195.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919130715.33668-1-quent_55@hotmail.com>
References: <20240919130715.33668-1-quent_55@hotmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MRXP264CA0027.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::15) To AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:505::17)
X-Microsoft-Original-Message-ID: <20240919130715.33668-2-quent_55@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1645:EE_|DB5P195MB2379:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d149b4a-0fd9-43bf-e6f8-08dcd8ac0633
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|461199028|5072599009|19110799003|7092599003|15080799006|8060799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 
	JdwK3/IgLObiuOfYFm1MEamKo4MqcznNRIi77bPeX2XRWqpmeEsEyb0Cjp/45d+j17/sBsyKG0mg1D5Ks8qcQkRbf9Gh6UQhizWuoxW1G3MYeF8ZNE+9gXbQFju5PiC4MmlQ51xY6KyRKpgPzrOwaIP4EvJLEFvjqMDP0e70WBqESh6Wrg0OitqYO0S/foTdBme/rRBrmZAET0L2a04cXHRJ84w4zBMTkfzsMYG3MKyE+JsxvNQIxVhWfmuLgadd0PUBNb4xb1Va1PJx/oluA35+01Kokn6f5mKU+9wsVGo+6OI4bE5dBVmV3Ufaz8uTHsna42rmyMPuqoAhbvN+wa2VOBOlVdSgmXAWKLMflD93RlXi5sNyGXN8TbH57NMNZdq0uTi2/LS4LnYOYZtZiFoxx/o2r3RSJiDZQ3lUzI/ERh//hptucDaucceQZyVnhsh6rY5Dd8xMBrLT0lcxKC7SbYx9l4TMqvCzV4bk6C4dhxxoQ78QSVFjDjbPiGJVpyRC2+4VRDvIHZ8jZVZkoxMtmHd4yWEhmbmBZ3ZxZJPNeoOq2XRg9NqRh6+SJGsXao/DAv0fTknYa38DOqvnxIun2Y++5Zg30TsUbVMxa+c+uzgxnUjYw+WumXYVWfOtnrAXUHw7gj52KvH6UCpi3It3v7Y21uc54GXBkfD//IFWAiKF3HT2nTQP+3XyTSgUOX/02rv18S/5I1NaxTJbJDOoD9mtb5XDeb+7xh+TutTvCljEWzzngY0wmaaXUCYjNR/kH6rhKiHNRta1vxRHww==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CG9YTW1ARUjPmaAerQSdNA1qv+xt2JMCilHIXnuQ1K/FcFuLAl2oNgR9SDob?=
 =?us-ascii?Q?wGgFfnRRZdH4gsM20bPk5QATIWvEs3wodofvChwHQlrRNCZE6nILwgukV8DD?=
 =?us-ascii?Q?Lq6ir+GygBE26DrWnb+JHyM3tyGLtI/xayxXhn94Y06OFWrsqz5HUikXrc/W?=
 =?us-ascii?Q?PbcyE/8G7za/VDal+Ui+opTE58LNNJk6Bv1tTwRfxmcqb6CTXzYeYOFomSQd?=
 =?us-ascii?Q?T1EUDrC+vCKQMR8nEsajs1nuYGccjZVWjlKKF3OVPzJWf/cNz0gNRcDaUE+7?=
 =?us-ascii?Q?CkTujRg/qlZzIh4C9MYKnJAj7JfpHj6lgR2/nPlkrgrUlCyF0YDSn4VYZTHW?=
 =?us-ascii?Q?nL5DV5f2sXvB4dczjoXz6SPj7wcrKgIhtgOrnAcilmXCvRx9fXbwwqW80Sy9?=
 =?us-ascii?Q?igsYg0KZAL/avVOSI2mFYV2gfUzEpTZcbIFywLqlNp8IQ+hLXNUFozD6jr4h?=
 =?us-ascii?Q?CeNYa6JJzvieS+i3mctBgIx3bcUELEMki0DmnN1L0sWxB3jxu3nuXFKm/lZg?=
 =?us-ascii?Q?4KwN2O3oeMgtXPy49UPMkrNuhHrgtz5pwa9KfHVzGo0hLsRtyzlgF6LEWDFG?=
 =?us-ascii?Q?+mJtwmhMaXWH1sxUbfa1pYeyd6y5gwy0pz9MaF5+b+c5ZWhOITWIowf3POX9?=
 =?us-ascii?Q?D0OyUTbBOgPGR6ZsxIrS8rR74ItAaWFX2h+93EKPVSzJnUpBIZSXaCzUATzZ?=
 =?us-ascii?Q?LVATmhZYgMpeVmfd67OYXAGs2icVs1Vf7h1p0/UBzpqXgeUXKvKASAFgS94t?=
 =?us-ascii?Q?9rB3nWW2eSEkmzcSUusIjUqIE2L+uPgclQ7/f+z0bkmqV60epjVyYq6BJerv?=
 =?us-ascii?Q?3W6rcnPtH49dAX20nOJKBz2NYlA1qEIaJ+DrwrdHVsiB/JL8/MSORCsppec8?=
 =?us-ascii?Q?3yJok17OWsuH5E02je9DWJu8PGieopJLvAGirJ1013lwZ1SLvrctzaGU4JuM?=
 =?us-ascii?Q?VFUKPn+5iuq2cgCiF0ajvAwuIZpeF6CDld/eGk+baFtOOaDIvQ4cDmtZVx8k?=
 =?us-ascii?Q?Qa8dm/xmiO/fAppnRENcFZsvm0tZuebW7MiGPmwCNgoqyOlInypKThNh4/Fj?=
 =?us-ascii?Q?/gxXW2iDD/bpAtYSlX1ZdHFjQwpM13yd6Q62IZNB9bG5oiJBliZ5DHc4Pi3f?=
 =?us-ascii?Q?jA6hCu47/opUPo6J9B45dayOIHnmlPp914EVKIY5n6WTriUs52XCk4ky3KMw?=
 =?us-ascii?Q?XM+bgtN/vYlA+jt8pMMaCrZa5URz+3NwtJKQbeFrj2wOEmdBPh6E64dLex4?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-49ed2.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d149b4a-0fd9-43bf-e6f8-08dcd8ac0633
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1645.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 13:07:33.6403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5P195MB2379
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 13:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204686

Signed-off-by: Katawann <quent_55@hotmail.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index a5104f210b..6245594dd7 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -534,6 +534,7 @@ def cve_write_data_json(d, cve_data, cve_status):
             cve_item["summary"] =3D cve_data[cve]["NVD-summary"]
             cve_item["scorev2"] =3D cve_data[cve]["NVD-scorev2"]
             cve_item["scorev3"] =3D cve_data[cve]["NVD-scorev3"]
+            cve_item["modified"] =3D cve_data[cve]["NVD-modified"]
             cve_item["vector"] =3D cve_data[cve]["NVD-vector"]
             cve_item["vectorString"] =3D cve_data[cve]["NVD-vectorString"]
         if 'status' in cve_data[cve]:
--=20
2.46.0


