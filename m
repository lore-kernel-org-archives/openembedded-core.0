Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82D8C25B7D
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 14:12:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.82])
 by mx.groups.io with SMTP id smtpd.web11.11080.1716387118420737662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 07:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=OyXtd3IM;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.82, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZuLKDCRPCNxu+iEzbsqalZpjGS/8DhpPexlOg2mK0a61yjqz9T006LdiRh67jwzoAJjqOP605rCJEnftP2VojU+en+Pge+UpdE0adLSRPUIs6blNZzWoNQs6zp7JSbNplMj83JpHVCzMkd7KaN6UnjLJ/ArSft0aijUkdYQbAzGBE9p6/wkg90PQOaUv4oc928bCqATHcYbROA+Tg1up3eIWpQ8qzRu5Iq8RwSz4YetOtnRQ2twJYU7vT46RtaFLnJV9Cy+fJrwGR0gEZO36wFSmBhkbGR4q/X2ljL4JGDEdFKgtJQfPedjQE+wQXlViFR7q92Z3zuHWTeqvwY7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/42iwoFBj015o2n848oX4tIImUTDkgNipuP31HUsURs=;
 b=JWLvMussiGv/4//Np5+mgqyGv2VMTN2ixni0NNQodHdrrjw+zpUQhdFIniKHWZTDGWR+E7Ccfp4TwLIKRQVce6BHEwRrYStavGrvSAgahGRHq3/MENeEmGXrW3ifkmoZ+73giUlCJgaIdIcAns/7jVVRwRwK98KI3VKoC1jYVLZQcw483PSGJDOPEkGjJ80PZudSsWW5EFlipJzq8NLlo6I3MCdR6hwScMAEqfrofeWcCSWKHsp1zwydqlNRa08f6B18t9qocYNRexlvPjGxaar3UAzwM9wv56ILaW2tmV4h7nwPZgHs5XvUl/Or++VcV3aahE2vJ+sK+j9E1wdqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/42iwoFBj015o2n848oX4tIImUTDkgNipuP31HUsURs=;
 b=OyXtd3IMEWG4FgXBtehYw2tXHgcZcBTkvBTeZ9gnWE12XB+batQBdSLdEVFOADugxMKhqDLWoMJ+HXXqpqXnu5V/tc5jK1s9XN7em2YokJ5rAKo0LVXAQDPzzAucrJSyxEXyjA+b0HkB9m5N9cxvyjfU/Q4wDF8JAGKph6gGovk=
Received: from DB9PR06CA0017.eurprd06.prod.outlook.com (2603:10a6:10:1db::22)
 by VE1PR06MB6878.eurprd06.prod.outlook.com (2603:10a6:800:1a4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 14:11:55 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::fc) by DB9PR06CA0017.outlook.office365.com
 (2603:10a6:10:1db::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Wed, 22 May 2024 14:11:55 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 14:11:54 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 22 May 2024 16:11:53 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v10 0/3] pkg-database and systemd-sysext image
Date: Wed, 22 May 2024 16:11:49 +0200
Message-ID: <20240522141152.3286471-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 22 May 2024 14:11:53.0907 (UTC) FILETIME=[FF758030:01DAAC51]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C2:EE_|VE1PR06MB6878:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bea89748-e6da-4bc6-e91a-08dc7a69222e
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8LBPD2iIfhOCPpcXM3k0UWnxvUCr29NwDzLdJrNieBvQMJi2AjDrwT3yKntx?=
 =?us-ascii?Q?St+iGLWsZSxKLNHBAiIPGXA0bpaC4XjwZmhwOp52thFsbqOTD1pmdRtqQYpQ?=
 =?us-ascii?Q?Lxzr+Lgfj2TEoej5J2r8hpUUv6aTT2EoguPiiGHIn0uaIQGvfTpXasJhbudK?=
 =?us-ascii?Q?jHiOTSvfjK+v8CsykoPduRWer/CzD1lyqNW5qUlcpD4yaiYlTMdJhxm8Uo8P?=
 =?us-ascii?Q?EoKMYbc0Tem38WKIRAMXaj7W89wcurIpRgJbVfdnghnWWh20gZRb32yWl0k7?=
 =?us-ascii?Q?EhbVCYOqDgWuYfPgutxJnm2QPgo4JUymIoEAUuIg93IUTZvIhZFrqBmPHL8x?=
 =?us-ascii?Q?I9uwu5piOjn3jW/WJqZsDdNhISWN+XqOnpqS8NBgm9nux2bks++ImPd+hT/+?=
 =?us-ascii?Q?YOJTbs6EXx0RtdwZ2gHTsANt9E1OJmNctgQ7Z7nYRPeClugh9phqrfMtGujf?=
 =?us-ascii?Q?w/H5EpQxwOSdmKqUgb8d1a9JTsBDBmELorF0THCiQ2GxRVd/DdtOesv14oIo?=
 =?us-ascii?Q?pjR8cdQFLdFW34dn/aII4QQOydOtqEH20coMRgB13QMuTTrr24HHCv5xozae?=
 =?us-ascii?Q?vEiX6vShIQUP9Kfj7SW7iW8Ue24iSELiL7qHEgFSLBkxjaQVIFGLDpq+WbAz?=
 =?us-ascii?Q?+O603D9nXeR0koc81gwSohZDi4wHhlQHJSRqjdFPSxhx+tytOL1Rvc9g5cJn?=
 =?us-ascii?Q?yqD19BGzJ7QUwkfyJymqjGWF/cihpxpdkLpEwl+8wypWkQ6JicUfnqidtl/5?=
 =?us-ascii?Q?63nGOXnviqmVRCGC+T2mabvXh4AouArYJYcvpHFS4BWDCdSJ6kjNvS6w2mlm?=
 =?us-ascii?Q?JWbQJyksIGNSVTesrhIScYD6mRV1ArLwpdVPrHatYG5OhPp6CHUc/4SAwXOD?=
 =?us-ascii?Q?MDbNRwk4GlwvsTO0XX9USUblje8xO7oUWo1FV8D4YbUJZs8Bg/Ubv2Wvbgez?=
 =?us-ascii?Q?fI0qDZyf6YMbOM0gdOq3VMeD76k489V48XudsIq4qM4MWBYVex7IMu5hZbNh?=
 =?us-ascii?Q?r0G1jDfMIxuIFwQGGNRJ1pbVK0tlRBpA671zskERBq8hdGx+KkgnSifBL4cY?=
 =?us-ascii?Q?RDVZU15C1hqGOIOgIXW9viyCTbELxnIpAOA7OAKMw0TAumszOUJ/GMxkSrht?=
 =?us-ascii?Q?MlscTAj7+aZM38CaSjZDMx4lN6cQnPkz5cCuot8K25Uuq/jfzx7YI3QZ5BSa?=
 =?us-ascii?Q?++Kms8WhPQwZQc1eGC4IzrMzO3PtJ3Y5tLVsodENXDh3FzNopj4WD7UySb8g?=
 =?us-ascii?Q?0hNM9a8W/wDcym2720MmEd2mJOVP155Ru7uL3+AfHaN9SxWEf/eTxc5vJYGA?=
 =?us-ascii?Q?F6W9C4T+auzRhFWhv2KldQoxGFkAOA1IVxKYQ04Wtisxeb71Ya0igqZgNKF5?=
 =?us-ascii?Q?TGBD6wo=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 14:11:54.2797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bea89748-e6da-4bc6-e91a-08dc7a69222e
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6878
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 14:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199756

systemd-sysext allows to overlay another image (or multiple) ontop of
a "base-image" =3D the current rootfs, via the use of overlayfs; to add
tools and features meant for development purposes.

To quote the documentation on systemd-sysext:
" ...addition in order to make debugging/development easier). System
extension images should not be misunderstood as a generic software
packaging framework, ..."

To build a lean image, that only holds packages that are not already
part of the base-image, a snapshot of the package-database is taken
after the installation of the base-rootfs is done, and picked up again
when collecting the rootfs of such a extension image.

with all this in place an example usage could look like this:
some-core-image.bb
  inherit core-image
  IMAGE_GEN_PKGDBFS =3D "1"

extending-image.bb
  inherit image-sysext
  IMAGE_FSTYPES =3D "squashfs"
  IMAGE_BASE_PKGDB =3D "some-core-image"
  # the above pointing at a package-db similar to:
  # build/deploy/images/$MACHINE/some-core-image-$MACHINE-20240210172305-pk=
gdb.rootfs.tar.gz

then on the device, running some-core-image, with the extension image place=
d at FN:
$> ln -s "$FN" /run/extensions/$(basename $FN).raw
$> systemd-sysext list
$> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge

As long as the VERSION_ID of the extension image matches the os-release
in the base image, the above commands return sucessfully;
for details on the compativility check see the docs for systemd-sysext.

=3D=3D=3D=3D=3D=3D=3D=3D=3D

changes with v2:
        rebase from 'kirkstone' onto 'master'

changes with v3:
	incorporate review suggestions for simplification
	add task dependency handling
	add oe-selftest for the pkgdb handling
	add variable documentation and
	some more comments, and examples in the commit-msg

changes with v4:
	rebase onto 'master' =3D> no functional changes
	fixed patchtest findings

changes with v5:
        rebase onto 'master'
	add '.sysext' to the deployed symlink name
        sidenote on the tests and autobuilder failure: run locally they suc=
ceed, e.g.:
          #> oe-selftest --verbose -r imagefeatures.ImageFeatures.test_imag=
e_gen_pkgdbfs

changes with v6:
	tests: restructure to call 'bitbake' only once in the testcase itself
	  (in hopes of solving the autobuilder problem; local test runs succeed)

changes with v7:
        tests: undo the restructuring of done in v6, in favour of explicitl=
y forcing steps:
	  '-c rootfs -f'.  since concurrency of the autobuilder, and reusing artif=
acts/sstate-caching is probably the issue?

changes with v8:
        tests: fixed missing feature=3DPACKAGE_CLASSES during 'test_image_g=
en_pkgdbfs'
	   which is now split into three, one for each of the three available pack=
agemanager: ipk, deb, rpm
	  =20
changes with v9:
	tests: fix singular failure in 'oe-selftest-armhost'
	   which was due to the built image not containing a 'kernel-image...', wh=
ich the gen-pkgdb sanity
	   check expected, but 'packagegroup-core-boot' instead

changes with v10:
	tests: fix runCmd usage in relation to native-dirs
	   due to which only the use-pkgdbfs-ipk test would fail in a qemu run arm=
host environment

