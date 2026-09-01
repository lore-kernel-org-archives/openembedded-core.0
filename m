Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82799C624D2
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 12:24:04 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6590.1788264807667574068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 05:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=iDU1r9dp;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.159.12, mailfrom: roman.nazarenko@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nD6/9g//ochwZBB2TA9Wu/+LgMJPqs4v4fp8y6p5Najx+dE1Ugtmf4e4MjLD6CYjbJZefmYU2n40yTx6MFeT8dKOOUZ7CpmMxag+NxEOZNoeHL5qlc0jJrFKvAzFM5Dw5wcOq21yQw8OTmEZo1uifSMSQQ9m3wQ+U/fJk322ESOhXkK4hh4Txb8IDrnjqFYSVcYF/4IwrNOPrrlujjPFbCkcCqirR4ZwMJtzprRpDvKDHyG4hxf1+Tt9nbIjC6qRWzTn/4Dot+DZhYqHbTsCrnSxzOzZ8mudDFJ+a9+cg4OcVKbPqpwqDZ1yuTe5ZBIyU6RsT3piMbfNxxho8l1g0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5ASg1tzGIpX6sPU0QRFgYNgcIph2Q/o8eJCj6UKiYw=;
 b=ybnLjBKg9oomhJXdlC9OWzDDobP2Uxj5Exz8tm5M9SRxOP5zKHtxqOPLohf4X0TZkeZFZpaIlpUcGLfJIhKDy1k2PdcJlx0eZ1F+Ol+HpRMZ1y1xicdIV2Hs1i8bu1bqqqhAPkQBYd4tpjHfIq+o8RVMQLSzXDrxJ7XdnZXHckgaCHd3ZMwQcO+5i9iIcsMefczdAaNlMqQS3uDtcMENuFjU3WNBQUybOHBY6ohNzGYfaRMbSTbo8IM9uvd/N+NJ7dL07EjRr2vS3GAE4LHGAvFnGrUfWTwJAjElcpKqSDHwGSAcagPGl6gRABcbDM1gU9M10TduyISmImbM325FUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5ASg1tzGIpX6sPU0QRFgYNgcIph2Q/o8eJCj6UKiYw=;
 b=iDU1r9dpxXyIGkBBJ195pZeD75gT6kYTSkkDkjWwV4lY1f6wzW17WyH1MRVZr5OQXUJ6usPEdsa7uX/oqXSbM4piggfA6m/Jp1EgHWSi3wKB3C13pvohEh+e9dA608EoA1piu6JLlIqj+dvW4+o4//8uvD/5pSY6N/6USMp3XsQ=
Received: from DUZPR01CA0327.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::17) by AM9PR06MB8084.eurprd06.prod.outlook.com
 (2603:10a6:20b:3a5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Tue, 1 Sep
 2026 11:58:55 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::6e) by DUZPR01CA0327.outlook.office365.com
 (2603:10a6:10:4ba::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Tue, 1
 Sep 2026 11:58:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 1 Sep 2026 11:58:53 +0000
Received: from GEO-L5CG4163Q2B.lgs-net.com ([10.67.144.137]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 1 Sep 2026 13:58:53 +0200
From: roman.nazarenko@leica-geosystems.com
To: richard.purdie@linuxfoundation.org
CC: openembedded-core@lists.openembedded.org
Subject: Re: FILLME-exact-v1-subject
Date: Tue,  1 Sep 2026 13:58:52 +0200
Message-ID: <20260901115853.481006-1-roman.nazarenko@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827155227.813074-1-roman.nazarenko@leica-geosystems.com>
References: <20260827155227.813074-1-roman.nazarenko@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 01 Sep 2026 11:58:53.0685 (UTC) FILETIME=[42904250:01DD3A09]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F1:EE_|AM9PR06MB8084:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9cde80-aa85-4b56-0ce3-08df0820653a
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /nr1zzfnY98zikPE3CGSAGP6i77cPF2aOC8+ze0e1DRZZWeli4JkExfH09rYzPVBoFZ7uGfzmIilAPBhHOBdLLBT23Wmi0h7RJUJOqlgEO0xTgK4ctovHGd6A/L7E3vf3EO7ZeOCiC0wIJ0Bm6fioijIPtGrqlDdkxntJlH6YRyf95nbm/HAC84Edp1NmAKCn2QECiRqlS8q6E8NXclid1fHnMbNsa6wIpyljOrOXVJPCnyHPn916BsdbdJzu1eIvmf44v9dXy/O1h4H0AcqdxicCs6E6F/f71573dKPWSB2C/8Wk/uUGgCQAXcYSg8VO5u5aOwg55PTI7ZjrO1ldi9r2WUCBrp5pcgRrzeWlaUKbdTy/1OMDi0hYuNv5l+KIZDTLZ6RrkOFl5mnCRgAfxZL83eiI2NFQAV5Fr0sRFcB0SLfUa5nWJ/W3/JUz4fBo0Bieyp7PFMOQ3N8vM0OSJjDcDirvDWDwRz8RIFhXWWvtim5xI9QczNE4om+JZUKopNECE0eVXXsnbse2oq3rEzi/vDI06OuDzZ8SmqZKWJpPgVvoVWu3I6nGXiyLKo3TrK7c+mtqQUdZ83Lh5t3e9+T9Xq5JR6p6JRqwWf3B71OFrdp7X9U28HaJSLngsyxuEwFL8leSlpPDV+oDmsySuPQLHpjpmeVk+tFpOC/agA/tjEwIq3qwWafmfF/+JtRF15fh4F3TT5VQcuSE12U2g==
X-Forefront-Antispam-Report: CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mx8fTI0rktNArH2qseZq0aMV4YeAsMmEz7hktd6RPbMvU50QmJ2AADlcgDC+S8mrmDUzIm5ZgCoFcjXAd80eXEz27XC5MXd9/J1FROPLHgCUUciMSfoQHGFJ4yvd8U57eG7/wvzphCoXfTE0+YEZVbOcofOgnR9geYxOvNna0W9Y2H2qdCvg930jE5aUVtYNp90krqoKgYGr4mI1pMiVObnWVKcu6Ydtwfrj73wmFP2AcYQndsV7mT6CYlXumluENXeviJ+T3iHgIcS16cVnjkcQYao7AghnssnV7AhwOQAbJdDrBJQQ7fovNKIGBd3bJcgZt0X4tUVQOPBygwKu+ph980E7oaTa9bs40QCMlqrbWP8LE1Jlkb4XHUKfgHPT6U+a5wBpaF+ByJy9AJZvdiT7z4MwDrqPz8mDEZQEbufHStwQ6Li793B+gxTK6Bqw
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 11:58:53.9530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9cde80-aa85-4b56-0ce3-08df0820653a
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8084
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 12:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244820

From: Roman Nazarenko <roman.nazarenko@leica-geosystems.com>

I tried the do_install postfunc and it breaks packagegroups.

packagegroup.bbclass does "deltask do_install" but keeps do_package, and
a deleted task never runs its postfuncs. So with
LICENSE_CREATE_PACKAGE=3D1 add_package_and_files() still creates ${PN}-lic
in perform_packagecopy, nothing fills it, and ALLOW_EMPTY is set for
packagegroup packages - a silently empty package. Those -lic packages do
have content today, as find_license_files() returns generic_<LICENSE>
even with an empty LIC_FILES_CHKSUM. Packagegroups also deltask
do_populate_sysroot, so they were never racy to begin with.

It is also wider than needed: do_install[postfuncs] has to be added
unconditionally, so do_install's basehash changes for every recipe and
sstate is invalidated from there downwards.

${PKGD} avoids both - it is private to do_package, so the race is gone
by construction, and it works for recipes without a do_install. It does
stop staging license texts into recipe-sysroot, but that looks like the
fix rather than a side effect, given the failure came out of
sysroot_stage_all.

Ok to keep ${PKGD}, or is there something about ${D} I am missing?

