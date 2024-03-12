Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E0EC54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 15:33:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13159.1710257608638091760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 08:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FPFl4rIj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3801c4d08c=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42CBwtDa029492
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 15:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=5uT6/xUrg3KCkD8/Bo
	4+7Yku/uwkTHMT5rWUgipmon0=; b=FPFl4rIjoreq/yMgHZoZVX8JZQa2Ha9nK8
	KkIEtAQfXLAq0v8Kb+1uG5Dw8lqS79C8zMxEJ7i+GvhsKUzxs5r9pKbQPFpiOPOf
	1aMwoZANCkGo3KO0yFEENDo51WfmDJlRPMwUBb5dlb30lNbKFjgzwuSxaDvIVmbI
	edaDZ0Kw6uENa6qP7vOPZ3m7dlQ6bKUTX+WXF67UV8soN2+Em5Ly0A0E0znAxixR
	D9rt5XolPnxWRymiziCW73DxYxB+jMgupd07t7Qh/d2tS3Jmwa2MizcebeVtFu2D
	+kQwE2EmSRUsu1KTvSCwFmpgbMeOpmxpwpfJEgdh6utwCgeAhMXQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrer6b05y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 15:33:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6lEDS5Gkz5cH5KmjCF7RzltG1feG5xywCr/h0oqzFOGne+2JvdH6ogmH5muQP4cJb2jVRKg4FybZvXosBaWmuVDYz5HXjyf6amdXDsDDNCYxH1CX67LMb8/nxC/MuF/6DsmxFo2/z2j/ZYFoZaycxpFlk/tCPfezWHkHjCdI8wkHO8q6cfHY63LlL1K2AjrhbGyV/jlpG0Xx/nnt6WjaeeChJaJva66TLttiASzvCrtYsLHUsCF6hnnS0czUw6wKkb/3Kn0Ng74p5P31YA29SieuMQvZVrVINepsUTOCZE0yyJbO6T/x1jME7oS666ifEcrchmyrV3QsA2Cp6dHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uT6/xUrg3KCkD8/Bo4+7Yku/uwkTHMT5rWUgipmon0=;
 b=YZPSXovKOpbXoTF8d4iwsQasjJwvKhOQSdnQTzrn5cxMCzECfqXsX7shcFWqBi95P52BarqMJZnivfGgmoMrcvRka4YgzNGMja+bxD/3MzoF2+yVG4yY44maejgJo5KYtHCwWms/E5IaR2/hatPerg7MuhnwoOxhxw3PuwzEuCFNYplEvD86K9PyBbsR9Pl+YcW2YvWRoi5plhx3LjYm0dQAr3Hx29UT0MXcag2UavTIJI5F6oGcihbMaSf6Ck8YbitXpoLZg5BXmWaV+Jel8pg5/FiOzaZwXeV2Av3r3UN/ds+Xv+YE/yP9bAMH2skBW84hikxta1I95ELBKemhgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SN7PR11MB8028.namprd11.prod.outlook.com (2603:10b6:806:2df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 15:33:26 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7386.015; Tue, 12 Mar 2024
 15:33:26 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: Oe-selftest failure analysis - fix for tcl errors
Date: Tue, 12 Mar 2024 08:33:06 -0700
Message-ID: <20240312153306.1871599-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::19) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SN7PR11MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac32981-3fbf-456e-b32f-08dc42a9c25a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NIBxUoR8woZZeuIrskZLYO7Heyipl1CuZNxP/5txrmREsOyuQ+F22cJAA/HS9zQnOxfkFu3ss/toy1M3jZcfX1xxtFx3EbYNQ03q50ZU54X6dwW1xqEuOZjoc6IOx+nZtnW+5jE/WJexlGsGhE7UqXrKh/TWK6LruW2ENQCZLONjpOqQEJcxcCUs8oDxmXRSjvkDwX2yjq6MZ+fQQzitiqiXGeX58XlI+2X1Sl6L6RvK59rrpMyDB+e2FVi7sXw+lrdhFSHsw8qmI2SBBjrKpEP7+HiJi6rsJACNuEW7r6tVdEqPuHtTWWjFVywpcvlF+bAlU5rAIszdVf5fEyrcgslCpdii0QHDfsgOBh6pyp1eZYvruK+OZvgTE/PL1uTZDVfJ5chwDpHZH29c/ESUN+0hdadiN6xftBDn14zzdNuxOFNDwtK2awSbc29b6ynwPn3rHN9P3l09GMvljkdEthlk7/RrO8677g0PDIuKivq8lVsgp9IniC/2YPFH6z0Akxd0I3XuSUxuYw+TNsq7g+jEXZveLh95OpDJu22FlS81vmEySgXz4wjnzGfNP3GbgGiJH4srrd3ZYSWgg9ce9a+EtHotsyQjtwftqI9bT2cFH1jKG2XkimkZHvgNsCDlujleEMpaXY8jnuTEM8JEi7q2ZIVKrnNsmIK16ZXvL2NeMV6VjzAnFm8hdv/q7oqCoQ/uprqKQb9XHUjXpHbHv5k3IuAKdNca0dx5P0KhMJs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kvLFoVV5PptH8xRaSU0lmVwkeX5gwAAN2qjC/pizLc/FrOnOndXe5IiGChVQ?=
 =?us-ascii?Q?rdU6PCwHnNfIZU4NuIP2IveRhm5lQXUwoDgoIsD6IA6Uk1NBt3soFh0UBZNy?=
 =?us-ascii?Q?4Ugv574BF47TTsoaa0bWAKsNgseMYahGFqs1KWyil2UcbfwO2Vv2KO2nk+gb?=
 =?us-ascii?Q?95OG6IW03mjDvcLPAZRZK4lWVmkxAS8g3vcW0Ey66gJAp7b6jsN2ZfMa4qOz?=
 =?us-ascii?Q?05BYzyuYp9ZkssmNKe9UxcVtj1x17OJ4kxrYn3f9Du9GdLchlsvhcAYsiRvr?=
 =?us-ascii?Q?U0Ks6PjVoHw2zjtuLMxS7+SnNEv3bQra3Bl74hmCh/maIUrt15a8Nxzqj5ez?=
 =?us-ascii?Q?vs9IFhUJ6fhf0nPBxS/ic3LiUreGhv0KeR/pWXQf1hI9oFFFnr4E/iGPls/9?=
 =?us-ascii?Q?tr3iK7EE5BPKTNIWYrMg4kJtac4lMTtnsiRn65d0OwkoZGqXt+34+0BlzLlu?=
 =?us-ascii?Q?DLS3eINcgS5Dw4kO8kLaYZpxWNLA9WPKvcXPIYxycS6rSvao9UwvYPprqyUY?=
 =?us-ascii?Q?t2X6sHuVFVolqoWmMRLAmVJkZqATIYwJ9DG0Q/pCukUBTxHhODH+8DrEYA7E?=
 =?us-ascii?Q?nFdl/x/P38r1/uzKdCpEVO3pbWlyEfwEFoLcGSBBdfv05Z/xcJa9JcweOJzh?=
 =?us-ascii?Q?fgxIR+zTlXcMZSwQWd5owNGJ5mjzCc/e+nLUgYbkHFwg5diHxXYgrucvhAvL?=
 =?us-ascii?Q?3Nqf7anl88UtB2vIeBWLjj/UyYSvfappjqTC1WJaDBZnvaX5hvdavJcKXlZ6?=
 =?us-ascii?Q?1B7Sz3UEF7kbrKyIzFLSVDtue50iEC3hFC2HfQaE2zOThEOoTwUDpTo0ZIXA?=
 =?us-ascii?Q?phyJ7gQ1AIgLXOuXNG2Bq5WXJMVgIcj/gK0jx03Fmrnf7SLwhtuoEqV0PL1f?=
 =?us-ascii?Q?vqWDqByrgpJiFPuywo1O7T+1oPR15TOihDpBZp38LZP95UetMYeqeVnxJqCc?=
 =?us-ascii?Q?qJ9kEViVi5VhLGx31XFXqzb04ZcZPtt/Rj6n7Egq48OPuFKw4CSRaoFbH58C?=
 =?us-ascii?Q?RWR0UCfR5N1AOIDqwOWW5sWYdiuZcO3MH3XHZY5f1mhaAP7+lbe03zuEE7Hn?=
 =?us-ascii?Q?vqOX/aSh5/Szk9ftWRjpOMMMb3Meuz29QB9EeUkcT6ZbO4SAQL3Hsp3MrRtf?=
 =?us-ascii?Q?8hl/wpU88MbFTmU6w96PhdNLcr8jb1ls1fCTQpmf35qyt/ZkhLusbnHjij3B?=
 =?us-ascii?Q?/IwXEAdN5ECqLL427SHKnayFu4LIphxUlwqS/fmk15B6IHphaJee7LR94B0Z?=
 =?us-ascii?Q?Wp2Bo2kkffJmGirj045j2H8i+YCuhW1P60n4wCOBH4BTfcC+1ze3cSo8o4qm?=
 =?us-ascii?Q?cujAGFLCduQ8/JumEDwd2AbRjLz4aSsFpl7BUX7BLPb0TQQ7WgfPLoGgOOyo?=
 =?us-ascii?Q?cjycV/rt1YMAv2sp01R1FJt9TwBaKVK/R06o2xwsKe2ps9j17vb5c2pgA1x5?=
 =?us-ascii?Q?pME2MIA58Y9Fp3n+EuGp6LaZOjV/ks5mHk+pGr3hNV2/UWYKGsbO8twehcEJ?=
 =?us-ascii?Q?FMz2ll2qKKQ+Y+XrQDvBgKOKkDlsXPrBhmnYD79MNYW+4652lAhqAp5pGf8W?=
 =?us-ascii?Q?TPdYGbTZckAlXvvXepsFcS7uAYYouwZ7mintE/HX0nAKEmwzcGzOGxKCBpxC?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac32981-3fbf-456e-b32f-08dc42a9c25a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 15:33:26.1389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: us4rX5ozpatdK+tKkjfmk6mJZiOKk7M8k4qpQQ+BZwlZvjW6PBSqJgVI5NvFNtFor4tSiQZYEfXwcD0yrlrODZmzOOwi5Nj2XWeejmd8Mnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8028
X-Proofpoint-ORIG-GUID: 2XfggUv-3lEDWOLDkJnN_kbr7FCDmRVv
X-Proofpoint-GUID: 2XfggUv-3lEDWOLDkJnN_kbr7FCDmRVv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_10,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=876 adultscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 15:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196994

From: Harish Sadineni <Harish.Sadineni@windriver.com>

gcc testsuite unable to read the value of variable $do-what-limit and causing below tcl errors.
ERROR: can't read "do": no such variable
    while executing
"set do_what $do-what-limit"

To fix this the variable changed as ${do-what-limit}

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
index c405d8d484..e4d57c27ef 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
@@ -80,8 +80,8 @@ index 9d79b9402e9..e0e5cbb1af8 100644
 +        # Demote run tests to $do-what-limit if set
 +	switch $do_what {
 +	    run {
-+    	        set do_what $do-what-limit
-+  		set dg-do-what $do-what-limit
++    	        set do_what ${do-what-limit}
++  		set dg-do-what ${do-what-limit}
 +	    }
 +        }
 +    }
-- 
2.43.0


