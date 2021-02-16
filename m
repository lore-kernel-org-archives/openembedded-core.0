Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.81])
 by mx.groups.io with SMTP id smtpd.web12.5302.1613464764065857943
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:39:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=qnqPgY41;
 spf=pass (domain: kpit.com, ip: 40.107.138.81, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJgp6JgaOd9/vXVKrDYH43+RxnZq6D8zM5nkgkS68BUu6C+AvvnXHISmZR9qMLz9pD+EKPDUGNH1t+lJdaXTxMrN3G4lRX/Vvh2aElS6NdrCPILnNvREf9gU/mJRRcsKDBU7uvHpT/TEb8M5bFnYcpcnDJfazYMuEUs6UKl4NjZztznuwXE1Se9/g+Fk/YlkmUu5/4C+BXU8KIf7EslXjLtF9YPuh0KdyVcW78gC9ByWo1JgrT5j55ygaKzI9VHZXtOZsgSs3DXptxcJAIiwYoHgEOwLHU3nAWjl2UYy0Z9dGDd28YuEMdP5nJPMXmBfB1UFtmoAZcdgb1C4UHOKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw6j7mc4qRxxcbWdlLFhJiFX+/o0phiZ3XwdefB4cGk=;
 b=HHG67r2MkSzRindOLffmenvZsvWKj3Hmcc5PDAKa7fWLviXKQfL1EpA1VkCMVlQRZ5ibLipOCGyPjKug52eTkEaoi5Eh0Rd8Rn36MIjq5CzUCMB3ztLzt1nyuw4h2R7ZrpBV8IpYVDGqeTdpu9zPwxkV3/5I86cKqBv7zsiKC4dSdQ9s9yAdlEJ7W/rv1RV6MAVm78wxR7HOIDv+AjxxgxWkj+DS2waHKuq+VsJaQ3PIvvkTfuBYTtRGG19m/xJhAi+PXVOxThQwYBl9Kc95TstNDHeLiKgfORxo8mtV1PsI8LYYmI/hbYewvGfWwTwcgrF8w7UZTikwkXkFT+lFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw6j7mc4qRxxcbWdlLFhJiFX+/o0phiZ3XwdefB4cGk=;
 b=qnqPgY41mUdDPQxq+AyuzbU8QO894ij+jG9AKY7tkTmiGle1SRUgvX5HXLmeQCnGgsg0V01askwynNB2leQJFQPGp3SO0V7yTCFdU5BRSA/9BSAXcuHpBNvlyTXwTcq97F/nlJyYst8WG9K2y7NITcdOr911VHwPICoYiK420X0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BM1PR01MB4852.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:14::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 08:39:20 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5c87:1000:2e85:9ab7%7]) with mapi id 15.20.3846.039; Tue, 16 Feb 2021
 08:39:20 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Rahul Taya <Rahul.Taya@kpit.com>
Subject: [meta-openembedded][dunfell][PATCH] nghttp2: Add fix for CVE-2020-11080
Date: Tue, 16 Feb 2021 14:09:00 +0530
Message-Id: <20210216083900.7631-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [182.70.89.188]
X-ClientProxiedBy: BMXPR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::28) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (182.70.89.188) by BMXPR01CA0042.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26 via Frontend Transport; Tue, 16 Feb 2021 08:39:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 49d18e1b-521b-4100-b0c2-08d8d2565a00
X-MS-TrafficTypeDiagnostic: BM1PR01MB4852:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB48522B1492DA341491BB67ABF2879@BM1PR01MB4852.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fU/u9ycXf/nWUKUkZNBiEyAbuAokgZ94wO1+EKCAFOwT+S38qSakvDIV+yq9Tp5QJjG1IoTrK9hkaOPOMjUr8F5IoOBFcrVE0tE2c/4NACqszTUwqDBjmvqeIOKS5yM3ICCY+X0j3JWHGM1aHf8U/HYzDDrJO8zQiSAhMOn2+b5zSqDncoFjWQgWmQHB+7sC+6ohEsslYdoy8OfiHo6PtfJcKCr1ZHNm+tHNMSyHeNIZ6fGBeWeG1JmlE0QmX3L7UwGCN4y8LsM2y0r1D0VVYfysCXN+98H/tnHmPfz//3dVhnkzJaKR9LgDtaN/JtOebFZZjKOuRn6sGk5HPH1PJAGnKXyG1NXRNLdlj6F32xQud0+z1hmcHHehTjmfsLwaq+loSqnVHU+DytqQBjiVHuNbZQRBKouDAP6SwQmQ3+hejeYk7eUkLQ+bhQfvBgg8l44lsMnpihUO/Gyv2RZmboAMy4nGZ4w+FnWmcrVd0Qsoo+am/bzyWPRoXvtm6zF4/GF5VLuM3/f5zSfaNtSStUhB0cFIYhGXjqkTN0lJ2OEwxC/ECSR2ITFXSnH3GdtwIN5VjDwp4RwSvTC/evIenDejKLh/lsPUjuS4okC2woz/SQJO7NbReRpch7uevGQQlSW8Ldjrq9qkUY7UJX+KwqU6b3j9wuXaNzYepbgZhzvSwupPhqV5i8wVTdbYE1HL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(39850400004)(396003)(86362001)(6512007)(66476007)(966005)(83380400001)(6506007)(4326008)(66556008)(36756003)(1076003)(66946007)(107886003)(8676002)(478600001)(316002)(69590400012)(2906002)(30864003)(5660300002)(2616005)(8936002)(956004)(26005)(6486002)(6666004)(52116002)(66574015)(16526019)(186003)(120606002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gfINShw5LkmKUgaL+VAnsp5EHcVGDaFBIkbC3GH5KodNM0NkR3vpYwKI9GMW?=
 =?us-ascii?Q?7SHt9Rlfae4jglxjrCITSh0VM5uTQSb05Cg10t2JNIcMaBYdzxhDqyJ+zCjV?=
 =?us-ascii?Q?F0/QEVyUbAZ0IT467KUjl+siUaUIcEE+rIEqDf7JO4yeKZHMWXyHfxvWRp/G?=
 =?us-ascii?Q?XtbYh5R69Pwz2jdkhIInQsl/upns+GTdAqhuzVshE1T0eoN1ujnYXNH6Z3St?=
 =?us-ascii?Q?Syj5ZuqZXHWrn2l8pGDnNKfD8IBKocr7tOoqZURW7zGU47hEN3G2rFMKtzYC?=
 =?us-ascii?Q?s8OY8x/+f/YFK+3yp461GX8K7OKLZHKcqt44Be3g6qQVcYFE7eqvSmSGsp/K?=
 =?us-ascii?Q?oJGYRb67rXQLush7opOtWtMNqPG9p8MKY8rl5P0lrkjdrw7e2jqwJxaYVEGL?=
 =?us-ascii?Q?Wcot4f+IAuy9iSlYA+au3yc8sfj16cUJOg/ERdsl9uUY2MwSti0Cg7Viwgrl?=
 =?us-ascii?Q?qNx8ZdxgqZnqnWNQCTpzX6QsaD7LK6NXXYLL09dKDE3ymL0chckbhgK0kSdE?=
 =?us-ascii?Q?AYiAKl8m5mjIomCvjVlN67dUMVvxPeH7jyui3NLc8QFedQ6n4WB7yLYfhdLw?=
 =?us-ascii?Q?Rwfu7qgvXK1SAZ0XxnjnAraR0EtauO20Kl9QiSnqXWer0CVyxB2FRJg3h0WF?=
 =?us-ascii?Q?GecGGpd67fTNfT1AIBdDtMO39X7tXemQqPzXbd0tCIR0V0nWC/UL2VGcYV+/?=
 =?us-ascii?Q?U31v8fCkK7HvVYAeEef14RIgvOXxCEvCgUZsm3s1KQLZJGfKp19svfsXUjCQ?=
 =?us-ascii?Q?n5WSk+yql4uJJRGkIwIlSsf9pYVmUdJjceSDFTn6+VpmMw9hoEr0R368uR3Y?=
 =?us-ascii?Q?EteNJ/qP3liH7RxvolZmBEZ3CFBKXtKklNG7fyHiCIR/Z3Kh9UmPPfj+eHFN?=
 =?us-ascii?Q?3WJebd67mg135eEObxF1Dtx73cKxkgPq238EfNepeqziPwU8rNYUlo7MmSmD?=
 =?us-ascii?Q?cVUhFnCBtkJmEimPSc4hUxh8A9iArOKQige7llt8eRyqN6hLqQyYYP/kL2O6?=
 =?us-ascii?Q?YeC1KZHBONOe9k91OB1D9gryUtNkZ/Iz7/P554tCe+fSRj/qoLuP1/qoK46/?=
 =?us-ascii?Q?JKau2gfwPauBEziOS9EP1YCkqLb5M+13bySUu8+diFWKHN3u8RT31ZYhtMHJ?=
 =?us-ascii?Q?6jiu49ekCUllrtokncHde4mHOkRkpivV18rx7NXm1zaaXv89Pozpp2uHElJE?=
 =?us-ascii?Q?PMR55KHrNVGO2+1M5v1awuj9kFUK9t0TRBsAKXdhSYnqwXzwWf6PKM5LArcB?=
 =?us-ascii?Q?kxFTpGIxNjIXc8IH3rst8nIutLL+nrjwIxxQjhRCTap3NSOvgTwACgeQg/2S?=
 =?us-ascii?Q?bPKeXLs7x7e+jc7L2EY4SjUj?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d18e1b-521b-4100-b0c2-08d8d2565a00
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 08:39:19.5288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeoVGKMEf/WrQH8EX13GNkAi8a02g0JzkVWi6r/oAopN1Vo9RGsahh4tvr6MpaA8dD/D7oamtii2lK1FAo02yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB4852
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Added patch for CVE-2020-11080 taken from below link:
https://github.com/nghttp2/nghttp2/commit/336a98feb0d56b9ac54e12736b18785c2=
7f75090

Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
---
 .../nghttp2/nghttp2/CVE-2020-11080.patch      | 306 ++++++++++++++++++
 .../recipes-support/nghttp2/nghttp2_1.40.0.bb |   1 +
 2 files changed, 307 insertions(+)
 create mode 100644 meta-networking/recipes-support/nghttp2/nghttp2/CVE-202=
0-11080.patch

diff --git a/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080=
.patch b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.pat=
ch
new file mode 100644
index 000000000..a376e5372
--- /dev/null
+++ b/meta-networking/recipes-support/nghttp2/nghttp2/CVE-2020-11080.patch
@@ -0,0 +1,306 @@
+From 336a98feb0d56b9ac54e12736b18785c27f75090 Mon Sep 17 00:00:00 2001
+From: James M Snell <jasnell@gmail.com>
+Date: Fri, 17 Apr 2020 16:53:51 -0700
+Subject: [PATCH] Implement max settings option
+
+CVE: CVE-2020-11080
+Upstream-Status: Backport [https://github.com/nghttp2/nghttp2/commit/336a9=
8feb0d56b9ac54e12736b18785c27f75090]
+Comment: No hunks refreshed
+---
+ doc/CMakeLists.txt             |  1 +
+ doc/Makefile.am                |  1 +
+ lib/includes/nghttp2/nghttp2.h | 23 +++++++++++++
+ lib/nghttp2_helper.c           |  2 ++
+ lib/nghttp2_option.c           |  5 +++
+ lib/nghttp2_option.h           |  5 +++
+ lib/nghttp2_session.c          | 21 ++++++++++++
+ lib/nghttp2_session.h          |  2 ++
+ tests/main.c                   |  2 ++
+ tests/nghttp2_session_test.c   | 61 ++++++++++++++++++++++++++++++++++
+ tests/nghttp2_session_test.h   |  1 +
+ 11 files changed, 124 insertions(+)
+
+diff --git a/doc/CMakeLists.txt b/doc/CMakeLists.txt
+index 34c027929..f3aec84da 100644
+--- a/doc/CMakeLists.txt
++++ b/doc/CMakeLists.txt
+@@ -42,6 +42,7 @@ set(APIDOCS
+   nghttp2_option_set_no_recv_client_magic.rst
+   nghttp2_option_set_peer_max_concurrent_streams.rst
+   nghttp2_option_set_user_recv_extension_type.rst
++  nghttp2_option_set_max_settings.rst
+   nghttp2_pack_settings_payload.rst
+   nghttp2_priority_spec_check_default.rst
+   nghttp2_priority_spec_default_init.rst
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index 4d73cef50..f073bfa4c 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -69,6 +69,7 @@ APIDOCS=3D \
+       nghttp2_option_set_peer_max_concurrent_streams.rst \
+       nghttp2_option_set_user_recv_extension_type.rst \
+       nghttp2_option_set_max_outbound_ack.rst \
++      nghttp2_option_set_max_settings.rst \
+       nghttp2_pack_settings_payload.rst \
+       nghttp2_priority_spec_check_default.rst \
+       nghttp2_priority_spec_default_init.rst \
+diff --git a/lib/includes/nghttp2/nghttp2.h b/lib/includes/nghttp2/nghttp2=
.h
+index e3aeb9fed..9be6eea5c 100644
+--- a/lib/includes/nghttp2/nghttp2.h
++++ b/lib/includes/nghttp2/nghttp2.h
+@@ -228,6 +228,13 @@ typedef struct {
+  */
+ #define NGHTTP2_CLIENT_MAGIC_LEN 24
+
++/**
++ * @macro
++ *
++ * The default max number of settings per SETTINGS frame
++ */
++#define NGHTTP2_DEFAULT_MAX_SETTINGS 32
++
+ /**
+  * @enum
+  *
+@@ -398,6 +405,11 @@ typedef enum {
+    * receives an other type of frame.
+    */
+   NGHTTP2_ERR_SETTINGS_EXPECTED =3D -536,
++  /**
++   * When a local endpoint receives too many settings entries
++   * in a single SETTINGS frame.
++   */
++  NGHTTP2_ERR_TOO_MANY_SETTINGS =3D -537,
+   /**
+    * The errors < :enum:`NGHTTP2_ERR_FATAL` mean that the library is
+    * under unexpected condition and processing was terminated (e.g.,
+@@ -2659,6 +2671,17 @@ NGHTTP2_EXTERN void nghttp2_option_set_no_closed_st=
reams(nghttp2_option *option,
+ NGHTTP2_EXTERN void nghttp2_option_set_max_outbound_ack(nghttp2_option *o=
ption,
+                                                         size_t val);
+
++/**
++ * @function
++ *
++ * This function sets the maximum number of SETTINGS entries per
++ * SETTINGS frame that will be accepted. If more than those entries
++ * are received, the peer is considered to be misbehaving and session
++ * will be closed. The default value is 32.
++ */
++NGHTTP2_EXTERN void nghttp2_option_set_max_settings(nghttp2_option *optio=
n,
++                                                    size_t val);
++
+ /**
+  * @function
+  *
+diff --git a/lib/nghttp2_helper.c b/lib/nghttp2_helper.c
+index 91136a619..0bd541472 100644
+--- a/lib/nghttp2_helper.c
++++ b/lib/nghttp2_helper.c
+@@ -334,6 +334,8 @@ const char *nghttp2_strerror(int error_code) {
+   case NGHTTP2_ERR_FLOODED:
+     return "Flooding was detected in this HTTP/2 session, and it must be =
"
+            "closed";
++  case NGHTTP2_ERR_TOO_MANY_SETTINGS:
++    return "SETTINGS frame contained more than the maximum allowed entrie=
s";
+   default:
+     return "Unknown error code";
+   }
+diff --git a/lib/nghttp2_option.c b/lib/nghttp2_option.c
+index e53f22d36..34348e660 100644
+--- a/lib/nghttp2_option.c
++++ b/lib/nghttp2_option.c
+@@ -121,3 +121,8 @@ void nghttp2_option_set_max_outbound_ack(nghttp2_optio=
n *option, size_t val) {
+   option->opt_set_mask |=3D NGHTTP2_OPT_MAX_OUTBOUND_ACK;
+   option->max_outbound_ack =3D val;
+ }
++
++void nghttp2_option_set_max_settings(nghttp2_option *option, size_t val) =
{
++  option->opt_set_mask |=3D NGHTTP2_OPT_MAX_SETTINGS;
++  option->max_settings =3D val;
++}
+diff --git a/lib/nghttp2_option.h b/lib/nghttp2_option.h
+index 1f740aaa6..939729fdc 100644
+--- a/lib/nghttp2_option.h
++++ b/lib/nghttp2_option.h
+@@ -67,6 +67,7 @@ typedef enum {
+   NGHTTP2_OPT_MAX_DEFLATE_DYNAMIC_TABLE_SIZE =3D 1 << 9,
+   NGHTTP2_OPT_NO_CLOSED_STREAMS =3D 1 << 10,
+   NGHTTP2_OPT_MAX_OUTBOUND_ACK =3D 1 << 11,
++  NGHTTP2_OPT_MAX_SETTINGS =3D 1 << 12,
+ } nghttp2_option_flag;
+
+ /**
+@@ -85,6 +86,10 @@ struct nghttp2_option {
+    * NGHTTP2_OPT_MAX_OUTBOUND_ACK
+    */
+   size_t max_outbound_ack;
++  /**
++   * NGHTTP2_OPT_MAX_SETTINGS
++   */
++  size_t max_settings;
+   /**
+    * Bitwise OR of nghttp2_option_flag to determine that which fields
+    * are specified.
+diff --git a/lib/nghttp2_session.c b/lib/nghttp2_session.c
+index 563ccd7de..415e34776 100644
+--- a/lib/nghttp2_session.c
++++ b/lib/nghttp2_session.c
+@@ -458,6 +458,7 @@ static int session_new(nghttp2_session **session_ptr,
+
+   (*session_ptr)->max_send_header_block_length =3D NGHTTP2_MAX_HEADERSLEN=
;
+   (*session_ptr)->max_outbound_ack =3D NGHTTP2_DEFAULT_MAX_OBQ_FLOOD_ITEM=
;
++  (*session_ptr)->max_settings =3D NGHTTP2_DEFAULT_MAX_SETTINGS;
+
+   if (option) {
+     if ((option->opt_set_mask & NGHTTP2_OPT_NO_AUTO_WINDOW_UPDATE) &&
+@@ -521,6 +522,11 @@ static int session_new(nghttp2_session **session_ptr,
+     if (option->opt_set_mask & NGHTTP2_OPT_MAX_OUTBOUND_ACK) {
+       (*session_ptr)->max_outbound_ack =3D option->max_outbound_ack;
+     }
++
++    if ((option->opt_set_mask & NGHTTP2_OPT_MAX_SETTINGS) &&
++        option->max_settings) {
++      (*session_ptr)->max_settings =3D option->max_settings;
++    }
+   }
+
+   rv =3D nghttp2_hd_deflate_init2(&(*session_ptr)->hd_deflater,
+@@ -5657,6 +5663,16 @@ ssize_t nghttp2_session_mem_recv(nghttp2_session *s=
ession, const uint8_t *in,
+           iframe->max_niv =3D
+               iframe->frame.hd.length / NGHTTP2_FRAME_SETTINGS_ENTRY_LENG=
TH + 1;
+
++          if (iframe->max_niv - 1 > session->max_settings) {
++            rv =3D nghttp2_session_terminate_session_with_reason(
++                session, NGHTTP2_ENHANCE_YOUR_CALM,
++                "SETTINGS: too many setting entries");
++            if (nghttp2_is_fatal(rv)) {
++              return rv;
++            }
++            return (ssize_t)inlen;
++          }
++
+           iframe->iv =3D nghttp2_mem_malloc(mem, sizeof(nghttp2_settings_=
entry) *
+                                                    iframe->max_niv);
+
+@@ -7425,6 +7441,11 @@ static int nghttp2_session_upgrade_internal(nghttp2=
_session *session,
+   if (settings_payloadlen % NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH) {
+     return NGHTTP2_ERR_INVALID_ARGUMENT;
+   }
++  /* SETTINGS frame contains too many settings */
++  if (settings_payloadlen / NGHTTP2_FRAME_SETTINGS_ENTRY_LENGTH
++        > session->max_settings) {
++    return NGHTTP2_ERR_TOO_MANY_SETTINGS;
++  }
+   rv =3D nghttp2_frame_unpack_settings_payload2(&iv, &niv, settings_paylo=
ad,
+                                               settings_payloadlen, mem);
+   if (rv !=3D 0) {
+diff --git a/lib/nghttp2_session.h b/lib/nghttp2_session.h
+index d20827315..07bfbb6c9 100644
+--- a/lib/nghttp2_session.h
++++ b/lib/nghttp2_session.h
+@@ -267,6 +267,8 @@ struct nghttp2_session {
+   /* The maximum length of header block to send.  Calculated by the
+      same way as nghttp2_hd_deflate_bound() does. */
+   size_t max_send_header_block_length;
++  /* The maximum number of settings accepted per SETTINGS frame. */
++  size_t max_settings;
+   /* Next Stream ID. Made unsigned int to detect >=3D (1 << 31). */
+   uint32_t next_stream_id;
+   /* The last stream ID this session initiated.  For client session,
+diff --git a/tests/main.c b/tests/main.c
+index 41e0b03eb..67eb4a1c2 100644
+--- a/tests/main.c
++++ b/tests/main.c
+@@ -317,6 +317,8 @@ int main() {
+                    test_nghttp2_session_set_local_window_size) ||
+       !CU_add_test(pSuite, "session_cancel_from_before_frame_send",
+                    test_nghttp2_session_cancel_from_before_frame_send) ||
++      !CU_add_test(pSuite, "session_too_many_settings",
++                   test_nghttp2_session_too_many_settings) ||
+       !CU_add_test(pSuite, "session_removed_closed_stream",
+                    test_nghttp2_session_removed_closed_stream) ||
+       !CU_add_test(pSuite, "session_pause_data",
+diff --git a/tests/nghttp2_session_test.c b/tests/nghttp2_session_test.c
+index 6eb8e244d..33ee3ad84 100644
+--- a/tests/nghttp2_session_test.c
++++ b/tests/nghttp2_session_test.c
+@@ -10614,6 +10614,67 @@ void test_nghttp2_session_cancel_from_before_fram=
e_send(void) {
+   nghttp2_session_del(session);
+ }
+
++void test_nghttp2_session_too_many_settings(void) {
++  nghttp2_session *session;
++  nghttp2_option *option;
++  nghttp2_session_callbacks callbacks;
++  nghttp2_frame frame;
++  nghttp2_bufs bufs;
++  nghttp2_buf *buf;
++  ssize_t rv;
++  my_user_data ud;
++  nghttp2_settings_entry iv[3];
++  nghttp2_mem *mem;
++  nghttp2_outbound_item *item;
++
++  mem =3D nghttp2_mem_default();
++  frame_pack_bufs_init(&bufs);
++
++  memset(&callbacks, 0, sizeof(nghttp2_session_callbacks));
++  callbacks.on_frame_recv_callback =3D on_frame_recv_callback;
++  callbacks.send_callback =3D null_send_callback;
++
++  nghttp2_option_new(&option);
++  nghttp2_option_set_max_settings(option, 1);
++
++  nghttp2_session_client_new2(&session, &callbacks, &ud, option);
++
++  CU_ASSERT(1 =3D=3D session->max_settings);
++
++  nghttp2_option_del(option);
++
++  iv[0].settings_id =3D NGHTTP2_SETTINGS_HEADER_TABLE_SIZE;
++  iv[0].value =3D 3000;
++
++  iv[1].settings_id =3D NGHTTP2_SETTINGS_INITIAL_WINDOW_SIZE;
++  iv[1].value =3D 16384;
++
++  nghttp2_frame_settings_init(&frame.settings, NGHTTP2_FLAG_NONE, dup_iv(=
iv, 2),
++                              2);
++
++  rv =3D nghttp2_frame_pack_settings(&bufs, &frame.settings);
++
++  CU_ASSERT(0 =3D=3D rv);
++  CU_ASSERT(nghttp2_bufs_len(&bufs) > 0);
++
++  nghttp2_frame_settings_free(&frame.settings, mem);
++
++  buf =3D &bufs.head->buf;
++  assert(nghttp2_bufs_len(&bufs) =3D=3D nghttp2_buf_len(buf));
++
++  ud.frame_recv_cb_called =3D 0;
++
++  rv =3D nghttp2_session_mem_recv(session, buf->pos, nghttp2_buf_len(buf)=
);
++  CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);
++
++  item =3D nghttp2_session_get_next_ob_item(session);
++  CU_ASSERT(NGHTTP2_GOAWAY =3D=3D item->frame.hd.type);
++
++  nghttp2_bufs_reset(&bufs);
++  nghttp2_bufs_free(&bufs);
++  nghttp2_session_del(session);
++}
++
+ static void
+ prepare_session_removed_closed_stream(nghttp2_session *session,
+                                       nghttp2_hd_deflater *deflater) {
+diff --git a/tests/nghttp2_session_test.h b/tests/nghttp2_session_test.h
+index e872c5d0b..818c808d0 100644
+--- a/tests/nghttp2_session_test.h
++++ b/tests/nghttp2_session_test.h
+@@ -156,6 +156,7 @@ void test_nghttp2_session_repeated_priority_change(voi=
d);
+ void test_nghttp2_session_repeated_priority_submission(void);
+ void test_nghttp2_session_set_local_window_size(void);
+ void test_nghttp2_session_cancel_from_before_frame_send(void);
++void test_nghttp2_session_too_many_settings(void);
+ void test_nghttp2_session_removed_closed_stream(void);
+ void test_nghttp2_session_pause_data(void);
+ void test_nghttp2_session_no_closed_streams(void);
diff --git a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb b/me=
ta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
index 9ed8c5642..b212ede4d 100644
--- a/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
+++ b/meta-networking/recipes-support/nghttp2/nghttp2_1.40.0.bb
@@ -10,6 +10,7 @@ UPSTREAM_CHECK_URI =3D "https://github.com/nghttp2/nghttp=
2/releases"
 SRC_URI =3D "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${=
PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
+    file://CVE-2020-11080.patch \
 "
 SRC_URI[md5sum] =3D "8d1a6b96760254e4dd142d7176e8fb7c"
 SRC_URI[sha256sum] =3D "09fc43d428ff237138733c737b29fb1a7e49d49de06d2edbed=
3bc4cdcee69073"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
