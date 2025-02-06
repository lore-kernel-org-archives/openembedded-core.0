Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C49C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 15:44:35 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.68])
 by mx.groups.io with SMTP id smtpd.web10.44323.1738856672287665507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 07:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=xHNiUdKK;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.68, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwQIr37UfeNOIQOBkfzcepJ0FgvrUpB40dAyMYjWW21Y4yQ2FA6xc+Qo1r3XJrcxXyzCDllxdf6xP4Gr6q8XxCYWQHb996510eitLYtmPgV1mXs1/rgmox3GfPBWKYRITebrQvFjBxVDtmPuO6+5Pkk2ibsc8gAUwCJVsvlZBt8DSKtZEViWJnbHHD/e5hjS9cvJSGugF8NrlbaZM88eSmb+DowAlrixlUWler+9U8HDBCuV8Oa2SzVsHI9GdUYe+OxE6oUF8GJZjwZcd2ZMkJ5TMusxS8V/h1QUKVN2cDV9qpw32KJGUvf0RLWNQIG2RomvPAqaiZXJuR4MuGlDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huSE4AlNhA4iOauohemXseBLkNuKePKh2ne2Sd9vyYQ=;
 b=oIvg+taOaaxoFFEh53A2p9/2KIYzPLhdPDmB2s61KJBUGFl0yMBihjMXnJpOWxXAKDP9/KMeV2T1JMxjULu50cvHaQC5qTH49lSnKTH023VFTXKbmBEuj2Ww3q/tmpqb79T/OBjZEdUGoJLXQ0GNuS5I4FTQR9RCSBbQYaLFBu/q9fs3kxdWIc96qCUViKabc+zW3xlVZ/1LGCdtfsAabo6O1VKLnvPqMAIpVt9GRgOFOmTfi6J1iKpISD+HAxab0dcOndSd/1zBnZJ38dSW+SPh5+3nIUEIKwbRH/O5D5+1/az+jaSFWzYCI+3hz7pymiKdliyfyR0zAyt/ehSVfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huSE4AlNhA4iOauohemXseBLkNuKePKh2ne2Sd9vyYQ=;
 b=xHNiUdKKCQkZ98maoC+gZ2jEpWkz3zRxn6gPFbUpDbGXxHdhFSOouFvBhK0gwLEi8D0PukErg13hu3NiTRQAXkM59V49h/IGnd4e7O3e6ro6M6hhROYvSvHcnKUzeU+mQZlbqYm7/0OaTltk6r1m9DUTp25t5ehUcUVjRrfLASA5zhC5gxD7kLNx/H774enFLsVuYFDpNm6hxeMW28srJgGTE6QWokdHDJrZ+5DJsniGjKzfKgGgVUOOv8etGABWet+S88YKpBpbCifxqmfWKGQ0UuZgxKIGxBzxw8yfbGLkXwXEJRKjs+r4Il8VrOBMv5XLAutpYPcqhnd4elhtMQ==
Received: from SJ0PR13CA0084.namprd13.prod.outlook.com (2603:10b6:a03:2c4::29)
 by CH3PR12MB9456.namprd12.prod.outlook.com (2603:10b6:610:1c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 15:44:28 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::2c) by SJ0PR13CA0084.outlook.office365.com
 (2603:10b6:a03:2c4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.6 via Frontend Transport; Thu, 6
 Feb 2025 15:44:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.41) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 15:44:27 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Feb 2025 08:44:19 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Chris Laplante
	<chris.laplante@agilent.com>
Subject: [scarthgap][PATCH 1/1] pkg-config-native: pick additional search paths from $EXTRA_NATIVE_PKGCONFIG_PATH
Date: Thu, 6 Feb 2025 10:44:02 -0500
Message-ID: <20250206154402.694264-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206154402.694264-1-chris.laplante@agilent.com>
References: <20250206154402.694264-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|CH3PR12MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e844459-4e5a-4c2c-1378-08dd46c523c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RZAk0V9I5uvKtQ8NA+vUSyPQVghnIgOAbZFXYQVhj6YGKTMFwIE58B+eTssV?=
 =?us-ascii?Q?H2MuX01u5DuqHhOCGITm1NEpPlyBh2S1akg5b8XWfHM+f2GKSkH6vJP+dt0M?=
 =?us-ascii?Q?bbUX5Ue6TylDmnXcKCtF/MJ5X9quq8/Mloa5OqfqvXo52fjN+adhzcZFxt1a?=
 =?us-ascii?Q?gr0zVQ0F+u7jQKxbYxC8J9m4dKZbStgaUJM4mArLcOTadTKOp6FIk8khMOB/?=
 =?us-ascii?Q?BBUSWsda8gns4eaI6ZuyA4HQBZPLv8mMMvDD3CE99pw5+Gwxa2k45/VMZa7z?=
 =?us-ascii?Q?hSlvot2XGvteSG4JoDu5A2qevo9M0uRm7GHMbO7c2obhlu195MbBVlSy75YZ?=
 =?us-ascii?Q?w3T7SuG35VnaqysXaCM+31TkBuQ0EJWi00MCS3Ks8wfv80AcD5p+PGCs5JA8?=
 =?us-ascii?Q?UHAwSKKzjobL3oEw5Ph68nRMpjiGkwWi32GRRIvZfImA7ixc+CJSKlGhUOvl?=
 =?us-ascii?Q?BAspbDVkaJBt1MSEbveyyYSd82FzzewMtsZYpzzPLj7dLqgveJAdiCR/9Onj?=
 =?us-ascii?Q?51Z2P+aYoBpoYeeVtvc2p6GcMxmcNkgeHSnb8qp4fAs81m2IL4l4zUp28qQQ?=
 =?us-ascii?Q?j0DK4bXYGowA0kny88tqq3b9WocNDqWDXYkGeZGF0MNKZB3dn/PuhoSxc+B3?=
 =?us-ascii?Q?J5R6TfRYcoqGSB6tC6XEomYqtS7H4WyEsblcXqUW7obIkiv5o10FO4SftWAe?=
 =?us-ascii?Q?Ju7yYPG52tCD5kfvnzQyaaL7pR2wf9LL+3+ut4S/lyf/jHvmTfmLts5IY1+l?=
 =?us-ascii?Q?9tKserDdYFgmHoK6GAYu+iBXq1r9PIx4eG7fHMHutuqyjoeULSP2i1eJZagO?=
 =?us-ascii?Q?OZ6wtlBs+vhEPXpt14RErsJfREPcM5BA1ztJG4T0kSC4Bug5gpZnGHn4Z0ya?=
 =?us-ascii?Q?PFOCdwuBa0Q/4qzAJYWHsCxmP5iWRkmBjU/CChG7bt8zB4NlerchBsKWRGIr?=
 =?us-ascii?Q?/SOGWGExmJ9wzpTBHMueh10PUKBhYj2TXZUQF4lo2KN3ouLReHeodiAFdQip?=
 =?us-ascii?Q?69Y7WYWvf1D5bDoj91Vm1/R/UIA4qaOKIuwUPPBBKGOhY/nyV6osZQYXSqRS?=
 =?us-ascii?Q?K/T64EGA5+N3aCmb8BkeTFmIJP1EXGtA/B2xkRxMRSaTby9PPH5ynkokNhfx?=
 =?us-ascii?Q?XbNQud4byeLSy6GIproWyjbCDm4YAEsH9LnO8rzq5h6CTkd6W8y1+p7xJ+3r?=
 =?us-ascii?Q?3L+Eh5p3J5mX/gjbIcoCQCC63+qcZyzl1FTEx+rSicCYWwCpDIUZHWjib65W?=
 =?us-ascii?Q?9x2wyN9MSYu/1u0HE0zSSy5WjqEKwrBdfUSQsAOYKE3mqLNVAYfBeInoOuWh?=
 =?us-ascii?Q?UxTwBJaxg7sZqYIP8M2q4w2H20Lprc1ugxI+5mJuOzPW277RC2ADIcAUg9ck?=
 =?us-ascii?Q?pH/EQ4Bz4laQEmUxf7gJFI/jJduVVsaLWGvpKWv//q+sTjTxWOYcFK5boBca?=
 =?us-ascii?Q?KfDsOXP9vEeDzBXHOs1XRaIwNV5MC2Yabsv0Wc9YhUBFueenMBmCR5W9ZJoc?=
 =?us-ascii?Q?Nn72HMtO96sit0Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:44:27.6934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e844459-4e5a-4c2c-1378-08dd46c523c3
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9456
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 15:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210947

From: Alexander Kanavin <alex@linutronix.de>

This was prompted by working on librsvg update: the new meson-driven
version wants to query values from .pc files residing in its own
build directory, and modifies PKG_CONFIG_PATH accordingly.

When using the pkg-config-native wrapper such modifications
have no effect, and we have to pass them in manually
from the recipe via EXTRA_NATIVE_PKGCONFIG_PATH variable.

This variable is already defined (with an empty value) and
appended to PKG_CONFIG_PATH export in the native class, so this
simply extends its use to the wrapper.

(Appending to PKG_CONFIG_PATH in the wrapper, instead of resetting it,
is not an option as that can lead to contamination with the cross values).

(From OE-Core rev: 2bc050146d47b14d890a1b0db2b55f9057a08b65)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in     | 2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in b/m=
eta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
index 9ed30a0d80..fd5ab6b1fa 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
@@ -1,6 +1,6 @@
 #! /bin/sh
=20
-PKG_CONFIG_PATH=3D"@PATH_NATIVE@"
+PKG_CONFIG_PATH=3D"$EXTRA_NATIVE_PKGCONFIG_PATH@PATH_NATIVE@"
 unset PKG_CONFIG_SYSROOT_DIR
=20
 pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in=
 b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
index a9324de4cf..d4bb4f8c06 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
@@ -1,6 +1,6 @@
 #! /bin/sh
=20
-export PKG_CONFIG_PATH=3D"@PATH_NATIVE@"
+export PKG_CONFIG_PATH=3D"$EXTRA_NATIVE_PKGCONFIG_PATH@PATH_NATIVE@"
 export PKG_CONFIG_LIBDIR=3D"@LIBDIR_NATIVE@"
 unset PKG_CONFIG_SYSROOT_DIR
=20
--=20
2.43.0


