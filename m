Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A911105D9B9
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 14:17:39 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.107430.1775657851929028913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 07:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=lcJR8joQ;
 spf=pass (domain: axis.com, ip: 40.107.130.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ge5lDDOl+Oq4BfILG1GtoxgbI+9JsxOp2kUBDX1jpyWQdjuvnVjyO9HuMDR7SZRThFTkdYqeWmw3MaPV4PpMpVQGeIGe/amu8H/ivqecngiLPdYD1fqLsptEO+dgOFcJWaef+gm/1VLIzN8UAKfyyFlsbJLHYYI9e6v6rfP611Wb7i5jdW1gQ3njvlB/DXKAN8lF9FYLKO+O3vnfpawFTE8AL1Yneg6GoFSygDBj0OIReQogl+kM37faKHfCnPaeh7q6IGKcN9LyIPTs0kwQv83g52wK5wLVVAShw6XIRwI8kRFobbOL9m1IzO2fpCIvbv8nK+ByGL4SCwC/GD2W3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uslEXQn2/Cnkw0gjL9Q/t3mBGTlFar0xAGgSpC3Kf2E=;
 b=j8Coslal/kgSpRgnbs89AWYdWIMeQion/LTP7qPUDIqSGbXAwfEA8UNoOWPe8Qw11GeiqhBqA3sj5pYAaHN8gdineBlwMqcdA+EoUjQy6ckAEqZNHrLA/S6ebG//UxErj54i8NIxEN6hCjhGtlZylJtQ4zlXuXsOhSlc5QWNecad0gVRGtYSW5IHvPL1J6ORJ8idAj/TLNyS+fL1rqYlY8tupa6YnHqoc26bEYMiNblhP1j2H2hXp0wYSCSzok/x3IGMo+F79anU/XYbXZuUdubrGuuk+lhyERzWewVhs/KxqV+y6dHfId/OpRqJ25UvsOACZyxBc6g0649OAbB0qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uslEXQn2/Cnkw0gjL9Q/t3mBGTlFar0xAGgSpC3Kf2E=;
 b=lcJR8joQ5+4MJjafg6mwIOy96xuny4uLSufbpzjwHSXcfWK51Qjxo/DC+6ProwKCoUim40GY/45tTfe+V+Ln9U7hl7n6gkEyX/jmRBNzCXfu2Rgw2aNaN61Cyd8H0JsImEe67IWOLldsH0JsKqV0kE34BQIqj4UHg9s0CyNOzJE=
Received: from AM9P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::30)
 by AS8PR02MB6519.eurprd02.prod.outlook.com (2603:10a6:20b:23a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 14:17:26 +0000
Received: from AMS1EPF00000092.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::37) by AM9P195CA0025.outlook.office365.com
 (2603:10a6:20b:21f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.35 via Frontend Transport; Wed,
 8 Apr 2026 14:17:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000092.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 14:17:26 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 16:17:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7FC971AB1
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 7A6AF12092F; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 02/10] gstreamer1.0-plugins-base: Upgrade 1.28.0 -> 1.28.2
Date: Wed, 8 Apr 2026 16:17:10 +0200
Message-ID: <20260408141719.1086823-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408141719.1086823-1-pkj@axis.com>
References: <20260408141719.1086823-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000092:EE_|AS8PR02MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: 1555cba4-33cb-475d-28c1-08de95798fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	oHFTKhXzpw5rXhuxvkAjFKEKrbLJx9azuXl+sIgbPgiQDsuBJLTy+S99qi2EtaBzkOIT+W5hC1PjqD8dtUwUUFbfHfJ1/O1O2m85UzjuIwhGwvTLyD+01D3FxKZVxxmvjrBHFS23JNX0SfNT+HhifQwn5wOWG43qfTqFFPxNI1rKnRdJURAxvPPPVMR8tIkLCOr6PbeGhpqPtI7BAOJVffahrpmIUrHe2+ZAOok+WZDIMVDQJPVnHMPPvr68PJRLmNXSet02elRLZ78myv5Z98GG9jmomPuoF8F3NODoE+/Sjj3/VPhPlo/NV0q9VnjhVXavX3YZFRNxPbTpYL/MgsDmGcrbf0A3IFBb6UPm7FIpYCL0VXMVlF9PiDsJUVx11K1bhoLyNBFVh6K1OwSb8JYklV6NnkzIN72yWdfjCZO6/gAeii94LSxvhm1rMwE/TjkGTs91Jyw/WhXtBRI1+S9mMG89W4Hby9xaHMGm0Kmt0zXgDiqOcM+B/inNOtUM51egElzk9BDYXlWMzuxvIHyEKMaaYMtPeONZ1hY8+Qu95x333/P+6YFxUCMHpwsHS4dnu6PM47hoYgRm/xrD8CTfATjrbeaLkWWpO91OLFqb1iNjYv6PT6+kBNzBe0aIkOrJcJohIX/FMku9Mj6BDPVUGU4eC95YzwG6Cjzl2bV5ga+gFEQp8PiTxehpy0u+sleq5vckYdb4Ys3rRhTv+nIRRIbI6Ol44lLpIFlEKIM=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kzBCOVEp9PuS3L49y1nv5CB9UcfghamYspRxL+o2wZKdfXZoRAGifncKgBElSKnNqAUmaWRqS9FQrP3qGNLCJLbaBn5SvbmsP/rPxIJUpEMkwb7G0k4FA0OIMsXu9JR44ozIvrpgc+ctWmqNIXPx6sAVzdnFQQDTYVAoPea+cOV8EQ4T2oo/38zpq/Zr6fvy71J/DjUy2vhEwUVNAsAYjF0asGwSVsxEUOC7RKUxxGhlfj+ZAhonAzD3EUAedy/FmIVFFlh6KcBmiIbPwvIJW3bywsjRas3Ua1Oqb2ZspjXOUvHUuJFcJJ6VKx6PyOJT34xgX/j4GaDnQgBtEFAJQvYj88kc3DbKu7zSgMwZYBHO8FLJTKPYjfKMFEmkaydDSG4ZOWcoowgu44t+r9TPrJXY+FO1c8jQf9UCM+CMTk8MZFucBXxIiaZpNDNGv7Yv
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:17:26.8026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1555cba4-33cb-475d-28c1-08de95798fbe
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6519
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234841

Changes since 1.28.0
* b2a3b2e: Back to development after 1.28.0
* e2c7b85: input-selector: add pad release stress test
* 6cb0626: input-selector: add test eos for remaining non active pad
* c4f4ad2: typefindfunctions: Promote y4m_typefind
* 62629e5: decodebin3: Ensure input->collection is always coherent
* cad6787: decodebin3: Improve handling collection change on existing
  pad
* 7365663: rtp: Add mappings for H266 and AV1 encoding-names
* 3d82e94: base: Fix a couple of new const-ness warnings around
  strstr() usage
* 848766d: gl: Fix explicit enabling of EAGL support on iOS
* 47576c7: eagl: Auto-resize when the UIView window is resized
* 4faeb36: audiorate: Handle SEGMENT_DONE the same way as EOS
* 2a7e50c: videodecoder: Handle recovery from temporary reordered
  output
* d6fb546: playsink: unref color balance channels with g_object_unref()
* efc09c7: decodebin3: Fix switch to smaller collections
* acbe1ed: rtsp: Validate transport parameter parsing in RFC 2326
* 746553b: glsrcbin: adapt klass "Src" to "Source"
* a02c813: audiodecoder: Only forward gap events immediately if no
  frames are pending
* 045b7a0: videodecoder: Move gap event handling into a helper function
* ff28f77: videodecoder: Don't directly forward gap events if the
  decoder is not drained
* b1c6307: videofilter: Add VIDEO_ALIGNMENT to downstream pool
* 835da19: modules: Remove NEWS from git which is generated from full
  release notes
* 201b14e: modules: remove RELEASE from git, will be generated from
  template on dist
* 7694a7d: modules: remove subproject README.md from git
* 6376a84: modules: dist common files from monorepo root
* c6ea1f1: compositor: Do copy_metas also for background frame
* 291e479: meson: Deprecate `system =3D 'ios'` in cross files, use
  subsystem
* d765ba7: eagl: Add support for tvOS
* 507fa0a: gstgl: Fix incorrect usage of G_MODULE_SUFFIX on macOS
* e14eecd: video-converter: Do not transform_metas with 0 width or
  height
* 133c200: meson: Fix building of examples/gl/qt/qglwtextureshare
* 377a41d: riff: Correctly check that enough RGB palette data is
  available
* dcb37e2: Release 1.28.1
* 32113a6: Back to development after 1.28.1
* de557ba: glcolorconvert: Fix NULL pointer dereference on buffers
  without video meta
* 216d38a: all: GThreadFunc return type fixes
* ecbaac1: rtpbuffer: Add validation for CSRC list length
* 8b1dec6: rtcp: Fix buffer overread in SDES packet parsing
* 3e5ac12: opusenc: Use correct memcpy() size when copying Vorbis
  channel positions
* 8b4ea49: video-converter: fix I420/A420/AYUV BGRA/ARGB output on
  big-endian
* cad4597: videorate: Fix unrestored caps on backward PTS
* ae535bd: video: fix too small default stride for UYVP with odd widths
* 6c2d5bd: gl: upload: Optimize EGL format check when there is no
  context
* 8112ede: gl: upload: Fix linking glupload with restrictive caps
  filter
* 5daccd1: gst-plugins-base: update translations
* 69d7aed: compositor: move gst_compositor_init_blend() to element
  class_init
* 2f35652: rtsp: gstrtspurl: Parse URL having user without password
* ae8c618: videodecoder: Fix different seqnum error
* 9e4e4a3: audiodecoder: Fix different seqnum error
* 13f2638: base: audioencoder: Remove fixed caps from srcpad
* 9379c4a: exiftag: Unmap buffer if parsing a rational number gives a
  zero denominator
* 87c7096: playback: Make sure to check for empty/any caps before
  getting the first structure
* add1c1f: parsebin: Remove pointless casts
* 2a437f9: exiftag: Ignore invalid fractions with numerator/denominator
  G_MININT
* 9949c53: audio-resampler-neon: read array operand by hand
* d33fc55: subparse: Replace a `g_strv_length()` in a loop header with
  more efficient code
* a41cbb4: subparse: Replace regex string matching / replacing with
  plain C string parsing
* 3a81eb4: subparse: Fix handling of closing of multi-byte tags
* 12fc1ed: subparse: Avoid NULL-pointer dereferences in mdvdsub parsing
  code
* 7617d9e: typefind: Avoid signed 32 bit integer overflow when parsing
  AV1 LEB128 values
* b86af52: typefind: Use a byte reader for parsing AV1 bitstreams
* d9c7e28: typefind: Allow G_MAXUINT32 as LEB128 encoded value when
  parsing AV1 bitstreams
* 1f78c53: typefind: Remove dead code in AV1 LEB128 parser
* 66044db: exiftag: Use g_malloc() instead of malloc()
* aeef929: exiftag: Add missing bounds check and integer overflow
  protections in various places
* e47f697: exiftag: Parse sensitivity value with the correct number of
  bits and endianness
* 7f6db3d: subparse: Fix integer overflow when calculating qttext
  timestamp
* 5e78c44: audio-resampler-neon: read array operand by hand, part 2
* 43421c2: Release 1.28.2

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...ugins-base_1.28.0.bb =3D> gstreamer1.0-plugins-base_1.28.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28.0=
.bb =3D> gstreamer1.0-plugins-base_1.28.2.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.=
28.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.=
2.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2=
8.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.=
2.bb
index f0a3db578a..79cc4f312d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.28.2.bb
@@ -11,7 +11,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-pl=
ugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] =3D "eace79d63bd2edeb2048777ea9f432d8b6e7336e656cbc20da=
450f6235758b31"
+SRC_URI[sha256sum] =3D "4db76b3619280037a4047de7d9dbb38613a4272dcc40efb333=
257124635a888d"
=20
 S =3D "${UNPACKDIR}/gst-plugins-base-${PV}"
=20

