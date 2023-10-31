Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150BDC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 15:54:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2437.1698767676104152702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 08:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PqMh9ym8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96683a2f03=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39VFqPZs003815
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=rgopz
	OwR1vbQIphQoMyFcOxlkfpR6fDklPZpISBdf8s=; b=PqMh9ym88Du4vGuB2U69q
	JabBf0XJLFJ1AO1eObBNviKn4TSfim1t4IVRnS9JHBFXeoJQe2c0b3IVoALAr4ET
	HDCsvB+PvgWX9CS1SObgQ5zvmRs9LXYwv7eGsRVbqoHzSA+T9eBWdtwsyzY879kU
	Uc2+WcDhjk6+i3CybuTbsd2Wm2CD6z3py9iYEW8cy88AyieMXYj0DAiH3s4Xx+aA
	+TgB5UR9vlrj/0lErRFsf+ha0uBjcEqykpRoaY4Sk7UXj713wD5p24V1eosip+74
	1xI4I2/w891q89ZoCnEpga+3zoUu50wevkN/VjUMBNIKzAWKrZ5LALaRVj7mkuWK
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u0s96br6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:54:35 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 08:54:34 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH v3 1/1] libwebp: Fix CVE-2023-4863
Date: Tue, 31 Oct 2023 15:52:34 +0000
Message-ID: <20231031155234.3798430-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: lWcIPqwqSY9bWhZv9B42bPIv-N1YllUJ
X-Proofpoint-GUID: lWcIPqwqSY9bWhZv9B42bPIv-N1YllUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_02,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxlogscore=857 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2310310126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189862

From: Soumya Sambu <soumya.sambu@windriver.com>

Heap buffer overflow in WebP in Google Chrome prior to
116.0.5845.187 allowed a remote attacker to perform an
out of bounds memory write via a crafted HTML page.

CVE: CVE-2023-4863

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-4863
https://security-tracker.debian.org/tracker/CVE-2023-4863
https://bugzilla.redhat.com/show_bug.cgi?id=2238431#c12

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../webp/files/CVE-2023-4863.patch            | 53 +++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.2.4.bb |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863.patch

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
new file mode 100644
index 0000000000..2b1817822c
--- /dev/null
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
@@ -0,0 +1,53 @@
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
+ src/dec/vp8l_dec.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
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


