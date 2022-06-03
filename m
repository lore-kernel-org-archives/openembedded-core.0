Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98095C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 21:03:05 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web08.3511.1654290178551191826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 14:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=46sbjJLG;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=3153a541b2=alex.stewart@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 253BVIqW016684
	for <openembedded-core@lists.openembedded.org>;
 Fri, 3 Jun 2022 16:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=5KDlyAbr0dcxkz8NVsd4wlzQuY6ji/sY6PKLpjIW9w0=;
 b=46sbjJLGlQEsqXcPHWVWnW13qfwLsQZCPrq8QATpJjKKCt/B202wjcF3wQNyTFnmEhcp
 SG4/JK8GzlQSOvy0yw4dCh7xWRGUzrtFimlcDLYlkIViWCiDQlBh3+lueWnuPBFWvjSx
 /tVN9ILbc0pSBUBk6i6UAAn64U2uGS5UejTczyR9CCj5b9cOS6YpdxfLm/o6ZGn6dJXa
 B+Tzhr6nRbfjXd75HetVm6MQltBw4/MHxmdS3MrzsE2WSixdkgvQBXWRfwJ95Z+o6hwA
 8NUg14O4tMhRMtgCGxEiIxgO8D+TN92Z3hhJMvHqt0m92O5E7scZkM3p5b7v64T+/u9t sQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3gbh8t4mpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 16:02:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3jnh0uO8Prx5ZUlyQK34Qr80pLpU/UWEo53xOLUurH9Lz2qf4R44byOP4l1FE6/1Fw7Gn5phydwm9n5e3dMiaedcK/InTuZdeEulZ9atDYk4i3ty4MIu625bFhtkBIwE08EmRA2dF+LJWHkVvXkdKJXVKrHtvrfP90tn419IfCHwldwtwOg8wQt/KhZhIe6q3j0i4kfgocSWAHgh2sQjPp5ZuQJuqkJhM0GB+WPw3td0Ym4qhG/hJikJTgaFlZJSWXbdCWrPrpzf/XM3vQAOJZUjkUBj7sE7+Cwjmc9BhKd7OUjy2m4AeKTo581VS5NVLK3s6gfFo2TDp3ICKNnqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KDlyAbr0dcxkz8NVsd4wlzQuY6ji/sY6PKLpjIW9w0=;
 b=JtV4PyJP+W9j35kNQdBpSrY905qB1rjrlOiX4ZBjJPA9E48K0Xb+hDf8Si+65HjGZJ0vyrLg9oor2W1WZ8k78OtpB4hDEkR65ynsRfu+S1OkGPEDTmLFYkrRGwsRVTcDYmoGPiRkIU176SES3H7WQmu6GCjzib8QLbZ3H8KVhua4goH8cgiTGhuYYjSn+/pwQJH4ja7yPrLr6bZ//2I6V6Q6spE00+5y7Q3paDmC+RTVaFa2p5cRYHSempA8ZFTMPPYPQhwiPIgVRB8ahe+bVHBnaOxJi73/qvEILXm/5+EiGHiWYNMjV2hW5rghQ5tiPbxVti5ex/uTit9MzeAOXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KDlyAbr0dcxkz8NVsd4wlzQuY6ji/sY6PKLpjIW9w0=;
 b=pkZTE75GX/6CQ+foMN4jqq3SjluHeblX1wyjuTURbMLZv1eFi/6KC6LajjZlXd5p6X336gkLF7npZEZZHG5tm7SlyJTFMlE2uUw1UZuRn4xagFFfkyFhxJmeFnLtFb7pwbj0mfsFWX9aIbk7qLr+DCFfpG/qZpCPDucF/OezdAs=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by DM6PR04MB6300.namprd04.prod.outlook.com (2603:10b6:5:1e3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 21:02:55 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::9860:6712:627:987a]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::9860:6712:627:987a%5]) with mapi id 15.20.5293.019; Fri, 3 Jun 2022
 21:02:54 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Stewart <alex.stewart@ni.com>
Subject: [OE-core] [PATCH v2] opkg: upgrade to version 0.6.0
Date: Fri,  3 Jun 2022 16:02:29 -0500
Message-Id: <20220603210229.388142-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:805:de::36) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9245958d-7176-4ba0-08b0-08da45a46dba
X-MS-TrafficTypeDiagnostic: DM6PR04MB6300:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR04MB6300FBB59302A08F97C08C0FFEA19@DM6PR04MB6300.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	98bptElQkLP/k/WNleL2AVrt7+pD1VdUBlPm/BDZhXGqWzGNGwiU0d+X/gCN0ZiobliscpBWNKDicqJR36ZD2m07wwgy7hfUKGmgCZIqnscT8TAtBEkjJPzKLuy/AuySLTWu2ofG4jEKigvUBOSfbycsjyxHoJ7Ib4b7ZcfQulJ7DFM4I0AIFMogNzpXp6sM4udlcaqr1w1Y105IXijKF6xrXr4Qx36GeAlKgcFJ4LK8G8ljrFe47yjbt6WUc07TLIWPdOegLFUEb0120Lr917B/d1FJXtMjSJg00ryY+rKtZ+KLObAnmdgl9bRFamnuAoR39ulrUkZtaaEsstdG6NqfErWGW7Q3oc4Lc/hAbZD1xWD3ua2IbumgD6blARIncZ+HYJqGwJ4acjvPPBhgtkKtvWG+yrFm5xzbUMu1E72sb+WRwMR1cCXafiYucm96viTCXJt6URoLzW2m7Iw3C7OAYLauH1N9Sioo4jeONB581x2HCnbCe2IJIqCaEf7MgZdju+3ycy0IRGUE8+5tMAx3xK0IeD8tSmQYuAp2cWXBs5PB5mhusKHPU8hsB4Liu7Z68GvLzuYMsqyxRcTL3aO0S+EgMyrwykZNlTzZTvoBxzw3Ksjl+s+PvZkJ91aV6pYQiQ+w0kUUFHM3UxIcDJ114uloJ5pFTVmMWytVFtzf1h2lIj/GBSDKF6RX4JKkQ7s8TBXSrsKce6qb6ndybwLMINhQta+iUrcVdd313NdB8Izb6O3+FA2GPexahdyV9xmj1t448BZ1pBKa2N59gELC3AYBRqDZELZHp1aKfUc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6506007)(38100700002)(38350700002)(86362001)(52116002)(5660300002)(2616005)(26005)(6512007)(1076003)(6666004)(66556008)(66476007)(8676002)(66946007)(83380400001)(6486002)(4326008)(966005)(2906002)(44832011)(8936002)(316002)(6916009)(186003)(508600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tqyQuHhoACeRLTM9tF2Iz9S/KfUU5wK4TxcJmeIYb3uJ5ENqn4QSsHQYl9R9?=
 =?us-ascii?Q?94X+FZwgkqIypdJ6MoGdG4vYpI8oiTn53iOsuJat4I9jFmF6Y7fZlutx642V?=
 =?us-ascii?Q?KLEWSz3Z24iBf0zl3buHgQF5wvbTMD0QJCmC1lpmQQF6Ky/mzcTF4W7k/4r+?=
 =?us-ascii?Q?a4/pHFJ8SltznjVxfrFlHZWNb/+bB1JAa7ircmBd2p468YSdGniFJSgeu0yu?=
 =?us-ascii?Q?cjsM9IgF+Y8XZZDtAo9HkLNToOJJ2JUHUxu3TlIVo3qOASBvmIBhNk0/CF4e?=
 =?us-ascii?Q?pYB8f6QQRUP7n7aMDyOahtVIyB20yjZIs+bEwDvES5hbjK91VhDrYyhEvW/L?=
 =?us-ascii?Q?ZchkWBMg7VKyma3QZl4L1hTymF3TO2XBAVM9FZS1wqDmvC3ltNXPCxicMsds?=
 =?us-ascii?Q?VtOTMRssmTzwvoPZ7gap9Pp+Do0F9OCufofIzFm9pNCjVvccOBEVF7vE9Z9Q?=
 =?us-ascii?Q?5nOV+wmVMbnQC5tS67j3ftfvA2LwwC7bmWh3E/ODKZ8X1E5wI6rOfPwUzfsl?=
 =?us-ascii?Q?denekkVp0XUrEkqOna5F0YmEqvr8tBi60dckBpS2NvYMgzIvoXB8ePbEANOb?=
 =?us-ascii?Q?CKO5D2RyTyk5ZGVPDoivve6jqEOfyNI0EAmVp5kpKRYOOAF7hYmB9OKe6Uef?=
 =?us-ascii?Q?YgUjVvcnl5pQQcUdNF+V2plrfslCdzmcXZqDb8XUdBA9f8l2+bIwMb2DopOf?=
 =?us-ascii?Q?u8FJuy4HQC9jTCMaYXreKxcwy985Jc1vVpTtTJMsQ7wTUr4dLsLDKqw35iAt?=
 =?us-ascii?Q?s+lgpQ2JxLWeRz7QpZhuAMnGM/lpG04q8Fa6/1PAVw+hmmI0a5dMY63kP2xS?=
 =?us-ascii?Q?/O6OOn3H2qzRL3HTvR8Qu2kxYM7VgFgtIDHuJBLhQNdyTKM82JMT1MytZfRM?=
 =?us-ascii?Q?eKwuPTnY7Qu4LVciaAGlHVuabXDampw3NeloVV8mvs3bukHUYTj2SjOpNC14?=
 =?us-ascii?Q?3pCRb9zNVPjI1uJhdu+VexS9EQs6lF6tqt57LolNEGMc6dMcALjFPKl/iO6h?=
 =?us-ascii?Q?sl/CbKPziY6URwVvVMOK49v3OXUMf1OLQQxhWmWiwtw44SBkx92+sJjsXjUj?=
 =?us-ascii?Q?etjsWDPD6JpGKyeEwbS4fgAnueK0EYfNHpEeIX1wupPZUX4jO5DkgMNwv8nt?=
 =?us-ascii?Q?n/RxtLTciQdzUgPME/OghLey4zv2xN8+6M1gSR7b7XKwC2u9+ljtXQo80Gfz?=
 =?us-ascii?Q?GvNbON1/0Iw7MjcY30R4zEng3KhaTELXGQdhfcDSvD4apsuQUFq0xSRZs+mV?=
 =?us-ascii?Q?G4d41fSae/tHa7u76hF7ByJ0wezdszQPAl02yN2wyx6Mlo5RfZ4s5nDGxIh2?=
 =?us-ascii?Q?jWJaNthTIKk3dI/n7SZQWJvNE6ylAIgzoXl+esssdSeUNhQ7S3EZ5SaNwf4R?=
 =?us-ascii?Q?S2UnnCUEtHwiGgN2VaOANrHGA/1PsJjuvJkStwf4EAe8VtaJLNhdJJ589mc3?=
 =?us-ascii?Q?1Ok5MDHDh+pGnrCxV+5xrznZUgrz1gRV8+HrP6CvR0qI/VcZ9SwdO9vdlpHM?=
 =?us-ascii?Q?qw7MeH8AXVrolx92XP3CuhP7V6nxb3qII+w4dB2O9rsSymOcleIbzUu1m3d+?=
 =?us-ascii?Q?Z09OuyA/tYzvzyn6D7UyV4KNWeKNaXMj885AAHbuKqg9xA0RRAZvhgGrf0YT?=
 =?us-ascii?Q?OxuX1OZvI5NqEpXLloyWVRKxKOjkGUymmRqxFgZxzYo1QkD9seYTdkL29ZAz?=
 =?us-ascii?Q?evrOIw1MFPZQD06G3BvJ9HqFJFCOjpwsoeYetlJWfQNzz3gau/pjlub1+dJ8?=
 =?us-ascii?Q?Whzad6fZtA=3D=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9245958d-7176-4ba0-08b0-08da45a46dba
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 21:02:54.5926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 u74bx260p7ar68szkl1VIieUaezEmj/FP6xrQ6YiZfP4O4Zn/yUOVfSvcndPQS4oMeKaEDqQHRCqLL9lLTYWmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6300
X-Proofpoint-GUID: Xlcdt5M2JhWXCXQ0lV5U4uSdL5LiZGNu
X-Proofpoint-ORIG-GUID: Xlcdt5M2JhWXCXQ0lV5U4uSdL5LiZGNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-03_07,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206030081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 21:03:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166528

Release Notes for 0.6.0:

http://downloads.yoctoproject.org/releases/opkg/opkg-0.6.0.release-notes

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta/recipes-devtools/opkg/{opkg_0.5.0.bb => opkg_0.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/opkg/{opkg_0.5.0.bb => opkg_0.6.0.bb} (96%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.5.0.bb b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
similarity index 96%
rename from meta/recipes-devtools/opkg/opkg_0.5.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.6.0.bb
index e91d7250bc9f7fde73395335f008108578515b77..7b351e81231df48b2c493542a00d95911606248f 100644
--- a/meta/recipes-devtools/opkg/opkg_0.5.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "559c3e1b893abaa1dd473ce3a9a5f7dd3f60ceb6cd14caaef76ddf0f7721ad1c"
+SRC_URI[sha256sum] = "56844722eff237daf14aa6e681436f3245213c5590ed0cda37a79df637ff3a4c"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.36.1


