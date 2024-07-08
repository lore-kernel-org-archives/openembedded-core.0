Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C45C3271E
	for <webhook@archiver.kernel.org>; Mon,  8 Jul 2024 09:34:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.75826.1720431262474096039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jul 2024 02:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7919244e77=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4685oVJ0027287
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Jul 2024 09:34:21 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 406u4x1jd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 09:34:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADtS5nYTrIoZIlG2eay5dzvpsHtz/fVK7QN8uzRgTeBZWQgcwDMx6BScNOJGmVd5lVZbQUAyIo5EfObDsAOq8zGh71PDKkJ+bIUj74u4IsNd3ZOYdOEBws5dcTWA8gTL/P/f4n5OE5SF3NLpF48IDhdhNYjFdqBXhn5ZpNeIKlQUuh1cB4cLqnQLQHWBeO0JPpdvHVDJq2gWUiIQk7GOHyOll3dgZOymZcwWtv+zbU26A2cCTCFO1SOPJUJp2V8Hds5mrujg1Xs4AmHDWu1tUqEjOaBe5bUAfZB01jPF3l9+3KUGSDC9kwrfkKH6IZXs8/uJ/SSGdo7nc55cUL6Rtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TjbJcTvJ0zPsaRU5uw8XoA0RlL7SlWY813gLDHHdS0=;
 b=Nz2QJ2wXzX4ka3q05akX1GN+8fS4mtHf6yJ1wSnVpN5fnicY9eSbgeu/Jt8Cj1KGDmmXEGKmArMNHXZaWWrkbHEgd8WEsvyVzwH8qQmhwKE8O/pAyJHdtTswTT3EkoxkNXIJpQ/u9QI9Xt/mcC9Epnd6h9HwjGB+j/1Rs9u2BPkv9vvWGxJf0zHA5SKn/KIt43jx2QPN3bl0brW6BaqDOnODu5igc31GZ55PVHpO6cOuuSnzUML3or/bNARmjKzic7QqNv+JZQd6OMPr7WIkB2wiIo4oK/1m8Nwo5De+qRu4TXrngqD2QBSniYUIG4LvodM3Jq2fCuGfU3KoPV2xbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH7PR11MB8597.namprd11.prod.outlook.com (2603:10b6:510:304::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Mon, 8 Jul
 2024 09:34:19 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3%5]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 09:34:19 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] qemu: Upgrade 8.2.1 -> 8.2.2
Date: Mon,  8 Jul 2024 17:34:04 +0800
Message-Id: <20240708093404.3606176-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=yes
X-ClientProxiedBy: TYAPR01CA0023.jpnprd01.prod.outlook.com (2603:1096:404::35)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH7PR11MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 1619ba40-0c2d-42fe-9ddb-08dc9f312429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UegovYl0qTHoclQ9XEVi/8Llxx6R0fKs3hraPSPYQIH3YFToDI943u6MYgWT?=
 =?us-ascii?Q?pb9XUCdX6g76LoGcziGWbqSO4axSiXPfzr/2ZyG4FE7eE0/08vPPp/MuDhdB?=
 =?us-ascii?Q?riT/nvfCKFZOKXm/hMmQPRqzmA6XbKjP0xS8GOmEl3J82Wipx0j2Q6UQaR31?=
 =?us-ascii?Q?PmKNHF5DYz3G0BTPL4h8ij88KGxqZPFFjxEWCXO8cbAaPvlE4BTFK5911N9A?=
 =?us-ascii?Q?jaR8TB+kXXkH7qRDRa2skyW1I8EXZOyP4/6Pt8V3WQeJ7CP4Sahbjza0d/+d?=
 =?us-ascii?Q?EQ0doW+tDFiS8ZkW8276eh7fUaeI+f7pqSoAbng2nVpH8pArMjmgYFajDH6u?=
 =?us-ascii?Q?Kqi+iKllaGzX04tFkedIiqFmsMJ4tuMomN3u7eGTarGP5Sk8vPaICwfYo5c2?=
 =?us-ascii?Q?lGk8fwIZVCQNpRYBBL1RGysmisk1TbWQNPA3dTn6jZN9kllC7/G3K10LqNpc?=
 =?us-ascii?Q?q1gL7xbVgWcyveyzbwbzbyHZDbszZ8i56vgnBtl2owwEaSh/8a0j/zwUFXTO?=
 =?us-ascii?Q?iEf5/Xhpws848Y3xAPR82WsnEpNdxv4BgNDNo+Fm5mrtbc84HHu9QqmmmbQR?=
 =?us-ascii?Q?hocilhP02EsKzbRwEA85X7hVwbetZKlJ8wpHfJ1PKZJqF46Hyz5jgoSbZdeO?=
 =?us-ascii?Q?dbk0TCRti8J0mkP/7Zjnl3hV0LESCDTU+T51QJyG2Iy9xDiSQeoNEwvhH92O?=
 =?us-ascii?Q?F8gv0c5prcCXgPJAquEpdYTxhjj8hqNqbfgbAppGmaeye4fTzmnRe+uGRW5A?=
 =?us-ascii?Q?AhFWo1Xm8WUEGiY0zNCh6vBdSF4hMvETaUD+g6unqcjsM5yxjJPElqrhoZRu?=
 =?us-ascii?Q?GgDZGXSjSyrJnQ+IjPAN0ZPmAVI67SqJauYnRwwk/yqhr1jyply9otbRXFSw?=
 =?us-ascii?Q?nrRNEicBfh3sN1b6UjO/fYO7P2D0qf8zdaMbUc25IzqW2N/YybLRlCC6xLRl?=
 =?us-ascii?Q?nNFn+sqfpRlxy2vONtck5ldmXz6oZS4eb18l3j3hc4Ig7O/g49gYNtHGM+q3?=
 =?us-ascii?Q?6IvOZnxhHWAxH1eQg8ntR0eaezV0Z0kO2cscrxxMG0Q7UCnuIpxQIfVpZflv?=
 =?us-ascii?Q?ywiMJi73noEVU0sPXNF7WUKvLPxmYiHn4p7GSe9lIAcCWK8c3xGH/Aa/MfmG?=
 =?us-ascii?Q?KDT1sDTsZ6LhbiwnYUicqmoJB5tHM1rAODA7yZhhNDSLShiiquKHZX7F1pGT?=
 =?us-ascii?Q?1et9uTNutAvmQUva49gbefN9M4JMSNUPJkBS9/5f9QO3f1mT3nJfCF2Hsx6U?=
 =?us-ascii?Q?4Ckh0R/6Qry/14jBRI7p67SpEvcehrAAYIDktRMw4Wde97jddG0MrdN2nO2C?=
 =?us-ascii?Q?v/BgVRZoU6814/c9gZyVq3XpggNHhJOSMknMu6/XU7ir3+AgcwUsoIngM4Ot?=
 =?us-ascii?Q?7oJQp3c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2AcSZHwKDZ/3VNDS4Khl9+fcy8ZeIS9Lz3+ubqpR3xI+jLUnpWD2UeRquDTR?=
 =?us-ascii?Q?PprjvvYghBxnAr5TRraES42H1gXWoNQmDWtdYhIHO2W3weYRy61ZbFpFnSco?=
 =?us-ascii?Q?kSTxVCBljhPUOnhkw+zlw7NZcI+cAzcPGyhbcysOQaSVGTQL/3W/7UEbtI2z?=
 =?us-ascii?Q?IddCiU9jFN9/Xgo4AQRCNHLGznt4WY6wK4jus7yfz7vxp7MybaZeRBzMrpHb?=
 =?us-ascii?Q?yXfYLzWYyBVS2YhY8G5JxaGZRGWbcaoILOCsSpQ+YRKgsKcVp1kIQY3VQsQF?=
 =?us-ascii?Q?8qalB7D2evmXM2Mg67rpDz+k1q0/aI6DGg7s3c/5G7x6X5GqcolMlnPz2z+/?=
 =?us-ascii?Q?4GLlPQZqCR2LahMLeADIZBDUwGMVkyK8KvS7ZOsve8+oYUaJsIPUjMjPufx+?=
 =?us-ascii?Q?ZiI7SZFXK8PBUV6YCmU8zBlfW1ue07ORcgvt4ziZE/NMGLi2CT9kDXsPrj2X?=
 =?us-ascii?Q?nKiXfISdQhgzCpOg7TbM743AIizqNiyaUdRQqoZ1L/kGLcJLG15f+TFegR38?=
 =?us-ascii?Q?dl0oRznU672YLAG0tM4E7Eow90UuGUPzuQ2v6krIPWLBwhIhcWY64sBf+PAx?=
 =?us-ascii?Q?WCNRgnK0gizqvfWBaQq00kpHX/mdYqccRt0nwFpOM9YSP6Ai8CPKIMjCQKUf?=
 =?us-ascii?Q?4IJj8nHBTBxuefxIDmINuP9bjgzIoiFiFOCPyUPQnFewvFN4xDJT3A2vpBQG?=
 =?us-ascii?Q?MvgQ/sDbKANbd677nNKRCZ3OiPxiTRDbx7vzHvtLJBE86zS0DAKLu5McyiL1?=
 =?us-ascii?Q?+SDzRiSdnXDRHgJRDzmci/WJN5p6RluSaWDWmssnMjN+YqvhBl01AqT63gzh?=
 =?us-ascii?Q?a0xO8IrHIHu/Cas5bIxVcJtAaBFzFKBG16DoNTjVH4MsqSPKE1xAGnIqYqlx?=
 =?us-ascii?Q?i4p+9DaiMc5iwglRGWyu2NeZ4jm7J3l3RXI46DxxMvebytj9I16tw7gFqxch?=
 =?us-ascii?Q?D4wC3Vrla1CpenNVnNPaU2LPEbvW2+kZMq6pEn/gMjmixkwAehmTe6+I9mps?=
 =?us-ascii?Q?1ycp3HTjOlXoXUKpAtwACZyQUYDXiIjmr+7K6Hu8MwojYlWs4tKOCzCOiiZH?=
 =?us-ascii?Q?P3DPfxcZqLFwJeidqWDDdxBoMoNH+y6mn1BY7I+3wqQDw3LXF+7SleE/kCaq?=
 =?us-ascii?Q?qd4aFTlqamoRWdRC6/eLVbnYN5VXpAlc0ZlgV1ltWbVbs3iC6F1K45YFFKP/?=
 =?us-ascii?Q?049XQxvK2aLEQTqKK+Ifx4ol2UyUAU04Cyn4JbJpjRh7zEnTehTHHqG+4o2G?=
 =?us-ascii?Q?CWaBOvOh2fs8ofL+i6TORvSl8qerFxxt0j34wJz4U1fzGkp2MNSYgW32djx6?=
 =?us-ascii?Q?ml+rm8cU1SK9QkyCyB7qwXivNw4wQO3kKt2YmMP8xwWSKgQ4hSI/iU2Guawc?=
 =?us-ascii?Q?ch5D6Yx1mvxWFngomrpKCmIaDIMQq2XgNtK4MYE+c8jVY/w0GCte4OmVHwnn?=
 =?us-ascii?Q?3p2By9uMNH68/LyAwKTapVFixCBK9z7+XRXn5ZwENxRn4MZqFFJbAaRvoqjj?=
 =?us-ascii?Q?7/xS7poiXhnujgOFf+arK1GGxwh1e94HZ4ajHXXH4G/kj9v1sus1pxVOU5ls?=
 =?us-ascii?Q?eaOHMfncVEcVIQWGzUYyN4RAyBopm8m/eP/1ItrovKSzY+HYGEQpHeb0E1cx?=
 =?us-ascii?Q?1A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1619ba40-0c2d-42fe-9ddb-08dc9f312429
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 09:34:19.0195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXHMP347U1ZPtDogIFKO3qnxDS+fvOUbpH79gHM5riA0lGe/0EjaaWDiADsoVKgcDWFs+w0lqTm/mL7AFnFKmQ2q7mXaKqfs3yy+Z0i+CmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8597
X-Proofpoint-ORIG-GUID: ocBwRCdYdAzcJA0_OmicaalcFkrd3Cx8
X-Proofpoint-GUID: ocBwRCdYdAzcJA0_OmicaalcFkrd3Cx8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_04,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407080074
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4685oVJ0027287
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jul 2024 09:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201632

From: Xiangyu Chen <xiangyu.chen@windriver.com>

This was a bugfix release, this version fixed several important fixes
according to upstream.

Dropped CVE-2023-6683.patch since already contained the fix.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...u-native_8.2.1.bb =3D> qemu-native_8.2.2.bb} |  0
 ...e_8.2.1.bb =3D> qemu-system-native_8.2.2.bb} |  0
 meta/recipes-devtools/qemu/qemu.inc           |  3 +-
 .../qemu/qemu/CVE-2023-6683.patch             | 91 -------------------
 .../qemu/{qemu_8.2.1.bb =3D> qemu_8.2.2.bb}     |  0
 5 files changed, 1 insertion(+), 93 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.2.1.bb =3D> qemu-native=
_8.2.2.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.2.1.bb =3D> qemu=
-system-native_8.2.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
 rename meta/recipes-devtools/qemu/{qemu_8.2.1.bb =3D> qemu_8.2.2.bb} (10=
0%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb b/meta/recip=
es-devtools/qemu/qemu-native_8.2.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.2.1.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.2.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb b/met=
a/recipes-devtools/qemu/qemu-system-native_8.2.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.2.2.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 4501f84c2b..328a4d3bdd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,7 +39,6 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0003-linux-user-Add-strace-for-shmat.patch \
            file://0004-linux-user-Rewrite-target_shmat.patch \
            file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-se=
lf-.patch \
-           file://CVE-2023-6683.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
@@ -58,7 +57,7 @@ SRC_URI:append:class-native =3D " \
 	file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch =
\
         "
=20
-SRC_URI[sha256sum] =3D "8562751158175f9d187c5f22b57555abe3c870f0325c8ced=
12c34c6d987729be"
+SRC_URI[sha256sum] =3D "847346c1b82c1a54b2c38f6edbd85549edeb17430b7d4d3d=
a12620e2962bc4f3"
=20
 CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC server can=
 expose host files uder some circumstances. We don't enable it by default=
."
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2023-6683.patch
deleted file mode 100644
index 732cb6af18..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 405484b29f6548c7b86549b0f961b906337aa68a Mon Sep 17 00:00:00 2001
-From: Fiona Ebner <f.ebner@proxmox.com>
-Date: Wed, 24 Jan 2024 11:57:48 +0100
-Subject: [PATCH] ui/clipboard: mark type as not available when there is =
no
- data
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-With VNC, a client can send a non-extended VNC_MSG_CLIENT_CUT_TEXT
-message with len=3D0. In qemu_clipboard_set_data(), the clipboard info
-will be updated setting data to NULL (because g_memdup(data, size)
-returns NULL when size is 0). If the client does not set the
-VNC_ENCODING_CLIPBOARD_EXT feature when setting up the encodings, then
-the 'request' callback for the clipboard peer is not initialized.
-Later, because data is NULL, qemu_clipboard_request() can be reached
-via vdagent_chr_write() and vdagent_clipboard_recv_request() and
-there, the clipboard owner's 'request' callback will be attempted to
-be called, but that is a NULL pointer.
-
-In particular, this can happen when using the KRDC (22.12.3) VNC
-client.
-
-Another scenario leading to the same issue is with two clients (say
-noVNC and KRDC):
-
-The noVNC client sets the extension VNC_FEATURE_CLIPBOARD_EXT and
-initializes its cbpeer.
-
-The KRDC client does not, but triggers a vnc_client_cut_text() (note
-it's not the _ext variant)). There, a new clipboard info with it as
-the 'owner' is created and via qemu_clipboard_set_data() is called,
-which in turn calls qemu_clipboard_update() with that info.
-
-In qemu_clipboard_update(), the notifier for the noVNC client will be
-called, i.e. vnc_clipboard_notify() and also set vs->cbinfo for the
-noVNC client. The 'owner' in that clipboard info is the clipboard peer
-for the KRDC client, which did not initialize the 'request' function.
-That sounds correct to me, it is the owner of that clipboard info.
-
-Then when noVNC sends a VNC_MSG_CLIENT_CUT_TEXT message (it did set
-the VNC_FEATURE_CLIPBOARD_EXT feature correctly, so a check for it
-passes), that clipboard info is passed to qemu_clipboard_request() and
-the original segfault still happens.
-
-Fix the issue by handling updates with size 0 differently. In
-particular, mark in the clipboard info that the type is not available.
-
-While at it, switch to g_memdup2(), because g_memdup() is deprecated.
-
-Cc: qemu-stable@nongnu.org
-Fixes: CVE-2023-6683
-Reported-by: Markus Frank <m.frank@proxmox.com>
-Suggested-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
-Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
-Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
-Tested-by: Markus Frank <m.frank@proxmox.com>
-Message-ID: <20240124105749.204610-1-f.ebner@proxmox.com>
-
-CVE: CVE-2023-6683
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/405484b29=
f6548c7b86549b0f961b906337aa68a]
-Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
-
----
- ui/clipboard.c | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/ui/clipboard.c b/ui/clipboard.c
-index 3d14bffaf80f..b3f6fa3c9e1f 100644
---- a/ui/clipboard.c
-+++ b/ui/clipboard.c
-@@ -163,9 +163,15 @@ void qemu_clipboard_set_data(QemuClipboardPeer *pee=
r,
-     }
-=20
-     g_free(info->types[type].data);
--    info->types[type].data =3D g_memdup(data, size);
--    info->types[type].size =3D size;
--    info->types[type].available =3D true;
-+    if (size) {
-+        info->types[type].data =3D g_memdup2(data, size);
-+        info->types[type].size =3D size;
-+        info->types[type].available =3D true;
-+    } else {
-+        info->types[type].data =3D NULL;
-+        info->types[type].size =3D 0;
-+        info->types[type].available =3D false;
-+    }
-=20
-     if (update) {
-         qemu_clipboard_update(info);
diff --git a/meta/recipes-devtools/qemu/qemu_8.2.1.bb b/meta/recipes-devt=
ools/qemu/qemu_8.2.2.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.2.1.bb
rename to meta/recipes-devtools/qemu/qemu_8.2.2.bb
--=20
2.34.1


