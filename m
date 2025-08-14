Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9628BCA0EEA
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 19:05:54 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.10])
 by mx.groups.io with SMTP id smtpd.web11.28617.1755193118606371115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 10:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=fxjMzQiu;
 spf=pass (domain: ericsson.com, ip: 52.101.72.10, mailfrom: etxtrex@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpQZQ928AIw9/vRZ1XCbiVOG0YmuKFI9vjU5Q4PoR7hErN0mUc+gD0+qr0wKwoMazil7oRrglc0rFlOQNmpC40Bc9AMyoaQfsHxc9ezAFXFKp3O3VlUQe97BcDHEd9byrpJgjxBAe5cbRw6XL32ICLDFhbAO9NNq8/ea66srBWtUr8DvmaaYYOVVEvWPHOuSWU0h7AsNlu/Cp6NQSqPIWmK7uUHf1wSRFx41zOLLw6o3/BUDGn1Mg+nIxQ9ix1zzt0e0WikRE0CKB5HwW+NlxDiOMhTgHF4FznVQ8wb80QHJphpDmzc9W8v3adV2Bbk5YhkbHGxEPPJG48Nj7KcbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UsxuxqSGcDvY9Hoo6/6+Aq/Ods4kDkd7sZWH3XVlqc=;
 b=NdqHigwpIhQBfh2sAISlrEOky6vmpJnP3uWX76SwbD50ohA4hHveoQmVaHB0upmQCTiCVoRxkCyh40UqnLZTEH6/LEOMMrKLo9LSz0o8nTz0MeTktp8PunOvltPEBNXDKiATGcCju9Esfsty7juNf1M86BHcnjF+eScRHw8dMytFo3xnRCTmPahzy9XAoJn3KvyYKc0zPxGqJ6AS7U4JqahbZQTno9Hjqu3E+hQrb1gTUEarWES1zvIWUp6TgZmBTFfA64M/pcS8dQohMcAwyEcv+V1qK3k/YxsEBCCPHpIVPRNPsR+9GBaT2aKhmgK9kX74HM/VTXS4yVmCwvYTmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UsxuxqSGcDvY9Hoo6/6+Aq/Ods4kDkd7sZWH3XVlqc=;
 b=fxjMzQiugMMIld6ZTQj1Gl3g2vmEpPJweo3B49xJzU1uL/AKiPKeHq0+QnzSPoruFu/3yzXTuQxWqksxjqYV7Ywga1i0hEbEuSp9jZLK9iuUlY++rHOaxtnnbXeu1TU/Y5FtZA+Z/Q9zhmVHxY/fhS2CnrH3O3KZaLYt72adexieqMJ67YETRCj3zVnTU/JEbrw2ujoewuydCy+9tKTWSCnh7OzvRWwxCq6bZvhandjuBmcZ+dpaO1bG08A59QRKCzqLkQmmpCPWdrMgGPw+IsVP0356pes98v8lEPh4+GXyFL7mxSbE6Rpjt0iuswM2bhUjdixCNubuHJHngQ+8UQ==
Received: from AM0PR10CA0099.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::16)
 by GV1PR07MB8381.eurprd07.prod.outlook.com (2603:10a6:150:24::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 17:23:53 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:208:e6:cafe::64) by AM0PR10CA0099.outlook.office365.com
 (2603:10a6:208:e6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Thu,
 14 Aug 2025 17:23:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 17:23:53 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 14 Aug 2025 19:23:52 +0200
Received: from seroiuts01755.sero.gic.ericsson.se (seroiuts01755.sero.gic.ericsson.se [10.63.162.68])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTPS id 92E4295683;
	Thu, 14 Aug 2025 19:23:52 +0200 (CEST)
Received: by seroiuts01755.sero.gic.ericsson.se (Postfix, from userid 3150)
	id 715732C11DB; Thu, 14 Aug 2025 19:23:52 +0200 (CEST)
From: Tony Rex <tony.rex@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Tony Rex <tony.rex@ericsson.com>
Subject: [PATCH 0/1] base.bbclass: Fix the recipe parsing race issue
Date: Thu, 14 Aug 2025 19:23:08 +0200
Message-ID: <20250814172348.3882586-1-tony.rex@ericsson.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|GV1PR07MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: ed88ef35-446f-4861-73b9-08dddb57577f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d2WCLo5+RmKBtwu6EDo8ssE6UipJ5DgUOc5i88op6Aef16C0S0J9Eo97A1ib?=
 =?us-ascii?Q?Uv3aN2io+byEWUg/fuaqD2TeK7ZzaajliYip8lg/9heTnQ3XUivTpFeau3hB?=
 =?us-ascii?Q?Fd5F3eKPgwsBp+kv4iF+FWwKwfj6zSSi2+X9A76gotSKZxKqy66bA+i4oIf1?=
 =?us-ascii?Q?41JcytA4EI3De8Hb/QARUfZZDTGpBWBl0K3mSygWun44gym74RPP26+XLxXe?=
 =?us-ascii?Q?lxm1QGsufeDdhmVWjdmuAxxB2ZDplMZiYUHnG7uugD/i1u80eeiR1DcTzOQW?=
 =?us-ascii?Q?fLviOCkiQQRESTPw+DR1PSTPOwTpQgqrBFULIJx1SCRRKp0+Brt3J7TpDTi2?=
 =?us-ascii?Q?v50Mc9q2maywB7JnquEfcvjWOvDX75zZPKkhIkg2LtypV5jrJlJCWJh+3zfn?=
 =?us-ascii?Q?ttveqIsZ9ZxIWIheHurvt9J2h7ACm6vD9AYBJtAyfaYGV5F7zI2g2V3g3ZkX?=
 =?us-ascii?Q?45ZbP7tuqZcFWxb+E2t+9YZUPAREzKh7bLv5uumpOkdG0clpPqyQxQ6qHSep?=
 =?us-ascii?Q?FNOIbafU4Q8JXdbOvQcMwpbpBiOPKOOx9Qs6KN6jzJ+o9tpKeFdesBP/Hewh?=
 =?us-ascii?Q?JTK7aLIfdmLB1NkNVSPfOuR4H/J3PfRu5PKUZhjufZYAYHCSsZ+w+BofvISg?=
 =?us-ascii?Q?K+X0Ubu4FH0RI+ZDrAxeN1ZemkNSgrXD7lvzMwaMvmAMLZzme5UID0Od/DtG?=
 =?us-ascii?Q?9L50LYs227mKxoq5g3XRe9cbk/Ioz4Y6vcBSOxgXVEfoWwl9ntqpn8Rmmg1O?=
 =?us-ascii?Q?Yjh/0TtuW0Y2VyhZHYDxn/ydacZbZC2bWNIB24xWX0qzqPu3wCGX20YRvyyP?=
 =?us-ascii?Q?Dttwv97gW5wQfzDVcKpSWG4BCuWdsjwV88dsbM/RNKbWynOJQswdGKhJd2hl?=
 =?us-ascii?Q?O0CjSsuTfPizITcqvE6QzQ0XkPIwJiauWPKHhLNguRjiRQYSCUu+0V7502mg?=
 =?us-ascii?Q?0MT+9O99wi2c35nnfgq4+NGxwu+ePpjvhmORhpaOOfubLTOpqHsOCBfoolHP?=
 =?us-ascii?Q?QgnQ3OZmdDCaPI36kKSu3WYufkfSB0TTCbCsiTP6JZka4rrXfAb9EY4xWEoD?=
 =?us-ascii?Q?LnbGjxii8o0e6/Dkxl5GtDyOBYYNqn0I8acKT9NUv0mQJlJqh86Mfz+NBI3v?=
 =?us-ascii?Q?Xv+VM//GuIxwIgSkjH8dXR5UQwEVZKLnYUVITgYsNaT+wZau0rKt74kl2cjY?=
 =?us-ascii?Q?MutzRBPvBY8I1kMopdpxD7o4MXl8YiEafkGsuxBSTg5Vw5mJalOwHytPb7pg?=
 =?us-ascii?Q?tj3IMti+YTUNGr0YQ+FnutPgJekDSavatEU5ygQ0dXkhmEBCzqqpcfQNCe6C?=
 =?us-ascii?Q?+8TnXJnEkhm4vXD8BtJtqCUeXl1PO9TTf4q5/mA6IIV1v+PRTi81emk7ddrx?=
 =?us-ascii?Q?mPNznJ8MLb6dZjO91iqa72ZfLBrUzT4eMBtmuNM76//J3JZow2wogTFTYP7/?=
 =?us-ascii?Q?QEC7O+kM9WlnFy2pxIpcNULF6VPpZPtsCYv6jabJruh2/2i8yu4mbuJ89xv2?=
 =?us-ascii?Q?vdzyoJ1gWZPFyvqIm2mAj8/+sxTL5XSUn08R?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 17:23:53.2430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed88ef35-446f-4861-73b9-08dddb57577f
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB8381
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 19:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221869

It seems that the race condition happens when doing do_fetch on really smal=
l repos
and it can be difficult to reproduce so below the other case with floating =
tag/branch
that is easier to verify.

To verify the floating tag/branch issue have s simple recipe hello_1.0.bb a=
nd set the SRC_URI to
SRC_URI =3D "git://<repository>;protocol=3Dhttps;user=3D${USER};branch=3Dma=
ster;tag=3Dv1.0"

run command bitbake hello everything builds.
=20
Apply the patch

run command bitbake hello
ERROR: hello-1.0-r1 do_fetch: Bitbake Fetcher Error: FetchError("Recipe use=
s a floating tag/branch 'v1.0' for repo '<repository>' without a fixed SRCR=
EV yet doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV for OE).", None=
)
ERROR: Logfile of failure stored in: hello/1.0/temp/log.do_fetch.3289932
ERROR: Task (hello/hello_1.0.bb:do_fetch) failed with exit code '1'

Tony Rex (1):
  base.bbclass: Fix the recipe parsing race issue

 meta/classes-global/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


