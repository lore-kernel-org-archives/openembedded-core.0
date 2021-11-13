Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11174C433F5
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 07:47:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3687.1636789635003738577
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 23:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hZ+5Pgo7;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=69513d83c9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AD7lESO031138
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 23:47:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=aZl1PxsVbmakxVfwyKG7F5dcmUiPcMrYPywUrQ0YFpM=;
 b=hZ+5Pgo7188Dd6Xx+XWTnRzhmSHCszr4NBSQMFrwz1lFE/8TJs5fpHot5DbAbKpQnWfG
 tLBM8lJC2MSs4xd0KV1JAQ+YoOm/C3rYa835pARk19uNlGNswjEnydyY61xDGpHL7I67
 PwU9icd0S92udOR4pnTWgxzNPxNFUmo7QRUsw04tuv7EZ0zt1f48X2YPL8elzV88MhHV
 rhVnXeNiahBa/M0w5/kj+FOr40VpfBRbxAxQxqM7NtFrYg69+yi5+ua+h3YAr9APgGuc
 S8wJ+62uOVHJ+aefF8rVVic1Ib2jG51kHW0P6jUckOwLB4DTvyFcrZkWoSPkoDC/VOTl 7w==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ca45xr58n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 23:47:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bc2fYHPXbhWyBs3DB4hyiWxgbPZV61jaiddSx0Q5y6pIjnUd4XVY4rzI4fNO1Xt2N+LLFeLjz7s4lKajJ/9mDaTLVjAnEX2Kbu7mh40POqVIGh5DPax3/w1yxBVLTs++NZm3uVsfY6F85dshy+0EKvQw0+3ZhH67tZhtub2J6RCtY2iI3PHxvXNPjSJZuO1FQod35FxS0k03HyDTbpyBVEy4Q9aDtyHcCmvJe4IpKHt28/czEJzZNSUljX5TKugkwAq4sVHaSQ65fyeBLHd0j120L+6xMoaNp0Y9XzWQbgSm0Ms5GNmV/YdjMbS32k1jI9xH7KJxM8OI1XuQKPr7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZl1PxsVbmakxVfwyKG7F5dcmUiPcMrYPywUrQ0YFpM=;
 b=Udww5y1/hffHtkwJ1UUHKKreI6a8lDJuww3AIo5sIYwYQLWux4Kpl97hiF0RNCbuBs5jZt8dDCbwbn7Tsc02rrf1zzRW4L3stYlQURz0ev/0eYPYwI41JdzU7s0pi1V8u4q/aGF+7u555LxGauUu1PHId3zy+8jFuyq/59NELtNjmY7M6xoHa2YrHfy0Wanp/TRPGIcS3XASTgWv8PluLWyTfxKlTUtwAtLqmk2Eb3Ozz6Mqa/LD6mW3ShWbhYc/wuGXwFc3aMBsyPqKgP/OGxtL8GmZdV+YKHLZ3IaGB8joOWWQYN14p0WD5TZsI9zpvnZf0oDPa9RZKvtWx8awgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Sat, 13 Nov
 2021 07:47:12 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4690.026; Sat, 13 Nov 2021
 07:47:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rpcbind: install rpcbind.conf
Date: Sat, 13 Nov 2021 15:47:01 +0800
Message-Id: <20211113074701.329998-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18 via Frontend
 Transport; Sat, 13 Nov 2021 07:47:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4417956b-c782-4397-bd53-08d9a679cdaf
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB49777EE362AB982E7441785AF9969@CO1PR11MB4977.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9oqhBMB8Z+K0Vtzzc07o7Q6ljxlxuCPWCx63qA/kZyEMDc0UTW3KvTuiiE1OGFBw3ca2f2UZOM5HfZ3McFylAlrA9YS2igGQDAxSsaYrSeBAVZKfLEPPrtSICClv8C2VKuGdrxD/zQzUkuJy/VaO7SWWKuww6IBGWwNTQPP2/OoDtMSlMJXwpN9MSxkKeGj6gaBoXl8PUxRi9+AkZ86qUt7LeC5Tf3XvfmNs5PJ9Jchab1fTp2AGhIlHvsSi/zViDYjEXHoeNo/kS3ZkcY+rLrNL9dFJ2JjswVtDn5iPVPQN0DvmF2CSSNz5HrykuxIvfbWKwAkTIhRXXnlqJv2dxYrgVnye8aNbVTwNa+eKYTPlN1MMoyE90ULjZJkjXvGw5oqC99vvq/d2u5k9q+utcXtJVdjpqB2ACqowV3xqVHzWk9S3i2O8AClcLINJW6YuFl97zvETXg2GJMoI3lQpW0tWT9EVTDo861IjixjBdV+Ft1peiIk/QM+cna5UvcX8/7uLvYaTQSJwo9+jW+NYJoikV4Z9HOOROxFLmuXfgdbeWcSPuf9Vwb+dB0t0HAGU7e3EMMxrJisxpXfLk39PUTPrcWeu0AsuhMMrXpuNa/NzfVPMwWmp6tBOWp5vFTg+tYZPeDa2A5CPLvfL50uK3rVRauw77z6+M6d5dmJH+GSHT3RynmyKo8sFquSP2TmhcEAH3OSlP3/x7QmiGx8z8Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(6512007)(2616005)(38350700002)(38100700002)(1076003)(6486002)(83380400001)(86362001)(44832011)(6666004)(6506007)(508600001)(6916009)(8676002)(26005)(5660300002)(8936002)(66946007)(186003)(66556008)(66476007)(2906002)(316002)(52116002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?drHTzfYqDHbwJY4+QEqt3nl583OwUo0S1YE4CLHADxl8uehWdyXRKLlCq84L?=
 =?us-ascii?Q?DyZz42sxbJcZA6i8WUbZtBOwLmcbWZP+j61gdbJesQ0lFTj+fqz1mzW61cqX?=
 =?us-ascii?Q?zbz6k7N4f9aPLQWzCjUiNu8XN6lGEPiDw1mISR1funLZKcMibsVViRexBCDt?=
 =?us-ascii?Q?5Pp6f+uIlSPU2EG2SLh8wOp68/Wtxg6Q4bV+Jw7ScrBm7Va30Z4/63iBWRwx?=
 =?us-ascii?Q?QFTw6DYnVHxRyOmqAhGwpvShvF15UMU6ce/F24a1/tBiMZ9Pj4VJFeUTqXHA?=
 =?us-ascii?Q?ARtccv3410XCZynMEVxWI9nIrJDs3QdN6Gp3efkqj8hMxENLRuAMIbN2oPd3?=
 =?us-ascii?Q?Ee+eizI4awuQNDEaFTgghoyPX1MzmOF5Uq6vkp/V6nQxs8L3/qIjhwdi36t5?=
 =?us-ascii?Q?7DZ5YoIsYVPDKe4XvQ6+ZGvNyTYxap77lskj2PFApRlW87OPVJm1G+BWhdxF?=
 =?us-ascii?Q?qWaIO9kPg9o+T8Etj4nif6OP/ikAjyiALQ0QuZHUmAQW+aJDWWA13Rl6TmCY?=
 =?us-ascii?Q?fvUKVIaodiznvo7uREnIKyoFViegX/M0Q0fQ4zsvb/rzjmKMpLFskfasECZe?=
 =?us-ascii?Q?hrj+1BhsDoiR5oTd4rMt9ImI1sNuBRbMh07KPWBtPSQ97b9D+gJ1B/pHaHX/?=
 =?us-ascii?Q?SqjCYo2m8b6FvlA9Vlo+Ufx/QzA+S+VVWtBJBqCgWdvhk6E305n8Az/ncuIo?=
 =?us-ascii?Q?k+wJKGOYp++2i4MXCOKQSm4rONaaAq0P5fTC4Xs3g/XdfgTSyH4s/DmUWOOR?=
 =?us-ascii?Q?RMvdyrhkfia/7eP8V4ly6YU1VIuMiXoReLtO9LQrxgqX5AgwaGH2I2R6kmS5?=
 =?us-ascii?Q?5LrCFgpPf31melELdCiKnw0849AjCleQkGPu1d4Is6+3pRyna7tInHl+qwAR?=
 =?us-ascii?Q?SM4J2zedc3hosmHhxFT5XtZag54eSBS+6PTJQB/Z8h9KCWVpDX+M/SuDYZGp?=
 =?us-ascii?Q?TCxgWlfuyz+D6jqg054YyFtYTtBKv/nSnCP3kFniOmC5zErvy79coo7w5u6d?=
 =?us-ascii?Q?WX+zyIyGJUhZdqHmsj8IbAInUMQ7JEyjYHqVI3mJ0+VAq1JKZa2rNVmXR3RD?=
 =?us-ascii?Q?xqdxv4rDpq3RgbEs2tsaImh2jpoqYm6mNYJ2Rs39bnznNaJLllBB5kzkx/p6?=
 =?us-ascii?Q?oYs/02gaH2y9UwqykwaQwS8IZAjRqbxymoxzpWuL5IWjJzEtf02VhAPt7meu?=
 =?us-ascii?Q?FJjxlytWb7J9ye59dunVUpGX2V74X0cRVqsO+PbTz9lfMgCC6vYfXhT8yZ2r?=
 =?us-ascii?Q?kKPmpNYeoTDnyxR7PfX0B9WtM+40QFG/IWIvUUK+4avmBdBoZSNF2KzHDt6I?=
 =?us-ascii?Q?G9i4USHLmFP6nzakkdXipDO6kRfZ+cTeea80Q8b87m3TvBdQJ0Bn1rLVUEZe?=
 =?us-ascii?Q?YbBzhAZ+ZPUSq9J6h5n8lc6FFdueiL51oxGRm3uU5x+Jg1hmCkxtngdldt11?=
 =?us-ascii?Q?P64YE3GUdTbJnEHxncIj/+E6F5MKcicxFPHQHdn4+sGgMVgXA5kY0ilJhKdS?=
 =?us-ascii?Q?yD8xnpoweZh0eys/Jtub7m49t1N1WJNM8j7x9eveBW2uCcZdgsUiCFg0FHCt?=
 =?us-ascii?Q?ILV1uWoJgVpTHnH5z3qsfo5W029G2kBFnyYcxl/H1U4PP6+USwi42NW+wkYL?=
 =?us-ascii?Q?rQ/3wjC43BYR0vs3JyjsjXM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4417956b-c782-4397-bd53-08d9a679cdaf
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2021 07:47:12.2930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZWlfGSmD5sB4QOrsQif74arP1fZoarxvEdZtTc354wkbQmM6riqd9A+/pgcWSQn4L/1dTuZbMAUekfwHWGDYwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
X-Proofpoint-GUID: fDBueP5wor8s3jj1Cs72ldQj1lNrlh_X
X-Proofpoint-ORIG-GUID: fDBueP5wor8s3jj1Cs72ldQj1lNrlh_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-13_02,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111130039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 07:47:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158238

Although we provide rpcbind.conf, it isn't shipped to the package.
Also fix the sysconfdir in rpcbind.service.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch      | 2 +-
 meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb                  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
index b92f2cf7b1..79dc96050e 100644
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-systemd-use-EnvironmentFile.patch
@@ -21,7 +21,7 @@ index 2dd9471..47a46c0 100644
  AC_SUBST([_sbindir])
  AC_CONFIG_COMMANDS_PRE([eval eval _sbindir=$sbindir])
 +AC_SUBST([_sysconfdir])
-+AC_CONFIG_COMMANDS_PRE([eval eval _sysconfdir=$sbindir])
++AC_CONFIG_COMMANDS_PRE([eval eval _sysconfdir=$sysconfdir])
  
  AC_OUTPUT([Makefile systemd/rpcbind.service])
 diff --git a/systemd/rpcbind.service.in b/systemd/rpcbind.service.in
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
index 344faa37a4..dd89726afc 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
@@ -48,6 +48,7 @@ do_install:append () {
 		-e 's,/sbin/,${sbindir}/,g' \
 		${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
 	chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
+	install -m 0644 ${WORKDIR}/rpcbind.conf ${D}${sysconfdir}/rpcbind.conf
 }
 
 ALTERNATIVE:${PN} = "rpcinfo"
-- 
2.25.1


