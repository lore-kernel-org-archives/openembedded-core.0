Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 965E3C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 13:15:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.28503.1685279723831122738
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 06:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5512b7330a=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34SDDFtT026806
	for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 13:15:23 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qu730s2y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 13:15:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrxZqdLqvKVkLS39zBIutVBjDEWF2v4Jv5BoGl8nXsEfY9RfDO4fEepCPwZUiPDo9Cjw7Fn+2kSnw9h53UmJuW4C2wXsXyrqO+0zmctKM2KISOF4mhaaU+WrbeLE1Poqqo9RR5KLeitCitDZlbJkGXhKdXOmF9mZ+TbBXIE3UWdAj5mec1AZw8mQGh0bZdQpThJrMSMhgnu2Z8EgLPPI1lVv/MoxhKuicmlQz2ikK+eVtz7cllFRnyGz7XSNL7Uw8TQO1VTGmxaxxRLlUBXqfj90m3xGbOgJfQjPpfRmhy0+ueoEghYVXFlKGAR42vQaXQDYpTHrQdQaSP4Q+hjQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/E3ZCL8veSIdpNxEvbOu1FZIca8xl+fF/+nFKot7tIY=;
 b=Gfp8dwO6p5OI0jLwQd5MMf8q47WBGfLtZXUGk+hOccFA4u4Iy33+HBrp7cXBO2Hh6vlMtu9gnRgyRqmIokqhk4kIYyc/XXPEUZVbtDvnd1WooPhQUIUh42BfDPRIzuSvsnDM75OyH9bSkse0XLrG79UelJv2ymMbU88MO1BdlM9v5IveZDtEhw5NaZeJgX15zxgbSuj9TrOKRvvpISpZKiCBDdKOEA62h00l3E59/xQ6a7zj6PaSZaucKIBAS9Um2rM+q6D9NgZ8EF3sLj6Yu5DIUxqizCqrOOI0DyvbCOc9NH3pe9ZV+SNQt+ZWAR3IwCEPrBWJqkJ/TNB9rpJTWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by CO1PR11MB5074.namprd11.prod.outlook.com (2603:10b6:303:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Sun, 28 May
 2023 13:15:19 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%7]) with mapi id 15.20.6411.027; Sun, 28 May 2023
 13:15:18 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] sysstat: backport patch to fix CVE-2023-33204
Date: Sun, 28 May 2023 21:15:01 +0800
Message-Id: <20230528131501.3521662-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0137.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::13) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|CO1PR11MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: c72f7f1f-e7c7-41aa-7ef3-08db5f7d954f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bHJlYjNU9+dnW+m2jxOuzvnhzlbMMECPDx+K/yZ+DAfQNHVIa8fvXUkR1acule7L2xpSPcV5iRHyGQyAMcMYsFwxOJ8yjmlFae7t9H8TJfD9mndQXWEF5KMh3F5YNmGuHsXZVx54QVWLJKTeipSH/70EtXcqeS64QyP+Fj/YSj/7glC5WRn8+vFYnrBmcn+0JIrQ+cJPe3eZW3L2q1d3iI2Ljw0a/JS+Gtspo+uYDxtNSTIhIjKhB1uYjrWiadXqQpdJSiNbtjpZD8rgbYMBp+isxGo8HUz3DKSAQkhSj2Gk3+hu0CuYzCeBgpUNcl6vBsneKIb4IpvF5hWeODz23rG/GSlZBhcj7Px4bkqMuYd+mhIDIXhLwF9nlfEtSgUV/m8K4FlyLZ6mvSeROpycjNXSUDWj2ctRjAWiEFe8mop7UKPN7I9pXAqPkJV8OVpWmUT80qLrW8Jbh83dd8CgfLdFU0gIZzH2r6LhDDB/bBWbg22agt8cOY+fAX24e8pPHobTokzq25TiNrH81obEFrrBSPut806hugFRC/N6IuLL1qu8dsUDqRG4/07+GoSRGOaNhmQvfwphqHe81/yx1zYhxiQlk1BiDlFgPdXvcvo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(366004)(39830400003)(451199021)(66946007)(66556008)(66476007)(6916009)(83380400001)(5660300002)(44832011)(52116002)(38350700002)(41300700001)(38100700002)(186003)(2616005)(8936002)(8676002)(6486002)(2906002)(966005)(6512007)(6666004)(6506007)(316002)(26005)(1076003)(478600001)(83170400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QuDMvwx1AzYmiFuiU6+y1w9dCCMiyfEVV6TOwtNTMrrcEiE9busi12e7K2Qg?=
 =?us-ascii?Q?ne9Dg0WUc2DzXoLK++j2qzX9D3stsSfr6WweBf5yoruYIimgsQr0EcFNA31m?=
 =?us-ascii?Q?xn9jKxRsy5pafV6eWPCz7TzqVWLJpG7BYwHTlF18J0PWr3PwugxXr03HIaVX?=
 =?us-ascii?Q?vq+LfglMmwd3bQYrw+GzcJRNkCr7POCh+Qy2wYpOCGFTNwM6xtl+UHovf26d?=
 =?us-ascii?Q?SfEbq1P3Tla8MPncKD82y7UAVGSATO5lmJ+YwjnxV8T659NogfYDEDps18b6?=
 =?us-ascii?Q?kZpiCjK8ySVz2Cg3WeWFXJZ9joGxDMc5lyXiAwnmruWQQXIDTRMKtK2Actlx?=
 =?us-ascii?Q?R7MINgHrQxRlB4b4+8HLOEZASBIrym2xN6yzUp4G1+9HgcWhmJ46RkHMTGV8?=
 =?us-ascii?Q?Dz+vKZ0cWdpw+knMozmIQAQ3VhpWFArclAucKbqfwnXtiyExMWZwY/jqIaum?=
 =?us-ascii?Q?8ffAdPHlTGKRNX1Nm4UCHuWRJHma3vV/vENFtgFa+lBQbwXvYHHmw5ljmhiD?=
 =?us-ascii?Q?3Zs0EElbP47BVkAZocUqZm4eqqu0SFpzGHOweC801+HkK0qfIPjlZeJPgYGS?=
 =?us-ascii?Q?M7tOpSZdC1FC6Z2ShTQH+C3lrC1MK2kDnQwfG+RSC7TvOqJIGvtZiTfmWRAC?=
 =?us-ascii?Q?ZOB+CJa41DjvQm5LUf1PhInuEb9zgcTOa5TyEhud4yntXZsQxVmp65bVAGLd?=
 =?us-ascii?Q?nukJQJh5ZXY0DAcMDc0UapvihcoIXI2tzpRRI3DZFpeIKvSFUJKVBOOCVNpH?=
 =?us-ascii?Q?42IdiObvHABh24sm5DLDwwV+9AoHiyLZxH6yyGWvXvdGxsdi1K3UITW4Id2p?=
 =?us-ascii?Q?aC8DD1LExJyOyLe39oMErSAhQvZth4/DO5Tn4E7Io0pfkI0a72Rn+70pwIv5?=
 =?us-ascii?Q?MoTTnwvarhiaIGQNCYZfU1iHqphxaKRD6VUfUCRtkCGUXjQkxMVF+jAQjPbw?=
 =?us-ascii?Q?tfuUlu12jJ1yVjfnQBQxtnTT8vtR3TU7H/BblI0dT8YUhm3UVu/nHu7u14uc?=
 =?us-ascii?Q?EYDs+7XPG1NIAD7cye3lYqV/HOJm6ylB1X/TSIKCQTF4vYw2+O32t4yDWqEW?=
 =?us-ascii?Q?aqmSuMZa9+KglvRI6aITD67NWEmyAa0vV15cAdZ8wyEgXMvmr1TCI17uMY9t?=
 =?us-ascii?Q?EvC1w6HXZaFhyyeDrN9sVwrYJ4uucosjgGiL/B84aKckgPlFuAlXNyUEbeWu?=
 =?us-ascii?Q?7bMR3WwW5fDePh6culTTQrKV7K8mafD6uxCnIPqtqQx0BhOLk10kDX427yMA?=
 =?us-ascii?Q?M/ayUtmtFIF3+WbREv60Q4nJS+C4U0OvfsCK0t/vmrCMASQMh+Tit91QAc+m?=
 =?us-ascii?Q?jp78MmdZx1sCSlg4TakPunp9pPVb3dHH8bTUF2iMcTGrpCZsIvoin+rd3O5a?=
 =?us-ascii?Q?Myr5i9LwXsH4cSq/v7tRVzymETr6MuZyeqLwxx/IxDlDrUy8bBzibLfu9jzE?=
 =?us-ascii?Q?SMue79QreEIXJGHgbDmGe9MZ4A2foXS6fLekNn6lk3ZxqnoolLe04PoxPFjX?=
 =?us-ascii?Q?K16RilvHz40e2S+P+BdGyoPwWBqLIQajmSlHBy3AyhVy3Gz9sEHfbnMku5E6?=
 =?us-ascii?Q?NvpYlpvVb5vg9HvYtzj0TkW7XjdswBwy9oF/VrIAu/2jUsCukuib9QJ4tWfR?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c72f7f1f-e7c7-41aa-7ef3-08db5f7d954f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2023 13:15:18.6341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMnSw8xqwU1D9M/wuztJJ53nR8Hkb8ReieLnjkuL7y5Vq10QLqm18OHP4IGbeQQmSgr8YKBj/pc3ftBqpjQm8493utCnOvNn91j4P/Uz9Vs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5074
X-Proofpoint-GUID: qBwujG8XEH8o0HA_wfOrdSoiTFjmzDxH
X-Proofpoint-ORIG-GUID: qBwujG8XEH8o0HA_wfOrdSoiTFjmzDxH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-28_10,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxlogscore=802 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305280113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 13:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181821

From: Xiangyu Chen <xiangyu.chen@windriver.com>

CVE: CVE-2023-33204
https://nvd.nist.gov/vuln/detail/CVE-2023-33204

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../sysstat/sysstat/CVE-2023-33204.patch      | 34 +++++++++++++++++++
 .../sysstat/sysstat_12.6.2.bb                 |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
new file mode 100644
index 0000000000..ad78947d68
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
@@ -0,0 +1,34 @@
+From 954ff2e2673cef48f0ed44668c466eab041db387 Mon Sep 17 00:00:00 2001
+From: Pavel Kopylov <pkopylov@cloudlinux.com>
+Date: Wed, 17 May 2023 11:33:45 +0200
+Subject: [PATCH] Fix an overflow which is still possible for some values.
+
+CVE: CVE-2023-33204
+Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/954ff2e2673cef48f0ed44668c466eab041db387]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ common.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/common.c b/common.c
+index 48493b5f..12cd8d9f 100644
+--- a/common.c
++++ b/common.c
+@@ -431,8 +431,11 @@ int check_dir(char *dirname)
+ void check_overflow(unsigned int val1, unsigned int val2,
+ 		    unsigned int val3)
+ {
+-	if ((unsigned long long) val1 * (unsigned long long) val2 *
+-	    (unsigned long long) val3 > UINT_MAX) {
++	if ((val1 != 0) && (val2 != 0) && (val3 != 0) &&
++		(((unsigned long long)UINT_MAX / (unsigned long long)val1 <
++		(unsigned long long)val2) ||
++		((unsigned long long)UINT_MAX / ((unsigned long long)val1 *
++		(unsigned long long)val2) < (unsigned long long)val3))) {
+ #ifdef DEBUG
+ 		fprintf(stderr, "%s: Overflow detected (%llu). Aborting...\n",
+ 			__FUNCTION__, (unsigned long long) val1 * (unsigned long long) val2 *
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
index f9e5778e76..b5014eaefb 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.6.2.bb
@@ -2,6 +2,8 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
+SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch \
+            file://CVE-2023-33204.patch \
+            "
 
 SRC_URI[sha256sum] = "3e77134aedaa6fc57d9745da67edfd8990e19adee71ac47196229261c563fb48"
-- 
2.34.1


