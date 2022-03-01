Return-Path: <tean.cunningham@digi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0B0C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 21:27:47 +0000 (UTC)
Received: from outbound-ip23a.ess.barracuda.com
 (outbound-ip23a.ess.barracuda.com [209.222.82.205])
 by mx.groups.io with SMTP id smtpd.web10.338.1646170064492530984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 13:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=DLIc8wNJ;
 spf=pass (domain: digi.com, ip: 209.222.82.205,
 mailfrom: tean.cunningham@digi.com)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42]) by
 mx-outbound15-146.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 01 Mar 2022 21:27:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPJa0ufdPoPHg5YTuczm978A3FqvXvKOkGEh47ytYUXn83rDmL/f85+JfBWKVT0p8bHnJls/RUDji8hjksjKsFc5YOTorWxRtppoJmAXyW1/fAfr+PEkO/KsfziI0MhQPBXKFeoKh1uAksZGLqMXnKtiVSA6dmDZ7PPMFsQVwXnU8bkWIYRAytFMD3Ci3I1l87KgEOZRoaCVQwc5f/fk5rwbuLbWmlPsIjojdA8l1t6QPJEUUVdr4OJp04yWsiJluRtHyxdDi1JM2Lcikt9S7CfMpS+ThwBBem10xrxlAyvtGCZZITf+shhPfT67+kuIq+UdR75743YvysKQOSYRqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMkGydEKaBg5cFBsJ2Ju3M/goXcwDa/TwOekFqqlUag=;
 b=WAIl6LBSSONyAGZ4+DrU+uMIQW5jIuhdB3J4k+TKOs1ALLRio6nPOz+N4aaWP9spUxmGct8JUO9NDG5WAi/067u0DaoqPQqdU5xDgyMDkdtNWnpGAFU+5+LdGF9IdVblvnkC1kz440X4TETcNXgKGF/4AcIlIQVT0UQOutUvXZBoA7nC+LwvA96QkMWKlnFdWMScAa22YD7+lpGlk6RcdN1sGiA429in4cqPCoyMHsx5bzEohII+ytaOYNcRyi42co5ujfx1ltgTIUi3mwhRruj2B5Z3MQ20KlpAQHANz+vQgORuzrQe6UOXQKhdvw6j2RqlLyukVT6X2JEKgVaXEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMkGydEKaBg5cFBsJ2Ju3M/goXcwDa/TwOekFqqlUag=;
 b=DLIc8wNJXtDW2PQkikg7SU0K26Im6nqQxCm9ANsEo9QWaohRqDrQLJoeP+TeTqn5VQkdFJiiCsaRgsi8K+hjJZKZuQqLAs4vhRHmKu4PiWLsDLXMdjFSBgMe7ppt+40YnJOjCraSpJOSL3SDb76Dd4l3KAz10Sv0IgW0ZYyjxUOJttUSh0+dY5FjCwy/LDOH6K38P0Z3jKF8hPZacOpsYRw/DIKw0z/2e1vaZP963EkuRKFzo735Y90svXhCG5h+vEyFb3okSwDlkAZtidpJsa+Blz7xTtwPaLYBzKtGGgQoKQDz0hQR+XzNzqFelIMyuYay3+jK2SkmvLv59zdYAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from CO1PR10MB4753.namprd10.prod.outlook.com (2603:10b6:303:6f::9)
 by BY5PR10MB3905.namprd10.prod.outlook.com (2603:10b6:a03:1fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 21:27:40 +0000
Received: from CO1PR10MB4753.namprd10.prod.outlook.com
 ([fe80::7904:ac3:f953:1235]) by CO1PR10MB4753.namprd10.prod.outlook.com
 ([fe80::7904:ac3:f953:1235%7]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 21:27:40 +0000
From: Tean Cunningham <tean.cunningham@digi.com>
To: openembedded-core@lists.openembedded.org
Cc: Tean Cunningham <tean.cunningham@digi.com>
Subject: [PATCH] rootfs-postcommands: amend systemd_create_users add user to
 group check
Date: Tue,  1 Mar 2022 14:25:39 -0700
Message-Id: <20220301212539.38643-1-tean.cunningham@digi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0042.namprd20.prod.outlook.com
 (2603:10b6:208:235::11) To CO1PR10MB4753.namprd10.prod.outlook.com
 (2603:10b6:303:6f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd4929b0-d4a2-4447-71f8-08d9fbca5094
X-MS-TrafficTypeDiagnostic: BY5PR10MB3905:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB39054CDC7173D970187216B494029@BY5PR10MB3905.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ybqWsqSQgso6lE5hZ/EK/C9MyHn04zvULnZP7ORH/L1PrOzz/AyDdc2C1vFsSiN8vAn4Y5l+Oaxriv94BHK02MCInzhFNwutSAHl6+IecPP6KXNvAXkZEbmvPEgAet8PmS5SmEN78+bQS6xVqEQt1JnYi/5pD+ddaFjoS7E+AuL1iNJxcZA5slZ7M3iZfhK+397Zy7ZODcNpk9TJGg1lJopkUTmlmQGKf8As+/QRifgxsDoKW24d1JqZac2tKlUULK6L+0C22a8Z5ESh+dWJ7Rks4zwwicfr+kqmt1sc/1CSNPdpp1aQ9bA4UmliNFTN7okkmFjRbPRiMV9bfpCQz33iNv6IiYBAqHtykXHds/3tsHx9kYvdwua/1PIJLwvloWAixd7dW6C2c+vj+mnEpr/MT5ylpkNQbJLjfBdn9VMigGnjk8uUHXyf9Lrg4OJVT4yfoETaeOQsDBLtG3Lup9ThCRoSKwlW0dM0I3P8ZW+tJSw55KkezosnrLAAYTvt7mJhdN2Oz/KVzemIaSX9+nkUuyd2aEZKxlFWfRKic/tCK+Qwcir4LPMg/bVgqgw8vPuWBIp5voRvsAaIcrhRD7G9vnmiUQr4smht6E+RpOINWBEJLswZTQjF95+3LRyGFfHxuXVkz7lbaYbgz8ydgpB37h1dXSWiqL1ELYjSyhiOJAlzXoh3X+kR8dErHXImm1psAE1mxQiwQZjv9GqqcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4753.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(36756003)(6512007)(4326008)(83380400001)(86362001)(2616005)(1076003)(26005)(52116002)(6506007)(8676002)(6486002)(66556008)(66476007)(66946007)(6916009)(8936002)(107886003)(508600001)(316002)(5660300002)(44832011)(38350700002)(38100700002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nG9/ulUYNHvakd1n+0vs5I/WdsD/mYEHD4XrIzJYPNFdho9/IOy0XHpYoVXP?=
 =?us-ascii?Q?qWkDFyMV2/tZHXpz843ezSygToDAHYs85y4vh90/i69m4wfe5HUUwO7Y6zTp?=
 =?us-ascii?Q?S1fuqOS/ELAmhYwFiWhx1ykoOj5zEWePQnFZiE7yokln/kbegAtBiHeI0CRa?=
 =?us-ascii?Q?p73Qu22/9Eky249UPfbcZswKSRrVTz26X6DenC6KRU+FmA3yFZyZliLJ1tor?=
 =?us-ascii?Q?0DIAHIQLzYrz+4uHP675xTlyThguDx5o+3gixXlf2pVQey/tqEAs+8I/ILMW?=
 =?us-ascii?Q?XbMtDd6bX1yCbt9j6J9aWTnF7HAT/FQvakYtlypqx+KbPLVBMNPjeGpn3C7p?=
 =?us-ascii?Q?3e28pwQf0VNxdnzMFOGWhPe+kl/Y3xJJygkn41I+U5Kxw7V0DzggD4K+czSm?=
 =?us-ascii?Q?Khe9wXDkmGr1NMOV94AToeSq5gGft9gyWgDxdsIt9edMK1zoMDwcT5caHqAZ?=
 =?us-ascii?Q?IzXL36wXbBsf9lqsiVzCtJZjM6Y0Hngzi4ZQBoncg0DfLEmcZ8rLhKJeZLF+?=
 =?us-ascii?Q?5dEfadcl8kbKD6kKurVE9BVKYIZoO+rJBeFGU5Urf98pw+tnO4TLbVNGtz5T?=
 =?us-ascii?Q?zw15psAJ/O2+PR1wVxUAIjmAOL05x7SXswel7ls/OcLL1Do3KwoVTdo3QvfE?=
 =?us-ascii?Q?gmaQARncTYibxkyi5uUx0MgH14X4cTj+O+oqblPWkO4vp8vXWE/R8fo3ftDw?=
 =?us-ascii?Q?sk5M2txtkNJjgvSiMacx9YYiOiTyGX9HBdP9/nrM7he2gWHTbRMkLvaafl/j?=
 =?us-ascii?Q?+9K8pRKtE3ehvC7J+UkuFylYny5bilHjCq5yPBJ7PvEodJWnRtsTZWWKFnVN?=
 =?us-ascii?Q?pQf0ypzutkKbXZJ7k6ch2ZPGLC5yokY3AnryFGep9LN90vw2DNh+LmMKO7zP?=
 =?us-ascii?Q?ZY+ZRFarFoCLur3NoBPqysive0tjj+9vIGQPQ4wNxQlCFIUq92WMWx57D+SO?=
 =?us-ascii?Q?8HOG9eJap2h8oC8tZsOFC+zafFWIdN0Q2MUypHE41jQrQbTx/IZ1QKWxhKxD?=
 =?us-ascii?Q?xzo+NrxKlKMejW5G3lM+9HjzMEmSrXANdNGz0m0+oN9UYfvSnXifGVAvC/Jl?=
 =?us-ascii?Q?wPNduTCQvJtSe/1IuAF2kmMe6dbAa9jXH0o2bZBk1QpymjIqkt1pJxOQsqBD?=
 =?us-ascii?Q?FO9AKyKFYdjs+5Yl8p7oOL2PRQcAQmidS85cb/6pNZ5Adg3Vf+OVh+JAW81J?=
 =?us-ascii?Q?tZ1Bc26+curiScmcdYvJq0YJLU3AwNtx1q6Hm2KyaeFbppqM1Sg5LKsbQJJi?=
 =?us-ascii?Q?zHvq30Cld+VToF/gHYDPNcMsd6JfWD5dTQ5JM/oOdfDb5P/hMSlrIkdzlt5n?=
 =?us-ascii?Q?XoRs+V+xJuHnfvb0VSeN0jdAj8rgtrLm2VyLayhiXYn+as75LhePJFief/Pf?=
 =?us-ascii?Q?luuGBKV7vSsoagZj1akAhxtPh3wIXQv+TD9jFXH5jtrSphhIIojpHnWn82kZ?=
 =?us-ascii?Q?8Fv5uyfYr1AyuuDuhFdhUlaFR6/fyXMyGb3U7525p+irj4OdWnKOilXHf51q?=
 =?us-ascii?Q?Edcyc93Xb35DaPoBFiVBCEMIbEZdlFnwvuxHe2eSgoVzrcAsJgE4RtlpIO/N?=
 =?us-ascii?Q?2gYairrZ7row9SLnqsipCp02v1e8nifyiLavZyt5QEoR08VvDkEmWjIKbgWr?=
 =?us-ascii?Q?0DLlQSG4GNkCSQX3+rPveWM=3D?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd4929b0-d4a2-4447-71f8-08d9fbca5094
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4753.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 21:27:40.5849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gi7LH2gfewG+Oq2TAjjgL4e4jsqKBamTcWC32GLWUeiX75TrB/L/sXWNW9o/fi/4X46gPwdQcC2EI26zHWhgyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3905
X-BESS-ID: 1646170062-103986-5367-31526-1
X-BESS-VER: 2019.1_20220223.1749
X-BESS-Apparent-Source-IP: 104.47.66.42
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
 rules version 3.2.2.238307 [from
	cloudscan15-1.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of
 KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 21:27:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162574

Currently when adding a user to a group ('m' type), the conditional
check to only create a user/group if it does not exist always resolves
to true. This causes a build exit failure if the user and/or group
defined in the sysusers configuration file were already created prior to
the execution of systemd_create_users().

This logic has been updated to instead fail silently (consistent with
'u' and 'g' type). Additionally, if a user doesn't exist it will be
created without the default group.

Signed-off-by: Tean Cunningham <tean.cunningham@digi.com>
---
 meta/classes/rootfs-postcommands.bbclass | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 87b5751e24..f3b8f13a55 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -76,12 +76,8 @@ systemd_create_users () {
 			eval groupadd --root ${IMAGE_ROOTFS} $groupadd_params || true
 		elif [ "$type" = "m" ]; then
 			group=$id
-			if [ ! `grep -q "^${group}:" ${IMAGE_ROOTFS}${sysconfdir}/group` ]; then
-				eval groupadd --root ${IMAGE_ROOTFS} --system $group
-			fi
-			if [ ! `grep -q "^${name}:" ${IMAGE_ROOTFS}${sysconfdir}/passwd` ]; then
-				eval useradd --root ${IMAGE_ROOTFS} --shell /sbin/nologin --system $name
-			fi
+			eval groupadd --root ${IMAGE_ROOTFS} --system $group || true
+			eval useradd --root ${IMAGE_ROOTFS} --shell /sbin/nologin --system $name --no-user-group || true
 			eval usermod --root ${IMAGE_ROOTFS} -a -G $group $name
 		fi
 		done
-- 
2.25.1


