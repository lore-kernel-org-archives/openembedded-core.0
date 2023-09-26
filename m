Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D91E7F124
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 20:07:48 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web10.1429.1695758866169441325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 13:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=ak2Tvikx;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=Dmv25zx2;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: colin.mcallister@garmin.com)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38QJj3rG000850
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 15:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=pps1;
 bh=9B9L9j97lni7DAWmLhnS1RKaSBfKAGtln5yCnNcpmBI=;
 b=ak2Tvikx9iP3g0oBkgilKpz3fGSNTEihemK1mVLGFFy56/HQrOPdtP7v5xD3KsAb/2+b
 27nydkDTDxG3kBnCG5Aw8UjljSAs0AUKM83SpQNfJepfGejAq+mfNNuFlB7AXAupZkjy
 /vyDt5vyA2cqnOoDG5RTOAomi3w26EHoxa597BKF4tynZljgi4lEYOUTmmwjX3g0shqw
 Ib1HLERrtlpYbKO2KJNz8diU3LuOM13gCKHZPK2tPdLVTQgcUeFIlw8IXHCV4mdPd8wA
 lKSnYC6QIcLOdzXM7s7akaOVW2MspB/u13IlieleIZ6Ja+h+Sm+BvaHexWoickfp4MV+ QQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3tbqth1km9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 15:07:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvN4wLMqRNJ0oHkBirxykjJRSn6NuM1DBEbI5F1PNRpXE68r984NT8VaDg82y2HIURobpeodk0ajWgwdT0A36d4HZo9JLC0Pmb/8iLHzgM/wMbGMeXWfbjlXUF8ADqnI0lT9VHlopkNT/5dprm//GqNb9pDcAw1dSwGv5di4JPn2mMqivgRnj++OV1fPUGmlUfurLUuq8zB6IDCv5+e7nWqhXReY2IJwWWznHHG73WSaglqdD61Q1z4DF78tlM8rUyqz0mVavdNs8YAMxXBLZQEjiUE5QrX9pJX+jMlraH5CNc4TChck+Bb4WNFqOOTftSL7mts8xPr5R0bYfCErDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9B9L9j97lni7DAWmLhnS1RKaSBfKAGtln5yCnNcpmBI=;
 b=T+4MgkNNSNJXofeY9u3lr0+d3HARJD+zYHH5mlLXZoluP4A2Y1Uop3oV7kAIotAGvboK9MxfBmIQvyQ/bvckcBqaWsuKa8vU2uEoOiavJUTnzjM0gy0nt8xQbHNt6t7EclKVRbqkv8NgzQqHp/Nix3fLnFZuKSktq6qoQL6AGDk1abFh/stdzr6CnOAhJH6VEHEsh9vlR41k723QY3JgJRG0lWh0AhJFsjfAEb8yRUQ+Zw9AyWT0Vn0pmMpDOshAN7DnKm5p++eex6N6IReVI+XGGmEW+z7O+x8/JkNpIkBLqW1L6NifjqQY+DHdxFWHK9xt4l/QFhlNVuS6Qmhu+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B9L9j97lni7DAWmLhnS1RKaSBfKAGtln5yCnNcpmBI=;
 b=Dmv25zx2lChG3INsSxNvQR1hZPRZCmofmCy7qHiNPVCZ4Tb4xOxCv/yPIJAXyisB+iC88D0GdbsjtaYUdMEebcZh96hMnKZQqGTTj/JsNXyCWTeuacdeWheeosLIL7EPNQ9wz4yq0ENhyK8em485wik1JVyJCA6Gy56yfbTc/pU6HMdgaNgVTnDUWThMOmudVcTk9fRbdGc2FffPS1DIx49XBDaKTWQaGws75wSm3C7n0VLOfZv+8q3tdCgPCGN8c4wzeF2vEK5mrMKjj2Aj0difFKh97oKygzxVxNbmj4eCVHmnggeYEJ7UTzP1KiYhezwIn6xYsziFuq4My7I76g==
Received: from MW4PR04CA0261.namprd04.prod.outlook.com (2603:10b6:303:88::26)
 by MN2PR04MB6912.namprd04.prod.outlook.com (2603:10b6:208:19e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.18; Tue, 26 Sep
 2023 20:07:42 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:303:88:cafe::87) by MW4PR04CA0261.outlook.office365.com
 (2603:10b6:303:88::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 20:07:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=garmin.com; pr=C
Received: from garmin.com (204.77.163.244) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Tue, 26 Sep 2023 20:07:41 +0000
Received: from OLAWPA-EXMB12.ad.garmin.com (10.5.144.16) by
 olawpa-edge2.garmin.com (10.60.4.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 15:07:29 -0500
Received: from kc3wpa-exmb6.ad.garmin.com (10.65.32.86) by
 OLAWPA-EXMB12.ad.garmin.com (10.5.144.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Tue, 26 Sep 2023 15:07:29 -0500
Received: from cv1wpa-exmb6.ad.garmin.com (10.5.144.76) by
 kc3wpa-exmb6.ad.garmin.com (10.65.32.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Tue, 26 Sep 2023 15:07:29 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by mail.garmin.com
 (10.5.144.76) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Tue, 26 Sep 2023 15:07:29 -0500
From: Colin McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin McAllister <colin.mcallister@garmin.com>
Subject: [dunfell][PATCH v2] libwebp: Fix CVE-2023-5129
Date: Tue, 26 Sep 2023 15:07:21 -0500
Message-ID: <20230926200721.1815715-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <17888B7B26DDBEA1.25332@lists.openembedded.org>
References: <17888B7B26DDBEA1.25332@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|MN2PR04MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 0840d04d-504b-4044-5d61-08dbbecc3d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wMjI2nJ48DZDaTJsmZht98AemnATieSmdR9jijMlwdCWsrZjC5jxgdecKujHK/7C8koo94VwT6YxJ/VU+pEjiJxLR1BGyK08WSroEYqcPiSwdbq+si9ztKjmUTsRztmeq50jum/jmFH58NTIVmcsEBNGscYYUfW97xinXgZ7lUBQxtwWXHyE8rpJVQargIL6kx7+iBTiQZmbv0d/41M9BpH77saz2UmEBE2bKZJQppzY5tX+XKWX2GzZIQP8I0n/epDKkuHdPw05/3H3gpPh4z7gxTzisbST8j8rN/ervnvxIeouXkli3TjsVu0iUoQNPfCkpbReReXALMtKmcxLwhJzWNb7SfjI7EUrgLJfsIyOOjY4K26yyk4pxYNxo7Fj+7qZe+Q0lrn5l4gpEaSfjSKWzgTRkgx/lhkAicPa31uTjOvNNnRy80fsuvWMLsQt3GMiNUw3GfveMC0HjRsZ0A2E751AZ1jh6+yaul+KsVDYFbIz2MT2Yd+x7JaZ4QvjpkUq2UWlQHqVfAp63WOhobaJhr5oMbn/+MnQHggVTE+Bg5CBRhdWW5xCz75KVETJbyh4ATLak5W7IJnwzf0aFF+G35MdMPA9XjpBrzWU0mhCrl1xw/d4ajhoeGk/LunSW/7bYhBYx1MmZwIRcft3c+5Eg4YeNbQKdvUiMjO6olf0wyj+hp/c4RSz0ItJ434+b7gzNmMLn4Tg8RP3djgkR81Ii3qcy4CncBxH1m25SpFpFch0/CoW0cF4CcmioSGRw2iIU81HW3a0NvmiS65DPA==
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(39860400002)(230922051799003)(186009)(451199024)(82310400011)(1800799009)(46966006)(40470700004)(36840700001)(86362001)(19273905006)(36756003)(40480700001)(5660300002)(26005)(6666004)(70206006)(70586007)(2616005)(7696005)(1076003)(336012)(316002)(107886003)(478600001)(426003)(41300700001)(6916009)(8676002)(8936002)(4326008)(47076005)(40460700003)(2906002)(82740400003)(356005)(66899024)(7636003)(36860700001)(83380400001)(30864003)(562404015)(563064011);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 20:07:41.6341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0840d04d-504b-4044-5d61-08dbbecc3d84
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6912
X-Proofpoint-ORIG-GUID: d0mvW12Cen8LeJMw1cVCc5XvjIt07dyH
X-Proofpoint-GUID: d0mvW12Cen8LeJMw1cVCc5XvjIt07dyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_14,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309260172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 20:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188261

Add patch from libwebp 1.1.0 branch to fix CVE-2023-5129.

Change-Id: Idaabd9e118fb51a80159a25312000337427e23bf
---
 .../webp/files/CVE-2023-5129.patch            | 362 ++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.1.0.bb |   1 +
 2 files changed, 363 insertions(+)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-5129.patch

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch b/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
new file mode 100644
index 0000000000..f27d773c64
--- /dev/null
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
@@ -0,0 +1,362 @@
+From 8bacd63a6de1cc091f85a1692390401e7bbf55ac Mon Sep 17 00:00:00 2001
+From: Vincent Rabaud <vrabaud@google.com>
+Date: Thu, 7 Sep 2023 21:16:03 +0200
+Subject: [PATCH 1/1] Fix OOB write in BuildHuffmanTable.
+
+First, BuildHuffmanTable is called to check if the data is valid.
+If it is and the table is not big enough, more memory is allocated.
+
+This will make sure that valid (but unoptimized because of unbalanced
+codes) streams are still decodable.
+
+Bug: chromium:1479274
+Change-Id: I31c36dbf3aa78d35ecf38706b50464fd3d375741
+(cherry picked from commit 902bc9190331343b2017211debcec8d2ab87e17a)
+(cherry picked from commit 2af26267cdfcb63a88e5c74a85927a12d6ca1d76)
+---
+ src/dec/vp8l_dec.c        | 46 ++++++++++---------
+ src/dec/vp8li_dec.h       |  2 +-
+ src/utils/huffman_utils.c | 97 +++++++++++++++++++++++++++++++--------
+ src/utils/huffman_utils.h | 27 +++++++++--
+ 4 files changed, 129 insertions(+), 43 deletions(-)
+
+diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
+index 13480551..186b0b2f 100644
+--- a/src/dec/vp8l_dec.c
++++ b/src/dec/vp8l_dec.c
+@@ -253,11 +253,11 @@ static int ReadHuffmanCodeLengths(
+   int symbol;
+   int max_symbol;
+   int prev_code_len = DEFAULT_CODE_LENGTH;
+-  HuffmanCode table[1 << LENGTHS_TABLE_BITS];
++  HuffmanTables tables;
+ 
+-  if (!VP8LBuildHuffmanTable(table, LENGTHS_TABLE_BITS,
+-                             code_length_code_lengths,
+-                             NUM_CODE_LENGTH_CODES)) {
++  if (!VP8LHuffmanTablesAllocate(1 << LENGTHS_TABLE_BITS, &tables) ||
++      !VP8LBuildHuffmanTable(&tables, LENGTHS_TABLE_BITS,
++                             code_length_code_lengths, NUM_CODE_LENGTH_CODES)) {
+     goto End;
+   }
+ 
+@@ -277,7 +277,7 @@ static int ReadHuffmanCodeLengths(
+     int code_len;
+     if (max_symbol-- == 0) break;
+     VP8LFillBitWindow(br);
+-    p = &table[VP8LPrefetchBits(br) & LENGTHS_TABLE_MASK];
++    p = &tables.curr_segment->start[VP8LPrefetchBits(br) & LENGTHS_TABLE_MASK];
+     VP8LSetBitPos(br, br->bit_pos_ + p->bits);
+     code_len = p->value;
+     if (code_len < kCodeLengthLiterals) {
+@@ -300,6 +300,7 @@ static int ReadHuffmanCodeLengths(
+   ok = 1;
+ 
+  End:
++  VP8LHuffmanTablesDeallocate(&tables);
+   if (!ok) dec->status_ = VP8_STATUS_BITSTREAM_ERROR;
+   return ok;
+ }
+@@ -307,7 +308,8 @@ static int ReadHuffmanCodeLengths(
+ // 'code_lengths' is pre-allocated temporary buffer, used for creating Huffman
+ // tree.
+ static int ReadHuffmanCode(int alphabet_size, VP8LDecoder* const dec,
+-                           int* const code_lengths, HuffmanCode* const table) {
++                           int* const code_lengths,
++                           HuffmanTables* const table) {
+   int ok = 0;
+   int size = 0;
+   VP8LBitReader* const br = &dec->br_;
+@@ -362,8 +364,7 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec, int xsize, int ysize,
+   VP8LMetadata* const hdr = &dec->hdr_;
+   uint32_t* huffman_image = NULL;
+   HTreeGroup* htree_groups = NULL;
+-  HuffmanCode* huffman_tables = NULL;
+-  HuffmanCode* huffman_table = NULL;
++  HuffmanTables* huffman_tables = &hdr->huffman_tables_;
+   int num_htree_groups = 1;
+   int num_htree_groups_max = 1;
+   int max_alphabet_size = 0;
+@@ -372,6 +373,10 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec, int xsize, int ysize,
+   int* mapping = NULL;
+   int ok = 0;
+ 
++  // Check the table has been 0 initialized (through InitMetadata).
++  assert(huffman_tables->root.start == NULL);
++  assert(huffman_tables->curr_segment == NULL);
++
+   if (allow_recursion && VP8LReadBits(br, 1)) {
+     // use meta Huffman codes.
+     const int huffman_precision = VP8LReadBits(br, 3) + 2;
+@@ -434,16 +439,15 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec, int xsize, int ysize,
+ 
+   code_lengths = (int*)WebPSafeCalloc((uint64_t)max_alphabet_size,
+                                       sizeof(*code_lengths));
+-  huffman_tables = (HuffmanCode*)WebPSafeMalloc(num_htree_groups * table_size,
+-                                                sizeof(*huffman_tables));
+   htree_groups = VP8LHtreeGroupsNew(num_htree_groups);
+ 
+-  if (htree_groups == NULL || code_lengths == NULL || huffman_tables == NULL) {
++  if (htree_groups == NULL || code_lengths == NULL ||
++      !VP8LHuffmanTablesAllocate(num_htree_groups * table_size,
++                                 huffman_tables)) {
+     dec->status_ = VP8_STATUS_OUT_OF_MEMORY;
+     goto Error;
+   }
+ 
+-  huffman_table = huffman_tables;
+   for (i = 0; i < num_htree_groups_max; ++i) {
+     // If the index "i" is unused in the Huffman image, just make sure the
+     // coefficients are valid but do not store them.
+@@ -468,19 +472,20 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec, int xsize, int ysize,
+       int max_bits = 0;
+       for (j = 0; j < HUFFMAN_CODES_PER_META_CODE; ++j) {
+         int alphabet_size = kAlphabetSize[j];
+-        htrees[j] = huffman_table;
+         if (j == 0 && color_cache_bits > 0) {
+           alphabet_size += (1 << color_cache_bits);
+         }
+-        size = ReadHuffmanCode(alphabet_size, dec, code_lengths, huffman_table);
++        size =
++            ReadHuffmanCode(alphabet_size, dec, code_lengths, huffman_tables);
++        htrees[j] = huffman_tables->curr_segment->curr_table;
+         if (size == 0) {
+           goto Error;
+         }
+         if (is_trivial_literal && kLiteralMap[j] == 1) {
+-          is_trivial_literal = (huffman_table->bits == 0);
++          is_trivial_literal = (htrees[j]->bits == 0);
+         }
+-        total_size += huffman_table->bits;
+-        huffman_table += size;
++        total_size += htrees[j]->bits;
++        huffman_tables->curr_segment->curr_table += size;
+         if (j <= ALPHA) {
+           int local_max_bits = code_lengths[0];
+           int k;
+@@ -515,14 +520,13 @@ static int ReadHuffmanCodes(VP8LDecoder* const dec, int xsize, int ysize,
+   hdr->huffman_image_ = huffman_image;
+   hdr->num_htree_groups_ = num_htree_groups;
+   hdr->htree_groups_ = htree_groups;
+-  hdr->huffman_tables_ = huffman_tables;
+ 
+  Error:
+   WebPSafeFree(code_lengths);
+   WebPSafeFree(mapping);
+   if (!ok) {
+     WebPSafeFree(huffman_image);
+-    WebPSafeFree(huffman_tables);
++    VP8LHuffmanTablesDeallocate(huffman_tables);
+     VP8LHtreeGroupsFree(htree_groups);
+   }
+   return ok;
+@@ -1358,7 +1362,7 @@ static void ClearMetadata(VP8LMetadata* const hdr) {
+   assert(hdr != NULL);
+ 
+   WebPSafeFree(hdr->huffman_image_);
+-  WebPSafeFree(hdr->huffman_tables_);
++  VP8LHuffmanTablesDeallocate(&hdr->huffman_tables_);
+   VP8LHtreeGroupsFree(hdr->htree_groups_);
+   VP8LColorCacheClear(&hdr->color_cache_);
+   VP8LColorCacheClear(&hdr->saved_color_cache_);
+@@ -1673,7 +1677,7 @@ int VP8LDecodeImage(VP8LDecoder* const dec) {
+ 
+   if (dec == NULL) return 0;
+ 
+-  assert(dec->hdr_.huffman_tables_ != NULL);
++  assert(dec->hdr_.huffman_tables_.root.start != NULL);
+   assert(dec->hdr_.htree_groups_ != NULL);
+   assert(dec->hdr_.num_htree_groups_ > 0);
+ 
+diff --git a/src/dec/vp8li_dec.h b/src/dec/vp8li_dec.h
+index 72b2e861..32540a4b 100644
+--- a/src/dec/vp8li_dec.h
++++ b/src/dec/vp8li_dec.h
+@@ -51,7 +51,7 @@ typedef struct {
+   uint32_t*       huffman_image_;
+   int             num_htree_groups_;
+   HTreeGroup*     htree_groups_;
+-  HuffmanCode*    huffman_tables_;
++  HuffmanTables   huffman_tables_;
+ } VP8LMetadata;
+ 
+ typedef struct VP8LDecoder VP8LDecoder;
+diff --git a/src/utils/huffman_utils.c b/src/utils/huffman_utils.c
+index 0cba0fbb..9efd6283 100644
+--- a/src/utils/huffman_utils.c
++++ b/src/utils/huffman_utils.c
+@@ -177,21 +177,24 @@ static int BuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
+       if (num_open < 0) {
+         return 0;
+       }
+-      if (root_table == NULL) continue;
+       for (; count[len] > 0; --count[len]) {
+         HuffmanCode code;
+         if ((key & mask) != low) {
+-          table += table_size;
++          if (root_table != NULL) table += table_size;
+           table_bits = NextTableBitSize(count, len, root_bits);
+           table_size = 1 << table_bits;
+           total_size += table_size;
+           low = key & mask;
+-          root_table[low].bits = (uint8_t)(table_bits + root_bits);
+-          root_table[low].value = (uint16_t)((table - root_table) - low);
++          if (root_table != NULL) {
++            root_table[low].bits = (uint8_t)(table_bits + root_bits);
++            root_table[low].value = (uint16_t)((table - root_table) - low);
++          }
++        }
++        if (root_table != NULL) {
++          code.bits = (uint8_t)(len - root_bits);
++          code.value = (uint16_t)sorted[symbol++];
++          ReplicateValue(&table[key >> root_bits], step, table_size, code);
+         }
+-        code.bits = (uint8_t)(len - root_bits);
+-        code.value = (uint16_t)sorted[symbol++];
+-        ReplicateValue(&table[key >> root_bits], step, table_size, code);
+         key = GetNextKey(key, len);
+       }
+     }
+@@ -211,25 +214,83 @@ static int BuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
+   ((1 << MAX_CACHE_BITS) + NUM_LITERAL_CODES + NUM_LENGTH_CODES)
+ // Cut-off value for switching between heap and stack allocation.
+ #define SORTED_SIZE_CUTOFF 512
+-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_bits,
+                           const int code_lengths[], int code_lengths_size) {
+-  int total_size;
++  const int total_size =
++      BuildHuffmanTable(NULL, root_bits, code_lengths, code_lengths_size, NULL);
+   assert(code_lengths_size <= MAX_CODE_LENGTHS_SIZE);
+-  if (root_table == NULL) {
+-    total_size = BuildHuffmanTable(NULL, root_bits,
+-                                   code_lengths, code_lengths_size, NULL);
+-  } else if (code_lengths_size <= SORTED_SIZE_CUTOFF) {
++  if (total_size == 0 || root_table == NULL) return total_size;
++
++  if (root_table->curr_segment->curr_table + total_size >=
++      root_table->curr_segment->start + root_table->curr_segment->size) {
++    // If 'root_table' does not have enough memory, allocate a new segment.
++    // The available part of root_table->curr_segment is left unused because we
++    // need a contiguous buffer.
++    const int segment_size = root_table->curr_segment->size;
++    struct HuffmanTablesSegment* next =
++        (HuffmanTablesSegment*)WebPSafeMalloc(1, sizeof(*next));
++    if (next == NULL) return 0;
++    // Fill the new segment.
++    // We need at least 'total_size' but if that value is small, it is better to
++    // allocate a big chunk to prevent more allocations later. 'segment_size' is
++    // therefore chosen (any other arbitrary value could be chosen).
++    next->size = total_size > segment_size ? total_size : segment_size;
++    next->start =
++        (HuffmanCode*)WebPSafeMalloc(next->size, sizeof(*next->start));
++    if (next->start == NULL) {
++      WebPSafeFree(next);
++      return 0;
++    }
++    next->curr_table = next->start;
++    next->next = NULL;
++    // Point to the new segment.
++    root_table->curr_segment->next = next;
++    root_table->curr_segment = next;
++  }
++  if (code_lengths_size <= SORTED_SIZE_CUTOFF) {
+     // use local stack-allocated array.
+     uint16_t sorted[SORTED_SIZE_CUTOFF];
+-    total_size = BuildHuffmanTable(root_table, root_bits,
+-                                   code_lengths, code_lengths_size, sorted);
+-  } else {   // rare case. Use heap allocation.
++    BuildHuffmanTable(root_table->curr_segment->curr_table, root_bits,
++                      code_lengths, code_lengths_size, sorted);
++  } else {  // rare case. Use heap allocation.
+     uint16_t* const sorted =
+         (uint16_t*)WebPSafeMalloc(code_lengths_size, sizeof(*sorted));
+     if (sorted == NULL) return 0;
+-    total_size = BuildHuffmanTable(root_table, root_bits,
+-                                   code_lengths, code_lengths_size, sorted);
++    BuildHuffmanTable(root_table->curr_segment->curr_table, root_bits,
++                      code_lengths, code_lengths_size, sorted);
+     WebPSafeFree(sorted);
+   }
+   return total_size;
+ }
++
++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_tables) {
++  // Have 'segment' point to the first segment for now, 'root'.
++  HuffmanTablesSegment* const root = &huffman_tables->root;
++  huffman_tables->curr_segment = root;
++  // Allocate root.
++  root->start = (HuffmanCode*)WebPSafeMalloc(size, sizeof(*root->start));
++  if (root->start == NULL) return 0;
++  root->curr_table = root->start;
++  root->next = NULL;
++  root->size = size;
++  return 1;
++}
++
++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables) {
++  HuffmanTablesSegment *current, *next;
++  if (huffman_tables == NULL) return;
++  // Free the root node.
++  current = &huffman_tables->root;
++  next = current->next;
++  WebPSafeFree(current->start);
++  current->start = NULL;
++  current->next = NULL;
++  current = next;
++  // Free the following nodes.
++  while (current != NULL) {
++    next = current->next;
++    WebPSafeFree(current->start);
++    WebPSafeFree(current);
++    current = next;
++  }
++}
+diff --git a/src/utils/huffman_utils.h b/src/utils/huffman_utils.h
+index 13b7ad1a..98415c53 100644
+--- a/src/utils/huffman_utils.h
++++ b/src/utils/huffman_utils.h
+@@ -43,6 +43,29 @@ typedef struct {
+                     // or non-literal symbol otherwise
+ } HuffmanCode32;
+ 
++// Contiguous memory segment of HuffmanCodes.
++typedef struct HuffmanTablesSegment {
++  HuffmanCode* start;
++  // Pointer to where we are writing into the segment. Starts at 'start' and
++  // cannot go beyond 'start' + 'size'.
++  HuffmanCode* curr_table;
++  // Pointer to the next segment in the chain.
++  struct HuffmanTablesSegment* next;
++  int size;
++} HuffmanTablesSegment;
++
++// Chained memory segments of HuffmanCodes.
++typedef struct HuffmanTables {
++  HuffmanTablesSegment root;
++  // Currently processed segment. At first, this is 'root'.
++  HuffmanTablesSegment* curr_segment;
++} HuffmanTables;
++
++// Allocates a HuffmanTables with 'size' contiguous HuffmanCodes. Returns 0 on
++// memory allocation error, 1 otherwise.
++int VP8LHuffmanTablesAllocate(int size, HuffmanTables* huffman_tables);
++void VP8LHuffmanTablesDeallocate(HuffmanTables* const huffman_tables);
++
+ #define HUFFMAN_PACKED_BITS 6
+ #define HUFFMAN_PACKED_TABLE_SIZE (1u << HUFFMAN_PACKED_BITS)
+ 
+@@ -78,9 +101,7 @@ void VP8LHtreeGroupsFree(HTreeGroup* const htree_groups);
+ // the huffman table.
+ // Returns built table size or 0 in case of error (invalid tree or
+ // memory error).
+-// If root_table is NULL, it returns 0 if a lookup cannot be built, something
+-// > 0 otherwise (but not the table size).
+-int VP8LBuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
++int VP8LBuildHuffmanTable(HuffmanTables* const root_table, int root_bits,
+                           const int code_lengths[], int code_lengths_size);
+ 
+ #ifdef __cplusplus
+-- 
+2.42.0
+
diff --git a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
index f449ae750b..27c5d92c92 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
@@ -21,6 +21,7 @@ UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
 SRC_URI += " \
     file://CVE-2023-1999.patch \
+    file://CVE-2023-5129.patch \
 "
 
 EXTRA_OECONF = " \
-- 
2.42.0


