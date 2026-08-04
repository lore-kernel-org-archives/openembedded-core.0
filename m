Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8B2C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:14 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14921.1785846192981109705
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=hR3IHn6O;
 spf=pass (domain: est.tech, ip: 40.107.130.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkQ+9IjwI0ZIOYOIQvJBtIEGxc8UcQ6KJu/NTYiwSluy0qRbvGnJwPiMhEjICBa/e6wwuklgsjmOPnU5Qfh6EMad1vKuiuAVch9s5NclzDrPRPhbfY/3+VHWZffgYliKCWDE61EMRmEz/g8/D1yTqXTjGlN5KWP0kWv55pxvDIt7X1/DtI1/vnizkb0Nmy9nYqHCbq5mxfP+90WUNA4+xGdA67Vm0QDm8DYS6xTn+yySFJwSVTfhyrJ+s7edy6awdjlGIEixxQ+D616/3qo3E6uAu35NDyVVoB4jFPVAmoVbbY7VcZfq0AbrZnc+mQkiUu76xnfbpdN59skqepIC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbxhlCtzmMxSYvNqkO49tv0PxiQOiZJ1yBpHeV87SbE=;
 b=G6Tu35bJMogXZTrbIcgw504XAnH5Rr0e7iMV4o19uehJ1LIZak2W23UtHeJjXnHnwfP0sPGHYA+fdLyAxUnQDqH8TwNFmOJUA71GZqkpsPoiozF6D4Dlk1Mh9KNR0o1vSc43nfqEQvOr/rjIrLL3p6EyiuwEr6P4JbDGs6uIDBOhjE2HTcaj5zy3NJFLy8jTKwjY8Vm0n4Pc3jXy1TuvGUSYo8UoFhQ9GCP1bN/y0O9b+kKYb4PYX50U186mBO66wb0uab/53z94s8LixypjYNIEY2aC7taVgIixZxcBgxHJgndVoNv0nAHlT9a4dpawfEFCvmP/G5sy9k007y5GCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbxhlCtzmMxSYvNqkO49tv0PxiQOiZJ1yBpHeV87SbE=;
 b=hR3IHn6Om46c6lCqfSMpYaRbjc64+yI0v9BtvfnI5IK8gebZY31JUp7mGYVTAW7sF0i5GckbP4aJHIZ/jKUanLX2XqiS5dCaGtHSSdkSjbA5lqVP8vXl/pWOSdHPlrv16Tcz67sSLhObF7/lOulv+IefO/PHtPs7yE/0oXTegTlaoJ/76tMXGiX4JQIE+SltzBk8rh7kvIIc9kuSyDN39cz8j0RP3rLI1jdpLiZ81HC0JQTaJ1Lggks8t00sk57OdbHFFFEeJvu972FrTufMBFkrPj/fhjMkQpKuyH0MhsEgK4Ojsc52MpRHMNI7iSKC9d4vEOHyzfUUn88jRP2I2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3553.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:504::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 12:23:07 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 12:23:07 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 1/3] libssh2: fix CVE-2026-66033
Date: Tue,  4 Aug 2026 14:22:53 +0200
Message-ID: <20260804122255.3053-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
References: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0351.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3553:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a852a9c-2931-4e13-16ff-08def22323b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|13003099007|12006099003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	tHWpdqD+bs50fkgdk564BKfdmqmMDtlYMi24gsvamutPtewwEV/6zFf32r+WK8wmGWQJh0ehnu7p39Xe3xBnPnRZQhskgweSwIHdAKyUQTwnhA9zp3DtEAnJ3p5pldWqh5+yzNRUIspW/4HQ6i1ZoQ8Vu4psF/qxkkmVokGb4S8NCOHbKDZe23XMwUbd3ZHyKEq0qKD5pY86ux1NYveH6uhf0uBbzhlbJBsBnYXF+DewNpIQxClIQqwqG6GF3TE9zT84ApZHKvf1dUX5yrkHBh4K7YR8Ul+gUHtr0l5B8nKFB0x0kit73EZcJQfcw+QGd0QvVpl6I2Kgg8VyEIKOAHOFZfQ2fqL4eUvVCiO0fasU4j1LB7pH7M2mzIONeGdRTRwi5vjKTP9GzGizLAakOSBozNFM3KycpNOWcK0ZLLdnUollsmhRWKYXr0cs2/avAnh/YvUV6BErx0MAkDPq4A2pnHBbrCPDwn4zKrrThUJvZ+1qz59giHgxtxysT2bdL5bzvxZ9U+oe8KRXM21TbXoomDYbrZYqegJxNOzjMzOzh/19n32as58PsldapIkCTOos6qJKQx/UZdf5pLwAgcBhxKU2m3u1WmxIEYaykiAdd8e5hP/YcV4rl9U7RhaN5wKgFo/zwWFxqOuFBhvi5RjfVDPUWggOpgVC4NmvYrE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(13003099007)(12006099003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ns1/kEWEAdOqUgt4mRco0MoR07YV7I4IBzYp9TTym+JOHU+CUGwbRTSIRw0A?=
 =?us-ascii?Q?2aswICxOGeTBWVQyqbbH95lWXxGRBvRtG6cGCyTF8iOu+Y2nu/SZVY1wT8oJ?=
 =?us-ascii?Q?p9swsP2MNcM3I81xIf8u7AHnVnrDZvGySeQ9G/l0NE9mk02YC+aXchLn5iqe?=
 =?us-ascii?Q?Euw43nO1CpwBsyCAv8EiSCioh8q4wnfhw5LPrPor340Vt9Kv7uFzGTlLt1UL?=
 =?us-ascii?Q?WCOGZa9UbvVgHIA/9vh/+1uBXI1qhqqIy1euqaS3kBjZRTTu5KaGqOGCzEiW?=
 =?us-ascii?Q?qEP6pte4vAOd30D3f+kWyu0+GCtH7IhmbWDK3oXpu9PeUB+d2IpqRa4cqmQo?=
 =?us-ascii?Q?93mNvOey83PRnRPZiK9Hr7oPoouqLWa5payReG80cVlZiW22C8sHAJYvkPsh?=
 =?us-ascii?Q?ueIa3Na88GuA5iiXZqNBr9fzAfwJWv2PQ5kYqJhnUP4Rs2UdbhSAdXlZe0Bq?=
 =?us-ascii?Q?PyWD9GuaTrQGW+kIhNzfTbDq6aYaqQqHHyCfHzb2RbB8ZGf0t/ysooBSv6XJ?=
 =?us-ascii?Q?Hnroi4oiDJlGzMl3XgutMt55+uvZWRrA1Ms/v74v1sGAZrIVYs02hMOzek+l?=
 =?us-ascii?Q?6hXjKnmNnboV9Jkzi6JieigiGNn1zAlaSE6wTDXfhRNyOJoydX63u/+eBiE1?=
 =?us-ascii?Q?QOW0nqKVjPbRFQ+nJhyMByL1eX3XaS7amdKd6y+xlsaqzicLGqa0QhXaN5Dw?=
 =?us-ascii?Q?u5fpQi37YLPJvuOpU0Q4ux/fbWPZllPflVDjZ9QibLUFlJGytBwpRIb2H1h/?=
 =?us-ascii?Q?7BbovSYDaJ2gemizi45q+sQYC8jsTTdLPT5fZcN5O19XMTy2V8WUlIV7v6aK?=
 =?us-ascii?Q?lh4fCnDTk/lcUz/V9/qj3dQxXj0HALegAu84umxBPy29nJBoDgdRN2PG/Swm?=
 =?us-ascii?Q?xFp0Yu88hVGFVbQex2I34hup7+b4uNR4kvPGVebubYrE6KexYQzrtzyhdg3s?=
 =?us-ascii?Q?vnPabQQy3T0z/AJdk89EbLdPXLNLW+ab2sDSyjWFeh/ST+ZmbdkbUm+SXDBF?=
 =?us-ascii?Q?4uoowc6o4n6CCwEQMkn90jqXwtF478HF74yd7DC40sOTIcc/bQgXUuR3ekmE?=
 =?us-ascii?Q?rh91pXPtRRAR1P2tinatFHFkmsi/JtWuf9+Hb7oTv990NEtuTH22VlNk/9AA?=
 =?us-ascii?Q?ceCVgKszRHDLnEMojJaHwzkCiNv649r7ulE0Y5+tiWmCJhgOy917yMhOOU0Z?=
 =?us-ascii?Q?a5K6jnYJfkeYa5HA1ExdZMq+KfNpgzHRqJ4TsvwoZ3UDdcv/llAN0/vRh/hY?=
 =?us-ascii?Q?7lWuOO4Yq9fSZiWSqhRalm6FNoiCd5h3m4vgbinpCFexw/RiJjtMKyiLzVWA?=
 =?us-ascii?Q?BUQ1beTQSF6Y2ZkpKMfOWwiwC8rLiU0pvGxCxQXwl8GAPa2XHrUTQbrQCSco?=
 =?us-ascii?Q?jbzFzERi7aFTTpD4IZJzntqE7S3wuR3CkWgZB2MwIRkOzLHMt6NcTKHznTYq?=
 =?us-ascii?Q?+j9BE2BZ8UgjmLos5bfJy3yTqoKN4J7nhvSVqSgoj+dD3gu4+k5MjPe2hWo7?=
 =?us-ascii?Q?t4dyD3uxsyrpakwR8nILIyUZAiyQww3TdNzLpN1UNgTxJa6o+UaeAzccLK2D?=
 =?us-ascii?Q?kJqv7CFIbkOqveY+EkMQY+tmemrWMvtNY6D8k9Y6G9ZHwt4gwS/7Z8erGEwj?=
 =?us-ascii?Q?i6I9178gB+zieljKYBtkmnt/+ezXBvWxGNLB92RDlnm74pwSytR2GVx7y0Wm?=
 =?us-ascii?Q?2mxFg+nDOknSBO20MWxpPE1LAofud0/SC4WzfRwfRQHxKeOUrTtAAGhbZLLo?=
 =?us-ascii?Q?A9bpjn3aHXL4KhlLsiJcjbQpOT7E/LA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a852a9c-2931-4e13-16ff-08def22323b4
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 12:23:07.1351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4mnMJ8LC7DJBmGDmzr6IXLDf5DkmBW+xrzKvgwsC7ZH5icWkt+Hg9a71ZO+xvoSunT/tUX/mkwaKTY/+1c4POyQ/PQHXxEhnm1zs5K+Z8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3553
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242736

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
index 960ff71df2..07f0037dca 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-7598.patch \
            file://CVE-2026-55200.patch \
            file://CVE-2026-55199.patch \
+           file://CVE-2026-66033.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

