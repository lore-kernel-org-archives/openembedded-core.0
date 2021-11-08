Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA6AC433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 08:08:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.41991.1636358909541490643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 00:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MU2dS/K1;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=69465cb01b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A87OVRs007672
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Nov 2021 08:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=cQif/bQIBBPmPBbZe+6p1hBT6zDd7CbU/47IA+rBaLU=;
 b=MU2dS/K1Wl9G63AB6lRPVVdKMdimFMo2IGkCHu2nqG1z0C1pw7pFIBbA+iSZDZdYpDLj
 VQMxDOtrwXWr9nVsuagBF/wVPbmM4BDwxT+EN2TqCHM6d2hihysb8jo7Y3qUkTueDW58
 M/w9dKsE5EaF+CslpqqWVih4UznQYwIl03bEZ2FOHCa7QG6iGKe5DVs/f65KI/KpLzQr
 vCJuJK8SLkOZZgAZ/sBdSuEaCJd1J4mwbLq1qXE/1/Q3JI5ptOXObmYNmDnVz2PqQinv
 TCYXCYWT0hixiGdCnDqs3GmI3gmmVXmqhmiv0rUIyTbZ2nMXd0JU3jETPJivI7Av1q64 /Q==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c6rqag7sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 08:08:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrVKttS3aMyokfuxRwCLSbJRkuwobxEqjc64gQYupXe9F1lrKvHLFyEcgK7JGP1uSaUGQhJYdDNYTcikX88P7mm0q+3PwRe0dztkqMy8yRMeZFqCHQ87jb7bIhn/0aP6tad63JBLqf0ag0lFko/eLUWNfuO7Ahd/A3uxgVf0JOYUUo226jpmfOu6Wd7aS/4Iawy84mPwd7/UxhewOHcoZtJ1Krnp53lgxIz1+j0859CUxjGlu1FAjMA6rRcqEnS3D/E9EO11oVhFDhnDTkTU608RhGwkr9AACTv0lKSjNrBR5H1eMZOrJiOWEVcTbomHhD0DlOyNUc9elidSXMnC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQif/bQIBBPmPBbZe+6p1hBT6zDd7CbU/47IA+rBaLU=;
 b=l+z8IoKHDitqTjsiYYOnvMfANA+X19eF+btBvAI8Gqm422R+qtGX2NnFKKXWD8dDjm+JtYC8ocMR3b8UH72bJNOMN9oYmj3mq1mphWjkSCUosnanePNG/q7ievZDj0wJ4xnjOtKCmvQbGoKfqa/qXkA+TmgpmvvBXk2bkHfoWjr1FwxU2ylZdpxEAwYnLWifWU6XW+nLSHMVE5LvRJ30qrhPgYvhsAeDgywQ/6cU++rtj2hVqZqb1UmLyEd/2NfOKl2+Xc5UU2SYJ0d9zI5TkYh9OFoZjrgDvJg34kRVI4FW7suXWG4ori6HDZHJcDAATdP3Fb/UHqut+yHD7cu5Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Mon, 8 Nov
 2021 08:08:26 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b%9]) with mapi id 15.20.4669.011; Mon, 8 Nov 2021
 08:08:25 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] avahi: update CVE id fixed by local-ping.patch
Date: Mon,  8 Nov 2021 00:08:07 -0800
Message-Id: <20211108080807.61655-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT2PR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::34) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 YT2PR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::34) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Mon, 8 Nov 2021 08:08:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 898286a8-532d-461c-1f54-08d9a28ef0a5
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5651765B87388AAED6C0A9D9ED919@CO6PR11MB5651.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dYeyEgZHp9/pj+KZmkEmpxbZh2st/xE88xLcjVghS2IqcYYETfWPFGWdjiH/Ot8qymiBNr0FZFGKnbhkKgKnZk3kDUePKQLNLX6XxnmcbkfQQSIvHZAgHLm4i+Kf9vpQjM3MVLW3oXw/HqtJlD+GlDbHIGe71pn6pQv2TgH/yaE2mfuTiPMQbxmunCj3qzKlcGFQcEu0dfF8KqFfNBqVU4VV37cLJ0sbWJbuVCLGX/tPfoTaYGJaZW3cSP++rVmxqm7udnZsxEfFkmnXT52Byq3tA/gjtL82FP7Xl76aAbvk+DWHdD1Q7MQh69cPL6TS873svP6GSUeJC+IAMT2XekobY8Dpd6uswIiBRTQiftkFfUKIl669G86lnZCgU+jYCrflJwHu25XpggFA51zWcghhmnLyEBX56mzVkcxRjYTsd4B/5FsrbtL0PE+bTLtKk4Urbtc0rp2tAFethENRKtPu6zoIsAD0yXmAyIxJrTTYfoqW0fVMCbaEOcw4DP3juQ/L+0lImKHk9FBZL8uNJyGyJwmlNouBvfVnShQGoWmu8wJAuaggLAtLWaqKmQaPp7IezWYlbOTOktdol84Lo8y+Jj2EZx62R0yRtnBnY70GS2t/hb+5mNuCTzGuk645Z5tgWIjeKCylSM652HNVoVh9ZGrSAbTm2yi559kQhoTFUxt9fBWSbCj7jhg/xyUc9P8MCwRu+o4NECDGHEXWPg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(52116002)(38350700002)(1076003)(83380400001)(5660300002)(6916009)(8676002)(66946007)(508600001)(4744005)(956004)(66556008)(2616005)(86362001)(316002)(6506007)(6666004)(6512007)(2906002)(6486002)(36756003)(26005)(8936002)(66476007)(186003)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I2bobePFMp41zsHrz8hGWSuyWcYB8M2qWzWFoCYkaNQfHkqeGBx33DO4hl2+?=
 =?us-ascii?Q?fjqBnVygoo53yg4egXIdn+RSsftxyaYuydienr1+0JGpE4uK/TWOJWRv4mAx?=
 =?us-ascii?Q?Ij0jG80Oj26YT8SwXE50wZ3/ampL+ZZ1oqKgrfUJfiJ4qMbwZh6et0DQ6BJg?=
 =?us-ascii?Q?hMm/zibDhr86ngkmVBvJhLmgesL5wauCq7qAoeQhTtGnq0zKxQqvUjrncqk5?=
 =?us-ascii?Q?k4g15dIMjUg0cTzjAK2FpnYEIHLA4DvUegQl9glT3C1AnED34s27Dy4J8GyD?=
 =?us-ascii?Q?FHtKSOd7CinTIwSSKrcClwUtAbusSVESwi6sMVYyOcSK5QN+uFsbi0ZPGbaN?=
 =?us-ascii?Q?OAohagzT0KRDavxWrjkAIuU/EJ3XQHbHd9+Q5iPNxXMwd87pH0VawJHu7582?=
 =?us-ascii?Q?t3QOa6TJo41cvM/MA/M61AXgfqSfAkz6SxgTL9GoEfFMkqT8cA+SzZ8BJ54Y?=
 =?us-ascii?Q?MOcUQ6GsuUg9umIO+Em+zpq5QC/UK3tM0TSA57c108bdfWU/lB8GnB7zNvq2?=
 =?us-ascii?Q?QjuGbV7gJThKn84UezMTaf66JHduSlYIaEwtWIKikjW+zVvLNaj5zNe4Dl8O?=
 =?us-ascii?Q?gfey0gPhYKJOaUHDOR/3DxuwevsWyw6LdgLXCYts3z/a0xrW6qrv5FoctJ6h?=
 =?us-ascii?Q?uk0/BlSgMISUjJW6yrLzA6SQ2gqeLVCEzgWvs2bhQt72sWq9lNT3F45AabZO?=
 =?us-ascii?Q?V7ICkScH6oti4JiXncilKhK4bMoHWttUkEMv4tQPuzd00ZDamg0zUzLCPxXC?=
 =?us-ascii?Q?9J01lvlkBoU7SBUE6UEcwJI5XF3oKLoDg+vAoRgHU9sUV+qs0pULYmYaYm/r?=
 =?us-ascii?Q?V1okzfHT/1kHXNLx/STKos+LcGwJroP4k8zPZiItLiCOoUkgFUmvfkFsdpwL?=
 =?us-ascii?Q?qZPlsAfzt5logD29eVKUFx00Fa8bcOYKDZB9ibnIg4oRYFBrESD0p/o/aeBP?=
 =?us-ascii?Q?iZVbESGBaxU/lOSzqhD17RnP0kEkeDdS1rfmO2bAfZleEEOs1ZcWYVhhfu+G?=
 =?us-ascii?Q?CiBHykpPr3NNDw76kYMynuY2lNxx8QGoMfCk+Iz7zr50FwMVJ/WKrc5fWNpN?=
 =?us-ascii?Q?JRpreAJskc5q53jSMNsOhn23iyAaCe15gJfkFI7W33qNZV7OfmGpevtEGi9R?=
 =?us-ascii?Q?y+IjFsSXRQi1GM8vphckq8gvkvwnOe6OAwRVl6ZYRnCFEv+5TzRkjn5x+x+g?=
 =?us-ascii?Q?dOUDSn3BmQkATuE7djk8RMdRjehhG0mYdehUFD6jhCcPKvIwtkp2mMwoiCh1?=
 =?us-ascii?Q?CR0aQE7rdOzZ59ZJaZ/T3i7CpaXhEqnbc2LZ5dYhiaH790yn/NVzGhoQhXrR?=
 =?us-ascii?Q?H32hmjRdQCowOIW1UtnpBH0Zbmbi5MiEQbBx/Y4Mvb7dCoiVqHsAQisdibu4?=
 =?us-ascii?Q?DyS8yrneMbdzXrbNBhWsAyBkm21bx849tNays5N1AFTC9h1w8yTR6cbs/oXT?=
 =?us-ascii?Q?X5Tl9H/Ns0v7oFysw2reUT6Dtxk0qO06o8HbfqlnQODETn8NfGvcgd5Y9Fne?=
 =?us-ascii?Q?B6ye4lNI1/54GT72/A86uHUbPCzjijKNu2LIyMpIKf5OYieek7I0vxNWidyf?=
 =?us-ascii?Q?yBqj0pfy/r9JNCddcn8DIa6gUvbUKfgfLx59h783ciFlLhTZaCCX0xQgxss2?=
 =?us-ascii?Q?KtHDNsy0LAZ8CpmUsy1U+Fw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 898286a8-532d-461c-1f54-08d9a28ef0a5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 08:08:25.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UAmtjnz5qF1FmuGYlv1y6QufjXWg4o7h33GxFcccMMh6GVolL58wJNIfURs43m3hbt+PjqicMzS4aVkVp78Tlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5651
X-Proofpoint-ORIG-GUID: zNPtQ3hQ13sspUQ7TI69yTii7JZD3zxf
X-Proofpoint-GUID: zNPtQ3hQ13sspUQ7TI69yTii7JZD3zxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_03,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=636 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111080050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 08:08:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157966

CVE-2021-36217 is treated as a duplicate of CVE-2021-3502.
Update the local-ping.patch to mark it resolve both.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/avahi/files/local-ping.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/avahi/files/local-ping.patch b/meta/recipes-connectivity/avahi/files/local-ping.patch
index 94116ad1f3..29c192d296 100644
--- a/meta/recipes-connectivity/avahi/files/local-ping.patch
+++ b/meta/recipes-connectivity/avahi/files/local-ping.patch
@@ -1,4 +1,5 @@
 CVE: CVE-2021-36217
+CVE: CVE-2021-3502
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-- 
2.33.0


