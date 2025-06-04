Return-Path: <y.moog@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CA8C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 06:51:58 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.90])
 by mx.groups.io with SMTP id smtpd.web10.10159.1749019913266308159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 23:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=gbx1rP9U;
 spf=pass (domain: phytec.de, ip: 40.107.241.90, mailfrom: y.moog@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEa4KtTHxPhvuZIWDULLoDOYNwGvWaiAsvYDcAjKqSLHIlPHJ49hrgABzWD1DWhksI4r1wkABXhV5V55Q5tQQCPISd5o2kiy04a6J1CvsxOu7IR06oDKHS6UEoEBXgNvymjUaeEv66PfWjZkZzk9VzTOFJYaD2q2fQvnHWhQRYhKUk1TXvu9yvKWV4Q4M4yfyxW/jJWoS4wP5EIF94Am+fbDI7bjqwtC7SkgQqzAUIY3c7/yNdiiErgNQI3YuFv/i3ZpBc0mHSDkRKbLkEZCSX40gO0FaUyDAfVJAHxonM6gK7mcoI5zZbolq9OEFz6p4djz8/hoyHifW5q3f8DbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBy5vmiO4CjcbQDahGl9iKISY8M9dYB5cwME3ryrSTk=;
 b=RPWdu7+PrXFE1O8ha9MzB1Hkuq5As4TDQ+F57nOLNo5VNOvwvk19oKVgYDx+2DleERdxlAYfIwSEkD7UFVXoWKYpk5g6nMEvvUVYQu8jSIS59PtV2A3BPaIBeph5ZCh6Mdo2ncPqgQQ3uerEPWt+P4U7N1MhSG8KUvoHzAij+dG+8WbM1+grZvjMD936467aabG7gjpzMWPMXQ6ighzpRnIRnXIE2VBRL3FflcNFiJw7PVwgJeK1sOIA523RuIUeWn+W05o27HMxa5p2YcR+gCEeOFQiBin25dWbjvzb5bClDTs0PxoQfjsCeqhz4ZH62vPxb6WGlFlVko2lQr6xXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBy5vmiO4CjcbQDahGl9iKISY8M9dYB5cwME3ryrSTk=;
 b=gbx1rP9UAiomUjTzPUJvKAHLM9VSALKlEc2QA3gBYbhIDHFZ5dKXxH5d/VRMkGKED7kxFUp5jtABUrTHM1jd209DVRPGzpRMLzDsMwMwVWRHXAR78Vwm14RRzV8adqCjfBCAw/Wl1t75TwExFiO2NEuWWEGA7O1XDyHTXnaNi3QRSjNh9tZdOSr1OlYVc9oXUvSocRB7+9+H6Y5qe39aGdrghbapKPto8g+evIoB02y2c0ZAkO5GmaQ4o1FgEnLoYnKiWq3nUxPkHFmWqkTULX515cANGgZj92jWpWKnqbZOSJGuMsyZV1PgerRJFYa6oC3GCSdMSKP3QaRHsuz7Nw==
Received: from JNXP275CA0024.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::36) by
 GVXP195MB1662.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:6c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Wed, 4 Jun 2025 06:51:47 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:1086:0:19:cafe::6e) by JNXP275CA0024.outlook.office365.com
 (2603:1086:0:19::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.29 via Frontend
 Transport; Wed, 4 Jun 2025 06:51:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Wed, 4 Jun 2025 06:51:44 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 4 Jun
 2025 08:51:43 +0200
Received: from llp-moog.phytec.de (172.25.32.81) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 4 Jun
 2025 08:51:43 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Wed, 4 Jun 2025 08:51:23 +0200
Subject: [PATCH] perf: add arm64 source files for unistd_64.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250604-perf-arm64-unistd-v1-1-97d3bb08927f@phytec.de>
X-B4-Tracking: v=1; b=H4sIAOrsP2gC/x3MQQ5AMBBA0avIrE1SVIWriEWjU2ahZIpIGnfXW
 L7F/wkiCVOEoUggdHPkPWRUZQHzasNCyC4balW3yqgGDxKPVjaj8QocT4d9o7U1fu6N7SB3h5D
 n53+O0/t+t6XRKWMAAAA=
X-Change-ID: 20250603-perf-arm64-unistd-9344a6fc96a7
To: <openembedded-core@lists.openembedded.org>
CC: <upstream@lists.phytec.de>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749019903; l=1975;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=BU2TW4gcDvCimwgQkv6nL3fGEALFh/O26Pj/NXKrvEY=;
 b=z+QzInbZgX/pBaKfzvzBcc0Kp5Oc53jb837GSHPsmLAYBvz1ml1Hbn6YzY+fmiSfY7keVYQL7
 h1HCC1WUxQTBEDMdxRFgY38h5vham4p4duuB7AJW5EB+8syf9NbNBBE
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.32.81]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|GVXP195MB1662:EE_
X-MS-Office365-Filtering-Correlation-Id: ec553feb-da77-4486-5def-08dda33444ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SldMNjJmcTlNYUtJWHVDc0FGNDIzRENTVXlzKzFJQ1Q0M0JHWjhxNFkzV05k?=
 =?utf-8?B?YWtNaDViY2xQS1dLVWJuNlJVMWRKRjVVemlSemJGTjZoRzFieStEeDBiR3J0?=
 =?utf-8?B?cGVLMm1lOGdubDJ0bTlZUjg3ODVQN29XQUdQeVhwNjJsZHRQRGZQMzRveXMr?=
 =?utf-8?B?eitvVEV5Y2pUZE1vUEFuRnFwcGhPOEZYb2RicFZFa3pKNHV6S3JFSEw2WUsr?=
 =?utf-8?B?SGFUOE9MbWZCSU45TkQ5TEpXSVIwYWZRY2ZoMTNJODFqQmpsOEdETFM0Qkpj?=
 =?utf-8?B?aklmN25QdE1JN29LNHdrNjFESTJJSk1oYU1GR2dOY051bW9ZdmpuQmpTcGpl?=
 =?utf-8?B?Lyt0SE8rcWhkWnhKYU1UcDh3Yjl3YVhvTitTVW15bE1LRW1kQTkzckdDdytU?=
 =?utf-8?B?RDc2VTVsb2hleE9KR0hHREdUekc5Z2J4QXlBdEFuL0tGQmtMdzNqNmc1ZmxM?=
 =?utf-8?B?Qk1LV2JrMkgwUjZ4TythR0RVQUhNby9wMEpFcWllVHlxcll4ZFFVMWNtUWNq?=
 =?utf-8?B?WWFncnQvN0pwZm8xYnhDVWR3SjhWVGFVRDRmYmdNUTBJSncyNCtPeGZSUzRw?=
 =?utf-8?B?RVVmaVFDa29QWHQ2ejAvS1owa2N3OEpuWTFhYytDZWtyTDJnS1ZIZVAxUWhS?=
 =?utf-8?B?YjR3M3IySmkvYmQ1cGdWa2RPNDkyZGMyV29PWTREUlBseVB5TlpkMC9nVXZ0?=
 =?utf-8?B?Nm5KVUdMbHdUUFdzR3Q2dGtFaDZYdEpWQzJmK1JUcXZXeTY2VjJjLzlwbm1U?=
 =?utf-8?B?TzNFWXo5ZUN1SG8xeWpnR285U0dNbG5CcVFZN1JGdnBkSitvTEQvTXZmaGtU?=
 =?utf-8?B?elA1c0xqUFFLTnN5ajFFamUrcmVmUmdrekxsY2VsNjVGTlltRHR6VEVXSzVL?=
 =?utf-8?B?MEx3Q2xyU1dJMGNWZU56WUZvb3BwNkZkSGdhaDF5MXByU1BqVm16Sm9qN1lO?=
 =?utf-8?B?Nkh6NDhHcStmWTFqa2YwWnhtV3c0UTluNWhJbWhTcGpGaGMzMTEvKzJUbWxP?=
 =?utf-8?B?NGMwWmE2dUxnZm01OU5nSGlRbGdjaExXeVRsT0ZZUksrRVBxRWNkb3NwWmhK?=
 =?utf-8?B?OFFrbTRBWGNxUWc0R3duRklFK0w4aEZaaEI0T21QM3B5NVRvUlhWSGFGL1FW?=
 =?utf-8?B?Sm1wTHN3Mm1FdWJUVWhkU3o4Wm9ieUQxalhuRU1Fdlhyb3Q0K2loZlZXUkhW?=
 =?utf-8?B?MGYrWG1HNVBpeXFzT0Q5dlRlK0d1NUE4UjlsWUNFN3JvU1FVdWc0K3JWbmFJ?=
 =?utf-8?B?bUI1MzVLSjg5S3B5amwvc2FjdlQycUlnRUIyNW81Mm5FMWs4bmJFR0VvZTlI?=
 =?utf-8?B?WTBpT2s2bHFxN3JnZklmS2ZxK3B6TUVIQ2hTVUtzTTJ1aHJadVBoSGFKbWZq?=
 =?utf-8?B?cW9OL00rVmtLakJkNkVFTDN1VnpmVWJWcnZDSk14RllCWFM4UTArbXZHWEx0?=
 =?utf-8?B?K0ppYVU1VVZsdVlJakFhOWRlUXhRNTZmbDd0RTNpRXdpYTErVG50OE9IRzQy?=
 =?utf-8?B?Z0JtZnlMZ2E4M1JqbkRMUEhucmJtb0ZjNUx0UmhkdFJKTnNSL0NUNnBaMUFq?=
 =?utf-8?B?REpJYTN1dHhDR0VqWnFGUy9WVVJReHhkaS82elpEaU0zMXhKaC9LYVRzcEZY?=
 =?utf-8?B?QTJQekhoTnZsODAwN0JtdnNXQlRnNG9peDhvMldQM1dYN3EwTTZzYmJpcHR6?=
 =?utf-8?B?TnhESXlBUnp4dmdoMXYxdHRwRWhWS2UyV2duY0ZyL3ZKOUxKV3Ria3d3bEdM?=
 =?utf-8?B?VTkrOFo2ZG5nMzB6TFVWQzVrMzZHUmFWWFIwNlBXdDNPcDc1SzhMZytnb3Zh?=
 =?utf-8?B?WjNJQ1dWQ0pDNUV1Qnh5TTJ5ekJwbEJoSGpnN2Naci9zVXV1QTJiVzhqQnFC?=
 =?utf-8?B?aXYzQlJRRVpWaWpzbVA1dHJOSTFZV2RWWkJic1pOME1Ob3VEQVVaTG5reFpR?=
 =?utf-8?B?eHhJMkFCejR2NEd0eXh3TlQwSXNhOTBhY3I0cGFkVlJXRFptek1FNFJ3MjhY?=
 =?utf-8?B?MGp3OGx5WngxT1BzMEl5Yis2YXF2YjdseXlKQkszS2xjN3FVU2xLZkw2QW8w?=
 =?utf-8?Q?8QPXH8?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 06:51:44.2745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec553feb-da77-4486-5def-08dda33444ba
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP195MB1662
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 06:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217839

kernel commit bfb713ea53c7 ("perf tools: Fix arm64 build by generating unistd_64.h")
introduces a new dependency on source files for arm64, specifically
include/uapi/asm-generic.

Build fails with:
[..]/perf/1.0/perf-1.0/scripts/Makefile.asm-headers:33: [...]/perf/1.0/perf-1.0/include/uapi/asm-generic/Kbuild: No such file or directory
make[4]: *** No rule to make target '[...]/perf/1.0/perf-1.0/include/uapi/asm-generic/Kbuild'.  Stop.

Add the directory to PERF_SRC.
Fix whitespace error while at it.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 meta/recipes-kernel/perf/perf.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 0d19e1bdc222da26a5ad0a1d4964acca437a6692..d7a81b5802dc655917c2adf04472b8e680380ec8 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -151,6 +151,7 @@ PERF_SRC ?= "Makefile \
              arch/arm64/tools \
              ${PERF_BPF_EVENT_SRC} \
              arch/${ARCH}/Makefile \
+             ${@bb.utils.contains('ARCH', 'arm64', 'include/uapi/asm-generic', '', d)} \
 "
 
 PERF_EXTRA_LDFLAGS = ""
@@ -208,7 +209,7 @@ python copy_perf_source_from_kernel() {
 do_configure:prepend () {
     # If building a multlib based perf, the incorrect library path will be
     # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In a 32 bit
-    # build, with a 64 bit multilib, the arch won't match and the detection of a 
+    # build, with a 64 bit multilib, the arch won't match and the detection of a
     # 64 bit build (and library) are not exected. To ensure that libraries are
     # installed to the correct location, we can use the weak assignment in the
     # config/Makefile.

---
base-commit: 343dd7ae4a177111e75f51f6d1ee1ce254f99e9d
change-id: 20250603-perf-arm64-unistd-9344a6fc96a7

Best regards,
-- 
Yannic Moog <y.moog@phytec.de>


