Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C6DC55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 13:10:15 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15913.1785849012597623368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 06:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cBzwfYU5;
 spf=pass (domain: est.tech, ip: 52.101.65.11, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMF4JGckv5JvQfn70H0CjD9v2qDj+Id6wksk8rA6ccGmUDWKIC2zzquaQUNFpgXrKU+8+UVtaOmRiWGpbaEF5tajGYrzjXanLfo43yqdifykq5kO45W0/kg01SHMSPwZ9AoxtVEcXCx9+d6MjLQOTnOSQIh+WO5Dg/ApRTfitEtjLkccwOLZiqQ9vN2+syjzuaMNHjRcteLzU/v0LkgcMAtU7gEXGOZ0C06LjiDp4h4tboVQ72JmDNBB26MRg3Owi7FLbWbo4/F2Zz3jqR9pn5PIJdR7cEqzfwsy3S3XtwgOSZy4uNc4V0N/oxrGmGdk9Ai6gv75u2AyWRxGyiYrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3Uta/l5YPdYGRtGOsFOchgE39jGV0QqrexgZ8fF5wg=;
 b=bsSv/mlsC4KvJSsxtSmdX6sFCRYLtGj/V0nDIIvETK0U82OAsRe8vrOSrXz/XK0X8k3sVj46RVYceFF/kSHO1uduU8J3iWtU/G8Ky2OT28zxJchxaceC1Bn9yQZDEc6Sd2JSbW+p4/mzftl7dKmxz2hHOeQqeu29Rvt+iSXdjIJJrnMpO7TwtC8n5QR3AhxvxApzSZFiQdNOJ5Ndc7jVFWQ1/SoaB5+PGRQbZtbJ0nuMvAckO9AXg7g51FH9TbQCb+sWTJfHMDoYmezJ7f20Jqj6fZdxtajYjH8iZshOcn8+yIBQEiBkv7nNuamr9mkrnIjooGOrYbHGToYt5jRYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3Uta/l5YPdYGRtGOsFOchgE39jGV0QqrexgZ8fF5wg=;
 b=cBzwfYU5NUAv093tDEkEIpwjtagw7/EIBmj35+FVi7TBQsW+Sz7dMKWGxTMVxCKZn1IpLUr0vUfXbb9E/VQVYLDScI8c4evll+dr++oEl/PhIOJpA2CGZrWwYIinLJioMwmfx7iwZ7Aeh6t/ZdYrL3TuUnJwSWJPpxPIiqHqfgAopDbv2mDa9oPvIB1+OtnR1RR+nldLuwCBH6rYq+rx2TPZtwBuVO6rnfxvwPW00p3UgYgBGc+21t5/JMgeF5hs0tg5GWWnZN9mC2WPXRR2oliHOWQOt83V460TELeweXiO/8Cy3jV78BmZkGPugFZIhZSEApImrO2uPx+Jc2Llug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7PPFB2DB17625.EURP189.PROD.OUTLOOK.COM (2603:10a6:20f:fff1::6a3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 13:10:10 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 13:10:10 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 2/4] libssh2: fix CVE-2026-66033
Date: Tue,  4 Aug 2026 15:09:44 +0200
Message-ID: <20260804130946.3539-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260804130946.3539-1-jaipaul.cheernam@est.tech>
References: <20260804122255.3053-1-jaipaul.cheernam@est.tech>
 <20260804130946.3539-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::11) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7PPFB2DB17625:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6d76c0-b6f0-47cf-5965-08def229b63f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|12006099003|22082099003|18002099003|4143699003|11063799006|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	3cXdpaw7ddlKPWrtmXNohZckYooMcIdU5TydC9q5TnuHSMF7/sdbOoEZt74shscn+FypyEjjvs91eLcKyXEYiw1vIHf9lbcgX6T4RUrXIwqmyxhlrEr3GJifOuE+Q4zrzXnAIo9ClWlSA+Uhxmwq1ruSMmn8h5ZWDwQ9d4bgC9OxL+uUb6CQ060aPFCTJBYkc6pzfMssx9ZedGh7tbF6Dae0AleuzXrVGnGBSUp2MJHg+gJtemCzyxjg9wfTO6K9MyLw83wlYBxyeMJ0NinxeeFnUSxIT61rHDYPx5NyOu5k4DlYlgDCR0OCE2YU5mQpiYzRuo85jnkw62Ku0BpsoBKQXcqpYzm6aDGlR/m+WF/YhgH+7DDSU2cPcebOdS1a7616JqlSbZiOJsCTKDBGHgFyZ/OfUulJqsqmregQ5vE7N9rOzdnp5R1nSujz6MDtJmpT7vLwSGueYOFs8UTXZO5ZOBamqW8346NvlNOgwut9kB3h5MZzN1RYyVXUGrmWIwOmeDGMcDe6OFBtFcR/KBmVHU4rwydxvVcjzUZfubIfmm8hr6sAIgVqywn0rvldh8rgcVl/ru6T6XynOaKM2g9pVPh0/H9/cfTfKO6qHY2IPGA7bWATSaHcX0EMmznT9ABf7c1b9PlQ6QfPXmqCee1rSg+riDk1nvGqVU+FA+c=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(12006099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XyOMavvn3OXTDg6A0wXo4dtP/few2GJOxScs+wlV29bro0eAnJVGnBifLrHk?=
 =?us-ascii?Q?B0EQrQlHbcQS7J7mDdDWZ0RpwbE1pgNHfbGl4YVv2b9b9odRsurq8SFKye0i?=
 =?us-ascii?Q?EHxUm/6dJeEmDkg5wpFULQKd2gNeZx/p2SP5DhePU+/8iVmpT5YW9XREnLtI?=
 =?us-ascii?Q?mOkps77Q7TZdiqwD1+V+3nLmb761whBvGPk+0eC3+idVRbSdSlXg7ZkIA7u1?=
 =?us-ascii?Q?Yapm5gQu+ubCLN0IVDmhQMCRimsJGsDcugWQBF93Y59/dA3NdVIEQRRWBu5K?=
 =?us-ascii?Q?59HeDYx3ke5TW3mQ+oKrzekmurC42EpcuOhXWT3E+MBO8gGR+X+it+fGrjCc?=
 =?us-ascii?Q?/WhhldOpy7vjkdO7PRn3I2VdOtgzSnglQ7VKxtDxzzg0qs29nNQgQEL40l5n?=
 =?us-ascii?Q?/ihFsATJSzd+kyly7+aWP3E5CzxSo3at7JzxlVdJyF1WfVBMfnHF46YFN9Py?=
 =?us-ascii?Q?7qR6kGMD5Zlf7o0K2fufnrW7Sf7P6vic+OkvAqaAdFb1ym7q2KqIEbT8qmAA?=
 =?us-ascii?Q?SUjy088iSfT25MHkyrqJX3ZSIHIzzvWchjkP1QgKR5UrRgrpNyMwE5rUsSr7?=
 =?us-ascii?Q?nFq6uDt2TcT5qF9cgGhziMpCsJyEb0UTRN3VLM8gBZKPF4tD3WG508Rtxiit?=
 =?us-ascii?Q?RiHUZw0UpvnD0UHU0/Dd74a6tB7Cm3boiQky61Y5Sqw7lYmVcXOgq7UGq1rg?=
 =?us-ascii?Q?aZjpcCj26JaeWTD/ncWGFmTKG4GlDZ0W1L6hMprrV/8pyeqp3POeEb22suwf?=
 =?us-ascii?Q?NZDVAXqZfjecixZ0XQiMNDTV5blQ7KUEw3e/299mWQcuQL5YZViMH/twmFYt?=
 =?us-ascii?Q?HbdeuFNSKEUia7AT65gUdtvle3/vppydoK/IZln45LTIPtUsiQZ9yIXroQBH?=
 =?us-ascii?Q?Z4oYJddRnM7fdMZiKh+XmCVPVym78KdG9GgpWYOZbB1HmWi4B1tEEodtKqWr?=
 =?us-ascii?Q?oK7BGb9SvgdX3fv4O66AhHaAgvhstbFZV0rlWxx+JLVMmq2Ob4yrG/bcADSy?=
 =?us-ascii?Q?X2wDNQp+CR0p+0/b4XJ2txo4QtDj4KhCGcXflynUtqJucL62IAXcBp28OiA5?=
 =?us-ascii?Q?vEFXHfUmAU1QKJ2wfeoRqHx4k6EWqEsrbRx7BaC7+ZdilLR9nrSPfTZZqOfv?=
 =?us-ascii?Q?U/iG1/Pmcj/TqrZsyNnzZoqM+W7/rkGUAD4hYEiV80nTxtkUeMjzZyimntpv?=
 =?us-ascii?Q?SFveB0hUmd8WliOgk7AdXQ7S5/aCR/02n4UKvqeTW32Rv5CORtCPG1zZv0K6?=
 =?us-ascii?Q?EgnLrNQ/cQyrMHIinufBEk7hP5INsS9Ftv5SCvhO6FoT1DYuidW0vtdatdY0?=
 =?us-ascii?Q?aNCtY3h3N352w/ekuO6ngQZUUpQWKeSI4z7OMld3KeSrGz3djUfZr22ziTRm?=
 =?us-ascii?Q?x+aFVcpAwgshOpcZJCe/dqvz95rqevjGvQtL4qt+Z4+MWBy203esKnybnX+Z?=
 =?us-ascii?Q?a7VlSX5jIe5Mkov5wOs2fz5ENnbVuMQqjRxJX4YMUlVfealqPw7THlPWWUmX?=
 =?us-ascii?Q?AgQExOL5vby338vPZvi5p2K9mzf73Dz1732YN8sPyaaExnczXnI+20IP5adk?=
 =?us-ascii?Q?YJFYF86d99ke9A0KZMfEIwSzhJ6YzkR6xVivdG/jJuiFeC2eJK+88lGW9TK2?=
 =?us-ascii?Q?1GeYqUmdafnzF/EBwEbxtT6Hid8Qqs8YykJxnEt35Nbhcfv1N9m/ynZabfoI?=
 =?us-ascii?Q?7Jrwcf+EBuy+LeiptMDHY+1x60Q5rBe5IVooyx30pCvusPQqX0ihNrLwxeDA?=
 =?us-ascii?Q?mkCHwAizLWOH7f+BJn+p9MQxrmATjZk=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6d76c0-b6f0-47cf-5965-08def229b63f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 13:10:09.9811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpx51ig+17TyXwGQ4SeECN0kTvYUOwLms+eehqg0fj0+WHnprtZmla/FF1n2RBXpoGcs0+OBKqeAsyzT+C56A/eMgc3nLZmFJ3zGyGAgzHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PPFB2DB17625
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 13:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242755

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
index 32cb3898dd..a87c013017 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.gz=
 \
            file://CVE-2026-55200.patch \
            file://CVE-2026-55199.patch \
            file://CVE-2026-66032.patch \
+           file://CVE-2026-66033.patch \
            "
=20
 SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b=
0f109cabf658f7"

