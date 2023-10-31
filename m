Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF556C41535
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 22:05:44 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.8520.1698789938781128248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 15:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eWQqzDaf;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b2e73a17a0so3948358b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698789937; x=1699394737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Le8sb61L4yT3h17TkvUqCSqPCJ7kRu93PR5hq5gRzIk=;
        b=eWQqzDafELzOqcbZdIIHbXeAoxXHe7MOO8EQhZepyYpJk6eZvkldDd/n9AI6uvw7Iw
         B/K3sBVDGfVOeggQFyg0o3ZDIpdZAQEP4HJ7RmE3HgLXEg8Y6+2yIH75FNbgzkr3lPN4
         BRjszKxx2g6emOB0X/ETje7uKtXBZcwBe1V5XywjVK8SPksYxuspGIr6bx6L70XxGxjX
         l/cOBTGhSASPkCb7MZS6s2rFF/u8i39tP+a72zVMYhQH8RZdvbU/A7xPAQOY5oUHkwUv
         X3eR6uUj1RzVeqgooqUn1Ke2rIy3VJe1lc6vccloN1W92FQgzf7puDsThMziPI5dpCvL
         DjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698789937; x=1699394737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le8sb61L4yT3h17TkvUqCSqPCJ7kRu93PR5hq5gRzIk=;
        b=GgF5MZ5MAj8rmzJBdR0mr2y5Yc9hd7nz/nNt14hZdhDAB/tP2bue8n9i/R9CDsGe/T
         b3+iDsFIxVwU9pa5D59mJzWD8sdtdOHo68MoMpVQUg7RjeBQBk05O28Ca9Uo5tVtmPVE
         YGdkfZzEI2YlJayWMTnqI/PbhrIl/nTIApgroQBdOPKV7/qeVgA0ZfpIpOt1J3vcfldC
         1EyJEx8A1LMa/8fATl3nYDw+ZhCrUZFkiOCwmUszulE+XfebOHcUQEQh1D9LTtsRTLtk
         GefZTeWirfR92Y0puyOFFj/5mm0ADYAaJjiq3z6W+fdLfInpI3gRt5Truk4j+fS8Q+pQ
         opHg==
X-Gm-Message-State: AOJu0YwJ6v5XuPrFzqqKXT9o6V2PnlA301a5knnCWx31jD9gdyZCcEKo
	a3ZAH1jbuxXYROxmFuLptvsX4PQhxCFWX4bp9NuInw==
X-Google-Smtp-Source: AGHT+IGkecU74J6Fl9VhM3F4vlWvx1Xy2HY4TAT+kd4XlsxAJ/7PBOdE6asAgxsx0KxJ4ebY5ILhpw==
X-Received: by 2002:a05:6808:9b5:b0:3b2:f15e:459f with SMTP id e21-20020a05680809b500b003b2f15e459fmr13801156oig.58.1698789937330;
        Tue, 31 Oct 2023 15:05:37 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c24-20020a62e818000000b0068be3489b0dsm100301pfi.172.2023.10.31.15.05.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 15:05:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/3] libwebp: Fix CVE-2023-4863
Date: Tue, 31 Oct 2023 12:05:19 -1000
Message-Id: <4dcd5e0a0bb43c23850e3a711fc7e2230575d245.1698789786.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698789786.git.steve@sakoman.com>
References: <cover.1698789786.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 22:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189873

From: Soumya Sambu <soumya.sambu@windriver.com>

Heap buffer overflow in WebP in Google Chrome prior to
116.0.5845.187 allowed a remote attacker to perform an
out of bounds memory write via a crafted HTML page.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-4863
https://security-tracker.debian.org/tracker/CVE-2023-4863
https://bugzilla.redhat.com/show_bug.cgi?id=2238431#c12

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


