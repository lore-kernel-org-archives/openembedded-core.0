Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536F8C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 14:08:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.47])
 by mx.groups.io with SMTP id smtpd.web10.17918.1746022073944244211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 07:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=mhDCfWBh;
 spf=pass (domain: ericsson.com, ip: 40.107.22.47, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6u+KECj5KML5RVak2cZ0uQlbNL4HjXIAY06vB/vLz40V6grPYBlUn7gHpBBLQEXmRyCsq1I/PYY+d6rBhb052KMeTak2s5QrXWMhWszzPMl3nMq5hkZ7qhJPIAr6Oor3zZteP/tckZAKRR+LUdICbdr6YexKjjWy1ovU11iVxOZAq0GfGG7I6idiRltnB5dqBtNCsRunbljTw9moMVZgQY2HwtnisghOm5YAtbrjcyuT4oOUZTjc7XPxMcjYXym8s9OwY8yM4d+o2LNXJbn3t3vZgWI57sVw64MWfEL0+KWJUbKbQnS9zHKA8aZdvDBY34beLjOtGMJk5TCLhVv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uRwcSID8sTy5Bp1xeAtPCEarAyOGRUcguyD1ePHQrg=;
 b=cEUFm0X0pQnsPIWqxyr6yKJZSKd06LtQ5rQmb8aBz+EN7VBkbE/13TrSO2wV48p5JAR89ROA81W01aQwSjp9U+x5LvryTTXQb+v9BhjLbQOtQZjrigQD7FNicZCMD5pSQWoHVq6f82+LxkGRggt0pAS5Ky1Ioybl1ZZv7jjPsWtnRxt0HXc0S5RjjqXqfURZPkqYFTRdHBYNFXg1G5a8I0pXYH4h9VjIlwJEVMwdNc1bvCYg4tM/8FhwkG5dfAXeGFpol8pmJlRIU5yDKikjxhu5ewclDESgHaFazqzdHJ21Q5uZWkq3QoGd1bmAxQopjQ068Fpk2lfcUNIg7oOmNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uRwcSID8sTy5Bp1xeAtPCEarAyOGRUcguyD1ePHQrg=;
 b=mhDCfWBhUFHS3/m7WJ4QFhqK2aVtp3MQ99bXfJ6+TH4SqrbWcpPLWCJ+/EL6hKcrfcA4tvsDirq8hnfsSxolvMVCE4b4ieSs852YBVTRSyyKfrBJKwSz3PfP4IJJUncShOGT9OCpBNpwPI80KIhq7ap7BDgC2HTFAPTQmOtMftVRzjrcFaZyf2hAHiKdTossuIluf1BkArBMPDpit94ie8CbQAv4YPI4sGsvWnqpipkLZJ44zlxWlhIrfLRgPlroqc/rvowfi4MoMsT8LU2EvNrK4MY9sDDCZLcwVu0E+9hFibIaIqn/dQMDClQlC0N0Amva/JR7tQJ0+ZT3JtPO+w==
Received: from PA7P264CA0104.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:348::20)
 by AM8PR07MB8296.eurprd07.prod.outlook.com (2603:10a6:20b:32b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 14:07:50 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:102:348:cafe::30) by PA7P264CA0104.outlook.office365.com
 (2603:10a6:102:348::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 14:07:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 14:07:50 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 16:07:10 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 2E0794020C10;
	Wed, 30 Apr 2025 16:07:10 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 1712E7000229; Wed, 30 Apr 2025 16:07:10 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] cve-check: fix debug message
Date: Wed, 30 Apr 2025 16:06:58 +0200
Message-ID: <20250430140658.587880-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C712:EE_|AM8PR07MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: cb23fc46-b157-4277-175e-08dd87f0644a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JhOTfMRNIQxokuFkZzsoLazZPI4TlpZUEhMVqczB3Nz0bNO7GDi/UFoHZ6Pd?=
 =?us-ascii?Q?b95oXmapcpcCdJxdFAbLl6E8JqBq5bz+s36M0hcNn829g5OoPwIkhpaB7ovT?=
 =?us-ascii?Q?l5NsrkGe64HMOCaX3a+pQ29efin81Zq8BMPbObo7O8nbyw07J+ThAldWJ3Jg?=
 =?us-ascii?Q?vHJzlFcnztOPrY3O+MiWUF3aWAF79oo377KqCXaoaD/rpq0BTsL67oSSfbjS?=
 =?us-ascii?Q?NG/REEB40NthT1xTeMcLJ38NMFZaqvoP0zPaJmzwqNZyBsHdp8ZEYNkf5rWt?=
 =?us-ascii?Q?ry8AO8cD9xjhMMrznVPW35agZ/vhGcghZyZAzHoaY33U1ou7T5vB/j9BwqJM?=
 =?us-ascii?Q?KhxBWI9yBo+JzOtJlYjjwb+bmGR/am2Ind+iKzYwFIzqchNUyqd/ur0PUFKf?=
 =?us-ascii?Q?/5hb9cEqYJvCLR9ZC5qDl71IqV+neDwhml7MX8KcY7KC7wxgbEmip9xwEIcY?=
 =?us-ascii?Q?lm1GVsv0z/J9p2Ol7aoKztXy3zhWKqxYWD0nUlMe91tYJjsiO87TknapjB3W?=
 =?us-ascii?Q?38Jc3950zKfiY7K4S8uG11Yit0WWWa4wEB/S0G/sw7EywQvyM9reLVDvJMpG?=
 =?us-ascii?Q?w5ChIj8kHOAQgHH1If9gEN2UY+b7/QvgacjkCZN1AOUHrIQ7t0EYQ34M/8Tx?=
 =?us-ascii?Q?JFqIlpNkWphdlmYXxTzolF6kVXrspKzXNG3aIKcy3GQvDRk2TMGcrdj3SjlE?=
 =?us-ascii?Q?x3Nfyf6xos1VCBm4S8izmN3NeFaTURfEgFKDv/sNKDiJpvNGi6ZQh/ObOHsE?=
 =?us-ascii?Q?uNFIKPmaAKSJs4Ou5OJggGCp+f0U56kRXrbEGOmur1adXY0yy7abWmjC7CDG?=
 =?us-ascii?Q?L7Zd5AvV8lMKEAbYdgvJrzGKsT0V0R+hCb4WtWxl6hKrnv5i0by3J7E+Dm2U?=
 =?us-ascii?Q?gHkJoii8pmcBZQRsiWTIMZcDfvUqWtxhWdGz2oDvMeY4ELJsTr08kZabjQOP?=
 =?us-ascii?Q?b+EJwi9lONSNpbOTGqoInKpkN9ZZexs8vZyxSq4HI+W8rEsvGSbeSjdOEry6?=
 =?us-ascii?Q?RsVu+sA2Qp4kuCF3EoDbe/ew1gWBIznEB0U7Ra3vmSsDLlxSYGdQbweSPFPN?=
 =?us-ascii?Q?876Xg9H/Xzq0LzYIgZrVKuP6ZkoNJtPPVfuA5+ZwxhHvSTV3hVZr0NsA/39w?=
 =?us-ascii?Q?hj9BqkABfiNfTU2EPDwSCc5fDktNCkY2QlcKP4a2GTrOkpWSUHS9S7VpK87j?=
 =?us-ascii?Q?l2JnoxyPjDai+kR/WBlWggfmPMfmrIrze0N7Svezx2NqA0pcXcK3cMk2L9rW?=
 =?us-ascii?Q?1BqwaPu4+pgnuPRw5VQbDVCTJ/0XKm841zBrCTvaHWMYLtA2cV4WTbsRa38p?=
 =?us-ascii?Q?kJX+jjWVS2mbVekMRbPgtpL3VcMat/LpjaqTAie/NcqBHK4D1uZ3eOG7SpQT?=
 =?us-ascii?Q?ZqqyuFsTb+o8BBU5xud5u3o1BX72jn48GleD2yI1Gh6KoxE1oy02NwukM6gH?=
 =?us-ascii?Q?yd7RxNQHvhoxmbEkGhJhG8dhSNpr2Q0vgB0K/d73AySI4r6BX+cR4P0BSfaD?=
 =?us-ascii?Q?f2nbIFwJRM9oUxW8vjwa3AKXTpyFVGfC/LTG?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 14:07:50.0334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb23fc46-b157-4277-175e-08dd87f0644a
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB8296
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 14:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215749

From: Daniel Turull <daniel.turull@ericsson.com>

Debug level was not added as a parameter, causing a warning.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/cve-check.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 1aef00d297..c63ebd56e1 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -277,7 +277,7 @@ def cve_update(d, cve_data, cve, entry):
         cve_data[cve] =3D entry
         return
     # If we are updating, there might be change in the status
-    bb.debug("Trying CVE entry update for %s from %s to %s" % (cve, cve_da=
ta[cve]['abbrev-status'], entry['abbrev-status']))
+    bb.debug(1, "Trying CVE entry update for %s from %s to %s" % (cve, cve=
_data[cve]['abbrev-status'], entry['abbrev-status']))
     if cve_data[cve]['abbrev-status'] =3D=3D "Unknown":
         cve_data[cve] =3D entry
         return
@@ -288,16 +288,16 @@ def cve_update(d, cve_data, cve, entry):
         if entry['status'] =3D=3D "version-in-range" and cve_data[cve]['st=
atus'] =3D=3D "version-not-in-range":
             # New result from the scan, vulnerable
             cve_data[cve] =3D entry
-            bb.debug("CVE entry %s update from Patched to Unpatched from t=
he scan result" % cve)
+            bb.debug(1, "CVE entry %s update from Patched to Unpatched fro=
m the scan result" % cve)
             return
     if entry['abbrev-status'] =3D=3D "Patched" and cve_data[cve]['abbrev-s=
tatus'] =3D=3D "Unpatched":
         if entry['status'] =3D=3D "version-not-in-range" and cve_data[cve]=
['status'] =3D=3D "version-in-range":
             # Range does not match the scan, but we already have a vulnera=
ble match, ignore
-            bb.debug("CVE entry %s update from Patched to Unpatched from t=
he scan result - not applying" % cve)
+            bb.debug(1, "CVE entry %s update from Patched to Unpatched fro=
m the scan result - not applying" % cve)
             return
     # If we have an "Ignored", it has a priority
     if cve_data[cve]['abbrev-status'] =3D=3D "Ignored":
-        bb.debug("CVE %s not updating because Ignored" % cve)
+        bb.debug(1, "CVE %s not updating because Ignored" % cve)
         return
     bb.warn("Unhandled CVE entry update for %s from %s to %s" % (cve, cve_=
data[cve], entry))
=20

