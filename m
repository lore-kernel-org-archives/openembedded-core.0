Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AC7C55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:41:58 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38992.1785746517328628401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=BybYb0fX;
 spf=pass (domain: est.tech, ip: 52.101.66.14, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOTNnaVXttlGeZdDVh11NXdf1905uAW+R3ck8qVz93W8zkumnWgkstbf4alR3AvRH6p1ZwNM3qghVI2Z6GmCiaEtxE5FdbFBOL9p3/WjSMFUv43fQ2mN6HgqTRjyiylfwNdKHlZX40ftKMQhMmZY/ZN7lkOTj9Vt3aPHpiu8GWEzIces8wrOddCS+l+aZAqs6SiCSz+Ozi01AVbFzAvrq/1wcBhTcG7U46XEd41BgEalL+mNNdyez5PmY2ZyiYX0aDB2hW/8SLN6WTSYqlom3akWhX+ynPugkmwUpMRdoXsq/GiMBSahJLnzM2rUw8JjH6qZTwyhWW8tFtoHydCtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mNlZZN6cGaHso1I9jC5O/y9Q2fgYcW0VjhLuXmjeio=;
 b=KD/a6iX9G59DMyZsAMF+Mz7tgLt0fCAbxeztlxR/gky/hEJwAfO8Uea9SUpRoKnfHsH8Jv15xNMEMKmP3uRJpM/6eX5Uw+nY9z1t3VwnIWrx2LcR8CGM8CGQmwO9obH4v7f1KZeJwsveTrO7/ROCmFy8D/Tp5CGPc8cctxueUOJLDQ1YmdoZSY5Q8h+zJ/tgfbvS1XsYs8jNwbtWyQM5P8p8f+C8xHDDvwqYd6E4Fc+A0kvPIyC8Fe9090RURtmhbuB99BceFrfGjnnzrpLoaDqnup44Db5zNurIo86zflywYxpFuDp2suadTeGnPGpPxqx7zjnQIo8uF3w9nszaIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mNlZZN6cGaHso1I9jC5O/y9Q2fgYcW0VjhLuXmjeio=;
 b=BybYb0fXyqrp3r3k9qe9QZhHawVvF+Ag98tsILy/fM2sZWaTbYTlxNRYC/MvDq6tEL+KVuIMkpa+ODe3yojQbEsqv+bjy3R5gvhOO+jd5BBVLDOIBrizbta98u9Lcnm9qwpbaqNd3rFzoQ3NKyj3G8jtQDGsm5k8RSHezF1ICW5YKpv+RtoR1f1d2rFGheEtOMUa101hpIiB6frXqZ52XAsLKLCTBF+vuSXx1EwPaDJUd+0cSaOnxh1LXQJc+kDtU2C77Zpg1/pBuuN/NQeN6YLJrbK96TCE/nY51dvRlHdZkigJ4G044zECnPwQq3IYGiSn7qcv8ZCGiTuHjhoAiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB4P189MB2215.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:380::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 08:41:54 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 08:41:54 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH 1/3] libssh2: fix CVE-2026-66033
Date: Mon,  3 Aug 2026 10:41:39 +0200
Message-ID: <20260803084141.46902-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
References: <20260803084141.46902-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0047.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::14) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB4P189MB2215:EE_
X-MS-Office365-Filtering-Correlation-Id: 2364f7d5-f50e-4663-20b4-08def13b124d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|13003099007|56012099006|10067099003|11063799006|12006099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	UyAB32ggWxnEaorjBO7FNOAeLvFsCWPW1QWCOoJKSHL2Cu9RRTkoFBF7w49+un/MPIBzQSEu7mkcM8KNH7oVs9SIh6oJH+KM+SW1Q0UCmKioH91EvUR9ngK45fqtYSJEVNjWhJsptiWc2GIVptXEgR4VRczzvFCGvYEYaqGnTnXEl615cpk/pVYyZr5315D7ETYQhwrZWnWSG3FI92gTPZDD9kQEpZM4FIgV3nMgMTHcK2lDftQK1c8QkOm5ZSQnWUeyc/ItKP8cZ2SH/MUOgrIy8HSjnhYWr2Yav/AWArt/uH163PegxgghGETacguotp9OQ2ETnrvC01Vu/tAoYAY3xScieW4ejvB7mWQUie9252k+RksES7t67SYd1JCZWzri6QOeO8cWCM7n1BR112owfxCPqAA1DiOax5Vmms5LMvcBIFwmhBRKlnnpGK5ACJsZkh/ZMGm3PGzFCO20wCLWcb3Um3b56x9gzKajt677e7nmAenNwAi2JAc5Y16+RYXEqbEQBU+/JjJs+E1MDAyn9eYhV2hF/gkrgXyzjw/dMCaKOH4CgjXYn0j3ikjGpdSokuJ+fBRJCxVsBGZ/rpez+ghPaGFI/ZDZgasUVmmyDDKF8KqHExivKYMWw0v+rH8FaP8jtriu+5sWLC8zoie7p2yj69VLTmuVbHSX68A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(13003099007)(56012099006)(10067099003)(11063799006)(12006099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nVRsN2gAOGAx55/LF+HbF3Sp0lHYiImg8TNiejR1zZcIhP9KL/gpsQxTwuae?=
 =?us-ascii?Q?YPlhxJ9hk7a0j0drA/rHqhtNW7cP0MaFovU3isesxRsgUnJRrs+nB0EhRVHD?=
 =?us-ascii?Q?Jyr65+DuFSecn7d2Xkuf+eL6uya6es0CT8H5uTz+01suoSV4dER6mZl7gkAM?=
 =?us-ascii?Q?iHzUqT8qhCusTcIULHuSrig1gPCsoSJaW340HmsMPyw6K3xBhOMHVKCx/Um3?=
 =?us-ascii?Q?XdleAo6bQv/0ELywFkvXnaMqq/pStzP1qx7Tiitkbko1EUcoVHQY40TANPn9?=
 =?us-ascii?Q?nQm+RVi6wzHr6sVvqILDwMCF9WNTp8r5QSEDt0+TE1XwbsWCMELzV0Ad7Oz+?=
 =?us-ascii?Q?mUb5hvEANco/udqmzTaowlZ6dXHGEVEKaz5BT7RuSwqD+guXryB1XQ2zcx1D?=
 =?us-ascii?Q?vYI7YZjbavYdzUyFF8q9pXrPQebJIPn8Bi1SxA5ypaEIeF3DFWhW8FFCrRBs?=
 =?us-ascii?Q?ndHfFDVhttZ72fNgxRa4vl/dDF8JUDvxuEvRRLkd22rr0DjYR5IuxCQEob8U?=
 =?us-ascii?Q?XPDb/JQbD7QyrM6yzea5JC7EGU740b4E77gBpZdnyYyZkLCD1oqvNstJuwov?=
 =?us-ascii?Q?LtgXVKE4CwOIoibx9cM1kmHaxEJwcXXDI27EP3N/2X6lfVPYZ4m+TAAzpuOn?=
 =?us-ascii?Q?JRO+iQWrKiqfiv7Dis9COM7iibODzP5u7jTuQOYlTcLDbCqo5R8AIx0nA9Sb?=
 =?us-ascii?Q?JRu/22EhCGYFlLy7SXJX6XWhZr9xrLBmHkQ77Rn5AzUOxo64ONosMOc3A70t?=
 =?us-ascii?Q?DLEvOPElPFntS0Vaslbt9cjzdHYFkqT6xCAlS6pqru+hjz3NdvrwqMPEaIrc?=
 =?us-ascii?Q?TnPTfXBSo+TpF+eTiUkcn8ggqOhQexabcID3wLTmuj0sRjW0yi69ehDoGVNX?=
 =?us-ascii?Q?4OAuwsnOMZsEh6KYvcT7Gr8m9+/Aty8sqF+Vd8clqz4ll8OtIS7/LPduFCwt?=
 =?us-ascii?Q?IloQoBkF3mwvlXfdDSd8dUfsOKiSkOp2nsDy1FMw6RAPSLYTDW10HxxjKHM6?=
 =?us-ascii?Q?S9tbCqBwZrBFGyP6qQUdW1Futfqs4mOtgZnXKoB9ToK8MucVl4ddyktUnui0?=
 =?us-ascii?Q?nMp03WbyJNCtAwzxbXh4zUQBzZCA8lxPvnD9xH01fq3VES89MB1BGoqWL9pK?=
 =?us-ascii?Q?GiUQgvmOrXZeWmz67w/79JcfomQhap3eSbweldf0xxDYA11S05RdxV7ZYFSg?=
 =?us-ascii?Q?roNvL48B0m3rCjYS6K/tiIxZMb1R7PDJcAF5kSSZ7idryciKYzsJFojUJ0A6?=
 =?us-ascii?Q?p39h679RRxvYQ5l9PZL0eUTTrG+JKFzyv6TJm4C6xtnsVhL0M18uvbf430ji?=
 =?us-ascii?Q?mvQd79wIIBhIqrYxltc84ipYPC/u+Ki4MK0Ffvxsc+R9Rg8wYnTUfKMA962l?=
 =?us-ascii?Q?hc72xF6CjUOYvk+6wfnBZAz+OC1JhtaWCWEgFuxhx5sig1xkFdQoftIFjATQ?=
 =?us-ascii?Q?XUM+3fPwADi0RNyp3cRO0zULF8iYVK6nYPBRm4Ifr+2YRb+U8c1Hc64fzMNx?=
 =?us-ascii?Q?8QuuWP5onMkNtZFx96IyaOMap0OFkrvksFFezBWKgR32xXKevpEdIbym/B1p?=
 =?us-ascii?Q?9CFnOebzcviCGPy/L4Lhol3y6QVehtZLpMjKkn9Zlp1nw7CfKvn+f7F/82QQ?=
 =?us-ascii?Q?rJJqI2Z39UJLxC4jo/npE/HIcg/mVDwzLhLWslsyQKZpu2EC7tt8Ze1ZmMVn?=
 =?us-ascii?Q?SVL/3yCb5mVys8dGQ/Bwodu8W608vIp20YCVv9WCDg4ZD/kZgFWeE+tFSNpD?=
 =?us-ascii?Q?eeoPlOZSeQ7vv86IgS058JI4+noUZH0=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2364f7d5-f50e-4663-20b4-08def13b124d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:41:54.6705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoCDrMLYMp0b5REMmKQ6lK1gPwH/mQspfAss8w2BaXIyvynyWS7DLBiWLClq6RZ19kh+wBa+4A9VbwNcBFzjViDnDFzuuz5BNOIYmIGDfSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2215
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242623

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
index 32e1ad6c16..7e320ed0f8 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2025-15661-1.patch \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \
+           file://CVE-2026-66033.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

