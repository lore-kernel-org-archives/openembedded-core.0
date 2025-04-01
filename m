Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1585C3601B
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 11:32:01 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.100])
 by mx.groups.io with SMTP id smtpd.web11.16529.1743507114154826500
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 04:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=isMtIvGW;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.159.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZi5Jd5qH7lX/th9UeywOz0erHJ1MDKbj57zMVYS19rybdw59ExsuPPgYRNHjsT0QjVKD+vjTyeVWy5O8Ht8vuHRAVFTloQmctrfxdD6VkzwFWeWmp3IIdHydK2J0YZaDZi3UrNT8sOXTT/9T/WwoQaxCpQJEVOtAgMP8VyjfY0Wp7SFGv8VbxOos7YAyWyubsz3zxoQcLJ01WfolMllgfVQoUYI9oQBCw9Iwhp12xAu6j7tgAYZSpWW7dclFtRgl7Os0EiOyBr41F0iIfIKx+fVLPIo0CbzYNUv41I8k0byZQjssalZ0u/s4IAiaXG0z5RVFOzSJjnegsBHbHqJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6veEGoQ3rmFv5MfyGgLbYefphwQq1GVNOhnxvPDpNQ=;
 b=yJ2Wt3uEROfpQbO2Fs1XYqO5Gau8ZGqe6/G+oDdhhZLgM7EpsIxYB1b1oS7iq116fVesBX/WbhXBYHLvG8IFnrIvAGuzx4OkJfRFjcwPPpvHfi+Sf0YoHjNPuitUGQfX5mfCQmtn5MajHIWEpXbCOZevQPH38eA7zll7YebctVapVyUddS6ET3fUuGOKmpO/qj/Dv5QgQKkFitIWIGADv0FSdOE03T/lGjUoQiBsxgjajNkIWBZLN5DM0K7WeCU4tOFsTcVAQQk/VHCKyUlAm0AupduoxySbmLIyXqhos7eh8Rbz6/PC//QbKVms/7h0oooFXSvOuLoPOPRp9nVM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6veEGoQ3rmFv5MfyGgLbYefphwQq1GVNOhnxvPDpNQ=;
 b=isMtIvGWT6ZUejiLEfzeEIw05KQo7tAzwuKxhAbs+UOVEVMIsXfodzFwAiAcaz2Yox6CiC/IKjmxUcZeLo5Qn5FgD33kd6tk8EQuMma1kvPFsV8QOBYPeXJpqpy8HKlVnZOJpwT/C82qi+rduxMDgnxk9klwL8HpjjgUNxyxsQ6ucHIpwkJiQvwY5l3FARpNAW15ahJyLTFBuMO+TOVCZ8s1dpuAQnUrN3l/+hqxS0uXtBpejcSt6lV9I5oViHx21rnulnZ/POmww/7mzBIsAyMARGTVrAVf/I/12BMNNn67+fV3Ysfws+7w+2Q+uUu1YDXigntDKO6XA+ocz5BhUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB7147.eurprd06.prod.outlook.com (2603:10a6:102:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.51; Tue, 1 Apr
 2025 11:31:49 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 11:31:49 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 5/6] glib: Support using alternative runtime D-Bus
Date: Tue,  1 Apr 2025 11:31:28 +0000
Message-ID: <20250401113129.3531757-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401113129.3531757-1-niko.mauno@vaisala.com>
References: <20250401113129.3531757-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00003852.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:1a) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: ca055582-15a6-4629-c173-08dd7110caa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dT6knj2oxeqqPW+YMvRMlJ2P3wtVZ1qcsyKsbqBB8h58ICrK4KQFE6UrsVdW?=
 =?us-ascii?Q?ZUzDdMGViiCoPn9Aa7Q+fyPEmlVd2AVkqV/7AsneZQR930aDDDM/FuRm7Qc2?=
 =?us-ascii?Q?j5kO+enwbxDJbCtDz+pKHG51htpHPPKKWE01SXzjb+Pd84Btc+CFYskMlpBx?=
 =?us-ascii?Q?90vmyTJwnL4ddTNAg8BG4pi4fgUFC9v12VPEbxsD3Nyhxjsj+CCY2pY7qMCB?=
 =?us-ascii?Q?UbAPeUbrbQbLQzg7NyFidmOiZBKYWjfEAmRRHaHwcKgfm9/CX/oq41pxzGq9?=
 =?us-ascii?Q?xONtXSb6bRxAjzDIHOAqc/C3HGcw+sdzuJJK8CFiHNAUjctH/fR9t/eHN3FY?=
 =?us-ascii?Q?6B1LfmksiJF1f7H9Ld+lcKb79yDkgY647S6w2+L2aA+3w/5iOacWi510Kkjv?=
 =?us-ascii?Q?nm0z32YnMj5WDTJCnclEDdarDn/yuIbXERpwPRcg1XiCtpQXqWhNRg/1JLpz?=
 =?us-ascii?Q?qOlYlZyM0azNTV/YRflYZcS/ww1XlMVmye9u9ti9XimiS2My182QPln9Vu9n?=
 =?us-ascii?Q?uQaPtjyzOFVSlCswliZQfNvnhMbhFs/KygSw5CIARYGhtQj16gO1McWv1bQT?=
 =?us-ascii?Q?UE5vUV+1XGNag8u10jQ1FAlySmQp3YfkJtyLHOrwZ0a8wqlxeyakt3xfxg0p?=
 =?us-ascii?Q?CJd9NIOO42h19zcNqcb0pNgp9FO6ylkCmWuxv/D9MMVtfHA3rDjfvuVEDSZ9?=
 =?us-ascii?Q?ti7TcOO9tcXG0rX/H6Ew1nmKinpNBNNr6gcyuXOn41Z+yvRBMRe4OWmhwbuo?=
 =?us-ascii?Q?Zt3EWvXDr+NZPSi9CAe4j+oAMOItvLLq8cCY2onDOYzhuR920TIjtb94CkmY?=
 =?us-ascii?Q?//r3gYHmmVegI/35agYMtsKdF9az1r0ydkm/IzDshM4RMixqruOuWqUdSR1l?=
 =?us-ascii?Q?aMUfVImdIbYwzPokAEZmsO1ocZ/jRvkF8Ep5IyC3koUarRnFtLC/EpIKfIHI?=
 =?us-ascii?Q?95gldVlyaO4pM+nC9Rw41C/Sgxn5CkXcjQ6pFWKY6ZpXnGzWrWMsaXrOy5Ko?=
 =?us-ascii?Q?Fb8sTdAfeHpFZ0AN3strBAP8pYaC97F9shSJHogyp4ClX62YWNoFrZPxLVUd?=
 =?us-ascii?Q?lF+jBfhaPW4S0mzVHQJeRM9EFinbZSHM/okZUT3/pHZD4M3ZEB88x6DhlWVm?=
 =?us-ascii?Q?pIX/PDK/mSs0PnT25MMytzqC76joRrpvlerafbwpMlHuvx+WY+cO6IKdH/LB?=
 =?us-ascii?Q?3Xy/fwVR5dt6iyJMz3554W6fvup9IUVNVvB8R20I+/hSnTKCuL+W10U4ltcn?=
 =?us-ascii?Q?gQS66BC5F8kKzBeHhoqGO29KlW+UqmzEfLjMiQfY1CtOm2m+DhNX0dvLk1c6?=
 =?us-ascii?Q?nGoU95UMldnMHCdOEiQCFD2HnJNb9OkN2UItm9pcmqqfo5VnZpRZffjBKA8h?=
 =?us-ascii?Q?N8KUIcx33MV3MPHrJB8KkO7JB373jFc8KE99a4BFE189eY5incjHMwUp8fsV?=
 =?us-ascii?Q?srJnYNoNdhc1LXJ9Rcqt5eQuQ3OEEjJI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wp3bxtdZfgnaxKXKnFCcOds3PoIAJ/vFOebOubyU9PLtNdtH3BTiW0e5lpmD?=
 =?us-ascii?Q?+Thf0VT2KIwIAWIQPffL9obIUU5Wm+b8hVh85+PrQrUqKQQZ5q7xoHQElUks?=
 =?us-ascii?Q?N2JTFfiG6vzEY8Z71TKhTl50F/MVPWkVWzto7GAxmZklg9n51VfTFWnHlVtU?=
 =?us-ascii?Q?hiWmT0GM0se67ZAq1UZNRapDe5fQUyf/8MKaNqchQV9ryHoKVy1U7JtLjKbh?=
 =?us-ascii?Q?jbCJ2kKx6M8gKTD4oEP1kXtkSzXIJkuPBhDaN8cjNZTczAUYZAw+jxLeR4uT?=
 =?us-ascii?Q?+zhRDyLVfHXweHxyIcWYzzUXByYphBT+c8indEotkYsp79vzhAClcB4tQdYL?=
 =?us-ascii?Q?Ddxttha82n9F77DIFpMp2q6itfwmlWUeekDrHFW3wTf0cqgPFJLPQgJyUKVj?=
 =?us-ascii?Q?fYkkUawpV6oYAMpbXXGkObtRjBM3RxChBFvXJ2JiO8pQ3Dxn1mdbHrw5D9Sk?=
 =?us-ascii?Q?ET1wd8VW1LPe9GudaPtjcSG4cYZmofbPjlli875rtmwfngD29FqabIeyQH10?=
 =?us-ascii?Q?jcj4lAirSUyyYXyhPADNFd1BOvzN9p276HCjnrKgkdamt/xnzSZj0lTQxfsl?=
 =?us-ascii?Q?pp7f8KeP4nI7SY4l3Nfv3B5Ra26SG9aR9T1ylsSUZtqlDVl5otWyTQHS+dIN?=
 =?us-ascii?Q?FuexLF1e593TrB/c0+jiMomvo3pj8NvGuY3A0g2WEqcNfYtIpupw2tEmC+w9?=
 =?us-ascii?Q?bJ1riFTjb7HovAQywLsyHni9entG2bhDO5ZbZTV8Yl4TQ0N/zoGJOaMdDCDI?=
 =?us-ascii?Q?QUZE9ZdNFXvzAEwXULy8mG31Qyirhm7MKfYZxBgn1pDsgLMHtsZrD1Ew1Zoj?=
 =?us-ascii?Q?sLSiNXPP8Q5lP3K41p0NXh1Hca1RPs6RvH9jbyTUqkqNKd07Qsvho1WSw3+i?=
 =?us-ascii?Q?1iOVK8Lk82gqizM2LWEIZHynXvmrpwNpYqkAJhBNihPZ+YnKnaC+Z4kBOy33?=
 =?us-ascii?Q?/3kVNcDrLSNwZNb9+xNwPRZ58LUqoVdYJ8QsRds7fWet804dIDiPPj4lXgxo?=
 =?us-ascii?Q?w2el0eA8Q1ZmcjhxThLdZgM7+u3P7U/4j9E5OtEMhN1O2B8efz4fJWuBI47k?=
 =?us-ascii?Q?sOrWMXdnPqYeMgB/vil5TRpjrnFuRckWH53mTn9+d8HYVqQk+kRrfb+coPfM?=
 =?us-ascii?Q?YWKDInXT6xFv8gUu5Hisska7eaZ/90dC1S+YoOhYDgPHpfx4ssXy9TJUcb4T?=
 =?us-ascii?Q?Z6OL/HNxkWEKW/U1L7Wm3K6vst/Ifgzso4tZC7BZrMbra4bwII2DnGc3TsdM?=
 =?us-ascii?Q?G212UKYKedyudEp3oUeArm9iasqL6csP6MiqM1DLmviC3UetZtu814DG3Mlo?=
 =?us-ascii?Q?IAo795ZJZIENjthuBFdscM5SSoRY7b8FlFHLJ2vO6GypkaGuHQ+g6cVkp6L7?=
 =?us-ascii?Q?WP/G1f0zKKN7Lw/xMq/GINvk2aw1/hZtGllYKGwFYc+CMy3Trf9aPzVfja6a?=
 =?us-ascii?Q?icdjDhRx7vHM5spS1FCaIR41Hm212QZdHpWFlN4BGtqqHVXr3Dj+F9+0W/+q?=
 =?us-ascii?Q?9Wi5zTiNNXiQCHzycIQVUWE03FINz2TdGqZQto/f8rnTWthg78qViEKyOiOp?=
 =?us-ascii?Q?qblT/oTPm1oxHKie63RS+vkSKPi8Z9utokEFbmyqmDNFsYTptbovI1hYKj/c?=
 =?us-ascii?Q?Sw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca055582-15a6-4629-c173-08dd7110caa2
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 11:31:49.1569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZeAPFy/b3kObInefbi/BbXhbKr9fqLwuLurvux2fPFziLm5AB8bMrxBDFmvNBuysLWYPefUcWqKe9SuV4iVx3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 11:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214020

In order to facilitate oe-core users who wish to use e.g. dbus-broker
as their runtime D-Bus implementation, change the Freedesktop.org
specific D-Bus runtime dependency to honor the new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc
index 61e1a3ef17..2cc48f0a06 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -160,7 +160,7 @@ RDEPENDS:${PN}-codegen +=3D "${CODEGEN_PYTHON_RDEPENDS}=
"
 RDEPENDS:${PN}-ptest +=3D "\
             coreutils \
             libgcc \
-            dbus \
+            ${VIRTUAL-RUNTIME_dbus} \
             desktop-file-utils \
             gnome-desktop-testing \
             tzdata \
--=20
2.39.5


