Return-Path: <stefan.wiehler@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16DEC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 09:45:39 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.121])
 by mx.groups.io with SMTP id smtpd.web10.4704.1654163126402058145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 02:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nokia.onmicrosoft.com
 header.s=selector1-nokia-onmicrosoft-com header.b=cGm7Y7jS;
 spf=pass (domain: nokia.com, ip: 40.107.13.121,
 mailfrom: stefan.wiehler@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYZocTTIno8Gk9wfrkSzBWZscQ8+oEnRHlqkyzpxPrKeCIiLcAVX0j3G7v2Zmtxv08jpUA3WJSGFlrdKXyLqP3yMpgDlBgSidKlbG1mHYyx79DCtLOZuQ2Ub6EJ57VhSmnjPU5QV4oboLHsgeJSOaWI1sgM1Wj2PULEGPknrhH2APpCuvd33S5svWLRp89fJnFGN0fBgSY6xGXk9aH31ZHBFVqvhwal/0OIoJLe4LpP8upFTvEyc+aXqIGcmzxGW0cnxF17oY+u3f+J8UyI4xOEpUIN30N6yE3DPESm2DL7qPBecw3bP31Hdzxe+5Gt3L7iSPWKA9j+niiB56gWFOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPd3xWaMysKXPOAnNgRwNTJorJdIk8wPxO/AXkyCkvM=;
 b=W2an6sIHZSdEKM0UTaTUrEog6D86xyXdSrGix4c59v/p4FYJ9BmTXIGeP8Ua3IPdhMdD6BHMZBGhmH0QvOZkGKrw+p7YMsbvziEE9ZZrozVQ8jr3swqO9L2p17B34CiZ8N8ONpyPkUOMom2DtiWA1EVcaS3NvnYFJ6IE/z17h/Cd6n6UDi5soTfCiqQaY6ScUpEW4yPL2iz96M1pba8RHDAQd0tl8nhP3qMPfNjhhwdedPMgYi6dTxtmAJ6irSHVgQTHOOW8Okh6lojfBFALBn2TB0r1OMLj6Vz0CV2VgNrr//II8lPNM8HnKm9GCOUBXsbVp8d7s4FhNRdoVaTGnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPd3xWaMysKXPOAnNgRwNTJorJdIk8wPxO/AXkyCkvM=;
 b=cGm7Y7jS3fjTEgKOVqeO0iQeq4p23Ii1Fgt+lvq0yorDE9Me9dJAv8LyD3vmiUe7RRisHkMGSSMgBu3RhJKgCCmzQeKXMZQu2fIW1jRRTlU1d/N+fz5KxlRrgD0JlrYMrm9LbuCom4ctIZa5XgzhHyckd4TxUqNceqhQmYacED0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM7PR07MB6705.eurprd07.prod.outlook.com (2603:10a6:20b:1a2::10)
 by VI1PR07MB5453.eurprd07.prod.outlook.com (2603:10a6:803:c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.4; Thu, 2 Jun
 2022 09:45:22 +0000
Received: from AM7PR07MB6705.eurprd07.prod.outlook.com
 ([fe80::e4eb:2415:6552:3e39]) by AM7PR07MB6705.eurprd07.prod.outlook.com
 ([fe80::e4eb:2415:6552:3e39%8]) with mapi id 15.20.5332.004; Thu, 2 Jun 2022
 09:45:22 +0000
From: Stefan Wiehler <stefan.wiehler@nokia.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Wiehler <stefan.wiehler@nokia.com>
Subject: [PATCH] kernel-yocto.bbclass: Reset to exiting on non-zero return
 code at end of task
Date: Thu,  2 Jun 2022 11:45:14 +0200
Message-ID: <20220602094514.4402-1-stefan.wiehler@nokia.com>
X-Mailer: git-send-email 2.31.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0271.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::23) To AM7PR07MB6705.eurprd07.prod.outlook.com
 (2603:10a6:20b:1a2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c267d340-40c8-4116-b222-08da447c9cc0
X-MS-TrafficTypeDiagnostic: VI1PR07MB5453:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR07MB5453538F28AEED07F6D952B39ADE9@VI1PR07MB5453.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aN2WQ2Exbg9mKAFa2UQhv9cuoEZEenG6hSLZS4KYblElcB7kIm1NEeEN5RBoA7DRfUN4EL222At8nWM6cZs49kWNb2f8r+xbRUnkmkEt1gv2Zgx/Eaxd5aWfwwjkq6v84Q68ggG7vWaKPWVpADsOle0ef52Smh4t82NLp2YSpkBLK2qHzse/oBbmRXvpkZid8VevEMkt1Ys9JcEpTtqiTsnyhs1N5v8oVyzNDJE2HN2JHwzlUDJyimibsoMjR66tivFve9vdWEtopaF4UmCrzBRJAuGewo39HPTjXz+OxwzgxeEYxFER/2MSbmiBEavZA0t5iHnFSOLqKe2foA6nQD5i0+vKqLbXc7aah/6TG1THqZD298G52snsEyEbsI2z9fL6psKHXAuIACL4+qloTxYNGEt99HI5cBBLTRCZ3NKKuXd1jYbzSdmlmdOBVoD+ftyfE/hOTwzoGxKr/hL3jjzg6rDNUmWm+yJlmXtMH3+iuASPUbxzp9tqEYa73qdM0OD3D5hc6SSxjqzjmX3AynB2s3aggsxJ0JobxyZSvx4rRZCZBVv9i5vRxqdwjPluI8fCeQIlHttYF0gpc59dc1WywPwlSpGuDhV5PCGWhf4Hyrm+Q1v2Hpf8CfuujLxSszyE+6hBQbNAQSBp+KaAm3MhCNlQdKLQ8v5Qq3faP2IbcbrzrpZsXIRDMBAWVVY+uW90C7ihrYOXfCpGjAKn1A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR07MB6705.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(6512007)(1076003)(8676002)(4326008)(44832011)(186003)(82960400001)(36756003)(52116002)(26005)(8936002)(508600001)(107886003)(2616005)(6916009)(316002)(86362001)(38350700002)(38100700002)(83380400001)(5660300002)(6506007)(2906002)(6666004)(66946007)(66556008)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DTw3HEOAOC9UIxUDskwBMug3kiSGy2h0Q03yDN5tYXmV6/8fYUgyGgqvipZD?=
 =?us-ascii?Q?FB2tLPrd7x9CSjla/7SyCcbneHKjqTFfKFiNEa2cFUygRmDfUOFstzN18nBl?=
 =?us-ascii?Q?TZBb4I7/4Im2wJMzKB/EsNBuYE5accmjmGmIPA3TbotIhPNijXzcHJ1P843d?=
 =?us-ascii?Q?N96Gbpln2HHm9FgnTD2va1XR57JaLTKtoyKnAtaAP2wvRbLwYg9ZvJqK3by+?=
 =?us-ascii?Q?D5QtTrd+9sEuwMqWIGCDh5Cj462x7nawDEnPPLiqlPrEmPCWg+J6P1/ffVqG?=
 =?us-ascii?Q?cspehGvAW5PdYA1J8mSyA0KRHKqdG7kelCMxUDzxR9LpwejOWxhibYc8VG/t?=
 =?us-ascii?Q?KoNQPzBO+wUT/5o/fUmK6an6Y7EvBaNDDTBbWOVGtI8NVboJVvAYAVYG+2/h?=
 =?us-ascii?Q?QFBis1dU89ayg3cZdabmVejv5gEbLwRJqLhqPV8AGLKLEmilpTLRMMvgVbxa?=
 =?us-ascii?Q?Ukng55SuivhmVGZec8NKoVshyroQyzcigR7re+/+BuUa95I26MrYoG3jDoPP?=
 =?us-ascii?Q?N3WMnCdPEecsyBfJdd4Y9S4XKYofKewNzS+Fpbqut+JininVrV9tVzKbR6Uw?=
 =?us-ascii?Q?jZhthzC5siDtNSnYF6ZWgERRLkhFAcFKCNdkgeD17EQ1jEthXdf/pUlfs/NV?=
 =?us-ascii?Q?Y+GhHL607cKqCU8VQVAkJHJpD/1cEtg235iGLO5wbwF2kOuIE8v5l8AZiHMI?=
 =?us-ascii?Q?5+OoCT7dJdqYpP97YSRfQgUVOo9tW/rzCC4hzyJ9ir5CwaKfPVyilsywxh1A?=
 =?us-ascii?Q?z3p73bGTi4kNK0Y1M1EfIg3H+x5ZvUJ0m9cqgZVmJiIOFsGFbT0yD4kJlZzY?=
 =?us-ascii?Q?VjfDr1RhqRD8eXzVOsAlWvdMIKOfeh/aCIOyGpUvX6BiryqajC6OM4K5X556?=
 =?us-ascii?Q?X0x75iOURBvJG9PhDk4Llg3RM6rax2xiVQvi4D46f8YwiKFqdhdjG90PDOCB?=
 =?us-ascii?Q?sgvWdKWmN6f7SVdk3AvTm5FNJrWmGPAfLJEWrrnfHWntb0+375CJG3sjFdUm?=
 =?us-ascii?Q?k7INCyYZei4AZZPhhVa+n9fdZccWcIWstnov3f94G6cisNdDSOKBo9bvvgZM?=
 =?us-ascii?Q?+MmAIOraAqQbL010VRQsSGqPsQIJftAsMGBmCtKtdVBqyXqWhmEGkb66qWjQ?=
 =?us-ascii?Q?AMmRawcazQZ7DdVC5EvoddaYsBWHTeaslpVgldRhVU+5jKuNAsuO2eiPmQCp?=
 =?us-ascii?Q?bfrWQ8+BvPHLkUpvf7PNhTZBQaBAbrmF5Nm/gFdvFwCy/ZlG6p2Fuc6xwrHb?=
 =?us-ascii?Q?Sv9TP+ZCKdxVxlQAMRJAdEXPt4iWlr+cphgVxwBZXw9YhGoNjqX9Y2t1K0y0?=
 =?us-ascii?Q?rfYaq3jv5/6vYnHnXQ9cdWc4HwmckwQ+B4q+HywzfxchNLSy7JfO/aDbQZjc?=
 =?us-ascii?Q?gTpc4h0FFoVs7NzIuBNiad95WvKkP8TiTWvIMzIYJ51F2hWqM/okQd+Ba2YU?=
 =?us-ascii?Q?XNdkU5fh4F1dcchzg47GphTIC1aTNF3UTYndHHBI00sV1Otgn7B1ZF0MyK/r?=
 =?us-ascii?Q?zHjfdMmUGplPpNNw3i2gq4PSv3ONw/zU2pEDj4xOZwZEIJGDW9BBNHJc6pzm?=
 =?us-ascii?Q?a380QKJ0OWKpzZqO8rL18k5OGy/UmZwde/n1SgP9cqdGuXEugqBoOmKrYI5z?=
 =?us-ascii?Q?XVBWI78lJSw4tOhNemorvm2zRvnEQlB0x9sOY/EMXfrmJYkVxXJrFUvLCml9?=
 =?us-ascii?Q?N8zlrPOSRNUffi1VpibJdixqC/IqZ2zaqDyRVUgPG0SO2seESSsGQTxucBWp?=
 =?us-ascii?Q?4fEBGyaEdyC59oDtMQ8u31cB7rm3Sf4=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c267d340-40c8-4116-b222-08da447c9cc0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR07MB6705.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:45:22.4885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CR1gDEU2pP671GjYxCY6tgn5X6J3A7+ljRGU/+wmnxt6MJLV4gZTh4srDz1TCNwjoocEzk+6NThkXeEHXMWFZHpSYWp3JzY4IG5GCRcKuSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB5453
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 09:45:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166468

Several tasks deactivate exiting on non-zero return codes via set +e becaus=
e
they run subcommands that have legitimate non-zero return codes. However wh=
en
appending to those tasks, this behavior is not expected and can lead to bui=
lds
silently proceeding in case of an error. Therefore reset the default behavi=
or
at the end of the respective tasks via set -e.

Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
---
 meta/classes/kernel-yocto.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.=
bbclass
index b276ded775..ce1446f7aa 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -310,6 +310,8 @@ do_kernel_metadata() {
 		bbnote "KERNEL_FEATURES: $KERNEL_FEATURES_FINAL"
 		bbnote "Final scc/cfg list: $sccs_defconfig $bsp_definition $sccs $KERNE=
L_FEATURES_FINAL"
 	fi
+
+	set -e
 }
=20
 do_patch() {
@@ -343,6 +345,8 @@ do_patch() {
 			fi
 		done
 	fi
+
+	set -e
 }
=20
 do_kernel_checkout() {
@@ -401,6 +405,8 @@ do_kernel_checkout() {
 		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
 		git clean -d -f
 	fi
+
+	set -e
 }
 do_kernel_checkout[dirs] =3D "${S} ${WORKDIR}"
=20
@@ -695,6 +701,8 @@ do_validate_branches() {
 			kgit-s2q --clean
 		fi
 	fi
+
+	set -e
 }
=20
 OE_TERMINAL_EXPORTS +=3D "KBUILD_OUTPUT"
--=20
2.31.0


