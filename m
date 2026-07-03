Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB81C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 09:26:15 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88571.1783070768088571660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 02:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=OzODIM/E;
 spf=pass (domain: est.tech, ip: 52.101.65.38, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJM31IxVKJTG1FhPB4cUBjlWHJIraI0R3U0F2hqASdwFhaPUUhHbBfbKRKatRv0LbZxBvqpB8Seq1s0QAwGFvjPEFMmTrnJuyIhqz91inEpICPQVbOCETEKneHqmksv9+fN/AEl7fuWQNqLSwMoNdO3M3g/IZVQ/Nb8HxncifmDzo4fzSed9D+LE8V6RN5O2cSL0niGG/KWxU/oqyicChMYgXobj8D3eZC4mYKbwvPzHpJGKN9EqykSBoexgm3e2S6FG1lwiepylgm2FdfOcQllpfBfir4qA2ElyYktyj93hKO/wiyR3wmE2lqHgsd5wjvYDZx5suFk5KlkrpP7Izg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFmNBwAysEj8KlrIWYLWDleXetivbupbKAjA02cor3Q=;
 b=PPVGtYorGl8TfA7Vx2Vbq9/qHu64RmH/n0BezTWrUQcyDvHDO7W09EU8GVroYRPDj2rINN0grrJS5sA0teIeJpsD3VKvzWyz+x4rNShC9m+cLHGfsNUdY+V2BQkRi3kOnoOpqnBaOvZNey2MPRXqdrOkQkgezxjhb6CA1ke+AMB6Z17O5i/orNVeBI6juTx2hV7ynMVX5zkj5zltRAHmL4zVH+DHFsI1mSYd/TFdOP+5kpkLTBU7pC633aAg0FbPlSjkGuMQu6x01WGtVOomfIQAxFw+j/pTk7TlUvrIUu2CV3VmA0btxrEF+oOCk8dOrZpgQkXnRo4HkjEBxBqitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFmNBwAysEj8KlrIWYLWDleXetivbupbKAjA02cor3Q=;
 b=OzODIM/Ef5CwFiEksmajJeAFaxwVBKxL+eNoF1TYMBrchw1oVaM0x8ed3jV85S29lA4BJf7e27bCzc/Mx09KYw6udctOPvEFDcxWEZkxfxjs8wuEMypZRGilnZfggeFIQCH1W9n7Ij6QumkKDziCLF2opclChaOpYLQm1vhJ1KIckT8gD3pRR2c9GVsXTVYPcCZQ9SJ3W1Fb8uiIU/jiGdqDrb4Lf4rPJfQwNCouz2m5FbvkpyWJiDoOBaapMuie3lwbPCoz/LB/fFueTtyWVcYtY7PJbH6kHKBB5zm/VpSfIbJb7O3cTRlDCiIPmtC1/Gtg0ME3IjEglyUioUQtHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI0P189MB3250.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Fri, 3 Jul
 2026 09:26:02 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%8]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 09:26:02 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v4] curl: fix CVE-2026-5773 - wrong reuse of SMB connection
Date: Fri,  3 Jul 2026 11:25:51 +0200
Message-ID: <20260703092551.87871-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260623120850.29881-1-jaipaul.cheernam@est.tech>
References: <20260623120850.29881-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0452.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::7) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI0P189MB3250:EE_
X-MS-Office365-Filtering-Correlation-Id: 855d4fb4-290c-49ab-b289-08ded8e519bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	rP7O/Z7T38rG2PuV8k+jQtM/cbof34fW7q6WMsq51P4hfqmO5/t9JOq9amX3/eDQ7v0mz0/5MwAMGyCcWN6a80WSr5Bo+htojpPL8RZJO4Trr8ZUp5bTFwVQmq/WMNZQakJTvzb0dHeIl/NJFjBSe7pvn/8zLPVjOzD3z8VknXjm773in4SoEVKzpiWTD63UNxzbwpdTIgUeuBJroqZLhmkrNVjW2eWmsL3V6/MKFQh4UxMUgpMUc1RDLpzCfu6AOzCBjLUFWtGOFr3KarHJeIaYQhjtKzUNDEfOhZVcap7tja6ITcr4iKZ4qAmUVHbNTOLu4W85yy7L2HfG0W+6muFcAJysRKJ3NSiNLrwT3Im4iZBWG86UMybm0hsoPlHhf/Zhxcb2n8vKHW56Hj7xd3YvjEsA3jZZ1ptqLNSOIfryEEYoZfI5BuK3jDeyQEOI9kTvJ7XFNWM/IostKrImek2OJ0jxLlC/AgEYG9SJlUNyN3FVsZqu1I7/sjhFbcAQ/7bNqBAtgiG16e+iydW1w90eWIBBbX2AyH2vbqwtFD4Bc0+TFVy1HLvCI4t+5SJMUSV86EnQVDRYSFzY0rDci93DGXECtTw6OOPPGo67UEAYl9LTb/hlf4CyPubSL8v3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/HG6OTfQYgJge8SoZeJBKpEfPgPGPOPhvRdKE/nuLkSNBuPY2D8OCsd+QiLU?=
 =?us-ascii?Q?EpGEaP8batfFhBZLGhHyT4bggoZLcviwNftQax2uji7p7xPW8eGXANcE1fYR?=
 =?us-ascii?Q?pYfBv383yltgS6peSz4i/ueZdYLm0aoB449SkgTsyZguKBhyWkBVo1NbTyj3?=
 =?us-ascii?Q?ZvgdXxCuF8R5oifP7soAq2fWR+oD1lOW5q25iM0B0eFSgZSYW01W5IYC7aB9?=
 =?us-ascii?Q?jk/AwcpOweT0zuFyDYJr65rnivIdB+exGlHu7JrLL9LKcTnHB6Hzx7yuPiXF?=
 =?us-ascii?Q?viTK1dCztzwOYDpHfUdN+1tAOgH1lAYtEBL+aEsxjhpfrMnFPfxgUdSl5bAg?=
 =?us-ascii?Q?ox3XMC//XMX88s0BjLsd8l0pSiOCJ47C99m8fbsjzNzu0r5NjcgZrBOZL2AB?=
 =?us-ascii?Q?FtRDtnRPWmtvQmGxpVdlj4QSr9awA58OKJdQJZaNWenqvysutqEhrimupvxu?=
 =?us-ascii?Q?xVzBgLMfpqEyJnI0NiKOmOAz6GCFquxbAjfMAMOkWeFJeNgzp3EMy0mSxVVp?=
 =?us-ascii?Q?Lt7A1eeUNAvYnOxlEGcxEHHn26kaaw3voOU8TxCXIZp8zcYLKSAQjBJrw1JB?=
 =?us-ascii?Q?aITyZmgaw3NXuJwZWc68DLHWfQ9NZDgvqHHD/u2JjiUj4oCFpaV/y/MOoVHD?=
 =?us-ascii?Q?+t1GCii4EtVD5ha8hK/NX06ouWMrGuifKy9uPfAeYaXp574OcG+a+nvERjZt?=
 =?us-ascii?Q?VzRHY16gjQIziUlr1ANjUpAxSXs5lv4pLefNoi/wCSCuIvprql9Mk8iW8+VC?=
 =?us-ascii?Q?PgPwG3E5g0sA0HT+d5Lt6yMhwXKPdGYa//s1KXXVM9UzmKVuhnIxr0aDyC+6?=
 =?us-ascii?Q?YEz1Y66RbtzTcPJgUoxeHy34WQ8KpRO8qBloYf/wKO/mUgOTIYEfYFSYLmdf?=
 =?us-ascii?Q?1vM9KSgo81qJ07OtA+ieYH979upfas4H6oL0wGRgU4JoM6q0Nilw1p9he8om?=
 =?us-ascii?Q?Xg+zXUWmqu9Sxz33wYPN8T1EzoKkPNfTdmWx4NpUU3PgxpBgX0LVPOGHF8j8?=
 =?us-ascii?Q?4HH30SqyghTiKOBKcROZ4EEQMlEVhHTqnR84virSdKS1weuxOW01srjL/9Bk?=
 =?us-ascii?Q?IFc21mj1c6L+K55J3jP7cUpj2mxPFJIq6aeYTZ2w7su2zpw1NIyRgF9bmD95?=
 =?us-ascii?Q?Uwdcxe7SxHsWOKQ0KWGUWAtw7Lo6OO7lXpSDf80vXpPkloHvsvsZMLdmmjwQ?=
 =?us-ascii?Q?rOMl4y3hv1yOqosgMHKVgMY9NgVBBUVg8+GP89r4fPJhY5SfEDbFolU84+HH?=
 =?us-ascii?Q?AsJ6H8TYKn7mIRkiQNdV/JeA6DVC+yGICXyNBJUeWeP6iKHDhET1RLvQe97w?=
 =?us-ascii?Q?Z2ur/JoQtXnZv0FuO6FVLBL7LEQ+y+OpQ7Nn2b+GTHGYX/6h32nULpxnh09z?=
 =?us-ascii?Q?bCSYWRz1rG+/1EQ2Snr8qIhYYqX9OCLkG9nnFDg3ii1j6vOcZgpnAXzKo7pV?=
 =?us-ascii?Q?wYYHyBebdCYwjbGB+Zq9YYsWlIKzlmiaMuvZdwe8a0qkIGRN0NGvOsHL0dqM?=
 =?us-ascii?Q?lweVL72yz7KWI4ZJEE+/BTkcDWlXzWBvQOcLqxpOADpgdvgM1Q680GqIF2yQ?=
 =?us-ascii?Q?ZU60rbjFXyJeExU8cu/INLBJX159k4lIQxU75VEcdZ7CshIZyZvS+oCbjkIQ?=
 =?us-ascii?Q?+b+JL1nYg+UOHOwtg4epw5ftiD8Z1YOHLuvsrzOtsjAuKxu74jK3Sv7r6kub?=
 =?us-ascii?Q?DzNZC0filg3dL+I0l03UZ6MeIWqx8+gxKmyfUVyDnm3Iql9dqKvOyuYT0zfs?=
 =?us-ascii?Q?aP9xQnMGMjfLMK8v1duUxwH6K5N6duo=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 855d4fb4-290c-49ab-b289-08ded8e519bc
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 09:26:02.5297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgOjXIc55ZA8bO363k9bamtKQr9zRCjfqWIv2imEVAB5X/b6OSIRglIAWhMeuXSOJYJBrcGSFvwDIaelnIVwlfTkfWrnhVlemA4XaDf409s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3250
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 09:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240100

Remove PROTOPT_CONN_REUSE from SMB handler flags to prevent
connection pooling. Without this, a second SMB request to the same
host reuses a connection authenticated for a different share.

Reference: https://curl.se/docs/CVE-2026-5773.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes v3 -> v4:
  - Rebased on latest wrynose (5d1aa5c806c0)
  - Refreshed patch context to eliminate fuzz on hunk #2

 .../curl/curl/CVE-2026-5773.patch             | 48 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/reci=
pes-support/curl/curl/CVE-2026-5773.patch
new file mode 100644
index 0000000000..1b60191da8
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
@@ -0,0 +1,48 @@
+From e5c7f93734345260820ca46b29db85f75d277399 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 5 Apr 2026 18:23:35 +0200
+Subject: [PATCH] protocol: disable connection reuse for SMB(S)
+
+Connections should only be reused when using the same "share" (and
+perhaps some additional conditions), but instead of fixing this flaw,
+this change completely disables connection reuse for SMB. This protocol
+is about to get dropped soon anyway.
+
+Reported-by: Osama Hamad
+Closes #21238
+Signed-off-by: Daniel Stenberg <daniel@haxx.se>
+
+CVE: CVE-2026-5773
+Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575d6=
412dc0ff532acdf94de35a6c2a571]
+
+Note: The upstream fix targets lib/protocol.c which was introduced in
+curl 8.20.0. In 8.19.0 the SMB handler flags are still in lib/smb.c,
+so this patch removes PROTOPT_CONN_REUSE there instead. The effect is
+identical: SMB connections are no longer pooled for reuse.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/smb.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 00297ad..c15fdce 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -1242,7 +1242,7 @@ const struct Curl_scheme Curl_scheme_smb =3D {
+ #endif
+   CURLPROTO_SMB,                        /* protocol */
+   CURLPROTO_SMB,                        /* family */
+-  PROTOPT_CONN_REUSE,                   /* flags */
++  PROTOPT_NONE,                         /* flags */
+   PORT_SMB,                             /* defport */
+ };
+=20
+@@ -1259,6 +1259,6 @@ const struct Curl_scheme Curl_scheme_smbs =3D {
+ #endif
+   CURLPROTO_SMBS,                       /* protocol */
+   CURLPROTO_SMB,                        /* family */
+-  PROTOPT_SSL | PROTOPT_CONN_REUSE,     /* flags */
++  PROTOPT_SSL,                          /* flags */
+   PORT_SMBS,                            /* defport */
+ };
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-suppor=
t/curl/curl_8.19.0.bb
index d58b774011..3326f478b5 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -15,6 +15,7 @@ SRC_URI =3D " \
     file://disable-tests \
     file://no-test-timeout.patch \
     file://CVE-2026-6276.patch \
+    file://CVE-2026-5773.patch \
     file://mbedtls.patch \
 "
=20
--=20
2.34.1


