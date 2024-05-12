Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DC3C10F1A
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 06:32:11 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web10.30495.1715495526523544818
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 May 2024 23:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=nMOzXEdt;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.6.74, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2gg/ZJh43GVG+bjdG3t0avxNsFWn8vm01SzCtuvfk1sv6Xnvabk78cJ5B4cfad/2HQ3rM3UK+lAXl8HAIwGvG1Z2nzXjReWKB7ILNMRe/Q8ieQb+irPD0Kt6DHNZ1HQqH8RiyFrEXJ9hK2LfnceQ4bA2QpTn0AOIlfQp3WnoHOpPDYfTaQmgVFCPX57gYxW/phh1k7B4dBzHON9y07MoqoTqipueAYuO2SKL+dFbn0E+1c9fTfbDOCvtg5Cv1a7E0rwmHDiw8bm4TT82K4rrWJ2vr2phsdci59kX+GzOMkEi16dvZ2n27PVVVZeYybXTDZEdfN3EVnL4mn0OFYO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3r4hudWukBwPrfS3E5UL9K8k4YyBX7wbxlM415sxpU=;
 b=Mz8Yqec2kkWYxhXMicXKz7RuHOLRd1q7U3mKOJnaL2gId6SjL2rr2s6t3vMBBNU07psqQ+WDFZf+rNzxALHBYJFZ6G92wbJYOnrdZSx4L5Q9iYYU2F9fCsuApPDs5zOKUsRPqbaXOM38JwzUQoQCiV/4OagDaAcdWcHlBCn7IJl7GzHd/JlTt0TS9R/GQderLvvLrQ3OPYbhN6hcnW/7WtNHVhOy1Wj4u7apBnnIIkXvw2yvT5fKOLNa3AspTdl37jGsn8JOOMajevtrku1D6HCpWf1mpPFiIdtM5RG7u/KvmgPPwWfMsh3+u2JEM9ROf1BG4OkopW96gQ4/3vvpAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3r4hudWukBwPrfS3E5UL9K8k4YyBX7wbxlM415sxpU=;
 b=nMOzXEdtm3OL//FehB+A6LFqBq78adkHUp+cF2XOciNzawoZpIcI71XVZidwpL/A+14YgwNFgvClPMkeb2QqHqiDUwntzUayI0pacJ3yi+l21D1FRLqdhxkjRUI0E4fzxiMLDxqrS92b0QUe4x23OOAbrcQgTPinztBQK3ozngI=
Received: from DUZPR01CA0352.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::15) by DU4PR06MB9669.eurprd06.prod.outlook.com
 (2603:10a6:10:56a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sun, 12 May
 2024 06:32:03 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::d) by DUZPR01CA0352.outlook.office365.com
 (2603:10a6:10:4b8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Sun, 12 May 2024 06:32:03 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.21 via Frontend Transport; Sun, 12 May 2024 06:32:01 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sun, 12 May 2024 08:32:01 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v8 0/3] pkg-database and systemd-sysext image
Date: Sun, 12 May 2024 08:31:56 +0200
Message-ID: <20240512063159.1249522-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 12 May 2024 06:32:01.0208 (UTC) FILETIME=[18CC4380:01DAA436]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|DU4PR06MB9669:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0fb39087-3834-4847-d85d-08dc724d3b8a
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?INE+oHBaKWWOxPuJGYH/O+SBpmHy1O9EHwiEzigzffkrkWbC5t9j0vvya8ac?=
 =?us-ascii?Q?ZP67+xAM/F25TZZbkiaKhu7TtRzx3oM2hq07OSJc4cix8JrOIeSbfOkDxM3U?=
 =?us-ascii?Q?41Mk9XRdP4+27p8b+Dj9XtufeIZHP8Erngu6072AnpVvW7qnSQ4IdgkqG3C1?=
 =?us-ascii?Q?3xyd6S/mPgMcgIayX/t7j1BO21ABhx2f2ju8HolITOJ3+GLVKjrM7SzCOcVg?=
 =?us-ascii?Q?WZnr7e/CdQP2GZipGvd5MsmYn8DhtpUofsYYTljqiC1LcPTlp5fyY9FpTn5c?=
 =?us-ascii?Q?aXwFmHe6GnafOj5KxADV3NPSOKjY/tm4OVE1iaZIMAnza1h4mp/3LFivGFM2?=
 =?us-ascii?Q?7fo9IHD2DaKBTb7JAvfn/0MzQOnTrVNFvP3tb4lNMRERwbEz+4RkSd3WdHc+?=
 =?us-ascii?Q?Fx0bpIxig407bEx1j0u6uc+zhUKuEoY/LcaN+06lBPiDQD103aMGdQOZ5kby?=
 =?us-ascii?Q?5eJrHqgefpe3oH8cv8I4+K5hEhPmakGQMTF+iGOABS31qzXKhlzioCw5WGcl?=
 =?us-ascii?Q?B/YpVMqV7a1/kSc2oZ4YjBkvozQ/CO0ynwRCdCg5oWvss6LgeCzWYRWNvlsp?=
 =?us-ascii?Q?oP5HN+98cjMj+lJpo1AT2Gui1GoBwpHavsKlig/UIBtkTu+hkfzmksIQHtzk?=
 =?us-ascii?Q?oPKPOy+wEgU/v7VPCs99u/I08CyOH7obcGcc1K17XwgTAFUUhIxIBgssUhFL?=
 =?us-ascii?Q?qWUQMrS0QXrKUDqrCdQI/fvJ9s8GJqr0PMGn7KTSfL6KBCzgw5UYW7DXdAXd?=
 =?us-ascii?Q?TB8zYvqvICCfBUCUIKp6dqeThozWzluFzZjTfI9Ugumd42AvEt3hiqlwz5jA?=
 =?us-ascii?Q?CMFD2dbzW30crVVQW1gYSL9unVdSP1gEbQ4+SWe+4vUq7mU9a72I01TqNfd7?=
 =?us-ascii?Q?KHP+WVrNbfV9DrkZ44zkmyGzv/Mk/JaELG32bR78gHzgen5U0U7xZLBPTkt5?=
 =?us-ascii?Q?S8Eo2TAb/rwdlCii+MzzI3RCXIoDxmZsMg2HP83m8CoHQ7G9cM8b8pCvGGHf?=
 =?us-ascii?Q?ESxHjifP3KisBgBtSpvX8w18mK3xDr99cs5LIazweM9JxoH4C+mp+5Oh21Mj?=
 =?us-ascii?Q?WcqI9Tn9aaaxHEkpD37hGAyPAm1TuuxR2OVBBzRXphBD05Uk4ypdN8hMoqu+?=
 =?us-ascii?Q?01OBgetI8gLIuYa+yVtXBNGDr56WxAZJGUr8KcfpuEE+nHZ93WzRiL9OlzwP?=
 =?us-ascii?Q?mI1+AZU+eqa/ZeH+Dv37SrRI+Jq10eHNozcOlnBE/Be6wOj6S4yzlaKtdlTC?=
 =?us-ascii?Q?Sj0LgY8E7bg3quV1WECwacecTAsfzHphYhWmr2rU33QSEndiGPdBlapEeyTR?=
 =?us-ascii?Q?9vayi/BpdFYixBT+Qm8jTiLRN67fQe8TnBYIQtng+whIu9TJERHcWEikKs/R?=
 =?us-ascii?Q?qE+um8U=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2024 06:32:01.6146
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb39087-3834-4847-d85d-08dc724d3b8a
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB9669
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 06:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199209

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

