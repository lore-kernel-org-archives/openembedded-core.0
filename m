Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB46C433EF
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 05:16:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.6063.1636866970481969142
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 21:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Hc0WpTSQ;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=695237d4c2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AE5GAdJ000691
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 21:16:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=TPeFb5eTihYjtbv98F4tzmBMtrDTexExE7XNoLmaZ+w=;
 b=Hc0WpTSQyRrcytBRxR3CcdZ4ttgjoSch6y+ASZPRuyKDouVQN9/ApOLs+QR3eVmSOFW9
 z64vupa4KqdK+Qaa6nrHvLKyv1I9kPpnrRj29JU2CygjjwOjrmYrN25dbttRA1QqfKJs
 4rQ8tBVTrwsPrgIckLS0vF47XWlrSWvqXVvsQhz5RlxuFePAeTtm+7EcC6cbIt7RkpW1
 bZI7VWMmzZg9IF7RuN8m7wvI7Y/rZKM0shDvbaTkKn0iMUMLB/H5BTMF9UB0pJKpZHUi
 4jGDlEqXcQO2d91UQoKTY+k9aCkdv5mJW2EiKvrLd15Xlk0GDFbsOQm/tIJo3lL3ttPN 5g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ca9h80key-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 21:16:10 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AE5G9Nf000665
	for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 21:16:09 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ca9h80ket-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Nov 2021 21:16:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYHl6NLoZefFjLiZgog7F3NLh6jWWKGZQY31Z6Y0wkDgVprhqdVlAMNnezDyh2t8dyJ7gJ5DNpZWuzXeJ8siOPIb9K5hTKbrGobUYU+b1VfpYRbyluzToIS3Z8n2CjTwCvKEJNxyMLLsA6vWxhOcSpxOCJMEP38cBEF9pI0Woi6zr9CW2yTetk19e4fHBucfUiGCMg8kLa44h4UR0CqD25xKVb1TQD/idTvOP1+EO4AG3mVUQOVqGkBWCZyO1lguidcZKbYmM3NlvQIDTOyklH321oFIBfK+1ENIEm1dANMkCSSQ9i5BAOjWNfjJXEd36yon13VHPQl7rY9V/H4+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPeFb5eTihYjtbv98F4tzmBMtrDTexExE7XNoLmaZ+w=;
 b=B7ZxYXeKihOe16FKz/V47eCwkuXlMQte811MJRgN9WPU2VBFIAmPb4APfiEt0MemYG/HD00KTEqDOrwXq773lsKB0k3AdfpO/Fo0Sl2vsWhjaylqyaiJgUHs2bWx1aWkqDVnlTM6xV+WXkbOlEZ7CHfzBfhEqjkvLIhoeXLBMJicNS2ylRIT4X4e1v0a30OKkfqgko0K259r8epJAX3pPIp1fYE1jse+45DCBeWzkdoo2m1Cd2HELs6mCBQUmZcY9oXOPl6ZazF9jX3pQk98dq7i/vIiolbgFR26oQkLyqdMBCo7uFzr3bPDhK+UApM2pkWsIzWaTK8EeU8dIa4whw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Sun, 14 Nov
 2021 05:16:08 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4690.027; Sun, 14 Nov 2021
 05:16:08 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
Subject: [PATCH 2/2] python3-numpy: add python3-json to RDEPENDS
Date: Sun, 14 Nov 2021 13:15:56 +0800
Message-Id: <20211114051556.421031-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211114051556.421031-1-yi.zhao@windriver.com>
References: <20211114051556.421031-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0167.apcprd02.prod.outlook.com
 (2603:1096:201:1f::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR02CA0167.apcprd02.prod.outlook.com (2603:1096:201:1f::27) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Sun, 14 Nov 2021 05:16:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81ce8634-63c3-49b4-4b3a-08d9a72dddb6
X-MS-TrafficTypeDiagnostic: CO1PR11MB4945:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4945A305BD07125B2D08A200F9979@CO1PR11MB4945.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LKJxxTA8G6cjkDpDU5H6EgvJxXg7fikQRMpplIhKnCtM52p+cLu8hHpX6d7XMTlwDDy67+5jqsvT1fZrw+lcr8MzeYulmdQCXtlPKYJnWePNYy6pp3EexchtI/bPMKMIEjkYg0p0vIBnuYjMMJwu1dPm/pisveltR+FdHA0FATf+0Eu0HkRLUrD5y+RJhBl1O7ErRjCRiZIo7s7Qh3HRP0PClGk2rrz584oDRz2rPJnLQk4KlqArD8IIwq+lwfAF8L+wRofal/aTm4owyP4dNCncKKM+snUQf72rCpIbrMu/wCNzIl5P2d9xYTk94nA+RWjm7f7anusptlFBGFwCV7k8nVUZ/qLXD5WtyMmaSQ76flzJzjI4JSmcTetL8yh8scLdDhIt4tx16pyDLoUPx8jnbDee/1c6Guz9z0Ba6cc4AGerLVIhEAHdSv82sQKtSK3Fn0smiBWeeUqLkjDl3h5xuRb8ftNAV5vFTzqzKSsiL6BBBM0zmkUV6J6AuULa5jBkoGURFAbMr3MWngELUnFKHYI/qDmJEE8HFVheGG3etr18dJPLYqacJP4BQ7qI/py30zf3AuTZCeUrnus9hpB6q+L+pre6d2YO6hIA/BH8y/vrHTRkKiqfPqLvlPMS/AqswZhYn0lqm02yqj63ij4wtZgo3fyyMRCBCKmVPvNKl4f51JI+CbAGNHu+QwmX45hw7Fwoc5lJ39YVIc02lA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(6512007)(186003)(66946007)(36756003)(52116002)(1076003)(86362001)(38100700002)(8936002)(38350700002)(316002)(6666004)(8676002)(66476007)(2906002)(6506007)(4326008)(6486002)(6916009)(2616005)(5660300002)(66556008)(44832011)(508600001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2XKZnZEweVgqlYmjyaV1tNluSpkrrpMG2Xj+zwM2dlQNSSBCEU1aYHhS+ttQ?=
 =?us-ascii?Q?uSca71sZOEJ+KzZK6DHMzdziMBRFK3ZYrzT7bY1XjQ1hbvV7PExrAjQOAej9?=
 =?us-ascii?Q?PBJD78+NH2nHpLI8hLRPFi1tMEBWHFOqgnP+Y8Oiz+vVEgyfOhmeFMKtdEpg?=
 =?us-ascii?Q?bzC28Xhpp0R8EJbnLcr6zh0b+a/9zqXzQU/mHpB+xjGKxXPLu/GXOVLTLA6C?=
 =?us-ascii?Q?Pk9YUwWdD9WcdXnZWF/qPaWT94l01uTXw9DtC/CTifXLs0xeXy6qX1jmuMko?=
 =?us-ascii?Q?kAsxvZnYcW1MvCNxE0wjc2iGifzFL/swqrJI3e0G/ZDnoBcRYKL2wLNIxcs/?=
 =?us-ascii?Q?GrTrV9AC8np1GSYkYZCBQUe+4qOCGg7YlAE4eUT4U2HijREXAuoqrdsuPQFZ?=
 =?us-ascii?Q?vEbxtD2/ZObvi7N05IRh/GeoFZbZFUPuilMo9HBE+myboimpFoRKkyBSzQBP?=
 =?us-ascii?Q?ZI6P9yv2GjyDwPzIkK6wDhwMyRe0VgK/uCu6Iqe7jyflbJWGLDJD+go4iOwD?=
 =?us-ascii?Q?XRfZTQrU5nhA+5kfW0BL0KdHCyEyAnF24YYE6rpUUIClPb+MOfR7reUFyH1U?=
 =?us-ascii?Q?9vUGTkGw2+jGk4Ldq9OUysdh2pPa6JUCE69tl1NouyDTsOvu6Nwg1cbZZRFT?=
 =?us-ascii?Q?5R/U+Wgzest3P7dUnAC9Bzu6HuoFnM/9QXGs9yn3OJhy//3s7zu1lYcqXnXJ?=
 =?us-ascii?Q?RAJfriHhtv40Kwl2T6lsRNiGKT4sTTEHVp3n0xLY47NIH6kHCzPlJJ8/mkij?=
 =?us-ascii?Q?+5psIPwQ3a919sjTIhrgQhME9RTFPFRvuhIp0vdHYGbKkqDN/Mw1QOTVW5qp?=
 =?us-ascii?Q?ZSnYRPDo9lNWXQgA6h9WVQKW5tPhWl6zXjyMSxdlB91CWk32MRImNaoEAObN?=
 =?us-ascii?Q?y3oTzDNZg2DQUIfJd24BdhTAU/Yfq5JeDRZzR0lN+9UXdwcEMUI/UOvQH/Ay?=
 =?us-ascii?Q?LppHGj6U6VuEKMsXvf8Qm6AFxGCDCn6nGunX2TevPQVv5AQ7QU5Sx3rORc58?=
 =?us-ascii?Q?7+xgfooER/bwMHnIg/NiD25XWAlDob9cabPs+vDW2HDxC/13YPyxWQkhX0/J?=
 =?us-ascii?Q?bMvR70wARfBV+Y9JDWeobsId+h+imIvmbCGZn6ej8Tb+B2S+Q8vAXo6cMi0o?=
 =?us-ascii?Q?Q6AkV3EgxPC4+jKb9biT4mXSWLi+GwFNSBVwZbGlplFqhJOG/cf1jdTEwEha?=
 =?us-ascii?Q?H3NFEi986b/ciDhoCkB1Hog8iCuOIYeKuS24Kp3uk8omZlkatAjvQFPloF4x?=
 =?us-ascii?Q?GEykOVumqz5fXn/VdYvkTOm1oYWh2loarYfCmZnoC8aFLT1vEie9tgMiK4yM?=
 =?us-ascii?Q?CJdKm0srshv/amfajtmw3A7ILBpZZZxmd7Z3zOe+k7s0p448kjEV/1aDx4Rs?=
 =?us-ascii?Q?tTWkqA0pieQTBobWXHCp8Ghwul0TVdv1B5LG8FUVuc/L4lF+caScSJRnl1aG?=
 =?us-ascii?Q?Uc7phXjkDmN7h8kGtpY8jpcsyCeMs5Q4CeO5v0eq4/yprqMkUTa1npCyjapn?=
 =?us-ascii?Q?fagKMHeZ/9ZmOQH1ws0wLXJBE2OizgxOB8K07ZbVdRLIMgDxQibtwy3HDbXQ?=
 =?us-ascii?Q?rmFF6ndoI3gcEvE/FO9/L5BfyoQRQ3TMcsveTC46efvNqk/ua6w7FdgBDdJU?=
 =?us-ascii?Q?XlalPMLZCNyuHQQNFbDqtIc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 81ce8634-63c3-49b4-4b3a-08d9a72dddb6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2021 05:16:08.7820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ms+op20RDuPBTa3kmn0ZlMz7msWaDEpxXqZDIXIXTYrV3o32DOQ0QrONAJHbbpBY5ugWk8QhspIosqU5/KKf8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-Proofpoint-GUID: YRgDLDc05oJhfjf4lJLDgrfL84S79ibP
X-Proofpoint-ORIG-GUID: dLA3FDQfctLBKklkzMtRTOeAD5qgKIXO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-14_01,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=870 spamscore=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111140029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 05:16:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158254

Fixes:
$ python3
>>> import numpy
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.10/site-packages/numpy/__init__.py", line 138, in <module>
    from ._version import get_versions
  File "/usr/lib/python3.10/site-packages/numpy/_version.py", line 7, in <module>
    import json
ModuleNotFoundError: No module named 'json'
>>>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/python/python3-numpy_1.21.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.21.4.bb b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
index 8988a5bc39..a3ea4ab5aa 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
@@ -47,6 +47,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-unittest \
                   ${PYTHON_PN}-ctypes \
                   ${PYTHON_PN}-threading \
                   ${PYTHON_PN}-multiprocessing \
+                  ${PYTHON_PN}-json \
 "
 RDEPENDS:${PN}-ptest += "${PYTHON_PN}-pytest \
                          ${PYTHON_PN}-hypothesis \
-- 
2.25.1


