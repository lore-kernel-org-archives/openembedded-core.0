Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86970C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 10:33:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.80134.1717410796456326134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 03:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6884730cad=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4535FSUG011273
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jun 2024 03:33:16 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f1ck5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 03:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAuHOmzdVb83OhDqO5KxicS6nkJEBcRnHo5HFp81PgjnIpGe4uMHtvEJnu+cQ1nkc5fKPi2TpKFeMO9IvMre6atDcmJMqxZomhwRIOdPnbZ83bD4TnDNQEv8gOIpPk++Nh8TuRjUfBafy04y5Bk9TdIUjilg7YMJspxMVQJBTcI2nxIz2sjL73uuL1jUbIzMzq3mnCXWRpwUURDLf6VYETfrgc81BBHOJPtTB6rFXBpwXfyY7/goojgILjpyXmjd+esNkFrE/r554TFPPPHyUZYtxiUM3KR1D5R5nD5cX4oL6qeUKYg7Fi1nQx/tJ7GG8atFEkjwPPJx0IGOTY5gkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rR6rtHFNn3ry0LXCmbvaZ6uR9w9xg/amQ8eu6mAKxYk=;
 b=nm07aECS+YJRZyU8ErGxlDgqEM2nXqQrryab+hL0kwqq7YfHZDOX7JWaFPsDogq2DzYFVCTStamaVcNkfCK3aIMA+wX4Idv4rYXvJHrrkQpPVwuVMqDQfnrIjEy2aNz7Ulf/cw3mNOjCJFJSJ3xgajFWRZctDvkLTgvu0BiTmJy5+VwJuQfrglDlbfMkzribrW+PPJEieMm9M9zbKo9yvBG6gIVmqfEYHIxaCsABcL60TuZNhMZ99A1AYhxsBmyInU9OeCMveGZzOhZnrQ250vvkeKUgcW6q5cV9dOxCOlD4JL6htoE63bUgwvH7gCT4RuJibmT+TQR4f5vmjmpsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.33; Mon, 3 Jun
 2024 10:33:12 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::4e72:f734:5886:b658%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 10:33:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libcap: upgrade 2.69 -> 2.70
Date: Mon,  3 Jun 2024 18:32:59 +0800
Message-Id: <20240603103300.1626507-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0113.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::17) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: b20578b6-f3ec-4447-6488-08dc83b891a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|366007|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X5H621+3Upx0Bf0gGFx/JjDbo0l2N6Oz/eRQZUXaGquNcENfE0z4XkZGYlym?=
 =?us-ascii?Q?uZ1omNjB1UbAoNKyePx/O+gCLm6jpMY2UKub8S/XlsSpiRkzlJlaEQ1wYr1q?=
 =?us-ascii?Q?pnmpRRLqF0WrWffk+vNLfOdr0PmidS9RvKp2q73qmiqob+DmezU1sj+06jAO?=
 =?us-ascii?Q?4g8uSXTBQdQ0iABYfwAok6kdbFzqwvBLgJiw54Cff56/tlFkm2LIFt8g9U81?=
 =?us-ascii?Q?t0Kq4YLDgRD02LUIg5k+q3L9AlK/X29xnNwGRtnhcK33bUfS7mY4hcd3wA5C?=
 =?us-ascii?Q?O/toXvXivAalRiGg2B3lc9sW+CDz+MGRZPQMw/lL5O1S3M1qjINMt9NZTPOo?=
 =?us-ascii?Q?Yf3dCf7Hr5Oi6AJSkCz58s8QP1U8JN7Va2cmHFE9qpT+S2geR/jlcQCdxUtx?=
 =?us-ascii?Q?SLqsA63iFs+lcrqvAPto3mjZPektA7wEveyLeREZ+lAxhlHqSXkrLxfLFTwD?=
 =?us-ascii?Q?jLuZjrt5jn2m+Pb955qYIW7rHdqB7Clp390JOy5iKbyg8lOOLmx9bcg57RBP?=
 =?us-ascii?Q?40awUwASDjglnVoMpoSH+kevSfz0I51j0yHoUj99TU1TZqMun46xx7R/FrXo?=
 =?us-ascii?Q?QWK4HSQc7nE03eXO/TkAiS+ycRUzm4heHzC/aKtXnvXMPNF2jPfvGLMmV+gr?=
 =?us-ascii?Q?RIhgz1oX837g2vQ2VvpNRyBhMGe7W3wfmEfNDGdbR18pT2rx2C5mS3Q8WPpB?=
 =?us-ascii?Q?jPc23sLqMSkzgS9FHMuf73f+swLhQEjF0hqZ7APG5XqDUihPal/R5MFgqrfx?=
 =?us-ascii?Q?kL2e5dZflOuJcgjBs9TEdLjQnKybPqWTDjwR0kxrhsLcaOqJGfGzbT81X3aZ?=
 =?us-ascii?Q?jYpJ3Z+P+KaZQEyvEkJA0vKh6qhi7fW5ty1mPq4q8yaF7ByUvvyRyTtrWqyG?=
 =?us-ascii?Q?Y0X9Z5iK5GSLr334KI1ncyGd2u6ZsvfxNwH+uHGWpqHX40tUNiVcC+UJsVKq?=
 =?us-ascii?Q?ByamEAtqaKHYcL3Bg+flnoB/vUszS+ejJm7S31+Mqg5HuM+NlxxCaOATt3eV?=
 =?us-ascii?Q?bjSVxqMFE3i7V20E3JKP+Rr2yIKivCoiwjQc/pziBqQDdjQG9M3o2gE2Dt8L?=
 =?us-ascii?Q?9pvfHS4hITMKDd6ckSGyUANPKm6vHZ2B2HUdHgzlC+4WTyZxRsUIqxcSH1na?=
 =?us-ascii?Q?ew1k1OZk4KNgNUn9Ccw5ek388msJVhgmGX7pGO7xFCtUyLgP7V2mtx33ej2U?=
 =?us-ascii?Q?Yex/GG5NwRDGNcoY5LhHkeGw24ry4EHiwjjXq0BusIcxsYDlZEMT1UK8DxVw?=
 =?us-ascii?Q?D1jo+7Mw+I/lnJhP6QG+BWp8G0Dz+Z6y3VHtVvbC6Vo7jChetEaAhRMYxyqp?=
 =?us-ascii?Q?IoHonNxblHuov5fcmxleOOaEGEc892ahkZlJBsIiUW3ptw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L1L33jPyUj+M2LxTPQbL6A3ikRFMZrDASgw/d6pjP0tla4VSYld7rgTBhYNI?=
 =?us-ascii?Q?oCWJq7M8UUaOEjKokok1jtkQVMIKsGf9eecf4mnEURi2/pV9lu2trNnuHrNH?=
 =?us-ascii?Q?0RPpC8M8SmQJh6sko9z6JeQSUHEeJoYWNml/EW7M2JLrekPlF/S+yeDWrA+e?=
 =?us-ascii?Q?Bb+ofE1Je03ACKhS9Kzd8CcyTYIUvR7cHj1Ch7CBIRHhDxT3PwVUUh+ekmMj?=
 =?us-ascii?Q?8Joa+tIKWgqmmBZKLICNh0ETn+N4RI7KdYAJpnlusrM9vipnZryhg4OP3KGf?=
 =?us-ascii?Q?wdhytvXTCIewZAExGyu402VLfLz0Iw6kimlhdgXIN6l+Hj7MWGJUUCLO6rEr?=
 =?us-ascii?Q?j99QhdI/vz8a559GmznTJFH5EFGWEajoLKgZOlKYmddSMJqd7v7C0YSGa8/4?=
 =?us-ascii?Q?1kWwMzvF31sgSTZS98ciclzN47gA5J+tHxixr1mJUr7C8mc8TroXIPTXbwCp?=
 =?us-ascii?Q?XcT38QTwxx3JP14MFt01asTnrMH5NUV/fyH0z2DnXj4Cr7qxZtvWnqXp+7vD?=
 =?us-ascii?Q?n5O/9KQOoofbEXol3FXfP0pa+jttvzSuLD+mtAY+hNOrESyFdu2O0QgQWrlm?=
 =?us-ascii?Q?mOO7P9RPQk3BMeXp6xXfEu0DEg0s/TJ2qtUTvvrZrPSXRdBvpYpI1S61qwgP?=
 =?us-ascii?Q?k9Vscj6QLDS8XejAtFFIOyfy9qJQQEOG27k6Nj6wIsjnSDKlHJ4/Rre4TEg1?=
 =?us-ascii?Q?iEPMxh1yD8WbMT7f779si4dF1leu0tVrqOjNa9jhCgDR1LOLqsYq3RaJxSrL?=
 =?us-ascii?Q?cgZm4j3hVadiSn0lw5WMwMV7hK4PuctYm7iGyOr4uvCFFszl+llKKRiFvc/3?=
 =?us-ascii?Q?0lopvd4oAHqj5KUVk8X469ObZ+HTCn6SPbUjsRCce4rmujCdQXkhKSnn2nWj?=
 =?us-ascii?Q?VDcL54SKdAZ5FUVfKqKIqgqwWGLx0JFwsDbpO3YSxOhSwxw5FKtM/H+lYTjK?=
 =?us-ascii?Q?nSqe3n/EHP2MhlSYr7UpIh8xIxA7C3G/8qGSP61qtS8JQm55goi+6rdN99Ms?=
 =?us-ascii?Q?6oAqUKiMfZqqtTiOfR3O9CDw7k4wCFyPQjXSHjc4kUIlvuLZivMBvpj1S9V1?=
 =?us-ascii?Q?+iBjkQPqPjpajHYWoSAvnqw86ivGpiUDLR/QKL5h8YI6tayC26iAmzFVpWLP?=
 =?us-ascii?Q?CXPhkZpHv2jUz+zxU6gnPnAc0oeMBH2yez4hlT+Tdlp6FlZfP1q1uwd5g1Rx?=
 =?us-ascii?Q?3ah6tTguDxSVmxyx5E16hbnbezEE/eZqq1VeTrQj6IitQx7ZRrgDyQXfESFo?=
 =?us-ascii?Q?wKTUmAksbOxSLfuW9kAYf9Uw6QwKif/xAGOeeWQ8K5cwyy7cffvgKjbNvBwl?=
 =?us-ascii?Q?C8YE1YQnoUCceumhnxsbzaC+Zdqqcr1ad/qqCk9VAzvYHaGMhgh5IRF2IEa0?=
 =?us-ascii?Q?Z2Q6dZqvXRuZ1L8f1tdZ4ls3o3wwSK3g5SfW2gxhzod9IkAc3wUarIKMUnlc?=
 =?us-ascii?Q?Cp3duUXTf3C+m5S/b+hoy8+EtCX4VfvQFElJYk5dhrJL/MEdJCptkfdwkseb?=
 =?us-ascii?Q?VZ496dkoq/T1J6ABtqQNODXtrj4WKtRQ5FCNBLPy9+GqxaJ3Q65fCU2wQvZV?=
 =?us-ascii?Q?O81uJWmOyxQU98+EGQ/i3ZIFOFQ7vxQHweWxWjxZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20578b6-f3ec-4447-6488-08dc83b891a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 10:33:12.2114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c87rx3BkInzA5S13fWzx2zBJutusBcgBL9Ihud4fhlVk3qYcKAJ+LMUPz/pOXZzhaeYK7PM1qteSSIUVu49BUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
X-Proofpoint-GUID: kfuXMe8OdAVspWJi-FjSadCgTVbuB0sd
X-Proofpoint-ORIG-GUID: kfuXMe8OdAVspWJi-FjSadCgTVbuB0sd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406030088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 10:33:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200244

Release notes for 2.70
* setcap changes to make it harder to set invalid file capabilities
* Lots of documentation fixes
* Fix c89 compilation syntax for the C code in the libraries
* libpam has deprecated providing the _pam_overwrite() function, so use
  memset() instead

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ATTR_NAME_CAPS-is-defined-when-it-is-use.patch | 15 +++++++++------
 ...bcap-Raise-the-size-of-arrays-containing.patch |  5 ++---
 ...0002-tests-do-not-run-target-executables.patch |  3 +--
 .../libcap/{libcap_2.69.bb => libcap_2.70.bb}     |  2 +-
 4 files changed, 13 insertions(+), 12 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.69.bb => libcap_2.70.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch b/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
index 05c771ac10..e77d0c8c51 100644
--- a/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
+++ b/meta/recipes-support/libcap/files/0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch
@@ -1,4 +1,10 @@
-Ensure the XATTR_NAME_CAPS is defined when it is used
+From 2261f47bac78aa77934ca03980ed54d1d86116b9 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Thu, 23 Jun 2016 16:26:43 +0800
+Subject: [PATCH] Ensure the XATTR_NAME_CAPS is defined when it is used
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Upstream-Status: Pending
 
@@ -15,10 +21,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcap/cap_file.c b/libcap/cap_file.c
-index 40756ea..e27ca80 100644
+index 0bc07f7..37bc34e 100644
 --- a/libcap/cap_file.c
 +++ b/libcap/cap_file.c
-@@ -25,7 +25,7 @@ extern int fremovexattr(int, const char *);
+@@ -44,7 +44,7 @@ extern int fremovexattr(int, const char *);
  
  #include "libcap.h"
  
@@ -27,6 +33,3 @@ index 40756ea..e27ca80 100644
  
  #if VFS_CAP_U32 != __CAP_BLKS
  # error VFS representation of capabilities is not the same size as kernel
--- 
-2.8.1
-
diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index 2ac1e6e560..ecbdd22099 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From 709aa8e156415215b0bb034d05b2aa2f44be044e Mon Sep 17 00:00:00 2001
+From fcb0166c5e991fcf62797b19bea39983214289cb Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
@@ -14,13 +14,12 @@ the strings in a certain path.
 Upstream-Status: Inappropriate [SDK specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  libcap/execable.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcap/execable.h b/libcap/execable.h
-index fee17b4..5bb0c55 100644
+index 7a2d247..682e0ee 100644
 --- a/libcap/execable.h
 +++ b/libcap/execable.h
 @@ -23,7 +23,7 @@
diff --git a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
index 20346cf2fb..31f27e914f 100644
--- a/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
+++ b/meta/recipes-support/libcap/files/0002-tests-do-not-run-target-executables.patch
@@ -1,11 +1,10 @@
-From 10212b6d4e8843feffbeab5336342d97f3a46bb2 Mon Sep 17 00:00:00 2001
+From a3368b38abfb703e730fc5462f42cc5d177d864d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 20 Dec 2019 16:54:05 +0100
 Subject: [PATCH] tests: do not run target executables
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  tests/Makefile | 2 --
  1 file changed, 2 deletions(-)
diff --git a/meta/recipes-support/libcap/libcap_2.69.bb b/meta/recipes-support/libcap/libcap_2.70.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.69.bb
rename to meta/recipes-support/libcap/libcap_2.70.bb
index 92fa766d37..6e2fd728e2 100644
--- a/meta/recipes-support/libcap/libcap_2.69.bb
+++ b/meta/recipes-support/libcap/libcap_2.70.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "f311f8f3dad84699d0566d1d6f7ec943a9298b28f714cae3c931dfd57492d7eb"
+SRC_URI[sha256sum] = "23a6ef8aadaf1e3e875f633bb2d116cfef8952dba7bc7c569b13458e1952b30f"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1


