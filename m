Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF20C636D4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:31:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9823.1676507475898444536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=j6SJ7H7S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1411f8ddce=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31G0Co8U000302
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=P4i0ptJQbxO7Kd36HYwVPsMS843SlbkCwonckYy0+uo=;
 b=j6SJ7H7SQnWH1d0Vkfyg3Ku8AZAdLkVo9Lqtv7AVPYCkUsYKFTyaw0KIwTHW9/yU0JGe
 a5ixbQKbjJH0K0OAFy3Yf3GwOdjJMBIWKF3679Txrc59DUDKNNpeL0F3A+z9NQ+UpMOW
 K0G6FQe4NTwuK6qjXExfFcDI+hUe0baEsLlPsTkKyRmJ0N/4Cmwgs6D6ntG4ShwplTCB
 q4fPLSOUF1bPhwF5178xZYkin0B7xfkzYI0nLNICVeMxl0WOhOU4zvR6XlKuVANvmn0H
 y2Dr5cgitjHm9bnOKI3X6Pi0t1DTMxZAB6Pnoq4clbZrRc6nSu9Rw2UsiUuD2SJnCwtt QA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np083cbxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:31:14 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31G0VEBM002510
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:31:14 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np083cbxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Feb 2023 00:31:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdsHZPbeV+Z/UyWLwsOHYBFJvQbt4zM8U/qjxd4LRKgyGkUehKOJTHDevGO0wF721gpx8Lac6qzp1dNPRYAj1eaDruccQ1CfXK2jcP399jU+/tr/q14ao6u8btwA/bb2636PKw6oQuTtJsw22qgGGLwS6YtzvSE1A/qT6jR3Lrw2Xx9/zYUwN6yBY9r8sOMTW4hvmkEFukNTfwah+cGEyYlr8Uq61X/DpyDl9Wm7Eq7zqEU+lo1ak4armJrEYTVtfTEthMKYvK9z6n3IMpQiD4Lor/hhb9JSBgY513TTG4a/I14t9gYoRWn+Y62yPyadHklmpN0AhPfruLSl7LxfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4i0ptJQbxO7Kd36HYwVPsMS843SlbkCwonckYy0+uo=;
 b=K9XEExETaV2BOGiBMYs5jNd8HtWnhXCzLJa/5QfnZ/VsA8kv62uQagWYBLX+ZQExTCORD3gTKUcjQ4RbgOXh7Y/dV9t66Lh58AwFr0kS8KEf5Sw5maYdh/enC0u71Bk5tMt5z4/w51GsDkQXIEsTH1U77827R/yfRyeujXPvwQ3rCaj6i2HK2FVycDV7ZKy8pZTen3hPJ6T8g3LEaw4S6QU3+868N09Ederl3KcgoDzIWWBdebpzXaqVENbZJsuGc7oCOfmBXpeZlwJyKkhapx66Yb1cNKsJ9dC6cDjWFWAZuekNx6jobyFB08l8L08debN1BMqoyvYjXYqTFJlPVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by CH3PR11MB7820.namprd11.prod.outlook.com (2603:10b6:610:120::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 00:31:10 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f%3]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 00:31:10 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Subject: [PATCH] create-spdx: Add check for variable contents along with quotes
Date: Wed, 15 Feb 2023 16:30:23 -0800
Message-Id: <20230216003023.4153138-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0119.namprd05.prod.outlook.com
 (2603:10b6:a03:334::34) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|CH3PR11MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b477b4c-04c7-4b06-d042-08db0fb519bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5HTLEcTU3uNAA+IB16xPfIGTFg7iotqn8xnzB+y1KdTK2oh4T9T8Qf56RTwY3vev5US6YA4olbwnnD4qpjuolkT4k+ASCf6kcamh9O1wZUAH80Rn0znwr3klcK9ba9adsuRWWVrSigS9DifQoPhE0ChyTq5VTzId4Os46WbLYyM2tdUwqRc1oscqtdQQri3570tJPV7fc4j194oKcUE0DEJDN9ROaMSNbEzZxCkknBMgPCbvbBEZfEqqruNUlhHCWH26bLGCdKrCpfZHtscG2UcQXFulQ5PIybPqBJmU3WMo2MlBgN+15yiu61Hd5DyQrqOrdpl+2gmmnBQ09Q2NUI5K3/uTCOrQNBL5R7JJC1WfLbmGJAtyxdZbGxk7RWOJHNF+DIEFPNl6ZSgjtMGilobm7FJeIqnWGHESf/0KuxhRaX7TAcKdw1mlw/SJRjosbcYLl3nn8RZ/2GkAFppheTNeMmyq3qMk/av2VEoAEg43THzE9RR6vvAS9mRNyTeXAvY6uc72lIC6J7BRVeizweFEWg5pAEkqCwcI2jRmBoQC2IjzKaiAGJOyZRuVHNX3ai5bL9tAzOPtTr9vkDOaQgFM8ngfQSywiHhy5d9r1Dmeyq/oBLv7iqSuzcaORelkdvcdBPBi4mVPaRmSdPyKSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(136003)(346002)(366004)(396003)(451199018)(38100700002)(2906002)(44832011)(83380400001)(66476007)(2616005)(86362001)(66556008)(478600001)(6666004)(36756003)(5660300002)(41300700001)(6506007)(186003)(66946007)(6486002)(52116002)(1076003)(316002)(6512007)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GnG58mENkT3UVgRV7IjhUt7TND5zuTuqfFIJy+60zGYh/WOZ+ApzPGOYANDC?=
 =?us-ascii?Q?ARCLZzuuSi9uS1Oh7wtyM44vCJ/b9jpPUtUOeX4ZxGgJesJw7YLy5qlP6UCe?=
 =?us-ascii?Q?NzaL9vozkhEcZo6YCs0h6iV7L1lCRXvoo7wS+uNXLTkmWWkqo823IVwImkRi?=
 =?us-ascii?Q?5FKsjcNlFzs2Pmd95Mk+Zwr0n+nv8wEDDSzbb6EpJzaWI3vGDFrYVtyidDz1?=
 =?us-ascii?Q?mks0/blqNeVFSPrCHrxxXVviV92n57Ar2vtlNUk2r7+EF2VHMneO0ph3506o?=
 =?us-ascii?Q?bUDc2dkukvWqiEeTsUWEwACuVV+10kZ5wQ5fholT506v3o0yt2/G5UpeOU+r?=
 =?us-ascii?Q?F2W0xepgsX8jADhIyQf7z88rn4shSDYLDCJnTRH8Gs9FlDkMzoHvXodeo13K?=
 =?us-ascii?Q?w5wlCVTfjnJZqYGDbzvUeOpQhd79mnJghHDt9fSJoDHg3QD6Ip7enn4ZxDp4?=
 =?us-ascii?Q?tPQ0an3kOcO8fQ22gvn7fAX/z4GvIqzh2Qrq6dGR02Mtnt+Uacx+gAkoss29?=
 =?us-ascii?Q?QJ5DuRF4jgRAFGhqVuD1yjv7dIIq9ysGnlET9j0OKWctm1k3y/ZzVNB7jElQ?=
 =?us-ascii?Q?pOi+VxhhYZphUS5U6SKX92+GmXb8T7EC8xNKnLhyrhfPB7KqhNz838G1ESyl?=
 =?us-ascii?Q?lQOjoYYr+PDkgiwS8d11gE798Oj7QbTAHhqmXdlQOFWqJkf4UekJi0U2m+3c?=
 =?us-ascii?Q?ZPZSPSGEBnk30mvXpIDcBNp5mLqbjBPD9P1Nez7LvEvTUDiERO6/zREAQAR7?=
 =?us-ascii?Q?fkm+O3CS69D4KI2dq/zf7D031MElBT9I0Shd5W/8dVGUPtcap5yuMsmrJnFm?=
 =?us-ascii?Q?jHi6xlItWNWdB8B2YNLrOUOUPx0Vc9bA7x4UXsXEYufQC+FRUNafAEE/KRi2?=
 =?us-ascii?Q?OCvcRFw2ummUc9hO4DYegqWgU3L2yQIL6v9sdplo/T09iljQT12MmIqmWCgP?=
 =?us-ascii?Q?tOTdbJ+qa1JXOc2zCnOmRmyWu1f9ePZIWg5YLK+DFINAT4hefYENpWojABlI?=
 =?us-ascii?Q?iBJ4NK1DSkR2mNBYcY3lF97OLN71H4KlBFc/3BY/WGLijDS4QT79Oe2MlKeu?=
 =?us-ascii?Q?yIaIs0VXUYQ7Zwho+UgsbO6yDH1zUkoelGNSALxNcYKoiPT2sdvgyGExxmm1?=
 =?us-ascii?Q?s03ZEu3FCfKoJpWUWWknibh7UM4F/lg5cpR1RqzmT2m2KVJD+MqTcri7yHLA?=
 =?us-ascii?Q?dXccvoLmwZUWaft6OcVoFlLYT3jB8dgmG0Mw3nEkc1WtXiYE1Svey2rCj66y?=
 =?us-ascii?Q?i9NTfnTicpLvDadM6K+ZAZ0oa+YMqq2dZEncClvl+5APmChjn5dWYkyD15+d?=
 =?us-ascii?Q?GS1c402gAKMMXzGhmUlcC5cnBanWz/YxSBxmpV7fYSdtCm2PRWk0zkjNrfkR?=
 =?us-ascii?Q?L2VXf5ALrwG9opfT1NPlzollDz2rutIhHPDOyr4JL0BuuuHJ73QU8r5Rr1RW?=
 =?us-ascii?Q?b1fl4g2zUCnixl5CVlbEv/6rzn2I5U0eiRZ9aRUSlBzex9qeRnpGbJoWOfn8?=
 =?us-ascii?Q?y7M9XLwgP+rnzEHhyA7yzQOyqYv5wvSLx+se+W2sIvsVxzNNqQ6yrX8z950B?=
 =?us-ascii?Q?V84kakrFrPBJZPi5V+xlKuNooMYyxaEb0z9/xdC+wDVHwze0/gAlyokZaz4L?=
 =?us-ascii?Q?3QHki7hH6aTYMJALrsZMHP0X5V4IWh79jwTEdu9DKzkVJn9vSohev9Y2fOLq?=
 =?us-ascii?Q?3EQn7w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b477b4c-04c7-4b06-d042-08db0fb519bc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 00:31:10.1014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inJtC/Ulb+X+nUIpKZkd0/zqoDTnCthBJRZJLgDQqPHOBOrhj+dIa6ZPpLkFKVPiritp1TVX7YSSuSK7npgilg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7820
X-Proofpoint-GUID: 1bnFEzaw3v1GE7cwBg0XG97VXCgni7Hp
X-Proofpoint-ORIG-GUID: 4YQLjk46QjxshnN1lnGyEpA99lLlXLLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_15,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302160001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177224

This adds a check to ensure we that if a variable is
empty it gets an empty string, this also adds quotes
to indicate the variable contents.

          "comment": "CUSTOM_SPECIAL=''"
or
          "comment": "CUSTOM_SPECIAL= 'variable contents'"

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/create-spdx-2.2.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 28a42e009f6..8b18ada40a4 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -484,7 +484,10 @@ python do_create_spdx() {
 
     if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
         for var in d.getVar('SPDX_CUSTOM_ANNOTATION_VARS').split():
-            recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var)))
+            if d.getVar(var):
+                recipe.annotations.append(create_annotation(d, var + "= '" + d.getVar(var) + "'"))
+            else:
+                recipe.annotations.append(create_annotation(d, var + "=''"))
 
     # Some CVEs may be patched during the build process without incrementing the version number,
     # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
-- 
2.25.1


