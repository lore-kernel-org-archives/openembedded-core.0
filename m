Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E966C3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 17:10:31 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.62])
 by mx.groups.io with SMTP id smtpd.web10.16312.1721841024344846921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 10:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=LtMXnPs0;
 spf=pass (domain: oss.nxp.com, ip: 52.101.67.62, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sw8NZAurCzBHW0X6fh+AHYkcnQwBN8yxTsVjMnP8wIKmRA/A1Jw0PX/HQ9rSN/Krf2j6AtR2Np5hHsANyIescccrFcgkmKA7KgyNCuqL7ErAycLN9Y6XdJNM0nyxJQw4x0s54iiyByDPirt0I3cCchYARP+yCC/FP8MsEhdyYyKvB3WeW23jcckISpxftztY3Gh+EP34bhACb+hTtsqW8ZM6o/8bR9kP4RGcoI8BZE0wRCf0rpI0mWlEI+PmV529Ahs9VIN//mnT3ZOjOVJ2Lm9hk+CFMSUgl9ISloEnyIGeP+9lZ29upSfb+hlx4JWVB5DpKZsBcXuOTM0Xl6NgCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDPTcWehH+WUaUfW2X9BlTvajWQ7ReIM4fDLKiLDqWQ=;
 b=r0BBhNy4atQBnSi3/XqgIqHFx1eFeM5IbYuYXWT2w/L2kvOLkisvsIYwRY1EAxMaJgu/9OIbgvEh89xQiz7rXC+BPpj/FVYLWefeCQi0/Lw4SAWqFmac7Gy1c2ISMcRgJKx0H+uPhl90c/Tv1D9xvOEr37rG+bkYOcfDM0XAdw27YFxjjBftFF64l0EhqoyuvLlfpXHyPtDZeCEwcN61iwwi/EGqrG1NTLJuEVq7dYqZhzHonu/1Cf69WfQHSfLHvAtGA+umEzwM5XX5A8J8WuxmG7i8ktvGZ1Hm6sArHSADhAS3JHQCaiZuxisktrqK5tLyfttdawD7GyOXE74YcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDPTcWehH+WUaUfW2X9BlTvajWQ7ReIM4fDLKiLDqWQ=;
 b=LtMXnPs0eyGzdynqpOf4hPfveAkGJ8kgW+7Jt034OZMQewGajxn8CVghqjxf4vodFH71lAk1h1YNhlWk6WYNPm7L0zhvEkaLq/gorh14/GOnQjt0pq6FTF4jGtAAYEkoZlpjxbCNZahe/AZmehMRrX1dhnmVcZSTWIJo427IsY1wuY+4xRIPEYxMLn/AD2V3olIH4MALpKfmT82FUngpi2AFFwL+QoLXNZ/aT3juamRofs8FyZuK/IkhE9T371weOxYNNLssacJC1RYQDbgUow2PnIg9RW+2z+PArLOV38oUxAZi01AmJ1zpLSlHdgye5Qiabtvm2yeqCkIbFish/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8484.eurprd04.prod.outlook.com (2603:10a6:20b:34c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Wed, 24 Jul
 2024 17:10:20 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%3]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 17:10:20 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH] time64.inc: Simplify GLIBC_64BIT_TIME_FLAGS usage
Date: Wed, 24 Jul 2024 12:08:29 -0500
Message-ID: <20240724170829.3456577-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ba17d9-209b-40a7-002e-08dcac037fa9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ow2syYjyTb/9IYi9Sfdl4iuQqZX1JSCpyzj37gjv6TsF6/RJBwWYKPM0KkSZ?=
 =?us-ascii?Q?voCum58BJi2/aChNKdZ8/GITmSQVNGTqdCVfB0cJdguUbS9NffS168UKH7P2?=
 =?us-ascii?Q?RJ5LWQDvNK28OYZP1D1Xyuo/ZIqIIHwRmOOGHo0DV6H/4cM3JYJZO87VrxoM?=
 =?us-ascii?Q?6Ddk87DXGS42nXVRGkB6+CYDwrqT7CeWyaU8H+2UdJGAvxT3uEF2/q9IvVWZ?=
 =?us-ascii?Q?GrJVoXiIfp2KRVuhfbllgqcmVnBnZ7TfCe+5M+N1epr/4UV1awTnNZzWlBgk?=
 =?us-ascii?Q?jDelyDNbYLX8SMn+XDS5VAQ4wb/skvZUpoHdcDukOW3UPUGffpO+hqjbc4+z?=
 =?us-ascii?Q?nN3S5SvD8Csk+Ldgh17EPkzJcBBKaq1sklLoLsKrJVRIZBz10LT11wRmnWWc?=
 =?us-ascii?Q?svi1Xmt/ls1cMElGIwUwHnUD/MqIesdip51Mup6U2AtsWxW3j4zUyv6zohQY?=
 =?us-ascii?Q?DqgnFWNsdSPZQsOKk8ND+Lp0bKyeWvpKWg9ShrEit7+jH+GyNwvlgo6IT0Qv?=
 =?us-ascii?Q?rGUJohr62jJwt7XYeaw1Ha2r/2ezq+06yOI27eWh+rIxsL7Jt5NdgUPumgPo?=
 =?us-ascii?Q?PiKwWfGmLYgAIwPnps1XgfDDhWmiqGeE1hH+VvAPMIeBTCFHnYWtGGexXmxl?=
 =?us-ascii?Q?SNwZtWieRx9TSscrpHPM2Y+tiJe8+SF8Rio5fQELDBwhnbRS0ojkPbQ2tsGi?=
 =?us-ascii?Q?l2dlWzoJVL6okrvGY+FXKITOIUcJ+CHE/UTWebH62wvWRQkG87kkmpEB7LxZ?=
 =?us-ascii?Q?wFY9V1Y4AeYWIJhMZ/o7+1T/ItucHeaL8Hi1847mXPrU8iRFa1GcpC5vJ67/?=
 =?us-ascii?Q?2GCN/54Qu0CG461rnBrv62F49h8vdd4EdmojF+5k0AR0hPU9POxE+hLRdDZr?=
 =?us-ascii?Q?ccDcXYlZpL6604fLlFLvd7XUxXnRX2pVaUDPewtvZuCjVmdhnbkcU18WHoui?=
 =?us-ascii?Q?coD5MP3ei6lkqAVxEdNvHQlPqfgPl6SKPoKDuRPgCYG0xslOMsHL5FoKBpZK?=
 =?us-ascii?Q?Dw8Wbqxr+hvVbe++RVX4OiaVE7dx7R8qBmCYTiqu/D4QhrAE9Hd3sNiae5dw?=
 =?us-ascii?Q?p4vmcmy39WcQQw6Nf2tvBpyA8ESp1ebmWuWm73Gawi57DQIpDTuxBgbCR2ct?=
 =?us-ascii?Q?rLR6NhtaTY1Rvkdwbf6peqSmTggnuRgz2f79w5KIpExIWsa9F8fRitqxWUst?=
 =?us-ascii?Q?a61ObVvdHjAbLT3jURJe6vpF5Fe7GJOUhTE9aFrL6capJ3sAHhw8aLhpBEaJ?=
 =?us-ascii?Q?M1tBHu28iH1H12deWtHV4FBFllB9AD/8Xg88woSTUKHRFImSBvrJ82kWdVxu?=
 =?us-ascii?Q?x3K8B384fN/lfOUeNv50T2xOwEU2wa9p73TBiOUVqdDJKOntEGFYOkd+MIi+?=
 =?us-ascii?Q?1BKvKE/ffVXJY842oe8OGWZ/6BRJLK2uidU3BctS0Ommu4LVHw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HrwHR0UCuGpXDu8oKmfmj7D6kBJW9LQ9bE2Tnv4evwo6KN/oK9KVnCl+1lvB?=
 =?us-ascii?Q?hYMNibrMpHSInZXVn67M/wTX5XuOCr7ucUVEGiKhA8a8joOcKQkdKiuscxVY?=
 =?us-ascii?Q?gclDDtThnShzJffeXZRTwzYnIeQzcorlwEcS2KpkVG6nojMqI6wdBelC8Rvx?=
 =?us-ascii?Q?2lHroCY+9CN7RVeYEs5tEyihDAATUx9/Gue+y2shX361+ydGcbWXeIJseugS?=
 =?us-ascii?Q?guVbjYib3NjXPf+QBlkHZLdCpWv+jqJwAEtbwyWltBW8uh862ABV+snAolaY?=
 =?us-ascii?Q?rl0DY5jC+ewLgSgNMSCb9z/3Qusmt8ejP+o5RWtdYGHRxTkzhT4/hV9ySvQi?=
 =?us-ascii?Q?iwCAsNbiuxiuPS9dotB/1FSEEUkXmMDM8eg2DcUo93DbcD+tX3Il3oeQwE8J?=
 =?us-ascii?Q?ojhiJ6kKHtvR1Uy2gbwrZ2lujRmpOdeFPYvyMGQvj1VKGz2bBr3Daxf5VlfC?=
 =?us-ascii?Q?PWcOs1EubmZbCS/vE5ihxu4AymfEvNzK5RCpNOhiS6wsc6pyqwwersW5/5q1?=
 =?us-ascii?Q?GzfjkjKHdMtWKnw9BnapiZwtB9mhtaIg6ItVeGp1IjHpofPUA/j8a080UUao?=
 =?us-ascii?Q?MUHbD7R41mIqfU81k9xXMZ1H3K7/tc4ZlZ/jpRb4Ct2nWmf2ZhvYoYwg6zUU?=
 =?us-ascii?Q?kSNRtlSrlB+CxJgE+9oUVCviZAtmVlxBwZ4FpFQGN1LUVADBe6i9xJeb+28C?=
 =?us-ascii?Q?I+iLw5KTxiKXeIZD73eYCJpf5nH2s1p4yWpQCb78W0oSdBiqr+1/BqLFtqow?=
 =?us-ascii?Q?NJUX4Db12/jOoWrLgYYlsA3pgwonqum8XZ4aG0nO7D9+c5O1U597JHDpvuA+?=
 =?us-ascii?Q?H7Bop0z6V5yLFw1qNYYInXN4rqvMgOLPA8BspQa8o6rNfHnXHsXfWsF2N/gb?=
 =?us-ascii?Q?rB4hjO5d2Y/NVFxR/lDRoeRkQVc5JvbCRhUu1pIrwf26me+aw3sL9xyvEJWC?=
 =?us-ascii?Q?8tHXqkxpScrz2WMCwBAJsoJJg8yU8uxYsTe81bjSPgU3prpCtCAztImav3Aw?=
 =?us-ascii?Q?IKYwMmtDcuUjitH6MhFaChmlKj1yRXCv3TqzIms8G5r6e7EmbCAQab1BIEFB?=
 =?us-ascii?Q?S/6v4jWxqFD0R7xr2qzxQqyoEMlULpvv9KvhahfkmrKfJrMUDVtNaPwVCeUA?=
 =?us-ascii?Q?+WuDEMOs2UNMwtK2WFcATG7pwCbUIi64dMeeR4lL4hmQBwd/wELX4hkS+gjC?=
 =?us-ascii?Q?3O8ypftGUM+mnontMCelfCHjXLmPMlHJMcL5O/CURX8Ux+Omfkw9uSPj5ze9?=
 =?us-ascii?Q?4mx91+LQWVXkQ07HyosQQZXRg6Mnur6N8OsuHKF4ENOA/5fiOAIqO5f+iUQm?=
 =?us-ascii?Q?tr6o6gatOnjjHqNXAjj7n/mViEQ0pVHLOBnR6Deg/G02Ux4j8l+xQ9q2QAgH?=
 =?us-ascii?Q?xGP4yxe0oPc0q6SCBxwOjWlWCI2tL/qy5X98yJALUpvnEA62bFQ2vlw7h7MZ?=
 =?us-ascii?Q?NEQIjOBLrC+jAcYzYq6uR+E7PrjFnx+9s25eFskmxd4Wbum3GfsnapNR+eKl?=
 =?us-ascii?Q?hhlMkoTJdaqNfNRPsYYm5j8qy+gIxr78DTGOIREPqA5hHDvlZr7/WoZ9Jbv8?=
 =?us-ascii?Q?Z/cjngP32n5ueOG51E6+TXLmlBPAFPChHfkNliwmhjLAqXa/xaWHoL7421B8?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ba17d9-209b-40a7-002e-08dcac037fa9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 17:10:20.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKA/Ax2VQ7eMp589+4AkmdhNtb7C+MKN6ZrPVIPkNbliXfcSLkxmADWczUfGDzrMlb0o4H12S5iN36TQy3+GJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8484
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 17:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202470

The implementation uses the append operator to include
GLIBC_64BIT_TIME_FLAGS in TARGET_CC_ARCH, but it places the space in
the GLIBC_64BIT_TIME_FLAGS assignment in order to avoid a 'spurious
space' when the value is empty.

68b50d3 time64: Remove leading whitespace from GLIBC_64BIT_TIME_FLAGS

The problem with this is it requires anyone wishing to assign a value
to GLIBC_64BIT_TIME_FLAGS to add the leading space, otherwise this is
the error:

cc1: error: '-Werror=3Dformat-security-D_TIME_BITS=3D64': no option '-Wform=
at-security-D_TIME_BITS=3D64'

Remove the non-standard usage requirement with a different design that
uses the +=3D operator and moves the arch override.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/conf/distro/include/time64.inc | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include=
/time64.inc
index 510da11039..a459013a92 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -8,15 +8,18 @@
 #
 # Working to address those (before Y2038 rolls in) will be appreciated.
=20
-GLIBC_64BIT_TIME_FLAGS =3D " -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64"
+TARGET_CC_ARCH +=3D "${GLIBC_64BIT_TIME_FLAGS}"
=20
 # Only needed for some 32-bit architectures, some relatively newer
 # architectures do not need it ( e.g. riscv32 )
-TARGET_CC_ARCH:append:arm =3D "${GLIBC_64BIT_TIME_FLAGS}"
-TARGET_CC_ARCH:append:armeb =3D "${GLIBC_64BIT_TIME_FLAGS}"
-TARGET_CC_ARCH:append:mipsarcho32 =3D "${GLIBC_64BIT_TIME_FLAGS}"
-TARGET_CC_ARCH:append:powerpc =3D "${@bb.utils.contains('TUNE_FEATURES', '=
m32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
-TARGET_CC_ARCH:append:x86 =3D "${@bb.utils.contains('TUNE_FEATURES', 'm32'=
, '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
+GLIBC_64BIT_TIME_FLAGS             =3D ""
+GLIBC_64BIT_TIME_FLAGS:arm         =3D "-D_TIME_BITS=3D64 -D_FILE_OFFSET_B=
ITS=3D64"
+GLIBC_64BIT_TIME_FLAGS:armeb       =3D "-D_TIME_BITS=3D64 -D_FILE_OFFSET_B=
ITS=3D64"
+GLIBC_64BIT_TIME_FLAGS:mipsarcho32 =3D "-D_TIME_BITS=3D64 -D_FILE_OFFSET_B=
ITS=3D64"
+GLIBC_64BIT_TIME_FLAGS:powerpc     =3D \
+    "${@bb.utils.contains('TUNE_FEATURES', 'm32', '-D_TIME_BITS=3D64 -D_FI=
LE_OFFSET_BITS=3D64', '', d)}"
+GLIBC_64BIT_TIME_FLAGS:x86         =3D \
+    "${@bb.utils.contains('TUNE_FEATURES', 'm32', '-D_TIME_BITS=3D64 -D_FI=
LE_OFFSET_BITS=3D64', '', d)}"
=20
 GLIBC_64BIT_TIME_FLAGS:pn-glibc =3D ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-y2038-tests =3D ""
--=20
2.25.1


