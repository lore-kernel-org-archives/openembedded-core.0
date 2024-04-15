Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32F9C04FF9
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 06:02:15 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.45])
 by mx.groups.io with SMTP id smtpd.web10.14555.1713160932301276505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Apr 2024 23:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=CfX4QTvb;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.15.45, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wn4dWv0z342JZ/DVSKz1mTTffumuBGQcwCcFtPo9xFuaZUO4/sVF0u2Oiv3fG1s2n8zMv2S+jO8+Db02A+cWjN0fdW35NHA/4pLk6NdA0aiVVLM8ztCAZeV9P5kPoykqHjOlW09B2bh4DITR1ej0VqpMAxX/qh0Z4qvtLLSSNEji2jHJyJkI2gM8cV0XSuYZv/8bc6RN+1dYcQ3StCd/kr2XMUbDX49KZL6aR682ipB0DsiZY+DZgbXDpGppKte6sI2q0oiQHgEUk/YFeMzN8vtyl7iKBACpdZohOsCN4nxPTzbqhxVxGb3MWxjeGiSiqsP+aZpDrfsbPBMgu/OXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tW3XldKZM4Yp6fFPfYgIBx/3TEYszd29xCFjcXw3cU4=;
 b=aWHUihlDeX9CZ/0vWCNmef7ONlY9yfvHi1AyHOJHHkFyQzLC+RZJpm1FSiZIn7quaIbEqz5NC9UPjOymbYnKS+eTdYzTRDKTxDlt3sfhUudgSmeY6H3o+S1GucIDHMn+WLDkv3+YwekMpdlrEZgyLFLz5mmfaQiES2Gj/Skyx0JJ5fhK8Eg9vPkmPPuDy3Nd24MwaBJtCxIqffHC9o9pHY19ji+BiVvbcK8jxrgu6cC5Et/y9yP7T7Ikkb5ANt3egBxjQUiKl9BINY0aX3OSLVkUYD/eoKGRsxwQBA7tuduyOAbSq21b1sq1pom/SFVyFCMkJHpRFdiYgSuAVwlJJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tW3XldKZM4Yp6fFPfYgIBx/3TEYszd29xCFjcXw3cU4=;
 b=CfX4QTvbVI52vqKwvvo4TzoX+TVCLY6+9V93z8IfNXPchPJFLHbh2WMU6bEw5NkdNUJ/Ss3QsDAWb3Xur/QCpOrokzSRHjt1lRttQtmbM8aPAOeyrBurdPOvYRTGC/imLGOblVGvuDFsEWtXd+ClDuUY19oCv2Y84Mfza6e3TkY=
Received: from AM0PR10CA0018.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::28)
 by GVXPR06MB9067.eurprd06.prod.outlook.com (2603:10a6:150:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Mon, 15 Apr
 2024 06:02:06 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:208:17c:cafe::3d) by AM0PR10CA0018.outlook.office365.com
 (2603:10a6:208:17c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.27 via Frontend
 Transport; Mon, 15 Apr 2024 06:02:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.0 via Frontend Transport; Mon, 15 Apr 2024 06:02:06 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 15 Apr 2024 08:02:05 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v6 0/3] pkg-database and systemd-sysext image
Date: Mon, 15 Apr 2024 08:02:00 +0200
Message-ID: <20240415060203.2961-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 15 Apr 2024 06:02:05.0839 (UTC) FILETIME=[718571F0:01DA8EFA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F99:EE_|GVXPR06MB9067:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7142d2ba-e74a-49f8-b1cb-08dc5d11941f
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N9VPqpc4BNPUNstY/J9+/pMlMWf6yiXZjzb/FrjZfRq4uP5oKIVMYcyMV2uW80lh8Y2W3o5tZa8P1lAtxo2M6rYCMzeFewqUdI+slBaBECodDY1nNLbUuxlNk3SjbI5G3Xu8+7tW2fkjzRMexM2Xfwxck2nnLx42csa6bsE9wO3o+iAhGmfUXcLwgiS+6jcAOdupA8fYoPevCKgjXWL0LxVBy21JFhBVyhwB7uhuaSXXeWAf7y7LIkyFNya+OKetR/izQMLGJS2vbeAJsfNJASG6SNEz6NU0RYc8vMcu5tRu3Q68Gqs0k03iyg5xXydQxwDw9dkab8KFWVRtw+T7hZEly0Nanxkb/HDyt565keFxkz12YICd7byphxQ//K5S4ZqwSTFL1HMsnv65zdZccuDkm/ZqG8ZJCEzTZbDcIdNhB8iOMIXlRUVnDcP6kzVAKGBudAfVummnn+Lvtyg5tdsxHRjGKXBXVkDuz+OjV+u7zlh5w6i20nzZllRKtTwF+XNEoMJnd+7LzubJ2egCKOpyQlJ1mpW5HsYDRSvCocBOHBhYUVJcVBaO7y4SEGHbGhJvKzJCvKhpgdwWx5didUY4yZGG7/mcmJ7z8uoOdDGxn99iNtVdWg65VGAVXSwPROLBp5Ho2VynVyRpAQrbHIg+lJdLWxTUmSMJso6vwTdVlZ9h/g4oqdWVvb9tXmGLljPptiIsTJGTFv5ksyDtJz1hvF428e8HRvdbSu8rveNgjqxGdAiRLPPeUPiLHKAn
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 06:02:06.0231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7142d2ba-e74a-49f8-b1cb-08dc5d11941f
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 06:02:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198219

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
	restructure test to call 'bitbake' only once in the testcase itself
	  (in hopes of solving the autobuilder problem; local test runs succeed)

