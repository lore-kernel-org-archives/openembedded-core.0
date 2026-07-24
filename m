Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92092C531F9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 11:35:28 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17175.1784892920285630493
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 04:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=JKr5t/Lq;
 spf=pass (domain: est.tech, ip: 52.101.83.67, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUTM8nKMGGuTc8gH+0wmvNG4tjVzqFgkjSo3wI7O92fagpMgSISW2w+JFX/jr9lNkXSazMGO37OK/P0byN21QyOnbtmBpVMnLwoiLxK+99XYTTcQn+p3JVLz/7X3TMqNj8wai4BdtxOsBhc51hUeu+LLoSV8Hy2cYb+Ha3mk0Cava/Mk7vBF+tR29YlXODgmOFOJqS/BRSqyPvSQZi3jvQXZd7E2kQrcArxpOF/NcRhJ0yaZRz51oCsofI6JW0Q6OATQd+zUgXatsuLfAqubzPXcPH1ZljZhtVa8YGgG/3xUox4VLCLMS6gHIi8MIqoMYwqh+J1EHtSpJvo3skeUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Bnn5loLvckOjqdM4cC1d2xR8DmMq49AiL3igReD9Qk=;
 b=vHjXGBS23pzsot2DBq+0NBIuXAGO7JphIyKIQ87Ik73R2P/+VV2yzk/q8jl9iOHS6J0lGI0Ra3zdPQVz02HBdV/WeVXMaKeVj8WSqI2FRY4xl/wy+LjK+pN7RkP9u/2ROB+M79R1D56BeIniAummm8ASc1ZeYFiCXkFK2YPMInlC4en1bTM4XTGUCrYt4HmJpguoINLiFCyg17Oc84N+s7Vkw3af/UZ1IIdSBGN18mxbMMz3h34+dQk0ZTXsrvd24ECpk+pNY9CXHDME6KEKMYt06Hi770aKlfJ/whxCH6eksy9We9Bv/tGnNidTuByXmyfRukuEdvFjIjOB32fRPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Bnn5loLvckOjqdM4cC1d2xR8DmMq49AiL3igReD9Qk=;
 b=JKr5t/Lq9IvYFJftWmd3+RSh9mgKn2PCQgp5Q5istHLLdk/78BTgbuf3QUnmtq4ahjhc3Lf7Jwjz2q1ZFVNExuCV2gVsEssLkQv8uE1ROv4xI2IMZRO7qrLKN9hYgcuE4Q1qXO27DhU2ayHK+pjDIhvH7bH1nqbiKufCEVgin0zKn4hEkqtPBYClo3lolDrZ2FFvdIk4yYPYHf7UCUAOqa1fDCTd2hUYiW8gPNPvzX8UiV4eeYPNJcSgO7YnaBlmkuYh/AXCy3UvDWHnV347pxcQivD+modr8KXM+sTu/Dw4RLc7tbQ/C+zwQ9+MYojuDaq69bwTyV1d6PzfFiy4iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VE1P189MB0974.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:149::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.6; Fri, 24 Jul
 2026 11:35:14 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0270.005; Fri, 24 Jul 2026
 11:35:14 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] lighttpd: upgrade 1.4.84 -> 1.4.85
Date: Fri, 24 Jul 2026 13:35:11 +0200
Message-ID: <20260724113511.57549-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0331.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::19) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VE1P189MB0974:EE_
X-MS-Office365-Filtering-Correlation-Id: e17abd7b-04cb-41f6-5ef0-08dee977a0f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|56012099006|11063799006|12006099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	nEtc68dQPJPRlr+FyylL8AS7nx4ErXNhOj+RWtzh4tRSuJsyNtFWBFw7X+7G2aDYss1hUK2bzcpEMiUvvuWW3sQwBj8BDdKwVCiWXf8PqItDOVDuzYC1Z2nVjW4XX1O2MAOAI23agnuUrTiV7kRCV4VkLQw+YYmqtj1zoSrNPZWLU8So0XLL6LuOqYqeCrH21LhxwC/pSavenBdzW+1ycfQ5QNWvdtK05+H2aWZesJ69k7M6b1lDR5UC+rePMtBFIo7uguGaQATi9fojHDP22NglNDy7pEJw8e+cKw4Ti68+KwZPslj6pn5LlnpdPbTIdCaiyLuWvzQRDVmxlKDNvDqqSXztTf0F7QRdhO1lhD+cWhTtM+227AC7qUaZK3GnRBtN07TP9L6OsBMQIVgozosYB5OQFYPp2uFSpjGJFsX52YIvM2RTPsSdfx6DOyIggj/PmQrV8gInAQsVlhKfGlFxD3PFiIPoM0zfmIUnUqbyH6YM4nasvoBvp98jhnZ89HS8BM67ShpSDsOvrV9tWivu4Xxx+jPpqUKyWMaY894j+ohkNF560hrJsR87MAE0E+OBKZSdr+UrbxLWOfehEgIBb/AJHSMbVCkXjmQVHcq60AOUod/dMIjRufq7zkUX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(12006099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aKJOQqiiBGZF4yFdBxnuUDLBBUGyCrebeYB4aVL5f75jIDY/KTjSOVPbLXiJ?=
 =?us-ascii?Q?xYy0k7eAV5cq4w0B+ziSG7VbcPiheCJiYw6UCbttCA8Ld5Q8NvhCaiJdg2f/?=
 =?us-ascii?Q?E7SvUNVWUsvQPgxpfSZdNCsqwsygG1Z/ZEc/iyg9azpryyfhm2j5jHXNYxPZ?=
 =?us-ascii?Q?oOnIL9tC7Ls774uT6DAySnRdnrBwox3yk5GJ3kBFCzZFJLXTXF+NVdCg7vYi?=
 =?us-ascii?Q?PFppzWEhcdWO6w5GllM1zbT+0rsJMA0YUQ2U2z3XE4q4i4dZa1yjD1JBig+n?=
 =?us-ascii?Q?7BTfolahOxfZku0D8ltoP5mQbqdx4Gp+YaODeNAZym0W9zFYjK3ydS0ktJsO?=
 =?us-ascii?Q?MnKSXNx4BimdTUIlsRFU0NixY/RPNMSxeh8dvYrMwvwbRQDfcPuYEQ2H9YEv?=
 =?us-ascii?Q?UnkfuaN9WwrJrA4lZfZx8bJ0KWie0rhDQoSQf/bIyMpRJ/oVDOQeKsLmypgg?=
 =?us-ascii?Q?faABXRGeMbuesC/aY+3WNGXEWJvNHvIRSa4AjLc+m4gwdmsSLIm7avMN2wBp?=
 =?us-ascii?Q?K6vubHNRg3JykQW7OPDxZJbegxNsv9RO15eSVR+ZAdZIwA0xh+NCKsL7FDlq?=
 =?us-ascii?Q?VnB7DLk1YPvwh+HXNezVb6LdNMX8bdP499ZKPhcAGhDghR41Ba6fRLBoiGXS?=
 =?us-ascii?Q?TQeHynafUN/F3H7KgDk4GzuZZKtKszO0HOZTfL5lM/QpvFXxuyDVXctAZAEG?=
 =?us-ascii?Q?q8zS52VHlPptZwSg3qh8fK/o+UpytlGtgw4coaf6560e2WmH4FW6EXK6/6Fn?=
 =?us-ascii?Q?lJ0wilhtHTHq4+4J2bomMYpbX/L9KGOTQ3LnoOsoz7VbCJ+Qu7Btz2yu4T8j?=
 =?us-ascii?Q?vCV9+Qk9DrDtzSdVx5duATOAa22zszhGxxwEQLUXyiLAUPfWy/Z7sDsG6fBl?=
 =?us-ascii?Q?kPj7xYGEf5HjldtYaP7/83PcplLNAsxhQB+dZUyw7F6C+/25Iq/AN0bVosSo?=
 =?us-ascii?Q?B00WBTyu6qjvZwVuWK4nC+g1z5iw80kfIR3nRRVFsOtFQGu5LMADxnqtA7/u?=
 =?us-ascii?Q?uWGKKq+PDHwpep1o1D1JaDKs8QYTdGQwN09ziTIbaRw55aFv7saGw0HQexmC?=
 =?us-ascii?Q?uOAArMm+rOe6fS/uNuwAh/nscLZ9Z85etS2Jw1I6un0SqKMZdwKcmNrc7ttx?=
 =?us-ascii?Q?rs3v0WecmDkdz3ecCwIZ8kmPJIK0US0QLvFIUZKjSKrJ2Ze6yjOBqyAI8gnC?=
 =?us-ascii?Q?3S4eYuLZXO91FXQ3iuhD5+iuOmcO4p8XFNOQ79S3qsJM4aFjBjPKsgQWOaf3?=
 =?us-ascii?Q?sc/S0hL/OmsHRtkF98TFCFm+GWzDeiAVh3oCV9svfEGvvSBZknlC7eYnXJ/f?=
 =?us-ascii?Q?O6JhV1CmD0cpNDpFXl3sz1zeYqedavhpJY8A0VM4I2QlHIdTb30QthKBH1Ge?=
 =?us-ascii?Q?3GQAKDeEWnKUmrpJ/bE4VYkIJJVi0cku5j6SAt6ba0J1gFud451lBDTIwHMX?=
 =?us-ascii?Q?b0tSeCLureqb5QR2992bIW8f5jhOYH3Wbe8LIm/kYSIpwq0gzsQS292y1aw6?=
 =?us-ascii?Q?iSxO6n71x5XqfGl5jvF+It9nxzZPUy0rO/DxHir6VsB59WyTIhwDKx4Agtp3?=
 =?us-ascii?Q?tTBLXTKHgHGqZT0xL2EihEYiApay2APsOGpHshsZlLN+8SbRfH08ONuhS8Cx?=
 =?us-ascii?Q?h9oAxHHHen/hnXKfFKMJ4xcXc7P/RhH8ftXlH8yj2WsAQvuSaBOO3unQmpmw?=
 =?us-ascii?Q?KNm4OGT5CN+KvHOl30+AXDTGbjVy+aY9Bbw5Se5xqENVgU/x+tYXwsYMpYgc?=
 =?us-ascii?Q?oVtdvpOtLQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e17abd7b-04cb-41f6-5ef0-08dee977a0f5
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 11:35:14.5368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxdAvxkAPnnm/9FFRv+fIVtgdz2cPvT6+91PviR1vVP/Lwt5n5GyYPks0y4XMkpSCZDj0ZbCpzYlQhspkYG2yIbcno/rKqiV83GSGvMFL4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB0974
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 11:35:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241928

Release-notes: https://www.lighttpd.net/2026/07/08/1.4.85
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../lighttpd/{lighttpd_1.4.84.bb =3D> lighttpd_1.4.85.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.84.bb =3D> lighttpd_1.=
4.85.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.84.bb b/meta/recip=
es-extended/lighttpd/lighttpd_1.4.85.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.84.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.85.bb
index 289ecef333..54d8c91647 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.84.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.85.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "http://download.lighttpd.net/lighttpd/releas=
es-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
=20
-SRC_URI[sha256sum] =3D "076dd43bec8f2ba9ce6db7e7ca7e8ad72271cd529805ead240=
0b56efaa026f70"
+SRC_URI[sha256sum] =3D "18de51b393bac4a6827879e1a7ff377c169e414bae92cd2450=
91d80fc2601d13"
=20
 DEPENDS =3D "virtual/crypt"
=20

