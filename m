Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6343DC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 17:00:36 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.49])
 by mx.groups.io with SMTP id smtpd.web11.13178.1645722033293532685
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 09:00:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=xieTw8/X;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.49,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nR1aLY8eaajkjgOblFnk9t/OLL60vfUNV4T1KiIPcxpi/Fqw5P7yrvl02l6+Chz6PaoORZXhpzOD7OGJHHJxXrAXjX0tQMp76EsDPvn0qv/gcZWpPCaDV35hKc5S2vMw3geMLwPqVfN77neaVnuS8+KuklXwbKqvOSaggh72tuV0upKFJ7SGsovRozBLiwZsG8aeYA8AnBERLbS0vTn5Lj44iVpQ3Sz4eUgzEzMdO3dNxvyPB4yCpdPVSQn7I7I+GJv7h7nO8u7zrEOUxq5NjkDcBPqN/PzrCF5c+IkKrEUuOChVBWbs0HBqebXITu1VPApBrB5fG5HxNKObWRWOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYsCvwbCC8C+8qRnQ+F1OxQKivL+UWnhZZii2kCzX80=;
 b=V6GC9qUKRo5w2xNc8EsA/Jkwkd7SOiGas1Oypgj330kIJbnp6VPheZ5kVT4t3ymw4kTJSAg4+q0MTPcj04yzpUu1AHXzIlGu0g06wuRNxNU0xXep73UVVRU7yXkvqflJrONhoes1OzysI/FtPjQSYlPdvVLn0MgWtkeJPv06+f2nBdKPpQK4ThbYe+HsvZREtMqMHYyefF4LprTPVQL+Y3Y0KJywbhDur6a7fOfrt/x55XSrOLOSoVGxYbK3IoFVN5+u5u7z88RHlkoca384ANN7CvHWjTQL5UKHZJpux5epd4Fedw100oJAjtqVdXZHE3pZrOnYLZGpo8RImcg78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYsCvwbCC8C+8qRnQ+F1OxQKivL+UWnhZZii2kCzX80=;
 b=xieTw8/Xy/gR2ucqdRQd9Zu45HcpgXNvErtiOwklnXjBewhPiRcNKhULRKlmgSIK66vgyKXHW1ZS6vEUxycNrqK6tt4Nyo5ymjuGk/D7Lks0K4VHCgt9ojliO1vUGU81dqLDuUr/59AH5YId/AP9RP+PrRJ1WyuElsqK+fBqU0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM5PR0801MB2052.eurprd08.prod.outlook.com (2603:10a6:203:4b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.18; Thu, 24 Feb
 2022 17:00:29 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%4]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 17:00:29 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH] classes: rootfs-postcommands: avoid exception in
 overlayfs_qa_check
Date: Thu, 24 Feb 2022 18:00:10 +0100
Message-ID: 
 <20220224170010.26845-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6P191CA0035.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::48) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3832caf-e1bb-4e22-4f06-08d9f7b7293b
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2052:EE_
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB20523131498BEF094D65A6F9D73D9@AM5PR0801MB2052.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gyy7KE1DGsp690wYjimN95boe4I8GRlSD5YBM4NVod2s9hPv3/qxiYrtt0F/PhQ6kbCkCJSeJGvRn3isxDZ+NneMIjSjblUojwzuBgm/G11PKYo3j6bGGeGQ1vT2YaqyrbP7vT4Gqcy8mhfi6XRsRZ5jwDZrIy5pl/SYoR22U52d1L4lsFQQcfZjg8IieCg42XzXnSH2Q1VoV4WFx32ROhaug7WBY+gCC3cM5N52ODkDsy/CTK/o10GPoz97fZPV3w+80uJxv96sNNuglqQcCJEKFK7HA02z/Zb/5cTQ8cCq3JNEuGpWShNRPd7fIMddp4nnC4TADdhgS7yStI92/XCqADiegsUTv+NfUSuvh8iQ6wqeWPAlPb3yq3P5QoT7qtsLbi4pgSMgJdkdYteCzXEO9wOFZZRgRiXlp99mQAWuhG7BjcYYwl/4g4j5TwtrP2kZSKP5/hY5bOukLQ55QiJtXc6HpQmJG3Qbmi3y8hp5AgvX+Qx6LdTf4HBPGwb63AIVj9Nmrk86l313Zi6dHM54LnLL+y7DVWmfe5ftwjhm1TUu7QBW5Rv6E810UNcGoAoUR5kDmJSDQEVA4EgOWUfAz0cJG58Fuwt5d8VSQustZasgL5WQ4Cw8m3B3YdUiiNXfENiaWvPgEW8B0fFwBT6CcfewT3l6iE0gMychbifM4KTP3syhwaZwL9H39tQYfULF+RA69xERcfWQEMMmCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(6916009)(8676002)(1076003)(4326008)(66946007)(66476007)(508600001)(6486002)(316002)(186003)(26005)(6506007)(52116002)(6666004)(2906002)(8936002)(83380400001)(6512007)(5660300002)(36756003)(107886003)(38350700002)(38100700002)(86362001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tr8Rk7HF4IW/BWPF3Mwr2jmXS5UEI9yfY+tD0J8s7+XlmCcubrXq7MTpXsRM?=
 =?us-ascii?Q?HJgEyCU472X26g32pcFKKzrUG4lCXLeZenFNVQGK7IXbu3XJto8t9Y23LWem?=
 =?us-ascii?Q?iS5EsmheV/OznJNqw0C0aGTaT64ZEBBF7cYACD/5kfcSpUmK2JpE+Hnmq5r8?=
 =?us-ascii?Q?AK7GYFAs4iGRYdYXc1G2xvxW7CF7WQT7fi5n7zcdJ9af5f5xDUgIFMSNAn9a?=
 =?us-ascii?Q?o9DO4h34RxuVoYmFC5mQJXFfC983FfrxWDli4Pa30UgX5HsMhXJ1oJ95xGPT?=
 =?us-ascii?Q?7zORT07Hph3rFT39mE+eMhOXHbKiXVWL6gDACEnh3T8byAFUlsLD1jkv7mYS?=
 =?us-ascii?Q?dn9xQl2D19i+thR7KiTtXSUZaHbn4/mxkAzkrnDVTKTFNCy4J18SPA/yEVPS?=
 =?us-ascii?Q?CNNU8HxwDGEwwzoAuZTaczLnWzFbLOn1ojdnjiZ/lCm/ixzYxn2VgbqwVWx4?=
 =?us-ascii?Q?SULzcAg5bkLUbFq07lZz04vSV7fE/qZaNs/oMADBsB5Au4Y6LiuuOOCP0QmB?=
 =?us-ascii?Q?9NoXak+uogZqIxsE4EGbrVJ5650IWktl8ZpxUUYVawJzQzMrFYGxxqM+aN7W?=
 =?us-ascii?Q?f87imjWagdR1hNyLYQziyJVukSavg6PPZMEJcmKI7al/jmUuf4l00w89VLLP?=
 =?us-ascii?Q?WSHx/qJBhY0/Rsf67NqKK6xDJobcNrlWcBms/FfvVVvOpTL+HWiKMtGlh/Iz?=
 =?us-ascii?Q?sQGovbCog/ssTeDJ+zgfaVuJBNTm68T2rCFE7SBF8s+87DSjijF3uh9hvApx?=
 =?us-ascii?Q?1ioKyldlmF2e9U2oDgTFLH5P/ZxoY35cj9/o42zW5l67n7weXCKAMJnGcibL?=
 =?us-ascii?Q?CTur/uuEiivbA0NA3bhzpMK4T7RJfLPXjRB7Wew3tggqXhPv40wHTN0y3cqn?=
 =?us-ascii?Q?ZPambhman+eFUljjrQh6HAF82u1ErIL+W50SPCmqTASz2Is/8rXyahZ7YYb5?=
 =?us-ascii?Q?qCL6r/T49CKOTUAX2UQNcreRZxg8XA+8dNCHVbtDv1yPY4JNynlL5wrDkVQn?=
 =?us-ascii?Q?zEGQ8lIOfZvPZB5h1OjDxiVDG52DFmg5R8OGA36F6Jpjx9hPkIrRgA9m6OQX?=
 =?us-ascii?Q?1i/o+DZuZttVBuwcnTxUinSqYTkydt+k4UlkUcPkOB3XleOmclIag8fausQh?=
 =?us-ascii?Q?zX0dNU6g8xAfoFNWCy4lt2q2Q4WYh7E0ZZcB2MYYPG4gL0h6N8d1pNM1VsBR?=
 =?us-ascii?Q?EN7Oh+sTEeQmGesEZgrf3izS/umqnFRFbpkDYCMFJnLCihoyZ/EXOGYDibg9?=
 =?us-ascii?Q?aC4stsUJ4wqu1s7njtwN0aATymQnzJh5zDIB7UKjphbg6Rqdg2eyuV2KoK7G?=
 =?us-ascii?Q?kKLpEzvaITUI2RQ1IS7cV39kv/sGdZyMKU5NZO7asyoe1ei4G1kZ8vwQ/+ln?=
 =?us-ascii?Q?nAp/ECezh+vSz7Rki/2p1SWpVERPNxhGhJCoFsduHzhL84wAkx2VLYg8aXSu?=
 =?us-ascii?Q?njXmTIx14AIijzDyO6voptNBN3W+YRTQRptqSdKRDuYzWgx9qNn6dqTp+bbo?=
 =?us-ascii?Q?rHEcWzizQq6uJhC/8NfSgITdDU2y/Mbvq6fTFgIkyrjPbPOBCDw6JKvwXQ/T?=
 =?us-ascii?Q?q6PxN4R4lvx8Hj2lLMy2B/64oUjRd3QcGWelD83m5SVjNrOG6jucL2CUOUve?=
 =?us-ascii?Q?dtISLRMvIuGiqVMD/wqiEww=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a3832caf-e1bb-4e22-4f06-08d9f7b7293b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 17:00:29.4495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xlb975GAqQbloexpgQNf2oIq6YyluwUPdu3vPCVi/LuEJy5AzcOO6qHT5+bFX4yKPv0V9Vcn2aSOGWXaDSlguA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 17:00:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162326

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The overlayfs_qa_check in the rootfs-postcommands class throws an
exception if the overlayfs distro feature is enabled but no global
OVERLAYFS_MOUNT_POINT is specifived.

File: '/home/stefan/dalos-linutronix/poky/meta/classes/rootfs-postcommands.=
bbclass', lineno: 389, function: overlayfs_qa_check
     0385:    searchpaths =3D [oe.path.join(imagepath, d.getVar("sysconfdir=
"), "systemd", "system"),
     0386:                   oe.path.join(imagepath, d.getVar("systemd_syst=
em_unitdir"))]
     0387:
     0388:    allUnitExist =3D True;
 *** 0389:    for mountPoint in overlayMountPoints:
     0390:        path =3D d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint=
)
     0391:        unit =3D mountUnitName(path)
     0392:
     0393:        if not any(os.path.isfile(oe.path.join(dirpath, unit))
Exception: TypeError: 'NoneType' object is not iterable

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>

---

 meta/classes/rootfs-postcommands.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass
index 74035c30b7..cd8986d8a9 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -380,7 +380,7 @@ python overlayfs_qa_check() {
     from oe.overlayfs import mountUnitName
=20
     # this is a dumb check for unit existence, not its validity
-    overlayMountPoints =3D d.getVarFlags("OVERLAYFS_MOUNT_POINT")
+    overlayMountPoints =3D d.getVarFlags("OVERLAYFS_MOUNT_POINT") or {}
     imagepath =3D d.getVar("IMAGE_ROOTFS")
     searchpaths =3D [oe.path.join(imagepath, d.getVar("sysconfdir"), "syst=
emd", "system"),
                    oe.path.join(imagepath, d.getVar("systemd_system_unitdi=
r"))]
--=20
2.30.2


