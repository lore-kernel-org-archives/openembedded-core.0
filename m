Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9BCC282C6
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 22:30:56 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.68])
 by mx.groups.io with SMTP id smtpd.web11.1399.1740781849425442209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 14:30:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=K7wXNdLx;
 spf=pass (domain: axis.com, ip: 40.107.105.68, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weGUvPRkWX3eCGq+Pk/qiRaUGY5aKUmzt9NKSnn87nYub/+ETHWHMiF1dR9/tTT+olGXU6HBd0actOCtY2gjSkth22RA+nwocBoQI/UuXLWq5J0K6OHT8B6HB7nz4szj030XfiKg1nz3G5UI5n5slrMt4Bto+fvLS20n8c8re2NQrqd12U8V02afseC7dep6tvvjkSqNA4HtFuXDSQ0p3pyn1vBs3gGAzR4O4K0dPvDN2dJh0UtTNPKtXijVLNIuxZefExOtjoAEg2ApASPBE5aDJNCluon6Jc8rS/SbiJ9si31llT2vIaKXfD/VLpu7yK5ozTZqYIw3cIMg/GHGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFMAosinZVmTiaQjTOqo3pQ8qUAKnmlLYxjTdFm/nFA=;
 b=bq7wRjT+wSMzXxdtfNRe/6hfiKM11Oj0+rcTWnYNIGkTNd92xg/BOFQD2w2Mv33SFl7R6SACNvJiWei0qW7aHfZpnHUHeeJrICM8DiVT7R3jiECOd9omcTK7N8Pbf4OfBXrIm9KoisXfqlHa+MswkYJ7yYcP1rYmm5D0LaXgjbXaF9V00bHuMrwLg5ZNPkE/kBxUmBh6WXdHYTa/Gi61AU4RUl/QxAQsQauWSr2HDnuPjHBX/vjzMlKWRPIhLUN7gI7FERRVnZXIcWgpMgZj3VOfquKvEVWx5iJjzNXx7HLOlsx1JWfshFE5SWODB3PMeWOO3e4n1d6zg1kOz42ojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFMAosinZVmTiaQjTOqo3pQ8qUAKnmlLYxjTdFm/nFA=;
 b=K7wXNdLxAToVKiqjlPQ7DEetJw6wdq+67OBvZLPcpYwrtelSjWKpu2U9tp+5dw12OvsiuCv3lccXbkCqU1tLR8XA4wXjGYlSVu9/Gui5ZMYFrlzm+IpLgsKJ36MMLgEAKapdpqQnix8qg5ZDoiaNoQGiDWR+0d0OKSu57bdKNSI=
Received: from AS4P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::20)
 by PAWPR02MB9102.eurprd02.prod.outlook.com (2603:10a6:102:33a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 22:30:44 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::b2) by AS4P189CA0029.outlook.office365.com
 (2603:10a6:20b:5db::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.22 via Frontend Transport; Fri,
 28 Feb 2025 22:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Fri, 28 Feb 2025 22:30:43 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 28 Feb
 2025 23:30:43 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 28 Feb 2025 23:30:43 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 423A9256
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 23:30:43 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 51SMUhdf3902444
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 23:30:43 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 51SMUhiU3902443
	for openembedded-core@lists.openembedded.org; Fri, 28 Feb 2025 23:30:43 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] tests/fetch: Verify regular expression "URLs" that contain a ?
Date: Fri, 28 Feb 2025 23:30:39 +0100
Message-ID: <20250228223039.3902407-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250228223039.3902407-1-pkj@axis.com>
References: <20250228223039.3902407-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|PAWPR02MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: 0781ac77-9956-4184-2b40-08dd584789ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mT25yr+lbzqtd38HUVP9FLyfWewZeTX69vqPOdaFpbsV9LM0RK00B5urP8gD?=
 =?us-ascii?Q?rEvpHHjxLQcaY3aYMqXXqQB+tPNKOi+EEUq8TTkQpMcOveEBk15V39hFKrH4?=
 =?us-ascii?Q?YwvOkD011/rlw6YtXoyC5Xy5x6q6dLcLVB9W0DrJblyNlzqbW/w5h0OSWDIS?=
 =?us-ascii?Q?bVQI3ID6dd2KXM7MmLfk1QGYgvW690/vZK0iktrOS3BPYaQ/KeFkLZgYXGeR?=
 =?us-ascii?Q?KYYrDUNGUNTomPPLtAzoPlOTO0qL5mRtmz3P04yYkQWGLPFy8Lj7RxzlGUle?=
 =?us-ascii?Q?6GnXhliNz0Lo4HOk5R6///QZ/lZfnHNT+XQ6L93rnq122o+Ft45RSpoyz0LL?=
 =?us-ascii?Q?SU3ASunzSj3HmNH0zgzJqG4jlucdZsneHomFpQtRvb4bZ7NpUnPQDddBFKJN?=
 =?us-ascii?Q?YYQDZyqWabsMe+Y1upFGw20A95hWKSwFEbM+A3xYqajDTI5W9ycy6SNeMXXV?=
 =?us-ascii?Q?1lfwmlHk5vW+15q/K39CMx6hqcYLtGWFIeLOERmjvojDm53OZMvFqmC62hQm?=
 =?us-ascii?Q?YwZBu9BWvxXCG1I0NmSB3SIkgjz6IysiIaIYobE6PMcEoF+eHsRDEvyu6lmr?=
 =?us-ascii?Q?nHXX1COsiT7qDTNB8rdNv5T8bkw3L9DVPMWIGF3wiM9zWb9t1xT8jDVY6meu?=
 =?us-ascii?Q?m64jM2Y/GgQ+hHW+oq5cGOvPTxu3ptgthkK1mc43rE1V7pC60lj7EQ9/0h/i?=
 =?us-ascii?Q?r0XZf8YBP2cJJvju13XgJcw1HkyElaeS1cWbc3QJlP7UQQzsZGTW3wF9oqwT?=
 =?us-ascii?Q?xqjxwko5Fjua49mDUaCzbrxkSQ0vBvLGTtoRJK4EbKI3bYNItYCmJwF7BXm9?=
 =?us-ascii?Q?BBhyVvk/TF9mHBAP6XQ5ThNWuJ8lD+1qyASV9a3dgpga+qgEOiSDiBhBGNz3?=
 =?us-ascii?Q?iRljbOx+bgRaG2vuYL4RSwNKpY/3V2pXCPZD9eIRFNhhMRoTMKHRSysFANwW?=
 =?us-ascii?Q?IN7V+3eoWwXS6Gwk3w8QAdMt6GxHFslxJfDnkgD98z9ORA7w1batk22kSpNQ?=
 =?us-ascii?Q?xfFc3ackRbJseNwEleBlr9vQw/LrnJBoqs5ZJshbQn72AVEU4dwgNmswo0/l?=
 =?us-ascii?Q?xSO9QKxVBK/1QVdSlQ06jSJxoVaJDaj0E8iRhHvdWnKyKBbSrJkSWQ3WJ/JB?=
 =?us-ascii?Q?rEzZVYeNnTnaEwmKOhOGEwUHjN1sHNSnBejiT/SKSJvmx9jb9pt3NX4mSpIl?=
 =?us-ascii?Q?bIuVvl0doi4G4g/+NoF961WU7S87+jYR7XJYML+rYaQQzoP0tcA34dptaOU4?=
 =?us-ascii?Q?ZLhLI7OTg13xeSN8UyzsX4NdzuTSbW5EKnjqLCoiYGiGQ/tdyyB/T1vs8IoB?=
 =?us-ascii?Q?Kao3u4qSsHkyD+eZwUyNguJxmxqbAqoZI9YAqXStmxysBwH5ot5S7Lq9Dv+x?=
 =?us-ascii?Q?F1CRyclVlL5y8fftvr4qGiUhRZhCFWuHE8BhnS6fqDBAsVbp82kgFP4xs3NC?=
 =?us-ascii?Q?YBInBDSNVNo=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 22:30:43.5953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0781ac77-9956-4184-2b40-08dd584789ed
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 22:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212080

A regular expression "URL" as used in PREMIRRORS and MIRRORS may contain
a ? as part of the regular expression. Make sure this does not cause
problems when parsed by the fetcher.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 bitbake/lib/bb/tests/fetch.py | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/bitbake/lib/bb/tests/fetch.py b/bitbake/lib/bb/tests/fetch.py
index 48b9e4af16..be09a2964c 100644
--- a/bitbake/lib/bb/tests/fetch.py
+++ b/bitbake/lib/bb/tests/fetch.py
@@ -525,8 +525,7 @@ class MirrorUriTest(FetcherTest):
=20
     mirrorvar =3D "http://.*/.* file:///somepath/downloads/ " \
                 "git://someserver.org/bitbake git://git.openembedded.org/b=
itbake " \
-                "https://.*/.* file:///someotherpath/downloads/ " \
-                "http://.*/.* file:///someotherpath/downloads/ " \
+                "https?://.*/.* file:///someotherpath/downloads/ " \
                 "svn://svn.server1.com/ svn://svn.server2.com/"
=20
     def test_urireplace(self):
@@ -1415,12 +1414,17 @@ class URLHandle(unittest.TestCase):
        "https://somesite.com/somerepo.git;user=3DanyUser:idtoken=3D1234" :=
 ('https', 'somesite.com', '/somerepo.git', '', '', {'user': 'anyUser:idtok=
en=3D1234'}),
        'git://s.o-me_ONE:%s@git.openembedded.org/bitbake;branch=3Dmain;pro=
tocol=3Dhttps' % password: ('git', 'git.openembedded.org', '/bitbake', 's.o=
-me_ONE', password, {'branch': 'main', 'protocol' : 'https'}),
     }
-    # we require a pathname to encodeurl but users can still pass such url=
s to=20
-    # decodeurl and we need to handle them
+    # We require a pathname to encodeurl but users can still pass URLs wit=
hout
+    # a path to decodeurl and we need to handle them. decodeurl is also us=
ed to
+    # split the regular expression "URLs" that are used in PREMIRRORS and
+    # MIRRORS.
     decodedata =3D datatable.copy()
     decodedata.update({
        "http://somesite.net;someparam=3D1": ('http', 'somesite.net', '/', =
'', '', {'someparam': '1'}),
        "npmsw://some.registry.url;package=3D@pkg;version=3Dlatest": ('npms=
w', 'some.registry.url', '/', '', '', {'package': '@pkg', 'version': 'lates=
t'}),
+       r"git://.*/.*": ("git", ".*", "/.*", "", "", {}),
+       r"https?://.*/.*": ("https?", ".*", "/.*", "", "", {}),
+       r"git://(?!internal\.git\.server).*/.*": ("git", r"(?!internal\.git=
\.server).*", "/.*", "", "", {}),
     })
=20
     def test_decodeurl(self):

