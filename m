Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA55C282C5
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 22:30:56 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.84])
 by mx.groups.io with SMTP id smtpd.web10.1447.1740781852735994171
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 14:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Q4Di01R7;
 spf=pass (domain: axis.com, ip: 40.107.249.84, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0vRBcdmExsk6s1C2/QEPbmFtEHljKGWVPyGzT3oT8tc7VD100Eklf5DcoNsgzyuVY0FA+yJOQ40c01U6lqOzYwkdIRVDgJHuYVMCarCRFyx88vRegiGNLxN8wIEPTl6+vp/K/Rhlu80p77KVjuvREc/of2gUrUiHgOPSyHCBL0t6IM6Ubvv+eY7IWHe+QER4Z/cezezzsXQw/+0GCl3ivHm/uPLRD8l9ugbRB1r2GC3gEXKfV/fXk1wEZ4WmrqK1WIr339yFpYmyfU3XvJIUTcd0J2pZ0WzTQQhKIOId8IW3v7ZtwkbDjF98M4pK1J2pieM5Dk9AdcKRikasxtDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoUB7DZWMjt0D5CR6k12keV3fayAF65J8wIjWlikRaQ=;
 b=wmJAdn32++zkTOGL29FiKOG5ZlMmZML8zs2HcVBVjdXpnIJ8eWIwva2xl0TJoEQcHF+FnJSZSdvPrRfUIWtt3zc4KLFdWgt4e5+IfhClfUjkXX0v/+POwIrmA5jbUgQ1lx7I3Scm95yhr+JMiGZJJZE0CC1iEeBO/LQMZCYnLeM3sNmcepClwpIqSsXgFsAkq8c89BN79PU7/eK/+majXQhRFIN89MZnhEnSQJMqDNIv+fpDyPmRrb/EICi86bfyGZ0gbzxRCfbmYtffoft++vVScQwTgZFHFKSnhsY9pUWK7F91VgBz1czonhM7CB0oXMbuodRoO5g4/3Y3QZOfgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoUB7DZWMjt0D5CR6k12keV3fayAF65J8wIjWlikRaQ=;
 b=Q4Di01R7pCDZQ9oiQkb9kJ03OC50PX+vqvnkEhX1hF696FJKLhbmcx8HipBq7n+JKEvvc2Ed5iG8W9NMN75hTaynlCx66QifbPaJLMFrWHwOzBmT/AIQP+LYG+0xsfop1ESusb7EsWqc+CjmiwAKJAGHI4YQlybvqriNdIC+D60=
Received: from CT2P275CA0082.ZAFP275.PROD.OUTLOOK.COM (2603:1086:100:27::8) by
 AS8PR02MB10318.eurprd02.prod.outlook.com (2603:10a6:20b:63c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 22:30:47 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:1086:100:27:cafe::60) by CT2P275CA0082.outlook.office365.com
 (2603:1086:100:27::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Fri,
 28 Feb 2025 22:30:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Fri, 28 Feb 2025 22:30:43 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Feb
 2025 23:30:43 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 28 Feb 2025 23:30:43 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 20F9763
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 23:30:43 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 51SMUhQ63902440
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 23:30:43 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 51SMUgjw3902439
	for openembedded-core@lists.openembedded.org; Fri, 28 Feb 2025 23:30:42 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] fetch2: Revert decodeurl() to not use the URI class
Date: Fri, 28 Feb 2025 23:30:38 +0100
Message-ID: <20250228223039.3902407-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|AS8PR02MB10318:EE_
X-MS-Office365-Filtering-Correlation-Id: 790741b5-b6ee-4d92-f26c-08dd584789ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wFE4PklCz2oFb14baaip+DorCLDvPmvQY5BoFgVd55YbvtQpZHHVAa5Nxp/e?=
 =?us-ascii?Q?Ef+mbrC9wx6UoY1664tO1X/KgLrybpSNx6AONXfX9vpjFfUpyGVfOSAco072?=
 =?us-ascii?Q?ittAa9uSJT+dWQ/N2R9iKkb0DWxJh4atbSrWfpSJ+5Sk2dD5Cw4WQTtpoMQT?=
 =?us-ascii?Q?tzReHHnFReLemUjcqunv1mJ8WEOtSltwDUGtfDoBXVIxFLVhUpuw1VPoYj5+?=
 =?us-ascii?Q?m910sqWXHuU9x0/2s/l3spt5hkFpWf0FS00oe356ijjG5Q4an2B+txwti6YG?=
 =?us-ascii?Q?9M3vCgkLToSkPqbz9fI0dYhYh65/y3ndYRdlcw14k3neOomOI5Fx2aCc4TiH?=
 =?us-ascii?Q?ptcthEpt6LHc6Os0KicQbMKHIcQFRffHxrvaH/U+jcQz/NmqyO4mDP0HAjiO?=
 =?us-ascii?Q?kW72rWH/r6XKvxuA0f8U7HJtKs35tlCZeHdLkdIFIIccQ7unlDd5gFuJEs0a?=
 =?us-ascii?Q?RoTkxSs+GqRQ5TAp2oQFn0GtaUyBCWvUl0fXWJUM47ubO31En+K6bcDWfEx8?=
 =?us-ascii?Q?aFIq7eJo5THHArLQW6wGr0KHKt1Lex7Pq12b2JCreKAy2Vn4wK+jhX9urq7w?=
 =?us-ascii?Q?63rPawuErakPIVKg7wFe2gXbg6qBM/z4wrLGAlsfFRoBzy1zowAZzMNJS/yD?=
 =?us-ascii?Q?n9XqaORyjqoiC5R3QEcoOWXgRpF0LK720BCbyMOSb3vK+dfK7/8e3vPkRMND?=
 =?us-ascii?Q?XQo72/991joDQRsV59Vw0SlB4Y0rpy+alVGYz8T5ZoaDkgY6/WvSxZiJcahu?=
 =?us-ascii?Q?yqcD1rGIJ1PrCAHW3hwpwGyaVajVTWefRKXEBUqc8caP0h6jk0phhAM6MTOB?=
 =?us-ascii?Q?9cQVyzxaIggjPHFwCVoKMVAqcmihYMdAwLQFDed9bG1HaGRkSj7174+HFI12?=
 =?us-ascii?Q?uT6Plo/Msslme6sKABI02prDCEJBOhr/eW7CP5Z6pT0zHeyDMoSAYc6GzG0Q?=
 =?us-ascii?Q?1aIsG9PmQLbbnnCmdXz44rNiVOSOmg/xJ0qYkVEyRHZCmV1Md/zSAJzha1pG?=
 =?us-ascii?Q?4hZ/hgYMHOaHYkPMcxNoeDixBqIGbZOsiLy5mf8b7xueq+v8xOyDibTZ9WoE?=
 =?us-ascii?Q?257J7RqYTbfVZikU+ximf0AXWoMl9jUhSMbClMvr795NxXdm1wVT517ofDH1?=
 =?us-ascii?Q?S42BHwcmufEyebu6L3rjd7s3QxutUmftOXFz7E7vN5GIELW4+ALjjCm1jcFY?=
 =?us-ascii?Q?1K3aSVIkcGxuPL8M9TfEP2a7Tl1/5j1kOSEotp058EjYqx+NILiXHOsryXT/?=
 =?us-ascii?Q?DOyxnMeK2uP0tG0zLxehBl8/Vj6+4TI0Jpez7fK/A0WM3Nx+OKYgPiNv3MpT?=
 =?us-ascii?Q?knNX53wftHzCrJ7eGoGF8+Ye3/vMD+GmDaOCkRxILCbpytLbNkARgSJbAvAf?=
 =?us-ascii?Q?bXdH7aJdpEGN24UW/jQ/sJkn4FJIG7M7SWISEXSDpLlyOWrZ6gik3IYsL2IW?=
 =?us-ascii?Q?P3V0ACQsBzj0VYCwxHvY+APBvqiD7oIXCJZ4epswPLyLHYkmFaAGbiEH7itF?=
 =?us-ascii?Q?VHsqVsi2GpTYa7M=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 22:30:43.5848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 790741b5-b6ee-4d92-f26c-08dd584789ed
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 22:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212081

This reverts the recent change of decodeurl() to use the URI class to
parse the URL instead of doing it itself. While reusing code is
generally a good idea, using urllib.parse.urlparse() (which the URI
class does) to parse the regular expression "URLs" that are used in
PREMIRRORS and MIRRORS does not work. A regular expression URL
containing https?://... would be silently ignored, while a URL using a
negative lookahead such as git://(?!internal\.git\.server).*/.* would
result in a cryptic error:

  Exception: re.error: missing ), unterminated subpattern at position 0

The problem is that urllib.parse.urlparse() treats the ? as the start of
URL parameters and thus stops parsing whatever part of the URL it was
parsing.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 bitbake/lib/bb/fetch2/__init__.py | 46 +++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__in=
it__.py
index 93fe012ec3..464b9ee4c3 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -353,9 +353,49 @@ def decodeurl(url):
     user, password, parameters).
     """
=20
-    uri =3D URI(url)
-    path =3D uri.path if uri.path else "/"
-    return uri.scheme, uri.hostport, path, uri.username, uri.password, uri=
.params
+    m =3D re.compile('(?P<type>[^:]*)://((?P<user>[^/;]+)@)?(?P<location>[=
^;]+)(;(?P<parm>.*))?').match(url)
+    if not m:
+        raise MalformedUrl(url)
+
+    type =3D m.group('type')
+    location =3D m.group('location')
+    if not location:
+        raise MalformedUrl(url)
+    user =3D m.group('user')
+    parm =3D m.group('parm')
+
+    locidx =3D location.find('/')
+    if locidx !=3D -1 and type.lower() !=3D 'file':
+        host =3D location[:locidx]
+        path =3D location[locidx:]
+    elif type.lower() =3D=3D 'file':
+        host =3D ""
+        path =3D location
+        if user:
+            path =3D user + '@' + path
+            user =3D ""
+    else:
+        host =3D location
+        path =3D "/"
+    if user:
+        m =3D re.compile('(?P<user>[^:]+)(:?(?P<pswd>.*))').match(user)
+        if m:
+            user =3D m.group('user')
+            pswd =3D m.group('pswd')
+    else:
+        user =3D ''
+        pswd =3D ''
+
+    p =3D collections.OrderedDict()
+    if parm:
+        for s in parm.split(';'):
+            if s:
+                if not '=3D' in s:
+                    raise MalformedUrl(url, "The URL: '%s' is invalid: par=
ameter %s does not specify a value (missing '=3D')" % (url, s))
+                s1, s2 =3D s.split('=3D', 1)
+                p[s1] =3D s2
+
+    return type, host, urllib.parse.unquote(path), user, pswd, p
=20
 def encodeurl(decoded):
     """Encodes a URL from tokens (scheme, network location, path,

