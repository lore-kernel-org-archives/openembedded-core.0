Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635C4D5E392
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 08:35:48 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.62])
 by mx.groups.io with SMTP id smtpd.web11.54966.1731314147800127358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 00:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=LDo9/Gx/;
 spf=pass (domain: axis.com, ip: 40.107.22.62, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jpgr/G9HP/NqtwE7LF9QUeeRFm/JGUICEBMzbKsHjZ8ecBGdbSx7dFZylj9fLt9GOdjYEFC5r43mr1axjOopTDgomV+PSA86rmwGtzEERVmE7jJOFEAxEabNl7jeziacyAo9OZ/HlqzENDclqTVBD0I3JG8ciluGXQoL/y2w0F7jlNR69zy+/pwbzV4wo4MHsPZdV2ugzdwNIOWLnBY24pc36EoAO8j3Zutuc6uebuURT4MTPObPE+tLWnbhS2L39lROJgyvm07NbXXOD2fyAgkzI1I+YJT2JvI4XVkfSvu7dCFge1gyiV4BO6WWVjaTVw8mtL5i3gqX+G+JX1VaWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRDfRqNMcejMuoQ/bT5UPIMW+SrgihoDVomso3ooti8=;
 b=kzSUVXC4KRoQhdZQ1241Eagmy73jQwPrDDNeavcybEETaY2vHxGrMNbL1ZTPQTcP6JQdmf5stMMiqK97Mg2IdeJT3HBSziZ/YYb1J68xj5qjlL/lvursfLTdFDnMMzUfLqcWB5PS1BXM5sND0vSTQe4oJZvVE1nhd7B1Wt6KdOr1czJf9BA+BHNx7P97cPvNXNXSeLlmvl+Fvnprn8oMUviueCVRpMwQU4b/30/TqmmkUUhRaMDqlGABuOJnTglM/0NH/vjQ/DQxyA73J7kHiEmE7AOhhNrS+DYzKIjQh23sTEVibxc6+ExbKvf9N3xeF3ZHJGA7QbhWY70del/HfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRDfRqNMcejMuoQ/bT5UPIMW+SrgihoDVomso3ooti8=;
 b=LDo9/Gx/YHfrWHHTqur0tz/LrmKT8OhcBEZxX9B2ODA8zqx79o3MzBrTjfDhB00rWvWmPF097ptTJqcvwPlMCmOxTwhWHK+93IFzSBWLjUNKgQwlwNR2Q5XF2spO8IfeDKYGc5GaDJ7mppkRQKDoKC6bMosc43IiTmbPC5XMQhY=
Received: from AM9P250CA0026.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::31)
 by GV2PR02MB8602.eurprd02.prod.outlook.com (2603:10a6:150:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.25; Mon, 11 Nov
 2024 08:35:42 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:21c:cafe::94) by AM9P250CA0026.outlook.office365.com
 (2603:10a6:20b:21c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Mon, 11 Nov 2024 08:35:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 08:35:41 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 09:35:41 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 11 Nov 2024 09:35:41 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 73194800
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 09:35:41 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [RFC PATCH 3/5] parted: Fix the ptest path to test-driver
Date: Mon, 11 Nov 2024 09:35:39 +0100
Message-ID: <20241111083541.291594-4-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241111083541.291594-1-olani@axis.com>
References: <20241111083541.291594-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|GV2PR02MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: dae831aa-c56e-4297-e1f8-08dd022bd3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rUuOa9GG9a+FWZi3G8glXtlNPyF68e4uVf/cRfRSjLEdBY3rSaXxYVCxpwXu?=
 =?us-ascii?Q?JdLlaazaP0AEDGQex6LYRkWfM51IKPZlm7AE1KbPKostjsAmWwUuAtApbND1?=
 =?us-ascii?Q?SHdOT9lajbN2gohDVxgc73wrgKt3GO92ewaJhlWOu5o9JfN5Kk68vXXZiNi2?=
 =?us-ascii?Q?dygdrJIxLtF4csSZZYy348Eevkfn7gPnZd1H2nKLyxEso3xGGes0wB6nfinM?=
 =?us-ascii?Q?iO47ulh8m6xFcuHt4HfXnYk1gZu/37LX+ydNwZfNHwTpWbzQY6auo1vMkGV5?=
 =?us-ascii?Q?ydgPym7OYQ+EEeBrKsQ30n8liPd2q2Ef5EGNzOoJyRa73MztfS8mhxkNYD7x?=
 =?us-ascii?Q?Ol2HFq5fbUQ9i6dCRIZ/KLQDOZTg0BddQjo1gur9nAaOEdS0Dvo5H1DKBS/3?=
 =?us-ascii?Q?oLJwWqqtXZPSclWB3pBqVHpG+yGgR8HhJnWfokueP8NUjdviPbzgENPWHp3D?=
 =?us-ascii?Q?b3AVTUQdaVBvfqSrl0bUF8KVZfA1Ot7q9XdXE2sP5rxXsMNUFr6clgyUHHam?=
 =?us-ascii?Q?NlaU4gr4/FsIamxfCjtwARDws2uMmwwo2zlcGHt6epDxp84oA2hkexi/GJ0i?=
 =?us-ascii?Q?2moJJrgkXcoK+znMh44eLR5d0mMouOxiG6bxLwTH7N4zj/PYC6osvV7byGTo?=
 =?us-ascii?Q?DULKXTO824t+21ygOnzHbmABOfjfuSIv9z/7WNN/Ezq0Dw4D69t54ewi7uE4?=
 =?us-ascii?Q?XyvPWBiTyME3CQFO5lWIrLtW8P4yflcpp/RlGeNpBAf7WVUrzTA5MpbTrkp4?=
 =?us-ascii?Q?ZchCnB0z3/vlamcFzVY/OFq/HvnGu9iKTaqEVA2l2FTv7U4gKXjPidmCKfsJ?=
 =?us-ascii?Q?7H4cqekdUY+Xg5pLL55OOybv+F8HhXrU4KNysG1MOGFZWNcXFmY2/HSyMK0y?=
 =?us-ascii?Q?Uow5bDQTRz5UV6GNBJkqTz0lN9lBZPIOsEQzF8SDkuKigPiHosLJ3OB31sUY?=
 =?us-ascii?Q?r3gyJxYa/9b0YuWymG32Iw+mzZYGsAzP5ZPaHepmtSMOUvzr/HTFhceqK5sA?=
 =?us-ascii?Q?1L+Qtwe3iddPRqwU9enD8CMm6gtOufOOLPsfTlxNogO+7Zzo2z++0d2vHkkM?=
 =?us-ascii?Q?nrwZmMEYP2LaxrEHG9fpa7XC3DdIuNDDFAw/S+eEWaNBkBIP1rH7tNV38BTr?=
 =?us-ascii?Q?m9XcsKpI8lWVJBRP4yb7VI9agpJmtE4iuNYh2LhX/eVEhZJU0jsRgS7SoU9g?=
 =?us-ascii?Q?9T3m1hkiXPKqBAI39DI8EK3veBIZ78VOug00XbR2ASf1axdylXDtPHDu5ur7?=
 =?us-ascii?Q?IFTbL5YLBPbn9fKbn5KTCu2PSAAg9ZJQlY0GNDMaoJEF6DfrLvvYkJYDa0fC?=
 =?us-ascii?Q?wPktsVXtGAdho1p82hZFS6FnNCZVr9lfmtiogqHkbHOq8uiKneXjh1fcxV0y?=
 =?us-ascii?Q?orzoA/QDpYRCUE6JOjqJynF4AFtqOqkio2Yz1UeW3h4zSCU+gw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 08:35:41.7655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dae831aa-c56e-4297-e1f8-08dd022bd3e1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8602
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206934

From: Ola x Nilsson <olani@axis.com>

Add a sed substitution for ${PTEST_PATH}/tests/Makefile that transforms
 SH_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
to
 SH_LOG_DRIVER =3D $(SHELL) $(top_builddir)/build-aux/test-driver
which is where the test-driver script can be found when installed.

There used to be an oe-core automake patch to do this, but it
broke non-ptest use of automake.

Relates to [YOCTO #15635]
---
 meta/recipes-extended/parted/parted_3.6.bb | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/parted/parted_3.6.bb b/meta/recipes-exte=
nded/parted/parted_3.6.bb
index a537ef74dba..fae35815be9 100644
--- a/meta/recipes-extended/parted/parted_3.6.bb
+++ b/meta/recipes-extended/parted/parted_3.6.bb
@@ -35,13 +35,15 @@ do_install_ptest() {
 	cp ${B}/tests/Makefile $t/tests/
 	mkdir $t/lib
 	cp ${B}/lib/config.h $t/lib
-	sed -i "s|^VERSION.*|VERSION =3D ${PV}|g" $t/tests/Makefile
-	sed -i "s|^srcdir =3D.*|srcdir =3D \.|g" $t/tests/Makefile
-	sed -i "s|^abs_srcdir =3D.*|abs_srcdir =3D \.|g" $t/tests/Makefile
-	sed -i "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D "${PTEST_PATH}"|g" $t/=
tests/Makefile
-	sed -i "s|^abs_top_builddir =3D.*|abs_top_builddir =3D "${PTEST_PATH}"|g"=
 $t/tests/Makefile
-	sed -i "s|^Makefile:.*|Makefile:|g" $t/tests/Makefile
-	sed -i "/^BUILDINFO.*$/d" $t/tests/Makefile
+	sed -e "s|^VERSION.*|VERSION =3D ${PV}|g" \
+	    -e "s|^srcdir =3D.*|srcdir =3D \.|g" \
+	    -e "s|^abs_srcdir =3D.*|abs_srcdir =3D \.|g" \
+	    -e "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D "${PTEST_PATH}"|g" \
+	    -e "s|^abs_top_builddir =3D.*|abs_top_builddir =3D "${PTEST_PATH}"|g"=
 \
+	    -e "/^SH_LOG_DRIVER =3D/s|(top_srcdir)|(top_builddir)|" \
+	    -e "s|^Makefile:.*|Makefile:|g" \
+	    -e "/^BUILDINFO.*$/d" \
+	    -i $t/tests/Makefile
 	for i in print-align print-max print-flags dup-clobber duplicate fs-resiz=
e; \
 	  do cp ${B}/tests/.libs/$i $t/tests/; \
 	done
--=20
2.39.5


