Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DEBEE644D
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 05:47:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.40604.1726120020096797066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 22:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9985bb68a1=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C4Nege003370
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 22:46:59 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44dfq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 22:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpnOJg8XefLIzFCfKb7dnq0AVzw+R+rGGGETv8h77H5hGoCiyMtx010++UZEuUPudUywINoM3yI8HbXW3SHxhBuihtkZ80+gyy8E0vnzJvezDVIkR+BsazvINH5y6S8f+9PQEfS1l+pjdaTEmjCX88L7fkY3gPdmeRmOny8k/FGxoUEpI95R4+xmAmVXVMy4UjCpv+g1nXf0fYAN7mbnYfyJZP3NqubDSz2yYSnZPk46bHTCcOh4lb3hhugVXPMon5cQv8YY/Xmy3pifinzu/BpFTYMHJ/SJ0sCciyu2z8giXrgtO0A520vlZS9cL/imyS/wUbVMoAvQauKmiWY+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUAJ19lsTMUzVIOSSsAToA+kRnTGRFCfpyVMm2tMHWc=;
 b=Su4qNSt+lyqKcLLfk5mb+2zQthidWKNafW+gYkLIV5k1o42HeNLrlZbMeYLZgDlb7+sv5qu73I225z/wjci/93RUvZHu/HgiiWBNhlsg0rcZzP+/i9xc01lplI+fA5vjJFq/5V7l/sk0qOzVuy6ewi6T3bODWxiSfNzIc84Cn7gyKp5JufPIJMXtqCGoI+ysopeN1IblyJVsLbwzTr9+DNiLoFDZ9qRWPDErZPG9qXN6yLmJkf9RNq0UtGu82347PNzwq1fky+MiM4Zc48pr0E29jR4fDdZ8xtNGHaKD0B8l9LJB3AYyqCtXqWlmikumjWEuardAcb5wUAQYhLJZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 12 Sep
 2024 05:46:55 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 05:46:55 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH v3 1/3] binutils: Fix packaging of bfd-plugins
Date: Wed, 11 Sep 2024 22:46:26 -0700
Message-ID: <20240912054628.1539323-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::22) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2a3679-9298-4dd1-ba45-08dcd2ee4efb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NRpBiNL0iZjfeBZmc2ruM6WPELGDfyuBfwSkCS4EpOhzFa1HhhSE3Y4GkdGE?=
 =?us-ascii?Q?T6GZPBUcHOTBtkm67eEeMZBZASX1KUr4lrjg+w6qbqCfiQmyNNpBD7s4GNG5?=
 =?us-ascii?Q?x6Qk9pKCLnxkWnUAb9xSGdQcQQftoCl0ItDHuh/PbTWCL0DaRPI198sYr09r?=
 =?us-ascii?Q?Bec3FHb0HY2oTea69m1gn5aZSSACSRAXtwNZZA9YERZ1xONbnuWyhDHD8J9Z?=
 =?us-ascii?Q?TQmH0xRgSpPWtrT5cGmSHujALiD8LWouP7kyZqHrvhxV+iHVxAMCGMabUdWj?=
 =?us-ascii?Q?/zpA1RkyuP48ysh0aCQgDgX98bSVqqQbcZb43oH0w4QXLagYb2sPZb21X3uj?=
 =?us-ascii?Q?0fSegt4qab+pCtXhjlUkgilxZ/I2YwMk0ebhEOS0ijFBcR9t+foogk8giPZU?=
 =?us-ascii?Q?NJ1211JtbZjhvYa6VzcSqoanPLnMIoo2/V1ePXHXqYBRgVbjy+eCBxxiEBfn?=
 =?us-ascii?Q?2ncDtlcpzuBcfWdHmdIB2hTNinhSMkghV8eb835tRSJkDqoTd1o9XOw9Izog?=
 =?us-ascii?Q?1vZ5hw3w0VihA1vwvwR88w/hzHx2CCultJqFwXau79mdYERhpRQcad0oFDTe?=
 =?us-ascii?Q?Z3BebsCdnkqnzlK+H0ckCxXmaCGuRqo8CbeoahgVT2dNxuNRYNG8KphFd7/O?=
 =?us-ascii?Q?EO8R1gO9oDrcXAYvqgeB161znlpJGbeKh0wlZup6IFtmY8lirLOJDVRbD2lj?=
 =?us-ascii?Q?6TiJ3QiR8UCqxywhO4bIaH5QR1chBLjWME4i11kf3BzdUtIzByDN2FJvqavv?=
 =?us-ascii?Q?JTB19aF+LXaNDWKhw3aQEtnS1vXCEKSYAaIjBh7yin2hdVulRbyNowbCkVzq?=
 =?us-ascii?Q?8j989uqPrBrCfni7gyNgIgtnT4FVe+6cYcAJymDW77AGKqfayLqAFw0pMuNH?=
 =?us-ascii?Q?Ud4ghNlkCLfqpjCQV0kGjdZxY5RRQBTUjHBoJDGlK8Du8NEN5pddzPHAcp3t?=
 =?us-ascii?Q?W3d8Z+LcX5TdAgG0XS0uy+mNWtQe9+hXiJTP5kTRmLrCatg/UoxR2td7CcwI?=
 =?us-ascii?Q?LcgrEsz0i/JVWUq/Q6U7H6u5OPE6cs8gPUMjOBLrxXEc+C/bi4HkG5wkDDgv?=
 =?us-ascii?Q?030qvTJGZhRCA72/ULclUC1UJ0Y+x5qfsqnLIkTv78ceeCPyXc9n5GiahK61?=
 =?us-ascii?Q?V9muHaIrd0A4qQHPtnvxEHK6JjkhLwhJTn0xFnNJt6k3AZqBhvIjkMlJ3kpZ?=
 =?us-ascii?Q?jrmjzqkzKHrXHQtEiOGHZfkfEIbsng2L/Jp6mdNZyOfI43UnSXXENgtGKR8S?=
 =?us-ascii?Q?t8UdCRRWv68xTo84cg5a2VnWTAvdNO4ygGllF+v+Yqmo5Ga65uzgXlFO2mFM?=
 =?us-ascii?Q?rdL1Tcpq/1XuyG0FkI2mgsXSXzeNK/+N0u5iNsU7n6ip8HRCg7Xa7E4bdfgZ?=
 =?us-ascii?Q?kioE4cI3W1aEltFzoSpECGjPKtEiIkqZuAXBcEcD4L/GaaNBLQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NX3flJWMFpV8zVHn2JzF2W/KbliFKIfqWkrKlxG3dQEaApJlusRDD/f5Q00m?=
 =?us-ascii?Q?sw5KiXxKskRbEIPfEkutn70VbZ3adSC1jtXUn7vTs5O6irx66GYU4OK1/0Kn?=
 =?us-ascii?Q?aeTqLMylYBzKIzGGaA3U5WYAJWvKKMTYa9Yiu6Zt7JPDFIOC3nkPMKrbZMZN?=
 =?us-ascii?Q?3aN8IwYB20V16qzX0ZEF75q02rOCATpbXb1GEHvmDEsV9yZuU8QzDYqWZJ7i?=
 =?us-ascii?Q?YqHpx4VJLYBl22HlHEvD5TWGNhVelJxZZfH7B9N/nHfg+jEex1Oe7VaLqPoq?=
 =?us-ascii?Q?7WEXMcHNTbrPn9mrgkbg07l0I5kXYgUeY+zbaTIFoW/UAdNbaNPhCqsbtGqb?=
 =?us-ascii?Q?keUfME7UNIvxmqd7oyeFvtewdOzdDf3TbVu+utT2hLhxmwFJryDO6xGotS3R?=
 =?us-ascii?Q?eMeoxa/fkvw5NVtJMrTOOmBwgJiNPhHVwgF1swq/NExduw/anQ1EPX7Kamoz?=
 =?us-ascii?Q?GYXI3dbDk8GWmAs18MqFdKezwZvRbNlc0Mlo8oF6hdS2NyUq8nITBnUDOuhb?=
 =?us-ascii?Q?aVp+RlVcBtmwY8rzOXXvQwTOEUUKwkoD6PdqazDZLp8pjIrxNjTZzR/tzZys?=
 =?us-ascii?Q?E7EM/KEyQCsVwPx+k+k7vvKoKFsFF5OjvbGqWzetiaVqtGAhMZ5dE0h8rirt?=
 =?us-ascii?Q?ZNK0ohDNNaRexJYH2IVsQoNvzdG9LaUHP+R9/i1nv6xAUqL3hR1vLDKMTJGC?=
 =?us-ascii?Q?aTyZV615FEzfY/MLnUs+WQbU/LyldvIhOpwlEekJOIq+7ilHCeSkQGh2oWDE?=
 =?us-ascii?Q?7QFWxnyY9KSyeZKAnqeNiOeQ6S7nmrV7RdRPddxqhxlBRalM3G+caIp6hgDk?=
 =?us-ascii?Q?yMnOL/hBfoJZDp7GV2m1L2263gxpw2Of5GcBNG6qDkDVOIE5YT2P2HbLRVRQ?=
 =?us-ascii?Q?imVVww5tdnQJxXcjx1PrUqTsvb2+2LQLB5uD2erTZQGflc7uw9XdkCgHpWca?=
 =?us-ascii?Q?qNLOFLNEnu0SW+nsdk34SHCHXFH3xa6MRmw+z4+xoyXiIEzMXHkd5S/m601m?=
 =?us-ascii?Q?W3z758ZVd0+TeSVFUFS+BTXJOqV8n1gUd9rEmpEHw8q4IIGPwfdGTBx7BdAU?=
 =?us-ascii?Q?LVZX/mq2lBBpJKxwVXK7ROZ23YtQjqA+eIhDCzEmtiOOLQNNc23DSLjh4d9V?=
 =?us-ascii?Q?xka5DYjxLECTlV1NbMcsSS9FerxmTNx+5m44XX9ZJeIlm6yHsF/Hqxn0GLwT?=
 =?us-ascii?Q?dkXk0sogPJ/XcAS50Hb8ZHKZmKkEXCPcu/5gTB2LK9rWmH2bq66r8+ydBxDh?=
 =?us-ascii?Q?gqM4gIxCSVzbJjsp71hET/DkJauHy6+PZY6WcBXtDgM1x9hFOkIjqFF5mmnz?=
 =?us-ascii?Q?/GnnsnwwrUoeY5LA+qfnRreZ0Y8dmlby5OJa79NTttvIhArSmyVZFVFnFXfM?=
 =?us-ascii?Q?2qbVvkzR6NCEl/Zl4IxspuSPPzSxWoRMyyqAlMnlGiSIzZS5n/7zdShayZ3y?=
 =?us-ascii?Q?YSHZPWiJHlDJ/ASlYpqoaW1gFYeHAL1yWxyAnfuqa3JespQJXe7EBQ9UTZY9?=
 =?us-ascii?Q?k7nZkwPJEBgksJgX9IDEv4fDiaTI1zOOTsLN02XWmMjI35l/qqGn17d7PbSV?=
 =?us-ascii?Q?/aFSL3dD0ZWcBicpc7Uq3h5lGD4qXE093Pu9H7F/FmGrlrUmYCF9iEYZO4qv?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2a3679-9298-4dd1-ba45-08dcd2ee4efb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 05:46:55.0621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: re9oK5Bb4S4KrccNen4pp5YRF1AXOJOsILvyKD0aJ0gNuRTv0plEauEABiMSsHOl2b1k6U26nTTheBMJFpR63MOV7zpIsT1w3oqXtrrHjP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
X-Proofpoint-GUID: WsIVvHhO8lwMEj8R81tfXcIdEI3D4q3y
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e28053 cx=c_pps a=fpyyTn7Kx2iM0+fj1eipXw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=VzVOzZWKrabdcsoWxU8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WsIVvHhO8lwMEj8R81tfXcIdEI3D4q3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=633 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1011 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 05:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204420

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes the follwing error while building nativesdk-binutils with i686-mingw32 as SDKMACHINE:
ERROR: nativesdk-binutils-2.43.1-r0 do_package: QA Issue: nativesdk-binutils: Files/directories
were installed but not shipped in any package:
   /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/lib/bfd-plugins
   /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/lib/bfd-plugins/libdep.dll

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils_2.43.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.43.1.bb b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
index 2cce40f1ef..eb7c16cbc4 100644
--- a/meta/recipes-devtools/binutils/binutils_2.43.1.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
@@ -72,5 +72,6 @@ SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-al
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
 FILES:${PN}:append:class-nativesdk = " ${bindir}"
+FILES:${PN}:append:class-nativesdk = " ${libdir}/bfd-plugins"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


