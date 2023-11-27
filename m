Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA68C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 04:01:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.86253.1701057670310912257
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 20:01:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U3QzjTOx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96958d6384=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AR3FD8k016349
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 04:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=/4wrfv9xYTdAiR+N8y
	Nur3ZU+RrHBAHvpJxyS3zxnTw=; b=U3QzjTOxNSB/vISvr0QOocbRnQrQ8brzSf
	fpzp6AbuoJK0Sbgu64zqMnKeltwuxTEIU6mP4lx/I8s66QksfX8toXBXBlX+XxP6
	gIBUsqI6a6I6+K2QtTlvmgQ4RTOMZfCaAxdjL1pKPkncaJcTw82zE63OT6zjGtB/
	jJQrQ5olYTRKP9vAa5Aj6tW7mJQ67u5DM5WxCs/Vjbvin764w6y5GOhGC+IjK36M
	myTZTV/dnBoEvJxVXNkCbPhtQu9sHdVDn+GrWgOtUM2AZG5gPzazuMCHMtuZFFxa
	rA5nmrLwPZ9LDsS/p9pwDJa4kXK6fhwL4BQ4wVyGITC8zd74jXWw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uk64xha8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 04:01:09 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3AR4185u022285
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 04:01:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uk64xha8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 04:01:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enjkdO7d+0FsGiUgE+0fg/KNRNH01xc8QAPmOrvqQxZha7X/vuFQfhuF3IZqhAE5U/YrHb/wOW0L+el8/nysHhVpDoiMfPgLiTHJI0vYIWN+0/r1Kikhq69/DAvTzFboApvUa1XECmUHAKQOe/qQBxbPND2vbKAtgzKvqGgvzIOYjCz6+kXtGWtsYHWUONlmOtJvdsk8VCRSm3sloKZch84KNpuzEoe5bm1H304sxEKVCQDaGcqCQ/7299m8hKa58bpYZACZGpsSBhoM7bkkTajt3q3gKywKhWJIYVoUjXyx2pwDy9NbYEF8UqsExv7dOj99h68uyVUCm2Nf/1SrFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4wrfv9xYTdAiR+N8yNur3ZU+RrHBAHvpJxyS3zxnTw=;
 b=ihIl+R3qJukhOTTCopaTGnx8Ve3QWYKbUhPX7V9IsJ3Jqe6naQrcUn9kgw0H+UOsmC6t5VmdHj2YGAlEV+lNcFog/xfy57YLnJ6MqyP5mkol1hjw52Q5qMJXX+dgsodTK7SqZ2mTOZynEOeuvYjzOnr+oSDcnU7J25bGSSBKSAS7WicweDNDvN02Kl3KvHvXgUSRPe3t3L6Ng2CMqdA/6r1TZUbyi5vrK21PSZm7uQTF6NLTBu+k3HNKqIFPNZSsGc88v1RdNDaIJFd7k2XpAzAL6vWR/Vv5hcp2sleAvD3h6PKPI0VBP0qoJ4+mfJPprZwOUo6JqQ+YILDMn47IXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 04:01:07 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::e78c:8c06:e457:7b40%3]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 04:01:07 +0000
From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, umesh.kallapa@windriver.com,
        steve@sakoman.com
Subject: [PATCH] glibc: stable 2.38 branch updates
Date: Sun, 26 Nov 2023 20:00:46 -0800
Message-ID: <20231127040046.1024625-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a03:505::27) To CH2PR11MB4470.namprd11.prod.outlook.com
 (2603:10b6:610:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4470:EE_|MN0PR11MB6057:EE_
X-MS-Office365-Filtering-Correlation-Id: 1701ef34-4c11-4035-9bca-08dbeefd7b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0qHODesQ65iM6aozbPQCHmlfTy7LMEQfz4C7RQAjbA92LUG8CnrSk6kLwCE8Slq7rPNvbQDB7lOXFTqAbqCIypsx+ukmiGdyQu5rI+OwdunUUtdshdwY7HHxxJA9n5LTx8skOTBFUDe7Yp9yCOftQ4zi6FB2e9sRQ7FLZa6NqL1bgN2J8Izqt1CSIo9zENxcl4lM6Te8cSI43VNUD65/avjdB97STK0RQdHsRMV7o608r6fDNapIDi9Jcp94qv0PR64qkhdXT5jeuYe+ouzoVmrO6XcQ1JMW9tJdBB5Atw/IUMjfT4Jy5xTxp8x0kBllHildUKhnAj9ZZRR/j0AVTddbHa2zLOkWfoLtjVVaxj8kY0bLQ65O0CNOo4+ZZNxUyy7endym4SB3JRWrOh7xzkyPbcLSCafgxjbCU2xiOnMFUDP3z5pN/MZdoDHS7n2qL6j8XpHqIPLRuAgAxsQuHc3yUJ65/fXrf5f30I+nUhGuHz96+3B52IDtdaf6n/FJAL5ozeF5ird82sqa56eZFKMgR0ihm7QqiJD5eFHUEnG/CTnnC/AB79lEGw+rhEHv0obFpGvUakIZJDqpEJ5ZdFIQrPg8mFmgYh55lPqEAxiBBL8FbLfzfvBMOhVdJxBB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(376002)(136003)(366004)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(15650500001)(4326008)(2906002)(8676002)(8936002)(41300700001)(26005)(1076003)(66476007)(316002)(6916009)(66946007)(66556008)(6512007)(52116002)(5660300002)(2616005)(6506007)(6666004)(83380400001)(86362001)(38100700002)(38350700005)(6486002)(478600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eDQn80xKOmgrltMu3znERFMzTpLBahlmlpxUF8+AOa2o0v5w1679v7HTWNpX?=
 =?us-ascii?Q?3y0Y4CyhGbKmUWUYMJumNhwt5Eb9lrUz/Bv7KLAwqLmJxhX2/nlekpqh0A+B?=
 =?us-ascii?Q?qPJWAbQ+JOAwR+4vsLESw3rm47saKSdp7pVMcFvknTJyaPf3eLL5nNQifMMf?=
 =?us-ascii?Q?bzgQD+EGlLRLc/6mK1P/mEp7ybzRC8DHlOlGzi0pAnBrO/7Dw59+veZP089I?=
 =?us-ascii?Q?+rg+yI3ZHgE/E1i6oloTMRnsboUEPw7ZU/+Ql9HvHDw7mZL2sN57OYUtF7dp?=
 =?us-ascii?Q?7f3TSvWV79NUa21NApVjnA/Llho/V5nzipFfSzKNhdDRdtMki5Q0pQPZq2gU?=
 =?us-ascii?Q?Lzb7tMW/9jf6XpCS2wLZylbGJcxqxC6mOUUJMjLjn+69+I08NP7jZJM8Og86?=
 =?us-ascii?Q?digRKMUjeSBCGDQ+Ob9jjoPv2apZU1FccYI6by6DzRnvakXQqj6ANaXRXZOf?=
 =?us-ascii?Q?goVrjh8MYFG2U/2Az+wnfW6ubqdxbjwnilbEaBtj+fkZHn3LrDAIi+fDTS8X?=
 =?us-ascii?Q?jewJN4k1PkOLc5JP9Mk0Is26Si4soxOOtcCQ6vFAx1QV7cz56CyScywY3FlX?=
 =?us-ascii?Q?sU1WEimUC6Xs7H8FJ+nXFL/cluuTEai6qLyaCg9teMjDA3d8TUNKhGmqyrut?=
 =?us-ascii?Q?eKpA+snW0z4aYFQjNW0m9jw7LhYj74QxA/LDDNPo14bmQUUx83PfeKsX8oME?=
 =?us-ascii?Q?R7rQxTw1EJyZSeVL63sOFwIQ9pUzufsyoJcXv1xyYYhJln//ktWVpte/CHdP?=
 =?us-ascii?Q?vXPVITHU0orbzXL7E7LApEbJEfaLNKERaPIbZQetIPQyD5tS+B5DnEls6Jnk?=
 =?us-ascii?Q?inF6x+l41/qP1vlCrGj4xX1BK9o4n0xicVz7Zt9BAVLvS5AYYNoqA5eiQ5pT?=
 =?us-ascii?Q?NzpB22aA1PqhxYihGxYmql09mD/TFyvWvuCioMaoGe0BBEFCU5KnQGmhpdzg?=
 =?us-ascii?Q?Gdog2EbW88a9nNU9zBhj0GBRhKZuZKvxEwOWXS7iv9IBinlQ80Lsl7eDYU7k?=
 =?us-ascii?Q?64YNvwvOVNvkzQW1kNcLx9bn4OTYzJlcJe+0hLGUqWtkbOhsM0TE4RbUDISs?=
 =?us-ascii?Q?JmQkoLo59yNswGqOg1wo3ILE3YitmqssLVfe1Kgk002/LdBy/0B4lgsUGvdy?=
 =?us-ascii?Q?R1KhVh1t6n/Y6rPSR4JoOon9O5hoH0SlNgbF1a2U48nSpp6XVTz8R0GMdj/v?=
 =?us-ascii?Q?lA8chWtvoZD/z/2qu8y2GO/c69wbWd2fNEfbuz+wkr4ij16k2wNG+6yFddVR?=
 =?us-ascii?Q?VkMnrrcXSuofyuQG0Q5BaRU+/g7nh1dDAMiUDDVdkaDr4DKYTFahu3rmauCa?=
 =?us-ascii?Q?pNcRq7aJY+aTLwfmqXpm6o2CNPGMnP84i4fTWtVu/wvIuTrtCo9Mj8vzx4hr?=
 =?us-ascii?Q?KxwTGXICZ6W9FeND82/U874ty6nAYj9tUBOEJTp2o/Ch8zBKB87QLVfu3WMV?=
 =?us-ascii?Q?abzJshEcDYzhj/QqtqB958G+a57Cf3EENSaApyBmBgPm/Eqm0a44hbydduIT?=
 =?us-ascii?Q?WG1kkd1Onv3VsPf/zf+wYfv7m4Wo4W2tHOb8QTggmjmwrDyoz9SfYwtK2Orx?=
 =?us-ascii?Q?o0Scbbe0RLzqjqH4/hwK68t6bXclORKLKPN5+/EvaiFUQDadNssRjVVkrujz?=
 =?us-ascii?Q?SVLIj29Sc40hExLL6FmeuOY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1701ef34-4c11-4035-9bca-08dbeefd7b87
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 04:01:07.2232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhtaxV3LPfm6CNysR7eKOHHeoxZuODVKIcaRSxhcwobxvI0DZ9tiaCvMahvE1TgJE7st35y68SUUwhrn1hrHqMsQZYSscJdgTm+XrgW8vF4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-Proofpoint-ORIG-GUID: 4HRdqpSJg09WoS31d_52mvsZud3RGfNJ
X-Proofpoint-GUID: i6Azi9TrJ0tbw5CY26uSatcGm6sShfKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=785 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311270028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 04:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191246

Below commits on glibc-2.38 stable branch are updated.
1e04dcec49 Revert "elf: Move l_init_called_next to old place of l_text_end in link map"
719866ab2f Revert "elf: Always call destructors in reverse constructor order (bug 30785)"
e0b6c9706c Revert "elf: Remove unused l_text_end field from struct link_map"

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 19b98bc11a..ccf9d505c5 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.38/master"
 PV = "2.38+git"
-SRCREV_glibc ?= "750a45a783906a19591fb8ff6b7841470f1f5701"
+SRCREV_glibc ?= "1e04dcec491bd8f48b5b74ce3e8414132578a645"
 SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.42.0


