Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3835C10F9951
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 14:17:40 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.107433.1775657854793707975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 07:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=EOFSwOyY;
 spf=pass (domain: axis.com, ip: 52.101.66.2, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oB+1z6unzDFgllkSwcapkr7cuIzzMyLK/QTFYXz9qFuMyeMFTQ4TDXB2tLE1Z7j5leAL/fFREc8UF3W4Wgb8516mN2fBqaoa1op/f+wCdbtTiB9tgwQSGVrC8T+HeyWU9i8j0qJUDvP+BPTP5z2fKqtaluvBDqEvtxHVGmwWLWwB4pM2J+CIMtOTY6ZKwpKawt2+89KHqypJB2EdM8qWCIIpnZTADvp14qJAIrlIogqtZDAPSYvOIn8g0SeDtp2595jpUUo09Boy6CUZ2/SnzTPIYTkbvHKzns3NYDauyZDhIhwja8OSfjL0hs3jjP2YkV/1G2f9HLvb49JrwqZ/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjeL/CrLzh5Arl6K4fJClccBGq23DzBXYVC560+lH7s=;
 b=X0/ZM25/8VSvtv4jE4E6ICRFe9Yg5ktFgGVWEgmgElVYqKVqRR1+jQ0fXuV1a2FPn3bMMmiFpWKr62CLELy53+jQCrUmgjEiz1xXVcQpAOUxpcIMjdMlho+HfmKjJ6t5vl2SK2LxnlVrEclFp1lbjz5MHh9cFfQR6Vf8RjO1j+OPYYpfyiWMxjGAk5we868uFNAnCOcueU7WUBkeu7G5M/00KOnyv9kkb6QY2LhWViKhk39y+floKJusgH2M5nnzXYNYT8cLuNm8BoqNOjzsZVQ2rb/vXyk4VHdhY+qond+nKVEy455lBlyoHD8YXa518MmZSKGoS1mww+MYNPRzGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjeL/CrLzh5Arl6K4fJClccBGq23DzBXYVC560+lH7s=;
 b=EOFSwOyYajuc+6eTuwQ8xd234Dt1EsVbdyEk0FadPzc+tODpdgg3LR7vhlQQFSddc3C9bMosJjQaOPoMGarj8D+J7lctZEvbF9Z8zA/K5y8kZYmLFCFq0wfgM0XiH1bSTgFtvwqDOUBapDBG+lTVWwJ713bCzfGCmwO/1jUzatQ=
Received: from AM9P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::19)
 by PR3PR02MB6172.eurprd02.prod.outlook.com (2603:10a6:102:64::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 14:17:27 +0000
Received: from AMS1EPF00000092.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::d0) by AM9P195CA0014.outlook.office365.com
 (2603:10a6:20b:21f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 14:17:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000092.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 14:17:27 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Wed, 8 Apr
 2026 16:17:26 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Wed, 8 Apr 2026 16:17:26 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 860092024
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 813D612092F; Wed,  8 Apr 2026 16:17:26 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 04/10] gstreamer1.0-plugins-bad: Upgrade 1.28.0 -> 1.28.2
Date: Wed, 8 Apr 2026 16:17:12 +0200
Message-ID: <20260408141719.1086823-5-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408141719.1086823-1-pkj@axis.com>
References: <20260408141719.1086823-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000092:EE_|PR3PR02MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c21e92-e372-434e-006f-08de95798fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	QsG4xbCQ10csATGplbGeexbmzzkHMvrCbxbLCF/K1YYjaqhBZquRIYAdjnVSxpVoJSaoie57S1MOUmfcN2xP6x/OI4wJ4GQLtzHRaDLXY1HTY+DvzqmvNfE5S7OIpHLGimgKS0Iak8kd7UF4Vpqoh3Ln2w6hbvinlM0Cj9oE6mhk+JLFrb3M6bhgo2c9+zs55YqMRtNji7T6DQ+iclRsHG2EIIvAifOHSYOzfHKkq1A1mlquydFcQYZTVtgl4cubXWN5Akg6ZQ596SiI7idIJn8jB5WIbBSEWGsRssNc+XRI0rmSCmL65Kp7G6dUCxAKgHQgucg6knbnzjw98R8cpsu2Q2q/YDap6h0YcZjoXSWjB/MwVDYUAOuhfyvO1Q1stl5sha0xeQLdD9h8YgB5WDE0TLIQOkE0Y0/CZ3XTja+PXNXxMyYkN50e3AugVOYAigz+ovMZl3ORbo8URZVMQVINew8tUTMvWFahodiSMMne+awFGu1EUbTY0cXqkWfaU0Xiqv2nsY8/46ZKzeKlgfT+AsLxq45RpmfqI7ylQgZ3KqEshm386LU4zrbX+HFXS7XHSjLhO4S/jJE9p81PGDEdPxeNJKhRl8/E+xtIqDopD8jho8M3HJZttKakKN9jGRW3LTKvTPLvnKjcPklDqmFygTgsE8O3JZsAUOn0dAwa+lHzYUGN2iipx0deEK3o2WljFnSVLDHwAT+u9uE6an4g0EuJyl0FKyHlGE0uPsg=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ZyULgHX2eJweeFwPe/kdtAPkFzpfKmqRyKgQkLRzmsCsgnI0xsfmnrKDTYLoBFjDIzd6+IQkKSK8sfs4mzjVTHjn8I/jCRXXOhuRMGQbL/O+LSgwEKTc3P2H5E7jVyxJhiXgwqJqufXl4Kt8mrzxZ1VEPxpNmaUi0S8jnYCuxIY8tb9YWklWARosy/ViXMLUJ05VzP6HekqyFDSlR6FjaRuxWAN16EJQN2IN17xIaREJ1sxE2ln0ahpRIF0qy1qfwp7msNX/s4j/OuFWSDpLQsBNa25Budsosu38UylWPpHWDQmWZDIqqHxnDQ4+URItlv2OVrPY8hcc7OiXKAIVKbnbRXBz7HZvkoCOn4oYcrEklrfsL3J8I+wz+G9D+hq1L2anhK/gIcZ7g++87Vd00Dul5eSH5xp/J67vbsM66nDH9Qxik8S9zoO0ojeMOu6o
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 14:17:27.0184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c21e92-e372-434e-006f-08de95798fdf
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:17:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234845

Changes since 1.28.0
* b2a3b2e: Back to development after 1.28.0
* 99c68cb: meson: Fix libxml2 not building due to wrong option type
* e973899: cudaupload, cudadownload: Fix CUDA/GL interop copy path
* 83b8417: webrtc: sink floating refs of ICE transports
* 887f2bf: ajasink: Only allow 6 / 8 / 16 audio channels
* a74bd95: mpegtspacketizer: Handle clock change/resets without skew
  correction
* 956e714: mxfdemux: fix gst_mxf_demux_pad_get_stream_time ()
* 73bc4b8: tsdemux: Fix Continuity Counter handling
* 3795ca5: tsdemux: Simplify initial packet handling
* 150a7e4: mxfdemux: always send a segment before sending eos or
  segment-done
* 3fdc449: codectimestamper: Fix latency query handling
* 530a52f: vtdec: Always reset flushing flag in flush()
* 4dfe11e: vtdec: Fix a very slight race in handle_frame() when
  flushing
* 0a5e48c: vtdec: Make sure to reset last flow return when flushing
* ae04185: vtdec: Implement drain() to allow reverse playback
* 9e0e66f: webrtcbin: Check the presence of encoding-name fields in
  answer caps
* fe28caa: vadisplay: Fix a couple of new const-ness warnings around
  strstr() usage
* b88511e: classifiertensordecoder: Fix uninitialized variable compiler
  warning
* 9924971: gstplay: fix reference counting
* f721368: v4l2: Add support for AV1 V4l2 decoder
* 0fd06de: vulkan/ios: Fix scaling and resizing with UIView
* 0708627: audiobuffersplit: Correctly calculate adapter start/end
  running time for negative rates
* 9ae3903: audiobuffersplit: Use the output segment for output related
  calculations
* 1a9c31f: audiobuffersplit: Don't use floating point divisions
  unnecessarily
* 5e9ff8c: audiobuffersplit: Log if an input buffer has the discont
  flag set or not
* 2ded76c: audiobuffersplit: Send any pending segment before
  EOS/SEGMENT_DONE
* 72b9964: audiobuffersplit: Handle SEGMENT_DONE the same way as EOS
* 1f43861: audiobuffersplit: Convert gap events to silence buffers
* 16a2fef: audiobuffersplit: Implement negative rates correctly
* 6c6aba2: mpeghdec: memory leak fix in MPEG-H Audio decoder plugin
* 63e8a3b: vtdec: Don't re-create session if only the framerate changed
* 9e17a28: audiobuffersplit: fix reverse playback
* 59a7e80: vtdec: Add more debug logging
* 321c742: vtdec: Fix race condition when negotiating during playback
* 030cfc1: wayland: Fix CLAMP operation of maxFALL and maxCLL
* 705376e: objectdetectionoverlay: add support for rotated bounding
  boxes
* d2aae83: cea608mux: fix overflow when calculating output PTS
* 05d821e: siren: remove trailing space from klass
* 24d4d91: openni2src: remove trailing space from desc
* 2700371: smoothstreaming: remove trailing space from desc
* d5e0ba7: gst-plugins-bad: remove trailing spaces: update
  gst_plugins_cache.json
* f7f24fc: zebrastripe: adapt klass to recommendation
* d032f3c: fieldanalysis: adapt klass to recommendation
* 3c06dee: dtls: fix author name: add missing angle brackets
* 0f77771: gst: fix author name: add missing closing angle bracket
* 4506913: gst-plugins: fix author name: correct incomplete or wrong
  emails
* d125725: gst: also adapt author names in the gst_plugins_cache.json
  files
* c20ae61: videocodectestsink: fix typo in klass
* b463b8f: unixfdsrc: adapt klass "Src" to "Source"
* 8aa4eff: avtpsrc: adapt klass "Src" to "Source"
* e6348c3: rtpsrc: adapt klass "Src" to "Source"
* d21129f: frei0r-src: adapt klass "Src" to "Source"
* 78ce4b2: tsmux: reduce noise for DEBUG log level
* 5b40409: openh264enc: skip drain for baseline profile
* 53a95b2: openh264enc: remove broken drain and simplify handle_frame
* fafeaef: ajasinkcombiner: Only forward the segment events from the
  video sinkpad
* 988666b: meson: Add a subproject for providing the LunarG MoltenVK
  SDK
* 5084c9b: vulkan: load video function pointers conditionally based on
  codec operation
* 011a06b: waylandsink: make gst_wl_window_commit_buffer handle NULL
  buffers
* f201683: vtdec: Fix CM memory leak due to incorrect unref
* 930b4aa: zxing: Minimal support for compiling with zxing-cpp 3.x
* 51f45dc: vabasetransform: copy buffer's metadata at copy when import
  buffer
* dbefb70: zxing: Fix version check for zxing-cpp 3.0.1
* 835da19: modules: Remove NEWS from git which is generated from full
  release notes
* 201b14e: modules: remove RELEASE from git, will be generated from
  template on dist
* 7694a7d: modules: remove subproject README.md from git
* 6376a84: modules: dist common files from monorepo root
* 2601491: vtdec: Avoid busy looping when queue length is smaller than
  DPB size
* b76fe59: ladspa: Fix macOS detection
* 291e479: meson: Deprecate `system =3D 'ios'` in cross files, use
  subsystem
* 4aa405d: applemedia: Stop using HAVE_IOS, use TARGET_OS_* macros
  instead
* b4eaad5: avfdeviceprovider: AVCaptureDevice manufacturer is more
  widely available
* 38655e0: applemedia: Enable EAGL support on tvOS too
* 25fbfd3: vtdec: VTRegisterSupplementalVideoDecoderIfAvailable is
  widely available
* e833ae2: vtdec: Software decoders are now more widely available
* 082bc62: avfvideosrc: Add support for newer iOS 17+ APIs
* 190153c: vtenc: Fix build with tvOS
* 1c213de: applemedia: Disable avfvideosrc and avfdeviceprovider on
  tvOS/watchOS
* 7807e72: vtdec: Check for AV1 and VP9 support once
* 9d8e01f: macos: Stop using HAVE_OSX, use built-in macros instead
* 86b0957: frie0r, ladspa: Stop using G_MODULE_SUFFIX
* 149cc0e: vtdec: Fix GstVideoCodecState leak
* 2f5b70e: asiosink: Fill silence when paused
* ad31d52: applemedia: elements can now be individually registered with
  gst-full
* 8074134: h264,h265ccextractor: Fix framerate in initial caps
* 2efd57c: ccconverter: Reset counters on flush-stop
* af04ec5: vkav1dec: fix to set SavedOrderHints properly
* a10695e: v4l2codecs: Add short and long term controls in linux
  headers
* 1721252: h265parser: Store raw short/long term RPS sets
* 8788a6c: codecs: h265dec: Parse extended SPS information
* 54994bb: v4l2codecs: Set long and short term RPS controls
* c22cdd5: build: codecs: Add AV1 decoder to the GIR includes
* 81b283e: build: codecs: Small style improvement
* d795915: build: codecparsers: Install some newly introduce API
  headers
* 0fd74d0: build: codecparsers: Create a GIR file needed for since
  marking
* 3686103: codec: h265decoder: Fix annotation and constify return value
* 1768b12: build: codecs: Add gir dependency to the new GstCodecParsers
  gir
* 282fd81: codecparsers: h265/vc1: Add missing namespace to some
  defines
* 9579389: codecparsers: Fix annotation warnings reported at GIR
  constructions
* 947d59f: doc: codecparsers: Switch to gi-index
* 13b57d5: meson: Explicitly use cpp_std=3Dc++11 for decklink
* 1ff173e: vavp8enc: set color format chroma
* c1ee041: tensordecoders: fix wrong dims_order check
* cbd357d: onnx: set dims_order on GstTensor
* 94c24fe: vtdec: Fix return value in flush()
* e5f8ddf: vtdec: Make sure VT thread won't get stuck after a
  downstream error
* a1c2bb8: vtenc: Make sure draining actually drains all frames, port
  fixes from vtdec, unify naming
* 3313eab: vtdec: Fix wrong DPB size check in the output loop
* ab5cead: vtdec: Calculate DTS offset correctly
* 673922a: applemedia: Sort sources list, fix indentation
* 1205741: applemedia: Fix broken HAVE_VIDEOTOOLBOX_10_9_6 define
* c1772be: applemedia: Remove outdated HAVE_VIDEOTOOLBOX define
* 8bcac75: applemedia: Get rid of AVFoundation-related defines
* 68c0b40: avfvideosrc: Small fixes to the plugin header
* 1758e23: applemedia: Small simplifications to the vulkan checks
* 561bfde: dvbsuboverlay: Mark parsed byte array as const
* 69a2c1c: dvbsuboverlay: Add missing bounds checks to the parser
  everywhere
* cfb98fe: dvbsuboverlay: Avoid integer overflows and unreasonably
  large displays/regions
* fcd957d: libs: jpegparser: boundary checks before copying it
* 8a26fa7: h266parser: Validate tile index bounds in picture partition
  parsing
* 080ac76: h266parser: Fix APS ID bounds check in APS parsing
* 00a086a: h266parser: Fix out of bounds write when parsing pic_timing
  SEI
* 5285725: h265parser: Validate num_decoding_units_minus1 in pic_timing
  SEI
* dcb37e2: Release 1.28.1
* 32113a6: Back to development after 1.28.1
* 6a3b3b6: av1parse: Add the GstAV1ParseStreamFormat enum and helper
  functions
* 5b115b5: av1parse: Split the stream format and alignment logic
* 3b7e321: svtav1: fix "Level of parallelism" property type
  discrepencies
* 74e26cf: dashsink: test: use playbin3 for DASH playback verification
* b99ef73: dashsink: guard splitmuxsink removal in release_pad during
  dispose
* 31a80ef: vulkan: Fix libMoltenVK.dylib not found when installed
* 216d38a: all: GThreadFunc return type fixes
* 9bd09cc: srtpenc: preserve ROC when master key is updated for an
  ongoing session
* 7e5161c: av1dec: Enable VIDEO_META and VIDEO_ALIGNMENT for pool
* b72d4cd: av1parse: Fix the consumed typo in _read_leb128
* 47002f8: av1parse: Fix a latent wrong setting of cll in
  update_src_caps
* 0426e58: decklinkvideosink: fix element leak in decklink callback
* 16b556c: soundtouch: Only allow up to 192kHz and 16 channels
* 4520fe5: gdppay: Fix null pointer dereference on duplicated caps
  event
* cf7ec94: h264parse: Do not update valid DTS and duration
* d850e77: h265parse: Update buffer duration only when it's invalid
* eb67339: vtdec: Store supplemental codec support in a global variable
* fb821c3: onnx: set default pixel-aspect-ratio
* 8e2db48: tflite: set PAR to 1:1 by default
* b5fa0db: vulkan: Clear mutex when GstVulkanImageMemory is freed
* be3a040: h264parser: Fix memory leak in gst_h264_parser_parse_nal()
* 18dd8d6: tsmux: Fix integer overflow in SCTE35 NULL interval
* 95b4388: gst-plugins-bad: update translations
* 07c0ecc: dtls: unregister signal handlers from connection
* e8b7cc0: vp9parse, av1parse: Remove segment clipping to let
  downstream handle frame boundaries
* 259d5e7: vtdec: Do not hold the stream lock when pushing out frames
* 72afb2c: nice: Fix leak of nice thread
* 391d843: vulkanvp9dec: Fix case in device-specific factory name
* 09872a7: wasapi2sink: Ignore device errors from default device
* 5d165e6: mxfdemux: reject corrupted index entry
* a277cb4: mxfdemux: add reversed temporal offset bound check
* 384e65b: waylandsink: fix waylandsink crash when call window flush
* 9552c85: wlwindow: fix viewport source outside buffer when play
  resolution change stream
* 8320b8d: vtdec: Supplemental VideoToolbox decoders now registered via
  vtutil helper
* dea92e8: vkswapper/vksink: Don't advertise unsupported formats
* c8a404b: shm: fix shmsink exit code 1 on clean shutdown
* 5dfb388: wayland: display: Add protection when replacing wl_output
* 0882b60: gst: Fix a couple of const correctness bugs around strchr()
  usage
* 5ed6a6d: wasapi2: Log target device information
* b05db6e: sctp: Set number of outgoing & incoming streams to the same
  value
* 6e69d47: applemedia/vtdec: handle decoder error status for iOS
* cf067cc: applemedia/vtenc: make sure to NULL terminate the level
  string
* 299ffee: vtenc: restart even if VTCompressionSessionCompleteFrames
  fails
* a8d3ce8: vtdec: Also reset session when output_callback gets a
  kVTVideoDecoderMalfunctionErr
* 63efa3c: waylandsink: Properly reset the tag orientation
* 701194a: nvcodec: Add capability caching to speed up plugin
  initialization
* 18851f9: vtdec: Don't leak RGBA64_LE caps during class init
* 327188d: vtdec: Fix incorrect setting of bitfield / flag
* b5af409: vtdec: Invert order of output caps to match our preference
* e265144: macos: Set activation policy in vulkansink (MoltenVK)
* f9cc731: jp2kdecimator: Fix some possible integer overflows in size
  checks
* e900fe1: jp2kdecimator: Avoid integer overflows and divisions by zero
  on invalid tile configurations
* ad02aae: h264parse: Remove pointless allocation failure handling
* 43a89cd: h264parse: Avoid NULL pointer dereferences when freeing
  partially parsed SPS/MVC data
* c2690af: h266parser: Avoid integer overflow when parsing profile /
  tier / level
* 845e9cf: av1parse: Avoid signed 32 bit integer overflow when parsing
  LEB128 values
* f9d57db: av1parse: Be more explicit about available data when parsing
  LEB128 values
* 6e84260: av1parse: Allow G_MAXUINT32 as LEB128 encoded value
* 00d6368: av1parse: Correctly reject LEB128 values where the 8th byte
  has the high bit set
* 871ac21: vmncdec: Set cursormask to NULL to prevent double free
* 43421c2: Release 1.28.2

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...plugins-bad_1.28.0.bb =3D> gstreamer1.0-plugins-bad_1.28.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.0.=
bb =3D> gstreamer1.0-plugins-bad_1.28.2.bb} (99%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
8.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.=
bb
similarity index 99%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28=
.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2=
.bb
index fcab4594ad..58e213bcd5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.28.2.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-pl=
ugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-bui=
l.patch \
            "
-SRC_URI[sha256sum] =3D "32d825041e5775fc9bf9e8c38e3a5c46c1441eee67f8112572=
450a9c23c835f0"
+SRC_URI[sha256sum] =3D "6467e3964828f4d7d08bfe1fbb4d76287a1c8fa76674e59e10=
1a149c020fefd7"
=20
 S =3D "${UNPACKDIR}/gst-plugins-bad-${PV}"
=20

