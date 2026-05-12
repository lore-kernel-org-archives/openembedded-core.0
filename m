Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E900ACD4F3F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 19:04:38 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83226.1778612672135381951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 12:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Hb18n4tV;
 spf=pass (domain: axis.com, ip: 52.101.72.51, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmeUk0cjju8QXo4QjUVttNN0IZ3/5lHj2t/sNA+C32q2xg6KJBmXBKvrSfGyfLoidfghbStzKBLqEtv3Ox/MlJghnyE2DwUBf7Rnl3xFi+bw8McmdDUn2iXMMUmSETawIVHs5wBPEpxaAU1doed+Gpt5qGG4472SCljlHGZ0cWkt7UuqWxKXihM2iSzEeJE67G7D4LkbduZi7DoNvOJWiPHOU1idDLcNnQQrFAc3TnCREWTkTutWbHw2tZkCU3Da2ITHcymOgp7+ORRBs2y++5+3sFhlwLF+oXZRQukKrKuZm9c9nYiJQ1n3NcrQ/NoD8Noq95scGdtIZqMnk371Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOJ43/8yjk19lB6VcHjM0l1qzXIHgZOeDXgUbYAGPfU=;
 b=d3bNYNZBVTGdgvPoT77WrepvW/Hajc1u57afpPl5ow4iAEnHh9SsPJsagDPB4TdybkHpeOien2IoECIBblIo/BKwO3ldYvBuR1WUVHcKK2k57sfPV5MDp4G7e4/N1Y+b35bdz64Nt44SHcKwSxdLHRk9V84Q/kFE4aakF2RJu3RE2HJxW3QCNgiHiQp/ORPB78MUXp4HTV4dCndzg0zjPmk/pHYIzUTBBQzHkKrLz86c15WPAvS7DYAkzDREvB0V5z8Lxw6yV0TxmFw8JLkkB3rz2stJ6BnBn1oGIbEP754MYk+jbTiUwsSHQLaj2DRqq3pk2Kzt/wP0m1lwwnEyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOJ43/8yjk19lB6VcHjM0l1qzXIHgZOeDXgUbYAGPfU=;
 b=Hb18n4tV/PGDP6bnVuL+81wBV3kdGuI1Smf8vogTaeA+I2V4qZZ+XvodLQj/HZzWcpG4SLfFYIhLV7ldwVOD4dPdSAa4jEDB1A+vepQ6wxvX6wrtFg/UDRU9HG6YQ6ZEZATtI5X5KmEhzM/ycGAIlZq7ExlcCys0JI/1KrwBXzk=
Received: from AS4P189CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::6)
 by VI2PR02MB11021.eurprd02.prod.outlook.com (2603:10a6:800:279::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 19:04:25 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::cf) by AS4P189CA0001.outlook.office365.com
 (2603:10a6:20b:5d7::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Tue, 12
 May 2026 19:04:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 19:04:25 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 12 May
 2026 21:04:24 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 12 May 2026 21:04:24 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 3A07C217D
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 21:04:24 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 32A96125CF1; Tue, 12 May 2026 21:04:24 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/5] Add support for USERMOD_PARAM in useradd.bbclass
Date: Tue, 12 May 2026 21:04:10 +0200
Message-ID: <20260512190415.948535-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000094:EE_|VI2PR02MB11021:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c54303-00b3-4f9b-4b0d-08deb05948e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|18002099003|13003099007|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	V7u/hcBsa4xjxNTUK8LqhuTU6aMZfvMGEgJv7RXmzMTeBua5J5AIq2UF84aLotmBSZlyt22NKodIzUt1B346mN4h7OwzYZ82HgKuiRpVkNyPi8LKWXSCV2Nr4vxYuudDoaU/frZCfqUc+uCrM935tHJjZKjx5XRmgJ0I5pUoWBmPmsobup0cquXehwUxEyHGR3hTentooKfft1K/n03nmWoSjanzVIYNARJttxjL1zPyqbTOjs1+96Q28/hI7Uwk4eNWy4JMK+fl/NH0H1r4U3HO9y7n7dG3BDtO7z5ajE/sidk59jOBALIlCOpiIp+cNdZKpzgiJeOUEyk/+/rtwsjCVcZq4gNcwayBYxz7hI0zDaq0eQ/IonBEwuP7GTQCzfUJPln3lTakRe31KlzHnkiTM+D8sqBmDmT4e6sgPiLYs/ClVjhUh6LAyeY9SJ41BsV3dDgITsmjaTw0J4aGfXnBxuIo5kEQw1jZEryN4uYhT50gQVKjSthjnHKkdZQxHmDL7GQlh2WOyRVtXtxfhpJdJi9TIPDRoVtgEVERLWdzKqznnnEBIQHNgEf5gvFFSjzR8+O8Mde4L3mt0mqBzNiJgCM6csjmd2/mksbjoL2dQH/oXgjJrhDHsP4kmnPfT/GTMAghbZ5Tf6VLbGqn9SDGzXmPoJhbnoeyqoXYVRC/xJ20BWj/giDuREfyOOrK
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(13003099007)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	d7lWbHx3osqVJ9tU4/9FQuWM6Jxa7swKybPn9y2rxKjaXAL4MTofn9Xzgc3nqmCBDbx7IxSkU0UUgTqFQTDGcmFDRf0CpBheUmoD5jlYiiY+lzqVUX++Gip6Vg6DU6LXTBNqlABMeAl8/APjOrS+4zuL2RCyPy0ZT86x32tC75v9qrO4TokXfhxmFWsOiyS9zVU3ratpuN405XN9NXVRXW4L4k5MxnQVBP7vM11XO5ffn2kJuupse4IhXeotyqWPWmFMthnPS0UopRkpkyqO+Y/LvvDyrDeVKRaax8qoUqFs7n3SjJeMJHgnZOaRFrXiL3XsaQr3L5xk4nHzQq96MqvNWXeiM0FBbh13qQstRcH+VOvHADGtJ4U7w0v8UE2icIDkhfLCBg9N0216/MF574Ftwi5AJ+xtPaDasUQYbTncJousgFJMo+klmYdpAZcV
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 19:04:25.4580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c54303-00b3-4f9b-4b0d-08deb05948e8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR02MB11021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 19:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236907

This is my proposed solution for groupmems' lack of support for the
--prefix option
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16277), and the fact
that groupmems will be removed in the next version of shadow.

The first three commits make a little bit of clean-up to
useradd.bbclass and then add the support for USERMOD_PARAM. These I
would like to see backported to Wrynose. While technically it is a new
feature, I hope this can be accepted (it should not affect anyone who=20
does not actively start using it). It would make it a lot easier for us=20
and others who are using GROUPMEMS_PARAM today (we have more than 300=20
recipes that will need to be updated) as it would then be possible to=20
migrate the recipes over some time rather than having to do a flag day=20
rewrite.

The next commit (only intended for master) modifies the
perform_groupmems() function so that it actually uses usermod to do the
work. This allows GROUPMEMS_PARAM to continue to work while we migrate
to USERMOD_PARAM.

The last commit (also only intended for master) adds a warning for all
recipes that use GROUPMEMS_PARAM, to inform that one should switch to
USERMOD_PARAM.

The final piece (which is not included) here, is the actual removal of
support for GROUPMEMS_PARAM. This I intend should be in place in time=20
before feature freeze.

The intention of the above plan is to give us and others who rely on
GROUPMEMS_PARAM a way to do the migration without having to resort to a
flag day upgrade of a huge number of recipes, and still have everything
in place and cleaned-up before 6.1 is released.

Peter Kjellerstedt (5):
  useradd.bbclass: Some clean-ups and simplifications
  useradd.bbclass: Add support for USERMOD_PARAM
  package.bbclass: Add USERMOD_PARAM to PACKAGEVARS
  useradd_base.bbclass: Emulate the groupmems command using usermod
  useradd.bbclass: Show a deprecation warning if GROUPMEMS_PARAM is used

 meta/classes-global/package.bbclass |   2 +-
 meta/classes/useradd.bbclass        | 104 ++++++++++++++++++----------
 meta/classes/useradd_base.bbclass   |   7 +-
 meta/conf/documentation.conf        |   1 +
 4 files changed, 72 insertions(+), 42 deletions(-)


