Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8543C021A5
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1132.1739286057297610302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=DSUoKxdp;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4I7OT4Bl5BEtVnZUdJX3T53i3QJcoEtZjWMOtIXK7UIAga6FXIftdsp5Af6YwRlDXjKJhZTYNLZMrtErAH39rcKchex65ONB3YWfw+5y/13wUSI99p8Q124j27ZtNrysWXb40rHIgWVzU2BkgLmnKIoAS2qBIffpYsvzHsi4hFqPJY5rDS6bFla8wJnRC9sZOznsK/fzzOfkRrfAMH2hLeZIBS5zJokhK0azZrHDOenGjUnhKv5UDxE41PRtwUqcTL1lsCetM4PbX9z7+q0P5QxRX+J8c62jILzonNGNvvB7ySQyT8iZBu4ONeUDJj+H1biS3UZoVmY9anjVdSs1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hoT6PQz8a0jhMHV/XGh2a6zly1rcxECkMyLwFEqlis=;
 b=K7i7Ad2Erlo6JJ1q2ZUYsqq3/Iar59ymhWWQACMduLdS+SI32PTf3AU6MhL8cV2jEodfMwGYsut1lBIVHphngwSKVsxf3Z4TP0eUwRhgiWx+cLwqUfs84ipGYEaloOUPOmdehtWvLMJ5CY4mJt23joakMndCPIiuTjeIvBzUZZpCY/pqwnaCvfIFAP/9yRk7ZkMbZ0HS3bz5WSC0htix0kVundEZ/+nzcET4SxnPPKwuxqwnIfrARPk8d5DEE/7YmpOit73plBU2TDjspuA2tvrG6nok5a7Ri82l1BZSeWDaikLqe76n3gkXQ16LiokkaCdhoSC42B5iSDH9ZPRumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hoT6PQz8a0jhMHV/XGh2a6zly1rcxECkMyLwFEqlis=;
 b=DSUoKxdpAwrPTFJ+BJxwgbYIkRJxV5NyuAH4tn6o1xnm+qXQjayORUv5SzHCHazCRC5/I5o4+O9S5tgto9oDp0hmvU82JV9VZE+8WEOBFVBevtkAYz+nv9zRD1jm9y4eHsaE35MovCfl9jxfdlOoxUl43EX00supVeSevWgQDdlSGpdq38yTFHqJVE6QL09Qq6NcbQ9OyeF7XU0v+jYhM1kRWf6YTevK8Pt8bhnKVAh1zP8K5oIfU/MppNe7AupJqJueSPPpmvY8C8/KvdtDp1DIVjeA1BNP08OUkMTrHBMQpHodV9LNMLEKzJMfSMjMUmNAdp5QJueDG8RwsYRLBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Tue, 11 Feb
 2025 15:00:55 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:55 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 13/30] classes: add nodejs-arch class
Date: Tue, 11 Feb 2025 16:00:17 +0100
Message-ID: <20250211150034.18696-14-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b1a51c-735f-47a7-f583-08dd4aace0c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?alNIp7Bt0w3qxHn1tAxOZIx84YswPHEOjHYIGiTRv0JXn2me7aibJlivxlje?=
 =?us-ascii?Q?rJpUMnB2iubYSpol5Xhspg+e2lvKu6xtEifyrio/cpaGSWS9gSjOoBSmCK7v?=
 =?us-ascii?Q?Hm34srqBL+15j4xiKDUWusRCW7eO3GM0oTVKVipwFx5lc1euzXPZMWjQBqG7?=
 =?us-ascii?Q?uhcpe8n8jE76WpWPWsDYIWJzo+/c6lUKpREv/FKlaixCzYR83nMvgJdR+wQm?=
 =?us-ascii?Q?EYZ0+68gzXstikspPvQZORq7IwQtckk3TUO3MdwSD6tOF0TtHyLGu+h3hAY6?=
 =?us-ascii?Q?8NyFkPG3l98IZwie6p0i1KlRQeTOetJlN2mZepOzJP1vJS6a7lPyL0CKI2sP?=
 =?us-ascii?Q?XsRPwIV/WXBGsgeiShaczmgyAUeS8b9oNiIPt/re4lua8p04Zz1FmNGNGQnO?=
 =?us-ascii?Q?w1H/Ua71OlBAWMEgdNXQcMO36fSXpfs5c8GS82Xv+FGc24pB4/v41y1KmN/M?=
 =?us-ascii?Q?+spPe7zUQcJDcK+o3hHW6j6ZFcPUYpb5oR2t9F8c5srJ073uUdJ/4X+HtPsz?=
 =?us-ascii?Q?XIUgO37xTNIe47u4uNlJuU+BdyJEhZjBZMBnZi6UmJc9e3A36V0ORslin69+?=
 =?us-ascii?Q?dyd/hv3ja2VKmQ5y5hQEGnpvJrcr5BGwWv3XHRWs4lMXo9dXhxdXxE65+NxS?=
 =?us-ascii?Q?jpdANYtlvvYHIp6o732WEh4EN3sJU8hh3nMKcV4nXciRB7ag2EaA1Ps0/Tkp?=
 =?us-ascii?Q?S0ff5zldRPqgl0DkKufd+1KVg2hg84U0SbZGxYAx5UisEJc7UtN5sdkp4QMV?=
 =?us-ascii?Q?bdp3xi+TCz/XlIDS3TqGPGwccBRpcDmjwDc3FV6JC8Q6wNGAwsiZynDgtq/O?=
 =?us-ascii?Q?LaAoPBimleTZjRYKtUDfHLafpNq91oCSEodXg+tF111RfcSlV+Y5tgO9nwoX?=
 =?us-ascii?Q?pYNpTzTdEJ5iGsLeamnalH3sPHrliYIv6HOuDMN9J30tVfMLJLqcSuwh3ycZ?=
 =?us-ascii?Q?fwhJM14z/66c+culG+I4oIGL/P8NJLpiQPLKEDZl3Edr2eIBWvqXLwtLrX0d?=
 =?us-ascii?Q?VCVzNOmFL3NWdRbiWIGa2dOTpAZIcW8jb8lM1lau8qNtN19BWgMMH/3cReml?=
 =?us-ascii?Q?jMI7eCWO1OUDr7jDAgSJsN7bzey1MzLpKIQi/zfKcz1jn6Jqgiyi7II6LffN?=
 =?us-ascii?Q?Io/sMDv8vTOJXtwmhf1c69puE5576naBSW+XVV/jzN0oG1E9A0OXVKKpDWvh?=
 =?us-ascii?Q?31qywmaEsQynyD42P6F0MsCQkJKngz9eFQly6ftRHfhLjykY3Uf5IOrYGJIQ?=
 =?us-ascii?Q?DsjVHILpCITLt+E/ma/7TJLRgDonN98aNKA/QXmiS0tlqKXha+JU5xZ3t+oY?=
 =?us-ascii?Q?T1RQYsi9iImD7wO830NCgYh12dVxH4XxThDLemFq9A/Tr4omNIV36jJGEkPJ?=
 =?us-ascii?Q?KhQj/Uxf5FH01C5hK16AyIcgbx7URcbRZiRNTni83DLgr4otDrVdeKGGGxBi?=
 =?us-ascii?Q?EQWIzHPGchJv16tNrDtHUDoODw5N9wO3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v24ytNAdzDRt7JZ1EbkIo2bAl3k6uPzB2Cuj3XLcsRbQnPp+NAsotggLmKJe?=
 =?us-ascii?Q?2nY5Z5qGEOwG8Fxpm0nMEV+Fn1mhk8CaldlXj7UpF0jpqCt2okyblJHX93v1?=
 =?us-ascii?Q?GrgIhF9A9ikfT9Zg0cOe6UvDwVB3e0aQN3SpZEm4nCFA3vOONiUEY06amE5s?=
 =?us-ascii?Q?JZ6a21rOvnmesxlchvXQ+hFJGYE1WVSqqwb0Rq5mat5QzC/6/Z03KG3f01dH?=
 =?us-ascii?Q?likaWqxQtOt0pkalqGOG3yQjVdg0G+fYjimO396vRHwN/AS7LtiOXvJRSvPn?=
 =?us-ascii?Q?SOFLQGZgELosFVWu3Dc+RPnmtM+Zto0qEYLeMqP0uoWKB3m11HxJO8kv359K?=
 =?us-ascii?Q?87gDSdIbR4ESyTpKsIfkCzCEP7zr0P5MaX7Dy8FUx+kR+Z4Im3mxI3a6BSGq?=
 =?us-ascii?Q?sekAJNxkbKpvLF0FvpdSRlyMbzlZeFeHgtc2dtQhZgaBu0+ojZL7ikv5Tvy3?=
 =?us-ascii?Q?NTIykmSMyp4jJXwt5S/oVHNR9mWc3gAX5trrFZ1ROfxv/Ug/iaroOhJ6BQQr?=
 =?us-ascii?Q?JnDp8opV7jRgh/AAVtOWK/WtAKWbbJQQ/svBZ+syhT0lihHcjld+vMZcbR2G?=
 =?us-ascii?Q?3xi59/GXGxFYElX0dT2+ymi6UUK7NlefmEeXkFAl0yuaapM8IqmycYjFQbbw?=
 =?us-ascii?Q?Ycf5pXKkFuXe+OCFwyAM87JbH6MZ+0TqVTYbtICEWI3xmJN2lBs9OGeNRO5o?=
 =?us-ascii?Q?Fp/bDBnIrBpTpbqyIAGyYx7Ue5WKrLYHL7bqV70aD5mCEHD/74TqWojzkjjP?=
 =?us-ascii?Q?B/MIoznWWelcuhyfTlz3rwQ+5P0I/tpzBTcHS/w043gO+I7a+AOslxQcwUIe?=
 =?us-ascii?Q?ik93sbNYFllpaYC1y1c0CgDm/PRAMb7B6TxlA5Q1O/1RC5U4piHMe3ZJlglZ?=
 =?us-ascii?Q?s6AL+xGLzAfkK6XiflRJgXrLMLrZ/igz0ZLVyND+GeW2CesofZTcpiWJljh9?=
 =?us-ascii?Q?BrAQsos53o10Kav50G1lvPp80R4dh9pz396EDIyRKRnFZQ/ua4qKh2KB1Ow3?=
 =?us-ascii?Q?rczjiGu7e0zmdvYlD290XVYkUApv3YFx03S2M6AaTsoTucIr+e2zcCcmx/3q?=
 =?us-ascii?Q?lk2rkvsPcdUTMavo8ZphH9NbZlZvD85SfaPaDNbhHJPHdGHlbNKz7H7+TMDH?=
 =?us-ascii?Q?0yOsQHRznlg6U7qvX1UMfvzyA4L4Em2X18ivPNHhj6v8ZerKBopfTLgsOqmA?=
 =?us-ascii?Q?lEubR+FanIWU5juAfhGDi6MxGTxrGuhU3Ypb1g8Uo5XTXGGWkjLO7ZWUWDaH?=
 =?us-ascii?Q?nRCDfDzfzzZjgGenv1xfXwYHcY5e1wzwtqNxf4W7/8MINjmzW7KAa4GAQtoM?=
 =?us-ascii?Q?3cP8ewaIOQmXnk+vNc3Q46ycWBhYnwUAe5PoWNQTH4P2/GLuQJbgF1dS4ZnF?=
 =?us-ascii?Q?cHjvagE6n0HHBT9kFHotTEhhj41ywuksBhV8ES+BH4x1fhBPSFsk1mdINV1c?=
 =?us-ascii?Q?KRpCAhkT28dgaaUzL7NdtAOnmzAWVSNrDUfEVSMkN/+S3QDZxXnwOtfRycqu?=
 =?us-ascii?Q?huuW+6cvPI5GTbqu2fFEsFKMkvM32cjYVLHZXz8YS6rsr6/e+YpMcGbFxAXK?=
 =?us-ascii?Q?FGz5xPy0hphs3kzQK3YiFTRcwly2DSQbuguwYTCIDwj5nJcHgZufBXQt3lzE?=
 =?us-ascii?Q?OA=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b1a51c-735f-47a7-f583-08dd4aace0c8
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:52.4343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71Jfowp+3GcXo5An92vOoPcXHlMOATOruDK081tmKcjPL5v9gNwLljQBV1nKfkRzujJD+YTOndXZ64s81BtOzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211138

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes-recipe/nodejs-arch.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/classes-recipe/nodejs-arch.bbclass

diff --git a/meta/classes-recipe/nodejs-arch.bbclass b/meta/classes-recipe/=
nodejs-arch.bbclass
new file mode 100644
index 0000000000..144eaf8409
--- /dev/null
+++ b/meta/classes-recipe/nodejs-arch.bbclass
@@ -0,0 +1,15 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+def map_nodejs_arch(a, d):
+    import re
+
+    if   re.match('i.86$', a): return 'ia32'
+    elif re.match('x86_64$', a): return 'x64'
+    elif re.match('aarch64$', a): return 'arm64'
+    elif re.match('(powerpc64|powerpc64le|ppc64le)$', a): return 'ppc64'
+    elif re.match('powerpc$', a): return 'ppc'
+    return a
--=20
2.39.5


