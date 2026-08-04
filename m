Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81017C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 13:10:25 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15916.1785849022042865078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 06:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Z7VOuLrC;
 spf=pass (domain: est.tech, ip: 52.101.83.42, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KymIT1ydIhvoY+R+t9tvVrz3xPnnzMWfr9o2oculi9PmGYhbmo8upCJAzo90t0KvVcOs+GS95pBmErjZScEvVAGRj0JdqmAviEmivgi4QElih5SLiXPwB5d4i9nOamXYzJcdfLgfQ1jbfC1QLOQt6zwzhWAkmrBEVNbsvu1JC6MDJ2DbGPVxQE++UW0ybkZPU0/xxAb94jCgsfsEi7fqtXU4mSi9hssnugq8hq4BVOd7J1/j/SWaMYzSxn6w6zbqCu3Il5erZeZEt43ywrlVmkcH1hPtDcqae/ITWl0hwvl5YUqloSFeWWom146pYrPhMsTEiGsWldd31SJlnwnbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5I3Ktpwxa/AwoLL5xU162C24Kaf0noeK+ixa3lWWT5o=;
 b=prF3tqZmqMcT8A90d4tQLKPXTf1/q9LEgcLGQ4cGzunkBub/kvTERYf1DQHpI227Z9d9udRArMYx1RFeoriSN42b6N9m/nwprhIhiBBk0MVdyNrwBbnu85PsecsvyGyZTWT0yw71dtmciEIxycHEI1xTQ2/7MnU9koNIH5iHzL/+LVG3yHR6uhidvtnToh6uAP+J84NIrbiW2Fn6/mS8qroDZlY2MfcprzERgOhy+Bw3UwaWKh1JjFYSqpORc0LF4T5KDBA0BzEKB3Cm9QiZTpKd36wZh0b11jc3GRdUDMQiXwl8HEZmZunL14oF9J+O+xbyjsD1tMYTih+Gloz2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5I3Ktpwxa/AwoLL5xU162C24Kaf0noeK+ixa3lWWT5o=;
 b=Z7VOuLrCkffivmLQhhX4F9V4106oukDt4v7ULeN7d6LMrQPv3JXgoQIH/h5PCecj95Pq8jCg1ie5xJf1sr6sLdhB3vpr5syrHMNHR3GRjvioNhqnGa/FBIZjcfgfAIpGvXx6TWrgSKKqHlMGNb1M2s7kCqD/LBtOJdZbYa2xo5OICb52uLKoJl9v/aU8Cy7qBA+pKoZemI4do778FbLV2ElncVF1m9IBAPHRXjBQYdHs2Dkgsa2lU24AIiw1JESRUT/lbabzsGY4bcZQzUcESnUMyxPYGqgrt6ZV53NIqNTdVsvT2IoDrdCyp1THjZC2j3HMndFyNV5g4MChJ6mb4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB2013.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:504::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.14; Tue, 4 Aug
 2026 13:10:15 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 13:10:15 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 4/4] libssh2: fix CVE-2026-66035
Date: Tue,  4 Aug 2026 15:09:46 +0200
Message-ID: <20260804130946.3539-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804130946.3539-1-jaipaul.cheernam@est.tech>
References: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
 <20260804130946.3539-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0081.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB2013:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa21918-7890-4561-79b8-08def229b961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|4143699003|10067099003|12006099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	VNYk7kb1JH3sjklkH/NGadNWevTz/RM9cj4Zbitfmkq5Ih+H5bbPlJE7akKlxp65+mrVGTsu7ENvYe0btn2uZGaeGJciOptjxTTktL/ik0nH6bKHaGkg91dT2LLi3IwzJYhZg/pxpoPKFxbq3oU8uaLhpYPjoZG6kljI4Ulz9X//OodhEgEvn23G68JNE/EWXH2gV+dReiGQ2rqPbNudh96IpEz4+WdAlhXtzY9abDwZs42o3pUZDu4m5Af02AroX8PMzvrFUuf8CbxIMdh+fGnk+0cDk6gcyo/5TExzfoWc4ljXF6i1CyELcRIYIj9umEM3Qg4fqAfU7NpsR1mcMgCkywYJmK1kKVYLhcPT+TYrBpqRPeJzQOC8X6U7CuGZeHD2QtcermUtgacPmHjj1HNFXgJgMSu1IUeweZp9gkrWT3xdteAoqxMEOdMua1rA/VrhYA/gZ36bexsk0QPEcpcdDAuYUdCetwXuRpZFdVdB0k+F99F76TodpSpwFyobmrwlukE/uHT3g7ocnxRjNlrp8WkX0+xJXE61HI/OUQwhr1hSlexHdqw1RtlBFk8bL5+3z7YgAMVjfiQHguSwDqTiCKYWYcaTvav5Ob91UJWV1CIXgNrkrZ0DCwJbspfW/SSBHmyLSx6CYiu3ne8SnEYoRkUapE+KWhkdHNJKd2Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(12006099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?seIJ/j3E/CJ9++qWmS/bjiuQ9AY3oCI+e4h9oiObIztjA55eU/KP7Sj+1L8K?=
 =?us-ascii?Q?5gs0ZnlAjlV3qc+wgoIW9iqbKdgyrlKrPFtsluDfs9+Vvn/Xla8bb3SP054l?=
 =?us-ascii?Q?cMQKxDRBTRUO70vITDdOWxWx9Fsry2S8P2wf1W16wqENnX0cH3DEg0RSQkv/?=
 =?us-ascii?Q?Xz8oDBn2dNKsVC5bgmSRDTDvbIe9O+8q5746FMQumwIATqP65DhuxHfmWSs1?=
 =?us-ascii?Q?ciaunR9FK3i2TOGjPX6thVtN2mg/dzuZMbGPqgowC2H9gxeYp/v0z7kK1xIB?=
 =?us-ascii?Q?iS5/6+XsHsrLKe0EC8dH/F5X0DO8vWuVpssTMnPpV6fFcLffUBonOS2fmZEI?=
 =?us-ascii?Q?PDLhGSfbPypieFKaR/sU1J5j9xlwz9tmOFOiEYQixE4QOwgUTF09anAO8mVz?=
 =?us-ascii?Q?gJ1fSunbqwQYnxpw4eiuBD6xBi9JKOHySKRaJge9p9fC7/HRDy2VNZFgDJ/+?=
 =?us-ascii?Q?OKyIu/lArkZ/Pcknxo3TevOJCxuIgmkn3oDiAbt8+W6TV3DdJdvu2jropl+T?=
 =?us-ascii?Q?Mu4pdGBxKxyujgVKN7dqCTVkPiIlKJ9CS6NAcKBS3zn6FbeV63wOW72nHtDR?=
 =?us-ascii?Q?4/hv3FgdURSP63nNK8y8tZbmdlRvYpEfGIEA3R42vAxTVEzryFS18H6lvkMY?=
 =?us-ascii?Q?hPn00Jb4ImZPBkGFyWDk1o6/BbckIWVaWnaswRysMR6V5pR1U1dp9+2gx7pa?=
 =?us-ascii?Q?7H2M8jH56jn/51kFnbffqaWDQfiKmP6dgR1SvPodxLBk1IJ2y0CSAy6dPWoH?=
 =?us-ascii?Q?eRvTQrlwGjg4R2A7LXZWL41Xd19M+JBrOWkihd1UBTfMcdgDs4l57FsClgFF?=
 =?us-ascii?Q?joIZCWaMvAhbYp6rMnynbS9q1QcOALJn9d8jG2k2LHX4gxUoyFsC7O5WEVVP?=
 =?us-ascii?Q?oFsfKy5KESRaJrXh4XqVEMwTy4gW8+THP7l4Cxr0CPaX8TCl17F+IkMoYWBs?=
 =?us-ascii?Q?v9OXecRwscrAGkd/ifibBOhuGWCsOON6RGjCEsmnIfIrtX+jFfkRtxITp57S?=
 =?us-ascii?Q?JLbSDLMwW0bMtA/8eJIzhBkelaa5rp1nPSrIpYkA57hWJeniy0LzkUVXwx0b?=
 =?us-ascii?Q?wdZwUGSl+RKts9P8J/xwB6LgwjisdSNZHjsn0jhVpNSJ7p0IwSDTfv33kYjl?=
 =?us-ascii?Q?MMzwNtAVQjT6vfsO5nByO4SSec+clB+1Fn+DjCf2YtzzRhragl/niAMvDIS1?=
 =?us-ascii?Q?f1gdoepOKppropeMwVfkQEEjbr/0E6rhSlgzUjQjbLpdhSmihBATFa4JX5uE?=
 =?us-ascii?Q?oz8SgNSGREt2md9Fu4S6eMAWqqpjK7l/IT88zuSWcTrye428FaKkC/8Bu2xj?=
 =?us-ascii?Q?bIROSbwKCHTIMHEVlXPzXVlwhRkrJvn0a9+OtnKwKib2EW1gSREOooX5FavP?=
 =?us-ascii?Q?J0O7Kf3bDaEkHbc26Z6F9PrnUmusUwXJ5A7zuiUQgTutF4F26R858AyMoxxj?=
 =?us-ascii?Q?PaOzmNIW9p4WeKj9u+kpgNSCAJLPyjWYun/XKRoZHGTeF1oKY8Xq2MXHPU4j?=
 =?us-ascii?Q?0PtNqKuUMOgB7JrG0GXmloUuywhKoxk9y/6Ay7bJktEnXYqeHCPRQeu+oRDw?=
 =?us-ascii?Q?JOtuswOrDoqzjRkCHNxI4PQgnWXZUzUj23ajactwgm6EqywFAO2B8aJex69r?=
 =?us-ascii?Q?2yxGHF1wHGuam5BoN5DZa1cHirn+I9rqqQltGtC38senXQUTM1+uFx0tO37g?=
 =?us-ascii?Q?UeOquat+i4zvEddkex2e9II5s8eQIsAgghRrf73qEOKQjj1+krTH2M1YV26l?=
 =?us-ascii?Q?Dl+ZqqgV9ok31p9+tO9+V09lfbHRFjU=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa21918-7890-4561-79b8-08def229b961
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:10:15.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3E2a1KP/qLpWRNxEavyqn6WdOhmPsZH1bKxKdURUEHFfOAWrS4mqC8+/kRmMN2bWpbKTM90Hw7NVSUoL46AUVkP7HVgNx/U+z2g9hLDj1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 13:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242757

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66035
https://github.com/libssh2/libssh2/commit/42e33d81577ed4b95d4b4f6f845e5ee8e=
fe5eeb4

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libssh2/libssh2/CVE-2026-66035.patch      | 56 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66035.pat=
ch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch b/me=
ta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch
new file mode 100644
index 0000000000..7c15f92fb6
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch
@@ -0,0 +1,56 @@
+From 6671019836476649792eea12868a370133be1abe Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Fri, 3 Jul 2026 18:22:55 +0200
+Subject: [PATCH] transport: fix potential heap overflow on ETM decrypt
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-6c79-444r-wx26
+
+Closes #2198
+
+Backport adaptations:
+- The upstream fix uses SSH2_SAFEFREE() to safely release allocated
+  memory and reset the pointer. Since SSH2_SAFEFREE() is not available
+  in libssh2 1.11.1, replace its usage with the equivalent NULL check,
+  LIBSSH2_FREE(), and pointer reset sequence.
+- The upstream fix renames decrypt() to transport_decrypt(). Since this
+  rename is not present in libssh2 1.11.1, retain the original
+  decrypt() function name.
+
+CVE: CVE-2026-66035
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/42e33=
d81577ed4b95d4b4f6f845e5ee8efe5eeb4]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/transport.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/transport.c b/src/transport.c
+index d147505b..9f386e75 100644
+--- a/src/transport.c
++++ b/src/transport.c
+@@ -242,6 +242,17 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /=
* 1 or 0 */ )
+                 unsigned char *decrypt_buffer;
+                 int blocksize =3D session->remote.crypt->blocksize;
+=20
++                if(p->total_num < mac_len + 4 + (size_t)blocksize) {
++                    if(p->payload) {
++                        LIBSSH2_FREE(session, p->payload);
++                        p->payload =3D NULL;
++                    }
++                    return LIBSSH2_ERROR_DECRYPT;
++                }
++                decrypt_size =3D (ssize_t)(p->total_num - mac_len - 4);
++
++                first_block[0] =3D 0;
++
+                 rc =3D decrypt(session, p->payload + 4,
+                              first_block, blocksize, FIRST_BLOCK);
+                 if(rc) {
+@@ -249,7 +260,6 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted /*=
 1 or 0 */ )
+                 }
+=20
+                 /* we need buffer for decrypt */
+-                decrypt_size =3D p->total_num - mac_len - 4;
+                 decrypt_buffer =3D LIBSSH2_ALLOC(session, decrypt_size);
+                 if(!decrypt_buffer) {
+                     return LIBSSH2_ERROR_ALLOC;
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-=
support/libssh2/libssh2_1.11.1.bb
index 999c3db55a..5a0e6904b3 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-66032.patch \
            file://CVE-2026-66033.patch \
            file://CVE-2026-66034.patch \
+           file://CVE-2026-66035.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

