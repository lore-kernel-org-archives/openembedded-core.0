Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56614C2FC14
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:47:09 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.75])
 by mx.groups.io with SMTP id smtpd.web10.186317.1692276423793454116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 05:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=ET/AdDHD;
 spf=pass (domain: welotec.com, ip: 40.107.241.75, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwWLQfYZUYhMVtFe/5mTEvLPnlmkaireD++lGrjwbJDy3crZgzNX0MOu8bf0FXYz9p7nAEpiXF0er98BjzPBrYNhPEzM+jGqEVKXtF0/oxkvUWGeMTIU5OXfAhsWJEctj+GdXfls2ElXvs9S/KpSvToT4rsqWmT2X0+dJO/OsirQHY5QG3BZvb0DsgYRDkpi4kAqjTz/7BjssLXkeNyzRqJAN+ZsR5R/jsrmIFQd+zeYrv81xp/wFpn+pSfhZtBSnXOrqPtc8vZLkEjJrPNoYD1Cn+eYy6UJ2YJrILYmUsbB+BLwwFKwa/khDfPLAlAda2plV7bgBZsLXs0tF/KAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TF+qEwmh50REhyZ/JRvQy/lPDHLg5sfGXTakJMfjslI=;
 b=IvsnvX0PgptZLWDh203ZWPgPXvTz/5Rfx4iKC0ZDcjaA87NHdyjzZmt7Gw33wvFL94lEdwLtK2q61VJ5ZCwBfijSx5GfWhRiL55ush/2XsrVHkwJ9sc+I1Sk/8LdASN1Qyukhx6HqF0sOFgS4201FFWklEq1HKiNXPLJyVjnKXw5QSuCZajBmEeRxOg/XTQiOJt1LfKysL53i9GEgmrszOzzUDIEuBe3RL90nHIjwJowin9JbTGVavr998hCfOJqz3ROs0LFykUg3JswkvqyjneVQ203KTRVVLP3GBZw29EQh0bg16U5dfLMypt4TWUaMLUSKQRcQdAuGzxjAHy8rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TF+qEwmh50REhyZ/JRvQy/lPDHLg5sfGXTakJMfjslI=;
 b=ET/AdDHD/Uo5q0LlVB6nW+UB2q7AyG6h2nRr9TX4XEuTJ2TABskltU4QWWFY+Mf0uKDXhVgE6n/GqdCWPJz5kj62CpzAbZx4v+GXko7/hil+EZBsBx0t+y0F9BT6KLLj8dY1zVQNmPbZiiadpa6Ti07Ydh39aAtTOctd0rcLjJBkqqfa+Hq3qG4EUaVQhi66fogrgo5DigILzegNdC6iEEE98zb2of5MorrlpEJABErALWFLsZK0AN0apg18I6HbPN7x9LGg6hndI6PWZwazOnIgudGQPyiNH6WgGR1uSqpfmd1OofbCNFzG4528GQ5cxa/pBvTEH2CmT+FleXC8RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 12:47:00 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::b693:eb1b:b0e6:9a06%4]) with mapi id 15.20.6678.025; Thu, 17 Aug 2023
 12:47:00 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v13 3/8] package.bbclass: add support for ACLs and xattr
Date: Thu, 17 Aug 2023 14:46:07 +0200
Message-ID: <20230817124612.1043464-3-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817124612.1043464-1-p.lobacz@welotec.com>
References: <20230817124612.1043464-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0249.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::11) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PA4PR04MB9224:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f694bb3-6025-4fe6-eb7f-08db9f200ce2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	piUaFZKJRb92IVzZYlz9D/9B2HF7d6AB4mkDgPZKEo4hFX594Aj/Co1D4dRbeECEQqu74Ih6wXiDMQpyHCaozYTB+vFwTLDTV1DFRr0fH7HcI/1VP6RZvYZL9eMXDK3IY/Y2QIKFdNm/UYIfG9aFsO0cdCtIswHNFFMrVRGgOj/YAmOQPOeq1u1j79VG+fxuJtjTGw2wTUKRqlFJxq762xxrviSRLlUtNxFCi1yibyilHRIz8TXXY5238RpxJMPVOgQ1uSih1EodXIeC8gEVl+Zr1k/i7IIDMUDgH6MbLU+FeswOoVXlHdkdyi883MaJj8L4HaETpheFdZNS/Fb9X96YcRRzt8UF7buc/Vk2lhiofQM+xDHjQIswqG+Mo3s5LX1V1sp5ht25WrypsEMmbrXiCiokzj8u1xpwE6WMC3bwptkK86dJGFgf3qaiRQ7Fn/7ZBPKxtQ8W0FXgqy3BqqZZxqVR99QvociBfesr3ux0W93FmA9pPqLHC1UkLCLnQUuBQ/+iUUWFPoQMyNJrz+maMss0PyAe59HP3BKnj519IFj11tUTbgm9QNQhmndZpiY9JhCT+rhbMslWMHkAV2UHcczB1N8VhptAdv2LpeT9tFHFcVIl654vD7X49eno
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(346002)(39840400004)(376002)(1800799009)(186009)(451199024)(66574015)(83380400001)(2906002)(66946007)(478600001)(66556008)(66476007)(6506007)(6486002)(52116002)(6916009)(316002)(107886003)(5660300002)(2616005)(26005)(1076003)(6512007)(4326008)(8936002)(8676002)(41300700001)(36756003)(86362001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N033DuUxvVTYmy8+wh/2WITvb2xnxgbEVwX/R6dJgqLsf3uepM+PmllDeVhC?=
 =?us-ascii?Q?iM8Zqi05gsBgtKOhjksA4/XmC7LHMHquBTBtoAp876B7HsKIF6q7mjv3vARL?=
 =?us-ascii?Q?wHILv7ZQ0bIGcnuzHqE0bSxUU4hgVXOrj1DtF85tWqDVbrH+sPl1tsS+GN+k?=
 =?us-ascii?Q?MTlL2l1sJkXucFeF7Q/KvONb55EsZsmEwHUjvyWqWOpZZnbG4SXevDLXTJ15?=
 =?us-ascii?Q?97SXC+Gy+OkNBJxCDDauFMslMklnylKprhkdUd6sN/uY/vzMvgaqtD8Zdg/W?=
 =?us-ascii?Q?/pux5L/kOfZmvRMpb1SwihXyiH5lGtyNxHRZ2uXyfJrDUwHvYfP/C3B5V6oY?=
 =?us-ascii?Q?X44OaE9Za/GQaFOdzYseQDxshXw0onWwS5vouQfqgdnbEYZ+fZeuWIcEm0Wy?=
 =?us-ascii?Q?gN/ZNXPXoNcF7qrP1UmhmFQaQkoQ6IzmLn+uGrXvoxH9EHUPIMJv2oAHeT2M?=
 =?us-ascii?Q?+bgNQbJtlLP1Gyrk4Yu3Us5JRLRtsETpLx5gu/IPpBsTWFqxoTO2juXDqw0h?=
 =?us-ascii?Q?rONaA2EXYCRq6/1Pgn+EtEWj6VOFPmfh4j+zRU05WDpM8gjEfrxzynBEJ9Fh?=
 =?us-ascii?Q?cpWJWME65SBYdzgDS9gLrV/q6TfyRSaS4J7m7CGTHFHJDgqM1prr8N5g0BFp?=
 =?us-ascii?Q?7uv/HaDLXOmXoORgNxLip/Tf0gzU4zsWm63boNRObbUirrxwgrBr+aFTVGcW?=
 =?us-ascii?Q?3HA2bCnQIOEhnN857tzs12tjyj3COx0cgqIf8mNxZPxCbLsnmoxTop57eCXi?=
 =?us-ascii?Q?RWnqiHEPKLHTrXgqvC9ky7lei88PraW4O4vj7ZwyMfLZZyog7qvPNMsZu+Bh?=
 =?us-ascii?Q?Jjwvb7GF2Nmjttn113ev1N7p7cH132p3mU0QKpWtJ81cfBMkyQyWq7fY8is5?=
 =?us-ascii?Q?MUEc/s/shpgbnmdJfHnBYPCHQNc9b5277F2yo4P8DUP1uOCZROi11Oahy4hM?=
 =?us-ascii?Q?h7PiNDhldLyIQeb3dpaurZQ+jppFWPlqowhHX80lfayIJyYA1mYMpmX9xoDe?=
 =?us-ascii?Q?U62wefX6KbSvAzDubiaFgoNTKN1x7hi+fJESwiAQ4nUwHU7O7fZxm12Tix9a?=
 =?us-ascii?Q?+IwKMW4Yc+tNCJbkGds3+3kILSUwKZSlcMdG0dY9g2lOtDD4/LI7XjxY7a63?=
 =?us-ascii?Q?9n5Yp3W9S5oXIx1EucgLBx/fF9kELrrhMmqUAk8K2AjKI1zTiShL4Aqw6+Tq?=
 =?us-ascii?Q?czdMWeYZwVAMEk8CVKnZzbv+FUiDy7xy6q8QrXr0sMbskTki8EEX2vxSyPfk?=
 =?us-ascii?Q?94CoEf7q1RDkp1637NrxKjVUfnv2qMvAVSvXAXwB9Jv+7twmorp7Vt4sW60J?=
 =?us-ascii?Q?pJFTzFfcZmH3AhTB6VxilZ1gwXcWwTSip/gwZLrtyb6vJSoR9iZ83tosfCiz?=
 =?us-ascii?Q?nmXjEEuUtxBr9NdgH2OesoHj2DkeJIhslz8+MBRhEUCsCk2Faa5PO+nAqkQl?=
 =?us-ascii?Q?gQy6c4X5XYRu9BXHP5wW/s1Apq5IpoJFpn1pn4P+uiyWqPNJ6fXtGRuP3duW?=
 =?us-ascii?Q?deyu8hqRydI/zRCtCCeRcwJYSVuRK2C4FLlFGPoG+DDLvUTMyBShuzcWLoJ1?=
 =?us-ascii?Q?muQez/cBXYtUfHG8w1c+qFm96I2Wt+fD/EPn8svS?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f694bb3-6025-4fe6-eb7f-08db9f200ce2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 12:47:00.8706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0CTl2I1K9y5Z8nYYu64gsQA51CZGJrkisaT3fGfCToWKqwYnC3Kix5t6VFhTWQmTV6SzqPhW8jhBR8dfye/flg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9224
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186310

Extend `tar` command, with additional parameters, depending
on choosen package class and target distro features, in order
to support ACLs and xattr.

Currently only `package_ipk` supports fully ACLs and xattr.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/classes-global/package.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass
index e8055a9cdc..6b65641aea 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -342,8 +342,13 @@ python perform_packagecopy () {
=20
     # Start by package population by taking a copy of the installed
     # files to operate on
-    # Preserve sparse files and hard links
-    cmd =3D 'tar --exclude=3D./sysroot-only -cf - -C %s -p -S . | tar -xf =
- -C %s' % (dest, dvar)
+    # Preserve sparse files, hard links, ACLs and extended attributes
+    # TODO: for the moment only ipk packages are supporting ACLs and exten=
ded attributes
+    # we need to add support for other package systems as well, but that d=
oesn't bother
+    # tar from creating archives with acl and/or xattr support
+    acl =3D bb.utils.contains('DISTRO_FEATURES', 'acl', '--acls', '', d)
+    xattr =3D bb.utils.contains('DISTRO_FEATURES', 'xattr', '--xattrs', ''=
, d)
+    cmd =3D f'tar --format=3Dposix {acl} {xattr} --numeric-owner --exclude=
=3D./sysroot-only -cf - -C {dest} -p -S . | tar --format=3Dposix {acl} {xat=
tr} -xf - -C {dvar}'
     subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)
=20
     # replace RPATHs for the nativesdk binaries, to make them relocatable
--=20
2.34.1


