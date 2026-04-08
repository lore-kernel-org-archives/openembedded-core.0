Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B958410F9949
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 14:17:39 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.107628.1775657852586676216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 07:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=dUiK/b2W;
 spf=pass (domain: axis.com, ip: 52.101.83.8, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ohsjv+PDipDDfCvWbiFAtcCBLMtSq6aiPYXRotb6BN/7kNshuHLCXBNpsEpQxgBTHHIsV7GtaoqsbQoKVVZeq4Xb7hcgoxePy4g0qgbgUp4LtDXjpbfHPlvNO9oa+oJi/zgjyEIVwfJtTc8U29XACz4vmg8MC5DUhfSc4AacPkChiS0xJ38dwdf6VqVnNj5DZkF1hIs32QvOn0YZ+s6NhRiNmzTN2ipmbFKzcPSTqbfE71RwiGsYYL7AHoGNCB+BZDGOPX5+/QGEzNnTylKTDYP0yd4XwxMYeON/J15lvAzCvvDu3UN9NsTrttpmaXl4tKdPu2xM9C42daLjFxdwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqdD5Pki3cbZMDjbmdklJU6LRP7W3M8/5M4D51YgzNQ=;
 b=FG2rxwmrYdi+4bXdvtRapGdJ0g89eIqPLy3OYIZD+Rv2tlB2jHVOv/dqIcyvijEplQUk1C7N+cjWj/Uj32qzn+0bvY8p5z4z9AVDRc87nGIiPTLiYMtI/QcYRZJGxzIzPz12KTI8PLPGNGpdAAs3B3dnptkq5GsDkGEZq0QyczUjdYPHxKObH+V2VyDAeYtoW+E2iBhMyXuTItceHcGzsSBITLhe0bLyto+ScuFRaYNbAdV2oW9l2Su94UKxWkKzrjShPd9vudxY5uxBuW+vs9M6S3SxLexBvcYmN59l8ykbo05POOTK0M8T+wj8zaBGaVAHcnQuvGoN+0x0BPV4sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqdD5Pki3cbZMDjbmdklJU6LRP7W3M8/5M4D51YgzNQ=;
 b=dUiK/b2WilU2AYqxGCvZEpWK0LIqX5C+HguXVA9mLrQU0fqY0Tz7z3E8HhloNF/yQtnkAhaXJj/9Ly/SejLrLmc5gVemhlzQd2k4Zpo4COK3wPocPCM9Q1swfx+qlrdJ3usWfKODUfFFwbxPOUc9d8K2zP2i1lOe4r232mUaAfk=
Received: from DUZPR01CA0295.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::11) by DB3PR02MB10403.eurprd02.prod.outlook.com
 (2603:10a6:10:43e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 14:17:27 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::4f) by DUZPR01CA0295.outlook.office365.com
 (2603:10a6:10:4b7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Wed,
 8 Apr 2026 14:17:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 14:17:26 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 16:17:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 820B71CED
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 7D9DC120831; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 03/10] gstreamer1.0-plugins-good: Upgrade 1.28.0 -> 1.28.2
Date: Wed, 8 Apr 2026 16:17:11 +0200
Message-ID: <20260408141719.1086823-4-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408141719.1086823-1-pkj@axis.com>
References: <20260408141719.1086823-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|DB3PR02MB10403:EE_
X-MS-Office365-Filtering-Correlation-Id: d55aaa5b-ec47-4c3f-66ff-08de95798fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	mCQR9s8jGo7Zy4oxe+RQ4WbvdPuL2CZtei9R8VTbo8F18qkPnvyJ/lsalWH6T6gi4aaybtW6JRkhaLRRKDeklFxeGn6rE7vGYEDRXBl8WjgWLKVvWtBjqWe0+emzIZdQF7dBDFhisHFzcgZxnaBoilL9g8LYj6088Bjvz/lYUcHF3kS+3Uv7NZ46bgps9542dffwBAKIHnrltxmTU6m7cDz/y/70GWFMZNNG9VBp5p8gIQT86o95sic7AzhlIVj/LmEFm9Grc5arsjIeDhdf4CsTxNhNJD/djg6eWj60HupZ3hyfVk6gCyxqIxAePGmdvzd7xFdRfCvHVJOCAYG9KE/tkskOUZf8kAjRbX/UCy/XOmvf9egZj8c40vz4OouCy0SmKM9NAYBBYtWi/Hphe0Cu1FddfIUwasjPH10633cpN/5kV0ZUHnaj+CWZRL1ftewHgHtVqPSUkvxgb3Y2lHbVxeOvAboPJ6whqVzeHvUsTYxvUhhHSBJnde6wu+bODEfOZtbD8qP5JQf8+ZKHZx12R3bf+B4k3725LE5iY+DvSHXBzx/h0uDQacFfnhr9I4y/pL/HqjdM/+a/cXJdh8x/bWVnuPa82mCzXlnfGPBHO0bTpThAo9jABHFHjcJGX9aMg8xjQTqcaLF5lpXQU8f2QNhj2k5l5/8sgOgYLtH/DaZBifWca0COboDDqo0ThLD1TdKtX282Fh3r6RAByNYHBcN3CcSCDYsb2ufUCzg=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KGa8NlnIfkbaFxxaVv06fKXowkz8GjGd3E6YvUqe6OagDI1AT14YSkwH8Y0F53KckR4wiK8sy27tCH+QgQC5RB8Mk+ALTRlSr71RhROYh/ei2r/SxlZBQ9Z9VKotYfPq9b/hDeJ7evzKIx36vh//m5h3nlhcjzVZuUwo7umYBw564f9dR1N4+sgb7ytw48lxaSO1NF9wyH4DgntQyP2s4KcjQV6TuE9d5QFUo1h+/+kW4ryi/lEbLCwbRUeE0iINVmLBDZcfHPJSNl/aXaxg48Ip1mJmhF1033pR0balQ/iy2wTZhxcT0uAIK9+E9gAxP15db3KmIQ84mCZr1qYy7M6+RqcQAzCrSHRx3dHQcZWY0Ht7NaLD5LbX5tuuAnsCvbqDKglO6U3c3kDfXD225hHl0ci/MIim7jE5tShBbasFjyM9TVbCg9SSq3QvdbRV
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:17:26.8678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d55aaa5b-ec47-4c3f-66ff-08de95798fca
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR02MB10403
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234842

Changes since 1.28.0
* b2a3b2e: Back to development after 1.28.0
* 99c68cb: meson: Fix libxml2 not building due to wrong option type
* 8388e74: qtdemux: Improve debug output around seek event handling
* db3c0c6: qtdemux: Rename last mention of last_stop to position
* 19e3c57: qtdemux: Set the segment position to the start on EOS in
  reverse playback mode
* 5c681d2: v4l2: Add v4l2av1dec stateful decoder support
* 6438539: v4l2: update gst plugins cache
* d3c0283: vpxdec: Support downstream pools with alignment requirements
* 0edccca: qtdemux: Don't ignore flow return when pushing queued
  buffers downstream
* ff3edfc: qtdemux: Make sure to not output the same samples multiple
  times in reverse playback mode
* d415a2b: qtdemux: Push raw audio/video buffers downstream in reverse
  order if rate < 0
* e1c1979: wavpackparse: Parse 32 bit sample rate and channel masks
* 74d8469: wavpackparse: Print hexadecimal numbers with leading zeroes
  for easier reading
* d296187: wavpackparse: Sync flags with latest wavpack
* 4ad4418: wavpackparse: Include sample type (int / float / dsd) in the
  caps
* 6631df5: wavpackparse: Correctly parse and advertise depth vs. width
* f4d6909: wavpackdec: Set OPEN_NORMALIZE flag to normalize floating
  point samples into the [-1,1] range
* 7005bb5: wavpackdec: Allow up to 4096 channels and up to maximum
  sample rate
* 7514ac2: wavpackdec: Re-create wavpack decoder on caps changes
* 2cda74a: wavpackdec: Output 24 bit samples as actual 24 bit samples
* 69e76ae: wavpackdec: Allocate output buffer via the base class
* 293e350: wavpackdec: Output 18 and 20 bit as their corresponding
  formats
* 4d3bdcb: wavpackenc: Extend caps a bit
* c5143e8: wavpackenc: Map buffer readwrite for channel reordering
* 3db67a3: wavpackenc: Add support for S8/S16/S18/S20/S24/S32 and F32
  samples
* 4704dfe: wavpack: Update plugin docs cache
* d333aeb: qml6glsrc: Fix rendering of scene with clipped items
* ee8e500: qml6glsrc: Fix scraping of QQuickWindow content
* 2b09aec: rtpsource: Add locking for receive reports table
* eaadb4d: gst-plugins-good: fix author name: Kentaro Fukuchi
* 0f77771: gst: fix author name: add missing closing angle bracket
* e92f814: rtph263pay: fix author name: where not separated by ','
* 4506913: gst-plugins: fix author name: correct incomplete or wrong
  emails
* d125725: gst: also adapt author names in the gst_plugins_cache.json
  files
* f68c471: rtpptdemux/rtpssrcdemux: adapt klass "Demux" to "Demuxer"
* 75ae4d7: gstrtspsrc: Set new mki in the encoder upon crypto update
* 09635fe: rtspsrc: Memory leak in gst_rtspsrc_close() when
  GST_RTSP_EEOF error occurs
* 835da19: modules: Remove NEWS from git which is generated from full
  release notes
* 201b14e: modules: remove RELEASE from git, will be generated from
  template on dist
* 7694a7d: modules: remove subproject README.md from git
* 6376a84: modules: dist common files from monorepo root
* 291e479: meson: Deprecate `system =3D 'ios'` in cross files, use
  subsystem
* 88febbc: osxaudio: Stop using HAVE_IOS, use TARGET_OS_* macros
  instead
* c3b73e9: qtdemux: Fix out-of-bounds read when parsing PlayReady DRM
  UUIDs
* b4558a4: rtpqdm2depay: error out if anyone tries to use this element
* 1171ae8: wavparse: Remove pointless duplicated GST_ROUND_UP_2()
* 3564405: wavparse: Use unsigned integers for data sizes
* c73a1f4: wavparse: Use GST_ROUND_UP_2() in two more places instead of
  a manual implementation
* 8822ee3: wavparse: Define maximum chunk size in a single place
* 081484e: wavparse: Avoid integer overflow and out-of-bounds read when
  parsing adtl chunks
* dcb37e2: Release 1.28.1
* 32113a6: Back to development after 1.28.1
* 5ee8c64: rtptwcc: fix feedback packet count wrapping at 255
* 216d38a: all: GThreadFunc return type fixes
* 180a877: rtph264depay: fix invalid memory access in
  gst_rtp_h264_finish_fragmentation_unit
* d824117: Qt6GLVideoItem: caps update fixed
* d6ed0a0: qtdemux: fix invalid WebVTT timestamps
* b8436bf: wavparse: Avoid overflow in length when setting
  ignore-length=3Dtrue
* 586ff9c: wavparse: Fix parsing of RF64 wave files
* b08a64e: rgvolume: don't apply dBSPL reference level compensation for
  LUFS values
* 9ca0bd6: hlsdemux2: fix seekable range for live HLS streams
* 100a0e6: qtdemux: Don't immediately push segment after moov in push
  mode for fmp4
* 95919fa: wavenc: Skip writing empty LIST INFO chunk
* e717c43: gst-plugins-good: update translations
* 1ac03ff: qtdemux: fix handling of in-between fragments without tfdt
* 457b197: qtdemux: Preserve Metas and Flags when doing row alignment
* 27a9cc0: qtdemux: Avoid integer overflows when handling transform
  matrices
* 1279ec9: qtdemux: Don't store 64 bit integers in 32 bit integers to
  avoid overflows
* 0871bb2: qtdemux: Check that big enough stco/stsz are available when
  parsing sample tables
* 160bba0: qtdemux: Error out instead of trying to handle a truncated
  stts box
* b73c493: audioinvert: fix float truncation in transform_float
* bcc8c6e: qmlglsink: Fix for caps tracking on multiple setCaps calls
* 5ebb94c: qt6: Avoid parsing caps on every buffer
* 49bab9c: qt5: Avoid parsing caps on every buffer
* c4f56c0: rtspsrc: Discard early data in ONVIF mode
* 86e640a: rtspsrc: Fix const-correctness issue around strchr() usage
* 48cefc4: flvmux: fix race condition on caps get and check
* dbd4cb4: qtdemux: Avoid division by zero if 0 audio channels are
  signalled
* 10fd1ab: qtdemux: Validate chnl defined layout before using it to
  index the layouts array
* 3441881: qtdemux: Avoid out-of-bounds reads and writes of 64 item
  audio channel positions array
* dc7ab66: qtdemux: Fix bit pattern check for omitted audio channels
  map
* bad6721: qtdemux: Add various integer overflow and bounds checks to
  uncompressed video handling
* 8aed48f: flvdemux: Avoid assertions on corrupted streams
* 35a905a: wavparse: Fix integer overflow when checking available
  buffer size for reading cues
* 0d819ce: wavparse: Use prepend+reverse instead of append when
  building the cues list
* 6db6dd0: matroskademux: Add missing parenthesis when calculating bz2
  buffer sizes
* 43421c2: Release 1.28.2

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...ugins-good_1.28.0.bb =3D> gstreamer1.0-plugins-good_1.28.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28.0=
.bb =3D> gstreamer1.0-plugins-good_1.28.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.=
28.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.=
2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2=
8.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.=
2.bb
index 116e328adf..366eb8189c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.2.bb
@@ -6,7 +6,7 @@ BUGTRACKER =3D "https://gitlab.freedesktop.org/gstreamer/gs=
t-plugins-good/-/issues
=20
 SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-pl=
ugins-good-${PV}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "d97700f346fdf9ef5461c035e23ed1ce916ca7a31d6ddad987=
f774774361db77"
+SRC_URI[sha256sum] =3D "1ace2d8ec74f632d82eab5006753a27fe0c2402db4ca94d632=
71e494b62f50bf"
=20
 S =3D "${UNPACKDIR}/gst-plugins-good-${PV}"
=20

