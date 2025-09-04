Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE02CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 18:13:50 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.39740.1756992915468406604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 06:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AUOV5FED;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: m.kurz92@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f6aef1a7dso996537e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 06:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756992913; x=1757597713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FYa++MYpes7lL15xwTz9QEsF8wahQaV1Lp4i74MbBEE=;
        b=AUOV5FED+balMdWDKzl3p2pRa6HH63gG0RcWgjvsZjiHLtDPE7HjIHbQGpC9/At46Q
         kBqslV7TpXtUzsPqP0nTuBqI0Mt0ojR7bfB8/eAYySb5F+M/8GfdMt+q5C9y4uk57tRS
         /sqIPh6YHdB4V32vxLV4jXrWxcTFo8+0DGBfNlWtX1TcXTgyo4GYL8zJBiTdEdO0aecp
         uVCZ5QgXcM5mw6IKtD553OsSiH9Oro24nHllSfyExeJWEkCcei/BPrwdW8VPVgdvzkvd
         ezC7FfwJvkHoTfaBE07Abc58TLKsKYbNk+bwx4yF7WSVOXywQVlTm8XiF4roVqEXuBCy
         DcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992913; x=1757597713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYa++MYpes7lL15xwTz9QEsF8wahQaV1Lp4i74MbBEE=;
        b=kKkH8SUZhMtM1+P+V8g/ua5p/qP+d7GoAqQArX25JgWTYinmC7lnCc3Wr+nZwkAgbo
         Hu4JY3asUl4KQhjDtP8PVBrmAZiMliAJw8lFaJhc3AHaRlEoFfXFcj2w91EIzSnh7cj9
         sfXhqHyRH4R/sDmY+PZexGLpt7HmyFLObQr5vWODLwfAoEvE8wngetIMKxNfseYlFCP+
         yTmWiwBNkSdiesBYhMpvhMkjcjFlCrMK+Bdtu64ouJ9vhN9iXUrsfovGdmHc3ghBIevl
         RagLzdVSLOYh8o2eaoXkwhsWU9xPyA4meuf6WO8YQ8knTXQ9HnGRL415r5ngHdyiER9V
         eXPA==
X-Gm-Message-State: AOJu0YznJMHcmXHXVYUXpfWXOTJUJbp2Opw65AbsINAQy85ROgS88FUD
	0385Do+etmCDnH9MzJRUBMLXL0JM6EOfXjS4IQ8HskFzYrFZWBR+ivzfZG+45heS
X-Gm-Gg: ASbGncudPaSevaqGG0asJAZgJG0fru+uBh5FjHAXq2g6qMJ5fzolm/T3/vp2Xe6UNNq
	ChhhjplwLIt0WnKCJFzeRzW81bTsrnxuUo4DmBeoJX9ZTKeo4N7PmfDsHSATp8XieSleSYg4UNg
	OFHUklA4LTLZcA9ZE0hVAlX8hVagVHR9M9yFLAUKLLiuNX4BFpPUUy//MGv2A00k/f+h+X+iHyN
	6aff2Xjomjeu5gIWEbxIaqHkBs2hdb8+aphsQp2rrADMlgkCbpti5en9ww7jgpRHkphRi+rDmmL
	2TVWVr61UEc5uNuzB+s1zM1HgQlmBWc1opUKRPMN2RfENznZpj6R9MLzMDWDI9K4NEIx7tZrOzB
	GkWk9cEVq5W6Jb1qs6m4Bw68b12Hpf0Lez6OlRJnSpArQazOtdZglTb69iFIYqqt6Mb5DfH6Uy3
	6DliB2LCGGWhvGlhdGBHM=
X-Google-Smtp-Source: AGHT+IEBN7k211264LQpnjG66gmaGRp/FqpzefqaKWgNHRDB720MBehVYGzZ/KFNu4a1NAOepoy2Xg==
X-Received: by 2002:a17:907:9724:b0:b04:7ef0:9dd6 with SMTP id a640c23a62f3a-b047ef0aa2bmr288991666b.55.1756992544704;
        Thu, 04 Sep 2025 06:29:04 -0700 (PDT)
Received: from pop-os.fritz.box (ip-046-005-138-081.um12.pools.vodafone-ip.de. [46.5.138.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04190700a4sm1157092066b.63.2025.09.04.06.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:29:04 -0700 (PDT)
From: m.kurz92@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Markus Kurz <m.kurz92@gmail.com>
Subject: [PATCH] harfbuzz: upgrade 11.4.1 -> 11.4.5
Date: Thu,  4 Sep 2025 15:28:20 +0200
Message-Id: <20250904132820.13512-1-m.kurz92@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 18:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222965

From: Markus Kurz <m.kurz92@gmail.com>

mainly bugfixes introduced.

for release notes see:
https://github.com/harfbuzz/harfbuzz/releases

Signed-off-by: Markus Kurz <m.kurz92@gmail.com>
---
 .../harfbuzz/{harfbuzz_11.4.1.bb => harfbuzz_11.4.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_11.4.1.bb => harfbuzz_11.4.5.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_11.4.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
index a43d88fd89..9e0e42b717 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7aafab93115eb56cdc9a931ab7d19ff60d7f2937b599d140f17236f374e32698"
+SRC_URI[sha256sum] = "0f052eb4ab01d8bae98ba971c954becb32be57d7250f18af343b1d27892e03fa"
 
 DEPENDS += "glib-2.0-native"
 

