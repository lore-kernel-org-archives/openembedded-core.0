Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3621061B37
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 11:38:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18298.1774956850018488876
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 04:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=FYw/dI2p;
 spf=pass (domain: est.tech, ip: 52.101.72.5, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPCWxDO7TeMI/RAHWoBQQytybkwkNzGupr/ztca1h73GZQZrvgRGCG5rl3lzlHjX4KW52vt9w3I8Yt2VWptI2tF/e4h0S0aor9IY/ZL+ljUbCSJLKvdfOyOquMgWxwyfGMy3Fgku21H+xLISqmvOgKJryDoHtoOYYfHmmjJyPwStNUg0IbyViHShzQD4wHRySwglMmQ1z1TswRBqxA2v5HLbHM9jzcn8KvL6FnzFkYst7trvvxcwzUqh61o8oqANPII5wv5jRqkVZFRy5a4YHjvCnpXGOrLPM9CyyCW3RiG0PbAwi3U9UN4ZRzbiutHLJfnI/LUX2FI88sqjwDm4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5kV+H7MKydXVPIoYznxH1D/aOd3b/N+Fg1WDjcRzXc=;
 b=icdHY0/xP2hvSsl1MHzE4BT5PeVZbSJJ3ti0Kbv0c2zcjnnPH/wEPfqGtObL577/rv7XNBlfSI5LxegxSA7k81Sf97xNG/gZ9kmX+DsMPifkASCtvBqBisbTplmy6aJjJ9pln1fdDntR4niOAjgHyBUMJ+lRSjdRKTBzQnm6Iy0OksC3EKj5unuIU3WNlWZMvsP6OA4p0RXM0YchP49UqjdclGVarOD3T9aFRy2NBKYN8zwLtsv9/7VX8a4HLRKHEI7WeMZcmJ2dpKxLOEcyGNE+UzhWrzKVR78sp0gcDv/K24MtovpwXUufU8Yg6cwZEexMjeow6NLTsHUw8jDJhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5kV+H7MKydXVPIoYznxH1D/aOd3b/N+Fg1WDjcRzXc=;
 b=FYw/dI2pZ0YPVZHlmgI1MnpkZi6OEcKHgGBDjDnTMHMwfbeKNY09bNTnNzjz1CzOfKRmbzMdCOo1jDpKKt21l/0VxkN5VCJiX4iGR+bbj62ksY0Un9MZsmVYAu+6+pQXRjj3LEyak0RgfkBq9y8VpjHMyOk1nBJsDCbb7zajjmgaKyUaZvOtm5QLddcZ12wCuN2rIWzNPw7BLai6BweYIvZRDkhlJWYl0SFIGWQEwxbWkCIPmtbie2RZKymekXYlusMty19jBP8Oudzz3VnH2MgqnhroHMOi3KxR4t2E8Or65D00GRRHfgKSlmfdDmQrgRmg8BT4t+SdcXKFTVvDqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU7PPFE8B517AAA.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ae8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Tue, 31 Mar
 2026 11:34:05 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 11:34:05 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][whinlatter][PATCH] binutils: mark CVE-2025-69650 and CVE-2025-69651 as disputed
Date: Tue, 31 Mar 2026 13:33:58 +0200
Message-ID: <20260331113358.154901-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: LO6P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::7) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DU7PPFE8B517AAA:EE_
X-MS-Office365-Filtering-Correlation-Id: 299caa48-38fe-4ad3-950e-08de8f196a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	mOa+IaA2T84fyi0q44ee+jwxtecHcXV274czVmsSYui5ATJkOY1pZy7YyiMfEkO4fQmwT4blhEYM2/eiSBP5MzdSbohpqfMi6Gf8RW2XQ81StAEW4i+nB8Slk7lRemLBIHOBqGWSDel0xC+IMX3O0Jy071YN2vatGnPZPgwHQqt/h+o5rdVerZ9GhRCx0KUy0YlU7sOGvFnBOmMMFIgLfNU4X298RQnMBR4IDLjwNAqhQsXskwFo0YBrCPKQVEOUub9jO3CS7H1WdXVtINA2qFmu4C40M8wSLXqvPs82Yz1LNDtYpJ/8JgnNDqriGBsPF9862DyF+A1aUHfJrBBPYrwVKcV9wd/d9JWUUfzjLQVkS9BIilgQVwESCKSThQAyk5JBgGYEzwnGhkzusRL/Zngk9oy0QTfMLiOSUAUCoj96we8+9/NoW6ELfZniv0rHU481Maq13X8eXYYlGYYStqsMkghWwR3aonOtTE7jxG2DBykWw/JoTCXddj8stPEYyigXwhyjMU6NUkYH5+djXEZbLjl+CibPlKg1A3RIvPn5uJ8Ob3qXatDppRrzaxKlnZQpqHnd0ofQlY1iUvoYz2+XXeSm7NwfAVTI74CTQydL8fLyAIFzXh+8kpb3SjJ+26+6JU5Hjak2p/BpqjkcOyo34Yw/gHz5TDxyIA4OBjdrMc6h3qMFWXpNUWi6RkPAA3iHTczVbK9Nsr+O75dWiinz4Ip2jD9l4xjiz+xrGOFynxLwTovLX9wpWq91Lhu6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?shMQz9pie33CaSi2p6wa7thkENXlgjB4qCd3bxgVqe/FM8Ay8cCPLTSr5882?=
 =?us-ascii?Q?baXdbjM98Lqp7MjvG67V8CYHp/p+NimAw+5OOwob6YnhC5Vs7BP9Q0SCxoaT?=
 =?us-ascii?Q?3W47BTyz5DzeRIEAPnZRpRPzpGs0M/zOBzRBUp7pZ7pAzlf37i7OfUGIKQPd?=
 =?us-ascii?Q?5v9+65R93ia2X7XHVYmd8eFKpKNzCzhpxOuMdui6zM92vCZQIFpcpzDWzGla?=
 =?us-ascii?Q?48y02g6X/mnOnYQbcvPWa/azHDWgaEyHS3esMHx53bs+kwq7OBziBOFtZEiC?=
 =?us-ascii?Q?usOKjmqiauX/S+GM85zya5H0QJ6vknc6WjmP94tMj9p7pH1/rmVFoJryv3lg?=
 =?us-ascii?Q?1T5xiZfusj5rNXHv8xR+be0CKKfvG9Exibr79OnZabRcHDvWkjbPxEdTG7p+?=
 =?us-ascii?Q?ppDpiQkDWs5f7idpmAUvjPumgv80Yvx66ucMO4gx+vyP7+iBkcrRJgc9R+ME?=
 =?us-ascii?Q?Tm/vDyD489tDIGE5wrFbZ5e4iB1qszIJ5NzO+l23+F0hO21Dkqmi6UeU1R36?=
 =?us-ascii?Q?UrXw4XgcWv/MYa9o+74gPFht3kCVCBeLyrQ9iLdeP1rokAwzjFa8Y0wbCl+q?=
 =?us-ascii?Q?KW96lM017eZMu476XwPktwc7YFN/Nke5IWt+z74w74O/mrjESEnJbrcd6wkJ?=
 =?us-ascii?Q?NlBMmfMShhGF8YvSHoTrJWns/hGNQutDg+5vJW/42szs4VaPorsLvJ4WrAPU?=
 =?us-ascii?Q?VV3rdr8ok7QijOYM9LkFHbZHjMygFMbF+kB5moxUSMegghKvcqqoAEkv4JTI?=
 =?us-ascii?Q?4udJ6ue4xHlrp7MaYb4mvY3q6rTOPWdPs2W5wL+8B+F9Yjz9ZqVrgprpr2IA?=
 =?us-ascii?Q?p1N6oKz08D3B6QfZgp6V4Eh4H44PoC97175H7Rc6ahqzhdW3PUTtLlD2B0zp?=
 =?us-ascii?Q?Fg+poMvbV6I67kvv7VV3knvkyhXMh7a/3XJoBPWJGkq0Trcl7muAVdY465vI?=
 =?us-ascii?Q?c4R3KojZD3UGt8io08Inngca/wzRq7cx720H69FM6sdP3NNu4X8/hXlRoavv?=
 =?us-ascii?Q?8CUi6s8BZZL2ZogxNGeOWzZITdXFMxkFOnj03K+R/pOtoR/KU+sufgXSUhmb?=
 =?us-ascii?Q?JVQHFuNCh4nU7mOQta8SfXMG0xyIgOhhh3CYYPjECNIyNMIBIV7WoaefsZlH?=
 =?us-ascii?Q?oiDIpbDWda9GFhG8e2yzeB6TXJo6orHTd1BBJ8iYtGX2fIVcWsbN6t1Ijc9R?=
 =?us-ascii?Q?kT5rHpzwkRGyoDQyHlZ7Rl71A9cx3ka+qKLoAh79mzSwigXn4NzYzpFskRyc?=
 =?us-ascii?Q?x3h28ArE2///r5Do+gdYJ0+JWd9aqGdI2fSFgxlKgHzy5WL1rd59HpyyzP5e?=
 =?us-ascii?Q?0Z9mCTOqB0iiI59MdbCChZmUHTEqbSKwewsejMW98ck4kM6dLUKHe2kBZRK3?=
 =?us-ascii?Q?yKg13WBKaZpiAGpWwuVw3iBVRkd1TQaBurzCLj43fQ04yvarmNx0G9Jbnj7N?=
 =?us-ascii?Q?hE5PkeJqU9q4lNgPPkzSkPjLWu48MAjgXqYrvP2yh+swAeMcK+htStmpJNLD?=
 =?us-ascii?Q?HxIAQ1IJgO6enUXXWvVnCGsTDdjaOn/QlOkOoRs905PAsvtH/JWuzUYIjkfs?=
 =?us-ascii?Q?5xZJUP5Ic3P7GPKto1C4/sZnyykFoBI7wtZhmt71iCLgigWwyDWKnZ8coTBi?=
 =?us-ascii?Q?idY67TuOkLygwVHNYlLzZkMs6Oid6ZhOSoCS1F79z9QNUSHxT9O4Ey2fZbIs?=
 =?us-ascii?Q?YzN7TfUdpnAZQ2h5Uc5+WLKEzMEcZ0pTXRy6E2FAjtQfGkwFeAY+Po2g+ETG?=
 =?us-ascii?Q?n3XpRxkw9hBvuzi41jFSezW99R63dx8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 299caa48-38fe-4ad3-950e-08de8f196a02
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 11:34:04.9931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8u/MPwvLf+o31Xwmn9pvPB407x9u93wJFV7xVODqgq9cuA1uYMlV72PiWVwJIJZbhCxaY0nB7kAZ60U2E207PqAqC1QENwHTZ3lkOb0AZdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFE8B517AAA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 11:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234283

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Both CVEs are disputed by third parties. The observed behavior
(double free / invalid pointer free in readelf) only occurred in
pre-release code and did not affect any tagged version [1][2].

CVE_STATUS[CVE-2025-69650] =3D "disputed: observed behavior only in pre-rel=
ease code, does not affect any tagged version"
CVE_STATUS[CVE-2025-69651] =3D "disputed: observed behavior only in pre-rel=
ease code, does not affect any tagged version"

[1] https://www.cve.org/CVERecord?id=3DCVE-2025-69650
[2] https://www.cve.org/CVERecord?id=3DCVE-2025-69651

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 meta/recipes-devtools/binutils/binutils-2.45.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipe=
s-devtools/binutils/binutils-2.45.inc
index 16a63cabc5..5cd4d185ac 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -20,6 +20,8 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(\d=
_?)*)"
=20
 CVE_STATUS[CVE-2025-7545] =3D "cpe-stable-backport: fix available in used =
git hash"
 CVE_STATUS[CVE-2025-7546] =3D "cpe-stable-backport: fix available in used =
git hash"
+CVE_STATUS[CVE-2025-69650] =3D "disputed: observed behavior only in pre-re=
lease code, does not affect any tagged version"
+CVE_STATUS[CVE-2025-69651] =3D "disputed: observed behavior only in pre-re=
lease code, does not affect any tagged version"
=20
 SRCREV ?=3D "2f028c6bb163a045db95439fb92e1dcbc919413c"
 BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=3D=
${SRCBRANCH};protocol=3Dhttps"
--=20
2.34.1


