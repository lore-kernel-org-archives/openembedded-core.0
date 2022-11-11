Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF6FC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 03:12:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1543.1668136343057321553
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 19:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ldkOslm0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8314ddf2ce=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AB3BOap013329
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 19:12:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ZdWEKnQpEXDsjeuigzJOSdwfbnSThY4hHQiLxZUTZhM=;
 b=ldkOslm0LChIZqPqlrIBRR59eCtubavdGhqRJxFy6YQI1dthpRGEBVABDrUw0vZLluCE
 dbB4kzcoUbYIjBlgl1CJWSk2QO3PniBoMIAXFBXw6UCG0H578fFEAp5k0FOqPung+KqQ
 lUbv+205qzco8kpp4ljywc/8c3hf+V/INl4LZPs07GWcKsW3e4UGGy9DeTb90nC2dwAz
 ez4xRt1UZZiUCAvMLBQdi+JbDxlk2PWcG8DIPfssmSYrNBeawWVrbd7V1Oo7wxVW1tbv
 T9pEzDRhnipMlokDoQwSVAKSX3HM6mkflDsPHzMnKe10EfPSqcEq9+eskMR2AztAGOpe wQ== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43d8ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 19:12:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4EVENOsJsugS/kk2mMCfQwURXwq0slYytgiaGk9eQLr+May92DpSdDXLt9Q/mtlbpyA3Go6MEIyZz53frzrFpPO62J6FBV67kojbk6n8VR6S7JCvDrgGYmsQn2rPoroh8XKAqkYvY/gSCT+lLUwFKTIaodl6BjBMtB29UCIm/tpOzO3P7yj/5j3T1OsLPmQ2CdQqFOoTY+psWkhQlU6+gzD0z94CYtsA8HgvBtOkPFLgbFD4RHb9DW1WdpzUx7VZ9I2ruiT3h4C0rWUT0psTjtvmd7WXs/GpY8/bfiLCWegETbj3K3yVqcJzxb4zG4DD9ivtmJE5C0mkC86mm2UBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdWEKnQpEXDsjeuigzJOSdwfbnSThY4hHQiLxZUTZhM=;
 b=BVaKPEiuAe5n6LsTXwMBXgj7wR/gCYpcmV7miUMWaxDYhixGXWOQoafW/6i0K7yHoU7UiyTlt9w37irK4DgGqitYHS4g8xOMU1bTo2V/Bf3M/dy9WSRYh2AN8XsBi7tqTV6Y/BF8QEoMtWWO3RcjVjluUzZA6Kfi5Swi3EquClA3hDpWNJ5mssBWNsJvWuzdu2+LNwC5NVJo0KA54AN+ETt510s2tzThuRzT0zNvgGeQ+amvy0qS3YvjCuH8Ui6E8WHzSi1lEItLJKUBlOc/lP2H6QFPyDEtBSerDwn452gM6Xqfr8aLkk6yaET5l2c5frASthkbl1jSLgLPWC002w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7644.namprd11.prod.outlook.com (2603:10b6:510:26a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Fri, 11 Nov
 2022 03:12:18 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::623b:7365:46b:36fc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::623b:7365:46b:36fc%9]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 03:12:18 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] pango: fix install-vs-shipped QA error
Date: Thu, 10 Nov 2022 19:12:03 -0800
Message-Id: <20221111031203.106507-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:332::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: cf80e83d-e0dc-42c8-ec76-08dac3928a89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AWe3DhniEFCwpNMMvIg2EU/T9cIUu1J2Pqi2yQQHboLgVtwckLBi3SLgQBXFNJlTkvlBwt2DZ/SpqEWtOJ3UNZD/nmWl5OiMqISb6TmQicIj02tqIKKto8djSw+QjofwQvLM5EQNU7e+SYBpZ3spMmY7Fc48ho61/6YiSrad8CwGfvhEtzmWvYqKWsPCNqdYJdtzIqX6QNTxBtJzQ3uDKwx6ygKzkQ2YWuKAcdwoCyAimDjTR82S6bAaLbrJs7+iplaTe74tMA8aSwycdUQw9XnyG/GNsO2jZdwciOPV6rVmm5IX4IGIxEQG583bByo1p2CzrqwOuQjP6qmYFSV617L650ekkCZkrwJ4grycWkNsJVp4eAvrLBUbl7STIQYoWtFgc2YRbQ2g26qV1u1cfTtliFPbNUhL72zB8JsdujFgWEYZTSrpMMGGgcNImWV5GA7jzDfkqCh6IRy6hjQO+KJsoXdYRG9l64xr00megi1kvD3ont0SXVLGS7PP95NNINbrsrGu3Lvts754vLP/ROmEALoPA1y7vkV5MQGp5k6CYW8dzoJLlkSTo6lirEs20lNRVixckM5p2pATaxhGsvsR5D2Z0NiT+h99f311LnneiZpPljC58aL9FCFfICdwotEzZcxD3qGDepgaLqjCHufWCyVcHK0MSqjl4Danv1sXLciBj17URrY+LmGHy+Is2jEURiEE3pzdiFfZFHjHR2nmcgAKb8dk8F4AuOXGB9FzpkZFXJLmvIfJ4JodImKaDYJdZgBPLKMUARMm1AkuXw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(376002)(136003)(396003)(346002)(451199015)(36756003)(86362001)(38350700002)(4744005)(6512007)(5660300002)(26005)(2616005)(6506007)(52116002)(83380400001)(38100700002)(186003)(2906002)(1076003)(6486002)(41300700001)(316002)(66476007)(66556008)(66946007)(478600001)(8676002)(6916009)(8936002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?go7tG+fyS164yai1iM1zPKQ19brPl3+bO24S0mgKKLmDJUZ3YcLlJf21W371?=
 =?us-ascii?Q?a7uTajkgEw/I7ufKdNrn1qlAkNnl+jXo/dndtO9cUw8NBGdGrcozuf9Tp8jd?=
 =?us-ascii?Q?kfp3PMCWcU58deJo9NpancoB3uzFk8jcdf92dxpNGeanntotflnTrikDM682?=
 =?us-ascii?Q?kyJU3dSawXa7XQQ0vG772hR0wx0c8e/OPYhbJ6drmg0AdHBkJtT91ze8G+7g?=
 =?us-ascii?Q?SUV302VtQgFhiD4P8ZsJrEWhmrYHUmutLxcpF0nX1Ed5hWpwprE4AEiLEc6a?=
 =?us-ascii?Q?77XMP0YWG7esmFWa5EOihLq9nnYxYbB/yy68k7wske305//bv6Zry5gvS1Mj?=
 =?us-ascii?Q?vSL+ax2H4c7xJfGoygxzKXdY4oXdHucwFX1nZSmjs9tn7Eyz+UD1s9DIyT+j?=
 =?us-ascii?Q?dwGRUEkFrkm0wxMmtgGh517rEhEH9pHlsCzw0N1PQ5RYAe618J5pVYzG2yat?=
 =?us-ascii?Q?n+UaxIEXGk4Zd+BWsatDYIfIE9vl1UtfQD61dDi71yYEHxh8vTwmBNnfMzsq?=
 =?us-ascii?Q?EIVN0xkjrn6ftjQhBD79Pg4+1qTuupja3HQBxibMo1ZmDd68gwlZt+sEE9MR?=
 =?us-ascii?Q?PTptw37Eztinsux0LIlUKlqVGazxPGJJ///NAkER8ybpUIrArod3A0sC/5RC?=
 =?us-ascii?Q?gFYoucPsjxOBj0hOTtGusdYJhzZgZAYXedhE4Na72/+t54dUxIq2XITIuZ7s?=
 =?us-ascii?Q?/M1D4gHHlNi4JCGg1l4Qr8BY1RuTZYg3DO6UexqDlkGc6KFBwQeWLq7DisAR?=
 =?us-ascii?Q?wouXe7Tle4z2zLiHxSQe/HvgEbqhRiJSQ/KTa7u07yNEebSDqbqORc903nJp?=
 =?us-ascii?Q?y1OWPolMMz3Wdi+mRQWtboZqCFv0ik0LbqmcamkhdQBn7Knw+lFeq62I3lmv?=
 =?us-ascii?Q?DsKVCU30pPgD7zvlQhDm+bp6tTSUqcXBbY0N4txCjJDByqL9WdFVGzMlA+qH?=
 =?us-ascii?Q?LvmhtxyW17emKuj3+8vJfr5NyTkMyBD2nCglFriKCfQW/KL/Imgn8khhCSw/?=
 =?us-ascii?Q?ayYxUpMI8uLM+p8Q0mYh19fflLBbE/Q3EATBGM1Ch2xtqvhpqvKN677AEsqy?=
 =?us-ascii?Q?a2S7sMRV6ukrdDHr0ru/B6r87yoJLYWA/Hpn0omfz63OhvUwqfWh969XAvUH?=
 =?us-ascii?Q?hU9SXvzA52RzV5H1UW3oXMcAzxeOJ7lGtKPYiQb4oyE4n5vbA/ORLa2Rkk2+?=
 =?us-ascii?Q?JMmvYhas3pT2+vN/HyfPDGygsXD1xGft9irOHQDR4Epo9OWMYOdQSQ86MWja?=
 =?us-ascii?Q?Qas2DNul8tNFMXqPp44qsNjNLi+xweZNRx8kAKuvJKUBukSol29pvTLAu5Yr?=
 =?us-ascii?Q?IHePXs4PI6+TxZ9fmrau2hm3XVO6RRTJ1ySGVlDfmbm2/AMJ7fHgrsSkSSiG?=
 =?us-ascii?Q?/USpL2NqH7aT1ASRWAU+waPtZQjZXHBlG5jswwQegx8njJHewua2dpLqKVka?=
 =?us-ascii?Q?Gfzj50RVsb0NtTYMBA8BEzhWZ6pPrbCeNhBZHAcquF0F6DJpSVFOFbEtUjp0?=
 =?us-ascii?Q?MHCbyq6xHx+yrlx2UyIR5/MPA40o8XQwg+r69IymqyxZ+QbSccCl0xSoGUgB?=
 =?us-ascii?Q?6vuaIpXsdlmuej/aBtYSGWAzNeAFyVGE/mVRF0s9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf80e83d-e0dc-42c8-ec76-08dac3928a89
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 03:12:18.6094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/chP7TdTRCclXvKvNU9R16q7HQeO7fx3VsCes6YnoAzJhaYyNWMGr5HAPOaLmDV+HisyBO3qyjKrgpi0X2eIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7644
X-Proofpoint-ORIG-GUID: qRf9KfZ_HWW9wQZRV0wr9My6M_zyUiaw
X-Proofpoint-GUID: qRf9KfZ_HWW9wQZRV0wr9My6M_zyUiaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_14,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 mlxlogscore=695 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 03:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173113

In do_install, files are installed in ${libexecdir}, but this
directory is not listed in FILES:${PN}. This will cause package QA
error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-graphics/pango/pango_1.50.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango_1.50.11.bb b/meta/recipes-graphics/pango/pango_1.50.11.bb
index f545689811..f3714a4750 100644
--- a/meta/recipes-graphics/pango/pango_1.50.11.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.11.bb
@@ -49,7 +49,7 @@ do_install:append() {
 
 LEAD_SONAME = "libpango-1.0*"
 
-FILES:${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
+FILES:${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS} ${libexecdir}"
 
 RDEPENDS:${PN}-ptest += "cantarell-fonts"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us"
-- 
2.37.1


