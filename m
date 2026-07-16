Return-Path: <david.nystrom@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B6EC44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 15:24:22 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15538.1784215457640856099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 08:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=U1wOvpkr;
 spf=pass (domain: est.tech, ip: 52.101.84.70, mailfrom: david.nystrom@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pe/Lpv5TUf5at/U4s8dUaFArcbAp7FS9+0nmKnDyf1uXpIDIB7DHguMUZyXwVMuMSunwysSRjKQE5gNyZqyfXVGXZsJVSOfoJATmy1RwSsMcACNFH/5ocoJWu+mS0nd4z0YJTsB14RVKWnS5DddKcHVYQYjLpK8d5mVs5sD3ISFOTUGeSRS7tYMoQr5eBIpUY+8XDO4uWHncKDiUSeFl9oi1TzBygI1nDRlGLWzgTJcp7/b/zEEJrhZDQdZ/9VZXR4pphk3JuPZMXPTAmIoT2SOs5vgovKkpV1AoYJpvLKDyyIh+28ZcnWLOEsVyZJXvCYvjItJx/aMSSDN6jj9qiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8K45u95mGbXN+US2XvBYjLe9ZmkKs87XilfJSHOtZI=;
 b=hciaU74eUAbdkU4ydQESfco6h3+qKahieM0SPkFa24vFcqMcBx8cjbEQdMudqfU25snvB0WzUJubO/27gRk4/gNMmpNstorr7axwpDzu8gWaZInsnYXo5fkCaD3cVCMSwAIPHCrOSNm8NtbyXbc+NuhmgSWjb+PtPkxktKVfDjdche9nlZloe4A7OU/knRQr5vA93KJg2Sje/orpFSaH2RoHutSw4EKfusLqxNbs4BaxD8L+iqHz9Lu8TJC5b40LLI/ODc+hQpfGgfL9ss6361r1W7S8bV4OrIzpkiBUL09oeP9jOKSzpNyRqkVQLhB2TUPOoD7CNYZLXPhVytgwPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8K45u95mGbXN+US2XvBYjLe9ZmkKs87XilfJSHOtZI=;
 b=U1wOvpkrb8Eo6j0p39luZeJ2C3/i4mLuLoMMBmU7OHEmFThSAXbZ7+aW+svizZJFGkJlaYaUGi0NWrmbq5VKy4EDd226pHTxaojW4EKE1tWf8b47iD30YFnAdOYvykYi79pK5R6S464woolehhVr3h+E5b4I4TPlIk8JXiw5tT6XRl0l/B7zi62/+B2uPGUEc8mjvMHm7ZysefxwtcPIEkB7/eTHd0KkQcU+WDLWFgNv+HKObbgOoiqbEQsZf2anrZM9ZdAqkhClcW7x/AH1CaVw2qFKM/6cE7/48sW7xiJ2511iokG/P9gYH7Md//rWZVUJnX2CnFcI0G8ae687sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by AMBP189MB3216.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.4; Thu, 16 Jul
 2026 15:24:14 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%4]) with mapi id 15.21.0202.014; Thu, 16 Jul 2026
 15:24:14 +0000
From: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
To: openembedded-core@lists.openembedded.org
CC: david.nystrom@est.tech
Subject: [OE-core][PATCH] libssh2: Fix CVE-2025-15661
Date: Thu, 16 Jul 2026 17:24:01 +0200
Message-ID: <20260716152401.1247325-1-david.nystrom@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF0001A32A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::696) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|AMBP189MB3216:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e6f258-a1c3-491d-1008-08dee34e4b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|12006099003|11063799006|3023799007|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	87d7xUogd52D5iEeJtcDrdv1VDN9+4HRu3DrMzNwJS5pM6J1vni+SLP+polqBvt1LEgd5rLx1OTRhV0FhjJ2IORycii4iexUSW6viyg4+7IFXVTA41reHXUJWzKotNuVeQXbgKFc0IONATDUDw5PtvoICHIKVh05AWMUL5m+OO0QE/X50AIQEFz02bgOnhpQ9Fpama5iD0Sn566M4+fSTwwU1Gq7BNKXLOxAxmtfMp8HzZ4Oeh4QOXHifa9gss5gSv57a7yL4U0yu0q4GgZH3gScWFQ8/YleNQ1EAWETA+kK1pIthRYRnfHNnSc6zErE1Aw3WMwPRpya5xDHrEsWLx282UFiz+P/v9jO9Gw2FFyT7+aXCFxkKrimoqzGaIfKiHsscKXufo7BA/hkzhqSK0FCd3FjlnymUkZzIbDSv9T4Rds9fTNRVFdeehsVCODHaLI6CFnmWQmXPTTKRCte6+jGGcZkPoTQog7tzoUZhtLlm1QwHXDrA65Pnatnb0DcNNEc/10O/pO7VVDw8y6OJiipLxwACzj+q1HG+kFhSxMTURlwnTbdq/CJpqBiB7Mh3f7Jpvw9ZZTgzz+dBi0+YGl+Kki7Dby18wGlMYoEUv1hd9ULtRddQ94eFwwciw1lScxa/rgL1/WBDAMynWkrb3KCoUnmdP721xbBZfZ+A2w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(12006099003)(11063799006)(3023799007)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?22g4o7syGmKsNUasv8OQr4xBaLTlsl8YoewkLZ8zoEF/cu/Re0BLrmyiNOgY?=
 =?us-ascii?Q?Cim4GCD3sFf+p8CTKNEY6AMT+JHfZvZiPgHU5ZP+cYfi6FhsEHYflR4tN9b3?=
 =?us-ascii?Q?ViO5wtEPkRogrY+jptF3siUBhXApJmB8ywfgZQthZnlnjqTu5MLXEYM2pT1S?=
 =?us-ascii?Q?HXyZeEVV94lWIARFBinaPnR3t/tOl8Oqajx06peToq7D4SUhXbWmcWtGFLb5?=
 =?us-ascii?Q?RSsmz2n2GQA/zcBVtBjp4nhesX+frPM2gq+f/E9wiWApTeAnvC1GPW0SNkfY?=
 =?us-ascii?Q?cxHR2dYuIGmJt1Ka9Rdyojrb523ih1HlFoxRpZrpgx/myzU7zMlHGxQdVAqC?=
 =?us-ascii?Q?8M6fwMlS5jq72V9RwzGuUCOTAPegXLQP0E80yvwfgteOKzo2a/PDCx23lp21?=
 =?us-ascii?Q?IGJirpvdSUfeBeZAyhGA33pcZJRC2vo7+UFMoCjyicNfR4+Sr9mHFbY9CAqp?=
 =?us-ascii?Q?ijuCL708clcn+C+tfVVKetnx1eiOdHfFw6cxB4hmtTHxewxSqnwUu5eO7fJY?=
 =?us-ascii?Q?YgN6E9K5zQ/0go19hlUZIPpH2k0fOCSEpDS+Cbo6Ia/3B8MJ5s99LF9JFdSi?=
 =?us-ascii?Q?l0Xj9V19MlGlTwo7cxh0R0umYFq9q4WjQE8qEOolhcOH6J8NeGnnoyRXX2ku?=
 =?us-ascii?Q?jZDCaAyR/DVPGwZMVJj0UiS6RRv4UpE3sZdB4OBJ7p3Pa9bqBMVatC0kxNcm?=
 =?us-ascii?Q?Tqu1mg08b98V5RO3CZcD6klgMLAX1AhLmEkaxWpxUWoHb+QVINDXP8W1k/m1?=
 =?us-ascii?Q?BSBnGuJHYX0SqNbFyyFig6A2r5VneiDq4/al3DRk/LK2uegeXNEqRbGRDbBu?=
 =?us-ascii?Q?kXN6BGLbdkLOEOVo/igiZFWzfnmzEzszQ37hWx+5+ZWvxXJr8b6/S4HGcwIL?=
 =?us-ascii?Q?lsDRa32Q0jjQg3S6W5lEP5ZNNWW5mDMcC/7K/jpK+W9ujkDMMqmQ6Dyv9plP?=
 =?us-ascii?Q?bDvVypWV6Or3c1musqUBjFBGXn/WzvZAFqmVVtO3j5c5t3UjWpO8OMaLpU6A?=
 =?us-ascii?Q?5b9ZhHVElwseNCo03lbCkTX0UjZk6bpl7uJ3UEgjkCRrcTV3QNGkjd3n3bG+?=
 =?us-ascii?Q?CsbYWL6le673ZPP4S3ZcPeRO51xPP8tF+5/OBbt76hieY4lRD6QF9Jindg2V?=
 =?us-ascii?Q?NZtYIObqmVEziN/YlCBdmPUkx2l7rx97cN1dSh+8Qf2F33PHWLg1ncM311GP?=
 =?us-ascii?Q?uYsD6xXF23OXiJ+cXy6fmJRQmbU5UTWipN9Zjf5TzNThu95qch3mMU9ErrVQ?=
 =?us-ascii?Q?YEtckOz2ka+1X2Sz4z2zf5Ip15dilnrIs+aVxUSlIl+tSOEjTEAXDxtr22dF?=
 =?us-ascii?Q?a9ZCITdN0H08MIwglKw8MY6pwPYy894QrGWcmAI+40knrIf7ADCfcCUUO2LE?=
 =?us-ascii?Q?C+Yn+wFLTWuMrwe2riJ3ebPwXZ8dw9Ewr0xV7qsAdIKpDrTiEP7RtyRlCssV?=
 =?us-ascii?Q?vIw46dmfLwHGUa9CdNBvuiz+NJfS4cnv4q1AHeUuHCTkrVrdDA1f61i/DnQp?=
 =?us-ascii?Q?jZ57T86Ok+uZMoFCXV1gONnjKh0uL8sBafw0WdQHvNYv9k/ALOHHcEqaGkxN?=
 =?us-ascii?Q?80xnRGQIVU4KUdcT+u4WUA52D4BGb/dB8QufTcQd3L+fZYmBJRz1DZyUeSbh?=
 =?us-ascii?Q?rwUWf5+Il62RpNQTXCBdqJdyTm7J+2efexjplbHVFoaRdTUy/I/3wBUhVWPa?=
 =?us-ascii?Q?f+qzrn44JnDld6eZ5nilUsFhu5YJQm8CitwxpqQvVyQ/KWj9TwBGGfQsJ2AL?=
 =?us-ascii?Q?N6hq7WnKGQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e6f258-a1c3-491d-1008-08dee34e4b7b
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:24:14.7081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LfOIcl7D6uSy2LTiGC6aY/H8CGAyWsboToHHqwMjklARAVnRGKwWosRVV5QxZEkmTpCkQF9zuV4ZY771CeaQjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3216
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 15:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241095

Fix CVE-2025-15661[1] similiar to debian[2], two first commits identical,
third commit fixes a return code regression introduced by CVE fix commit.

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-15661
[2] https://sources.debian.org/patches/libssh2/1.11.1-4/

Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
---
 .../libssh2/libssh2/CVE-2025-15661-1.patch    |  45 ++++++
 .../libssh2/libssh2/CVE-2025-15661-2.patch    | 131 ++++++++++++++++++
 .../libssh2/libssh2/CVE-2025-15661-3.patch    |  57 ++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   3 +
 4 files changed, 236 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-1.p=
atch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-2.p=
atch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-3.p=
atch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-1.patch b/=
meta/recipes-support/libssh2/libssh2/CVE-2025-15661-1.patch
new file mode 100644
index 0000000000..93a9e6eb59
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-1.patch
@@ -0,0 +1,45 @@
+From 95028b06d1875e07c99918145234a473e5e8521f Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?David=3D20Nystr=3DC3=3DB6m?=3D <david.nystrom@est.tech>
+Date: Thu, 9 Jul 2026 12:36:24 +0000
+Subject: [PATCH 1/3] sftp: add LIBSSH2_UNCONST() macro needed by
+ CVE-2025-15661 fix
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Needed by the fix for CVE-2025-15661.
+
+Extracted from upstream commit 606c102e52f8447de2b745dd6c5ddf418defc519
+(build: enable -Wcast-qual, fix fallouts) by Viktor Szakats.
+Only the LIBSSH2_UNCONST() macro definition in libssh2_priv.h is
+included; the remainder of that commit is not applicable to this
+stable branch.
+
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/606c1=
02e52f8447de2b745dd6c5ddf418defc519]
+Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
+---
+ src/libssh2_priv.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/libssh2_priv.h b/src/libssh2_priv.h
+index 9b8866dc..bb1f8ad3 100644
+--- a/src/libssh2_priv.h
++++ b/src/libssh2_priv.h
+@@ -117,6 +117,14 @@
+ #define UINT32_MAX 0xffffffffU
+ #endif
+=20
++#ifdef _WIN64
++#define LIBSSH2_UNCONST(p)  ((void *)(libssh2_uint64_t)(const void *)(p))
++#elif defined(_MSC_VER)
++#define LIBSSH2_UNCONST(p)  ((void *)(unsigned int)(const void *)(p))
++#else
++#define LIBSSH2_UNCONST(p)  ((void *)(uintptr_t)(const void *)(p))
++#endif
++
+ #if (defined(__GNUC__) || defined(__clang__)) && \
+     defined(__STDC_VERSION__) && (__STDC_VERSION__ >=3D 199901L) && \
+     !defined(LIBSSH2_NO_FMT_CHECKS)
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-2.patch b/=
meta/recipes-support/libssh2/libssh2/CVE-2025-15661-2.patch
new file mode 100644
index 0000000000..40096d3318
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-2.patch
@@ -0,0 +1,131 @@
+From 72e8f8dd812503e07fecd775e7f88183e005d9ae Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Fri, 10 Oct 2025 08:26:20 -0700
+Subject: [PATCH 2/3] Update sftp_symlink to avoid out of bounds read on
+ malformed packet #1705 (#1717)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Use buffer struct to guard against out of bounds reads and invalid packets=
.
+
+Discovery Credit:
+Joshua Rogers
+
+CVE: CVE-2025-15661
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/2dae3=
024897e1898d389835151f4e9606227721d]
+Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
+---
+ src/sftp.c | 66 ++++++++++++++++++++++++++++++++++++++----------------
+ 1 file changed, 47 insertions(+), 19 deletions(-)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index 6ede3111..43b6ff90 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -3795,15 +3795,19 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp, const =
char *path,
+ {
+     LIBSSH2_CHANNEL *channel =3D sftp->channel;
+     LIBSSH2_SESSION *session =3D channel->session;
+-    size_t data_len =3D 0, link_len;
++    size_t data_len =3D 0, lk_len;
+     /* 13 =3D packet_len(4) + packet_type(1) + request_id(4) + path_len(4=
) */
+     ssize_t packet_len =3D
+         path_len + 13 +
+         ((link_type =3D=3D LIBSSH2_SFTP_SYMLINK) ? (4 + target_len) : 0);
+     unsigned char *s, *data =3D NULL;
++    struct string_buf buf;
+     static const unsigned char link_responses[2] =3D
+         { SSH_FXP_NAME, SSH_FXP_STATUS };
+     int retcode;
++    unsigned char packet_type;
++    uint32_t tmp_u32;
++    unsigned char *lk_target;
+=20
+     if(sftp->symlink_state =3D=3D libssh2_NB_state_idle) {
+         sftp->last_errno =3D LIBSSH2_FX_OK;
+@@ -3891,8 +3895,25 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp, const c=
har *path,
+=20
+     sftp->symlink_state =3D libssh2_NB_state_idle;
+=20
+-    if(data[0] =3D=3D SSH_FXP_STATUS) {
+-        retcode =3D _libssh2_ntohu32(data + 5);
++    buf.data =3D (unsigned char *)LIBSSH2_UNCONST(data);
++    buf.dataptr =3D buf.data;
++    buf.len =3D data_len;
++
++    if(_libssh2_get_byte(&buf, &packet_type)) {
++        LIBSSH2_FREE(session, data);
++        return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
++                              "SFTP Protocol Error (type)");
++    }
++
++    if(packet_type =3D=3D SSH_FXP_STATUS) {
++        if(_libssh2_get_u32(&buf, &tmp_u32)) {
++            LIBSSH2_FREE(session, data);
++            return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
++                                  "SFTP Protocol Error (code)");
++        }
++
++        retcode =3D (int)tmp_u32;
++
+         LIBSSH2_FREE(session, data);
+         if(retcode =3D=3D LIBSSH2_FX_OK)
+             return LIBSSH2_ERROR_NONE;
+@@ -3903,30 +3924,37 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp, const =
char *path,
+         }
+     }
+=20
+-    if(_libssh2_ntohu32(data + 5) < 1) {
++    /* advance past id */
++    if(_libssh2_get_u32(&buf, &tmp_u32)) {
+         LIBSSH2_FREE(session, data);
+         return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
+-                              "Invalid READLINK/REALPATH response, "
+-                              "no name entries");
++                              "SFTP Protocol Error (id)");
+     }
+=20
+-    if(data_len < 13) {
+-        if(data_len > 0) {
+-            LIBSSH2_FREE(session, data);
+-        }
++    /* look for at least one link */
++    if(_libssh2_get_u32(&buf, &tmp_u32) || tmp_u32 < 1) {
++        LIBSSH2_FREE(session, data);
+         return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
+-                              "SFTP stat packet too short");
++                                     "Invalid READLINK/REALPATH response,=
 "
++                                     "no name entries");
+     }
+=20
+-    /* this reads a u32 and stores it into a signed 32bit value */
+-    link_len =3D _libssh2_ntohu32(data + 9);
+-    if(link_len < target_len) {
+-        memcpy(target, data + 13, link_len);
+-        target[link_len] =3D 0;
+-        retcode =3D (int)link_len;
++    if(_libssh2_get_string(&buf, &lk_target, &lk_len) =3D=3D LIBSSH2_ERRO=
R_NONE) {
++        if(lk_len < target_len) {
++            memcpy(target, lk_target, lk_len);
++            target[lk_len] =3D '\0';
++            retcode =3D (int)lk_len;
++        }
++        else {
++            retcode =3D LIBSSH2_ERROR_BUFFER_TOO_SMALL;
++        }
+     }
+-    else
+-        retcode =3D LIBSSH2_ERROR_BUFFER_TOO_SMALL;
++    else {
++        LIBSSH2_FREE(session, data);
++        return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
++                              "SFTP Protocol Error (filename)");
++    }
++
+     LIBSSH2_FREE(session, data);
+=20
+     return retcode;
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-3.patch b/=
meta/recipes-support/libssh2/libssh2/CVE-2025-15661-3.patch
new file mode 100644
index 0000000000..f34a877808
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2025-15661-3.patch
@@ -0,0 +1,57 @@
+From 09a4a795b051c8c39957a85b36abba5d8dbd7230 Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Mon, 20 Oct 2025 14:04:52 -0700
+Subject: [PATCH 3/3] Fix sftp_symlink when getting SSH_FXP_STATUS response
+ (#1731)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Move advancing past packet ID before reading the FXP_STATUS response.
+
+Note:
+Fixes return code regression introduced by:
+"Update sftp_symlink to avoid out of bounds read on malformed packet #1705=
 (#1717)"
+
+CVE: CVE-2025-15661
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/4ed26=
f5740bdd409269ed9fb48a28bf8f565b681]
+Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
+---
+ src/sftp.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/sftp.c b/src/sftp.c
+index 43b6ff90..0a6d15de 100644
+--- a/src/sftp.c
++++ b/src/sftp.c
+@@ -3905,6 +3905,13 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp, const c=
har *path,
+                               "SFTP Protocol Error (type)");
+     }
+=20
++    /* advance past id */
++    if(_libssh2_get_u32(&buf, &tmp_u32)) {
++        LIBSSH2_FREE(session, data);
++        return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
++                              "SFTP Protocol Error (id)");
++    }
++
+     if(packet_type =3D=3D SSH_FXP_STATUS) {
+         if(_libssh2_get_u32(&buf, &tmp_u32)) {
+             LIBSSH2_FREE(session, data);
+@@ -3924,13 +3931,6 @@ static int sftp_symlink(LIBSSH2_SFTP *sftp, const c=
har *path,
+         }
+     }
+=20
+-    /* advance past id */
+-    if(_libssh2_get_u32(&buf, &tmp_u32)) {
+-        LIBSSH2_FREE(session, data);
+-        return _libssh2_error(session, LIBSSH2_ERROR_SFTP_PROTOCOL,
+-                              "SFTP Protocol Error (id)");
+-    }
+-
+     /* look for at least one link */
+     if(_libssh2_get_u32(&buf, &tmp_u32) || tmp_u32 < 1) {
+         LIBSSH2_FREE(session, data);
+--=20
+2.43.0
+
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 2407ed34d9..0fe22081be 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -13,6 +13,9 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-7598.patch \
            file://CVE-2026-55200.patch \
            file://CVE-2026-55199.patch \
+           file://CVE-2025-15661-1.patch \
+           file://CVE-2025-15661-2.patch \
+           file://CVE-2025-15661-3.patch \	  =20
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"
--=20
2.43.0


