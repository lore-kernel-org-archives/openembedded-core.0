Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27757C4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 08:56:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.44164.1699001768015773825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 01:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f6KxmLN2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9671ff8776=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A35xx2M010548
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Nov 2023 08:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=WuH0E
	SaqLuBnVfp6ex1/egk6jqDBbb54TJf7ScXFS8c=; b=f6KxmLN2uNeiCSlWaGgC8
	JO483dJvwb1qXeg3OpQ5okrYiBQut2Xy+7v2mNYT++Wy0y0sQfbuqGENEtJQ1muv
	+fr4zqNXLRTEXJIqgbTRDM6AgCEO9tUykH7RiIY/NCsYlJVIBclmEJXWVwsHjdSo
	WHMlK/k2XziiOd8k/NS9eHRAhDm46EMQ/+8HHpmxfgfcVttYYvB2Lq72V/7P9O57
	hMsUS38WcTLyLaaphU+UvQSEOC5iuCGGBHMvPpHYKmUhPRZZzm1JEQoXcmFTyyD/
	/MLjU+zsPOWsPAq67yzM28ige6GF2hmwGDKPEvLMFqHBezoFbbbCW5B5nbu2gkez
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u434yha9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 08:56:06 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 3 Nov 2023 01:56:06 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][dunfell][PATCH 1/1] libwebp: Fix CVE-2023-4863
Date: Fri, 3 Nov 2023 08:55:47 +0000
Message-ID: <20231103085547.2258305-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: eskQb7ZW84OPXgaCAw-QZtSEcpj41kut
X-Proofpoint-ORIG-GUID: eskQb7ZW84OPXgaCAw-QZtSEcpj41kut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_09,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=822 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311030073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 08:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190143

From: Soumya Sambu <soumya.sambu@windriver.com>

Heap buffer overflow in WebP in Google Chrome prior to 116.0.5845.187
allowed a remote attacker to perform an out of bounds memory write via
a crafted HTML page.

Removed CVE-2023-5129.patch as CVE-2023-5129 is duplicate of CVE-2023-4863.

CVE: CVE-2023-4863

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-4863
https://security-tracker.debian.org/tracker/CVE-2023-4863
https://bugzilla.redhat.com/show_bug.cgi?id=2238431#c12

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 ...23-5129.patch => CVE-2023-4863-0001.patch} | 27 ++++------
 .../webp/files/CVE-2023-4863-0002.patch       | 53 +++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.1.0.bb |  3 +-
 3 files changed, 66 insertions(+), 17 deletions(-)
 rename meta/recipes-multimedia/webp/files/{CVE-2023-5129.patch => CVE-2023-4863-0001.patch} (95%)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863-0002.patch

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch b/meta/recipes-multimedia/webp/files/CVE-2023-4863-0001.patch
similarity index 95%
rename from meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
rename to meta/recipes-multimedia/webp/files/CVE-2023-4863-0001.patch
index ffff068c56..419b12f7d9 100644
--- a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863-0001.patch
@@ -1,7 +1,7 @@
-From 12b11893edf6c201710ebeee7c84743a8573fad6 Mon Sep 17 00:00:00 2001
+From 902bc9190331343b2017211debcec8d2ab87e17a Mon Sep 17 00:00:00 2001
 From: Vincent Rabaud <vrabaud@google.com>
 Date: Thu, 7 Sep 2023 21:16:03 +0200
-Subject: [PATCH 1/1] Fix OOB write in BuildHuffmanTable.
+Subject: [PATCH 1/2] Fix OOB write in BuildHuffmanTable.
 
 First, BuildHuffmanTable is called to check if the data is valid.
 If it is and the table is not big enough, more memory is allocated.
@@ -12,16 +12,11 @@ codes) streams are still decodable.
 Bug: chromium:1479274
 Change-Id: I31c36dbf3aa78d35ecf38706b50464fd3d375741
 
-Notice that it references different CVE id:
-https://nvd.nist.gov/vuln/detail/CVE-2023-5129
-which was marked as a rejected duplicate of:
-https://nvd.nist.gov/vuln/detail/CVE-2023-4863
-but it's the same issue. Hence update CVE ID CVE-2023-4863
+CVE: CVE-2023-4863
 
-CVE: CVE-2023-5129 CVE-2023-4863
-Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/2af26267cdfcb63a88e5c74a85927a12d6ca1d76]
-Signed-off-by: Colin McAllister <colinmca242@gmail.com>
-Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/902bc9190331343b2017211debcec8d2ab87e17a]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
 ---
  src/dec/vp8l_dec.c        | 46 ++++++++++---------
  src/dec/vp8li_dec.h       |  2 +-
@@ -30,7 +25,7 @@ Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
  4 files changed, 129 insertions(+), 43 deletions(-)
 
 diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
-index 93615d4e..0d38314d 100644
+index 93615d4..0d38314 100644
 --- a/src/dec/vp8l_dec.c
 +++ b/src/dec/vp8l_dec.c
 @@ -253,11 +253,11 @@ static int ReadHuffmanCodeLengths(
@@ -178,7 +173,7 @@ index 93615d4e..0d38314d 100644
    assert(dec->hdr_.num_htree_groups_ > 0);
  
 diff --git a/src/dec/vp8li_dec.h b/src/dec/vp8li_dec.h
-index 72b2e861..32540a4b 100644
+index 72b2e86..32540a4 100644
 --- a/src/dec/vp8li_dec.h
 +++ b/src/dec/vp8li_dec.h
 @@ -51,7 +51,7 @@ typedef struct {
@@ -191,7 +186,7 @@ index 72b2e861..32540a4b 100644
  
  typedef struct VP8LDecoder VP8LDecoder;
 diff --git a/src/utils/huffman_utils.c b/src/utils/huffman_utils.c
-index 0cba0fbb..9efd6283 100644
+index 0cba0fb..9efd628 100644
 --- a/src/utils/huffman_utils.c
 +++ b/src/utils/huffman_utils.c
 @@ -177,21 +177,24 @@ static int BuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
@@ -322,7 +317,7 @@ index 0cba0fbb..9efd6283 100644
 +  }
 +}
 diff --git a/src/utils/huffman_utils.h b/src/utils/huffman_utils.h
-index 13b7ad1a..98415c53 100644
+index 13b7ad1..98415c5 100644
 --- a/src/utils/huffman_utils.h
 +++ b/src/utils/huffman_utils.h
 @@ -43,6 +43,29 @@ typedef struct {
@@ -367,5 +362,5 @@ index 13b7ad1a..98415c53 100644
  
  #ifdef __cplusplus
 -- 
-2.34.1
+2.40.0
 
diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863-0002.patch b/meta/recipes-multimedia/webp/files/CVE-2023-4863-0002.patch
new file mode 100644
index 0000000000..c1eedb6100
--- /dev/null
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863-0002.patch
@@ -0,0 +1,53 @@
+From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00 2001
+From: Vincent Rabaud <vrabaud@google.com>
+Date: Mon, 11 Sep 2023 16:06:08 +0200
+Subject: [PATCH 2/2] Fix invalid incremental decoding check.
+
+The first condition is only necessary if we have not read enough
+(enough being defined by src_last, not src_end which is the end
+of the image).
+The second condition now fits the comment below: "if not
+incremental, and we are past the end of buffer".
+
+BUG=oss-fuzz:62136
+
+Change-Id: I0700f67c62db8e1c02c2e429a069a71e606a5e4f
+
+CVE: CVE-2023-4863
+
+Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/95ea5226c870449522240ccff26f0b006037c520]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/dec/vp8l_dec.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
+index 0d38314..684a5b6 100644
+--- a/src/dec/vp8l_dec.c
++++ b/src/dec/vp8l_dec.c
+@@ -1237,9 +1237,20 @@ static int DecodeImageData(VP8LDecoder* const dec, uint32_t* const data,
+   }
+
+   br->eos_ = VP8LIsEndOfStream(br);
+-  if (dec->incremental_ && br->eos_ && src < src_end) {
++  // In incremental decoding:
++  // br->eos_ && src < src_last: if 'br' reached the end of the buffer and
++  // 'src_last' has not been reached yet, there is not enough data. 'dec' has to
++  // be reset until there is more data.
++  // !br->eos_ && src < src_last: this cannot happen as either the buffer is
++  // fully read, either enough has been read to reach 'src_last'.
++  // src >= src_last: 'src_last' is reached, all is fine. 'src' can actually go
++  // beyond 'src_last' in case the image is cropped and an LZ77 goes further.
++  // The buffer might have been enough or there is some left. 'br->eos_' does
++  // not matter.
++  assert(!dec->incremental_ || (br->eos_ && src < src_last) || src >= src_last);
++  if (dec->incremental_ && br->eos_ && src < src_last) {
+     RestoreState(dec);
+-  } else if (!br->eos_) {
++  } else if ((dec->incremental_ && src >= src_last) || !br->eos_) {
+     // Process the remaining rows corresponding to last row-block.
+     if (process_func != NULL) {
+       process_func(dec, row > last_row ? last_row : row);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
index 27c5d92c92..88c36cb76c 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
@@ -21,7 +21,8 @@ UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
 SRC_URI += " \
     file://CVE-2023-1999.patch \
-    file://CVE-2023-5129.patch \
+    file://CVE-2023-4863-0001.patch \
+    file://CVE-2023-4863-0002.patch \
 "
 
 EXTRA_OECONF = " \
-- 
2.40.0


