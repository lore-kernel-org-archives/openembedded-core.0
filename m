Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C29C87FC9
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 16:58:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.25268.1724950734074185903
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 09:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hXCvMRSv;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20227ba378eso7867445ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 09:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724950733; x=1725555533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nmG6jlSJirkSU8Cjt14aWouPtMZvFivrr2TbAwymZrY=;
        b=hXCvMRSvTx9TQ4IV3PeLB68UMuIRRaicxD+sAQGFWX3w45sK1ymaZMKe+rnH7olasD
         HlQVjk7gZyHS7ITjHWKRu5xrcU5LlTEGdI868CVVBJvCmqnN85ZbWEFBKy4xncjzgzzV
         DdxuDlSrnO3dwEa1lsmv5V4BtOkzbzBcxJW+ihok+ibP7ueuwYFdjxF5GjqDDtdRyL+T
         hpIFDni+b3LeZl7fnb14UEtuW2dIFfuNcFIc446RjvtQQnhw1J6fB1jBjqegW83fAgQo
         5KaMpxD5MQaZX+a1S7tt38JcnAJylHaBVVq8CEL4GEZqph9B5gqn2lDiOTz3B7U39sEe
         9vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724950733; x=1725555533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmG6jlSJirkSU8Cjt14aWouPtMZvFivrr2TbAwymZrY=;
        b=kVR+Z/ucmXNG6UHrYjSUdl9cdGz9RcVHCzTTGNctLZAK72Ysr9XqRoJocnhx7YtY/g
         bG7MuIm7m0p4DBKSc4ErGJ/WZS45IjTx6p8Tcm4KpxxWrZOhL3aHKK0wlh5uuCSKeCh9
         Wy6RKxDfI8fLU30jIW8W7ggxlCYGfOdb/iXmygVhlvlJe/IE9DbIfJYUH+BhMDOsK7v7
         zt7xXveH1+5lhgpXbo47SAwMCXuybF0S58FsShNeXVN4v86h5dMeFzmoktE+DrlV+Zwq
         ltZoTzf9gbrp9Vci8Q2IQoxg1QMDlIU9yR0IbYVUbHgsUMJIJsX+xJGbkWiGwBfARfbB
         jnzA==
X-Gm-Message-State: AOJu0Yy+wyBq+LQ6o/QXosmISBjCmj/bhtjOQvlBcdggN1INwhdQAZWL
	Ll4Hh5gVwEU1zh4lvTQOfWRIb4CMEXYYHG6Kp7MOsLwLNNix2W1Uq+/ZWxR8
X-Google-Smtp-Source: AGHT+IGK/UTcabZoFgw6fuG0bajKd9NgBGSnZbTpd+KvVgdOnhS0YAd69h7HjCaby/+DIIA3rmlAmg==
X-Received: by 2002:a17:902:dac2:b0:1ff:4d66:d7bb with SMTP id d9443c01a7336-2050c3730bfmr41804085ad.36.1724950733198;
        Thu, 29 Aug 2024 09:58:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515537704sm13627115ad.125.2024.08.29.09.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 09:58:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] fmt: Get rid of std::copy
Date: Thu, 29 Aug 2024 09:58:50 -0700
Message-ID: <20240829165850.518504-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 16:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203939

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use an upstream fix instead of own

 .../fmt/fmt/0001-Get-rid-of-std-copy.patch    | 52 +++++++++++++++++++
 meta/recipes-devtools/fmt/fmt_11.0.2.bb       |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch

diff --git a/meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch b/meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch
new file mode 100644
index 00000000000..1b495ea075c
--- /dev/null
+++ b/meta/recipes-devtools/fmt/fmt/0001-Get-rid-of-std-copy.patch
@@ -0,0 +1,52 @@
+From 6e462b89aa22fd5f737ed162d0150e145ccb1914 Mon Sep 17 00:00:00 2001
+From: Victor Zverovich <viz@meta.com>
+Date: Mon, 29 Jul 2024 15:58:05 -0700
+Subject: [PATCH] Get rid of std::copy
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://github.com/fmtlib/fmt/commit/6e462b89aa22fd5f737ed162d0150e145ccb1914]
+---
+ include/fmt/color.h | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/include/fmt/color.h b/include/fmt/color.h
+index f0e9dd94..231d93c8 100644
+--- a/include/fmt/color.h
++++ b/include/fmt/color.h
+@@ -560,31 +560,30 @@ struct formatter<detail::styled_arg<T>, Char> : formatter<T, Char> {
+   auto format(const detail::styled_arg<T>& arg, FormatContext& ctx) const
+       -> decltype(ctx.out()) {
+     const auto& ts = arg.style;
+-    const auto& value = arg.value;
+     auto out = ctx.out();
+ 
+     bool has_style = false;
+     if (ts.has_emphasis()) {
+       has_style = true;
+       auto emphasis = detail::make_emphasis<Char>(ts.get_emphasis());
+-      out = std::copy(emphasis.begin(), emphasis.end(), out);
++      out = detail::copy<Char>(emphasis.begin(), emphasis.end(), out);
+     }
+     if (ts.has_foreground()) {
+       has_style = true;
+       auto foreground =
+           detail::make_foreground_color<Char>(ts.get_foreground());
+-      out = std::copy(foreground.begin(), foreground.end(), out);
++      out = detail::copy<Char>(foreground.begin(), foreground.end(), out);
+     }
+     if (ts.has_background()) {
+       has_style = true;
+       auto background =
+           detail::make_background_color<Char>(ts.get_background());
+-      out = std::copy(background.begin(), background.end(), out);
++      out = detail::copy<Char>(background.begin(), background.end(), out);
+     }
+-    out = formatter<T, Char>::format(value, ctx);
++    out = formatter<T, Char>::format(arg.value, ctx);
+     if (has_style) {
+       auto reset_color = string_view("\x1b[0m");
+-      out = std::copy(reset_color.begin(), reset_color.end(), out);
++      out = detail::copy<Char>(reset_color.begin(), reset_color.end(), out);
+     }
+     return out;
+   }
diff --git a/meta/recipes-devtools/fmt/fmt_11.0.2.bb b/meta/recipes-devtools/fmt/fmt_11.0.2.bb
index 5a7041088cd..5c60921efae 100644
--- a/meta/recipes-devtools/fmt/fmt_11.0.2.bb
+++ b/meta/recipes-devtools/fmt/fmt_11.0.2.bb
@@ -4,7 +4,9 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
+SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https \
+           file://0001-Get-rid-of-std-copy.patch \
+           "
 SRCREV = "0c9fce2ffefecfdce794e1859584e25877b7b592"
 
 S = "${WORKDIR}/git"

