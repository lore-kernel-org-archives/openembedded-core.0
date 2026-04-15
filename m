Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDCDFA0C5F
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 08:58:08 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14426.1776243297451691628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 01:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NhI1s4Br;
 spf=pass (domain: est.tech, ip: 52.101.83.69, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKj1vwlGqj2AJJEjrJMOLQCWOx4XsI/3BJSlM5313mf8F5vxCyaZC1qNStheqIzS67zO6qSuI2XWh5NPGCQt3BKWYOqvXCLychZ9afPtY3344TeiSVPqsQ+lhLIcFM1ahieYa43WQTGcc2crY4mBJxoEWKR85mI4A654LUkLn0bIZ0s8gnUDvFZzvuoWK9K+2Wnip5QqbcL3FASfP/jZzlTzkgbgYhqIJcmu9ZOKdO/OQkHLmw/KdzSM+sbLpO99Mx64VELm2dTNwZFkHnjDirTQZcg5/7xWhJtPjxWtUdiwBEQmSoZNM6lQYMN3z/+HQBUVnek2+MgqIOO79YkQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/32iSack44m/E+zLwfrjjgxZV/rtuVB2IMmyZ7ze5o=;
 b=Ci/4xJW4qG2RjnH70sDZE5J0+LdCotfHob4sYYGrrd2y+3Akiz9AmP0tdosDgV8pBS12oQkNzDten/HYUQN7esf5Z30SwzIOqT6DSdw1b59xoPGI0XOhW7ZAwisO7YDMCygDt/aVryP3sOjFREdZVqbFbrPWGPypwruP85JxjRe3O354rZB+wD2e4uQFgzmmT9jU2/VcTbJ0GJR/Kzvij8S1ARTG/hEOUPcmmRlDP2AGcjQX0j3z8swJclt18kcOlxSxwWbkUUZ6iN+ErBaNIZw2+EuPWxBSgr244oXLt3ZqAzudvwiDUmKOAlCa17lT4msEMqUROlip2D780/aDxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/32iSack44m/E+zLwfrjjgxZV/rtuVB2IMmyZ7ze5o=;
 b=NhI1s4Br+mhlKmsN736IfdEOlWBGKCt9i6RoHea0GwmJlfgC6PUhyi0FCkyZv7L37nALu7GP2h4dHbtDVDEbcDHJQB9fG/7Rwqn1JSl1AYEEncUTkTuzLJT6TTTfLuDkwX9auGrWbPptZUQczkfA2VxAR0aFnVQ/Hf5D9MXzbA0zaSMH8+s8bzDanthC5xoFrqsUC+RYG9pcPf69fU6cBzN/sozGeszfa4OyZ20spEVc35nKHD4jHSBVmzj4dmir0sv6JfJb+FG0StCVCNEWASR4DL86BPZNaNFtcL56EONZ/g9KcMiUfi6Y7qzuM3hrbVqM4UUw97gIWjH6LzgI+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by PA4P189MB1200.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 08:54:52 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 08:54:52 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][master][PATCH v2] vim: update to 9.2.0340 to fix CVEs
Date: Wed, 15 Apr 2026 10:54:42 +0200
Message-ID: <20260415085447.25869-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0317.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::22) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|PA4P189MB1200:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c65b3e-3f4b-42e7-a2be-08de9acca89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	SlYvPSPB0Kktk+zyWXUcITRpF6iS7khAJGI2S0nckqOBS9AexAzYF09DDCsn8Zrrjb+5EoqOJhW4CFDVW4lYm32C9rti1My5BJSSg4M9rS45IVAiUy/F/DH5nhr6vLSSVa7fc/2XPmaHslMnTRogQWbIVqxBkX6Ka5JuHmYpE8+nTsdkgZpYfi1iwmrJlpXhwGfxmpNoORVBhkNZrImDeOSqluUWqYEq+4hVi4tqSDNZZEJ+FYIRKVlMoBIBovAR3Z1YWWY1phBPqSQHzeKYHhcp3euzqxutm9yKZDE3XeLe37TMmuHiN6yMlnhbAuQs8ajtXZlNGGmH9OmlN2Y3WpgJliFIc50SKAf5mGeuZcgQdvXgCCOo88XKxje/n0a12mQrTmR7U4ajibX6FIIBlEmSeivqf80iuU92dZAi56stzQdvoiHefBMnff60A94m/gUQ+sJRDXXWmu31PwZADLMhsp0UfZhCozqFh/zggHjZuzzllj7und36VUy6IIiHZllck6bkNpzfY4T4ZsgjdYs/AVcBs2khL8VoY4i8UV9j/+qku3xLmwSgn4VXp6zYFbLv3OQAKJll2xjT+9h7wx60nOwBQJs60orN8nZbqXbrRFijiIvxIORBd0cZYIp9WUdmQYK669O5C5hoTdZyUTwMmky3DYFU5Yu/AG9kDlczGwbKzxZypqwzn2we4B9SMFF4QOsgkNy7bmthxlOGh+DeOvXbLn7lfmztAot0tu0kwzVID7L9hSmgr3n2RHGK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fN6yWzhGDuxvWCtYaYwOZwJFQ3esqB9YmBKhUa9BNXgY6vezwkvRaRHcwL8e?=
 =?us-ascii?Q?273GGml4YDE3GWeVIVfNSXmwMQjNqeCRRQ1aqvYynm9nCOdZcW342XfcIwsa?=
 =?us-ascii?Q?aMmRvG9tiaKvqu/1J7HWqHPMps6FzQUORFdORrkHmSpG86F0FTJvHgORY038?=
 =?us-ascii?Q?l6uTDgVALFy7ng76yb+RKSJKUhFjWVcc1idTnIHWQmESL0Ytt5m49f1lEdBf?=
 =?us-ascii?Q?JteEnLVigUfFTpBUaj/Y38o67ce/vRoQPibJOXyYUAW44OZLRLZFemcolIEF?=
 =?us-ascii?Q?sHga6E9R3tPRXkWYH+0N15zPSiCufh3ixyCGINLrX3X2wTCr0J9TwzjBd75n?=
 =?us-ascii?Q?tUHUqiQkCDpPIbSP8Hhqy35mZuOLGc2P/rMEorGOl4I+m62ODb4FdFsIdW6D?=
 =?us-ascii?Q?MiW63knQx7pyu55+oHa2mM8+cNKDOipzVhmcF0JknrZTqPcMpmn3/Gc7ubjS?=
 =?us-ascii?Q?ri1lCyRIrAbQgU82XailBt3mALSJzsDyPSFoYvRlVY8nIKTOBZcl2QDW6OrS?=
 =?us-ascii?Q?kHtaa4ZC7pYwhwl5jls6oquJ4whD8neJumJO9N4N/q8Fv7xRJQMd04m4LMNg?=
 =?us-ascii?Q?mRG0jRy1Ttqa3hvYchVcnK8B6CvPqn9PRBqcozKePU0FHXk95ae2hPt+7jo4?=
 =?us-ascii?Q?kRzW+q7PJO7AFnrpa07EtIECGweLkd2c12UGwSgMqkRhA7drkyNRC36zSJym?=
 =?us-ascii?Q?5ICaEUOg/bv7K+0qbb+dVe6tRKd7+SizTl2SinXmzHplxOZgbaNYouqSHFHC?=
 =?us-ascii?Q?RAbA+miYKfP/RPAwvPr9yJYyBTl2eQmVMcg/W0OU495tD/sPHRTaC9OBYaJ2?=
 =?us-ascii?Q?E8hDFWnH6jvYClPXurfV4SR/HXYgZiAKsMClvvZB7zepEDGXjOSt9KhnaiR5?=
 =?us-ascii?Q?BSbfN/idKYHkSJ1BWAL6zlcBeQhruAScQ0HOIE/l2wu7QgGawKohJd+Bx6dM?=
 =?us-ascii?Q?dkq/K+UgqMmjzdkr0xmSXve8407qGCt+scvubUo9kiplw5ZERVADMK3dpIho?=
 =?us-ascii?Q?jdg2F3WircvvpfomYZIdDuIEhUQeKDAsPGW9v7+YrrrFI7zuKTK0mN/Z6Nw2?=
 =?us-ascii?Q?cKEFWfsJioPW0KYTJHctJ6T/EozXvpoEAXel0Yme+AsV+lU10Xkb/mYpNdY8?=
 =?us-ascii?Q?OZppmk+/G3fnbVHW2DgICFMsffgVSnhFoh4oQowxEmGKbO95A9iOgzl0/Cke?=
 =?us-ascii?Q?LHnV4vfzgvSl0c4lnV+ydUpI2Lk5oPFKEM4ThOgSf6tQKs5sWAzbB7rx3oXK?=
 =?us-ascii?Q?Q7sgpWGTBLJrttNsfeRzmaAyu5ilPJn29ilqvQCi3sTMAIFm8q2aYCGhaNjl?=
 =?us-ascii?Q?dy/Ou/ceI8/GpZewVLxNrzDgvdO4reniCLlsidUc037Fg0/k4JCwTNE96L/a?=
 =?us-ascii?Q?VzTDR7/v+9nqsmCNwxId/jsiXum3Acn+R+CiHy64OR9pkr+nJcnRHpK8gIvS?=
 =?us-ascii?Q?fLS5MSzP912Wge/xdM1xj+T8Wz8km3tL2HNEtM0zu7lfkBHDCLGQobVkvs9C?=
 =?us-ascii?Q?0zYwN2vBoXS4/b8Xa/89k7h7F3idQek/Ffc6gVv31LhnnAC8PnxW761pGeoo?=
 =?us-ascii?Q?BjNikZKMXslfw5mziLIz9KP3dPM0GcImX7bSKAFQDyzy13s6WoBDoqX/I/O0?=
 =?us-ascii?Q?F4W5hV0cNQH9tVt0ejktZW+2495cLTAi/eZJNnQA8pR6Zs/HZ5t3cqk954g5?=
 =?us-ascii?Q?FjZrsbRAYxS55t+oZnpDTNAPm2+WVG5hbdylr5y1zjJNBzDL9JaXr+0NC3vv?=
 =?us-ascii?Q?Ho+/VhT7ei0B6UooyDNM5a5EFAamuzo=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c65b3e-3f4b-42e7-a2be-08de9acca89b
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 08:54:52.7861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uK36jeRoVyn7zoNJ0atVhjAXHpTCPwvqxJ/5NI60Eylq8wz8GXlzWvldexkrwu5XFaawogi53sLjF+mT7SZMRvFZDLmw+P0DHWbQZTjt6ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1200
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 08:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235186

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

CVEs fixed: CVE-2026-34714 and CVE-2026-33412

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../vim/files/CVE-2026-33412.patch            | 52 -------------------
 meta/recipes-support/vim/vim.inc              |  5 +-
 2 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch

diff --git a/meta/recipes-support/vim/files/CVE-2026-33412.patch b/meta/rec=
ipes-support/vim/files/CVE-2026-33412.patch
deleted file mode 100644
index 44d7ae6d24..0000000000
--- a/meta/recipes-support/vim/files/CVE-2026-33412.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 645ed6597d1ea896c712cd7ddbb6edee79577e9a Mon Sep 17 00:00:00 2001
-From: pyllyukko <pyllyukko@maimed.org>
-Date: Thu, 19 Mar 2026 19:58:05 +0000
-Subject: [PATCH] patch 9.2.0202: [security]: command injection via newline=
 in
- glob()
-
-Problem:  The glob() function on Unix-like systems does not escape
-          newline characters when expanding wildcards. A maliciously
-          crafted string containing '\n' can be used as a command
-          separator to execute arbitrary shell commands via
-          mch_expand_wildcards(). This depends on the user's 'shell'
-          setting.
-Solution: Add the newline character ('\n') to the SHELL_SPECIAL
-          definition to ensure it is properly escaped before being
-          passed to the shell (pyllyukko).
-
-closes: #19746
-
-Github Advisory:
-https://github.com/vim/vim/security/advisories/GHSA-w5jw-f54h-x46c
-
-Signed-off-by: pyllyukko <pyllyukko@maimed.org>
-Signed-off-by: Christian Brabandt <cb@256bit.org>
-
-CVE: CVE-2026-33412
-Upstream-Status: Backport [https://github.com/vim/vim/commit/645ed6597d1ea=
896c712cd7ddbb6edee79577e9a]
-
-Backport Changes:
-- Excluded changes to src/version.c from this backport. The recipe tracks =
Vim
-  tag v9.2.0110, so upstream patchlevel bookkeeping updates are not needed=
 for
-  the security fix.
-
-Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
----
- src/os_unix.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/os_unix.c b/src/os_unix.c
-index cf195e62e1..d767956b1a 100644
---- a/src/os_unix.c
-+++ b/src/os_unix.c
-@@ -7106,7 +7106,7 @@ mch_expandpath(
- #  define SEEK_END 2
- # endif
-
--# define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|"
-+# define SHELL_SPECIAL (char_u *)"\t \"&'$;<>()\\|\n"
-=20
-     int
- mch_expand_wildcards(
---=20
-2.50.1
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc
index 7a3c65b5c2..6f9b31d868 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -16,11 +16,10 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps;tag=3Dv${PV}
            file://disable_acl_header_check.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
-           file://CVE-2026-33412.patch \
            "
=20
-PV .=3D ".0110"
-SRCREV =3D "7ba60f17c22ef81680f25f8c3225b4edb55ddd7c"
+PV .=3D ".0340"
+SRCREV =3D "6addd6c101117706bc9b3609d3a418e26e92618f"
=20
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+)\.0"
--=20
2.34.1


