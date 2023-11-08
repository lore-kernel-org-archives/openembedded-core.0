Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42DCC4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:47:06 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.13931.1699451225813328417
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:47:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IYupF2zn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso62346745ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 05:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699451224; x=1700056024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHp7bPwOcKA/A35LxgWcE4rXSe5xs3m9Ffgav+zcfNs=;
        b=IYupF2znkRGE5ZKu7BfRI6lRqoVROx56dB5edd1FQW1zgOeXpCKk4w/lORP9El9hIE
         7GGIbGxQwF0HynDK6qKa5T5jEdTc/Nf4GmnfemEtECPtv7se8soQcYPtXqkSL5bOZLBh
         oiu0Yf9ZHz+6AqX050PSlk2x8TPd6IJKLvrUzhh4uOOPRy8befFrfj01RVXyqcKJgd1O
         fG1mrBGB5ow9uYQIZKGaM1/BMV7ceECv8eE4LMAPKHOM/1JO1YAT8QNj1IZIf57NrmwS
         bM2IpaJLbRQxVUOCstCb7A1YwrLBrbyifL6dHgi7yKeE5xRB10Fw3mSlaLB4Q5moskkI
         bTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451224; x=1700056024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHp7bPwOcKA/A35LxgWcE4rXSe5xs3m9Ffgav+zcfNs=;
        b=Qnrc3biwGX0MTxMePaw3rS0Bb2JpsTQsusI+NS15aI26csKYxl8zUzk9ClMPRu5F4z
         MdEDy3yFG1kz0e+JIKc9rkz/6LbElIp/E1A1/CclPr69oAjQ6FkmLhhSsf1CIXkncZPw
         xVYB8g5Pdco5aARDPVK3z7HMq01NqRH7536WbjE/dstOPedLiyuJPKLMz4BvHP58m7UI
         vV8mYrOjEJoMHhbz+joxrs2QUBGa75lVBl0zrk2f40SuiYKhrYsJ3Pg/lEradKo3gYUn
         mdbwUxo8g2f9rfZef7codXo3pLW6sErRLHiAx0Xszixf3GxgimRqw5pwXwOa9hl4m1G6
         NQUQ==
X-Gm-Message-State: AOJu0Yw9iefTp2mSht+cNgOdivw18zi0GzaZZDLW4vnS0O9kRY0lVxhT
	JjH4ASiaquIRS91ZrUZZVFOpTammBzGP+ycNi4pWjg==
X-Google-Smtp-Source: AGHT+IH8W4W/DHTZUWV+TocsdEgZwl5AACvN3/5EBHySJar7zB5PQTsl3EH+ODND2thGuF5E65pgwg==
X-Received: by 2002:a17:903:1cc:b0:1cc:5ac3:853f with SMTP id e12-20020a17090301cc00b001cc5ac3853fmr2517245plh.23.1699451224346;
        Wed, 08 Nov 2023 05:47:04 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001b7cbc5871csm1781980plb.53.2023.11.08.05.47.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 05:47:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/10] libwebp: Fix CVE-2023-4863
Date: Wed,  8 Nov 2023 03:46:45 -1000
Message-Id: <e2bd9494b59b486000320c6814371f37828d4c2d.1699451066.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699451066.git.steve@sakoman.com>
References: <cover.1699451066.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 13:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190330

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
 ...23-5129.patch => CVE-2023-4863-0001.patch} | 20 +++----
 .../webp/files/CVE-2023-4863-0002.patch       | 53 +++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.3.1.bb |  3 +-
 3 files changed, 66 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/webp/files/{CVE-2023-5129.patch => CVE-2023-4863-0001.patch} (97%)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863-0002.patch

diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch b/meta/recipes-multimedia/webp/files/CVE-2023-4863-0001.patch
similarity index 97%
rename from meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
rename to meta/recipes-multimedia/webp/files/CVE-2023-4863-0001.patch
index b246ed42f9..e623569352 100644
--- a/meta/recipes-multimedia/webp/files/CVE-2023-5129.patch
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863-0001.patch
@@ -1,7 +1,7 @@
-From 6c928321f47ba69022cd4d814433f365dea63478 Mon Sep 17 00:00:00 2001
+From 902bc9190331343b2017211debcec8d2ab87e17a Mon Sep 17 00:00:00 2001
 From: Vincent Rabaud <vrabaud@google.com>
 Date: Thu, 7 Sep 2023 21:16:03 +0200
-Subject: [PATCH 1/1] Fix OOB write in BuildHuffmanTable.
+Subject: [PATCH 1/2] Fix OOB write in BuildHuffmanTable.
 
 First, BuildHuffmanTable is called to check if the data is valid.
 If it is and the table is not big enough, more memory is allocated.
@@ -12,9 +12,11 @@ codes) streams are still decodable.
 Bug: chromium:1479274
 Change-Id: I31c36dbf3aa78d35ecf38706b50464fd3d375741
 
-CVE: CVE-2023-5129
+CVE: CVE-2023-4863
+
 Upstream-Status: Backport [https://github.com/webmproject/libwebp/commit/902bc9190331343b2017211debcec8d2ab87e17a]
-Signed-off-by: Colin McAllister <colinmca242@gmail.com>
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
 ---
  src/dec/vp8l_dec.c        | 46 ++++++++++---------
  src/dec/vp8li_dec.h       |  2 +-
@@ -23,7 +25,7 @@ Signed-off-by: Colin McAllister <colinmca242@gmail.com>
  4 files changed, 129 insertions(+), 43 deletions(-)
 
 diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
-index c0ea0181..7995313f 100644
+index 1348055..186b0b2 100644
 --- a/src/dec/vp8l_dec.c
 +++ b/src/dec/vp8l_dec.c
 @@ -253,11 +253,11 @@ static int ReadHuffmanCodeLengths(
@@ -171,7 +173,7 @@ index c0ea0181..7995313f 100644
    assert(dec->hdr_.num_htree_groups_ > 0);
  
 diff --git a/src/dec/vp8li_dec.h b/src/dec/vp8li_dec.h
-index 72b2e861..32540a4b 100644
+index 72b2e86..32540a4 100644
 --- a/src/dec/vp8li_dec.h
 +++ b/src/dec/vp8li_dec.h
 @@ -51,7 +51,7 @@ typedef struct {
@@ -184,7 +186,7 @@ index 72b2e861..32540a4b 100644
  
  typedef struct VP8LDecoder VP8LDecoder;
 diff --git a/src/utils/huffman_utils.c b/src/utils/huffman_utils.c
-index 90c2fbf7..cf73abd4 100644
+index 0cba0fb..9efd628 100644
 --- a/src/utils/huffman_utils.c
 +++ b/src/utils/huffman_utils.c
 @@ -177,21 +177,24 @@ static int BuildHuffmanTable(HuffmanCode* const root_table, int root_bits,
@@ -315,7 +317,7 @@ index 90c2fbf7..cf73abd4 100644
 +  }
 +}
 diff --git a/src/utils/huffman_utils.h b/src/utils/huffman_utils.h
-index 13b7ad1a..98415c53 100644
+index 13b7ad1..98415c5 100644
 --- a/src/utils/huffman_utils.h
 +++ b/src/utils/huffman_utils.h
 @@ -43,6 +43,29 @@ typedef struct {
@@ -360,5 +362,5 @@ index 13b7ad1a..98415c53 100644
  
  #ifdef __cplusplus
 -- 
-2.34.1
+2.40.0
 
diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863-0002.patch b/meta/recipes-multimedia/webp/files/CVE-2023-4863-0002.patch
new file mode 100644
index 0000000000..231894e882
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
diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.1.bb b/meta/recipes-multimedia/webp/libwebp_1.3.1.bb
index 4d2b655644..c4e3cceb6f 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.3.1.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.3.1.bb
@@ -14,7 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz \
-    file://CVE-2023-5129.patch \
+    file://CVE-2023-4863-0001.patch \
+    file://CVE-2023-4863-0002.patch \
     "
 SRC_URI[sha256sum] = "b3779627c2dfd31e3d8c4485962c2efe17785ef975e2be5c8c0c9e6cd3c4ef66"
 
-- 
2.34.1


