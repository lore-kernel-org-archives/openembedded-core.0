Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D16C41513
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 21:40:44 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.138])
 by mx.groups.io with SMTP id smtpd.web11.565.1691012439129916051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 14:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=PV6PKOqr;
 spf=pass (domain: ni.com, ip: 40.107.244.138, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jURzcXokwPMP6dY3xxnVSXjOo0+kJR5w8/msS2qm4AI2KG+FHDyJrzJfqhzqvhAgzzknix/WLY1N/p0MV0ivoc+MIk7PDw8N1kH73qscKQ10CCeE6f1aHWaWuTjta6o1Lmm12v6SEQYHdB/LDF7yWqzV+JwfedgbrR7wXnzx9RypVo/XJNZtOHsk4yFfp4KxQMwl+t+6g9dgqhqfgzl6JTbEoz/lrraz+7J3i1Z7VrHjsabXT67bkD9R46efmQwvs381UhJ/S1JzsHdbhd1KOf6LogVE6NrPRA5gZH0SME0RDoPovHxi2/+fCG3H5/1IEh1mUlt1iPTEzYcRR+rD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hc2R/mowLPwddwqosdWZmOLOzGBmS78DFJHZo51HWss=;
 b=IpQM4CTPkS/7pILUuSTRNJbsWu68ZwjDpo2E6VyUbhQ8VEywbcWHa/RURqpQZbxwvD6f2Mw4zIiBbIcLXSSjiz5iLgtG05tTjsz7Z1zz8nmsc+DWk9W0ZV9hK/FhQnLa68Nsn0/u21gFsBXUr5vq/ZuKR42EYjSkfO3/MZVwsAfJlErrUVBr5xLdnjZOjdNLcZMY9Nr/FDl3rbzZ05pl6WdiOBqIMFFWJVEg+i3t7CYPVSujZK20G4IxDfJgx+BJWZfm7fNqWf73ZLHV+y/h8/fQmfUp8JHzF/hZRSVi9267T3QldBV9CdeZFzHVWBd08HIz2mW3oIeNqkA7Ia15+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hc2R/mowLPwddwqosdWZmOLOzGBmS78DFJHZo51HWss=;
 b=PV6PKOqrVS8W+5lysVAUuTe6xsUWBi4LrCqsCKzQVZfLMVcMa5aj73uuxV1A2mw16QbhFV3P8s6m3u+AY6MqkXjLIdMd+mfB4lWb0wh6Gmu3V7eWrdEph2h0EjRCYVAbGtyt7anzUBGFi65sPapKMV56JcixXaJYQMSH+c/pI60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ0PR04MB7294.namprd04.prod.outlook.com (2603:10b6:a03:294::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 21:40:37 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 21:40:36 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][PATCH 1/6] bitbake.conf: Add new DEPLOY_DIR_FEED variables.
Date: Wed,  2 Aug 2023 16:35:05 -0500
Message-ID: <20230802214019.1068795-2-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802214019.1068795-1-charlie.johnston@ni.com>
References: <20230802214019.1068795-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0050.namprd11.prod.outlook.com
 (2603:10b6:806:d0::25) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ0PR04MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: 172ab1d7-5976-42ba-7b63-08db93a11bbd
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GhGOHNopqSF7SVf1OcOTI2W4WoUxlUiiKJ5KSKNc9y4lxXsPT7cm351UlRuFC3SD8I2cOI389UdvKeEDQu3H/Wu3ySfTf5MB8LiI99f5lK8E1+VvAsaNRCp1+hO+L1Q/YxXYXZzNAKKxKEKvjmBTMLWCRrGfNDxVkzYZe2pyk/MGxs+T62TDvTOGJM5EGnXDuPS73VpFgjmCtqEBZGeeUGTpUrN8rq8/LKN6pdCtsu011RSUhOMBTaoTm4B/LYt6Ui7DF8bR/l+rKUmWDtAxHFsnbyxcoqyGd8kLjI426WPdiCvWiGFdWZDOyI6DUq6ka1e0M1zBrqzCn6st/67UkQgAQOyO70QbgPqQQrepL2YZortnwVsRaVUDMid8Va0/g7U6lY3eOchVUxGW3p+QNLj9BOCGANvmPttDcRi5ijqjJmVs50jxq2H2fYIbz/z2JGK5/7o1wwknNH2l7fVGn1WvS3i+m58CDKWVX8K5xK/Apy+DeDiVlMmw0QwmwGzC6kr6syFQEZWV0iLdAZQ2+1qf8WMsf5jfqqUcnJ5bPpmkQqUOorZSHIm2OVpm+NNf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199021)(8676002)(5660300002)(2616005)(41300700001)(38100700002)(316002)(186003)(8936002)(1076003)(6506007)(26005)(4326008)(6916009)(66946007)(86362001)(66556008)(66476007)(6512007)(2906002)(6666004)(6486002)(36756003)(478600001)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ewJ2xtqBbSuwXuWnyeUMG15ZfZgx5A+PMQMh1cEs3YSMU+jvZ5vbQtP8pefk?=
 =?us-ascii?Q?CfxWYl0f/qOFVSEMY1H2l6ucbrq8aBnhq9q7p3LLVDner13yK+GxI5XG1SFH?=
 =?us-ascii?Q?eVuoEBr0Hqtar5WHkXuuti7Ys9OSFIwDBaZ4MvNVhATkDzUUn174AXg5SXrP?=
 =?us-ascii?Q?g+KUWlFdwCZRny5XlZtO7hPOs2e/uCXM1CopelOiOxT5rmvFAwmDLiC7yznK?=
 =?us-ascii?Q?+kLLsI+/1P+hcB40PlQjnjXVtMtF5WeHXb35Qt8OLyIEfUQwNtVkOfvJroR+?=
 =?us-ascii?Q?6Y55YtbjvxuD9lu7+3PdrJiP61XNG6rxCMGn2h09e9mSW/sz3pcrl/f+d47k?=
 =?us-ascii?Q?Ia8ROI+ERA6y+pofrxo35BdnRGlrW0IUaxNMpgVi5T9pLxTNZdUDV0ZIvEHu?=
 =?us-ascii?Q?CKC/S/gFRHhOifv09F8qI3YKgiEsvpGjLD9qMCcB2iX7DCdA/v+hHWetdqDr?=
 =?us-ascii?Q?ORkjLaHjOW/UbFIZJfLTCgMtkl5FdOE4FczINUv40q0KT+xW9o/XzrHyMWgK?=
 =?us-ascii?Q?EanuBbAdyhgHjkZeottJ4NEmHWLn6XcY6LsWP1qr1kQvAf0ghudpXLPv120n?=
 =?us-ascii?Q?Tsb7EyA1HlURazX2OZK+r/oQFDGw3QjH2E48d8GzzVBEs6ELgKaYDowLttih?=
 =?us-ascii?Q?aFvbPcyr9I5UoRZbr5F1olZYkEYqf8XLPGOchcPthTvc7DfWyqJ6FtyTcVeR?=
 =?us-ascii?Q?PXsDfNbHItXA/7422XGanW/dS2n6ZaqeH1n39OAxrhMOM/lQ2ytV7tLzFHBH?=
 =?us-ascii?Q?R0K1WlKasYd0vlY+GSfUjeIBt/BG9P+qKenXhkE0AXHv9e9pBBAFfbUUKQ/S?=
 =?us-ascii?Q?UFwm+OV7K1N41Uwzt+GOcbU1rQea5SJHJJezbuq+GorjxsYq8Ku/501eZg0F?=
 =?us-ascii?Q?0uQspBgzvjhDrjw3Y54VTJhSQgQmneo26I+yxAkH7d78WcyhbtGYE8nr4A/e?=
 =?us-ascii?Q?agjJWGK81PCX9b8ClrnrBgOICmj/r72WwXXGGfPgcUdZHKqiksc7sx//u2j3?=
 =?us-ascii?Q?KY+ewwJm9ldla8vzLCVSQtDrcHSt85gtT0443a+sqFEZKCvqkfY2UhrQAd0Z?=
 =?us-ascii?Q?8bbbXwaOD0yvboRy6pHM0qVmbUkuHMrSH2GM+KreDo2U38mMzBveGEMOw943?=
 =?us-ascii?Q?NfBWLSmx8E9T/9hHqoxWMNEwMvIKkdA4QmNLmak5SeRKSsjQzsbxiE/rSedF?=
 =?us-ascii?Q?PIROYNIcb3SdhppcVUExqiuVaFdjlj2Qhsup7G6EAp8Gi99TLPGvgCCaOrrw?=
 =?us-ascii?Q?OeEm2Sr8eF1t8lmwu2HDnEh8sFSdXlreHAD9EVS2Vvn/elvC9h7kbc62ucrI?=
 =?us-ascii?Q?Me626eaAt4dQsF3uymNpmHypyYfnduNd6ahBmIJgoPqDSYOEdQVhIsM5aYhb?=
 =?us-ascii?Q?UZ6S+W7OPRMe8AEs54QdO6TrNB1UpzNNCj0Hu9Ab4krcb0TNPlcrqoTx63Jm?=
 =?us-ascii?Q?d+NJNEvc0wk8eDPo+C9AbU74mheJ6kNdCanSLY8B9l0jw/IAeWMu/9f47Vpd?=
 =?us-ascii?Q?W+2/BWim7DAYpJJVHy+zOWaJZs+xabmjO7gDmTrpFC2kpwmc2+RjGR5kFDb8?=
 =?us-ascii?Q?iB/HBFdiC6UdHN9jx/OdHL3BgoWDxD9yeopa6CPRaT3lh5W+Upjv8svFUTQt?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172ab1d7-5976-42ba-7b63-08db93a11bbd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 21:40:36.8968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TN7GT6/MjsG+obX4bbIQh6lAQokAxPtxD0WYlcWEs1L6gzaFm3C47jgX/AxNKBzVGd5DTDDDWqMSLgSAx1mRug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 21:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185435

This change adds a new variable that defines where
feeds should be created when building a packagefeed.
A feed location for each package type is also added
to allow multiple package type feeds to be created
in parallel.

The location for feeds is ${DEPLOY_DIR}/feeds/ and
each package type will further drill down to
${DEPLOY_DIR_FEED}/<pkg_type>/${PN} where PN is the
name of the feed.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/conf/bitbake.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8daaaad615..381ca7f3e8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -450,6 +450,10 @@ DEPLOY_DIR_RPM =3D "${DEPLOY_DIR}/rpm"
 DEPLOY_DIR_DEB =3D "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR}/images/${MACHINE}"
 DEPLOY_DIR_TOOLS =3D "${DEPLOY_DIR}/tools"
+DEPLOY_DIR_FEED ?=3D "${DEPLOY_DIR}/feeds/"
+DEPLOY_DIR_FEED_IPK =3D "${DEPLOY_DIR_FEED}/ipk/${PN}"
+DEPLOY_DIR_FEED_RPM =3D "${DEPLOY_DIR_FEED}/rpm/${PN}"
+DEPLOY_DIR_FEED_DEB =3D "${DEPLOY_DIR_FEED}/deb/${PN}"
=20
 PKGDATA_DIR =3D "${TMPDIR}/pkgdata/${MACHINE}"
 PKGDATA_DIR_SDK =3D "${TMPDIR}/pkgdata/${SDK_SYS}"
--=20
2.41.0


