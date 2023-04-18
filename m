Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE04C77B71
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 05:50:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1764.1681797015612027979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 22:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3472b19045=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33I5XufU020542
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 22:50:15 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q01kdjxqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 22:50:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOVzZ04LLHy2rRmCLzarHS6t9ge1Mzzd8fbWjlsIEpiFfzVPtRdYRcS4cXnIFTxAoPTr4qMG7ZvR+4/FATAfs5suCSWD7ff4v9PCZSPv3MgGpZdJwHh5wKdKVoMQ6eGRmQFF2PxmLRqm7i3hPIa5FBY/HJIT9TpVM/RYlq09O2Co8C06CX8TkVa7b9NAHTka73m+dSnc0YMOx0YTHz5gW/pA45GDTuflqTzEdOAxooanOO4FKRjmLdK5r7aAcW8fsmOs39Y0pXdVpbjxZo2U1N5TBHt7oZYMZ5JW0cyFhBcGUanmWKOVY2WgAFrsdDaC8IgLtqKFST4F+ZuAfebLnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GFoA4C76ydC2TJhdZoZh8GBoV9ss0wAyvdNveVn03Q=;
 b=hMW8qgqAHbhbXEL+G0Ndj5e3JLdra4+m7MIgZrQmov/W4zPDPZzGm3SlhUUsOlMTG3ciYuImQKGYcp6e9yu1efNScrkCSqwrfXTd+S7hUJTmNWCpowteHe4PzHUOEEwrluvGlwBMxiX/YaYDtLBMV7r3DdsWLFRzPGTlXViNTs2EOeOHhqOtnwD/DceRtmXruhM1X675bTrnw7EBqbBXCDY1ynb8XiohOpPVEG/zpBjJQjx18MqvN6oFsOww0n93swQD3kBwiNHQon9yVRFPr07dWg6O8WPHm9ob9NKLcKnQJvGwn2yi15F05JekE8m2WDpjUtMDbcW9GB64ofYPIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 05:50:13 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008%8]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 05:50:12 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] shadow: backport patch to fix CVE-2023-29383
Date: Tue, 18 Apr 2023 13:49:51 +0800
Message-Id: <20230418054951.228055-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BL1PR11MB6052:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cda09da-0616-44df-008f-08db3fd0c6ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uKLryHM2kC+xd6I0jLlkxeYGUD0pBbuiCiicyJZ5MjjXGDv1QyT05gx1zPY0/nsfKAQfW2GO/bRU/IxYuqu+ADnDjCNxksjWFfmaCgtHw/ESaOpxfTjBKsavND3S0hwQsM616XUql6CuM9NqRA6iK0xSBYph85vhzqPURyj3fix13on1WsVZ4a/BUyJc/hb31da6Fyadf1VHlt8SG6CpCxkHBQjIXRaG+LZkhUlHTa3gtegd5gxMZ2gQsdOyTmd3uIM/2pnmbQ6WMpDIvvwAyMAlEpRJSLMEvGfO3NC+lRfbaJGf8oOVhMx60TJUNSbHVuCxympBgGuJGFTTc0eyimRMcaWfDobAahU9/ktj9TSr2DmyfooNsFWAX/M8QkIgWtPMrMwsVdDI2LH3UIU0qTOHTL1quUli20fV/OPWHKOZKtDxVtwddYsJOL004wJZlRELzXKB5svigCmU7f4xY5IPyJr0W92jAnze/YHQJ1mGNg64tRVDAT/qyMPAR9uqwCR23pSoKzXYvJkc5/PhrapXxvL5DPCqWA5+SM9Tp4KkZ0IFWjTGdJnnKJsn1XANIoGU9aSdIwzHlMCuGAxXvUqjGZYw0Lm1VMM8Xh6HGCDPMclJXI/U3LYyUi+M9RRK91qZpyMCKweVHq8v+dWZsw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(451199021)(6666004)(6486002)(478600001)(2616005)(83380400001)(186003)(1076003)(6506007)(6512007)(26005)(83170400001)(38350700002)(38100700002)(52116002)(6916009)(316002)(66476007)(66556008)(66946007)(2906002)(44832011)(8676002)(8936002)(5660300002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0beS4HKzeKzgy0Cw0XwiwOdOX8J/p2Ml/KNe4JYl9CLujenPhRB3IBWoubKc?=
 =?us-ascii?Q?3oMW6ePDrbDV0VsN/RZiGuKOar+S2dNkVL1znLi01wbbVFXb17LSuqGXF8s1?=
 =?us-ascii?Q?ltZJzMsdzb2LkRxLc2hRvNCYKUAlvYuojMY1QkEO3ZZIdnAIROywnQ6vfae4?=
 =?us-ascii?Q?Qf1Gzn3E1YodUKQf3wTiw4OtNph5Wuj4WX03s7Z8xRFkWaNR0V78q6SdqaAw?=
 =?us-ascii?Q?TXDIadU+l8VY7XzZaM8FA8UVubOe3Z7fViwl/f5/FXjNn3dPVBbl9a4cHIcM?=
 =?us-ascii?Q?iXyx8pVkrTCeuPFQj8+pTbCfI9QPXvZs5A8/06yGXsRUpvxKTd6x8XIZ4YvJ?=
 =?us-ascii?Q?hRd5g7NKx03adZtF67U0b0PpI0UILg4JRzp0mG2FlMIcU9xuBDB4zioc8RVi?=
 =?us-ascii?Q?o+/RT1uzVFVn2Dx/VMJTIJbacTedz7GMQy9XynnO5cd9DNu0pJT74fZICfiu?=
 =?us-ascii?Q?vfdWrTuM1qhTaoFTLQ8wVKIgQlhLWmwTaetD5jAcTZxO4DwuszbSUGX2dNf6?=
 =?us-ascii?Q?qAPiKzehzxON/Y2J+alne6/xIIy0Z6v/QgC6+mxRZGn86OeYxosYKIRBddt0?=
 =?us-ascii?Q?jKstt4qcK5EBIa5NlNhWqs8PZqGhCIicqGZjW+79uQH+m69cbQSf3ALhbYb+?=
 =?us-ascii?Q?9Mx/xuZUhTI2EjpJk2eRwH7uPqA3v6zmjy3bjznVO0u/VBIcPp3LlEaZZ2zt?=
 =?us-ascii?Q?zPTX1NDT30Lyn4d+aQQrfPCvz1tGWcaqvw8aFFczkMnb92DJ/KdcE66IiF7h?=
 =?us-ascii?Q?oMs6ZxTCYAOEKodfiz4h3iEBVioIz04ubGmqlPyEH5G4REj/C3bXemVUiAiW?=
 =?us-ascii?Q?shHOm0lrGLsPhKCRueHFpjh3oHuVBmmasGO02a3bnWeiS/OQFMwFmZigdH12?=
 =?us-ascii?Q?IfxLd++9KFhLL0bHIJGsu/f//YDMj9iGXzpGAYgk4Dsws9PUJw48lGG3w57g?=
 =?us-ascii?Q?hthdTciOmk9/fydVy+ZJfufrquANWuo3OV0HJp0vQxeCHsiRhD8yu/mqBD8A?=
 =?us-ascii?Q?87sICVgrA8uMlangVXQdhD2xOqcZ/sfttjd6j4Y3QNUilpNhffJhZf7irEVK?=
 =?us-ascii?Q?w9sOyLmQITyOehPO4KtMXMVlUA4u6jayhF6c8xJIx4wBSzyQDY65N8DXTNH0?=
 =?us-ascii?Q?kd/rdgwEmkAo6QFnNxhmMDA2e0CoPFwc2e5bxCZAXjJ19rZXj7rUFO0+ZVPe?=
 =?us-ascii?Q?UgdJMvyqsjnuL7vdEQc4tE+KwJBQLCXokBp1qwoRgbPAm/OIKV31qo6KJlx+?=
 =?us-ascii?Q?BI0/hHutxtEwysinuV4Vtk1++LM7kd0VxMYK40pez19eH9NsYmhHWJWDb3Pg?=
 =?us-ascii?Q?UayaUe81wtENxsBWFVFl+SbgFpK3qI6Py6ZTlh7qCbbwBq3y0LytpIOupxuM?=
 =?us-ascii?Q?WnmQwMzKZhHR3VWnGmvbmOwkbatzWOby4dECUky/BJTaYn9uoFn9G56huHKM?=
 =?us-ascii?Q?3Sh7aJzoFApHf/tPaLh1x5YjuzDTSQhECdBQjanmfLF/iiIdxAS4JkcXoey8?=
 =?us-ascii?Q?rLCHKU9/itz6eROWAozsl/+fG3HZ/q0Qo7RUCJaz3qkWLLD69gT2LgoBa16m?=
 =?us-ascii?Q?zuoNQ06X4V0JqWQdbosyW9AUOSVXKZDsqsOHVKwEox+tLtLLmANmq4yT0Pdv?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cda09da-0616-44df-008f-08db3fd0c6ee
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 05:50:12.8098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyTRIERMIgH16tjS+gk38RobO8Qw2NQgs0XKX/dsd9oFi/8MBFoPGNTHdik1lsTlZCe4OJxJm7eF14GAC8Vl/2lww4Z9Y65+Ygz7Hl9D3ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
X-Proofpoint-ORIG-GUID: X07XfJF2AWkqgNdfgL97-GCchcEELRUJ
X-Proofpoint-GUID: X07XfJF2AWkqgNdfgL97-GCchcEELRUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_02,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 05:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180178

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../0001-Added-control-character-check.patch  | 53 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Added-control-character-check.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Added-control-character-check.patch b/meta/recipes-extended/shadow/files/0001-Added-control-character-check.patch
new file mode 100644
index 0000000000..f53341d3fc
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Added-control-character-check.patch
@@ -0,0 +1,53 @@
+From e5905c4b84d4fb90aefcd96ee618411ebfac663d Mon Sep 17 00:00:00 2001
+From: tomspiderlabs <128755403+tomspiderlabs@users.noreply.github.com>
+Date: Thu, 23 Mar 2023 23:39:38 +0000
+Subject: [PATCH] Added control character check
+
+Added control character check, returning -1 (to "err") if control characters are present.
+
+CVE: CVE-2023-29383
+Upstream-Status: Backport
+
+Reference to upstream:
+https://github.com/shadow-maint/shadow/commit/e5905c4b84d4fb90aefcd96ee618411ebfac663d
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ lib/fields.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/lib/fields.c b/lib/fields.c
+index 640be931..fb51b582 100644
+--- a/lib/fields.c
++++ b/lib/fields.c
+@@ -21,9 +21,9 @@
+  *
+  * The supplied field is scanned for non-printable and other illegal
+  * characters.
+- *  + -1 is returned if an illegal character is present.
+- *  +  1 is returned if no illegal characters are present, but the field
+- *       contains a non-printable character.
++ *  + -1 is returned if an illegal or control character is present.
++ *  +  1 is returned if no illegal or control characters are present,
++ *       but the field contains a non-printable character.
+  *  +  0 is returned otherwise.
+  */
+ int valid_field (const char *field, const char *illegal)
+@@ -45,10 +45,13 @@ int valid_field (const char *field, const char *illegal)
+ 	}
+ 
+ 	if (0 == err) {
+-		/* Search if there are some non-printable characters */
++		/* Search if there are non-printable or control characters */
+ 		for (cp = field; '\0' != *cp; cp++) {
+ 			if (!isprint (*cp)) {
+ 				err = 1;
++			}
++			if (!iscntrl (*cp)) {
++				err = -1;
+ 				break;
+ 			}
+ 		}
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 2c70a2d00e..e8f58f30dd 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -14,6 +14,7 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
+           file://0001-Added-control-character-check.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.32.0


