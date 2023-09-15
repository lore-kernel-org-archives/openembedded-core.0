Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50651EE6456
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 10:36:53 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.58])
 by mx.groups.io with SMTP id smtpd.web11.17431.1694774204463100065
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 03:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=du7Lya7Y;
 spf=pass (domain: navimatix.de, ip: 40.107.8.58, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SR1Soxj5Gkswh/bQ0JWfMz34V7CibWCrxSZntyyRhAtRa4nC9BXHCCFozSy1Lcq/ERuo47H11VPf8utC05w6fIRDQMAKA6s5HAcYavNVwW+aVgKRW43WybVW8Ux5D3qGQaku36SxmxNNe0J/gOmXM02d/R3GmV9fBKJBVih/0JIL75EXfH6xPwPAAM8OIp7NjLe4atLnjjkovgbSYZZrWPAuiVD36Rnj+rDUoEYOvNGlNeeHnJnUhBpiZs9ynBhTUTIgHyawrN1ykjXlnzsnU/9KWNvELM9Zb3QD6qo22fQSStAiPd4BxfV5J7etSr+C6Yk9UNN/KVmKvvCWSTUxvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Y0axFOH/Ex+0sQkABlZahepZbHxn2dbgpAA/Wb1DlU=;
 b=PsMzhRR2tj/RD78+wbimkoYs373spdnVv4hIJAoLyR1mLORrBeZoRFlYe66tZqXIaWb90ArVPfCDCr1jUvftl8h8ox9ebyaQDWZYHIxa3fIy6W9YeMIfJ7JiVWNvGgrw4yoo6q7obVfYebue4KNb3fkp+tx0prmrnFeZSzmHBu6B1PkFJLq7v6R7rVWv4TYv8kiImfjcw+QiWR+IsB/p8JvBed7ayjNWemfJWD1UGdKfXkc1HP/9z1m7TG7eSdPqEdakaMHNmf2RN5EtZC45flgyDsvANR2xfPS7qMLZroyIDqh25D43UKdwRwNXCE12ZfLNhiBGWBh69f6fSQG6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y0axFOH/Ex+0sQkABlZahepZbHxn2dbgpAA/Wb1DlU=;
 b=du7Lya7YMQPzNATIMbaVWuBjZ4hs6k+dSPg0tI2XNEYZC0rrNjQAy4UP4rsLBc79QxABX4lYCOGTaE6AFQPrQpFxrnymPSply3yaFm/QmKCV/D5AACocYUh9MImMUkZHzyU4GMQjgOSxYnEnYYiPufuFJ5hSKNv4G+2K6pqgGJo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by PA4PR01MB10136.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:265::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.16; Fri, 15 Sep
 2023 10:36:40 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::3972:7cce:497d:d704]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::3972:7cce:497d:d704%4]) with mapi id 15.20.6813.007; Fri, 15 Sep 2023
 10:36:38 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
CC: Pavel Zhukov <pavel@zhukoff.net>,
	Pavel Zhukov <pavel.zhukov@huawei.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone cherry-pick] dbus: Specify runstatedir configure option
Date: Fri, 15 Sep 2023 12:35:16 +0200
Message-ID: <4f4c829b693e8f8cf06dcf60d952894ed87e4be1.1694774115.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|PA4PR01MB10136:EE_
X-MS-Office365-Filtering-Correlation-Id: 709027cb-ea37-4542-7916-08dbb5d7a462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kV3TVukcqvwQAjMHAuDNuvcCmDpk0BerpNT1bByWtRYJKBVrjWOJgDp+35tTaqyBZKQnO+YK2jRmnyfOjfc0Ik6ip3GwdeMWFUZpGHnuiGw7w2Ir+1JjEBsKqgK77YZ8D7Nz5mbVSy9rNu2Tcmy5D93sgv/oqHvagckzP+uiw9dO5P+WWUbucogIrMVSO/AFcqu0138dSmLy3tvseDsVdn5mPPvhy+Pf2WyseI/f3yfLb5h8L0/hJCOicUVash0cMxhwPkzYA4YzLCBRIcNjVdKbX9LV7PDTHT320GBjIrkQqSTOpf+gdukMozV9+iTnAAeFjfpbUTUaQwKHCZ85tW5bMNyupAsgSAkj16JfiSEZ1cWm4pRrQbujZHT/ral1LxLBQxVOVigyNLuJ/cWSUvqpK8O8+t7NZY7N5uCwNQ0xUECD9NhCu3U9wX3uvlbbUwem8Eltt9kG93DE7Vz6Rh3GaY9wPsw61lpNtNbcWFfXcKN/bNikLPl3DIkZ+6Sfo82zyHac/tVYqzkyXT2Rn9DgA+y/by+pd8JRqJ5FA8k+5N/lQkRXhdsrJlyZNcaHoiFU4ekEBybWMy8q7EUnhTcjEkcmf1CKHQu2m6MMRX4+FwhZ+KYW9ScbEh5/m9Nz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39840400004)(366004)(346002)(136003)(186009)(451199024)(1800799009)(8676002)(4326008)(66556008)(38350700002)(2906002)(38100700002)(36756003)(86362001)(6666004)(8936002)(478600001)(66476007)(83380400001)(2616005)(66946007)(41300700001)(26005)(54906003)(6512007)(6486002)(316002)(52116002)(6506007)(5660300002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kEQYkuLsu0BGbkDxciBcAm3klPYIz/f+FfloVMNG+C1N7mBdm8lWJkKUSwGq?=
 =?us-ascii?Q?dxnpMYVq/cD8LnoF5OwD1AiSDuzNxM87+alQj2T6ed9Ybd5MQo0AW0NMVcGi?=
 =?us-ascii?Q?LZIh2LpuVk3laHLCwctFeabiySXW+Lc2kX8lt9Jvv0rUx/rOup8mr1PeRSCO?=
 =?us-ascii?Q?ESb2zDndbibGu2IathMAcZf+TdYfqDjNQq8OmRuxcnNf7zO32WcXfp9l1Dwk?=
 =?us-ascii?Q?R35GbhVuAr+RPmQe2ANx6m3g2BYu7BeoBTgHASXMx5rsYpKD8EJCXotOzvlB?=
 =?us-ascii?Q?QvavOHogQ4PhYztDCUj7/zvPjlh7RWhX7ig1eFgXcDs4pm+M9SkcNsvIb9qH?=
 =?us-ascii?Q?p9LPOe95jTRbc71Vou8XJyoY6otxEVez8TToiDdP5QJn0ReJSn9kjBJc0NjB?=
 =?us-ascii?Q?lUfixuKcQzxdZlg4eubVWYD/AoavB37eH95Lz0I0L9gZnfEWEcfGBKxNUS7N?=
 =?us-ascii?Q?PQQ7TmUBfSkHwzdsncmNKR+0mlUPqqKP7yZaBibpwfzcJl1ivDfEGXVwQisq?=
 =?us-ascii?Q?3EO+eptkjG4bvNgm3nZGcpmrmjXw97cVB//gRw/3DxiyeJ9R+We38dwkNoe2?=
 =?us-ascii?Q?RSaAedgNAWa1t4+/q2sBnHJs2XU9zDFh3U8UrKc10Xj7b76ejFeyEkDgE9Dz?=
 =?us-ascii?Q?TrNhjKf6lucO/laY9vrlWhCMLimjxv7R23PjHAgxQLjePALX/mAkFOIH2uut?=
 =?us-ascii?Q?i2YSJXOZ4VW+A/JNxQ4k5Q5fT1b8PfT1z2gHVeoeDr3LEcREl14EmYWxOSMk?=
 =?us-ascii?Q?9OcjKXClbeUDRdAQOhrCLdiX2y2hNVv6QThTFeyKKkjooNzLz/IS8m7GP+0c?=
 =?us-ascii?Q?+LmYS7GjkXnMoTdYaexVF75XMPWetuFarbnPoDOs6WJ/5E8cmPoHM3jVQpwa?=
 =?us-ascii?Q?LkdILUcrtGRuUkcZVp96T3hBztD8NHsgmc4oHNgC1Xe1cTiWbsBd/Ei/JzY7?=
 =?us-ascii?Q?91qm+Q3S/gOk2Kng2JUSuP1tKK7pBjjvbrnQUnDqEXNx4vSwMstDGpXA3owT?=
 =?us-ascii?Q?jWt7ZSRvGukg7h6IZjtvLql++3YmPOt+WHZBh5eJXPsXK/MtZsxW6fx4Yu3V?=
 =?us-ascii?Q?mj4KLona4r9N8jiT4luDinvfbHa37jwY4S4gjl20/hzvChZt7sEldPG2+tFM?=
 =?us-ascii?Q?BOFNk8C3XUXMEH5ust3lF2qMoDMwm9fkPHHr+DqwUiXZPgdryZlafrivwIP3?=
 =?us-ascii?Q?cSdnGXiDjn5YHkZQb1Sx1CfoWKpsuZtGy2W1f0qP2RLrBCC/6emiAAUeePNf?=
 =?us-ascii?Q?ku+JnsMpYYJ0gtG8dP2ETZE+PfrUWdCQi/PfiRwB93g+DkxqmCXVouRSiD0G?=
 =?us-ascii?Q?uygQ4kHCQRHZKcCrfnP8ygpnVDyDwMUdqdbvAcUtD0Z9pcOVHKcPq9azjieq?=
 =?us-ascii?Q?TsPl4xqKzRFM3wKY6ZfgFjOVKboOMAEdfUGjDv4xXpW88gEmCWDSYXN8xWcY?=
 =?us-ascii?Q?e/ciBqCVVr3dNVU/Yfiqeagq8pY4ximsH88zMRIBCwzKG4Miv0jFkXCOEQjK?=
 =?us-ascii?Q?OPdG1nHuVLiPx6XQuv8GBaD0ham2xGP9YACdxLT9Fh7/9OyaGQBRUbNfWV3i?=
 =?us-ascii?Q?e/8+QOiwFmRp5tgdkiWDPJSvYRFgfkBsFToDmPmKDk+lCihOkhXK1c0TTebK?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 709027cb-ea37-4542-7916-08dbb5d7a462
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 10:36:38.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDTk3K85P5+qfLBfjFEcUB45kvDu8kiSS6wUp23sQPJ0+AQvkJEy1m43VgNXRya8YXBII4hwG8Hcr9btaSwNiMFUQcgvwnx888EGEAwI6rE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB10136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 10:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187665

From: Pavel Zhukov <pavel@zhukoff.net>

Without specifing runstatedir tmpfiles.d is configured to use /var/run
for dbus and this causes deprecation warnings in system logs.

(From OE-Core rev: 4df1a16e5c38d0fb724f63d37cc032aa37fa122f)

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/dbus/dbus_1.14.8.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.8.bb b/meta/recipes-core/dbus=
/dbus_1.14.8.bb
index 2ba56bf782..4da307ecb3 100644
--- a/meta/recipes-core/dbus/dbus_1.14.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.8.bb
@@ -25,6 +25,7 @@ EXTRA_OECONF =3D "--disable-xml-docs \
                 --enable-tests \
                 --enable-checks \
                 --enable-asserts \
+                --runstatedir=3D/run \
                 "
 EXTRA_OECONF:append:class-target =3D " SYSTEMCTL=3D${base_bindir}/systemct=
l"
=20
@@ -132,7 +133,7 @@ do_install() {
 		sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.=
init.sh
 		install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-=
1
 		install -d ${D}${sysconfdir}/default/volatiles
-		echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" \
+		echo "d messagebus messagebus 0755 /run/dbus none" \
 		     > ${D}${sysconfdir}/default/volatiles/99_dbus
 	fi
=20
--=20
2.34.1


