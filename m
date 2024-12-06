Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C50FE7717B
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 09:42:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.55])
 by mx.groups.io with SMTP id smtpd.web11.33321.1733478142155778208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 01:42:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=czh+26/t;
 spf=pass (domain: axis.com, ip: 40.107.22.55, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqUNjsuMeAhVzD1Qwd6TIlJqVS7VP/Vxaw4bMmnyujhIW2GsIx/f2RGQXBFzPZGTc+NgtDAYMOPaidLIsW05GZAjUpGN0FU3dwAj5spzT5KCUlm4CwH3FetfUdpLhqYQ7sxOzej9H0I8sPTk2N99zfWW9XY0lHT3NTRyODnqE47R9AllMgHoBPruekEd/PmV2FU0K1lNkp9UOr9HxK7ikmVnELnWNVRI0B/s9P08xUHAatBBPjbwKPBPAWQ2dS7LzmlCm5yBgkLL6tkNBY8cJAQCIGRm/cIAXREQB4QMbEl3C16MaAJ4i9Ub9P9pfFAFpHshNf/oXaCaNMdZgLS22g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9po+JY/HY/RaEkRUQTcdTgREzQKrZ+vMxdqbnfP+EI=;
 b=AuhaXWESdlH3jO0fW7tafzL+71NLuqAMeS0PVlHQxuWcZJQH/X10oRf14DJy6pWHKUMZplK9wkdvTXSgamppKF/YPDsbziwW1/gJQ19G5JBzp0s9lupzZdlZl0uyvONuKEJE2K7KBmZbDLeEaWosFICWIRgp/uvuOqdGdZC/Fnmu4mPJTlWGEXPhT39T/RcoGdFKYfX3YuWp/gKi3kHYN1YwbXLmYKhnDuOV6RDo84TNSa8vUzSZQQ052m6upR1h3NFIJbG6o0mSceyK0zUjvrlIJFUc0bot20R9l9dK6V3D9Dw8zAamNTCTBqUujDrvW+qAxLo9q82sY29ETVXfIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9po+JY/HY/RaEkRUQTcdTgREzQKrZ+vMxdqbnfP+EI=;
 b=czh+26/t0Y6j/vyrfu228SD8Yax/4ZTwWZ4G1k/r+VNuIs2unibRlSjKV7mngWdVOfUM5mIMYzF4aYTIbN1rGlpaFD+Q1AR0Uy1GGuAzVo64OCfUZKfnVHlVR8IJf+JhfFssT1S4ntPofJ7nnq5OkkxufhWP4QM6Cr5INweb6tM=
Received: from AS8P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::25)
 by AS4PR02MB8527.eurprd02.prod.outlook.com (2603:10a6:20b:586::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Fri, 6 Dec
 2024 09:42:16 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:31f:cafe::89) by AS8P189CA0021.outlook.office365.com
 (2603:10a6:20b:31f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Fri,
 6 Dec 2024 09:42:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 09:42:16 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 10:42:16 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 10:42:16 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Dec 2024 10:42:16 +0100
Received: from pc58073-2410 (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 336D3177;
	Fri,  6 Dec 2024 10:42:16 +0100 (CET)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Johannes Schneider via lists.openembedded.org
	<johannes.schneider=leica-geosystems.com@lists.openembedded.org>
CC: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <alex.kanavin@gmail.com>,
	<alexandre.belloni@bootlin.com>, <johannes.schneider@leica-geosystems.com>
Subject: Re: [OE-core] [PATCH v10 0/3] pkg-database and systemd-sysext image
In-Reply-To: <20240522141152.3286471-1-johannes.schneider@leica-geosystems.com>
	(Johannes Schneider via lists openembedded org's message of "Wed, 22 May
	2024 16:11:49 +0200")
References: <20240522141152.3286471-1-johannes.schneider@leica-geosystems.com>
User-Agent: mu4e 1.12.1; emacs 31.0.50
Date: Fri, 6 Dec 2024 10:42:16 +0100
Message-ID: <jwqr06lp2pz.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A63:EE_|AS4PR02MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 65203f39-d593-4ac2-317b-08dd15da456a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?27ALtCEwSF6GlUK63Fpt0DiW2ksm5QKurhLYKBX8+pyV9p0nnJYQY0K736Xj?=
 =?us-ascii?Q?oke71JpyGdhtM+704wrENcy60tPWrpU0WROtukWmX5gGIAwWyi4cWiA9XyMU?=
 =?us-ascii?Q?WBfJz+5TrGybycZPuvdqoT6R3x9Px2MVh+OwJ1ZirsCYFZ88APwneOaUPYNg?=
 =?us-ascii?Q?ee2VnwMXMpNVDXL34FtFtmw1ewaO9wxjd+HPQE0twrvpQJYkTrjDikS3Zlba?=
 =?us-ascii?Q?OI5IAVyGI+COdLOhNPokmTNLdHlC/ij2b3WDkF8vM13SUG7Nvlj0bSsgXscd?=
 =?us-ascii?Q?Q+TLGCKg7Op51NswM1qyKMOz9oqdo1ZEGDqEWDjUIzMOWHsbiCiOpghIgPGX?=
 =?us-ascii?Q?eYcvlMK1fzXaI92Dz4BJNaCNy9aRmwbLOYrlwNXuwB3h2/MPqHzNZPREYKwe?=
 =?us-ascii?Q?3CXTYzE04QbXbyW2Gs5pDPDUACKhl9OQ/8XAb2IER6byKPk8x/Pra9hsJ2ZP?=
 =?us-ascii?Q?s87LAzFoTwg4upjlC6uOcN5e68Bgpj4ooLJ8up59n1rNWU1IhZxPLKAqzpf5?=
 =?us-ascii?Q?tjR+mdCsqYM9YZ+xJGwM46SXzkaWEmTl/L6vN5ux35Vp2y/ibHlnDAMWDERR?=
 =?us-ascii?Q?TM78n/4vT+f80O9kfma2r9vJGVlFelrX5azvxz3LR+k2wDK1y8SFqHMk0wpj?=
 =?us-ascii?Q?UN1WdNZFqJnTpqsZJZtB1T88DTdv3H39nRHTsQfCgTYyuh+Lf+3gpTZHG/+i?=
 =?us-ascii?Q?bHkzMBV2+pfmEqDVVsTk47HkT9DVLA/GV+slhoWyDr6dcX40Z+e/29Vb+tTb?=
 =?us-ascii?Q?U3cLuMki1s/qmlx5WveSmEXKj2DRcRaI+VA3Op4Yw30d5DEf6tf5pBFZ4Eok?=
 =?us-ascii?Q?Cc3M988KujDPh00J0NBq1G7LFujg0KcqqW60Ang9qKzT1tuFt8Vh8Ahgbwk6?=
 =?us-ascii?Q?IyUNEH5OUmoC05ZPPPpjyrkonCdjRNMp/sRYGtOSBj3F5S2SaivtqLo0iLzj?=
 =?us-ascii?Q?iNPPX8JGt839AKlCwq2MRFcThF79j1eH+4rbG8P4KHlzyHWwInWiAf9c09GK?=
 =?us-ascii?Q?KhxfuippOZy6VjKTTvwbEApgxL8JQqztEDfjnOIupfr8yPwRR1hQtR+yL2Bk?=
 =?us-ascii?Q?jorQ3Cco4laZvrSarWGILFXuf0oMxe3yww/8/ZZi9QMDuH81uXowJMpPpJNM?=
 =?us-ascii?Q?hEJICH57NDtddkrkLzoc87rVWF9N0t4popls42RD6cleRcWniYfnTVUhiPOm?=
 =?us-ascii?Q?niwgkuDouczQD1QcylrS+QIEfktGjUmAu1ZtgYKQ1LX4EI0yy4psktg0axO1?=
 =?us-ascii?Q?8d4aHPZtZj2GAi8R/Rf8Vq69k01c7qJyNLMB/9a3xeSNacNRxPhrfInxQZfq?=
 =?us-ascii?Q?jGmD4Pxs1344dQL4hmP4wHp2PzJ1FbBL5aQjZCHRMGqKHCFYLCBbH8CuByol?=
 =?us-ascii?Q?vXIP/O0qbqlnRQw7E9ZlYfmCOV11slqjccX1amJCGT4VJkqGoQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 09:42:16.7807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65203f39-d593-4ac2-317b-08dd15da456a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8527
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 09:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208410

Hi,

JOhannes, what's the status of this patchset?  I'd like to start experimenting
with system extensions and this looks like the place to start.

/Ola


On Wed, May 22 2024, Johannes Schneider via lists.openembedded.org wrote:

> systemd-sysext allows to overlay another image (or multiple) ontop of
> a "base-image" = the current rootfs, via the use of overlayfs; to add
> tools and features meant for development purposes.
>
> To quote the documentation on systemd-sysext:
> " ...addition in order to make debugging/development easier). System
> extension images should not be misunderstood as a generic software
> packaging framework, ..."
>
> To build a lean image, that only holds packages that are not already
> part of the base-image, a snapshot of the package-database is taken
> after the installation of the base-rootfs is done, and picked up again
> when collecting the rootfs of such a extension image.
>
> with all this in place an example usage could look like this:
> some-core-image.bb
>   inherit core-image
>   IMAGE_GEN_PKGDBFS = "1"
>
> extending-image.bb
>   inherit image-sysext
>   IMAGE_FSTYPES = "squashfs"
>   IMAGE_BASE_PKGDB = "some-core-image"
>   # the above pointing at a package-db similar to:
>   # build/deploy/images/$MACHINE/some-core-image-$MACHINE-20240210172305-pkgdb.rootfs.tar.gz
>
> then on the device, running some-core-image, with the extension image placed at FN:
> $> ln -s "$FN" /run/extensions/$(basename $FN).raw
> $> systemd-sysext list
> $> SYSTEMD_LOG_LEVEL=debug systemd-sysext merge
>
> As long as the VERSION_ID of the extension image matches the os-release
> in the base image, the above commands return sucessfully;
> for details on the compativility check see the docs for systemd-sysext.
>
> =========
>
> changes with v2:
>         rebase from 'kirkstone' onto 'master'
>
> changes with v3:
> 	incorporate review suggestions for simplification
> 	add task dependency handling
> 	add oe-selftest for the pkgdb handling
> 	add variable documentation and
> 	some more comments, and examples in the commit-msg
>
> changes with v4:
> 	rebase onto 'master' => no functional changes
> 	fixed patchtest findings
>
> changes with v5:
>         rebase onto 'master'
> 	add '.sysext' to the deployed symlink name
>         sidenote on the tests and autobuilder failure: run locally they succeed, e.g.:
>           #> oe-selftest --verbose -r imagefeatures.ImageFeatures.test_image_gen_pkgdbfs
>
> changes with v6:
> 	tests: restructure to call 'bitbake' only once in the testcase itself
> 	  (in hopes of solving the autobuilder problem; local test runs succeed)
>
> changes with v7:
>         tests: undo the restructuring of done in v6, in favour of explicitly forcing steps:
> 	  '-c rootfs -f'.  since concurrency of the autobuilder, and reusing artifacts/sstate-caching is probably the issue?
>
> changes with v8:
>         tests: fixed missing feature=PACKAGE_CLASSES during 'test_image_gen_pkgdbfs'
> 	   which is now split into three, one for each of the three available packagemanager: ipk, deb, rpm
> 	   
> changes with v9:
> 	tests: fix singular failure in 'oe-selftest-armhost'
> 	   which was due to the built image not containing a 'kernel-image...', which the gen-pkgdb sanity
> 	   check expected, but 'packagegroup-core-boot' instead
>
> changes with v10:
> 	tests: fix runCmd usage in relation to native-dirs
> 	   due to which only the use-pkgdbfs-ipk test would fail in a qemu run armhost environment
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199756): https://lists.openembedded.org/g/openembedded-core/message/199756
> Mute This Topic: https://lists.openembedded.org/mt/106243260/3618480
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ola.x.nilsson@axis.com]
> -=-=-=-=-=-=-=-=-=-=-=-

