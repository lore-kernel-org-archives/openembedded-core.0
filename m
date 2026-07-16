Return-Path: <david.nystrom@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D59FC44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 15:23:43 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15666.1784215418205574241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 08:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NRserj9l;
 spf=pass (domain: est.tech, ip: 40.107.130.20, mailfrom: david.nystrom@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGUCpLPdNexDnT/g+iWu+Xro9k9qwlaMmzScQ3wOKNqO/3Iz8/t65Btv1jqKS4wA7PIF3iaoB85ljJl/xbIxUU+QV5k2sN3MzNkyInOE6MGyf3PQIhiZOPZ4f5JRwZuuw5ANIuZTWF48JWgR7PyPJLKxhom6tf7oXFU8vPzYVO46kIxrqLr/Hrhf36DeuejTMRKrYYNJljyfCKieB0Oh1zAEPpIikE20IZsXgnDcxnEIGEWo4rX2JqKt+vkEIdlQfnT/C5yGJQNycGRGX7IpD+n1U7r/6EJVmnBeTk13oOkdOmzSx0M4sFuUUEQl3ZNCw5LPFRic6Kf+JsyrQKSaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8K45u95mGbXN+US2XvBYjLe9ZmkKs87XilfJSHOtZI=;
 b=Mka+OdRuOSaC2LKw2H90hX5ImQi91wtZvon2XfDPs6lmXv+efNNRoE7RM+TUO5KUZwLQOJpL8+oh7bMIWgtUOfjmXhDVi2AsXqb/cZ0dkyZm6ILxjXAj/pfrPHOLhixJuxA2rnBrkpX5H/fyUF7kXbZ5LhUBW8at6jsvnaiOO8O7ei+CPJQ75KLTlA8WRCZPolanhzkyeDFldvenXfMeM4U4bZI1mu1VWyLnpIES1zAs2EFoh0E3BqAFdeKj6sYCYggd4csrawBgAnYqGzQ8jgoETukM0O3pQGpI9Lpibvb9KcOAiGAgj0nD21co/ZvEYhKRhthrCRolmWf3ZL7NeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8K45u95mGbXN+US2XvBYjLe9ZmkKs87XilfJSHOtZI=;
 b=NRserj9lBI/e8u/d+0YZamKTHNz/DB3zefgizVrFfmlB6hZH82Rk4hX/CKGGgYnT3Og/daH3psH1bRvYNXK21tzx6egA3OYmWDCKXgHQNmuS/kc1uan5hV3ICrHEGbZSod731koaK3/X8BUgFYEytUj3UGonxQmNBR1VjLoYzAHc306Kkb/ib4MEjc57C+vHoYTdAeojj2mxNWc6kPJZqxidS5hRQPVfNtWtQmqLX/mm3Jay84KPWv0L44vTR8bvn4JfPah4/jGbZKSrF3URIOxodqkczBnxr1r3jvPReY/Oq3qB18h/TWe/7Z2Q7mYo/d6/DPphYj0u9X5OeIThIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by AMBP189MB3216.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.4; Thu, 16 Jul
 2026 15:23:34 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::49f:4bc1:672f:45c8%4]) with mapi id 15.21.0202.014; Thu, 16 Jul 2026
 15:23:34 +0000
From: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
To: openembedded-core@lists.openembedded.org
CC: david.nystrom@est.tech
Subject: [OE-core][wrynose][PATCH] libssh2: Fix CVE-2025-15661
Date: Thu, 16 Jul 2026 17:23:25 +0200
Message-ID: <20260716152325.1247234-1-david.nystrom@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF00023949.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::346) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|AMBP189MB3216:EE_
X-MS-Office365-Filtering-Correlation-Id: a96980b0-1f3b-4588-9fa2-08dee34e3364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|12006099003|11063799006|3023799007|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	h7g6P/O7etxHLK1HsHQmc3m1gBL3zPe+lj+qkEhTZFNvfqzfIbYZwgYC/wFEj7dAqp2bxkKGej8+pqRvLSVW6J5TO1er7Qg0F+Ez9kP3wguCI6Ulwgdxs/jsniYJZUKFmER5JPQ0VAG5mPg3zV9+O2NvOtgwt4w7MH3jy+ARqKk/xQK0FcdhXR0aVOmJU0DmYHBU9s03+AveNiIkF4uqe7AqoL9LRmZx+iRrvtzclLVUoMDaE72EQCU6sDdLM8AJaUDtsquRlD9pgMtPvRAORfXpqLSgFS2a9p685gzrvTtlwJ9foi+B82bdlfcpn+72XTMJsE+mgquqkNX7feHDGHYWmj4Yw0WCCZVNFOVaZGPaCzB7r+TlqtQnfILCnBNwsPQvlxSjaLOlSRHVLYPi/iopxecQlQRmpJ8agvLWHhFDgztrMe316M2hMCmp96bioar+nbZ74yYaSHTlCudtHwkn0IZ9AYqTTLN+zjvmI898b0IsQhKBXD4aKtHHYYvLIFWP/X43B7hNluBxQltkBiS5QxViozPPOb5+qEZPScZsf/aSpqPP7WtQMJcaJJnV5Nbe0mWe2gduiQhNHdV6opmEpWIeGhNKG3ZqFjCx/6vFunkeU6+Qr6TDTdFjIl+rVmjVpdxMVnqpyByFtuHlyaQ/Vm7TVP2ziKn5WmUL7Ok=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(12006099003)(11063799006)(3023799007)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LKK6l5olfDlDo+xDeyRSBEXaquA05LvhuNAj0xmeYyaI95TBqdOZRidusXhR?=
 =?us-ascii?Q?7Y1NuZcXJDIGk/Ftd6CxqWQzL90kbrOv+AjwOz4bAuwX1s9/ByNQSuefu8LJ?=
 =?us-ascii?Q?K+bdmmugm3eYTMD9HfrkscT9SjIBx6mJzPti1KfogD0j0zxYkWUIiD+B4NBq?=
 =?us-ascii?Q?fx0bmZ5XO5GnLgw+HnZddFQYtApgjjYfTDDf5J+LvemAs5VO1pYLoxGPvYAd?=
 =?us-ascii?Q?is37NuM7QatdwU9lFOvI5kBeC8/X6uhktfeU/wb8Mu8r9muFYtVaA6gf6UsG?=
 =?us-ascii?Q?cRfTt4BeuGq9DBeklK7A9v+irXlJDhUWEaE1YYDuiGePmIRB0hOBAgFyYqrH?=
 =?us-ascii?Q?7w4kpBZJP8F/guiNP6jnluFXOZ+3Fdpos2tBl7H3p4vkrxaYusn7mZe9EASk?=
 =?us-ascii?Q?K5GsYLv5gxqaSW+sd2zPl3R9sUD1IM43Ha1dvAgFmVQ8MlfFLt5TOMV/4kyl?=
 =?us-ascii?Q?FoVLuvbIqqGz5xoiVhwi5Ynz5MN0T35JNPYSVzVGXBVwWUF1QACn6H7Cc7x/?=
 =?us-ascii?Q?LI9yf5MjHdeTsPOg/98AkwaJTti4eAb0H+VMMW//KM5KfGO5WDXIo2/oWMcP?=
 =?us-ascii?Q?gUHFYrlqWHXwfdvylRCbo3B30nS3OsSeWO1eSc3BdGWrBAsmIaSyPWqsucAR?=
 =?us-ascii?Q?lHiVQfLaJOHqYP1Z2sKiuYrNYt0JKsuoZRM8BVxcg6pGg3+rAHYvtpah1QHN?=
 =?us-ascii?Q?4TkVl6BiblwyEb/YOTM0/6dj76YrmPlWi6S3e7k7oIHcVVbju9XgIh/N5+2h?=
 =?us-ascii?Q?JJNH3HvEVpn2TCmI4oiuiMqqS7sKc1Z4eznqmRt36MztH8d5d6l8JsDwLlX0?=
 =?us-ascii?Q?+zalIc6eR7JhtbG8LXvs2rDpt7LU1qgW2MZ24jtG6AZ1T/+HeHoicvgVjxeT?=
 =?us-ascii?Q?3KGENpy3ED4KN5YgCvEG0X16Bm9lQ38q5h0Q5BSkbMLZh+8ljDvplAm9qkuN?=
 =?us-ascii?Q?aYmuohRgTUk2ddrVvsh1CEzZuvBmMnyebW+deOdOX5uuBuR2e/1piwsfQVVA?=
 =?us-ascii?Q?o9+/BbKWaDPpVBx+Xq1FLzFlsgGWUcRsFSmkhthAbmD+qqN2PeVDLVzbh4SC?=
 =?us-ascii?Q?gc4K3kZQFjX5wAP9xFxmgiERA2LPHhM8/2oXvMPpYmaVUejRPFYb8PJvsru0?=
 =?us-ascii?Q?PrfjZS+LXXXpW4BbDVBdQOIOZjO8yCqJW4edtNnmo1YuMh/4mBPtj/hdH9Dp?=
 =?us-ascii?Q?MpG3gRIWvBBEPiXQ93qAKKJpq9C2zUPi+rghF5c15valCtTkTyHn3LdKLUKQ?=
 =?us-ascii?Q?Fodq9bjCZHPLZfxzxRg4GdL7yW+EtpgzMMsBylTMDBbjEV9m2ZlDQiE7Zmos?=
 =?us-ascii?Q?E9Q4SouWBciFTrOAo8klg9otGMMUh0OIao+tcauWulbU2ZZnpYs7AKOeiXeG?=
 =?us-ascii?Q?7WxRFXrlRGmzy4ykEfsBkad5uMnam/cVWQ/tkaS2bBQt+N3++EDvzrSjQKg0?=
 =?us-ascii?Q?1zSSasI/6z6YQl8p42RkLRZ+XQVt/E8X2SnegOky4C+ELp/z69v8riRXr8yK?=
 =?us-ascii?Q?2LPKVjrfPzAqArJh4xSYpLmn2vkh9aYEeEzdPPH7fSOR02XRhKwMKIQQ4Too?=
 =?us-ascii?Q?uUjWIQxJUwQ/hZKr5rIm4PBwfoSKia+3nlkh5EWuKEafCiCKWpwr3tgJ0A3F?=
 =?us-ascii?Q?RF5X8k9swnCXNNupQgv2Aq2C/Owml8e23jRqFd1s0mdmJKnLCfAkGee1ChnM?=
 =?us-ascii?Q?jku2IzCpHqPU1UKMhxIf2HYh7O5ZI5RfBbQ4eeiHgVUMLfTRrsy4M9SBo0XJ?=
 =?us-ascii?Q?eDbKD0rJQQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a96980b0-1f3b-4588-9fa2-08dee34e3364
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:23:34.2912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tAGQ285w/Ya2pXl1hbKXgTmQc84gUAnOa9M4jGpo2esUPGYfiFhpFwP4E4pdM3p9+VbmY8bwfnao4BxtDXHqSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP189MB3216
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 15:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241094

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


