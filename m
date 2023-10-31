Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AA3C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 04:38:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.179681.1698727074005916573
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 21:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ArUaXdh/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96683a2f03=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39V4GYrA011070
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 21:37:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=JFOvp
	dguQguohngTHARq7gp36apxQp9g+120rInHznw=; b=ArUaXdh/H0qFaGzG6cJLc
	JB7B3ETdYa4+5BRH1E/I/rbDXPmhZf3wP3FbdWkrjiphxhSgFOGmUeLOZPPUu6Vm
	n9uzy+ajmfbi/wrJF80PsqAuwxFg5OubUOR6shg/FtU7L7VnXukBoRC3SCKUxYPh
	rQgLxW7IxGs1b9g/hXmP7W9Rr2HRJAHKHYPrA5mUe4mBlABjBYOhP1kQIDaGDPDy
	veoKfvbH1wpt+90WKBZyN+9sQEDwC6nEHE2JpfEZjObD6flAUp7Diirapv1oBKx/
	5sb9tMLqD4hIE9T8+63QZwBEVXioOVRDlWMpNkhe4P6hLXccUnGWJeYRkvSquX76
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u11tftna3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 21:37:53 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 21:37:53 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] libwebp: Fix CVE-2023-4863
Date: Tue, 31 Oct 2023 04:37:32 +0000
Message-ID: <20231031043732.2696809-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: w2ePr2Z_YAM4p9UF-dLrI2MrI4Nc-K5K
X-Proofpoint-ORIG-GUID: w2ePr2Z_YAM4p9UF-dLrI2MrI4Nc-K5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=882 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310310034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 04:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189826

From: Soumya Sambu <soumya.sambu@windriver.com>

Heap buffer overflow in WebP in Google Chrome prior to
116.0.5845.187 allowed a remote attacker to perform an
out of bounds memory write via a crafted HTML page.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-4863
https://security-tracker.debian.org/tracker/CVE-2023-4863
https://bugzilla.redhat.com/show_bug.cgi?id=2238431#c12

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../webp/files/CVE-2023-4863.patch            | 109 ++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.2.4.bb |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863.patch

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
new file mode 100644
index 0000000000..4c60cbc9a1
--- /dev/null
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
@@ -0,0 +1,109 @@
+From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00 2001
+From: Vincent Rabaud <vrabaud@google.com>
+Date: Mon, 11 Sep 2023 16:06:08 +0200
+Subject: [PATCH] Fix invalid incremental decoding check.
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
+ ...x-invalid-incremental-decoding-check.patch | 48 +++++++++++++++++++
+ src/dec/vp8l_dec.c                            | 15 +++++-
+ 2 files changed, 61 insertions(+), 2 deletions(-)
+ create mode 100644 0001-Fix-invalid-incremental-decoding-check.patch
+
+diff --git a/0001-Fix-invalid-incremental-decoding-check.patch b/0001-Fix-invalid-incremental-decoding-check.patch
+new file mode 100644
+index 0000000..21f67f4
+--- /dev/null
++++ b/0001-Fix-invalid-incremental-decoding-check.patch
+@@ -0,0 +1,48 @@
++From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00 2001
++From: Vincent Rabaud <vrabaud@google.com>
++Date: Mon, 11 Sep 2023 16:06:08 +0200
++Subject: [PATCH] Fix invalid incremental decoding check.
++
++The first condition is only necessary if we have not read enough
++(enough being defined by src_last, not src_end which is the end
++of the image).
++The second condition now fits the comment below: "if not
++incremental, and we are past the end of buffer".
++
++BUG=oss-fuzz:62136
++
++Change-Id: I0700f67c62db8e1c02c2e429a069a71e606a5e4f
++---
++ src/dec/vp8l_dec.c | 15 +++++++++++++--
++ 1 file changed, 13 insertions(+), 2 deletions(-)
++
++diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
++index 5ab34f56..809b1aa9 100644
++--- a/src/dec/vp8l_dec.c
+++++ b/src/dec/vp8l_dec.c
++@@ -1233,9 +1233,20 @@ static int DecodeImageData(VP8LDecoder* const dec, uint32_t* const data,
++   }
++
++   br->eos_ = VP8LIsEndOfStream(br);
++-  if (dec->incremental_ && br->eos_ && src < src_end) {
+++  // In incremental decoding:
+++  // br->eos_ && src < src_last: if 'br' reached the end of the buffer and
+++  // 'src_last' has not been reached yet, there is not enough data. 'dec' has to
+++  // be reset until there is more data.
+++  // !br->eos_ && src < src_last: this cannot happen as either the buffer is
+++  // fully read, either enough has been read to reach 'src_last'.
+++  // src >= src_last: 'src_last' is reached, all is fine. 'src' can actually go
+++  // beyond 'src_last' in case the image is cropped and an LZ77 goes further.
+++  // The buffer might have been enough or there is some left. 'br->eos_' does
+++  // not matter.
+++  assert(!dec->incremental_ || (br->eos_ && src < src_last) || src >= src_last);
+++  if (dec->incremental_ && br->eos_ && src < src_last) {
++     RestoreState(dec);
++-  } else if (!br->eos_) {
+++  } else if ((dec->incremental_ && src >= src_last) || !br->eos_) {
++     // Process the remaining rows corresponding to last row-block.
++     if (process_func != NULL) {
++       process_func(dec, row > last_row ? last_row : row);
++--
++2.40.0
++
+diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
+index 186b0b2..59a9e64 100644
+--- a/src/dec/vp8l_dec.c
++++ b/src/dec/vp8l_dec.c
+@@ -1241,9 +1241,20 @@ static int DecodeImageData(VP8LDecoder* const dec, uint32_t* const data,
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
diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
index 4defdd5e42..0728ca60f5 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz \
            file://CVE-2023-1999.patch \
            file://CVE-2023-5129.patch \
+           file://CVE-2023-4863.patch \
            "
 SRC_URI[sha256sum] = "7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df"
 
-- 
2.40.0


