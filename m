Return-Path: <david.nystrom@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E61C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 09:26:31 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39523.1785749181638226321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tLjWTbZZ;
 spf=pass (domain: est.tech, ip: 52.101.66.14, mailfrom: david.nystrom@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tW3pn9NwlWypYf0kB+Ph058kWxikJyBN41t7hCcZ8DG9ikjn2Vbuko40PxNp12/HkU1wWYPUS4TF19AfD+FbeIBjvJnt4cO4YvIxOJjuOvqrsn4bcUedwgxj5FHI83WfhCFIqXpfFP7+5B+PJS7BTqFJN79IFMNIeeL9icbZiKwFgmTreUhH51oZmJEvmqnTIiESaTEvujRvtXhRFzpomG5S1mS0B4JykVmlHdEWokQfzQmdSQj9NEuAwJZVZyS0mZ+uOZ9fXBWUsbllFoCHIpq6pGZe/cMzqoueocAQayFTj3K0nd/nIojPQMG7ew6Z/M9vhD9lelb+wbcRIwZ3Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8K45u95mGbXN+US2XvBYjLe9ZmkKs87XilfJSHOtZI=;
 b=vcOBGLFbTOKd+9GrdoEYpCe1u+6ByjUJX6kFOpUiGoqA3ZAATQPFox9IBnU2hyyyY6U70cn5XK02xPFPZxOv9aH4rPssuy/a8CU1BlH49gvs3o+ZRu4u9p9H6PsqsY5+i7t3dGrMXZIxieUa9oRf/Kmwrj3tjLjB5imkiQholJghdAHgwCPD6utxjejRnSFqSZuu20boEJBZff7P1E7ePQeWF6Y8zSfI/rlOm7VG/zUxDJPc1HngmwdLCnaJRvX73E9mBijzmsH+sz8c61KiUl/LMVgl6LMNO4E02YZdMWwtn2HrL8gFhDtomokJgJwtVb4WBvEvcoiq2CO0hJXZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8K45u95mGbXN+US2XvBYjLe9ZmkKs87XilfJSHOtZI=;
 b=tLjWTbZZk0Pn0LpL9Yy6VElqN/wB+JKuyWfH6K2y1vHFV1dOguJ1kp1EnUpngj3nxt2LJtu/mgQXQst8KLeMZwKTGEz6FGgbFdZfn/CkF/vV5aApuxNqCACIrN7dJAB81qUDugN1fRNGikAmcrdPRARf3oO0S5BeQK5TZ2p5ZbdIYhau7AV2DK77x8pambLgcDS44zm8hJ5BHXhmFUZ8W7KQJv1iOgcqTo4Q7x6W4ErbkA0DlxeigBYh2l/6Q0Q2kaQWRLOUEYiQWt3d2RRNJR+Yvy19bk/Ovxaj3DGhbrby6A0a4R4FoQ3taVG/M6D2r8D0qmi02osD9TQJFO3wQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from VI0P189MB3589.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2db::9)
 by AS1P189MB1839.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.14; Mon, 3 Aug
 2026 09:26:15 +0000
Received: from VI0P189MB3589.EURP189.PROD.OUTLOOK.COM
 ([fe80::149:d9cc:d017:c9ec]) by VI0P189MB3589.EURP189.PROD.OUTLOOK.COM
 ([fe80::149:d9cc:d017:c9ec%5]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 09:26:15 +0000
From: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
Subject: [OE-core][scarthgap][PATCH] libssh2: Fix CVE-2025-15661
Date: Mon,  3 Aug 2026 11:26:07 +0200
Message-ID: <20260803092607.323680-1-david.nystrom@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF0001DC47.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::2f2) To VI0P189MB3589.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:800:2db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P189MB3589:EE_|AS1P189MB1839:EE_
X-MS-Office365-Filtering-Correlation-Id: 389a288f-d020-44ec-a396-08def1414459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|12006099003|56012099006|11063799006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qJkySt6rtU1u3zXCJlBUCf7VT8yKNjf6Yq18lDJ7VREsTrULfK8FZ82/cE1bJrdwB3LLeWBWnmXUpvqjnqgdQ+Kr5lnURqqJFd2IdNs8QYXtTbO9ZRW0Zcd3zCVEBkV8gmrJFZGuvqMAv7dOGfojv/DTXzyK7/DGFU7TW2I6++of39j15rD/a1DxdJdiJQbMU+mgDrMwrfUQPDETHSm3dTbL0NJ87pnF4zO3Zt2U/3GOhL0xsMLmH42rJG+rLfuz0wpWZjuE3RIsuB3ojGLuz9hkMTH+GSRtSfFst2yQxAZg60NzM+3Tt4l1dmY4TGiT9XNLKhVlb3buYPFTQO/oolu93zDt2zm4fJtUa9viJZoRU2zxruVF6WidNQObpwYEw2aSp2HdXhHN9mb2+UFmBtEmJd4qXk5ZVydmYhAnJgqv4oSfTYhYDqn8UC4qNLq2R5vSnGTyFYUXK+gyEsM1qABTY73P/dy768DeRxph1jeFFWNrpqPqBEfVjCf6awB1n06aDUtB3FuCDtxxfOL1Nbn4ogGNXj/EvO1IQDeIR+fLVVjwcSao2gLEgdbPzs0XoLNW3nRvLD1cIjqr0KTBWuMllZu/OBjAAf+FVUIf+/P03kNfb0swK3qh5E9Bvcw7MYmUlj/9It0qSKGJPFNDdTqnMsfeKKc1V90Zv5N4h0A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P189MB3589.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(12006099003)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wE/uaVTdy11XjSbcEH02DUK5s54f58rDZ/U0RdxiwS6zwk/eu0i9F8CEnyhn?=
 =?us-ascii?Q?VJAQKVVdtdQB7MsTEauKMBxQ9xOWnoopP5Jbmw3AocSyFfrk8R4D8pvYphuy?=
 =?us-ascii?Q?O6TZEQSyCy5hOD6yJiyL0OzvhDXVHo+s9EJyeAZMUGJ2p4si2YVCjMtVbifx?=
 =?us-ascii?Q?4G9f1pFcFVMpPvbXtxtlGKKEUfR1cClmoThBQZyEL5tzJlcAPmdKkRDov6Rw?=
 =?us-ascii?Q?7kKqirmbB7rLhk9ll1JNL779Z1Cs26ogAPo9KdARSNvFjSAB88tGeDT6O3sB?=
 =?us-ascii?Q?lkBeslCHAbbKw3VAHmn+xY6DmfOnCQd0sgeZCboZqN96qk1SLTz+qTaPvCbD?=
 =?us-ascii?Q?vfnpBe7EX/UzW2Rql9+sVbm+TMbxuqQNnULjhQW1oFAjOK6eK4gWF5C6QuZm?=
 =?us-ascii?Q?Wsphd809lH+CITcKkCw7H1ljK70eKvhdGXowzOsBVOR35OsL8SyoD62PrG0h?=
 =?us-ascii?Q?1Mn5D0UgHB0cxCmwnDp7miMN1jElMlokb9SAR+LfLJXASM3bs/9zfN+EE527?=
 =?us-ascii?Q?FzBBfbAuC6mMDAvvuia9CM6oyrgFvZMMSAggG3m3kI9LsPd9/LKrMHTBIatg?=
 =?us-ascii?Q?WWFlSS6f2qHQWmL3rsbdcEXv6/wWmyK2oSyCuLCumaRfHzNOBU1euMjLLMyU?=
 =?us-ascii?Q?koUCiGsDZSpxsRyr8duRQ0kUUrW37M5Ws6IOkdjj2vp1Y1/YP7FqWE96PJh0?=
 =?us-ascii?Q?m+CnTnG29UyKLYYekg459z0bDwXbVT5RuL1SOqSXC+CnSZJsVvBh5Ek9snIG?=
 =?us-ascii?Q?qE2JAuBCfFL2xkShavBRCxff1NUNBwtTyvJd/K2qnNVwIuzsseYJj15Hz6Um?=
 =?us-ascii?Q?tgu6Nxp8RIthVRjeG2ErHvUQ1UVXnW8Y4Q4RwcYiTbSr/jW2zKhxMu5ZfnsB?=
 =?us-ascii?Q?6YcCiTbEoqvtzmX0GrGbr22EcsRkgNhrBvWiiW1HFr40d8LWSU53QsOOaymh?=
 =?us-ascii?Q?1RQQ6O7mE6dtdjjo2J+EoYoR267lpDH+VJVBb+ZxTdihIZtfXptgHS2K1scB?=
 =?us-ascii?Q?HRoSzg3ob62lMouJaJbLNksoNH31hrN74iNVBifk/r6F/INukvdbeU8e6KJR?=
 =?us-ascii?Q?LszX5V8Prk3yVFyHGe/K+N9hu4uPuIW+0c327MtPU49K2xjSGmPUye2Vo6i5?=
 =?us-ascii?Q?wKbU1n8czCdZTBrv+Xd8c3gCzzn/epAhijcEBCPNcjpisgAchhZNQyVcalcP?=
 =?us-ascii?Q?NAzqr0nTxoH/JmTpehaUsmLd4dHdNRF016JwasaZIHOZagHmEcQQzkBXwm3a?=
 =?us-ascii?Q?kq2gGV6zaanMc5wEOyk3+kIY3+nuOBG6SXvam6sH39Alas7u8sJ60RqsWMWJ?=
 =?us-ascii?Q?qqZjJBTdbCcJP8fEsQI6tHXVKxmrNqJ9+2shA3TOdziBPRgwqt9H7xLY7z2t?=
 =?us-ascii?Q?isFqSkyfGTVdDkQlPko0P/MPHQM2a4UyH+gMEHiLCojxTSi4826zUUxqnNz3?=
 =?us-ascii?Q?I6J2QsXxMLrj+LazbJjIkwDh6vKHDtdTgTcX4Icc64fBdYORoKvARbpYQmEV?=
 =?us-ascii?Q?fbJSxKGPNHQc6aIMSjtwVyt3Oc8xi2az9zQbEzlh8El5BsX5F9Mx5/xm8XKH?=
 =?us-ascii?Q?ek1230AE8P6D96h9f0PsAWGXVrs4g3VS+MpG98SeD3CYDJJYiMQ5vn8os0Lq?=
 =?us-ascii?Q?R/C+ybTmzguP3OzENXemOoq6VlL7AG/1nuLv8qsG6C2HMShLiLYGM5Xk3qEJ?=
 =?us-ascii?Q?QqFkIifN6zHmPJ/IXLcoinmXRnqMdlfPDLg5hMLsC79Y56j9HRZQhB3L1u8b?=
 =?us-ascii?Q?VFBU+9gMaw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 389a288f-d020-44ec-a396-08def1414459
X-MS-Exchange-CrossTenant-AuthSource: VI0P189MB3589.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 09:26:15.6503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNf4FvYLL6G+2GiEOUIF+T+DH1CCF1Fy/CjU69zUoTrS59Ue1Oyawc/2k+fnI6MMBdfH5T2rNvbzFtf0cVFoVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1839
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 09:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242642

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
+           file://CVE-2025-15661-3.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"
--=20
2.43.0


