Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77E6C5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 08:56:47 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3788.1786525002934325218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 01:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=in/w1efS;
 spf=pass (domain: est.tech, ip: 52.101.72.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlhbT5NbDjQORz7HS0SNE7zG9DBwfKCIl1Dr/CRCuPoRYpTw03yeJh6WqbXrC5YB3/k7qcepFeHRzUtd7hHfvxFztmJ2NmhUoFQr4CwUKMw7W7iWdC2IfpTYtzK9VgANp4y+vMBIULuD9DthOy5M4Zz30+KqBz8kmpTIqFbqaGXx7kSDuFZtdz/Admjum+9re/iQuU/Ai+xUGeP3OCtWzzLaHYMMRjmDCQ+lkxnvm7iHSAJxacVohz1AbAKxshIY9uepqGM7nb7GMita8wps3mqLOZNfv62+FGixdVTzE0DNdFnM9Ey8m/Wq2RlycK0S3uWCUoO8M49aCUhurXQxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k016dotZNPOoAj4lrAyLUzX3Vw1Wn6LnEeShzxNgnMs=;
 b=KTLfjiv5d3eaTH9tSuNy5xMi2iKmbJGJOl2W5pE0VXLAKtz+C0hzS60WN4RHmXt4kDAp5JPxtS4e1r4bYR50cw1ldxMwhu9vn7dNc54dIDZBK1OBYmWKCc0wGS39ouac9f2rjkAKE0TUQIi7JNSom/9z6nkqyR3oxKcdE3Cdbn765MZg6nGBqfHrQHIW23pULggyn4KdpjPFfV78FlJ8ypAtY9sLsiyXwYKp0VRLWIa4GC4JynIkKAKd949Q+e+l8dizsswjKBiGXEu2rA9JJST5EGgrVubyS/Shbaqg/DtW5q2hUXgci1KFyN8eyNdypebMcGyMHUmtfII+sUAOtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k016dotZNPOoAj4lrAyLUzX3Vw1Wn6LnEeShzxNgnMs=;
 b=in/w1efSux85xQHh8tp4j2jj0OgALAQDmsUKshMs2AZsU3AwjfrFT0O+WQdtzp6L9FHTAEekpdzwhFY1qpuhsRrIckO/mh6M32SQd9X6kfEjUm5z95cTw31HMl4rt/h7fjJSluLsFTzq1K3Rm79JL1ip9RaNv7FNPz7LShFVCGrRAddnxkiNb4hJwe8aaGDhuHWqry+1n9zW7+J72IzKFsXZK2HXa+V9Y1AWT7pXgIx0IXRXvkgbxuyc8O2OQBLNb2yAl6HDbWAEN650ypfs8x0tqOf8rKjM1N69hZ7o2Pe3/PVxU08MyiPTmocPcRHS6h19g8OAQQCv/2LnMeBaEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU0P189MB2475.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:423::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 08:56:38 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 08:56:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v2 0/2] binutils: fix CVE-2026-15003 and CVE-2026-18220
Date: Wed, 12 Aug 2026 10:56:31 +0200
Message-ID: <20260812085633.22846-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260807140902.4732-1-jaipaul.cheernam@est.tech>
References: <20260807140902.4732-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0196.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::23) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU0P189MB2475:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed43e87-92f3-4212-19d7-08def84f9eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	j46n/ZUo1H78uTgg2t3XPMjrJ539UWYMs8PJXmtQT4y4rD0U9boHSsv67qF5VN+i0grCIIu+dXMtYXal0+69FdTU7iVmL6E3F3QbmqjD29Jriwqzo0RJSs8x07peDNQgdGvFhPSFxaEO+plt7qZ7Gu94wjmAvh4/gIooEyJMaoj2JduvzzZxEnLTlkrXGk6g18vYhAJccY7S6W7s0jM+dcYdZ5mjzcEvb/Fiq0w5QGT1Xe4QdXLuev5P/g4F7V5hXPMxhBr9t92ZX/I0QKgzOOv2kiCSAjpDQirDUhA8+PQhCt8Ak4y0Rr65wDhQKSjwY1BRRO1GuP7C3J9/Z+aGGXDCp0pp1GhUJdkCZbbkWNNGPX/vIKa+Wgr/xnbj4Y+r1xAyDWufNNv2xwPYc2ZA6FI6sQLmgwW0Dwo3zz5thEw5LQM8DUQhvDfg/1oOGsPgSzJw54fM2U7KlDLV3Vw/yuJW9AW1m/WF3q7k4rpOsEFyC66GbEnUQziXFlmvC8MzGPdCg5h/VEZjY2dMaZ0+aHrf3pb0B9dmiktMioFJIMv/DY8qYj3kole6AaH3a/6bPVpq6fBtIpRcWILKlc/Za1LJfFVtKm2d+tbG0ktpwksiB7FOHR3YtUtlSE6IEGEu7BNmkeC467MNfo8sZl4sRpoTQBKuv5I0khiP7MdHIiw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0uQ8SH5lWiKeJ5XxpgDxNF3oYxjVyWcjaf2C2y7tC6pAw5OjQsoJEevphqUb?=
 =?us-ascii?Q?97uRzbFYD8O8Y8mmmJindNEhlOUDVAQHxsckzjvP4M8r1QLf+jHcJJpsgD0V?=
 =?us-ascii?Q?xJHX0up0spaL1MxtAdJkkMFJucXih99ixiXoJ3vGs3+OZ/499ryj3b5TQtJg?=
 =?us-ascii?Q?mNH9zBMycKElE6B3L+ZIUwzK1TFpp7LAaC3rspuAIRJxt1i7TBc+YdRvQQIX?=
 =?us-ascii?Q?88w7f2jZjfGC2iOGsdqksOkjkbK4Q90uXymmDIs8/pQtAWzeKL1htMn0Qkxh?=
 =?us-ascii?Q?HSkTw7qb0Ic4SEHd1UIG3TUtSFfAS5ukV14iPyCyfIilyKdV4+jSDMpyxSmG?=
 =?us-ascii?Q?J6BjE5HrL/hkZwILeT7YvzbT23lwM802t4FCEhFJyTic0otybtUF42fWqORN?=
 =?us-ascii?Q?T4mV6cYxHsWtk6LQyAE32Ka8H4iARIZ6JuxbbnF/7l5arv0vq/k0tZn3WstW?=
 =?us-ascii?Q?EvBLFU8EncS159q+MswaytqPy01YtAVwQrz0q2rhpPOOu09G7bvwxEmVkOAN?=
 =?us-ascii?Q?nubErKRD8AKaiMVjZ43kH1+g/Wzx12p4a/1f6dUEDFJNUqkHkTrZzv7cDTZz?=
 =?us-ascii?Q?dAEsM5qiW3RCuLYe3r3TgO2o+E/lPjUiAmqUWQ9PsGGPcO1J1jInnxaPCSts?=
 =?us-ascii?Q?CoH04r2esOkG9n0Cy3v4ue9cKX+NXFD1LnENUP82sb1UfqBDwkoqInEPZD64?=
 =?us-ascii?Q?13Qnqgiy4HgXsS4UeRi4m1Q3042qYbu3Sk97OYoBm0J3MZVo4ErkW5LOCA5p?=
 =?us-ascii?Q?0jAzonZB769SQe6lzZS76RLVIIz18JPb3qeU7PE/YWEKZNLZ5+FQ4ZsU9MMJ?=
 =?us-ascii?Q?jy6upVcB6KLEVOjFjUfP5bbVl+I1wDsIxNJWDqu5yCtbNfEPoZllmDWGXV4i?=
 =?us-ascii?Q?SdDKkG+VMV7jzGerWcr3Yruc1AYQ+V1Vlw4NqUyQz1d7U3FWfstMlXcNKg4U?=
 =?us-ascii?Q?w9weP2u10CjtV3fm/KpJgmCYYnwI9N2uqlbyebKUwoVqI1ackaU84RfP0tcn?=
 =?us-ascii?Q?cw/JgD46nX/yni0+7+VcBl8KHeCjdZaBxyi7j5rkLFaLMWw0I7SA5BE/OOkw?=
 =?us-ascii?Q?uwJyL77qQW0odBGdQlxGDQaz1VG2dnPKHnpDvOzC5Nle+GC+LH+EmGZYf88Z?=
 =?us-ascii?Q?aoMFOuUYGsDzIjxmaVsLDpy4/8txBsF2jMUs6m5ejZ6E8nakti18V9RQRJjV?=
 =?us-ascii?Q?UEJ+STSQO2Bdy4zNGGQTgHTkvYntU/ig7Y/WQnqTSN3bm0vAGPJIBWTSEUlA?=
 =?us-ascii?Q?92yJsPA3U7gg5J/SlZyg9hMIh+yI0f1ObmPJrTSl8FHh0u5/pwdgxMGqiRTw?=
 =?us-ascii?Q?uiM0BL7IO8DwbARUX+fksH3GqfA2fZgLiv6wDS709mHX5dYDdZw6IUrPupGp?=
 =?us-ascii?Q?JQ8n9TRkVcRKdB2VSa3WlCVt5d+yagFSXCyeWFmhVMs5xSAGRWFvwc8YfHIe?=
 =?us-ascii?Q?e31IHod0Ix/FYRYB/9AKF5S7kI0yikE5h3oBU5KpraDrJt4xPhy4esK9VxFt?=
 =?us-ascii?Q?Ho/QnzBYSY2DG9Ul2aITWHGm9fBm6iUdoafLYm7h9poApm6g9hN543fYYEZ1?=
 =?us-ascii?Q?Pp4K76LdRQZ6Qmp1pW6ulYZehSFqzMZz2XG4+IFbwoDEXYDlCnwKyxpH2BSh?=
 =?us-ascii?Q?WHmTIAAVKXiUH25FKsutuTCJz1Banh8idncJWeP3yLndeBDLtnBygaBo0ton?=
 =?us-ascii?Q?3nIv92qUoZnrBNnwLX/HnEsEKMoXiLDdwusQcTqqa4uc1jhSoUXnwxQlPrKd?=
 =?us-ascii?Q?6Hu32YF+TCFPb4ql7CCD8M7g8e/+YfM=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed43e87-92f3-4212-19d7-08def84f9eab
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 08:56:38.2599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zK6kpRngiYvpAmXCOASdQhUI9G0O25Dz6vMUrWjBothe+cXmS/iqRIZdmjjtMycuaWq9ZDA+0N4e+8VaRkn3bCmO3keERFv3fkYXE+aXuwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2475
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 08:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243264

Backport two upstream fixes for binutils 2.46.1:

- CVE-2026-15003: buffer overflow in xcoff_link_add_symbols (PR 34053)
- CVE-2026-18220: buffer overflow in elf32_dlx_relocate26

Both patches apply cleanly and all tests pass with no regressions.

Changes v1 -> v2:
- Fixed Upstream-Status placement to be in commit message (before scissors =
line)

Test results:
  binutils-testsuite 2.46.1 (x86_64-oe-linux) - All tests PASSED

  binutils: 327 passed, 5 untested, 9 unsupported
  gas:      2091 passed, 4 unsupported
  ld:       1899 passed, 7 expected failures, 20 untested, 109 unsupported

Jaipaul Cheernam (2):
  binutils: Patch for CVE-2026-15003
  binutils: fix CVE-2026-18220

 .../binutils/binutils-2.46.inc                |   2 +
 .../binutils/binutils/CVE-2026-15003.patch    | 402 ++++++++++++++++++
 .../binutils/binutils/CVE-2026-18220.patch    |  65 +++
 3 files changed, 469 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-15003.=
patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.=
patch


