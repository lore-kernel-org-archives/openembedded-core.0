Return-Path: <brinkmann@stulz-digital-solutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691A5C54EFC
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 09:32:47 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.102])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7932.1785231159871870132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 02:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stulzdigitronic.onmicrosoft.com header.s=selector2-stulzdigitronic-onmicrosoft-com header.b=vbjFo+Cg;
 spf=pass (domain: stulz-digital-solutions.com, ip: 52.101.84.102, mailfrom: brinkmann@stulz-digital-solutions.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cknv31PRRxx0HjeHuh3lBccJVnn95knXAOh2rgjVeHkEeZyg3HvXrqWNOK3Jw5R06Whn9MebKwo/WZixoOLW3D7pMONslWuevsimQWzSA1YfbCeCGiYBHG3gAsqkqwYdFMVBnBSNUcd4QW/j8t6KA7dmGMRmOAo/etl+806slmhFPTjWNJNm6wCi/sFhITKCuOiyuR1ILA/p2U1uIHpkRD7mI8EPBOItucmS08NVX/H8JFv8WVarrZ/8XPSW4VuvR6rDmzdsppAAbKbT27dt4mBg4suYUPQjdINgcBPrlOnfmNEHVeyi7fFDhmbFSIfZH9N0A9lY9NXXd2R7xcqOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyULEftwaxJ/LvwVxitfn4ur/TIE117J+rmM+UYvaqo=;
 b=n08Zy3Ua9u7MzAyqGHQDrH2OekG4AVtsoXoAjp7xxr0U+g2a3cLP54uS62cJFIKIO/a3Aob4QiaaetGWbY3lRSD97dWrLuq+PsZihsy3uSUKR+i61EROVvyMaAjAk3/kJkS9trtP9ndQqbcwStrVL0zVNr5+kysFuYxu5r7CbOPEOjBGCC2np6XrSoFq2RdrK0RmnFzIdkOASHIARuCQtTSV+GB5JK62eR6Rcxhak14PaAZ7R4rVgioW0pw0w93OAM6bOfRNBuRUx9Y0c0oyP3aE33q8daLEAjRDvuLf2l2UdxWKDryUYIEBpPc2UIpav4E/g7zgyiAmqWRox41B2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=stulz-digital-solutions.com; dmarc=pass action=none
 header.from=stulz-digital-solutions.com; dkim=pass
 header.d=stulz-digital-solutions.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stulzdigitronic.onmicrosoft.com;
 s=selector2-stulzdigitronic-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyULEftwaxJ/LvwVxitfn4ur/TIE117J+rmM+UYvaqo=;
 b=vbjFo+Cgsfb+P9wnGGrEP1w5jm+cWkwrFHjHAbvoNzb2dpEVnUkyqA9x1ZhXZ2TvVkI2gz04WiuAyH1ZIkokZXd2fBRpsrgcguyTUkScrsHj44/4QP2cAXD846EiWK2k3Z7V3RWELF70PNQUcYRV2Av+17ZcEOBz7nenJUAB8cs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=stulz-digital-solutions.com;
Received: from VI1PR05MB6654.eurprd05.prod.outlook.com (2603:10a6:800:141::20)
 by AS8PR05MB7688.eurprd05.prod.outlook.com (2603:10a6:20b:258::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 09:32:34 +0000
Received: from VI1PR05MB6654.eurprd05.prod.outlook.com
 ([fe80::748d:efa3:4d81:3551]) by VI1PR05MB6654.eurprd05.prod.outlook.com
 ([fe80::748d:efa3:4d81:3551%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 09:32:34 +0000
Date: Tue, 28 Jul 2026 11:32:32 +0200
From: Harald Brinkmann <brinkmann@stulz-digital-solutions.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes/cmake: use correct CMAKE_SYSTEM_NAME for baremetal
 arm target
Message-ID: <amh3MDmmUlEfmduX@rocket>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0185.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::18) To VI1PR05MB6654.eurprd05.prod.outlook.com
 (2603:10a6:800:141::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR05MB6654:EE_|AS8PR05MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c53a0c5-acdb-40f9-d025-08deec8b27a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Kyfl6lR4O3yg5C/qcy7uacEDr/OmhimP53x0ucFgP5LjPi96sl6cjBtX5v59T8SDNGdUOyakFbhP+32s17GToypI5aYNkwYrXoRMIIgHvJq9cgVpwt6UbdJIA6+X4yxZBKva/iSq2QLLfRW4nOwhF1RqmaZAJYo1sS6ZEzjJyft9+dpTNS2r2QDswL9tEDSrqAiTH73EmrOQIFcB8UlrMKFMymuFGa5qoffDC1+SdMeRrm+vkDBM7OvSCCldJP5rxH1mizHtzx8dYY7B6nGrAAvY0QhORdqXjmYB0fC8MovOUuubn0LHRlZcjAquthkpf5ifha4M1G1tL4ttWyW7S6IrFYeTK5/+XJ1lD1bduuIOz4uFutCZpNH54HsBzuA/PpYXKeY0YordwdWstdhE9ZhLTZw2//fMSWlgfa3xduwdAoYCB4zJLvnY+6csNKberdYiTY5SveJ6+R0kTFZDuIaAXcS6HQAPSHLwgZUWOgJzAvCh4D2gHURl8wFIw7t61CC7oIUYPFv6F8Asg+tpvahHDCDy758n9su1STxNqNCTzppmlJFQs+uF0tPcxwJPETn7hfbz5R5AVV5ZHjArOvRG4JxAvBCe4rpWxPtLPtvBNBunu19NCIMz+/S032PPWklGrQF9VdJvF2stqEqZH0woJ+xlSCb+0jicRdBXlts=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR05MB6654.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FH9JPr9eAtdNC+hv3qZah6KG/CreZJ1Zhs29ZZFi5ktBC1M6VKCV75sr7/dJ?=
 =?us-ascii?Q?PvghXis/t85vgHeU6QlWOKIem2f7IQgm3s1DtP9U+MBqU3P+ADfnjbqMranR?=
 =?us-ascii?Q?eqI73XLh/eKkH4eBlS3u296lhq/mcdezpHggbxppRGQ/QmDbV0tNB7AQXOkm?=
 =?us-ascii?Q?Hzl61HEh465sxmrFXWK/pHnfE9NuZ2kN9vzXAwJHA3GlW+39T0KvseVUbwjL?=
 =?us-ascii?Q?V05C/igavVsCndFLVw3gtFTaz3GG1FvzKKsAK0x6Kqh/DKILRlE3MmRIirva?=
 =?us-ascii?Q?KIq3DOnNNE4sNK7FxnW7etdK7J0LRf8PPSZ37249CbJ48ZeG7JYjFBaEZDYa?=
 =?us-ascii?Q?dohyqk6wSHQ5uCuRPLawooATZKxFH8hye34K0vE0yojUdoc/W8Cqhw3/BS62?=
 =?us-ascii?Q?JcBKDTq3LMAf5P2PKV/3eVvVJC0+fIV9p/+6VTjRRMieAcm/qS8jSDxflKLC?=
 =?us-ascii?Q?pw6HOkgHnsGIZdtqe4TXwK5BYNsoy7zojShEqnFVGZGeYaNzm87gpI6h/d/K?=
 =?us-ascii?Q?nBGJNh/d20Mg6PO9BVe50IbaeEhSnKyCc1x4iPTc2pilcERE1toOpKVkpgdb?=
 =?us-ascii?Q?WS32yxjQuepTi49beXjvLHDX9+fAvph6cIAILgZKCkZwDYmqHu+mW/iM4HbO?=
 =?us-ascii?Q?1toKw+ygRNzWQ2M7zYQLDdOseB2wZOiXdbPBQYc5Zmy1rYOAHFNHUxpuaagP?=
 =?us-ascii?Q?57VlP/gBDe7gPfagaDzWFAmjPfOEATz+0QVDF3TB5WLtjo2DjLPghVCLnVRc?=
 =?us-ascii?Q?cj3pg3aUD3mUnXkYQJTktrGAcJms1Kvp33J2apHyGdv4RvfhQQLHGa7rq1ar?=
 =?us-ascii?Q?2e3hH6AM/oHNHMBM4ymKICWxArtXKkOX+ndjRltfajrrRi9aPnZ7EL9KWyMl?=
 =?us-ascii?Q?hY2KSZzTHkX9wCtg5WT4PcvRR1qG0EdmNkDsq8k3HlLR4K/vrsY/EQ7NrLvP?=
 =?us-ascii?Q?PAZPgKRTPOQSZaKT5No/7lJQmaVSn53j9sF6V6bhs+m5xnPB618fyvcm1NAS?=
 =?us-ascii?Q?OFU012aRlPdY1udhiyH8Uz38/AmTrVYnuKWxx+Aj6jSfCQ5rbKnXIP65cype?=
 =?us-ascii?Q?kc8zed0tB1y1iI+BBL4jUEVMyNH9WbJOIduXt1PPvGn/zc4za0nKN3jShNwF?=
 =?us-ascii?Q?wDpapXn6sIOXDITrjAx/f5puXeEthfZfvXijM1LebSDxO34cReq5CFHR74kp?=
 =?us-ascii?Q?scvbuUfq7bbz+5UtTOA7MEmFYPHnS5TqM2Z1Z2YycgscjY99LH0PjIQlBr6A?=
 =?us-ascii?Q?nhUvTfJGEjkRBBqDFX4FJjHRCkc8v4uZhfL0gcnVo8aZDFV02mrBU7FJwKHl?=
 =?us-ascii?Q?OyPljpYgdl7DabXVdtcfy+pwo8m1y9xa3V3ZdZXKeSPNB7L80V7n/7JycnAB?=
 =?us-ascii?Q?ZFSya8YnbCHMvKpfaAj4FuT3F9oPg8r5EEVsSy4kpvPKQP7FwcrC7392n40e?=
 =?us-ascii?Q?Kkwjp+pAv6LnbQSNutDafm0BpnhLytgUM7LXoi56g/mxy3MyPeJCFjGZW+xx?=
 =?us-ascii?Q?CDGyYYsY9MHrWuxXsnCezeW5Cff+qr7HJNJjqJ6C1Ar0VVCgDFKo8kiBi4eG?=
 =?us-ascii?Q?WtqYH67LNJaWtYYDAMiy/O2iIpPAw/8An+GnUu3k2hv8XmKiJ+KUqrKnuH4D?=
 =?us-ascii?Q?p14IaF98Y3pDKDOlh7JTML7sKoGN4tn0+X3BFcG15uIFWW/jmaNxsGsnsNs1?=
 =?us-ascii?Q?2bEUbs4ANgCefG+0PA+pxzmDSwMpkP88xSz7Vm8sd/KcuI4duvQXHoxmMEGJ?=
 =?us-ascii?Q?z7HRYoBj2i4ss04zvCwpSJWQfuRIbYoxfoRNropN+fjdTsTxHeFS?=
X-OriginatorOrg: stulz-digital-solutions.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c53a0c5-acdb-40f9-d025-08deec8b27a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR05MB6654.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:32:34.4886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9b1a755a-f0dc-44d7-9180-b42e99016cf5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjgwOSZwJE4q9r8vGDEbwhnsAxR0ijvykTgc2VAc0Iutg/gZ5im8aBdHb5Gc2tB0E7ZObQBKW5ApmvEIRoQEQVciJrFh3h7eK1u1AVTfoCnabTKxdm/rcLFRSBWV+t0e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR05MB7688
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 09:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242174

Signed-off-by: Harald Brinkmann <brinkmann@stulz-digital-solutions.com>
---
 meta/classes-recipe/cmake.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 4f59966521..a1eec6b142 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -103,6 +103,8 @@ def map_host_os_to_system_name(host_os):
         return 'Windows'
     if host_os.startswith('linux'):
         return 'Linux'
+    if host_os == 'eabi':
+        return 'Generic'
     return host_os

 # CMake expects target architectures in the format of uname(2),

