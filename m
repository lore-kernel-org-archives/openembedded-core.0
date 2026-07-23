Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73593C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 10:48:08 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20770.1784803679997251223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 03:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=TZDVig0P;
 spf=pass (domain: est.tech, ip: 40.107.162.52, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNRQ9DbGXMmKMwfDriANWc21iv490N5pLn2PRh9FyS4YLSgCnaaOnL3Z6OdA0T78dPbkgUcqO/bbu8Vsha0AndTfTzEKXtXVH75W2BGPTGO1YKAfzVbjE8c+qUwBVYbOpKTNQOqhXJ65KRnemOIj0NIyAmWhWUTdviIpojdJQfiKqCkvLY9agXSch2c/2QLuukv4KlrGqJvQi8DffbSfe2P1y08GCJYDS5Auh/WmTt/LSSPLXBYQQm9J01EwgT3qkRqR0D5atcZBbxwwSy9258euCqPkvlZ1O5L5dapk47RKBtxCaz8H7/rZpb+H2VXbl8DKo9EMuXuq9K6nCapkLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxJQw/Ynxey8gzsGt/7K8UGCRAx69DXRAY3rtxx3/EM=;
 b=LYd+5NAGCpNojMOrqtN1M467MMSjE9tvWOfG/iPS7nyKByk4Qk6HhABH5T4Q5AKJh/5EQEiyeaYkk2Qu2MVYX1S1+Yl9mn5uwa8vMJaLIV/Xpbde061KuE3/073WIVMEqlhBsVHEAMuOmgqZXYtNU64o/uGQRkLQozJ8huCF4UYSZEHr58tO0/Is2np5MXRYqsuYeb3N3XC2hAro0KDoYCPOdUa5dgedpkJ1lBiwm19oQE6VRIlu3nxvqTgHSTQcxCYyMdIrq+fhc4qQGoVZLsnxHltPvlOkiFwp4ALyIUlx/uqjMnNW0yEgOcfeAxwUYS+DlSjUqRV9IqBlHrJrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxJQw/Ynxey8gzsGt/7K8UGCRAx69DXRAY3rtxx3/EM=;
 b=TZDVig0Pz9afWxLN6q5V8/jff5MgWsYC5cQxiSFamfCY/bB9L4jAkuot9CRKLWI/VsnjGwWq+blT9Vqbz4z0xXebyaRPAOJOctHpyhTrpT7Ol1ODwfD4JMYel15yUecd/KOqQg3y2XE7KcZTO3cCjGUd9UiDZouTAn8BRMHJVSigFGYu6dZSkfwwuKUWyQqGlaCP/FaZaDRYrrX1Ze9BWgL4JcEVtA0jJjziMeHaBzB9hpnnU75SKYxugP+5II/QVqSa/hV9rAt49CMvwIqC3w83MZgyKxvEIs1Ll5I4/NQ+hbzsG5mLCms0v1bMFfVQKkqXlIQPy9bCj6O+HkE4Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PRAP189MB1898.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:291::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Thu, 23 Jul
 2026 10:47:55 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0270.004; Thu, 23 Jul 2026
 10:47:54 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] bind: upgrade 9.20.24 -> 9.20.26
Date: Thu, 23 Jul 2026 12:47:41 +0200
Message-ID: <20260723104742.2999-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0514.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::21) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PRAP189MB1898:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a73bc9-e71f-40c8-75cb-08dee8a7d9da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|11063799006|6133799003|56012099006|18002099003|25016099003|12006099003|29003799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	ICtp7AztRxGWo7+ALinoFa2xysTYp189wWBL1I32gp/p4chwygw+0u5HMwYuAuuYGbhYaQ7ORMfL8BauxjDuLnOxAnwPUcvY/HZ8iLQSdYiUhX3ChCtDipqHPq/IwVoUBqeWyqEIl8A7CMdjLXnUSeQ8ANMYeqvvM6+NfZW+042BNEe9RlJMJL9d8sTc019dMiEDcI7n7t/+9+0rcHYRMsXDI9AnS9fGUKeR6yHBY6RguIc/vr6jFMxOBREVRcIG5rH0lKY8R3ES8+WvLhGmn3TR6smV150WxO8KBWCKtG97pHwoM+cj1i18JXdHJxAU+0IyBCOiCaE6hJ90SLOIBKfuovRSB5w1cszPVr7vgGEu0mg6h6B/3bY+z7xUMSpxokShY81s02rKq4FHfFiRHMc4321AaCRArtwHM1OBHA7JBK0gDE/gJdk2LkLyXevZhhIe9wBEdlOzfzM6XvCQRlnHG1UGQKJOON5mZcqoDGBXyyeC67SS4KE/+FtoKL5Cb/UxMS3givBDhhCZTDv8jmc69ZE3gGzNEr0Js9fpXqw94tpnJPmuimDN1uTwdN3e1f3jxcHnbmia99kJSeWuLP4JuU8TuDvvrmWj5PCXC7LRz/Bx5rqoU7Xf3Js/rmyEtRSTlPC/3V8xYAL4phFD6jTdF52uJE8b4Bi5CQWTuSI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(6133799003)(56012099006)(18002099003)(25016099003)(12006099003)(29003799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mg1IPKLd9IOXvR1Wh3I+/6YImtPTxocBW6vFpSH9B2YTkfN9baVqY+4uwuRq?=
 =?us-ascii?Q?KzpHx+JkSt/48rG+TlEbL73+D8GidVWMl6knrqpOWabDsRFeY2aPxVAhRLQ4?=
 =?us-ascii?Q?I7neGMQaXQY84rK9RZd68T9pGuSaJ539FVMkmacVaqdkIYgTGeo/lrw//vP+?=
 =?us-ascii?Q?pHcK6Vo7Ql/q6KuRQkOTPNK66YNPqwWx1EKjDC4Qt9DZKZEl78q0Z7QJNFUe?=
 =?us-ascii?Q?adkuOlpnsVyeUx8/kAndZOAFFGGrI8D2I8QGh6AuoTHgUhM6cZctHsKztrJo?=
 =?us-ascii?Q?D3qzkans9b0i6ht4kqOrcxOb+VfYmQNc5zovzLy2h5KKUu+5HR/sJROWpvP5?=
 =?us-ascii?Q?WjpzxcPctGY7HtbgW3jR3OQQ0w1iiR/datueLHJRxJkCylKVRNGXr/LnHlcd?=
 =?us-ascii?Q?B75/9NgEj0ZL6rtdWrLLgsBIoMPDQ6JppPcfWZrPEleI/Vqz9ruX5ShOoacK?=
 =?us-ascii?Q?AZyrCNqx9WtOCA0iQofFYsrh0hHgdpKT1TerJk+zTVRUvwHAvrhHIRt6zBHf?=
 =?us-ascii?Q?DP+1+DpKpJVbPvwqPMEpBT7GPsTvYmviuK8Mqxq9b3I+eJ+oRrn1lz3DyPO8?=
 =?us-ascii?Q?naMzo1ZDfxMWX52S7Y1BHwtDCiiyS+VmoDmdhsOPlM1TXt8hvJvPIqOWaHsa?=
 =?us-ascii?Q?siXrBTNzto8kE0ZH7cwIUIZnLNv3HqwSDXDnoqC0boRdbui4oE9Z7jstilYB?=
 =?us-ascii?Q?PyrAZo99zj08nP+V8HXqcQ7L18IpNlQeK3C5VcaWRrksx/vmbAbj6SkgjANp?=
 =?us-ascii?Q?msDuMpLZUJ7L9Vh8n7WGsyLCtLK5MuA5/JFPPTk9UkH/QO+ZK5GuG7RXtwTU?=
 =?us-ascii?Q?n9QfS/9dp0+YCNFe7JqYGs9EcPaYpJnRI+Eb/x9wbJuyewC1FlAODaG8lkIo?=
 =?us-ascii?Q?7faSstI0JgtQETRLaDll7cwAJHi8LcUtIaPLQfW5X+0+kAM3vG65jb58z1kk?=
 =?us-ascii?Q?op3keLchqM0snQfz4UQ7E2yhkJ8ZN89jouS933nclyoAzauIpSiY/hwr8HwY?=
 =?us-ascii?Q?2q+QDF7vTI3C53woFsf/7KwlGQxppzzN3wqm09VKWeCVVzF68rDVx0mpenRt?=
 =?us-ascii?Q?JJvLF0WoxotXhkpoBKn5f2oI3eDd8T8RsXx0zS/mtcLUGKKAaWrLvf/O7elc?=
 =?us-ascii?Q?EfTnPJXa2/mnHi9A2Ud6YIuaBgSCQu8apG5nRwjtCarsTqpD5c5QWfYN5X6S?=
 =?us-ascii?Q?wdXjmPM0hXAlFcZ6yUEoM0osum23xXUUVra5nGX9JcIu7N96BynhOexbi2Z8?=
 =?us-ascii?Q?wfpoYDyqfeAAnpWI1/C/JESUdK3qtxFkj027YFexeQMscCgkLf0kZ0VQ76jM?=
 =?us-ascii?Q?bTjl8w9Z1AzPqgk0cgYCl4qaOLY1S5v0ek2oHORB9pegp9sv9W/JNe8ccUF8?=
 =?us-ascii?Q?vODHIBv6KD505HxqNBqH+9LtzDpPn6vhJt5leiHr6hi8AfOKdCjCUdGxEEyW?=
 =?us-ascii?Q?l1WFQ/DFzXy1ZEBTMrO4jfgNPp2AbyVFVqIAIP85BrsIfdglFEQmRaVGPoIy?=
 =?us-ascii?Q?5Ds6aIGqWnrktp/lJtVTBlGbvzUXL+3lGY+Rz7tW9lnBgOZ4M8p3E897vT0o?=
 =?us-ascii?Q?sotRSWIik67qZhzpQsi5VeC1hc+kqDLJEJ0pweOu6w48nqUoQLO38BP8MMBa?=
 =?us-ascii?Q?LM4OOOQu4FQeHJcjBgS79iQV4OIxye62Jzkww9aWw1dCWQB3CpWL2CUwp+yU?=
 =?us-ascii?Q?MHNc+k2nR/GlE0XkxThixocVQKN8w6YJqXK1SjdRXwVu/cm0va86YdTbT6Wn?=
 =?us-ascii?Q?E5gSl2CxbhwyXCXjzYpYFcf74u3EEJg=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a73bc9-e71f-40c8-75cb-08dee8a7d9da
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 10:47:54.7775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWl+rvSXJTvAkOkvlCIfIA6d0XXc/C4ORjIJlT7lk63H8fv4wOcQGyOw8vnt1y2zrfLBApEA7eKPyxk1fy0JTjCNQYik5BsD8R2O58XdjWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1898
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 10:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241820

Changelog: https://ftp.isc.org/isc/bind9/9.20.26/doc/arm/html/notes.html

BIND 9.20.25
------------

.. note::

   The BIND 9.20.25 release was withdrawn after the discovery of a
   regression in a security fix in it during pre-release testing.

BIND 9.20.26
------------

Security Fixes
~~~~~~~~~~~~~~

- [CVE-2026-11331] Fix handling of rpz CNAME expansion that returns name
  too long. ``b950da5f625``

  Previously, if the expansion of a wildcard CNAME RPZ policy resulted
  in a name that exceeded the length limit, a self referential CNAME and
  the original address record were returned, allowing the policy to be
  bypassed.  In branches up to 9.20, this also left query processing in
  an inconsistent state which could trigger an assertion failure.  We
  now return a YXDOMAIN response, without the address.

  ISC would like to thank Laith Mash'al (0xmshal) for bringing this
  issue to our attention. :gl:`#5856`

- [CVE-2026-11721] Invalid signed wildcard records were being accepted.
  ``249752cd72d``

  Signed wildcard responses in which the Labels field in the `RRSIG`
  record was less than the number of labels in the Signer Name field
  were being incorrectly accepted. This in turn broke
  `synth-from-dnssec`, which depends on such records being correctly
  validated. This has been fixed.

  ISC thanks Qifan Zhang of Palo Alto Networks for bringing this issue
  to our attention. :gl:`#5871`

- [CVE-2026-13321] Fix DNSSEC validation bypass via out-of-zone NSEC
  Next Field. ``6fbc963d4af``

  A malicious zone with out-of-zone NSEC next owner names can cause a
  DNSSEC validating resolver to cache such record and, if
  `synth-from-dnssec` is enabled, to generate negative answers for any
  zone that is covered by the range.

  ISC would like to thank Qifan Zhang of Palo Alto Networks for
  reporting the issue. :gl:`#5873`

- [CVE-2026-10723] Correct verification of NSEC3 signer name.
  ``df3abfc3184``

  BIND 9 accepted child-zone NSEC3 records where the first label equals
  the hash of the parent zone as valid parent-zone closest encloser
  proofs. This has been fixed.

  ISC thanks Qifan Zhang of Palo Alto Networks for reporting the issue.
  :gl:`#5874`

- [CVE-2026-12617] Do no assert for some specifics CNAME and DNAME
  queries. ``d75d1e93958``

  A bug in the resolver's handling of certain cached DNAME and CNAME
  responses could cause named to trigger an assertion failure and exit.
  An attacker controlling a domain name and the authoritative DNS server
  it is hosted on could exploit this behavior to cause a
  denial-of-service. This vulnerability has been fixed.

  ISC thanks Qifan Zhang of Palo Alto Networks for bringing this issue
  to our attention. :gl:`#5946`

- [CVE-2026-10822] Malformed DNSKEY records could trigger an assertion.
  ``a1777ce7ee0``

  Previously, `dns_name_fromwire()` did not honor the record boundary
  when reading names from the wire, allowing malformed records to be
  accepted when they should not have been

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch   | 2 +-
 ...01-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...nd-ensure-searching-for-json-headers-searches-sysr.patch | 6 +++---
 meta/recipes-connectivity/bind/bind/conf.patch              | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch           | 2 +-
 .../bind/{bind_9.20.24.bb =3D> bind_9.20.26.bb}               | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.24.bb =3D> bind_9.20.26.b=
b} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-w=
ith-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-=
failure-with-bind-user.patch
index 806ca9c5bd..4bc8b4630c 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bin=
d-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bin=
d-user.patch
@@ -1,4 +1,4 @@
-From e4886a825c82a7d6f4bd6badeeaeea700e429483 Mon Sep 17 00:00:00 2001
+From cf7537b0ddccefd04dcb82ca470262ce61afb252 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_c=
c_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-B=
ackport-ax_prog_cc_for_build.m4-macros.patch
index 9b2870bd38..c9dbff3817 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
@@ -1,4 +1,4 @@
-From e5f31670d79906033209d6b30d925dcd0324c95a Mon Sep 17 00:00:00 2001
+From fa7670386a1643de5b976f6928e42662b968d807 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-st=
art-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001=
-named-lwresd-V-and-start-log-hide-build-options.patch
index 1bbf17b12e..740d1e98e2 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log=
-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log=
-hide-build-options.patch
@@ -1,4 +1,4 @@
-From c18ad4de676ed9350837c4c90a5e53a941712ba4 Mon Sep 17 00:00:00 2001
+From 41901eaecf617abf8f2608e07baa775c75436a15 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index c845a8e..d065454 100644
+index af020f0..f461229 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTR=
A]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-=
json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind=
-ensure-searching-for-json-headers-searches-sysr.patch
index 352a2f1bc1..3c7f09d6bd 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-he=
aders-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-he=
aders-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 6f0289bc8ee2c5a6d386d6d6921875219b268951 Mon Sep 17 00:00:00 2001
+From 6a7536c66832e4d99d7d156256b1a98d9497c7de Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,10 +32,10 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver=
.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 7b9a63b..c845a8e 100644
+index f47ce7b..af020f0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -865,7 +865,7 @@ AS_CASE([$with_lmdb],
+@@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
  	[no],[],
  	[auto|yes], [PKG_CHECK_MODULES([LMDB], [lmdb],
  				       [ac_lib_lmdb_found=3Dyes],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-=
connectivity/bind/bind/conf.patch
index c7f6941908..8e82c57035 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From d308d9b835f4ad11e5824e7333668792980c1357 Mon Sep 17 00:00:00 2001
+From 352339af9e6cd9fc03caff09a1b295f26dfadc32 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-rea=
d-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-suppor=
t-for-read-only-rootfs.patch
index ec9eec6d3e..73e39002ca 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-=
rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-=
rootfs.patch
@@ -1,4 +1,4 @@
-From 23b997fc6276a527e1cf36312cd121170c15978c Mon Sep 17 00:00:00 2001
+From 75923521847618392e20fd9abd3245618b77c8f7 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-w=
ork.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-wo=
rk.patch
index 54d948bb17..568e4f2e59 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.pat=
ch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.pat=
ch
@@ -1,4 +1,4 @@
-From f5932fde97bb5b47144d926219f3903145a71185 Mon Sep 17 00:00:00 2001
+From 0224516d7bd100b6ea7b4fafdd07b42aa96cb0ba Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.24.bb b/meta/recipes-=
connectivity/bind/bind_9.20.26.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.24.bb
rename to meta/recipes-connectivity/bind/bind_9.20.26.bb
index 3c5acc972b..21ffad7bad 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.24.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.26.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-$=
{PV}.tar.xz \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
=20
-SRC_URI[sha256sum] =3D "989fef1fc88ea59d04cd86f854dca5a4616a20a9968bcdde3c=
1a3668ab36be08"
+SRC_URI[sha256sum] =3D "55248def0f870c4c46b3de72978ea972615131516663188a45=
64dca1d20bf350"
=20
 UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

