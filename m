Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A17C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:27 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.2147.1743577877757686253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iD3uCpDF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf680d351so2619125e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577875; x=1744182675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkB/6N+dldK9K5GwiavRoRRat1hfRtoZP3cu62b1rwU=;
        b=iD3uCpDFOLiRh7BubuuDYqwJFikk2anJKthaWXaByfkzOGdMN1x6IUDE/U5Oi8dLkq
         J3KM7dPG0anVdg6saWmHCv4qycft5V/r6IbBa3Y8XCyUH7XcBl+tXwYrT09wF+yPfEWU
         2tuafjCT0dvpxOxAvEOo/0meYxWb1MJyV7s8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577875; x=1744182675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkB/6N+dldK9K5GwiavRoRRat1hfRtoZP3cu62b1rwU=;
        b=cHCUYhx3oJd92IO1/9tm0ZJoJcv2ZnDm1hw+TnS6eM3oQFTZo0HAyG9OOrxZPr3R6c
         idwYWvu7uZmViVs2KbPWoZJLZZSZrH5TB0K1Ki+oC7T7bohMYLsXcNC1z8le4vmarLok
         XwQtgBGTDrDD6zYmEncgmjhlBZxfOJPbXlh14YtuoHap54Of988AYra2E8MifpHk1Cuv
         7oY609LTtyw3RxMW5f8/PfvGH9YCpUwqWipe5HmKJ/ZeTHaaYoql/bkI9FnGIstIv7W0
         eh/bEb3fjiWr/e0dd6FVO11M08XhZw5B7Sa1P+gMRo6AVcyWQvRF/Ijpu+vjTfV+AtO5
         luUw==
X-Gm-Message-State: AOJu0Yy88fqeLd79GhzCb5Cew374UoI4BHLjZ3KbWbLGQeSAiRAmWBv3
	mzKpMuVHB5rXZcxKfEBGHHqAAxugjdwRvENlOKiCEr3jnHWDWscjeERLcsINUE5KrFA04WVPYt/
	/
X-Gm-Gg: ASbGncvHYMD2s0hdtDQQVGFOo6G2MG7w0OYBi9UVC508H9ACiQDnjK0K1nkrxedb4sQ
	wBYVxfpkndXVotCNRNv4Pqj6XrqyVAFkg9ViAeQoL/o+f+cmOMLxzUFYkovlptF3WohrqQcBiF6
	DqvTRPoEhValDR92Uum0Cp3MzXDhW4sA5vlqUTenSsT8x88gP33vlL9YpU9c59hgAZdLsRk+cvy
	p6/vGycSxfOx12EYWdn+OSlR1vsVX07tTSWs+LBzMIqHdafGjUeLUEIFfi4hS6eCn2NkrITWBi4
	IIap9EkLmVhgvl9E7yJOL5rFtCAWRACjMVDs5Ew69VAZZ58CFesug062vkKnKHrTdSYqz8VSEA=
	=
X-Google-Smtp-Source: AGHT+IE80Nfa95nE586tWyDR3g0/Ul7EVTXJhVl1+V0Z+jypqRokOrWPfxHi+u6A/QVR0DDQrm5knw==
X-Received: by 2002:a05:600c:a015:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-43eb71e27bdmr8510455e9.16.1743577875334;
        Wed, 02 Apr 2025 00:11:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/48] llvm: upgrade 20.1.0 -> 20.1.1
Date: Wed,  2 Apr 2025 08:09:52 +0100
Message-ID: <20250402071017.2157620-23-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214196

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 2 +-
 .../llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch    | 2 +-
 meta/recipes-devtools/llvm/{llvm_20.1.0.bb => llvm_20.1.1.bb}   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_20.1.0.bb => llvm_20.1.1.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index ae2c3baa8ce..f71c5d4bd47 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 9824c2ab5e7d37a5a18a409a512511f5f5cd408d Mon Sep 17 00:00:00 2001
+From 001d56983078842c5aa2a1786b84dc429bd46abd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index 29266013ecb..f1ab0054640 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From 00e5ac68dad872b8490297fa6f0b67e6a3e48661 Mon Sep 17 00:00:00 2001
+From 3eb1eefed6fc654d19ab97bbc748454c22a29009 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_20.1.0.bb
rename to meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 7ffc6ec1cb8..5c6c5a2ffd1 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f62aad9a"
+SRC_URI[sha256sum] = "4d5ebbd40ce1e984a650818a4bb5ae86fc70644dec2e6d54e78b4176db3332e0"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 

