Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09373C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:23:17 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.58])
 by mx.groups.io with SMTP id smtpd.web11.12242.1751026989046971163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=Krj1jMOS;
 spf=pass (domain: de.bosch.com, ip: 52.101.84.58, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+Fd52/sWtM4Ve1XcyjQKM0FK4nPXI4hm5kr/T+dNkTudXJJUWVl283q0Zl85JcbOpg9fPTUEdV2duOdiupiZs4nT9jiCY/nHGm6TF7y7emBPSvb+hbJBKcCEYaPdW8sfsLI7zcJUcDyXROKho45EnKUwXPjqlFaUw1qejlC5MMH8J1tzD36ph268tlgB8kKidqznyPw0Edus5j25N0sRykWWTh1n44yP52iga4VQP2kEmfCPF4/vWyKG2HoxaFzKCaS5lSHoYX0vsgY4slwb+PV5oB11HIPtXsQ9HunPqhLCB2vQu8C5c7LtlYn9eUJIkCkRa1f2R+TlP1ce8rZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+mHc51f4zspm4C2ztoZUO+6GEYePvNeq7OZVf0Fzys=;
 b=hCMidWYde/Z+OA8Om9PpXwQyq/PrGBf2V9X8l5HGTYOtPLftaVVLfL4v0V/abfk8jJY7DEW1iJjCTo4nlDUIQ19em6Pt5/C0Z5B64g2sS9VfJ38YP997HNhkdaqhqoSzG58q0huEbI9CgveXs9eMbAmPfFI7jj33i4V5pYV1aPCU5dGRjVhjJI7kH7bkCYo6qotBn2dag8vdcpv4wVZEkVHrMMBEerqu79rkDvWxED8Z7kOU83SUsqLge3Egy89JEdS9U+jYLnLK0h4ez1oTVZ6WjvspIi3vsABkJL64Y33Tt+aIhzaki1pL0kT4A/SFMTXSAV6I4WCbxFHb6iH1hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+mHc51f4zspm4C2ztoZUO+6GEYePvNeq7OZVf0Fzys=;
 b=Krj1jMOSrTuT/SHaveGwF8gK9IfxBpJv8RDnJCuLCmhcLRr6lnn/VjxY8CH0c396gEBK90wNBmI1a2V3X4bqboi5BA57bbLThpG7EPayLJgQF9srI/XGEvIJx25dGPrTNwEWYTDu65iZuF154HLBBuWOYVAjuhK3jmKIGboGWYElFF1Dul56z/okmlhk8E3jTillDVXn38z6rXVxpfhhU7hrVpxcLRx1k5e0yYxgyDLA1+lzGcs/sCXl/n7Hv2v6Ucx1U7JZeHZOB+sJZxoJOxEhNg4VK2/3KRmnEI6TcNwK+hxHYjjxLhXUO/9JSK6j/75Vqm6p8kqMzFo/HVOw5Q==
Received: from DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) by VI1PR10MB3648.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:135::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Fri, 27 Jun
 2025 12:23:06 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::35) by DUZPR01CA0067.outlook.office365.com
 (2603:10a6:10:3c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Fri,
 27 Jun 2025 12:23:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 12:23:05 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Fri, 27 Jun
 2025 14:22:56 +0200
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Fri, 27 Jun 2025 14:22:55 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.69.179) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 27 Jun 2025 14:22:55 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-core@lists.openembedded.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<jpewhacker@gmail.com>, <raj.khem@gmail.com>, <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH 0/1] Adjust dosfstools fsck exit codes
Date: Fri, 27 Jun 2025 14:21:57 +0200
Message-ID: <20250627122158.18544-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.69.179]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DD:EE_|VI1PR10MB3648:EE_
X-MS-Office365-Filtering-Correlation-Id: 10b93b2f-684f-4ea3-4bc8-08ddb5755e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?668BupkxPPbq1PrdM4pkPtYarnLOB6lrwr9zKrpwVMMlVvK1kl8oRbRNjjQj?=
 =?us-ascii?Q?V69N26Ig2I3atRIXgbPB1VbnA4uIkNMu6feZjEKazbRg2MHO87TrsSIoFS4x?=
 =?us-ascii?Q?5rtnlRykvwa6j/a6VsRtFMTn46UNqqXb5PTT6Fo8hDGyMZ9U3Y1JvqZct+/e?=
 =?us-ascii?Q?kMAt82TZBwJuStXK0XIF0ZaJhEMjz8RFn3I3XXuAUY8oMBYmSmngDbDs9VDr?=
 =?us-ascii?Q?6aMyIbFXu74yCypOlpfYz8mhY/Dg2GJG9aRJ7BEqCvSDjtzMZtBQ/HgSgGNP?=
 =?us-ascii?Q?J31zJTBwM15PQnw3PZjTSY2qqHFVC1Pw765msBHaOj2kYC9se/3kuakcf91O?=
 =?us-ascii?Q?s+4WY3T90VKuk4RTGaGC+i2WNrsjZV+2ISmAW+5W0eJox/EVyFKO4y/kClMx?=
 =?us-ascii?Q?s/BVNzle1ff3cjENdr2ZRyXukixJtE9/4Yj0ohox6pdWYKoUvv9PTwTl6fCO?=
 =?us-ascii?Q?TtxAMkE4QSy8Isz8TJg43oldFANZb0mj6aM2xxBy+OOepdk6zyi0lXVv5Ebr?=
 =?us-ascii?Q?nvDv9Hn5dUQP6e8bfL+n6m0x7ujhceQxOAf5aSz5VW6qJDtSqL1LFVV3KCRG?=
 =?us-ascii?Q?be5MUhLmj3F/2U1G9WKOKSzcJkT9W/MtGbJkLFujDCDEBsjutEm4wdDQqppf?=
 =?us-ascii?Q?QVGdFM2hDwYM70gtbczjssIR4sRqeZf//s8j6eLeTMLm0RehlbvJusv6O0qs?=
 =?us-ascii?Q?CN7rt7/J80c0qs4hGgdZtMoKZxao3sBKTknOetdOIXb015J7XUd+f0uviGao?=
 =?us-ascii?Q?kQnrKMQ6d3YMvyboZvBuW3vjkZNChnaN0QgRBKW2QYHplQHxbNSaGEWcsMlv?=
 =?us-ascii?Q?20wQxV3FC2zYF6rxzYLAH56Im1R6N3zz1xBh3RQIzGYr+YL7Xz2FYOrHyxZA?=
 =?us-ascii?Q?7IRZpxXMGLz6HNG3hxYTJ+SUFDpZG6Q0LsgkjySWH1n26EeXxGC1TAX9FC5e?=
 =?us-ascii?Q?tmIdvhckrkYMxkAObD/EI8G2u6fpeEnnyPXs3/jETrrqmPozcrfa8rJLDeyX?=
 =?us-ascii?Q?/J48Du0yKXLLurV3OeYRkmLrj/+Rc83ji4M48kBvahM/0T12TMIkkoUHBiwo?=
 =?us-ascii?Q?Ii5O+umYxzfgYNn5A46i0rifGHP3khr9EhH6hBGI/mj+1zv5rR34x01dLE5y?=
 =?us-ascii?Q?PIo62TaIwlLhg7VJl7v8ypoi6yt5ZJ7J628oWnJCITodAFad61WKFjxrwst5?=
 =?us-ascii?Q?OPoC5v60xJMMiDTzvcW0rE/lRc1YcAfqJe8mHD75PdwSsMhK3XROYjHNLFjv?=
 =?us-ascii?Q?tTgjt/6sYJYFzm6bj/lL77Ng3tiemAXRtgWpNX4A+SEhIowlWTdSBbLP0Hpt?=
 =?us-ascii?Q?NycgsOa9Tyd5C77vhgLclgSBsy9uSKOHy2wdQ6LuYskzbW3JLBV66aw6IHMi?=
 =?us-ascii?Q?xmY5Y9J0+ZjRhPmzE3Y3n5tj23mF4zYfeOE3iqv1h483M48j1DSrmxYjHkIy?=
 =?us-ascii?Q?LR4vzlg5Z67r8fzN+zDo9rDny5GI1H87llJRq91J+WeM8Bn5WAMSL6toIA7o?=
 =?us-ascii?Q?DnVW+R/mMyAUcqwTc2Ul7hFDnncWGzNBeAEf/dJS2NNo0haxIsbZUlpAPQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:23:05.5155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b93b2f-684f-4ea3-4bc8-08ddb5755e69
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3648
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 12:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219405

From: Mark Jonas <mark.jonas@de.bosch.com>

As proposed in "[PATCH] udev-extraconf: Allow optionally skipping
systemd-fsck" [1] on this mailing list we adjusted the `fsck.vfat` exit
codes to conform to those specified in the `fsck` manpage.

The first patch modifies all the exit calls coming from `fsck.vfat` to
conform with what is specified by `fsck`. Because dosfstools shares code
between its tools, the exit codes of mkfs.vfat and fatlabel changed,
too. To our knowledge these tools do not have a specific meaning in
their exit codes besides success or failure.

The second patch updates the fsck.fat manpage to document the new exit
codes.

The patches have been submitted upstream on the project's GitHub [2].
After more than two weeks there has been no (maintainer) feedback yet.

[1] https://lists.openembedded.org/g/openembedded-core/topic/112895873

[2] https://github.com/dosfstools/dosfstools/issues/210

Ricardo Simoes (1):
  dosfstools: Use standard fsck exit codes

 ...ck.fat-Adhere-to-the-fsck-exit-codes.patch | 214 ++++++++++++++++++
 ...ges-Document-fsck.fat-new-exit-codes.patch |  46 ++++
 .../dosfstools/dosfstools_4.2.bb              |   7 +-
 3 files changed, 264 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/0001-fsck.f=
at-Adhere-to-the-fsck-exit-codes.patch
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/0002-manpag=
es-Document-fsck.fat-new-exit-codes.patch

--
2.34.1

