Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2196B10D149E
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 11:00:02 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48273.1774868364322742618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=jiioLVrN;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.65, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbBRRtpA/7UHs0g+UKAmo5orNGq0Zwbdm1ZcR92KQ4c1ten1ACM2a4Jji3NvANKRflZKOStjphU8VHxdGSeJsaodKP+Fw9YnctpPvK/YSu1OK6Y0Xu6buHlXvZMdQw1pRJisRQeBzT+Z0plGIWwthEj8T7xhziZtL0w9R2dQ26RfvfxbjCiAtQoW28AZSBBQgpzMHD5J7otn2d6zSJWLXE5xMv/4iQImj2Me/CA46S7QvLhhxCFB994SyjTcOxb6dwZdbbvlio2u4Mza/cDhOq3KsAYjcC1F9gj064yu8dPXeoSkSE4ZqhscaY9YvN4R6jJhNH7KZ4DLFKh8vrGsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWT7D/C/XGMSgmIea+IkFsV8TDMXj/C7VCrQUYhmvtE=;
 b=tEI3kvUyyQad2yXA8kI/tEB6CLSukU5CSmjP6tIiTeXmDc/LNBbD1sAh4NkOjSgRw5X6h6y6SQmTjWQU2NEi3JRYHHFFh1LoDNkuJ/wI9+I4BWRvBACg2osA47GK9St9mFLGW1eTWDePO0vkgi4ac/ogDOOHhWkRCZ7BQEiQlmfFCCVRk+ljc70Tj9MXdAx7876LTOnG69daV524LwDtMEu8J6Ly2VYTAVyLsRW1nhTEOHZ92wYX1mKVrJ0dhCYoXsDRmM4jAr8IbQmMSB2chmSK4Ngytj+nj8/H9vkyxLfxwfLeWepigsnBohqCGO0EE7Ce2QJT4QZCkzdc8evpug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWT7D/C/XGMSgmIea+IkFsV8TDMXj/C7VCrQUYhmvtE=;
 b=jiioLVrNNZiIH0dB9sIVTw0GI1/0xLGp7xdBqjbxvKhMc42cP8dojtDdqXrbsvG65iwDnNZUOInmfqHGWZodT78Q7Qd7YD+uLY0N8xvB/uElnwCeQBNdmDD7POlbv9LKJtiqr0gUtJsJStbS3v1dJgfNoobVlYneLoEwfrw+M7VIdSTmQIC9AqHv30lOJtWRjER1DEcbUiBZ+eW96GA02L+mF77HX8XZJo2yb+pF+GigRNBNIYYsmYFyvvGKLlJuYMLjeLK+6aQqrLH9D6sE9IOl2mHBmSh7Pm8J/mjRW0AIcNoLlku2b8Azn1+ao0L3dc9kT3O9UkBcAqathlt66g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PN2P287MB1788.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 10:59:17 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 10:59:17 +0000
From: Suresh H A <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: sureshha <suresh.ha@bmwtechworks.in>
Subject: [OE-core][kirkstone][PATCH v2] systemd: backport patch to fix journal-file issue
Date: Mon, 30 Mar 2026 16:28:33 +0530
Message-ID: <20260330105833.1009499-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PN2PR01CA0240.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::17) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PN2P287MB1788:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aae519a-7f69-4164-6b25-08de8e4b637f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|18002099003|56012099003|55112099003;
X-Microsoft-Antispam-Message-Info: 
	HaKUJv2+kkpVxQ4UcrZx8Tk8DfShU8+lS+AfkMt6tg8OXzhwTTaqOVv+OqOTM4pP3FvXNeDCHMILOO3rdKsiDDQDro8LmnRb1ne0fkkUNosCmRoi9nJ/9fP1kI1eBAGLucci83l1ygZFAbIawHYkQF0Ys/NPSWlWFZUus5e1P6Kx1dzPqx2dxfFWOAjEtIUaPqVDow/pnyrhp0Dzql3d+MwV59EV4FzBD+exZzZP/41BnbG8Ek3fV64pdG3p6vSfvWD95beCEhCF6TQ+s2sBKhdBVGLAhuYpVm8iAYLEzJS4j6/+ficJTmbrWat5aoaHbR95ZaypJ6YRY+3K6kQ6FxhJrKzcMBAW3zTZ4yQiwTqp5EemZGnfoZJTlkswi7mlJ7JHX3/Pbsrjgf8bQL1K5Kvg0STb5JgXlrQbdb2tVnI11nXFipU598vfU98O5SvXvsvJp9wz2RYeyYenD//n/DZvsjqLy5Qx6A0yFMV5If87UL6lvPZBcKCF3r1pK5pmp6cFSFpTJALeN1hIKY2sWLXCg2i5e8FCTNYnc04wT4BSEwmePPFKnU26ztBwkUoZos5ANLyEuEt0R28QI6j1+FzuSJDaQW4I8gIjsQZwe5HLd3/BYMcjEDTuOB4vMmRG7mcBsu/le3a2J++oR+CztSTCcZ2Hh9TjA/7agRhE9t5hr5/SMiOx9Ib8lEnBwqC2d6t88bC8EBO9wDdKcavKratx7fvafm0Za924lKUCYi12R4hHiCLwQolg42W9JbpCDi0Z4EgImkKVemaiWfi7EecL0CkQCJj3Sto5t8rjUj0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qc0KsvG/FAi93YXjBDqiohMTFyCf8gezQaUof2fK6d/qBJ2n7v9l8Erv/a0k?=
 =?us-ascii?Q?d7ey6564IKdxBrb176FfYPoM28viDhzcb3OHii6tBJMXnmr1qfBWqrWZzoAo?=
 =?us-ascii?Q?sSrZYz3T6m8ZzqWzGYDrKO2MdZRMiSNqqVDmZSIUmHcDvSr8YMgZnPk9uFdR?=
 =?us-ascii?Q?Jq4EBQG50nPloJ2QuytHfaJ3W00TGW4UkySnL+zkkIoFkfJNZfpkBY2FjRyY?=
 =?us-ascii?Q?GePCMuYy5waCDQPfrnfrWDJVHpHHjZdqVzHY4qT8SRY+5CPiBEtxPfWX4vYX?=
 =?us-ascii?Q?EeiSqJlcPPgEMWYrTrET9Hlsii36CjiU/ODG4LA1HRpu0lFgPIuCISuzy/vG?=
 =?us-ascii?Q?UfZNgm+6kcRvKhMqBXNXnwILGD9Xg+yeQJHQKeM9tYe7TFmOqz4w1NxXCXRF?=
 =?us-ascii?Q?nbn6lxVs4iN5zno9lRX5yUta5lSqXxCykH60und6eqHToZBUqFu9QLylxH1B?=
 =?us-ascii?Q?vB07CIY3XYg+JeEUi6ZrbJNckCORYjpF0wCkOAqP3OQ57x2EC21/l7ccsbnx?=
 =?us-ascii?Q?pQ4m1bVuItgcsZDPbq7Hf852u3sxFXstIBSlfzu3dGbcj/LHO1BkEWNxYAbx?=
 =?us-ascii?Q?dO8g71Vr91nWjdUguFfS6nyBn9ngs+cCbR/bNHlJB71AbZlY8WK2Fg11cMMr?=
 =?us-ascii?Q?GZhejwwcdU42VEmYsoI+dZkG4nW5NBbwmHCH8YXXajxxL4F6zdV5eaySflbG?=
 =?us-ascii?Q?u04De8O5ta3vx6j3YWQGU5qDIvdDkK8/59RzOLfbpdhvDpkDnYWNs81ZOP6C?=
 =?us-ascii?Q?7KDW7VOnzdgDzg8GO9QD+odGALNf418m/hhnZrhaLA8KFQNP/vg45MMIrRnS?=
 =?us-ascii?Q?hxJHUeMmmX3kBTBzi8GDAbueN9qF8tYxS76djrIeDW+Fq06Q8kbdlIrwHcwL?=
 =?us-ascii?Q?SbV83s2tkRTL3MH4FRjm+BE5ZM3WAcOxGrx7N74eBBikf+VnwlJF/nE9ZmxF?=
 =?us-ascii?Q?e9KlSAFdTl2IunnIalyKqpBq6Jf0rCO7ijZed6mWSgn0OWrmGXgiEEqa2Xru?=
 =?us-ascii?Q?cuYJa4hz5BoixhFHKvGhrm28D33U0RIRO+RagobzZZN0+LZx+VvnuzRK1BUM?=
 =?us-ascii?Q?PaTpfLy4y1TkiW+iciZPVlhsFAR0x38er1Z2DybN1AN2nv5wDjShaLkNBmv9?=
 =?us-ascii?Q?pNWqfW5IT4axHbFh/xP5eWPEABZwN9rfKVifbueLoGRcYUFux3UoL8JRCF+V?=
 =?us-ascii?Q?vIFWYMtqxpY4SCmHC5DQr3FwQN87pCeweOBcs5k+x9NWquGFXlxGOrHU9ZH6?=
 =?us-ascii?Q?17yTemRFYfyBW5AbIrB9ksx9Hgk5okzFcJtbfTm1qGNLSXxl+IUe+k76MNgU?=
 =?us-ascii?Q?Ta4saFYLk4I1eSTD+QE5GZY0cKOPSbryf+avkj7b/sSnTSIIX788h9UzoT+i?=
 =?us-ascii?Q?c/YYjkGR+AvFcI/c43nkencMbyqeEo5PRaaulWkUr9ZPoSciLQjFKnRG0i9T?=
 =?us-ascii?Q?nhN2vVJuTu3w9vEZOel2hX7wuR0THmK1QsXyOaM1ghqh/ai3dOAwSk0MFfJ5?=
 =?us-ascii?Q?qOQaVk22TAadr26VXFki98852mhIzvna5yk/iYfVLiUldrJrOSGCirQDemvT?=
 =?us-ascii?Q?fCywEqopK/2kegm4MjUUvDUbvazs4MIwLyTCN/xVCZCdWo4WyNoiP4ShR4uN?=
 =?us-ascii?Q?i9GsqdmqBfh8KonSjIMjwUXFANxVAx/bqWJ8QDw01e17iTuLe4qIEenj2ZsP?=
 =?us-ascii?Q?9zJQmFmnC5fwfG43kJxaLTErHfmvPoi0BJCcZgB5yRMpyYFWIif4q0hgdQDx?=
 =?us-ascii?Q?0X2uKLDy0O8K34ellSPZDcH1aRoI2w4=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aae519a-7f69-4164-6b25-08de8e4b637f
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 10:59:17.7601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQLN/3uWleeM0VUiYiJEKmovht6esOS/cKd9jtL90bOmuKPNqKR03DFaXKkPa2hcF08/ltNjTgtKtkZi6JtrdC/gg4IQLsfFUk+GskLlwa8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1788
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 11:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234227

From: sureshha <suresh.ha@bmwtechworks.in>

Backport patch to fix systemd journal-file assertion on removed or corrupte=
d files

Extracted from systemd MR:
https://github.com/systemd/systemd/pull/40378

Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
---
 ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.14.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0029-journal-file-do-=
not-trigger-assertion-on-removed-or-.patch

diff --git a/meta/recipes-core/systemd/systemd/0029-journal-file-do-not-tri=
gger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/002=
9-journal-file-do-not-trigger-assertion-on-removed-or-.patch
new file mode 100644
index 0000000000..c0b62aa112
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0029-journal-file-do-not-trigger-as=
sertion-on-removed-or-.patch
@@ -0,0 +1,65 @@
+From 1350f39db7e72116c3b2423db02da3ddc8e29082 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Sun, 18 Jan 2026 19:15:31 +0900
+Subject: [PATCH] journal-file: do not trigger assertion on removed or
+ corrupted journal file
+
+When a journal file is removed or corrupted, then the value `p`, which is
+read from Object.data.entry_offset, may be zero.
+
+Note, journal_file_move_to_object() checks the passed offset and return
+-EBADMSG if it is invalid.
+
+Fixes the issue reported at
+https://github.com/systemd/systemd/pull/40372#issuecomment-3762907261.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/112cb=
c37906fb97afe0ad04164262cf62d0af5e9]
+
+Comment: Patch is refreshed as per codebase of v250
+
+Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
+---
+ src/libsystemd/sd-journal/journal-file.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/sd-=
journal/journal-file.c
+index bac258ca42..7b6b7eea2e 100644
+--- a/src/libsystemd/sd-journal/journal-file.c
++++ b/src/libsystemd/sd-journal/journal-file.c
+@@ -2602,7 +2602,9 @@ found:
+
+ _pure_ static int test_object_offset(JournalFile *f, uint64_t p, uint64_t=
 needle) {
+         assert(f);
+-        assert(p > 0);
++
++        if (p <=3D 0)
++                return -EBADMSG;
+
+         if (p =3D=3D needle)
+                 return TEST_FOUND;
+@@ -2618,7 +2620,6 @@ static int test_object_seqnum(JournalFile *f, uint64=
_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -2658,7 +2659,6 @@ static int test_object_realtime(JournalFile *f, uint=
64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+@@ -2698,7 +2698,6 @@ static int test_object_monotonic(JournalFile *f, uin=
t64_t p, uint64_t needle) {
+         int r;
+
+         assert(f);
+-        assert(p > 0);
+
+         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
+         if (r < 0)
+--
+2.34.1
diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-cor=
e/systemd/systemd_250.14.bb
index 087c0035eb..8b4b83a247 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -35,6 +35,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://CVE-2025-4598-0002.patch \
            file://CVE-2025-4598-0003.patch \
            file://CVE-2025-4598-0004.patch \
+          file://0029-journal-file-do-not-trigger-assertion-on-removed-or-=
.patch \
            "
=20
 # patches needed by musl
--=20
2.34.1


