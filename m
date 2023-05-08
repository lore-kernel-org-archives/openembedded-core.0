Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBE5C7EE22
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:11:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.103624.1683540703988710052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 03:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=V9Njew6A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44921be6e8=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3489pRWv003697
	for <openembedded-core@lists.openembedded.org>; Mon, 8 May 2023 10:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=KcGnfwH8pBV0Wt/sRJHE1F0Gg2JsLHn/L4UYwXR260k=;
 b=V9Njew6ARF6aTpglp8BNP+p4jh3yc8GEkbJgyYfQp7aBYTXPx4/kqHEDy28tTUzBFlX9
 iy1WR6N/tjg7/66KVqfs6Fs5UFV6wmbM3WTZ7YPAWslYlKcuypGPhcfs9ZUud9IACMJW
 Hv4KguawoRMTPUkZPmE4DPpSPHOyTb9GrKePz/y5viQ7HlwVTOf18GnwHIMWBlZTxc6/
 3PiJn13dTy7gx0ryQU1H/eM2CLElyZIpkk96vi52hEiKTvW6vRKOnUkPdj/lfrwVl0It
 KeZpL2oVdFmvjWyh4lOMX8FHP2pvP2Pgp4SBCPLoNyTdt4hZJAUBhZeO36p560B2PcCI jA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qdc441n7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 10:11:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feYgXCCpuapcjXW/eOd8U56OX4Tq+RhUgxKZ33DvwOg7u4vXzgQb0CMvoKo/aWaT9HrnipqlTtxJL8SJ9VknqLBIA0RmNx4ZQ8USEAdW5i0QiO8yoaxHC8LcoMhUX/JfpONgJ87ByMBqyI7Aj6D1bqKz7F4ao09qckppDNH/kiD5WQiVBgujpS4/1Nf14UbeF14wE6jCc51K2gEEx2LFsISPbqlIj2mK9RYOLQTpEjgEOKvnpok21sGp9UvnGf0S5sN09hZrll3VVkCIN6pH+U9y+/g50UbbtKqmUlVufLECL5RlTb6lPS0GDpLrlaTdiHcmp1IwJKdWQftiyRnVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcGnfwH8pBV0Wt/sRJHE1F0Gg2JsLHn/L4UYwXR260k=;
 b=BIRevWXxyVR4FVvMZrtzGMhwdkqrWRjPMYYDN5tgDMa7LG6an03ndmi5kkv+3Z8N4MxiRztAITf/BKxGTN8szGB5hftfnxfFFZ8JIh5UgBu/BASN07bsFIHTFKk6nsMIcztyl7Schk96qkNFVtuDU3wQWsc8iFkBufMKXebBq+SvLCUbF/DXllKkMaFMcjW6TkFs0VJIMbvLRLPMh+ZzzC5Gd3hjpLxqKmcBbh2+ucYpoYrMgQo/JFbEQ8uWsRG4aslG44oby6KqiCo0jTXoiDagEHGqfYAReZDvs0VYiq0w9614adxbTSzFmu6sFiU05sUJSax1YGSb5D5pCpUmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY5PR11MB6511.namprd11.prod.outlook.com (2603:10b6:930:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 10:11:40 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::fa8:8cc5:a5da:7e07%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 10:11:40 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] sqlite3: update CVE_PRODUCT
Date: Mon,  8 May 2023 03:11:30 -0700
Message-Id: <20230508101130.3682240-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY5PR11MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: c51424ec-572a-4261-7df2-08db4fac9d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	p+P/O8G8snvH+liq8Hf+zctTdErl3NSuZ4C4ir86hGrxb+qt656FMzh6Ku580rN2isNCJ2YhHG6ja3ZoCUNByPFanu0DPknz1nJuQ7hd13L9s5iOfDqE7y9R/0ceT106t/BIu/AYF3p825H6qRxluQOQuk1b0Sks17tDt/x15f1mIdP8xeFjK4xFRpT/f7U2jE+zhhPA3LqrHmwOZj93sGREoC4VZvZDjTpP4xXEly6aASyKCK3QVlj9R+06fiR8kW1kr1j4TF+lfoMW+O5cC7itw8yjazN4Oy7ayR/8wSq1s64GNx77SBwoZ6CGSMqBfcbYdwWmucvHEKACpGzcQLBT0zpPRBhOWUxvOs060QNf9KclcjjEkQwvZ+56c/2hqk75fdYpaBB2TyQIK5t228LMFaghPOzhfzg949XUIJgTOD4O7FDAr5rdcXAxF31OX1enbJKDLpz1ROk78DquvjzChwWU7XZDi4aFcFQIvFhfLVTU42vS9kMtXKGKvexDUGyn0vfPwLzgl8JuIwlnJqSyPN5t8c6GT2ofXe6NNxGOJg1Bc23O2AERFg8on+dNx6eyr3zp6r8Ndb0MaWkZ1xSwBPjdwSSBQgatL1ewODI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(39850400004)(136003)(366004)(451199021)(86362001)(36756003)(316002)(66946007)(66556008)(66476007)(6916009)(52116002)(6486002)(478600001)(8936002)(5660300002)(8676002)(2906002)(4744005)(41300700001)(186003)(38100700002)(38350700002)(2616005)(9686003)(1076003)(26005)(6512007)(6506007)(83380400001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FnqDDDjJHijU4yc6PnQWUbJHDexm9tT43Qczpt+U7y/ucmojHjAYCil650fQ?=
 =?us-ascii?Q?LKGU8T92B7auRKS+NqvFkZIP1KzfMAnV6XeFFCCxJn6GkRhgvh3fVtrJ1DJU?=
 =?us-ascii?Q?/J39umo/FlA3rgSw51lJch4hHlZY/YNEewzoJ3Sf4GS1yBMC+Ds7k0rTU0nP?=
 =?us-ascii?Q?f3kX713SVovYLe2+v5tNKT2u87atYqO4of87SuBH58EJAUwHjB2a29nDkr4h?=
 =?us-ascii?Q?Q3SsOJIoI0kVb+4nKkO8ycOwvu6Rdl0P6mSJ8d9VwDEZGgDXaE74eXEBGU+W?=
 =?us-ascii?Q?quTZOZfuGNX1p7EjFuw/CR8vWUrZMyJ7OELPGfR8vitUx/XHfM7B2jr+do5H?=
 =?us-ascii?Q?LMQhI44KNJgK9o8hmblcvgXOs3Lihm4sR2NFXHlFp5bGwiX4fcc53hK1L/vi?=
 =?us-ascii?Q?3Zd87TP48fZIazGsxKht28U2hv4PPR6t9AdqJJ3Qgeuc5N/ssEsMguY7cEbj?=
 =?us-ascii?Q?goc3oNFlSrc+zkZcyaB012ohQj2Rv2dH/cu7Z7945Uz8rASGfW9LCkOqMK3S?=
 =?us-ascii?Q?CO3CSUGYkloR+rjAhjxKurArDkcMkwZSFM2T/Vg5UYTm3zKHfM/sOxgdxg3c?=
 =?us-ascii?Q?4XRQahiq+vTJufJhVgChDZkKBxAFTmSdEc11foqvq+lLV0EutTPBjRsdC8vP?=
 =?us-ascii?Q?RAf92siZLCtY+fG7bXKi8ibkZyKaijLs6Cp937P7UN2TSj1lbEOWOwUrhWp7?=
 =?us-ascii?Q?2ibt2cAg16HPwUy8a9vD6Lms+1WLs71ZzYK7ILMPCjQKaqOW72WaDKaYPZ0j?=
 =?us-ascii?Q?EhnPaQfY1z8rE/jDhup7LdVbVhwTIqhvM1BUOE3Squw5SKiHVTfRl6gbbTZP?=
 =?us-ascii?Q?ODWdy5n7AWEXRrx9j5Mw9wq3EUNhs5zXNxq4LsM1TDR5IdZrl85jxohtpOP0?=
 =?us-ascii?Q?gXSA4xd6Q1i4uEZ7DiJhWROun6zSHAkfmLo1pGc6CFt2czBgtGuNe3ICyWJN?=
 =?us-ascii?Q?8TfnYg6dQEL3sSJhDwAiCSjTOGS0aUtmTu+DT+eM2w3AwG4UBVaN0BGvAhBD?=
 =?us-ascii?Q?WmZTtHqAcvdkHdTqdPnz9iORxDMZJP1BHe349vDUCDZEUvUK/TsMingFAvJJ?=
 =?us-ascii?Q?gHRFrL8ssjlH8cQ/SoxKRhYgVEfFE/uHKDCaI5NwWPUHKA59/WIzeP65R3VB?=
 =?us-ascii?Q?6JDbENYxDJLjRlfHJsgQeQUFwLY7SPeNbwK4dVeGWa485V69BOGQ23Hj9wBq?=
 =?us-ascii?Q?1iWbz3ee4NzZtXH0EcKRNQ1q/hs/NoiN1v4xX1jX34anlYjDL5fLKwjidFKh?=
 =?us-ascii?Q?k2qOVeNQGXogibZCheUmx1KKq+bLXctpZrNKQTwyNNWJOTQWP+54BR4xjOmJ?=
 =?us-ascii?Q?E0VkLks3Jrvb7crF79ZOx7sAwvKbbnUl1r000clyKU2yvXUec6fAh+7AlY5w?=
 =?us-ascii?Q?sZLU2nS/Ie1vnei+6BxN7+UC9UocHZzjet3pnF//BTSO6+1oFL5RLf0C+x2Z?=
 =?us-ascii?Q?oO2UVBua0VscU6/78IG4Hm2bmgAyCtLwJjN9ug1FhwbL0FVzxQ49XnPLpmu0?=
 =?us-ascii?Q?CUMYK3yYdoW3H/Asrbuao/JMUSc/ZC1c9jtyzp9fNNLCMe856rMjbHboQZJE?=
 =?us-ascii?Q?unDvllI28iBqxGCcoRtJRubWI37nZP0XBdJbVWRYQj7Njp6Go9r0E5WWlSNq?=
 =?us-ascii?Q?pQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c51424ec-572a-4261-7df2-08db4fac9d70
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 10:11:39.9482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iubFGP6kg3H4HOigZZOOOUZXcU12PLjHq9jchzYdd0MRdX02cbL1WABGJic+vCbec18Z8SOsoXdBElvzkpXeZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6511
X-Proofpoint-ORIG-GUID: ATlMcJP-N4l7jULZyOhpF8nRYZxPmJof
X-Proofpoint-GUID: ATlMcJP-N4l7jULZyOhpF8nRYZxPmJof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_05,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=646 mlxscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 10:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181019

From: Chen Qi <Qi.Chen@windriver.com>

Both 'sqlite' and 'sqlite3' are used in NVD database.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 9a0de08553..c246d42fdf 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -18,7 +18,7 @@ S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
 
-CVE_PRODUCT = "sqlite"
+CVE_PRODUCT = "sqlite sqlite3"
 
 inherit autotools pkgconfig siteinfo
 
-- 
2.40.0


