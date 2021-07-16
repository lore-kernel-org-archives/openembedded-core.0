Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3897.1626426643539967574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 02:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ID0vVG/1;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2831fc28a3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16G97PZQ008938
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 02:10:43 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tw2q8c3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 02:10:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+/zCH6Yh8g0YTiXPWbFKRfReUdd/z1hxse8yeGin5ddIfBMfBHQaHzSPFZ//Esju0dVyFF5YCdfOpKCOfz2foWHbeaudIek7Fy0pY5GNC8Y0Ags+NN2AaKJ3bTw4udTH9Cu2hu393mlgDH4Idbr0RESxf0LeX8aKbvdEtj7c0jMIzRhpmhWPkcCz8w9XIupYslBPHLCf3bCVqdDJWIIfRJSJ1axdXJQGcyuL2yXFa2mG3tUkQu4FQQ485C+1E1C5lqVNu8U0xCzArRspJXih5W315t3g1ygjTZy8x6cIQ/S9yqk8g7IJ5HsevW75LwYmFlZ9UypacFofb8McC0N+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oq3txCdlyHkm0PKir/PNL5J13DwRoaRmysje5ejbz4=;
 b=LR0lN8c6s2/A2M5BbmTPGE0V1Jbhix7BAyDLXMWt1aWMFbj/B1chS1YuQPzNhjf9BiIZ1cFlZtCfwfdoF3b+MPTjsav+c4hu+wc8PAYsJ9ttOxZjzm1Av3S5EvL93KG9+fFn4T6OLK/C922wLrtRI3ne7er7DK1HatnATml8UL/Lb4bbNeGhha1pbvIF/yynnAtHYgUqyOtVmpVid9JFSFCiHEAojRdnHR/02CoramdJ7fW8nJq61bv6PSfOuuBqbB3EQNLDOTgwp8gWtfn4DtkHV+VeM7kXmbwGWfGx4dNg8g7QIhGadyUObJdNzrqu3nSpFSk29bujyKc5WhbTOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oq3txCdlyHkm0PKir/PNL5J13DwRoaRmysje5ejbz4=;
 b=ID0vVG/16vJEc1+f82h889XuCLsOVnaCLk91MIRw6Y38weJoF1KmCTOJc80EYsy2oF77Od3Y9u1jvPucp74E057yWXLO0hzBTlqOsBL5mQ4c50lSazlzknVcXnzzMWQWzoTDZrZ/M/61L0ev+8f/f6y3xGzBMhZ4RgYyjffY2Zw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB5074.namprd11.prod.outlook.com (2603:10b6:303:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 09:10:41 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%7]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 09:10:41 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libffi: disable use of static exec trampolines
Date: Fri, 16 Jul 2021 17:10:29 +0800
Message-Id: <20210716091029.54933-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2P15301CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2P15301CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.4 via Frontend Transport; Fri, 16 Jul 2021 09:10:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3626836d-4022-4ac1-09fd-08d9483995b5
X-MS-TrafficTypeDiagnostic: CO1PR11MB5074:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB507468470B6E976A7522DCABF9119@CO1PR11MB5074.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:392;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DqdOdz1EASZfGSonuJJVf+TgtAUv1vZJYr3OSIt6bC91i3VkmgdQYiN8zi5RcQ89O25qPa/qxcjxw5lCPZ9x+/xsAYlxkG72maeAEmrmDo/bse8JhPuQ03iNzjbxPQ39xAqBWEY4Z3EtZz1jnxaxr4i/4Tdv/3gw0S8X2WMk9SqOyNnvXKTs7jjZmhfZknG5T0/m2dCKUwfuIB8XumK2b3Ai0CmLKMnFBRKezj6CpBCGiHCTM3SZfZZm5bjBwokBNC2odZZ/iOQQBSVNaRSmdqNdV4mY/boEY9cMMwzaHPh6Xh3bDyX8jm4YSpuoE08IvlG3hKT+K/speyJpwjXN9nZMRSKc+nRWkX7iH53tn1orAz5fx9zr1GEasJxPf+0DUUBOtWJn0KEJ8assPyUgDNAZHLusS7bwWA/dR6ixg6GUdnsjbnSlfpeI6O7ZPhQuojgFoM9+Y76fAoIjxvigl4ZIUG0nwaWdzLMkCnkohopz8lFltUZNOXuoPU7DB2nr3VSYLBjHDHAEDDQWe5PJqsJ1Wi+VITYnQe0h7ppzORVeCFDM1UJSupwV9Bi6BvRypHsLkTUlJ4lLgZuum+WT0geppLlA7a3VmN7aYsT8GnWHvmClyEJeCTTLVztxqO+aeEr5wQQDCL3OsOFuq+ThxqYxWvcS/ezJyay9kyv1GH9sU0e0Z5gQqqn5TNmLTo/LQkgVavTUzUGgPJD3hIfvWvARXq22NWn91phOodHbk87rY+w+98vkRkfYIvmr1wBM42JayhBL3tpFR4Ync8yoZ8meaL6HtmioNH/nBNkM16i/ae/NJB0PPx9825zrcNoirwIcs2Fs65gHkD5kwHPcUA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(366004)(376002)(39850400004)(66556008)(66476007)(44832011)(66946007)(316002)(2906002)(8936002)(5660300002)(6916009)(6486002)(38100700002)(478600001)(38350700002)(966005)(26005)(8676002)(186003)(6666004)(1076003)(52116002)(86362001)(36756003)(6506007)(2616005)(956004)(6512007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qwEGgySsz4Y648HyHVrfqs6/+ZzwgT83yW+yrgAsr6PJtGMtmtwki2kKL3l0?=
 =?us-ascii?Q?Aa1SKwHkrvQvnZHgXe3guIeYpKJMnU5DBItDUVXN1rtqxhsOU59hTkW4ttt5?=
 =?us-ascii?Q?AiHIgv1mbjcizBbwR4lB5T7j1YbWUS4L5Ws/m8+gWgOmQprnAV/at0azUpX+?=
 =?us-ascii?Q?2aJp9Wt95A/ECrP69H/bjzuNxmrRU52kCePJZmw4i8J/Yyw7/wt5zI74y9s7?=
 =?us-ascii?Q?sOdVYa9RCM8vwmjwuwjh3NyoQBg/HGszjDbVo1ZIMuvem1iHHl0kINGVjLV4?=
 =?us-ascii?Q?l9RHsg9aLiVm1XNCjwk8kxk929VWEvPplE5edUvHiMH+0ItiZs51TvnI1YEP?=
 =?us-ascii?Q?Z/iQuvdcfbM8Zn7RwrzaSIHjQTOSutfA+CesJ4Ka85EKKMoRpebDXg/ralgM?=
 =?us-ascii?Q?PdO8oXOAFu7pVn/x3osjRQZML0QwAB011IY2dcwT1Fmnmy1K45UJ3vYJpIYw?=
 =?us-ascii?Q?JTS2Z1Dq6j2zlUlJV+amyljZF98zCZ7A94ZNqBibflKtcxlKglP1Z5n+j9Kt?=
 =?us-ascii?Q?080nX9HiLwpBX5LLZe10KlqdWZYqYY1bvGngU8CMQrF78q5MBfWnUNgyFbXZ?=
 =?us-ascii?Q?cwTD289oAdsRv8TT1jCmZL1NziWYGopV43B/JB+OHU4wHZg2Xvt1f/AWJmbp?=
 =?us-ascii?Q?n2368wKYPD2unDxXLJXZVi6im6so4tcuuezgDsr2HVA/jyz/4psxI43KKGf/?=
 =?us-ascii?Q?zeuUqTQhCMTSByV2nVNoYgyUuwtP6Ice5ixkTXc9S2HAgijV+uzY9aguaIMi?=
 =?us-ascii?Q?LD6N4xADiv5+kBvWzveOj7s7swyjJ2dYTChqxwu++Mdiy6O0vK70fLR8TFT6?=
 =?us-ascii?Q?6W3enBwxQ5hie+wsJJ5DQ1nRVE2jyo+JtiD04UNg3YVE9ukcFT45V2pnAtna?=
 =?us-ascii?Q?B5kCl0VL3xJn5ktbmWB3Ya/+jpLyv7hPUlW+JUYjJqFDC78q3fp6BJYWktVZ?=
 =?us-ascii?Q?PPIqCrbyt7pGWMpXWZzJBdzhJfgxhcBKKAtB03X3/CGuBgGcjOoHbyFNyXSc?=
 =?us-ascii?Q?bgkQaNlgOKuHKYcARBUwZiqDy272mkjlytWaAJhGG/IxUAdUt3Ag2/eeMDdt?=
 =?us-ascii?Q?ng1zG/Z+s2ELTMZH1gJZfg2cM4rsLKaW8M3QhoRapzMozhQVT0jBLff7gRqV?=
 =?us-ascii?Q?CS3lnV0/AwoM1rOxFxd2SdxD31zrUZ1bXFPc8t0Ra1LMJr25GcG0WCisXXxT?=
 =?us-ascii?Q?zNxvhgjxVgapcRk6E1AFRVWz+x3FZ8V8n3P7tcGKrAQd4kQ4DKrBlPyxeXYm?=
 =?us-ascii?Q?GSR38RdTh23tn3OWwP2pFqC6cztFcn3eFMfBkdKZ7tEkklnTFNIVgHydlVXX?=
 =?us-ascii?Q?b5hrRDQidZBZqSP1jkLhDW/T?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3626836d-4022-4ac1-09fd-08d9483995b5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 09:10:41.2875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDLiOR4Ew0mNxpwy0oEXQoegG07+y+kMo/USgihBAVGEUVJT9bAnca7vHDgTtXm1HBxbl/pZQxd7/Y7sTDAxGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5074
X-Proofpoint-ORIG-GUID: C14zdfkLQdoePtuEg-fyOu3dCAzKI_9Z
X-Proofpoint-GUID: C14zdfkLQdoePtuEg-fyOu3dCAzKI_9Z
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_02:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=873
 clxscore=1011 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160054
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Issue: LINCD-6022

We encountered a blueman-applet segfault with libffi 3.4.2:
$ blueman-applet
blueman-applet 01.58.45 WARNING  PluginManager:148 __load_plugin: Not loading DhcpClient because its conflict has higher priority
blueman-applet 01.58.45 WARNING  TransferService:189 _make_share_path: Failed to get Download dir from XDG
blueman-applet 01.58.45 WARNING  PluginManager:148 __load_plugin: Not loading PPPSupport because its conflict has higher priority
Segmentation fault

This is because the static exec trampolines is enabled by default in
libffi 3.4.2. However it doesn't work with gobject-introspection[1].

[1] https://github.com/libffi/libffi/commit/132699b95d3ee4d889ea2a80540acf3300987dad

(LOCAL REV: NOT UPSTREAM) -- Sent to oe-core on 20210716

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libffi/libffi_3.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libffi/libffi_3.4.2.bb b/meta/recipes-support/libffi/libffi_3.4.2.bb
index 47b230afa2..19b6ed3e58 100644
--- a/meta/recipes-support/libffi/libffi_3.4.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.2.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9
 UPSTREAM_CHECK_URI = "https://github.com/libffi/libffi/releases/"
 UPSTREAM_CHECK_REGEX = "libffi-(?P<pver>\d+(\.\d+)+)\.tar"
 
-EXTRA_OECONF += "--disable-builddir"
+EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OEMAKE_class-target = "LIBTOOLFLAGS='--tag=CC'"
 inherit autotools texinfo multilib_header
 
-- 
2.25.1

