Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512BBC47072
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:17:56 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.4872.1700018272691718758
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t/wf3Z8N;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cc3216b2a1so49879425ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700018272; x=1700623072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3FJNE8zed0vi1qefQeftmhh9TCmdjxbYyejRWAuxGQ=;
        b=t/wf3Z8NR0Yb+FVuZWODA40Hzqy+S6/0gv6nR7m3GP8N2IqP6TyU1SVb0Ls77Ypx3w
         7x9OVmGOT1gdxg3cHTfJ/XaOZxQI8PwCu2vEKhe/uclzGsLmwuLgwLfylgZiV61mrl1Q
         DOmrXSOzcdDk1qmM9yxqL+EqnV5zVlvCG3/SgPfCn4faFqYFlCFnoYXf063s12ViXgwX
         bV49Q12/7oG1HGWi0KqZTBsVLrwM//8M2vBPAUF2OA1qM2+xRIZ7HDioNqRMbGfvvZGI
         pdIjWD55CWhJeKvS2CVO0CiJm9T+ilU0lUEZXasocfasRMCr16OY4BYbROh5oALZg5OR
         06vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700018272; x=1700623072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3FJNE8zed0vi1qefQeftmhh9TCmdjxbYyejRWAuxGQ=;
        b=hnND8fFdfPt1L+0U1IYLPVgaSF0K7DlEsmRKKUbQdkBmOa/16ao0UKMETPb4PdCMag
         W7IK0QofQQoRCR3kqUlRW8lSeViNhayUzMqPHjZsCsoQTqQU914DVe57nYScEAv9n7SX
         Ya0zQ1Rw72hkdw1ba4tHn4ghdRd8WXnM7tEM1npahKZESmEe++W1hywO+yLjzqeqFYzU
         tpCP8u19VN3z5t0TazoywQSLty9Fdqf5uOIbjDIfwo2FU5IJ9bH89POfoo7Tbu/WbIGy
         iY/YY+LlmDN0xpM5t5Qv7NurOUBvDkalaSdWi4EOxbLhOtIMl6Y79P6AbC8HxtKHSQ8i
         AyYg==
X-Gm-Message-State: AOJu0YxesbysRBzj8Pc1PSia6YWgnZrxCsNGL1FFYQ9IDNqtPkserzyI
	qEBLQfmvaIS/1UW3Il817JHiY+6emnzRtwcRBvPkYQ==
X-Google-Smtp-Source: AGHT+IFYEmf0QGebz4n/37HLYMW3YUC2Bg6xVQ3ayZaXUJTqNl6rsQxxQxYm9/dUbg4pDeaOg84odg==
X-Received: by 2002:a17:902:9a8a:b0:1cc:3209:eacb with SMTP id w10-20020a1709029a8a00b001cc3209eacbmr3770855plp.29.1700018271578;
        Tue, 14 Nov 2023 19:17:51 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903120500b001c6187f2875sm6369300plh.225.2023.11.14.19.17.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:17:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/17] libwebp: Fix CVE-2023-4863
Date: Tue, 14 Nov 2023 17:17:23 -1000
Message-Id: <b69bef1169cb33c153384be81845eaf903dc1570.1700018112.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700018112.git.steve@sakoman.com>
References: <cover.1700018112.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190536

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


