Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CFD10F9940
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 14:17:39 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.107434.1775657855016198572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 07:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=hPXoiL3+;
 spf=pass (domain: axis.com, ip: 52.101.66.18, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQuXN64TNU5VoixiAaJW4aaoLH9yEfG1uz8CBBNICtJR3huY5ZlE3zDB6ViE/XB0yQ6CGJXGqseh2fUz3wh2tYpowNyr/77zwkxVOnnCBSJOZS26XxiRMknz1aGRCxaNzkbaxFMxjyJkn9m2CHzIwRDoEdqlFg1m38ELRoigXGo+0wMnh8QhSP1XAcv+Imy+eMdjeIlFVRwilNR9kbJV/pSuu4amMKnzo42CiDWwCulyPQVhxHzgO44lkeV0zoA4A75KztdMqP7NPHrd07TghiPSC4VuHDhUgHud82sqZebpORTS/Mcd/UEF4EGEu0KuqX2lVLKPVmx+TgsKF1cdig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PLVxubEtEQkoVkuv54gmgCxmm2RuUdnCNHvS+1KNYc=;
 b=ms8EzGvEiOU6O3K1PTt5hU5YXFQHThGr3LanDsW2gHfH8Emy4IQKtVgmuHGBIntiV/IxHc+PE7mkBb9So6DkiurDiJvw/B/xTFQSvdxXYgVR28opmG/0609Y/zhMb03/IObyl/Acjwsjnp3roADQ/bp4kwVV43uqYj/+I9fwgqrC71BD6tTxckxkEzOkdxajRiAQ95K1CqVLKszKI7ykLLR+qYX05iJhdH12CCytzc1/v4yjqhEz/ZKGy6OUaxpMP8m1uD9EE1MuZ0VwCVroe753ZC7+FIgWE3JAex6+HTBOMd24UG+w1QVNeKGs4SC25OcJ1YeRDhBB5H01M7a/Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PLVxubEtEQkoVkuv54gmgCxmm2RuUdnCNHvS+1KNYc=;
 b=hPXoiL3+O4CojBCpB0zw9urYpE17QA7X2JrW3txTlNh32nMJ9ZTY1jWb0U1iR2pRrMSONMbrb1M9L1zgoA3/O7fmcRD/usToefMRgreM/DZWUl7QKEUbc1wbReIjL1eLBxVz+KACaYSP420f0ihf0CmieqP959rln98ezGUryQc=
Received: from AM9P195CA0030.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::35)
 by DB9PR02MB8087.eurprd02.prod.outlook.com (2603:10a6:10:302::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 14:17:29 +0000
Received: from AMS1EPF00000092.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::7a) by AM9P195CA0030.outlook.office365.com
 (2603:10a6:20b:21f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Wed,
 8 Apr 2026 14:17:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000092.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 14:17:29 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 16:17:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 7BCD01B08
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 73D08120831; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 00/10] Update the GStreamer recipes to 1.28.2
Date: Wed, 8 Apr 2026 16:17:08 +0200
Message-ID: <20260408141719.1086823-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000092:EE_|DB9PR02MB8087:EE_
X-MS-Office365-Filtering-Correlation-Id: a458b7a1-7741-408a-4ea5-08de95799138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	BlSyJgL2FrFL1EP7wOQdmRrjhTCRzC/6/rCWnqju5/mh0HlWnkQ9m1tRIoL9U9G30LYewykZsa0ZUm99n9j44NFXpx9BMDXQyEvxHsamHywBt/reSZaEerpMRoXQQzeGNTuRxgOkZq6PWdoFRXpPG1Ymwm3EUEQC9r5ismZmZec1rZ6dMe5j/5FLm7gCUn+xtqOOBg0lwHcWj6yQC/cumYSaeoHIM3shrVAWiH6N6nZm/zfpJV9v6KCw2VzKT9/AOBme6TTnIjOeA2lebTAzbmPO8IF7cDajWtS03wNKIShz4ZNLkmf7LzGguR97VdfQWJf7AmyJI3CAAD87i3Se/8179g7cgbUrGAYd7ri9C4Sk7/pDsyfRIZnlrWqqFkk3Ioapwro0PEpmNL2utwqtkjLBcxQvCAkgwmj2PIysipVcdy7Sp1jsnVl9MiYg5Y4hnhDJpMUP/Y5igz6pxAlhf5fi1hpvDmk7MT6tCi+PZw1m7OCfxjspx0gSk4ObaH1NAm/olwP8RZJy7nprIaXYxHKLqaAA0/j0Yq1RW0VQPTGxR+OcGJhyvofsR3CFch4On0OQ5kabUBMPiDnW+lSvXh6o3rLM4NNEY2/ZcRbqEL+e4HhOhU2gc2udPpLm/PxGIS0FBk/THI0DDsV8xil1aX0NxB3cCsP4zU3ljDDdXtBRHg3P1rZhKT/+q9OJw+9qqje7j3ARXX56rX8knnSvvPKkmQZ/pC1aS5WDm31pq8FCs7wno6Wmdp564FV3HFgaQ1cbtzdsVvqEk8K8Xra4LA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RFidT6ttOjYffV1fcizRAtFvq37s6LqpWvNMTp6lgS2WciVg7sDx9L0RHxG3ZsR+R4ljxVlbPJ6quAo3uu8jV5R89ttDnUk1pbHkbYm2jB4a5m6xXV0NmfydbH8NjcQeWsNOLhn1BUabNyHptmqq9tylI0qYQZgTzmXU1qu99sZ6NWWn1Wsi23mcZXc/PAqa4d2k4O+A5Z9Du1uIsYLZWvTkNUBzy6ZNi6yLyYEoYP4N8+B5iihv7/Bq4bojpQnvPFDutfqHXkvD9HDeNjWV/ddTjlBk84zKdRsa4iZdoXE/yhdjmwjqJVxMLpSDVy6lFHLQn3VqoqjJ0ZhcFKsPYRG5/Fm8WANIAlLP9vgwR9bCs6dB+843dwUOMobwYIFdi0BjP2xeJJ2WU0Lxyn4oLY4/TNpv0I+g1d2fTRCvy5vT7YrWsFeEvG/HczKoU5ez
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:17:29.2811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a458b7a1-7741-408a-4ea5-08de95799138
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234846

This series updates the GStreamer recipes to the latest release
(1.28.2). It is intended to be applied on top of the pending changes
that are currently on master-next, which upgrade GStreamer to 1.28.0.

//Peter

Peter Kjellerstedt (10):
  gstreamer1.0: Upgrade 1.28.0 -> 1.28.2
  gstreamer1.0-plugins-base: Upgrade 1.28.0 -> 1.28.2
  gstreamer1.0-plugins-good: Upgrade 1.28.0 -> 1.28.2
  gstreamer1.0-plugins-bad: Upgrade 1.28.0 -> 1.28.2
  gstreamer1.0-plugins-ugly: Upgrade 1.28.0 -> 1.28.2
  gstreamer1.0-libav: Upgrade 1.28.0 -> 1.28.2
  gstreamer1.0-python: Upgrade 1.28.0 -> 1.28.2
  gstreamer1.0-rtsp-server: Upgrade 1.28.0 -> 1.28.2
  gst-devtools: Upgrade 1.28.0 -> 1.28.2
  gst-examples: Upgrade 1.28.0 -> 1.28.2

 .../{gst-devtools_1.28.0.bb =3D> gst-devtools_1.28.2.bb}          | 2 +-
 .../{gst-examples_1.28.0.bb =3D> gst-examples_1.28.2.bb}          | 2 +-
 ...streamer1.0-libav_1.28.0.bb =3D> gstreamer1.0-libav_1.28.2.bb} | 2 +-
 ...plugins-bad_1.28.0.bb =3D> gstreamer1.0-plugins-bad_1.28.2.bb} | 2 +-
 ...ugins-base_1.28.0.bb =3D> gstreamer1.0-plugins-base_1.28.2.bb} | 2 +-
 ...ugins-good_1.28.0.bb =3D> gstreamer1.0-plugins-good_1.28.2.bb} | 2 +-
 ...ugins-ugly_1.28.0.bb =3D> gstreamer1.0-plugins-ugly_1.28.2.bb} | 2 +-
 ...reamer1.0-python_1.28.0.bb =3D> gstreamer1.0-python_1.28.2.bb} | 2 +-
 ...rtsp-server_1.28.0.bb =3D> gstreamer1.0-rtsp-server_1.28.2.bb} | 2 +-
 .../{gstreamer1.0_1.28.0.bb =3D> gstreamer1.0_1.28.2.bb}          | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.28.0.bb =3D> gst-=
devtools_1.28.2.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.0.bb =3D> gst-=
examples_1.28.2.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.28.0.bb =3D=
> gstreamer1.0-libav_1.28.2.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.0.=
bb =3D> gstreamer1.0-plugins-bad_1.28.2.bb} (99%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.0=
.bb =3D> gstreamer1.0-plugins-base_1.28.2.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.0=
.bb =3D> gstreamer1.0-plugins-good_1.28.2.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28.0=
.bb =3D> gstreamer1.0-plugins-ugly_1.28.2.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.0.bb =
=3D> gstreamer1.0-python_1.28.2.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.0.=
bb =3D> gstreamer1.0-rtsp-server_1.28.2.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.28.0.bb =3D> gstr=
eamer1.0_1.28.2.bb} (97%)


