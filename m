Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC44C55ABF
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 13:11:25 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16080.1785849084080459144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 06:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ilEAvVLW;
 spf=pass (domain: est.tech, ip: 52.101.65.36, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzI53EMSiOybEF4dVfY08JSKxJSIUMWz1mZtbzhxPwBwPG8Cu2Z83frU3unAai779ULYE08/G24Y7YKX/5xkL4s6hbVDgLVgPBz7yLT7QavUxfPTq+YPd8MKBHUOUMdhkCibb9eFrSGaGQ6pkarIxscZoaxfTpfED84XCqLN9rXs78pm64DUUszy3VMvlMfOBAHQg5NtAWYNAu6QXHDoSWCE0krLwVjh3dad+DtktE22Yrs0CYPu/WI8ljHtllXQ8pVFahIWMlsWN4DtJJVQxz5RFl3gNr6VftZQlq1gTUeRgsd+fiU/8sJQwh5WsQkjsFxR0+Nxxn6/vk6KWu+7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCxQEsfZ2I471yXM1ZR33KArQ28Vp/a/KH8yj0NKvTI=;
 b=Cig19CX0/IC1XzJymkeGdtjM+r+yWAz+UukNUNzBQIx6Ap8MFBZtW4UOubDM1YKy9HvE7N9jvBTcvJMVMMPljFL65dJpsCWwykmlBf7gz43eCIyVWbXn4/vXSQj1my1pJNAF3M0B3T2xGMT/W/Ixm9ilY9J4w0h4xq4BYiQdvXtJJaXu9afGyxL3bCzQl1cOolOHcEYpyHmDIdq/bq00L87Oaa3an0bMvE1FKxYFuUBsI5YdhEfIJkTkg0vyi8w5KhZ42nmSLiUCVL+twOY63W1sK3Dz7DBKWStFGRbVZTRalxu7zRArXZXKondiMyNQCwN1VrIcQKF1z2THM6OlXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCxQEsfZ2I471yXM1ZR33KArQ28Vp/a/KH8yj0NKvTI=;
 b=ilEAvVLW48EznbJp8AYcOhv5AlnE621l6ePAFA8/vd7EHihphq2a1SO+cWph6bVWN/WVTh+0Jfp0ZAezyFozXAxU2VTeJh6L975h1qKfDhmP2U94Ikq2Pq0F1DdFTovwqY9gcRq2XwjO+2fG6d5hlRUKUwDE1XAQqRUNXG2gqkKgt2eES7kAXpPUplWKlDKCYJmSKA9Lej2SLTA0ffd+jaMzlK0QXxmQWHLM5OcsVh6JVBx4g12Wy3Ls/PYXmbXkxPb6Zd1IhuNIyqwpNefb0U3QfbyjNToWtHxM8CkbEjo7u6o25Lb9eA1WXn7YA+M+7zlI7Z4p+J8U88Ff05mxvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PR3P189MB0858.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 13:11:23 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 13:11:22 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v2 2/4] libssh2: fix CVE-2026-66033
Date: Tue,  4 Aug 2026 15:11:11 +0200
Message-ID: <20260804131113.3588-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804131113.3588-1-jaipaul.cheernam@est.tech>
References: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
 <20260804131113.3588-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::30) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PR3P189MB0858:EE_
X-MS-Office365-Filtering-Correlation-Id: 70021edc-995e-4fde-7199-08def229e1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|11063799006|4143699003|12006099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	Ojo3mVaosnClxa5ZPCaCNpVvueTSQqFRhyxtWzQllkaHfY2UGernIeIgvGqrwPcZeuljsa2uRwwszxU4E3dfHwHTqxst6Tlx3IgmcvU8E8fjgzaeMV6p5HgQqaZB4CKakXkuSxV+STFUp8szfwdUE+VWP2nXNYblKHyKzHMglS73cBlV6F0I8tMbw+ArTTrAZAxW2SWfuFAfeShKXFo/ReDHeMC/HXzPXXoB2leK2FsK/zI6mNgNnfx/bdrIhGqZMe/NRtMsK8sVqLQ5F2XTCpt3974QDSBDYilEoIwOOqYpbeFcFSF/IxveM89pRatjOuYHLiYOg6vrVB4RypXWzpSdRuXjNvxnwywcpOz/cBba5BQGiH16l05qKciMmHuS77SsdqDVzPzVVizYLwLNqOZFf6ty5tM8XON9LCp0CXci+Iq56qaXUZj8oO+D0s1aLzlYtiTtjChsIn4GE3TY2XALU4kE6gbD2wOQwbOs5DLnZxrgw5071/HtZsNGjQ/ytt8EMQ+2glXwXEYL7w5B6eNkxynocWOKjUCoqhzffojzfhnQ+sRfjpW3FiNacSu3Y6viUk09HTiEw+XBMHWRyYBk3G3AWUvRA4lHjibhQAzn/calH0PF8VwF5L4zV1s1A9SHg5YN4CXxYGbdVgKm68cESvGg5Ybp6+XDE4sfdgg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(4143699003)(12006099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zhal62CtykyKjyJhFDF8w0RQqRG0W6PHCX9s0jiL5kWBfIW8WzfCqhsjWECV?=
 =?us-ascii?Q?T3TSkOF/NLPXGJuYBb8yNOxp3T9MxEX8DBFY2b831KO9mv7KKG9DbDRKPdOn?=
 =?us-ascii?Q?UjjcARSx/umdo2uM1AGNnzn2dzonw88PuzA9TADu0UYfEBKcyMoKnYzJzTCg?=
 =?us-ascii?Q?HwxhFUWpMXwLHT6m07KkGTMV/8wgdy9+e/WL42TjsgShM7ysZBcAtaUSszp6?=
 =?us-ascii?Q?1j+O5YifxVq9NHO/B5MKpHQkm8xf7H+lKN6ykqp3V3EzlIuDSHLwgyKSWY6H?=
 =?us-ascii?Q?xY4E6g5oIMM2Dl4Q/9nbnpCEtc95c6/izhQnnitGN9Ws2pnkmFu2Jazb96C1?=
 =?us-ascii?Q?BViHFsJk10BApR0f0uZk6q6/QPktooCNgVleo4l/mjENHG4TS6KY0B7IXmmF?=
 =?us-ascii?Q?/t66kMRskbmyw0rvF9Lq/awDXkUuFAldPMlyaGEtaBIMjRUy4kc7L7LZ+w5P?=
 =?us-ascii?Q?mQMqz0t6JsGKPNOCSii0/5zgam5e0WE85k+LA9U42WH7236pRHg/oNOpfurS?=
 =?us-ascii?Q?mjIYxmkD4lFsnyeiIcQfWsbpfzvM0JCFrP1wI36wb3tMvA9if5mh+mpdHMLC?=
 =?us-ascii?Q?rwJXn3ESnSjk5sIRX4r+RMCIZaEoLmr7D4Q1a0ztbFwx3VB5S5ap4mT2kSuk?=
 =?us-ascii?Q?AzRuBYpjmEfXAikKueT9TcPk9+Z2JiA9mSQmE30ciejdeHO/VGLvjmKJUHid?=
 =?us-ascii?Q?djZT9RU8mEd0uVnQXAeMdtft8ymgBA5OFWlrDHh7OvlKk01W22NyxUoXzb0r?=
 =?us-ascii?Q?F6oxB7lj17H9PEib7FdeMVCuQJ8yv1E/E/WrgVruXgecqHINkJiIQoPZ6xMS?=
 =?us-ascii?Q?MTQVZUG1E3W3LsggdMQwg4fD1dDKEp8hF9ImMy28rATrONK+KtLz2B/HAthh?=
 =?us-ascii?Q?++MHYaRZ2FPchwK7wXHU1NaPYBtDqUAQ5Z7avmQ3NXTpaA33jDKSyPtIt8Rl?=
 =?us-ascii?Q?2eIyeL+n5qfjRubq8bSV1YjYEVfXjDfTrRD0Lnjy3EzCaTY3YbLJWy3GvLJQ?=
 =?us-ascii?Q?sJ30kwwyHM9diUvR+NMnSKgoZ446fqB8IIdskrq+e7Y7Ehek148fOTS6NSNE?=
 =?us-ascii?Q?6dVSBROm57n6zr9w2t2PVBKXgeTIWv9Pogm8sAe/qAFvxIurM7Halp/pOPFl?=
 =?us-ascii?Q?zLPPh8OsSsavAmkoqtedT5ZOznIhbwRdNnmJgQkDI3lUkmjdZniceoax2HXx?=
 =?us-ascii?Q?ZI/ndWe3pQSJM7Jcp2WqfElhOa9nAgyE8cRo6+Bdo1VYiBfn5UQ0q+uXrWNS?=
 =?us-ascii?Q?kJbJn+rJXzzEjnpr4/qrzZZ2g6o6ITLMQ/VDZIB6Iqo1ESNgbCD/KpGN/kNj?=
 =?us-ascii?Q?dd7h06iVrs7tObJytYuTIoGc8wVaOi9nyX55JOC9ZOia1XayAZGsGC7k6ygE?=
 =?us-ascii?Q?YvRQ78AHCB81BQXJL4dRHLNJf6IkhHByF7sMK5KtbTjh8knC56nErBfPbR3E?=
 =?us-ascii?Q?GgEfrXYUN0/nMIwg8Y4eNaO8RN4zdCjV6SZYa3B6R2l6UrNRRmzjqgs2DML9?=
 =?us-ascii?Q?O2eSJfDZLthatrPnc+VTeIEVC6Dtyls4R4CPrIW9a4cgWHnprw9xpSSnVd1z?=
 =?us-ascii?Q?acE/LeBwk/jWOY2tKaURvO2MdoaukV78dR+8N9kNAohd9ZreHdG5zxJh5cr+?=
 =?us-ascii?Q?vSdCI8y9hf5VbFdrMuWxq/n/w8ZAPZ4f1KnQBdYhBtvKa4ZCDreLOYPN+dDG?=
 =?us-ascii?Q?TR7SaMf5pE+yB7ekwFnw3o/1CDwYsG88cuxdoZ/J5fT/l693zHIHmViCNVAq?=
 =?us-ascii?Q?q/VO7JXd1j7RmmAilVvLVvkiMwb3uD4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 70021edc-995e-4fde-7199-08def229e1b3
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:11:22.9160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQdEVPRLNhcPH+cQPKljrxX3dBljRekDhGKLXvT5EXjCERyXfsrQF/iEUmfUCIWdjEirMO6hcM2UOHyCfq2FbLQng5eorOvKeHHu3BGy5fE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0858
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 13:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242760

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66033
https://github.com/libssh2/libssh2/commit/a2ed82d40964bbc0d64cd717aa0a5a892=
117d2e6

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libssh2/libssh2/CVE-2026-66033.patch      | 45 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66033.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch
new file mode 100644
index 0000000000..bb046a6eae
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch
@@ -0,0 +1,45 @@
+From d1b6996c3b31ce6b60d5a820ecc33880e61ef0ae Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Thu, 23 Jul 2026 10:32:04 +0200
+Subject: [PATCH] openssl: fix potential OOB read/write with AES-GCM in
+ `ssh2_cipher_crypt()`
+
+By applying two bounds checks to non-debug builds.
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-c4f7-cvfc-33j7
+Follow-up to 3c953c05d67eb1ebcfd3316f279f12c4b1d600b4 #797
+
+Closes #2401
+
+CVE: CVE-2026-66033
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a2ed8=
2d40964bbc0d64cd717aa0a5a892117d2e6]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/openssl.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/openssl.c b/src/openssl.c
+index eba05031..28ae1cc0 100644
+--- a/src/openssl.c
++++ b/src/openssl.c
+@@ -1042,13 +1042,15 @@ _libssh2_cipher_crypt(_libssh2_cipher_ctx * ctx,
+     const int aadlen =3D (is_aesgcm && IS_FIRST(firstlast)) ? 4 : 0;
+     /* size of AT, if present */
+     const int authenticationtag =3D IS_LAST(firstlast) ? authlen : 0;
+-    /* length to encrypt */
+-    const int cryptlen =3D (unsigned int)blocksize - aadlen - authenticat=
iontag;
++    unsigned int cryptlen; /* length to encrypt */
+=20
+     (void)algo;
+=20
+-    assert(blocksize <=3D sizeof(buf));
+-    assert(cryptlen >=3D 0);
++    if(blocksize > sizeof(buf) ||
++       blocksize < (size_t)(aadlen + authenticationtag))
++        return 1;
++
++    cryptlen =3D (unsigned int)blocksize - aadlen - authenticationtag;
+=20
+ #if LIBSSH2_AES_GCM
+     /* First block */
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index bd7d1f7b1d..de435a836d 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \
            file://CVE-2026-66032.patch \
+           file://CVE-2026-66033.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

