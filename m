Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D342C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 20:44:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4501.1676493850272025304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 12:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VewexI/W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=141000e515=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31FCvwf8002239
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 20:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=kF90Ff/u/AqtdMGCZ6c8XMevI6PC2osEJcGRM+bo1rg=;
 b=VewexI/WwouwkeyrPnlj/JEjIeOOV8WQafBkvsUcorNycT/jqqZhPTTkWGYZw4rgxe95
 4SO+9tXr+dcFZ3I5IhQ2r6d2m5gW160myArhEqrF50e0AMxdF0I83fVJjB9LWiU/DceD
 bNeeX0+cJwLE0Wq+Cz6cj2bHJcT4qSYNBo4aGcptKrD0Uz9eKxNwTHqZdavNdZ+WrhPK
 YCJubehEIlBpy0/9YfVt0Sig4XES5efsRsGynnDfpyKQZ6TI4/QZZ2S9FNp8sUV3tHNS
 /3qeUfEgVk/DqtVcr40Pnjze65ZM0wms1RMQ7n3nUfVWYyMdSDrPt6cQXsb2N7YBLXj+ eQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np083c60c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 20:44:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ebzv042VOYlAKLPczLsnJD2uX0ks19xYW+9t/4+oCF5G8/MyX7rYDcG9pUInwANs+mM8vFzPnEgZr3aCc4lUijmZxurK/WP14ajGCTGjHj7A6GjFuGDeWH1NK8Qc6FO+xe/H+HtXQNxrfv4D8aUSKanbTUEx3W5Rj38qfB68VGG7ufeK95eYukZXtvb5bzUqqTv1xTj/b00fHkSsvbzWNUiPSXSws6F/HPGIpTGrrA+cAVOxOlXrw0/wS2OJeXDhgqe4khcW8xelYBf7MwYkhe1RbSVHOpyRW7rDVNzndALGoz9j+rw1iLfhBd/hoVhhjX5XG0PHEjfhsRWNuNV6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kF90Ff/u/AqtdMGCZ6c8XMevI6PC2osEJcGRM+bo1rg=;
 b=W7OpiRlOMU0pjlhihcH858wECPijSHv+M5MDw4LKjnElVCwH3CBTOHyUPQO/d6+Oa1sF4xNmusgrHKMvMtA1zNhLjv0eFtSVLgVhrVPGd9DBF9Jnn0ZmOsfqFTtWvph8KVN8Idl52vusPH81tVMRVP9LKAJL0yo1RMWmEWP/vdNYf0RXeWGNfV3L4rHjqrqY6mYzvbwdMcedSa0G2Cau1QT/iwhGX0EOitYsZxxqxqDgiiYBEE8PdaET4123M7w45dyt/GgyPn1yZMsIw3U9iMhAINk7hBXuTTkk23RNePcPIKvbAg+j1Tbfg92GEsNlPUFJ3RXV3e637Ym4OsrGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 SJ1PR11MB6108.namprd11.prod.outlook.com (2603:10b6:a03:489::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Wed, 15 Feb
 2023 20:44:06 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a16e:168b:5b9f:3548]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a16e:168b:5b9f:3548%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 20:44:06 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [langdale][PATCH] git: upgrade 2.37.4 -> 2.37.6
Date: Wed, 15 Feb 2023 15:43:22 -0500
Message-Id: <20230215204322.3540551-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::26) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|SJ1PR11MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d1e749-cde5-43eb-d3b2-08db0f95617f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QioFtsllqenL4d+iDlVYuewjrTrJWRAnn2KTCOh8Y86+PJ6qOIhmAX0BFGLO+AG5/GMvPVXfpn4kbu+pwqjlE/zrzJkZB4WbMUsB0BsgL3LahnYkNbnOPNi8+hsGhx+5mfPXqZnbDxTdnaC5lSALS4w8MPg6SDv1mW/7F7+iE6/BEln3I3UeNkBrYp3AJ5Y7wTyJivoSLPjl84wNG8jMYEZN5ca31xkYVyKQ9DPPslglOsJlt1TVQzhbH39+OQi6yHgvmW+Gx8Q550ee3gJQK5pREYAzMIf19CALX3V4fFJmgf6cIaniT4DhQgP6iG4aa/Uy0s7fWW6F2DXr7pEg72bwE9kWXiXpaSlnFY3ARCl6Mcwnr2N0eJ9vGdD6EU1xwcm+QJwNFiNkaZxYTN5m77B7WcyG+Qc6lSnFXEcRkOeAMtKlYhXsLE6QVyYkc04cDgNlxqql8cZSQd0NFEMtMxzSwd8ZPCCVeEkAXj2LqoeqeN20f1Qx8MHZy7hQ239NDI5Q3M1QjAaW+QIu6pCTErLI2bT8gl4hrVxQB3K3+EZ39/Qz2yB7Tt/ftegrD7j6PWNfZRtuzxYIE06Veghl2gScnThrnMrz7tx1FCWnDKYYZKx34SPaaIdgqpw2rnAsb3fJu4wlbm9GYU//4oFr3D2Mb7O3WG0i8sxxFkt4Q+wLNXH6dtge/hBSQJuv5Psx9hAOl2o9ssKek/qGEqX0MQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(39850400004)(376002)(346002)(451199018)(36756003)(6512007)(6506007)(1076003)(186003)(26005)(6666004)(86362001)(66946007)(66556008)(66476007)(6916009)(8676002)(316002)(83380400001)(5660300002)(8936002)(41300700001)(6486002)(52116002)(478600001)(2906002)(38100700002)(38350700002)(2616005)(4744005)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QcRJH/JCOCzkegWoIt7fjf5kZqyeaFi9QKNf9PdneGec3n0vJY+U9DfWPfIh?=
 =?us-ascii?Q?TgaRZ/HKowVC+71V4ZRZS5NLykAFJoxiQhwUZ4WNxNqaQSjinAlqLfvYTNhx?=
 =?us-ascii?Q?L3m3f+mbYj2LY36+/oVN0BJCIE2s7l4mNrSckt75rO0S1QoD4XUQg5fo33pf?=
 =?us-ascii?Q?nDYszbfHgGF5SOt3NpAFADAjHxHCTpvs/N4XPh9JPsw8lQ6sLsNagM9l9wAN?=
 =?us-ascii?Q?2i8C0Zq6+Ee4yxRK0EIJy96QSmyLGfw7QiZGzSi2t2q3PecmMMr2/oTMW+FN?=
 =?us-ascii?Q?yB7ELqkKknGpEc7T/vD5a9j5HroCGxtxatQaHQKpPJXpRFI5MP27uhmaznJI?=
 =?us-ascii?Q?e9Q9LHDgLJbXN8ypkkiDaJGwxHguOSZOLgTv/SD0jPDV6xLo/ydwLXKACp1L?=
 =?us-ascii?Q?ium+6Axut4Qa6GbdSzs2gWuc8buEyB205GCTTiUUaXfWE3g4jrmGOBA49+Ty?=
 =?us-ascii?Q?BCfbqAmYfngbodW4CwyQLi84kkCctvE8ycbPjXgJJrAyFI2o+5e/QUP/EJf+?=
 =?us-ascii?Q?yvYOZm4VfPmBskpOX9LjZ+MEz5EiN2Te/6pp9RQnSTtx52a/n8R4WFY71EZD?=
 =?us-ascii?Q?0tEPD824YiEGJrxTVL20El1c47spr6CbOuBG26szL96L5hvO8LRyQUahFf7L?=
 =?us-ascii?Q?bodmvCqlv7oCUDWXCi/7rMTg7zl00yv0sK0KQWtDi8VqrKyksOIx5rpdEtNV?=
 =?us-ascii?Q?eIMP9RHY0uiyCA/EHc4ySQxgeyuQVilr9DePoSpvLId8sxsc9AV7L8YCYwQa?=
 =?us-ascii?Q?JivwYRR0lC71STrs25p3auvCOzUJLsAK5SuY0dw2HEUqqIbCh2fTnSJR1Z4H?=
 =?us-ascii?Q?YkvyQenVXpCCYnvIy47IMktf2qX6KjcfAzTt5s1jQj7jsZ4GzpAsVXDkS6ww?=
 =?us-ascii?Q?qXDNfkSmOQXgx/qzxemCkFjhZD+ljEpFo0XVV8570djFgFyagzNvGVUUDuek?=
 =?us-ascii?Q?C2Y79T5DFyZpMYslPLMvi3UIduY8b7uhIy97VMWxHh6ew4AAU18bZj0rvbGx?=
 =?us-ascii?Q?SNlyTckuqVRPCqGaJ5k/DMrzOP1fqBDb7hWxbn1JlZPWSiNSvQAicO3UtZAL?=
 =?us-ascii?Q?Fxqg9ZXyyv2T/OyfGh4PymiO2IjSLr1hRQa7x3Cfq3W5moR73Fo7lL9xvLEv?=
 =?us-ascii?Q?Qg5tMOO2j6j+jpHj+5FkyOwmByU7TfwVs3ndq5XTL8YCoKofA1PFbsBhObfz?=
 =?us-ascii?Q?HtBSNQpA3VtwAwpan4RcqiPb4sV4UdDqP5qyaTZCRBFUH8NYqpOpoHwedO1R?=
 =?us-ascii?Q?F2qUjbANkyKPjghDuOuYVLE21laZLjMjvZois3++e76R26XjUThFT3p472BX?=
 =?us-ascii?Q?AB6Dc5CC/jEILoF1q6tE1+L8oFANrymA4Dqw1lv7Pmmvdmp0aOedE0HR/6Vf?=
 =?us-ascii?Q?Uq7pNmoYNtMd4jMXg0W3UAz2GLgaeEIfkXgEMxP7Tf6WNWxF2m9sYhYWzZhW?=
 =?us-ascii?Q?3WqV3MxLFNepB5/3zqma8pAdwRqUULFB3C4Pi1/LNFmRT9hosXRXhjNXs23Z?=
 =?us-ascii?Q?Iel9ChirDYIxgRdJRe5pT2A1V6kAP67LWYUYSzz6mH/mgyBXL0HYKjyTnqcz?=
 =?us-ascii?Q?cN96KquGFvIw6iFYh6r2M3zA7i0vcBHHOiixovHJaiIIC9KuqkEumbIuLs9R?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d1e749-cde5-43eb-d3b2-08db0f95617f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 20:44:06.5711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dfuGpSLIbJMbPt9sOBcLqC6tg5mquAFr5F1Xt3svKIoW3FQLLNVdo2Ap8xT/6xtg9KFYNea7qpyzqId3qgemSTXQaPMJa1lg2TQ/BoZggQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6108
X-Proofpoint-GUID: g2-Lm2otD6MnUj5PG6IXRHcuscKidA9j
X-Proofpoint-ORIG-GUID: g2-Lm2otD6MnUj5PG6IXRHcuscKidA9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_11,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=535
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302150178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 20:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177213

Upgrade git to latest 2.37.x release to address
security issues CVE-2022-23521 and CVE-2022-41903.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/git/{git_2.37.4.bb => git_2.37.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.37.4.bb => git_2.37.6.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.37.4.bb b/meta/recipes-devtools/git/git_2.37.6.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.37.4.bb
rename to meta/recipes-devtools/git/git_2.37.6.bb
index 2205a50d16..638b08a0cf 100644
--- a/meta/recipes-devtools/git/git_2.37.4.bb
+++ b/meta/recipes-devtools/git/git_2.37.6.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "a638c9bf9e45e8d48592076266adaa9b7aa272a99ee2aee2e166a649a9ba8a03"
+SRC_URI[tarball.sha256sum] = "626e4c338f72b170e2b3afb1cb2161f6fbe4fb1d0749154f1ebfb5f0a57ec25f"
-- 
2.33.0


