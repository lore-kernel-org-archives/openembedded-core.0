Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACD2C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 14:30:53 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.223.1783693848936417333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 07:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NgjJvyK8;
 spf=pass (domain: est.tech, ip: 52.101.66.7, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnyhQ/rykimLco+i+wcBGByviv8PJkvimqwR3smxdxp7T4ZRc+Eu+PSZOPfRiy88m6t6lQLVLLb56aGp3IoOduwZFK9jfGCXfDwji7sxrWjYwp+dtSmIR/HJOV6JbjquUhz3u0NeAkV584OdSQ28eyA2aoeYJA3RnP3mkSeMoZ21lz9aht3Dn9wIvspPq3RhAd63/D/WVTkted4VISAFZrzGjSWSNLIakKtChlkGz3JrxtTFyzhxTi34Xe87eBfgRCyYjhTc0Zl28y1TTMwP85uwWIqAgpAEb9jLZNFNpfoQyofTBjrlTu7Ak3E9+w9i5rkvoJHBqseFaAitchI0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+vPWdmglHWhxzQVH4xYYzbQROQn5WLcS1SmzMkmVog=;
 b=K3/Dz4EspNBsA1H0/cnYGAGLi36oQPjhA+iXN1Vb6LI2b7hGvm7GKgbIae6T9wNPE5d1melPUDdzY1uAIpIlirFjyHg9+7yXB86QnuURdG7M3SpRGA89y/IC5LVbRqzhl7Uf5lwg6MaFEXXzRB/OcBv5XsjvGeW/7piCsS825nNuvGaE+FphxyKB6HMve/tL0h5vxCBZONrw6b3H4hD32tBTpudeJcnTwNmGurzNJMFzjE1ao0Q/wHfVWYwpWZJx8t32Hhj19d8bHrp8s8M17zwH0ACx6zIL6sSwibUc+os+QiXrbgLAS5Fl72zYbLojJJ9NmySpmEkZ/4t68qaJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+vPWdmglHWhxzQVH4xYYzbQROQn5WLcS1SmzMkmVog=;
 b=NgjJvyK8Q+by40nEppj5IBUoYsePsZAacQwVOj5txXbbURs/0c2J9blsmWUKmZXMiZIhIVQCcnnreSJPjnDnDRWrVBy2jEb+2Vc/IwO6qrelDavk+5vnP4ANT8JNZWCbFwFdhMxwiluswMUdEpcnRUSWsB0Q6rO5KgmhvJywe2vXWVV2/ZbY4z59ziukpGsCjfm8ZTLNWZMZjX35QJTYuTHJIaw3nHJb/wOLJuEl9TPUrX6YgF3kij+75UnMYglWqJcbIHdnvzuk/vhsBo8HBKdinNN5fdTCd1IBEB4Coc9iH2LHTLUuRM0XVJsxPX+mtrUzR17THoayTKAPvF+nQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by FRZP189MB2782.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:139::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 10 Jul
 2026 14:30:44 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0181.008; Fri, 10 Jul 2026
 14:30:44 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v3 1/1] expat: fix CVE-2026-41080
Date: Fri, 10 Jul 2026 16:30:23 +0200
Message-ID: <20260710143038.37898-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB8P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::14) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|FRZP189MB2782:EE_
X-MS-Office365-Filtering-Correlation-Id: 3817e1d8-f629-4959-f42d-08dede8fd34c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|13003099007|11063799006|6133799003|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: 
	CHOk6JKFv2Oh1EWBMSWDpThTS+wY9RsNQij+uvfVlLcNFoMtjew0rWxn/4kljgt7suwSSDN6aV2tsKK3sX68LBWwR/AsFMy5W4ilng1ax3+8AbweuSc5QvYGRm+v57gtoe4l3tA+e2JKIXQsAseH5t5C6lP7KewbAe5owL0JA6Sn2jD+Z70jaBmnexHfjsm2VanK7ocvoN6uDOCNHHFc3pPZYLpZQ2L7i/e6lbvSLoGWkZK4Mp7mYYjdLUlrsnn9JgjBl/sVbjhORkNeMYzs0ZhhfRq/s1QfmcOLKOavWyfgYKmyNf3igDCkc/k+qY/aGDplKXAYHPlX+TTGfnjHRZVqwWkeDAo8xwXDlEp+3OMxNlxz35NBr1bZbEgojlod1aP9SRwo5+nOyadrIG3l7bx7s5Z0iGaWiRKWt3xfsv7PfFJ0EZtT/Q4P2C6ExSxqD2a3trbOplh83EyFIWu2ptLsYS+FiBK0LOqRdLNBc3DhvAlFF6dypGj6CAMhJuroHQ0aAYfNzFkv0c/hLjeJmeQ+nYhYiyiWalVmO+eNe1+iQR4tnH+E1jPc8SDdz+bUQx8L1TfUMzqcFxMKLJCQK+aMgQPU7TeMdwSJj3bz1l1YYDP/Z2NHVbQwhurFuitQhOaatlQcLp1i27pETHaqSJr2ECEW+WIsg7e8urSPgYY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(13003099007)(11063799006)(6133799003)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?llvpo1ClbE3KOQpC5PEyq21v3ZzAHeIMyh3k0N4C9dDuHRBNv5VmdSfj/apJ?=
 =?us-ascii?Q?A5OAMNQBUgnopjd9KQAtYw4HUJ8cWimzKQlzXNQjQs35eBMlLUUbZcggdSS3?=
 =?us-ascii?Q?ionIv2z2n7JHuzO46XUHXgzqODll8QFh1Kd2rNK03bdrgOJVQUUfrbzUJS+s?=
 =?us-ascii?Q?QyhLGSFjnoUdoBbL0tNAd6Yp9FSMUx2SX326IhdcC2Wvda20G7SahMedfEgj?=
 =?us-ascii?Q?i0DNPRiBZsDch3xK7I44JZxw3nLqQsxwhDS1m9uXaAJLs1EmaafOITM7WCyy?=
 =?us-ascii?Q?UBA4Zc7RzkWzFsdYcx0uGF9e5psKqtr+FwmRA8161M9OcQCW7mTlKw+/mTVv?=
 =?us-ascii?Q?IJMk+1aJoANCO63v1LDAiGao6YJm3mPlIQSMQ0GcAVvICzo5ZJhk/73IwDwL?=
 =?us-ascii?Q?f6cyIOkfws06iDU1/s4iDD0H5f6p08qm6GbXt+pxmy9hjBjE3IZMKyRLcVch?=
 =?us-ascii?Q?v9ViWP3mR99ny4xtRxu/mNqMLSxxYFE1eJpNGacSK2J2xZZQrfqP7LrgVjHk?=
 =?us-ascii?Q?GUcFApzYkGKbQnbqcKvDxjVGvKywcFUGHlRjHIvSSGL42utKNDwQB35JSfM+?=
 =?us-ascii?Q?FRtil/PV3cSep4ciJkJyOXOk+nf5jsJnSyPUZlF58oMWCksqUuq8J84tyt3O?=
 =?us-ascii?Q?NvqLDsel5775/K+Xf7PQWv8iFaUX7ReHX2HC1OcEhgkJahhPIiz1F+sYBB1L?=
 =?us-ascii?Q?TsJhJjsazBOIHnh4sKlmcr96M6803n/cN6DIb7Vu7U3lJZvwl4ZJj/38qdlq?=
 =?us-ascii?Q?0feDOLaN21SY9Sklydx1CmM3GZif5yNUIyUpzFvrOWmV+kCJObdEuQtORKCx?=
 =?us-ascii?Q?/DQDUasX7pfvvp0P6+tfk/QTmHYKf3rGOYUnXUtuG4lEy8X7der3lmYnEW1v?=
 =?us-ascii?Q?KvVfYcBNmMdQuqnbKyAw2t2BnxPJoPVsVirSaJC6wLNfD33OD8xM8iXkZcty?=
 =?us-ascii?Q?TF9i37jut6KWkdYgOhiw9VLvOH6q8SOly/Otj2dxzeZg+ZxBOM7h4Nyops5s?=
 =?us-ascii?Q?HqazyRbHjMhMLbkXlSKn5o7Oim1nqmA/iq1aqRgCXntmax1Zw2me9aoDVR6A?=
 =?us-ascii?Q?FVKiNbzJ49cGEb6FVbgZRDq+CiCC5D/q54O1kzAEqHtAGskzlaovvAU0L7pn?=
 =?us-ascii?Q?xRIDUSDlpcmQVIXxPIQgUsOwEHqYn0K4hmmALqjsfclns8lb9PiQs9GVADUg?=
 =?us-ascii?Q?fJYZn/ulU0zArhTKC7aLVbHAb+m6gL1Lp6bumyYJQ69zAvIqMXu1WdETVDUm?=
 =?us-ascii?Q?mkzCHaoLnI67ImD4sFDCqN4B5qIkQrhsEyARQnb6jCYXcsgG0IhfJnZO8plc?=
 =?us-ascii?Q?woWHX/7N/2vBq91ELsOdPQ0nyDQvqLjCkxCCQsTtlTqcCZbp/mHXTadiADJc?=
 =?us-ascii?Q?f/G6aG0IJyV/FtSE6YwqcLKCTXgQALAPc3NPIg1/v0j25poSr6S0+XPEO+Jv?=
 =?us-ascii?Q?gh4l56a+Oh0vbrcpG2tIFZ5tmjUXvuhNr3bmOGocb3OhaReN9Gzd5YYmQtcQ?=
 =?us-ascii?Q?foYXwUS9164N5K+6xTIxzB2rHsP2KLfywFnr/r3x0SEAz9yWb3rYEF7/dfu6?=
 =?us-ascii?Q?qdc+iCWNdpo7K4FbW2skl6SMJI/RFdGiZ5kqJXzZL036NGmK8c/l/KK4hyR7?=
 =?us-ascii?Q?WkAJ9PxuhwCLwzfgHWu5HO1LmkTqRG3xgcmlzLeLls/+mopsmgrUz1N3VkfY?=
 =?us-ascii?Q?UVNR3mtRL+s6/QN+SdmxTp4E+u7iau9eEVy7S35qRQJWHX7Wl41dSdUqCgY8?=
 =?us-ascii?Q?dOosMs1xzg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3817e1d8-f629-4959-f42d-08dede8fd34c
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 14:30:44.0863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGOIeG/xvjAFYMTzusozJMv9/6T/5/H20Vclnp2XAwb9hjChrc6nbKYxKsBTAxP2Tl8rX2uzVvNzdHAmJMOr9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZP189MB2782
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 14:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240657

From: Amaury Couderc <amaury.couderc@est.tech>

The existing hash flooding protection (based on SipHash) only used 4 to 8
bytes of entropy for a salt, when 16 bytes of salt are supported by the
implementation of SipHash used by Expat. Now full 16 bytes of entropy are
used to improve protection against hash flooding attacks.

Introduces new API function XML_SetHashSalt16Bytes and deprecates the
legacy XML_SetHashSalt which is limited to 4-8 bytes.

CVE fix: migrates hash salt to 128-bit struct sipkey, extracts
16 bytes of entropy, removes dead get_hash_secret_salt function
(copy_salt_to_sipkey accesses the struct directly), adds
XML_SetHashSalt16Bytes API, deprecates XML_SetHashSalt, adds symbol
export, backport feature macro, tests, and documentation.

Note: the prerequisite commits that Peter Marko needed for scarthgap
(clang-tidy misc-no-recursion fix and WASI getpid removal) are already
present in expat 2.7.5, so they are not needed here.

Backport patch to fix CVE-2026-41080
https://nvd.nist.gov/vuln/detail/CVE-2026-41080

Upstream fix:
https://github.com/libexpat/libexpat/pull/1183

CVE: CVE-2026-41080

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
---
 .../expat/expat/CVE-2026-41080.patch          | 517 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |   1 +
 2 files changed, 518 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080.patch b/meta/reci=
pes-core/expat/expat/CVE-2026-41080.patch
new file mode 100644
index 0000000000..169fbb00f0
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-41080.patch
@@ -0,0 +1,517 @@
+From fa1ebd60bfcc6d32f329803e5e837251e2387ed1 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 30 Mar 2025 19:26:55 +0200
+Subject: [CVE-2026-41080] Improve protection against hash flooding
+
+The existing hash flooding protection in libexpat (based on SipHash)
+only used 4 to 8 bytes of entropy for a salt, when 16 bytes are
+supported by the SipHash implementation. This allows attackers to more
+feasibly guess the hash salt and craft inputs that cause hash
+collisions, leading to denial of service.
+
+Backport upstream changes that:
+- Migrate hash salt storage to larger struct sipkey (128-bit)
+- Drop unused parameter from generate_hash_secret_salt
+- Drop unneeded void * casts in generate_hash_secret_salt
+- Extract full 16 bytes of entropy for hash flooding protection
+- Introduce internal flag m_hash_secret_salt_set
+- Remove now-dead get_hash_secret_salt function (copy_salt_to_sipkey
+  accesses the struct directly)
+- Add XML_SetHashSalt16Bytes API function
+- Deprecate XML_SetHashSalt
+- Add symbol export in libexpat.map.in (LIBEXPAT_2.7.6)
+- Add backport feature macro XML_BACKPORT_SET_HASH_SALT_16_BYTES
+- Add test_hash_salt_setter unit test
+- Update documentation and Changes file
+
+Squashed backport of upstream PR #1183 commits 909201a8, bc193afc,
+08697a9b, f5eacefb, fa1ebd60, f76124e7, e3349d85, c8c5caf4,
+592d5fa3, 8ad3ef57, ec9fcd2e, and 8017e11e.
+
+CVE: CVE-2026-41080
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/1183]
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ Changes             |  17 ++++++
+ doc/reference.html  |  55 +++++++++++++++++--
+ lib/expat.h         |  15 ++++++
+ lib/internal.h      |   2 +
+ lib/libexpat.map.in |   5 ++
+ lib/xmlparse.c      | 124 +++++++++++++++++++++++++++++++++----------
+ tests/basic_tests.c |  25 +++++++++
+ 7 files changed, 212 insertions(+), 31 deletions(-)
+
+diff --git a/Changes b/Changes
+index 2b3704a6..1d8227ec 100644
+--- a/Changes
++++ b/Changes
+@@ -29,6 +29,23 @@
+ !! THANK YOU!                        Sebastian Pipping -- Berlin, 2026-03=
-17 !!
+ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!!!!!!
+=20
++Patches
++        Security fixes:
++       #47 #1183  CVE-2026-41080 -- The existing hash flooding protection
++                    (based on SipHash) only used 4 to 8 bytes of entropy =
for
++                    a salt, when 16 bytes of salt are supported by the
++                    implementation of SipHash used by Expat. Now full 16 =
bytes
++                    of entropy are used to improve protection against has=
h
++                    flooding attacks.
++                      Existing API function XML_SetHashSalt is now deprec=
ated
++                    because of its limitations, and its use should be
++                    considered a vulnerability. Please either use the new=
 API
++                    function XML_SetHashSalt16Bytes (with known-high-qual=
ity
++                    entropy input only!) instead, or leave the derivation=
 of
++                    a 16-bytes hash salt from high quality entropy to Exp=
at's
++                    internal machinery (by *not* calling either of the tw=
o
++                    XML_SetHashSalt* functions).
++
+ Release 2.7.5 Tue March 17 2026
+         Security fixes:
+            #1158  CVE-2026-32776 -- Fix NULL function pointer dereference=
 for
+diff --git a/doc/reference.html b/doc/reference.html
+index 5faa8d65..64b9fd67 100644
+--- a/doc/reference.html
++++ b/doc/reference.html
+@@ -404,7 +404,11 @@
+                 </li>
+=20
+                 <li>
+-                  <a href=3D"#XML_SetHashSalt">XML_SetHashSalt</a>
++                  <a href=3D"#XML_SetHashSalt">XML_SetHashSalt</a> (depre=
cated)
++                </li>
++
++                <li>
++                  <a href=3D"#XML_SetHashSalt16Bytes">XML_SetHashSalt16By=
tes</a>
+                 </li>
+=20
+                 <li>
+@@ -3449,22 +3453,35 @@ XML_SetParamEntityParsing(XML_Parser p,
+       </div>
+=20
+       <h4 id=3D"XML_SetHashSalt">
+-        XML_SetHashSalt
++        XML_SetHashSalt (deprecated)
+       </h4>
+=20
+       <pre class=3D"fcndec">
+ int XMLCALL
+-XML_SetHashSalt(XML_Parser p,
++XML_SetHashSalt(XML_Parser parser,
+                 unsigned long hash_salt);
+ </pre>
+       <div class=3D"fcndef">
+         Sets the hash salt to use for internal hash calculations. Helps i=
n preventing DoS
+         attacks based on predicting hash function behavior. In order to h=
ave an effect
+         this must be called before parsing has started. Returns 1 if succ=
essful, 0 when
+-        called after <code>XML_Parse</code> or <code>XML_ParseBuffer</cod=
e>.
++        called after <code>XML_Parse</code> or <code>XML_ParseBuffer</cod=
e> or when
++        <code>parser</code> is <code>NULL</code>.
++        <p>
++          <b>Note:</b> Function <code>XML_SetHashSalt</code> is
++          <strong>deprecated</strong>. Please use function <code><a href=
=3D
++          "#XML_SetHashSalt16Bytes">XML_SetHashSalt16Bytes</a></code> ins=
tead for better
++          security. <code>XML_SetHashSalt</code> only provides 4 to 8 byt=
es of entropy
++          (depending on the size of type <code>unsigned long</code>) whil=
e the SipHash
++          implementation used by Expat can leverage up to 16 bytes of ent=
ropy =E2=80=94 at least
++          twice as much. Function <code><a href=3D
++          "#XML_SetHashSalt16Bytes">XML_SetHashSalt16Bytes</a></code> of =
Expat &gt;=3D2.7.6
++          (and where backported) matches the amount of entropy supported =
by SipHash.
++        </p>
++
+         <p>
+           <b>Note:</b> This call is optional, as the parser will auto-gen=
erate a new
+-          random salt value if no value has been set at the start of pars=
ing.
++          random salt value internally if no value has been set by the st=
art of parsing.
+         </p>
+=20
+         <p>
+@@ -3475,6 +3492,34 @@ XML_SetHashSalt(XML_Parser p,
+         </p>
+       </div>
+=20
++      <h4 id=3D"XML_SetHashSalt16Bytes">
++        XML_SetHashSalt16Bytes
++      </h4>
++
++      <pre class=3D"fcndec">
++/* Added in Expat 2.7.6. */
++XML_Bool XMLCALL
++XML_SetHashSalt16Bytes(XML_Parser parser,
++                       const uint8_t entropy[16]);
++</pre>
++      <div class=3D"fcndef">
++        Sets the hash salt to use for internal hash calculations. Helps i=
n preventing DoS
++        attacks based on predicting hash function behavior. In order to h=
ave an effect
++        this must be called before parsing has started. Returns <code>XML=
_TRUE</code> if
++        successful, <code>XML_FALSE</code> when called after <code>XML_Pa=
rse</code> or
++        <code>XML_ParseBuffer</code> or when <code>parser</code> is <code=
>NULL</code>.
++        <p>
++          <b>Note:</b> Setting a salt that is <em>not</em> from a source =
of high quality
++          entropy (like <code>getentropy(3)</code>) will make the parser =
vulnerable to
++          hash flooding attacks.
++        </p>
++
++        <p>
++          <b>Note:</b> This call is optional, as the parser will auto-gen=
erate a new
++          random salt value internally if no value has been set by the st=
art of parsing.
++        </p>
++      </div>
++
+       <h4 id=3D"XML_UseForeignDTD">
+         XML_UseForeignDTD
+       </h4>
+diff --git a/lib/expat.h b/lib/expat.h
+index 18dbaebd..7693f62c 100644
+--- a/lib/expat.h
++++ b/lib/expat.h
+@@ -45,6 +45,7 @@
+ #ifndef Expat_INCLUDED
+ #  define Expat_INCLUDED 1
+=20
++#  include <stdint.h> // for uint8_t
+ #  include <stdlib.h>
+ #  include "expat_external.h"
+=20
+@@ -917,10 +918,25 @@ XML_SetParamEntityParsing(XML_Parser parser,
+    function behavior. This must be called before parsing is started.
+    Returns 1 if successful, 0 when called after parsing has started.
+    Note: If parser =3D=3D NULL, the function will do nothing and return 0=
.
++   DEPRECATED since Expat 2.7.6.
+ */
+ XMLPARSEAPI(int)
+ XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt);
+=20
++/* Sets the hash salt to use for internal hash calculations.
++   Helps in preventing DoS attacks based on predicting hash function beha=
vior.
++   This must be called before parsing is started.
++   Returns XML_TRUE if successful, XML_FALSE when called after parsing ha=
s
++   started or when parser is NULL.
++   Added in Expat 2.7.6.
++*/
++XMLPARSEAPI(XML_Bool)
++XML_SetHashSalt16Bytes(XML_Parser parser, const uint8_t entropy[16]);
++
++/* Backport feature macro: signals that XML_SetHashSalt16Bytes is availab=
le
++   even though XML_COMBINED_VERSION < 20800. */
++#  define XML_BACKPORT_SET_HASH_SALT_16_BYTES 1
++
+ /* If XML_Parse or XML_ParseBuffer have returned XML_STATUS_ERROR, then
+    XML_GetErrorCode returns information about the error.
+ */
+diff --git a/lib/internal.h b/lib/internal.h
+index 61266ebb..1995c17b 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -113,6 +113,7 @@
+ #if defined(_WIN32)                                                      =
      \
+     && (! defined(__USE_MINGW_ANSI_STDIO)                                =
      \
+         || (1 - __USE_MINGW_ANSI_STDIO - 1 =3D=3D 0))
++#  define EXPAT_FMT_LLX(midpart) "%" midpart "I64x"
+ #  define EXPAT_FMT_ULL(midpart) "%" midpart "I64u"
+ #  if defined(_WIN64) // Note: modifiers "td" and "zu" do not work for Mi=
nGW
+ #    define EXPAT_FMT_PTRDIFF_T(midpart) "%" midpart "I64d"
+@@ -122,6 +123,7 @@
+ #    define EXPAT_FMT_SIZE_T(midpart) "%" midpart "u"
+ #  endif
+ #else
++#  define EXPAT_FMT_LLX(midpart) "%" midpart "llx"
+ #  define EXPAT_FMT_ULL(midpart) "%" midpart "llu"
+ #  if ! defined(ULONG_MAX)
+ #    error Compiler did not define ULONG_MAX for us
+diff --git a/lib/libexpat.map.in b/lib/libexpat.map.in
+index 52e59ed3..8527eb54 100644
+--- a/lib/libexpat.map.in
++++ b/lib/libexpat.map.in
+@@ -117,3 +117,8 @@ LIBEXPAT_2.7.2 {
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerActivationThreshold;
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerMaximumAmplification;
+ } LIBEXPAT_2.6.0;
++
++LIBEXPAT_2.7.6 {
++ global:
++  XML_SetHashSalt16Bytes;
++} LIBEXPAT_2.7.2;
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 0248b665..75a7e5d0 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -604,7 +604,7 @@ static ELEMENT_TYPE *getElementType(XML_Parser parser,=
 const ENCODING *enc,
+=20
+ static XML_Char *copyString(const XML_Char *s, XML_Parser parser);
+=20
+-static unsigned long generate_hash_secret_salt(XML_Parser parser);
++static struct sipkey generate_hash_secret_salt(void);
+ static XML_Bool startParsing(XML_Parser parser);
+=20
+ static XML_Parser parserCreate(const XML_Char *encodingName,
+@@ -777,7 +777,8 @@ struct XML_ParserStruct {
+   XML_Bool m_useForeignDTD;
+   enum XML_ParamEntityParsing m_paramEntityParsing;
+ #endif
+-  unsigned long m_hash_secret_salt;
++  struct sipkey m_hash_secret_salt_128;
++  XML_Bool m_hash_secret_salt_set;
+ #if XML_GE =3D=3D 1
+   ACCOUNTING m_accounting;
+   MALLOC_TRACKER m_alloc_tracker;
+@@ -1192,69 +1193,65 @@ gather_time_entropy(void) {
+=20
+ #endif /* ! defined(HAVE_ARC4RANDOM_BUF) && ! defined(HAVE_ARC4RANDOM) */
+=20
+-static unsigned long
+-ENTROPY_DEBUG(const char *label, unsigned long entropy) {
++static struct sipkey
++ENTROPY_DEBUG(const char *label, struct sipkey entropy_128) {
+   if (getDebugLevel("EXPAT_ENTROPY_DEBUG", 0) >=3D 1u) {
+-    fprintf(stderr, "expat: Entropy: %s --> 0x%0*lx (%lu bytes)\n", label=
,
+-            (int)sizeof(entropy) * 2, entropy, (unsigned long)sizeof(entr=
opy));
++    fprintf(stderr,
++            "expat: Entropy: %s --> [0x" EXPAT_FMT_LLX(
++                "016") ", 0x" EXPAT_FMT_LLX("016") "] (16 bytes)\n",
++            label, (unsigned long long)entropy_128.k[0],
++            (unsigned long long)entropy_128.k[1]);
+   }
+-  return entropy;
++  return entropy_128;
+ }
+=20
+-static unsigned long
+-generate_hash_secret_salt(XML_Parser parser) {
+-  unsigned long entropy;
+-  (void)parser;
++static struct sipkey
++generate_hash_secret_salt(void) {
++  struct sipkey entropy;
+=20
+   /* "Failproof" high quality providers: */
+ #if defined(HAVE_ARC4RANDOM_BUF)
+   arc4random_buf(&entropy, sizeof(entropy));
+   return ENTROPY_DEBUG("arc4random_buf", entropy);
+ #elif defined(HAVE_ARC4RANDOM)
+-  writeRandomBytes_arc4random((void *)&entropy, sizeof(entropy));
++  writeRandomBytes_arc4random(&entropy, sizeof(entropy));
+   return ENTROPY_DEBUG("arc4random", entropy);
+ #else
+   /* Try high quality providers first .. */
+ #  ifdef _WIN32
+-  if (writeRandomBytes_rand_s((void *)&entropy, sizeof(entropy))) {
++  if (writeRandomBytes_rand_s(&entropy, sizeof(entropy))) {
+     return ENTROPY_DEBUG("rand_s", entropy);
+   }
+ #  elif defined(HAVE_GETRANDOM) || defined(HAVE_SYSCALL_GETRANDOM)
+-  if (writeRandomBytes_getrandom_nonblock((void *)&entropy, sizeof(entrop=
y))) {
++  if (writeRandomBytes_getrandom_nonblock(&entropy, sizeof(entropy))) {
+     return ENTROPY_DEBUG("getrandom", entropy);
+   }
+ #  endif
+ #  if ! defined(_WIN32) && defined(XML_DEV_URANDOM)
+-  if (writeRandomBytes_dev_urandom((void *)&entropy, sizeof(entropy))) {
++  if (writeRandomBytes_dev_urandom(&entropy, sizeof(entropy))) {
+     return ENTROPY_DEBUG("/dev/urandom", entropy);
+   }
+ #  endif /* ! defined(_WIN32) && defined(XML_DEV_URANDOM) */
+   /* .. and self-made low quality for backup: */
+=20
+-  entropy =3D gather_time_entropy();
++  entropy.k[0] =3D 0;
++  entropy.k[1] =3D gather_time_entropy();
+ #  if ! defined(__wasi__)
+   /* Process ID is 0 bits entropy if attacker has local access */
+-  entropy ^=3D getpid();
++  entropy.k[1] ^=3D getpid();
+ #  endif
+=20
+   /* Factors are 2^31-1 and 2^61-1 (Mersenne primes M31 and M61) */
+   if (sizeof(unsigned long) =3D=3D 4) {
+-    return ENTROPY_DEBUG("fallback(4)", entropy * 2147483647);
++    entropy.k[1] *=3D 2147483647;
++    return ENTROPY_DEBUG("fallback(4)", entropy);
+   } else {
+-    return ENTROPY_DEBUG("fallback(8)",
+-                         entropy * (unsigned long)2305843009213693951ULL)=
;
++    entropy.k[1] *=3D 2305843009213693951ULL;
++    return ENTROPY_DEBUG("fallback(8)", entropy);
+   }
+ #endif
+ }
+=20
+-static unsigned long
+-get_hash_secret_salt(XML_Parser parser) {
+-  const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
+-  assert(! rootParser->m_parentParser);
+-
+-  return rootParser->m_hash_secret_salt;
+-}
+-
+ static enum XML_Error
+ callProcessor(XML_Parser parser, const char *start, const char *end,
+               const char **endPtr) {
+@@ -1323,8 +1320,10 @@ callProcessor(XML_Parser parser, const char *start,=
 const char *end,
+ static XML_Bool /* only valid for root parser */
+ startParsing(XML_Parser parser) {
+   /* hash functions must be initialized before setContext() is called */
+-  if (parser->m_hash_secret_salt =3D=3D 0)
+-    parser->m_hash_secret_salt =3D generate_hash_secret_salt(parser);
++  if (parser->m_hash_secret_salt_set !=3D XML_TRUE) {
++    parser->m_hash_secret_salt_128 =3D generate_hash_secret_salt();
++    parser->m_hash_secret_salt_set =3D XML_TRUE;
++  }
+   if (parser->m_ns) {
+     /* implicit context only set for root parser, since child
+        parsers (i.e. external entity parsers) will inherit it
+@@ -1612,7 +1611,9 @@ parserInit(XML_Parser parser, const XML_Char *encodi=
ngName) {
+   parser->m_useForeignDTD =3D XML_FALSE;
+   parser->m_paramEntityParsing =3D XML_PARAM_ENTITY_PARSING_NEVER;
+ #endif
+-  parser->m_hash_secret_salt =3D 0;
++  parser->m_hash_secret_salt_128.k[0] =3D 0;
++  parser->m_hash_secret_salt_128.k[1] =3D 0;
++  parser->m_hash_secret_salt_set =3D XML_FALSE;
+=20
+ #if XML_GE =3D=3D 1
+   memset(&parser->m_accounting, 0, sizeof(ACCOUNTING));
+@@ -1779,7 +1780,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser,=
 const XML_Char *context,
+      from hash tables associated with either parser without us having
+      to worry which hash secrets each table has.
+   */
+-  unsigned long oldhash_secret_salt;
++  struct sipkey oldhash_secret_salt_128;
++  XML_Bool oldhash_secret_salt_set;
+   XML_Bool oldReparseDeferralEnabled;
+=20
+   /* Validate the oldParser parameter before we pull everything out of it=
 */
+@@ -1825,7 +1827,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser,=
 const XML_Char *context,
+      from hash tables associated with either parser without us having
+      to worry which hash secrets each table has.
+   */
+-  oldhash_secret_salt =3D parser->m_hash_secret_salt;
++  oldhash_secret_salt_128 =3D parser->m_hash_secret_salt_128;
++  oldhash_secret_salt_set =3D parser->m_hash_secret_salt_set;
+   oldReparseDeferralEnabled =3D parser->m_reparseDeferralEnabled;
+=20
+ #ifdef XML_DTD
+@@ -1880,7 +1883,8 @@ XML_ExternalEntityParserCreate(XML_Parser oldParser,=
 const XML_Char *context,
+     parser->m_externalEntityRefHandlerArg =3D oldExternalEntityRefHandler=
Arg;
+   parser->m_defaultExpandInternalEntities =3D oldDefaultExpandInternalEnt=
ities;
+   parser->m_ns_triplets =3D oldns_triplets;
+-  parser->m_hash_secret_salt =3D oldhash_secret_salt;
++  parser->m_hash_secret_salt_128 =3D oldhash_secret_salt_128;
++  parser->m_hash_secret_salt_set =3D oldhash_secret_salt_set;
+   parser->m_reparseDeferralEnabled =3D oldReparseDeferralEnabled;
+   parser->m_parentParser =3D oldParser;
+ #ifdef XML_DTD
+@@ -2327,6 +2331,7 @@ XML_SetParamEntityParsing(XML_Parser parser,
+ #endif
+ }
+=20
++// DEPRECATED since Expat 2.7.6.
+ int XMLCALL
+ XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt) {
+   if (parser =3D=3D NULL)
+@@ -2337,10 +2342,46 @@ XML_SetHashSalt(XML_Parser parser, unsigned long h=
ash_salt) {
+   /* block after XML_Parse()/XML_ParseBuffer() has been called */
+   if (parserBusy(rootParser))
+     return 0;
+-  rootParser->m_hash_secret_salt =3D hash_salt;
++
++  rootParser->m_hash_secret_salt_128.k[0] =3D 0;
++  rootParser->m_hash_secret_salt_128.k[1] =3D hash_salt;
++
++  if (hash_salt !=3D 0) { // to remain backwards compatible
++    rootParser->m_hash_secret_salt_set =3D XML_TRUE;
++
++    if (sizeof(unsigned long) =3D=3D 4)
++      ENTROPY_DEBUG("explicit(4)", rootParser->m_hash_secret_salt_128);
++    else
++      ENTROPY_DEBUG("explicit(8)", rootParser->m_hash_secret_salt_128);
++  }
++
+   return 1;
+ }
+=20
++XML_Bool XMLCALL
++XML_SetHashSalt16Bytes(XML_Parser parser, const uint8_t entropy[16]) {
++  if (parser =3D=3D NULL)
++    return XML_FALSE;
++
++  if (entropy =3D=3D NULL)
++    return XML_FALSE;
++
++  const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
++  assert(! rootParser->m_parentParser);
++
++  /* block after XML_Parse()/XML_ParseBuffer() has been called */
++  if (parserBusy(rootParser))
++    return XML_FALSE;
++
++  sip_tokey(&(rootParser->m_hash_secret_salt_128), entropy);
++
++  rootParser->m_hash_secret_salt_set =3D XML_TRUE;
++
++  ENTROPY_DEBUG("explicit(16)", rootParser->m_hash_secret_salt_128);
++
++  return XML_TRUE;
++}
++
+ enum XML_Status XMLCALL
+ XML_Parse(XML_Parser parser, const char *s, int len, int isFinal) {
+   if ((parser =3D=3D NULL) || (len < 0) || ((s =3D=3D NULL) && (len !=3D =
0))) {
+@@ -7842,8 +7883,10 @@ keylen(KEY s) {
+=20
+ static void
+ copy_salt_to_sipkey(XML_Parser parser, struct sipkey *key) {
+-  key->k[0] =3D 0;
+-  key->k[1] =3D get_hash_secret_salt(parser);
++  const XML_Parser rootParser =3D getRootParserOf(parser, NULL);
++  assert(! rootParser->m_parentParser);
++
++  *key =3D rootParser->m_hash_secret_salt_128;
+ }
+=20
+ static unsigned long FASTCALL
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 02d1d5fd..26662fee 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -204,6 +204,30 @@ START_TEST(test_hash_collision) {
+ END_TEST
+ #undef COLLIDING_HASH_SALT
+=20
++START_TEST(test_hash_salt_setter) {
++  const uint8_t entropy[16] =3D {'0', '1', '2', '3', '4', '5', '6', '7',
++                               '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
++  XML_Parser parser =3D XML_ParserCreate(NULL);
++
++  // NULL parser should be rejected
++  assert_true(XML_SetHashSalt16Bytes(NULL, entropy) =3D=3D XML_FALSE);
++
++  // NULL entropy should be rejected
++  assert_true(XML_SetHashSalt16Bytes(parser, NULL) =3D=3D XML_FALSE);
++
++  // Setting should be allowed more than once
++  assert_true(XML_SetHashSalt16Bytes(parser, entropy) =3D=3D XML_TRUE);
++  assert_true(XML_SetHashSalt16Bytes(parser, entropy) =3D=3D XML_TRUE);
++
++  // But not after parsing has started
++  assert_true(XML_Parse(parser, "", 0, XML_FALSE /* isFinal */)
++              =3D=3D XML_STATUS_OK);
++  assert_true(XML_SetHashSalt16Bytes(parser, entropy) =3D=3D XML_FALSE);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ /* Regression test for SF bug #491986. */
+ START_TEST(test_danish_latin1) {
+   const char *text =3D "<?xml version=3D'1.0' encoding=3D'iso-8859-1'?>\n=
"
+@@ -6292,6 +6316,7 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_bom_utf16_le);
+   tcase_add_test(tc_basic, test_nobom_utf16_le);
+   tcase_add_test(tc_basic, test_hash_collision);
++  tcase_add_test(tc_basic, test_hash_salt_setter);
+   tcase_add_test(tc_basic, test_illegal_utf8);
+   tcase_add_test(tc_basic, test_utf8_auto_align);
+   tcase_add_test(tc_basic, test_utf16);
+--=20
+2.34.1
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/exp=
at/expat_2.7.5.bb
index 4f2578292d..ef736c1e5b 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -10,6 +10,7 @@ VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.=
bz2  \
            file://run-ptest \
+           file://CVE-2026-41080.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
--=20
2.34.1


