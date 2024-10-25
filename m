Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22E0D11704
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 06:44:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6232.1729838692823685372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 23:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0028c78f07=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P4ej3J028126
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 06:44:52 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42f2g42gqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 06:44:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W63sodxQvcmv9FJbr1p2JicCSBYcu7lKIkNti2kpdcuT+Nc+CpR8GqcsIeJF+kn9xm0TUVz0p1C7uf7mCSy1vL8rRI8IoA5jaTjI2wGwxLRZqN0LlFRoXUlQxEll26s/+dQvEHnp4PZa0yNsZZL2bwXFWk7vFOK7cJI3MiA3pqqrAg5g8godDOksOgr+LSRlw7KpmsgVKBSRuB3oWdr4xrkkUjn12GixUmPCkjUSxdWdPyLi1unlYTCTmsFXZaH7vYAPhptN+XNnFIq7bow7/utlyT7MHP/YK8ZETpUzWA9kjr+Etwd2I4IICmNPDHgtqYT+R78orRWX+ynN3cqAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFFhyOkD1388K7kxsp07F4qg0tkjUpgcFr8t+sA2enE=;
 b=FlFpmpisrW7o8ob0cEYqSKpj6sqEkdVRSjf/ZdDuHbEg+QnyZeBQMqhwsKMtWO6LcdC38+Ki5kx07YuGyGwZYWiLS4nts+B0yIiprJpkRqXcwd0+xdhc9ROS9CnVUJbrEdFwnz27XzpDaqGQRZkXzi40AszRZUkIOB54seaG7+v9S/mtvsXIzDmKyfhY6SAiezROYpBVDsQKdGFD9AROojJvB3o2CO3FOOkMNywXmiQVtEa5pRPivtSWARDLLbKujq+GpjhXNBWgvrnaj6RlMDNdRehc2kZvrC0NA1sF9CCNk1WBqIRMzYD5x/0wojO5LgqjpHsuPclOUZHuxY94bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6230.namprd11.prod.outlook.com (2603:10b6:208:3c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 06:44:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 06:44:48 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] shadow: use update-alternatives to handle groups.1
Date: Thu, 24 Oct 2024 23:44:37 -0700
Message-Id: <20241025064437.1769272-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN0PR11MB6230:EE_
X-MS-Office365-Filtering-Correlation-Id: f7853b90-b446-44eb-5561-08dcf4c084d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CrZCx7GbKpjenLknb2ITtNzLk3MZPGOmdQxZOfids6hv2nMtmbGbscmbIhZj?=
 =?us-ascii?Q?RhCixwiRFyF65OamMaeaSPG+CWSujKM7ObED3vN9TXkwRYOZq50gefP/BwLf?=
 =?us-ascii?Q?gsTn1GcKqu6LNG/5CTpxFIsg+jQ6i0kGoqsenBi4aTyqnI/rKNw3lPRl/jwK?=
 =?us-ascii?Q?I+BY0t08HdcVjrlxdbfr2Jv1LLAiqPWTufWByZ/iefWPlJV8E1xQYbGz2TSp?=
 =?us-ascii?Q?3Y59jRsxQr9hx+foCy4j0wPXUAR7YvdE8rr2OQWrUYe/0WSjp2XiYgkp0qq8?=
 =?us-ascii?Q?1S37tjpAuyjgx2Fnda4DXpP3BbcgzhiSz+Si6LURcrCaTmVuStHQgdtMDKuL?=
 =?us-ascii?Q?NjblkLi4MejnX2Jgxwd++N7t65GZyCI5GDLporxynUlSyxC8YCbVy6HHsl1q?=
 =?us-ascii?Q?UePvMjJ5csvSj3dJVDoWpXrYeVSXjR3jvdAdqpFRKC2xekegUee9VNMgbP4M?=
 =?us-ascii?Q?UbWqV6XSz1dnPEVNwqZjbSjAkvNuLcZSmTSnIxFGJCvYTyrw0G3PHVNfcy+l?=
 =?us-ascii?Q?uLZceo0kC04D5mUJPg/MryUGWuwUJeFdzNLSeq5WjpH6KC0bqJOpgrTddzEK?=
 =?us-ascii?Q?X6cRR17Q8YsfHitagwWoCEvYeCpyOd8On5fqi7ZUbd4GN8XndBS6Bsvh8ixx?=
 =?us-ascii?Q?Heb/Odl5FSWmMY1hHdGQZ+KaJFYqjJfn/IQJU10sckfXyb4hQ+YJqCadrRmj?=
 =?us-ascii?Q?pfGk0a8vVEMWJgSdGtls8ZjuA3mbU7ssn5F6byXVf6oV88bjayavxPOKnDiV?=
 =?us-ascii?Q?VhZ7GFt+5o+HOwoea4Vv2qQJt0SurH5dEDi5IEgnFqhFEDU8lJh+OYPoZa5U?=
 =?us-ascii?Q?CrMWrvbodp9XzQpxBGN33sge4vbi8clLCMVDqZeIqLaEchacJYDMhYJw5kg7?=
 =?us-ascii?Q?zE+riZD8WV2krnbrucn3DRubzEYJjo/HJ7P95ncWlqqCWuOqR1K0vd2Eue7N?=
 =?us-ascii?Q?LGU+R+slIZ247cxTS1qTLz9ULGT/+usUw6hPKDsgydNDvQZ26IWcoHvVJ8Ht?=
 =?us-ascii?Q?5u0MG+sSHRzOq4vmOOZFEKAoSZwABGl8QDhRwVYALa0xdtiqGArXCi1qn5Kn?=
 =?us-ascii?Q?KbCwKGytrZpCOhGke6hXDnGoIUYWV+ynBpWc9kbu9kt80stHnm95tQ9CI+NB?=
 =?us-ascii?Q?CFlOslLQeuUPP3aGfsM4KJpPmAJXRRrq6khx95upCdDkkgltSMRa0FjoWgz3?=
 =?us-ascii?Q?+BXSwQGyZCYTK4m71VnGPvOEyhAchniLtl/DzrqcwOHkiIhNkLgr+FlPWML6?=
 =?us-ascii?Q?UcWf3x58h2tq58gOGq9/mqlyhg9pm1tTjde4eZaKRBo/VHtek/r9hS2tP4uM?=
 =?us-ascii?Q?4ys/TsWeRs3pcPub/GftTE0F7LNArU25OwEK6T4pZZRlKiMiMDRkIxv7m2oo?=
 =?us-ascii?Q?SCgR304=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M6igw8FMM6g/6Kn0akRBydpBQcXXsWypmECQA4BvAHA2l49iDI8ZcmYBID5n?=
 =?us-ascii?Q?LBVnjGUrhC32gXyTbcuU+HNqEIShTe1tZlODO/SOXO0IU3j7U/SINw9PisSN?=
 =?us-ascii?Q?/5jSNsiiIi/XC368I5JHqHMyh3kzQTUa/e/lNVcXnaLf5+7IutxY/MUm42FJ?=
 =?us-ascii?Q?iH/GF8YH/WOjvEaXOlouvksWkJ/mnwA61DprgfHdFAI/XLB5cX3cBlK9NCLQ?=
 =?us-ascii?Q?GR4G3dK8UXnrXoBSndDi3PXOw8jM/QQoBhRJO5CYIgB/0wSCUeW+bcQVdpPn?=
 =?us-ascii?Q?w3/TcTCCF9YSy5UCBVt+3miwFQCHFJe3xlJSGyIoKgvpbfaLunCifMk6kKFe?=
 =?us-ascii?Q?QhI+XWtplBWPjr5ImcQdlJBBQTAe40z21XQF/cYZJjnTNoEKLC0hhYRaK1Qs?=
 =?us-ascii?Q?pEHqxVJZYEO1aoQUwCcR+KlH3h96ckxl6UorKXIp+6dBEAstl5/CAsF12JYA?=
 =?us-ascii?Q?dKnGE7NW84PRsIhMsk092zuzQ4itd+zBXCtB1N7a0Ut9HInQ6Qs8YXM71ML6?=
 =?us-ascii?Q?YDgKPMd1DwKpsjCP4eCsAt+4DvE5mEJG1tbyvEFCrfTa8+8I29XBcq6sNZ6N?=
 =?us-ascii?Q?uBh6Iely3abhdyzsGJTOBK39ocvOjhr/O1ZMapaJ8BeShs7v1apnDFq/taNF?=
 =?us-ascii?Q?vv7IQPF3AjcsF10iDbUt2bypI4lPr5c33xVTK1NA1GBNVpfMvwpitKUV7phC?=
 =?us-ascii?Q?YczJtFFeLWEf4uO7YgXP5Him4hCyIN7om8TQrSfFOphuNEQ1xKf73KVKSHgs?=
 =?us-ascii?Q?xUmim9/rCy/klWicFMSlsfnEM9BvBlzf0o9BX9Ks2ewqXyt+Nu5DoKyCMpKN?=
 =?us-ascii?Q?ua617K8mauCAFWHwZXWvGujje6PenLDwx83//dYWXPD/zlGr2i7FJSCMXvZV?=
 =?us-ascii?Q?k7yGEifMf24Z0w4ZkKHJHLiJrdGyOr3dDIYBnAHr70hokrtR3CR6e7J0CdO1?=
 =?us-ascii?Q?4zaYeRQAruNM8t57Nq7RaEpQWzVOBnwFXlaMh0K9LRcpPriNYOjvOQdboMbV?=
 =?us-ascii?Q?34RbLj7Duj3kN9GJv0nBMdAbI3R00fyB5LrXr7o5kcFmLw4HFvZK24KYAPS7?=
 =?us-ascii?Q?7GVFRA24OQ3fP4iQZ5knSLgcgw06NryZyQJGJOe+vnh7Zz0BuDg5U4XS7Cdf?=
 =?us-ascii?Q?/DxMtxKC1/V5nuw5duWwEKWPz4nTtvEc8pRFj/Qea4zg+A+csBZDVfqMFXUL?=
 =?us-ascii?Q?FyaphBS98jz4qZ7MEthJvChYgt/BCqDdu+HBXcC7cessK0JJek6U5muZRHLY?=
 =?us-ascii?Q?QHxBR8iC8G0UgYw2MwkPdkM7NvwktdvlhT4sRd0hVC9Hdfdn1zkGmLgPIaao?=
 =?us-ascii?Q?5/HcqEgZBuUYp32cd3fZpd0mReqEU51/+1mA3YtCpjd40LRT3qqhXL4BUq/o?=
 =?us-ascii?Q?acbZ+m2/AqrixhgGOLXSACXjjxlFcyFip5sxVIBXUwIhrpP2h++oDWh9aTIV?=
 =?us-ascii?Q?hmMQTNOHbG75AIAZIqOENGDctac6ANhOVSFj1pu+heToSAXNjW/7M9wr63MS?=
 =?us-ascii?Q?tyQJa3OzLjE06uLsTm+YT+sMJdUvsd7MDjBCI/Y/HxcENrhMZ5a+ztT53Io+?=
 =?us-ascii?Q?6Potijl5LPkBJ9IbrB/pFus5VGanCWX1iG/vXl/bkttpfnU1bksMyq9LAjNd?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7853b90-b446-44eb-5561-08dcf4c084d3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 06:44:48.0198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwG1oG6tzp5eZzWAK+uDIcET9sM1CiK5qWcdL38GIBwaDnACLdoNOcicy6GfAnQ9ubyXyroJT21RLSQE4TM+tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6230
X-Proofpoint-ORIG-GUID: ckyU9Ii3hygt-ltFzVxfKlPvCeKXZ-eo
X-Proofpoint-GUID: ckyU9Ii3hygt-ltFzVxfKlPvCeKXZ-eo
X-Authority-Analysis: v=2.4 cv=eoKNzZpX c=1 sm=1 tr=0 ts=671b3e63 cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=K7KJGcXMiEKMIv-0h6QA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_04,2024-10-25_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=273 spamscore=0 impostorscore=0 mlxscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410250050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 06:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206338

From: Chen Qi <Qi.Chen@windriver.com>

This patch fixes the following error at do_rootfs:

  update-alternatives: Error: not linking /PATH/TO/rootfs/usr/share
  /man/man1/groups.1 to /usr/share/man/man1/groups.1.coreutils since
  /PATH/TO/rootfs/usr/share/man/man1/groups.1 exists and is not a link

The problem can be reproduced by adding the following lines to local.conf
and then building an image:

  EXTRA_IMAGE_FEATURES:append = " doc-pkgs"
  IMAGE_INSTALL:append = " shadow coreutils"

groups.1 is handled by update-alternatives in coreutils recipe, so
do it in shadow recipe too.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/shadow/shadow.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index b5e77b9874..171d6e27c3 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -200,9 +200,10 @@ ALTERNATIVE_LINK_NAME[vipw] = "${base_sbindir}/vipw"
 ALTERNATIVE_LINK_NAME[vigr] = "${base_sbindir}/vigr"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
-ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1"
+ALTERNATIVE:${PN}-doc = "chfn.1 chsh.1 groups.1"
 ALTERNATIVE_LINK_NAME[chfn.1] = "${mandir}/man1/chfn.1"
 ALTERNATIVE_LINK_NAME[chsh.1] = "${mandir}/man1/chsh.1"
+ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
 
 ALTERNATIVE:${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
-- 
2.25.1


