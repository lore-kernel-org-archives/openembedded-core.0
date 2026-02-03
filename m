Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F673E8785A
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 19:00:20 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1296.1770145213117435855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 11:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=AOOzwvo3;
 spf=pass (domain: navimatix.de, ip: 52.101.83.92, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnkClyrMBZx/9rd8HZqSyLM1KcHGk+//D5SNFOgdlVgse6dWnj94U8Zih32LtnUtDpBTqgmcv5sH/3TLUAW9ycJQI2SP3st/PwFtaQS+Q9sbuaVqZ1QD/O4qZd/ZwgmKDRMizDfXzs0MFsbEgbh494XR+2PpTdoBImWWciV0/K2yt9uSQXEwsFYIiEgoR1WsxHkksbfeT2zVQD/IkdhQnY5AIMncTt+nqcCkpNojBjtkcQknSiDH2sLWJASRjSbjCUoXaqvk8j/SXGiyULCBf/tooqnYHdTt5sJCTLTdTWxEarectWA5D5i44AxH6tS8x45wOWL2MXHTpDgDrde+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woL/CItEQRqnOnWN8JSQcsB166ryWcqc8KBTIFFhD24=;
 b=gN7ay0jz8q97cy9ia7vqAoV8lUTnK3T/a6pmbbyQpZNWvmperqEUeYinbn02Dkxo3G47/25985qlCQh0Hr1V5aVa0NXXwEBJW2Bmic7WwSR/1dS4e3PYIa/8BqJoaj2vRsmOV6PBhsKhsAzNtUk3orFX13zofjx2nTy3o9C6b84dXiTtE16zA5almltE0KJNDmoQQrvPEUm6eEb/LrkZrqk8Koqdb3UAI1LB3BA94ES/3bHMJ1qHvtTr0YWY2lblULmGL8A0SeaCXR96pL6FncbBwM91ue1HNu0h7Ovrz84hxcRBDi5eLEh7v1iGX3QUD6w5NFQ3tVZ3nzDgB4Z12Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woL/CItEQRqnOnWN8JSQcsB166ryWcqc8KBTIFFhD24=;
 b=AOOzwvo3mLQ6+GFYT/JvO+99fQ1Pp/GSHHNLu27Yp2cxtMw+1QlEPfShQptf1yHxoccK0WIXVl5prqj75g9LjLrL9hByvuiwEaX3Dlai++ir0oJUwxOOSXwmwqs6rK9Qi/tbi7R4q4Yxmnp3r4MTi/xQ4u7j7QlfZOUBKjIIK00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA6PR01MB12474.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:51c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 18:59:55 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9564.016; Tue, 3 Feb 2026 18:59:55 +0000
Date: Tue, 3 Feb 2026 19:59:54 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] create-spdx-2.2.bbclass: Add CVE_CHECK_IGNORE to fixed CVEs
Message-ID: <dc7b7cdac3f8ae703ee1ca2e785fdee9b383c606.1770145193.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0314.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA6PR01MB12474:EE_
X-MS-Office365-Filtering-Correlation-Id: 420f2a0b-a5f6-4ce2-5c92-08de63566b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3yH3Th7QbKFqknLYHeq9Hw0+bU3YWH2A2i/sgEk5oorNhsNe6M/C8ZOqIcuG?=
 =?us-ascii?Q?HP8l6/j3PNGMPoSQB+tBHj8lnLRFVNq6e0iTDLCRP5Da2Cu8bMFaoExcX7Rg?=
 =?us-ascii?Q?C47w/xw1fqvX4N4PqilUj+FoKiQf2FuKZMJcRbY3c/xfkLsL96xudIGyl22x?=
 =?us-ascii?Q?mQB6mBdo3R0CIb9AwoC+8ww7UmSSTMFgZFV3nLXpsOcnnjXEZ2sPlZj/hu1r?=
 =?us-ascii?Q?P1ltNvab5HP+ZKvmlTZuw1ZkFfFL+xFZ6FrxsT3noMaK4dlyhvPNta7oYfPp?=
 =?us-ascii?Q?iy0Hv9jLHSKxGGoLexL0tRNyyrqF1k6K6c6o1aPHof6kYBvgpsi5nrCOwDqT?=
 =?us-ascii?Q?I21MhGbQ0bYLn55pQDGKCHmX6+NCkjIDkWFZr//OQ3BP3kESXDqjPbrIV7jN?=
 =?us-ascii?Q?lKhDRgCp8BTQ3IRqTpjOVINljDPjqm/dhpwxvy5cU0/ueIzG/dG9ApgCAuJC?=
 =?us-ascii?Q?oLBaG6kzrX3XF1xNqVGaoPPR4h/yWWU5LRk+TndxrDlUzNz1Yo/QogIGFlzi?=
 =?us-ascii?Q?ycyKFCahpq0NLwrbjRQO71KYkI8JUGSOPNEd8ZcNDiaIy4FT55sLTAiFP5CC?=
 =?us-ascii?Q?H6sruFqawyuvl9pLBsuPfVgY+J0E6ltjHnszM9AT7pc4BtYcEeOl0SCoPiQ1?=
 =?us-ascii?Q?set71LuhFYC2+auML7R2RtRrHT4+8chjBuogZCvZAWcIsUfv+XTLz9MFhMNz?=
 =?us-ascii?Q?0Cg8T4BmEHmAdBmVXHOJte+KuAhOzQKyFUNQXDcisqphfanD10jNFYgF/2WV?=
 =?us-ascii?Q?+8QfuKeB4w3uUk92Of+Ox9jZ3E3+aVHjlkPVfhKUp9hixVKUiBLp7nAtmERs?=
 =?us-ascii?Q?d/yQxtiJqldhkKBxQfBYz9WWPGBZAVx4iAYbm3ctVCJ84Ujfh5BGH81NhICX?=
 =?us-ascii?Q?24i5KzA5y68Mjyqbrsa4Yhy/vANfPRg8VsFIft2WR52neuIIe7fIi7avHQp+?=
 =?us-ascii?Q?ADkXKGvGgRlpfzfFYcmB2yCAjdoCUdJw8InCR1iNqFIZq323Fb+n+xM+eM2W?=
 =?us-ascii?Q?OpTcqMgPn4A7xpykSpvH7ytzfbMzfvnWpfERA/f7DpEFHQljwRpJIlj/VsoH?=
 =?us-ascii?Q?jCpBA2k9G1kDvN2W9SPZgpzf+P8h0p4bLFq2xiwnfXfaaBLsjiLXY9F/Pf9l?=
 =?us-ascii?Q?0KLJb9RDyfvm1M2TfYeQT51aglV7NSbPxwOHPlKg5S4vr416qN1ND2SoXtwH?=
 =?us-ascii?Q?0MDH3yg3wrjsGgkDAogB79Pf+zMz+qQmxBDGVNwv+wJj1ojVphwl3gcIma74?=
 =?us-ascii?Q?v4aRcB/s2aBj+PiirsKrN8RR/Qr/VGMBRjayPxlDGcZ1jnlEqBv7xY4AGBI6?=
 =?us-ascii?Q?rY/wvOINeWnUKQXQsmeGtYe0E5mvl392S1ciNAZvIbx55pM7Itfk2ao4CYdu?=
 =?us-ascii?Q?W3WWcUxklSp3lWglV8PvUf2UIhfpaiQecysZmqvSDoA7lRUxff4EGyaDCeyr?=
 =?us-ascii?Q?uFlxwccLhYel3iygcdsHoQzO5Yj00QTzrzdTapWQ57P+02RP7pNoJe7Fkwfy?=
 =?us-ascii?Q?uJo13PKT66nrZFdlFGe6ddSfV2hrlVoSNF8zF3KDMUFQ8gSQrPiWbpoJGn4O?=
 =?us-ascii?Q?Pjv+BvQX8Nu2vD5T0Ys=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fto2o7jEE+IUjQYOPAvcHCwFKlQtjaLH2ApOOVzDr+VJxznp/tSJP0q8UmyP?=
 =?us-ascii?Q?i/p/IEcZF1LfNS6hfz+VpoVE+gsLGX1lMvQmk8IVlP5BXv1AX7nllnadk5rD?=
 =?us-ascii?Q?ZhtE4/GMC5onrNU83ORg/LFY8nJfTAfu/vwOBRpo+APcpH+0AJEWUyI1U1A3?=
 =?us-ascii?Q?1wuadx9N4GUuDSNbJlphZCpk0WoXU9l0ITa/qfBnMfQAKj2ol0i/iWdvq3MK?=
 =?us-ascii?Q?mcrQvGkDcPPgY7FLI/kOtl68j/HlClGxIOiSKQzXyQyDXKnF1FQvK5FQV9G4?=
 =?us-ascii?Q?rqVFy6PKnVzfoIeHYhCRYGnAlo5cEILaJCntb7udFKO+6/k/xbLUP5+gnrWb?=
 =?us-ascii?Q?VmL4eZCjLxR8fONvmPTEleuCNNEI2haARHA9iohWUF7ReemM1I0F6VJ2JKRz?=
 =?us-ascii?Q?rlzBP81gXJZJzq+6uThfE1l1GlCh33lH+Ax0NU6UNO4cAsnBwfGePPf7vvtY?=
 =?us-ascii?Q?A0uVfKg4oJ5qMpgomKpwwBtn1hW6SAh+I00v07TYvd0hfFmf53FcSMIiaRtA?=
 =?us-ascii?Q?jnNGPAmZy6ZJmIgGrtfy8NmD/JTaBXqfw4blqRq1c3vR4kdQUe+vj86rCDw/?=
 =?us-ascii?Q?LBwBpfg72+Z6uc0p/OsQXNkpWd/Xs/kmrpRNjG4ItunE4ZQ8cvQJBalIW13c?=
 =?us-ascii?Q?LIG3pmj2tk1+ZMaNXo0WlmRBhuepYqQKe/iXvC99j123lfKr7PqzsJoROZeJ?=
 =?us-ascii?Q?CorwQgq4sxBb6RScD1p4WcYCHsY7VsdQbckq6KapKdtcN/1SWIDtI+Dm7YGb?=
 =?us-ascii?Q?pB3huAfmMbBFcE9CCCJndYTaS/5p3bTQ0h77yoqPSxwcNB/Y3rfBqm4xWogu?=
 =?us-ascii?Q?3K7V2K9xF+0bnV/Hn8KEgj8ojsqHnwpjfZhwHvgg9PP8mcYyy1VEXSeH8+NM?=
 =?us-ascii?Q?kv6T1TL0HmS1rk8wUekvD8h8ngAdCxXpfdyvhuCHw/PSK7p0qD004NwfErpX?=
 =?us-ascii?Q?VMdkq+XJgaQs1toxWVe9MZX7hca9q6jc3bqxFV+hubfu3xStlfzPsJkwkSAP?=
 =?us-ascii?Q?OAFi0YdxBe0w1lOYIk/tjd6uDKkbR/d1F37DZdP/qtwdyk+V4fJ3FGawUUeJ?=
 =?us-ascii?Q?0w4gqHN8PPsmZt6faUdLb/yrnUQb6r5+69T2FEfQPtiaIIB3IW2SkSIYrnT7?=
 =?us-ascii?Q?/AsmKEaLb3jzJ4h8gM+ykCtBMcyxPfYM2TzYdg2auBg0K1HSGOF+ro7SBuVm?=
 =?us-ascii?Q?QxywYU9dwIRIMB6Kyf6x6aOGb/v8NeVXaVgcbIx9vGBCMi4ioJt0Wxg9lnGr?=
 =?us-ascii?Q?HjvkGrkMkw7ZfzR17l7xRjOoVVxs7gNV8RlMBYwCDhD1uTCBfW+Zj5AaMrwS?=
 =?us-ascii?Q?4U3qDArBobqVgBp9AmJc63jRrspE+4qcgDmUbYBXdsoj0unQY5MzJo2KSSkk?=
 =?us-ascii?Q?ZJZ9HpIqYxzAf8twvOuHlBD+nm32Myi06Kulg5mB8Y0baorZsG2+XyyqvjH5?=
 =?us-ascii?Q?5uQN/IF9LAFbXfplvpUPyB9Z/k+7HCd+r3etJmcwdqWpToGp2t8s7DkFP96a?=
 =?us-ascii?Q?WoTdHX8WM0JQPubcA4vEoXVvgx+I4G+4Qt8QyZjVqJIOlN6Pjn41NdBmXiHx?=
 =?us-ascii?Q?y871H0875hvKtVGL6F/dYRP3lkP6ghH3y0DfUWyn5XzzuemKJ3xirT0PB7HK?=
 =?us-ascii?Q?zJS1IoLVGEIUrfBEY4kLxnPcLq6I2sEKSh4iM3XWBN8yqEJ2M5weZoSK4LMi?=
 =?us-ascii?Q?oUGwmohVyRHkKVvZB9fZLHohIM87gcv+0KsvkbRT4BbJukxnz+GEpAZwXTET?=
 =?us-ascii?Q?C54BiWlPCMZM4WHg5dfgeuM1ZX08CA0=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 420f2a0b-a5f6-4ce2-5c92-08de63566b76
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 18:59:55.6652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOUJXfkfd9cI/1QjJOUKCh8YI/VrjTY9PSRcWYu243QyKsU81IsDtp8pMJWWVfExtyMEjfv2rlsdPHEON7vGHy9PHw2hQHvJR80hLH0DobA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR01MB12474
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 19:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230468

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The list of CVEs fixed by patches goes to the field *sourceInfo* in the
SBOM. But this list does not contain the CVEs marked for ignoring with the
Bitbake variable *CVE_CHECK_IGNORE*. Many recipes (e.g. openssh, glibc,
python) contain such entries and these are missing in the SBOM. Therefore,
add them to the list.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/classes/create-spdx-2.2.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass
index 0ffaeba0e9..65d10d86db 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -480,6 +480,11 @@ python do_create_spdx() {
     # save the CVEs fixed by patches to source information field in the SP=
DX.
     patched_cves =3D oe.cve_check.get_patched_cves(d)
     patched_cves =3D list(patched_cves)
+
+    ignored_cves =3D d.getVar("CVE_CHECK_IGNORE")
+    if ignored_cves:
+        patched_cves.extend(ignored_cves.split())
+
     patched_cves =3D ' '.join(patched_cves)
     if patched_cves:
         recipe.sourceInfo =3D "CVEs fixed: " + patched_cves
--=20
2.51.0


