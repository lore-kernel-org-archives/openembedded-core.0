Return-Path: <david.nystrom@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C885CCD196
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 12:20:53 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.15])
 by mx.groups.io with SMTP id smtpd.web10.14913.1760530842733380946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 05:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=te8KH5CW;
 spf=pass (domain: est.tech, ip: 52.101.69.15, mailfrom: david.nystrom@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGJUrMeUraZ8PWR78wWXM8JRIMiJENuzY31Mh1e+fmcI7RTwlerivdMRrocQ9bmBoq6LU9OQ3ePNOBFxIlDtqFQdIfsJIoDPL1HJ7kMVxDq66RQbzK+fjlOiT7/k8rKoiAsNvVTy6fxn+ZpKKK4gwAu6SVj2KdU3G3MW5IoXTJO48gzz2HuK5KIUOQUbxTTgjMJ+OdUqyv0czf0eRLWsywdH5ju2U9KttVT8CuLtn/UUFw6h2+MDiWzGqwrILrlerJyLMBapCeuWouc4T8jfuYARm2WcalqbRyVpJiPKybCMzNsX87FKBJqRyftoKB89E9JK2h10pNgQKYA9Mr8Obg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CR5VsEy2wWmhBmOKliLgcJ8qKA3y5ksvz4gguqwyxQo=;
 b=KG0rDrNNJzhd+NA2abnxjzpF59yZqg7UG8MaMnEDX4rmXi6leqNqQwpGVvlKdriyhGQHmYV7RpSytsonkRXSvs3gmuGHdA/MG48Es7wC4VlDQ2KfTBNyjQEOiDJeFRFR4kC+9C63RqUBA4/8+tqfYFn3bPf9eJe65Usul89DuIHw/hPNhJks7WmDyr9Tr2WeAc5NAi43TcAZF5i1ryzp5YcKMBa4HYkH1INclZeZvBThvXmW+wgLRDdAXgLj5k5qaknnveS1NTxhdjICpcUNF6rWpFHs+hqccJiPjWYt7M3TmXHe9mMSXaxQPqMfybs3ZjRBtB62rpa7hyHc7ui1xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CR5VsEy2wWmhBmOKliLgcJ8qKA3y5ksvz4gguqwyxQo=;
 b=te8KH5CWGuWwON4Zh93rvSRwTkfiGXs60Zn/za2rVSn/XvZBA4zP+rYWETgSasI4/3qFUUQFsGhvtLXK0GNFvig3Dt1u3XoghOJojIhoePy7L6LuhTsrkK1KruvrQoXDkyvr1wTHvGbvsTHPS7NeWeQoax32j9gnXL/CN1DwWntyFpfo1UgGsoMKpE0IzWiSTb4s+wKIt3bHZAPq25eeMALh074ylx1NNilM8Dag+SmqOLKpNntenj44aY6K7Dr6QO9gP/7OOitUrt7KxW+jc7KfaG6pRaDk0JT4MOaxpV4bKBP1hOo8OibLuggFaFYDsgKGzdJ+KuBzSRf1cY5BFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f3::19)
 by PAXP189MB1831.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:289::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Wed, 15 Oct
 2025 12:20:39 +0000
Received: from BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc3e:2aee:25eb:1a0b]) by BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc3e:2aee:25eb:1a0b%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 12:20:39 +0000
From: <david.nystrom@est.tech>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@est.tech>
Subject: [OE-core][scarthgap][PATCH 1/2] openssh: fix CVE-2025-61985
Date: Wed, 15 Oct 2025 14:20:27 +0200
Message-ID: <20251015122028.336769-1-david.nystrom@est.tech>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::8) To BESP189MB3241.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:b10:f3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BESP189MB3241:EE_|PAXP189MB1831:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb26df0-c8a7-445b-057d-08de0be54073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v0P00p6ceYT7RZuF/ATlgjHY4xspzcNjftc5Sk735w0muakXIQXrI6A99v84?=
 =?us-ascii?Q?uq6FMWkl1u3MKKWUT1cHHXB8UFnSgx0QYMarW7EgHtdYVzk2kA/5IpJQHAgS?=
 =?us-ascii?Q?x8AhouWKUptSgozBsLtZVXrsSmX9znp/CgW+k0FmPvRSRniWLb9sA69g88Wi?=
 =?us-ascii?Q?9RCmOj0V7q9zgpqfz54Pqxu0b6bGFpLBxf5QWIaS+1NzlKDfo4dKIdU+fypo?=
 =?us-ascii?Q?HVQn/BvBP8MEyFthbl8Fky7tb8VLjemNReY3+xZ1au755uTtN9aWB4oXj5uO?=
 =?us-ascii?Q?jB7C3VMJbECUIzlrlaoq4WvXtQ5UhSHC8ujPeVbTllOOigIdBr3ssGjrUGx7?=
 =?us-ascii?Q?fwdAvdDqCQkerA5RSUjskyclut4OMVLyz6kVT2XFqjpXhGpI03MP0q6gIRrc?=
 =?us-ascii?Q?bMtZZAQw4atIm1gMcmsjYs/bc2BgggY2DQkYp7e21Kk7GgLOVrhcZyGl53XE?=
 =?us-ascii?Q?/K9SXSTEwMfsE2unOMFv2SfX7Dj0RUd/Tt2V92/Pv25K0+t1U+rF5MVjbGA5?=
 =?us-ascii?Q?EpKD/T+vHEIanS1HnWafje7VGrix1J5DsIry1sRHMokCLQIgpOxwKU/PSk64?=
 =?us-ascii?Q?2oERTe9fcJ25bOpfHxhE7IzyVln5SG6O56OHyWXox6Kk05QOx9zjKQk+rYg9?=
 =?us-ascii?Q?24z2Bjqk29Z09J299nvCLKX1ozMcbuL9pwcYRLUUi4Wvuaj52w1IyYIL40Im?=
 =?us-ascii?Q?wS7Xs/Ss/yZOuFmlR8B/ZP/yUv9TdY5fdRCBXeuLfm7QQnYl/F2XgvzyrHzS?=
 =?us-ascii?Q?Xr/0cuwoicC5M24h3bfk2rv8AUBSR0j60G8bU7VLcWbtqMEE1OgwRjegHh+y?=
 =?us-ascii?Q?isQ82PYIblGQIUZ/ZVLt77vgtPvo+yruxXaTjTbmfaPv1eDlYr4gXuUwFdYy?=
 =?us-ascii?Q?t5xGI2h6P42m8Y8f4fYaw44N04nqVaQgnWAz1u7tgHUZs7oFUWyad6/PsnLf?=
 =?us-ascii?Q?f4fjr7xn8xBqt5yEFjMktvBbws0Sq1914cvreTAWJes3KHysQMXEPc3nIEZI?=
 =?us-ascii?Q?6Vj7o3OU67GYSs5XQtOU7qjdLkAWI8m15bweNVJzHeYg5L0qR0JjMbtMLtWE?=
 =?us-ascii?Q?hJgKW5k0owybQvfkPnCT6LDExxFPE25kvt3UnGUnDuJpIDRO0JTJmWkTJS6o?=
 =?us-ascii?Q?ohjEfPKSnrhAAU/nkDWvG85YvHfue3EQyxokX2Fc6UCa1AOr6YF0eZikFjMa?=
 =?us-ascii?Q?mw/dflaXRokXWCEZpEJ6f2V9Dg8IGTiHl67Y3xTS8RT5zuCs275suHvZK2cB?=
 =?us-ascii?Q?HT+dO35j/XistG9DbIbKW9e+fn/3tw2EjhEnl4Xn+zcicYDcGIDH6sSmhtMM?=
 =?us-ascii?Q?SXiXqA3Zq3SMbtxIIw5Q/T9OSCeOTvbrxXHV2XrBQ5YmUI0+TO91/w7hct2o?=
 =?us-ascii?Q?Fe//ESYhNloa76wcjcFE+a5mN062PrC4dI2pDeLqkqzoIESozMUiq+WH5ILt?=
 =?us-ascii?Q?nJnL7tSKidiwSQWeo4CI/NVlSsWZ5cNw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP189MB3241.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FCT2sfevP50vZNTwy3PhAiSiGiP5Z7C8U/USuqB2FBJ7YhF4NDUhAw9bsdLJ?=
 =?us-ascii?Q?ABS3cSWzyvY+ybmCuy/Lf+b97QzHIJj9NVO3opoGaFRbysd3OjNgk1vSybn0?=
 =?us-ascii?Q?meKP+3lmASwrXZGwHlwKVERgpeKquY3xeHcvRftxFbx7GwG++Fj5iIgbuob2?=
 =?us-ascii?Q?bOW5yc57f9yBe2n7HEH9ia0Ap4QDMsye7nT0iHd/3KMh99QIklGELbxONhe2?=
 =?us-ascii?Q?qmOIMR72h5kikQgBlo9vj3iLo5JLSVVgJRVEKLeVsuYCAapGPY2Gdeh6SK+Y?=
 =?us-ascii?Q?qGIlZHZRNzweq0roa5RtFyZ10OV/kkMGpSEf8v6MCcHKCEVW2L4tCJC/OIGB?=
 =?us-ascii?Q?8c4trDng7dq3iDoftdYToRuIyD+ht6G9bK8atzTXhr8A0OqIJcNuoJPjKJQE?=
 =?us-ascii?Q?qpx76PG3qMIzc1Qalw2TgsHOETFoaNYMb1kdU70UWfaNVGTJiorf3/CJfSFu?=
 =?us-ascii?Q?jMnlbFM1+aPqCxI9gAJAAfGyU0hfAI+saoMo4H2Ot4gSYRjbKZ1Burr52ppE?=
 =?us-ascii?Q?MTJOam7zfp0I1SkMPgBh9SUQmkl6L/MlNUtyjIL+8RE5AH6VBIab0jENFcDo?=
 =?us-ascii?Q?uZwYzXWN5G3IuX2pYTZcvMtvezj3y3wm1U8q5Gd5yOFe40Y1rVY2cXHllJG1?=
 =?us-ascii?Q?u1VONd1noi+7PuHlTVmilFvfqAHsg784JixMy3Kn4FnrEgAs/1O2n5bjtebE?=
 =?us-ascii?Q?cO0K8AQgCE579qmwiNGxsv55XToXjkQNF9Se1JPHR7u8iVedNF9FKy6S/9W+?=
 =?us-ascii?Q?brxGKfjDU2XN2GTOvu3Arpi3Tgv2q0iBP5BMQw2TQkbcsPDXSwp9S8evy9wP?=
 =?us-ascii?Q?Pylz4ldd7wWhIcWoNgaeOSTYXoTUL2/7fehGoXA6G8zRzkSLv7kTp8AJnryG?=
 =?us-ascii?Q?9L6NzwJxX3P5qKzu3Qjhjbi0KxewksrAGgG3sqi5lwB0WkTc2OxNXhsPgotS?=
 =?us-ascii?Q?bNmmzGxHOlrJ7jgFI+IZkulyUBw6Mks8x/XOO9jJ+OZ8yF1g+l5mS8wZiBtf?=
 =?us-ascii?Q?04w3hco1oM5aUsoBWhmMpaKlG5cxeR6lZr/qXgy6hcOIc1ZNp7+ZQHjiIOWH?=
 =?us-ascii?Q?kk9st9PiT/7Hv1CMBIHzTMyPwD+n4FkyZivnuJ3GFsFL4EvP+kKKg1HTMTFR?=
 =?us-ascii?Q?Z6L3uE+FpzNMqaBnuXuRwsyZ9WT8cs30s/tgiE6cwwk1/izKVvsmjhHLJwey?=
 =?us-ascii?Q?a/69aMOc5pkR3ovcH0rz9GcB57CUIPD04HOb7FH1S/m5hHAketeom1wdv2Za?=
 =?us-ascii?Q?y0AEntiZRYOQm/PVDCdwjDvVftgM8tD1KGkJ5MSk2epuCY8STjdv3YauE9rj?=
 =?us-ascii?Q?fx51O8LHBRt0siG1VxWzkK68AWSvIrefpsh4zQZE4CxKSxZQuzaLcIbXShgX?=
 =?us-ascii?Q?yN8qrORShyjA/QKXhaMTSoO2kdJWCuCdQqNjYjKWzUCC1j/a6WQA1fYX7FwX?=
 =?us-ascii?Q?U4r/XDH8FKgFfPcuN4EKQTI/c+/5/hCxg+Y2QUafJavnY59/H1aw3kx/zRhG?=
 =?us-ascii?Q?QzSgrYak6jNxqD0FZuHUh8OgwKvf+Gg0DZsIN5sBK1YQNkzJwKa865wxFM2C?=
 =?us-ascii?Q?+8ev5NotEpL7ZCOPzo/rQWCt/t6wEcAZmm5Q3skv?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb26df0-c8a7-445b-057d-08de0be54073
X-MS-Exchange-CrossTenant-AuthSource: BESP189MB3241.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 12:20:39.0772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9kdMVYPYvjgmz3IzK0Ldx+yhNRKqc91MAz8LCneMOObXh/tO3T7Ya3pRSzXP6gtGyphnOw1vTRqtAo6BUs0iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1831
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 12:20:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224892

From: David Nystr=C3=B6m <david.nystrom@est.tech>

ssh in OpenSSH before 10.1 allows the '\0' character in an ssh:// URI,
potentially leading to code execution when a ProxyCommand is used.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-61985

Upstream patch:
https://github.com/openssh/openssh-portable/commit/43b3bff47bb029f2299bacb6=
a36057981b39fdb0

Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
---
 .../openssh/openssh/CVE-2025-61985.patch      | 47 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-6198=
5.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch=
 b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch
new file mode 100644
index 0000000000..9f4de0ed56
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch
@@ -0,0 +1,47 @@
+From 54928cb9eaa7143ff17f463efa7ed3109afdbf30 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 4 Sep 2025 00:30:06 +0000
+Subject: [PATCH] upstream: don't allow \0 characters in url-encoded string=
s.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Suggested by David Leadbeater, ok deraadt@
+
+OpenBSD-Commit-ID: c92196cef0f970ceabc1e8007a80b01e9b7cd49c
+
+Upstream-Status: Backport [Upstream commit https://github.com/openssh/open=
ssh-portable/commit/43b3bff47bb029f2299bacb6a36057981b39fdb0]
+CVE: CVE-2025-61985
+Signed-off-by: David Nystr=C3=B6m <david.nystrom@est.tech>
+---
+ misc.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/misc.c b/misc.c
+index 3db2e4d0b..cac246b63 100644
+--- a/misc.c
++++ b/misc.c
+@@ -955,7 +955,7 @@ urldecode(const char *src)
+ 	size_t srclen;
+=20
+ 	if ((srclen =3D strlen(src)) >=3D SIZE_MAX)
+-		fatal_f("input too large");
++		return NULL;
+ 	ret =3D xmalloc(srclen + 1);
+ 	for (dst =3D ret; *src !=3D '\0'; src++) {
+ 		switch (*src) {
+@@ -963,9 +963,10 @@ urldecode(const char *src)
+ 			*dst++ =3D ' ';
+ 			break;
+ 		case '%':
++			/* note: don't allow \0 characters */
+ 			if (!isxdigit((unsigned char)src[1]) ||
+ 			    !isxdigit((unsigned char)src[2]) ||
+-			    (ch =3D hexchar(src + 1)) =3D=3D -1) {
++			    (ch =3D hexchar(src + 1)) =3D=3D -1 || ch =3D=3D 0) {
+ 				free(ret);
+ 				return NULL;
+ 			}
+--=20
+2.44.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_9.6p1.bb
index afcd50c7e6..bdb8a1599b 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -32,6 +32,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/p=
ortable/openssh-${PV}.tar
            file://CVE-2025-26466.patch \
            file://CVE-2025-26465.patch \
            file://CVE-2025-32728.patch \
+           file://CVE-2025-61985.patch \
            "
 SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd5362d=
e09385aa7a777c"
=20
--=20
2.48.1


