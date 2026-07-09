Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F375CC43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 14:07:17 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10222.1783606028317320295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 07:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=RbZyWCnx;
 spf=pass (domain: est.tech, ip: 40.107.162.5, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcz5DubM+4ZBZgCx96KA0758o/Hf1Yv4Td+uvO4WSM8BSe1CJ9JBymiYRSd/GuNkgzbowNI0lQNFFp+grLPQxx4nzXl2PjjUQGX1g6Q7YaIs3eqLh6wVAtcqW1t3GtOSo6JdFTE9wCONGsGFuKKEli2b01IP9aWjUUxNVCOo/lCcQbtyABzLo47V+bQSCMmAAKs1EiTvb5hdqVfgPgRIJT2W7d0hTAvMvQfifPfdP3MeF72IT1tKDBT+nLtMGZNOt9KNriET/WB20UNna8LW+/3kf7HeRvA4p9Vqlte72Q7DNE13GgelEN5JubF5Pe6ZzykFZv8qCqzL5JkdxpEc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rBIo/nWDtdNU2teVkFOMhJEq3VkT3o9V9jurwwI1Oas=;
 b=xVKvIR625THgKILVPdHfUqX0jG0wslfljs5zsEyKi7QWvnxGs8QPmmT1ZeCfpXjqJkiMaLTC0+otGhC+JxqxwuB0BYDr4QYASTN4cppaB8j4BgdWqFz2PzhT09y2RSirwoMP/02Ol0AOLBtY/5QXv1QSe25vfxuGDraG/vLKFXu5J8m7Pl3o777Q9rIrtPCkY7nesyNZDNmiE0qOInQ3gAohu9x48muCtzSXIb46C/Jo4N+LaGnqgQZl7pv76jqo+yoKQ2q29GzrQwycrmaxLmaz+4ilJDQ1SihIf+p1ZnPD+s2oCt/jQMS3v/SaWdITTqEXtSwcd1GDjmQWSXohzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBIo/nWDtdNU2teVkFOMhJEq3VkT3o9V9jurwwI1Oas=;
 b=RbZyWCnxFiN11CgpiAKl22CXPKX+6M7ajy0JsFMnnSqXwjYfFM3rIdd4Ss0NrKlB7PCqQJZT9+rE/BN5O6IcE3Bs9s17dCckA2bpsbwKpa5Hugptj0v0xdoHmZ6U9zk5B9sTIQTbM2kw316KITAf18BJY6XIIpWS2WZEx79CPrtcHL0UjsDpWmluznwmudNj1flF5vn6SXst/ICXD5WyBzD2Eu2LRlFZGm2Ot00Zvxn02ErtBJbMNSf2//xDXj16tBf57uNPw2Y7VSvigcISOzcMW4VYPC+Oi3TTxo04V2uM7S3MP0ovmAv+VgFVUkX/quBQap0D46XBJEov410RuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by PR3P189MB0923.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Thu, 9 Jul
 2026 14:07:03 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0181.008; Thu, 9 Jul 2026
 14:07:03 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] [wrynose] expat: fix CVE-2026-41080
Date: Thu,  9 Jul 2026 16:06:35 +0200
Message-ID: <20260709140651.48230-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0261.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::26) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|PR3P189MB0923:EE_
X-MS-Office365-Filtering-Correlation-Id: 293caf7e-2b36-431d-6f1c-08deddc35a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|13003099007|5023799004|18002099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	s36N813r7YVLBI/KB+w+tnHzhVvkd+I1JDeDXOW8vBL1MKLRicgqezGy4xOAiAQjUzkJZhQXnIpqnVeZSq4tFQQw1VbGH7L/H3Dnuna4M3eIacfDbM4GpXCc/FlNYxUpMAzLp90DdVxKXsi6Jo18Tg3+OdHivkNf35SKoPZQGKPVzSvLu3rvtqGW6g6oOoSgG7rOdUseD9W7nEpXYGdqn67ejLf+GISOL/I82CckKGGxS6TVxZAr5PLZabP2Qw0YgxzFiBqd/sPMSpUMhKdCzuxFSvXAPKLaYj+HBIj6Rjy48S0gg+loKRTwfkQPfGKjkSqE8BkwXkGPXayLgyfexmfr/uOMQU9JlixbhsEnrNa4Tw1JWuw8aRPplsi565lE+Rji5qOi9iGuYKF51h8FHn1cbMchzC+qKzlWyaUFTjQ4mSQ3JxgWmteoHn4tgiepaN2voxyQZGBBHUf6cznIlI9nJJSry6eBiowgbYgh388bQKVqjmi3nlYC3CrMMLzEND7+oesF1zEV34gvWkfBoznhd2i3Ngn1uo4Rl+HubrLZZGy8VDlyyXLS+799azI6xdJmO7JIARc/hezV7k99K5v2wOx6eCOZJFDJwPfcO49z5ZUWJdKCAPMJrWjcSetXT+r0Jrcu+9HnBOqNytB/7DfV0dkiJicvWpqNHgj3jGw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(13003099007)(5023799004)(18002099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pT1BQDppyu7StNIFM6COVBfG7jndfWXTuzvQH08qZ6mArAWQ0WJXr+8YkOVq?=
 =?us-ascii?Q?SgwPSuSLonMNvEajc77t8rO1FcFwrzY1Auj1eEBHHGgX3TLzltSUeRWrnOX9?=
 =?us-ascii?Q?JgP1iBncz6OHXdJQoZXpm8fKUnpRlmxuE1AbelZht6grTcLJd4O1vUpoTZ9I?=
 =?us-ascii?Q?/p//VtCMT6SUybw10yAW7vIhHUSGKAPbw0qJgCd62t3SuLBgnXbwO0k26NY6?=
 =?us-ascii?Q?VuidUN4pwIfo5fhGxyEDgaCuCLAMlIqUNYfvf3btUto5t9BuRr0FPYTKEWe0?=
 =?us-ascii?Q?xh4ifU7Hjb909oBRcO2v54N0KV0evFjIb07tZNngq/3K+FRbx7F6o4aRbcEf?=
 =?us-ascii?Q?L5ce/AGvfOp8hQh85Dm/FNnwDuUtSqybvs6RbzQ/0cNggOEJ1n3EoQK99lfG?=
 =?us-ascii?Q?WP/G0jW1Me1siOrM6lXJopkfQ4H/wDDXGAayw42Ryr03It02Fi8Vsg0Oc2pE?=
 =?us-ascii?Q?OF4uiWfoKIP2GXbXUCqCMxyQsuQiZwL0iVPxbVoaxEHJclP2a1rQf2mVFSOl?=
 =?us-ascii?Q?/qu5rlodVYJekhNhUp2t0I/YHiB6Rpkj+o+aDRRS63lTcC08ZPo5q+i6+7X6?=
 =?us-ascii?Q?YD6/Fmlkt42zK7X3f2Wt+X2Cwi1QONx28fH9/W0BWuAlTClNlV5HMCfHDvtC?=
 =?us-ascii?Q?PB6HXG9Qnb+nw9tivNMbyBa468APn6nlMHSik0uStGj5hRIBaRklTyJF/YpM?=
 =?us-ascii?Q?mY+8pXrUl4V68D+t6owPYdqXzdkdS5VXdNp+HxE6gZUGYf0ww/QL9KPA2lJm?=
 =?us-ascii?Q?zrxODuMLomdhZ4ltFD+O0OrisMqCwBH6V3wrE8fRM6jyvKLf/+kYnaqrPoMt?=
 =?us-ascii?Q?CoBYDsF9/kVbQX+W5+arSlObmxLjGczAPOXjShGzOXECVoHPfXQPLHnFOM3v?=
 =?us-ascii?Q?+xrTmr20MrJ/Tn+nODQcQO9exohQaJzPW/xnT8kHZVcm3jtGhYlTTP583X+k?=
 =?us-ascii?Q?9TqK2zFU8oOHu/6DBGdB9dqJQl3RPO1XL6pZIAvgYcj8RpvXtRu9TCH/CgMd?=
 =?us-ascii?Q?VZK2CNpg0WRqJqekmOJjmalp4BqfVvzeOTBBXMjxZpTQZcBuAbKicB6/v60G?=
 =?us-ascii?Q?bHEraiZcfR/9nTMqeRV0jtFetAmwSN0mNlps8s/iMA9wlyJNL4s+DsnYT1QF?=
 =?us-ascii?Q?XoChszWh5SyRBKFeSfotbgnUw2vJMFj6SpOt1kKghqJC3TJcDcOFu8z/AJW+?=
 =?us-ascii?Q?dYrMjSCzMAR4xNgM5MF9FrxglQuF2PDSkylPZIwhBfxET+kceSl0ZvwZRbcT?=
 =?us-ascii?Q?XaCSo1z0F1ZNLHBrYkxb1FwpL0aPTFqbcDb8W7uLs7cZhlCe39RfUWMgouP9?=
 =?us-ascii?Q?nNdWfXfu4F9CeBhIxHtyWBj4mfWyTI1g7j/zzfllKU3jJFLrz61PC0l/kZ3S?=
 =?us-ascii?Q?zevOokedfSTfYbxfskq8BSo2YRNIItqh/J0I08hBVLKcFZZVDHK2EUuZ6m9g?=
 =?us-ascii?Q?EwC7CV6Iy9GAU9qGIiY7NzkrH8asf7dR8XlKos7U6/hBLsQrqJLtgkSZFl+8?=
 =?us-ascii?Q?rR+MttZgWn4rhR8UBMrxv5swvYV/6hIVzQoCBOdqnfsmqIH7/jwvgwrsjAfi?=
 =?us-ascii?Q?j1WUTjkmPxcAAieGQnFOIECe3UUN3OAdFHxdTF/Ut0cjhgAMNIVeb+2l2FmI?=
 =?us-ascii?Q?JHKFJJPpsdD0MxhICsFrgl9AP2fOLTAibbAzJrGbCdxlsLfTiGhDToNtsc/f?=
 =?us-ascii?Q?eql/mqec0NPmX7HFoUIY1bP+WOPJdQkJAebGdxfyhzdJcDc1qT5cfHfN/XlW?=
 =?us-ascii?Q?MWuqw09P4g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 293caf7e-2b36-431d-6f1c-08deddc35a5a
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 14:07:03.8360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mu3vqEf80NRuDb1K20dp6uMdw9uMzGlCicPwt8lb2hi4TnT/mNd/KXysz1DuXE74xjmTg20gygTqgSFoGPiJ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0923
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 14:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240581

From: Amaury Couderc <amaury.couderc@est.tech>

The existing hash flooding protection (based on SipHash) only used 4 to 8
bytes of entropy for a salt, when 16 bytes of salt are supported by the
implementation of SipHash used by Expat. Now full 16 bytes of entropy are
used to improve protection against hash flooding attacks.

Introduces new API function XML_SetHashSalt16Bytes and deprecates the
legacy XML_SetHashSalt which is limited to 4-8 bytes.

The fix is split into 2 patches for reviewability:
  1. Main CVE fix: migrates hash salt to 128-bit struct sipkey, extracts
     16 bytes of entropy, removes dead get_hash_secret_salt function
     (copy_salt_to_sipkey accesses the struct directly), adds
     XML_SetHashSalt16Bytes API, deprecates XML_SetHashSalt, adds symbol
     export, backport feature macro, tests, and documentation.
  2. Windows/cmake: adds the missing .def export for the new symbol.

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
 .../expat/expat/CVE-2026-41080-1.patch        | 517 ++++++++++++++++++
 .../expat/expat/CVE-2026-41080-2.patch        |  33 ++
 meta/recipes-core/expat/expat_2.7.5.bb        |   2 +
 3 files changed, 552 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-1.patch b/meta/re=
cipes-core/expat/expat/CVE-2026-41080-1.patch
new file mode 100644
index 0000000000..e93ad093f2
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
@@ -0,0 +1,517 @@
+From fa1ebd60bfcc6d32f329803e5e837251e2387ed1 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 30 Mar 2025 19:26:55 +0200
+Subject: [PATCH v2 1/2] expat: fix CVE-2026-41080
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
diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch b/meta/re=
cipes-core/expat/expat/CVE-2026-41080-2.patch
new file mode 100644
index 0000000000..0410f8b070
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
@@ -0,0 +1,33 @@
+From 3cdd1df2644388aff25dd0ed7128c7bb1de1a7d8 Mon Sep 17 00:00:00 2001
+From: Christoph Reiter <reiter.christoph@gmail.com>
+Date: Wed, 10 Jun 2026 21:27:51 +0200
+Subject: [PATCH 2/2] cmake|windows: add missing export for new
+ XML_SetHashSalt16Bytes
+
+A new XML_SetHashSalt16Bytes symbol was added in #1183, but it
+wasn't added to the def file, so the export is missing when building
+libexpat on Windows with cmake.
+
+Add the new symbol to the .def template.
+
+CVE: CVE-2026-41080
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/3cd=
d1df2644388aff25dd0ed7128c7bb1de1a7d8]
+
+Signed-off-by: Christoph Reiter <reiter.christoph@gmail.com>
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+---
+ lib/libexpat.def.cmake | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake
+index 9b9e22cb..948135a5 100644
+--- a/lib/libexpat.def.cmake
++++ b/lib/libexpat.def.cmake
+@@ -83,3 +83,5 @@ EXPORTS
+ ; added with version 2.7.2
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerMaximumAmplification @72
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerActivationThreshold @73
++; added with version 2.7.6
++  XML_SetHashSalt16Bytes @74
+--=20
+2.34.1
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/exp=
at/expat_2.7.5.bb
index 4f2578292d..ffb312cd9d 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -10,6 +10,8 @@ VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.=
bz2  \
            file://run-ptest \
+           file://CVE-2026-41080-1.patch \
+           file://CVE-2026-41080-2.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
--=20
2.34.1


