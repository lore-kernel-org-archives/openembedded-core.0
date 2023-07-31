Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74435C001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 21:53:31 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.101])
 by mx.groups.io with SMTP id smtpd.web11.5522.1690840403459691905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 14:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=lBlgj9bH;
 spf=pass (domain: ni.com, ip: 40.107.94.101, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkdQyerO4rm2OpksXrqufL3645uVXd2p6IGMuppeGp1lWLkFVc4s/IOfqoGsLB2MB+XH+t6zC60j53xrrmrTaoP8Cdq5hEURCtNFjxMiZ0nCq4WWVPuiNaOVkxTirP0v0YClK6fNV6ZO3Aazcd23Rxhdpht/K/oikAXBRA+HLa8LSEMCa8kSQe1NqLnQeMFOWz5vMA1GSLNfZWgs7LyxO1YAXSHPfLO5kVFkStTtDYbE5djD4aMmTUBvE+I1FMw1Ay9IFQ+DK9/1//nmKMqaY1faTdQJUBDFv0s1sgppCPnn/yk1VR4I5QzcRhQFwZVO7nxJXbengJzDz9FtZboktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIsvqHXt4bE4+apLhvnhTQL9mmcJO8SxM1PkccifBk8=;
 b=fuOIBARoyzpiBhFbF1dDOleeMFZ9a078dYP3Ja7v8m04gstaEtIZmdwCt0Qfz+Wwese+8rxTzET9ZdHB8uY87fSfchp6ioijoosyg5B/FIYQKE9lBEDdRuXPa3Wa9YiPWQIojMl7ApOOGmkaKvTP4usWBQf/vJ4BqHHqMC5RvOizPa+6hIpgHWmkSWbpNIHUHJP50c+teL0NhoyOL5YLYRKWadtU5PXLbXWth6PEj2aKi95xBvBSinDiqHHQL752q12HxBslcRdp4w2PV35w/XE/NVSac6j+y+nFrqw8mDpbdUNqe0C6AvzS62Q5WIs1uceAGVKFmIBE4St1MHaRrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIsvqHXt4bE4+apLhvnhTQL9mmcJO8SxM1PkccifBk8=;
 b=lBlgj9bH7nvhTSGOVT7N56SBBfM600p5F9mRCOSQwXkrch/AOL8RUCoIpfVsoXbuUMsRtSCHT6fojYjslXCkOIsAmTQ6NUWpvk+96nI4eHIjGMv2oB09y9o+1S5w1kTLrBGyxQACXrpDxlC1HV8SnB5Sxz5lg5soSY00kBCxCaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB4879.namprd04.prod.outlook.com (2603:10b6:805:9b::29)
 by SJ2PR04MB8510.namprd04.prod.outlook.com (2603:10b6:a03:4fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 21:53:21 +0000
Received: from SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11]) by SN6PR04MB4879.namprd04.prod.outlook.com
 ([fe80::c738:ef27:97ab:fa11%7]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 21:53:21 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: openembedded-core@lists.openembedded.org
CC: Charlie Johnston <charlie.johnston@ni.com>
Subject: [oe-core][RFC PATCH v2 1/6] bitbake.conf: Add new DEPLOY_DIR_FEED variables.
Date: Mon, 31 Jul 2023 16:42:58 -0500
Message-ID: <20230731215310.3949441-2-charlie.johnston@ni.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731215310.3949441-1-charlie.johnston@ni.com>
References: <20230731215310.3949441-1-charlie.johnston@ni.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:806:20::28) To SN6PR04MB4879.namprd04.prod.outlook.com
 (2603:10b6:805:9b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB4879:EE_|SJ2PR04MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef4c3a7-f8e5-485c-40cc-08db92108e85
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9dMiDIbCKGy6In4ueCtdDy2VTiNiEP43TP+rLNKmVS9vgKmIhFJxHlnlutwEJ/czwOZ6Bv8DOQsrexZ3y21WxsqptDOCrQKZT6jEi6IAzWOGMEi7FmNWONFTqxuDqgJ435AYHuJKO3cbNE0AbES7y2z5gqDHtJLPmNlvYxXjzO1LpIfCMj6U8GHWD5UnLdepeQMWEPPyrFycb/4Z2J/XApA8/L8+ysOnYhTEuWTzJeg6ON+oB9W1cJmcc5Dq5FHwjiwU8CMkvbI4PcswFUbxGMkqo1ItgKCPCE9UJNdakUUUxGeut+gmwfiZK6MBCdItcVNLUSlVY6ZmIz6JKcV0EuB58lHxNGCyNDSYkuzxrTJ6DI+JlmrAsCU9+ZgnLup8yTXeZpbgxYyn3nVndBKeQB1cBihfI+tfvY5V9W6ger3m/QRRL7a5zCqrHm003jMe8n2uiJmPX+oYYsXxeolY09Dk3my1qlrx1YOCczNf1GTcakmHFB73wIoz2ByL3NfklauB/uoS+CzoxTwZGmlEooVxRJE6E/0l6fieCiyfxkJkUjwsx3bCKZf/cmqx2CZX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4879.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199021)(44832011)(6512007)(6486002)(36756003)(2616005)(26005)(1076003)(6506007)(186003)(66946007)(66556008)(41300700001)(38100700002)(66476007)(86362001)(316002)(4326008)(5660300002)(8936002)(6916009)(8676002)(2906002)(6666004)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9q3hVYmAMPr/yHT2Dfe1QxzncBCd+Uj7e1ml/B4sTpoOAXMDnnmJsWFuY7YL?=
 =?us-ascii?Q?t6JYA5KKaLEH3u5JAEq4s9uTnhpTkzL01Obsc6e8YZxc1PTObvaWNjKgBvdS?=
 =?us-ascii?Q?rvGdQdpiUtkAECFp/ZhmkKCmBG5rXgj9skpzrRRp66twytGcuX6GaW1/CYU9?=
 =?us-ascii?Q?VyjieLd14L/oqG37DMREBXoTpgmrHTu2kJ0DxuW1GvFxgT6VFialZfu6iMrK?=
 =?us-ascii?Q?94xjh0D3vsn0xOUoJItO9585zCSHA5FNIZ3jkzWUqMbXgvFs0ZhbB8JVcovc?=
 =?us-ascii?Q?+mjqDZZ1XPobO+Kk/mXM+oTSS6nJZEMGuytIAI1s+2p3JUnu61rztXp667+8?=
 =?us-ascii?Q?rgYLt3j098qGddB/0GUVBHjXkRH0jSZXCJexgvnJwLHPwNoZPQe/OcCMpFBy?=
 =?us-ascii?Q?924WT7r2gFGHW5kKdrhpCqVfz1Rx1mxC4Zpf9v7hvYF1hZl0+mNgKonjX4QE?=
 =?us-ascii?Q?GiJwlTsxhB3RBmW+AsxGgVeoSFCfanq5vMgAeI8hAMDbUybIlc+YPxX7aYA5?=
 =?us-ascii?Q?in94OSezYP0/0NLpmUyDHLwOhymksIZ1+MItOoUbgkhjqjKYtohCC33U4Vvk?=
 =?us-ascii?Q?/P2yusmYICGJp4+WmnQkUo5vx/2Q6ZZKZm88AmZEmeK3lpvnAcAmY/ZCrPX+?=
 =?us-ascii?Q?w5ABIz9yDcBbO0eXD68mloY8f5f+xXIymLBhFJ1/jxw3v1ewj4osCXRvuPhU?=
 =?us-ascii?Q?2e11UR+kXe1lSnFdxaMYaAI3Imhk8/EitEUPY5oBSyJAwcZLm2JNoMkibXk6?=
 =?us-ascii?Q?X+ECbUmBGEWvVZs6E6VUStr1OOsx6xi70ID3VHgifauE3Q2Ob3nbCP13SPCO?=
 =?us-ascii?Q?1gCb4Z2ylt+wO7J6kHkcqjio4STXfX24CqvPKTPTVQoqTU2Uc1MVfJjwgjNb?=
 =?us-ascii?Q?zpKR70yOQkHwsJx9X1+TCGiwos2+RwRqXyuZNZ9Jam083WE2idaoDe89pvAt?=
 =?us-ascii?Q?HramterelGZICcTEutRIwLBfN0eSuDEtRRi+ysKGG5gTn7BdT0SOUSKal5zm?=
 =?us-ascii?Q?xAyYViv0xbV13uBrOuEyfJf6+XcnzOepnHwRmEN28YnSAZoHJi9uLEwwyBx8?=
 =?us-ascii?Q?EouXUnXUb6dyGGfgKdGS4pQm4CvHvs7TkpeABiA9AJu3ep/F3bC1a4q6d75p?=
 =?us-ascii?Q?NaexlfLKxWxsw53TJHQo2vNinQ4FPgMUbepaBrIHnio8djWripqWJXSXAhQD?=
 =?us-ascii?Q?J3Kq7MDe2lRsCwDI4WK5jmaFBqWlo0hJk7+ItpQSDlXvGGN15SGYiiVPFNUz?=
 =?us-ascii?Q?FfK3oZfQnFul5Ydhu074OHuTUogr6Qo43dUy44pHFG4Q9OlxYwKCvo38NVJa?=
 =?us-ascii?Q?pSDkIR9Gg1plJtKmDP+xdevx8fxhyBZ3v8bU3cR2/OpfWa35R/fdLQsC5cQl?=
 =?us-ascii?Q?LEStIg8qJbgBspf0KRUymD8FfQUhxnf7VyYvOOzPugDGu8hJLdaF2HROM7Vw?=
 =?us-ascii?Q?zI+SRk/jTpqjLB3mSi9GTAzYsWRJL0BuEliMkgGNHSwMGzhBCLpOaZc8Dn2u?=
 =?us-ascii?Q?C9EwQlRobLtmU9QEoVUXK5eJK/wFRiDLOqAkVamlAxeCL07YOpoHFR/p1fVR?=
 =?us-ascii?Q?nTGcbK5wJunxFPLfbfRsywUa7GMy7CZqclLp1r3JAQKwQu1YUZOh9wfATIVk?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef4c3a7-f8e5-485c-40cc-08db92108e85
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4879.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 21:53:21.2642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpMWynWD1C7i9ZRZQi7Y1/LWGFUIeMH8M8ULf38wNYE9v/kgWpAb270G+NHj2B8aYbyuf9o8WxEkiKct37ke/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB8510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 21:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185175

This change adds a new variable that defines where
feeds should be created when building a packagefeed.
A feed location for each package type is also added
to allow multiple package type feeds to be created
in parallel.

The location is ${DEPLOY_DIR}/feeds/<pkg_type>

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
---
 meta/conf/bitbake.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8daaaad615..fd1738069f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -450,6 +450,10 @@ DEPLOY_DIR_RPM =3D "${DEPLOY_DIR}/rpm"
 DEPLOY_DIR_DEB =3D "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR}/images/${MACHINE}"
 DEPLOY_DIR_TOOLS =3D "${DEPLOY_DIR}/tools"
+DEPLOY_DIR_FEED ?=3D "${DEPLOY_DIR}/feeds/"
+DEPLOY_DIR_FEED_IPK =3D "${DEPLOY_DIR_FEED}/ipk"
+DEPLOY_DIR_FEED_RPM =3D "${DEPLOY_DIR_FEED}/rpm"
+DEPLOY_DIR_FEED_DEB =3D "${DEPLOY_DIR_FEED}/deb"
=20
 PKGDATA_DIR =3D "${TMPDIR}/pkgdata/${MACHINE}"
 PKGDATA_DIR_SDK =3D "${TMPDIR}/pkgdata/${SDK_SYS}"
--=20
2.41.0


