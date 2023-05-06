Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A668C7EE2D
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:06 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.36192.1683386700749055095
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=wnJDBgOb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso2571829a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386700; x=1685978700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7No+eBjAfFiNGW4fR9454Zujwi5KD5GOz3eX5iNtggE=;
        b=wnJDBgObW4OVbyhrcnkBlcCbNPtFwTawc9217/J8JQMUiEET6Wh0uv+2+3vDoEz3ty
         R6V14j2Z+un77J//0M9BukbDBKv1V/nwjz/olsqzWpgBOushuWXYCAf+jq4PMptfGxLa
         jwAWGA9U80xDvxATIuYOoNsS9AdIiQWHoL5n1xsHTUPSulDyuuVaXlLz8kOMJZiyW928
         uZDV2ZDNyPpJSD/K6LUXwhYsadNqMaOpz1+5nOCVLo8HCKkWxoOV6WM/fxvqpx3/Smyh
         7wRBLHhlGlw5dI6Nat9vw0yyz1YYSwq4dFqmRI+k2NNqtCXNyRP4AA1GU+whO7Qtjo14
         g7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386700; x=1685978700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7No+eBjAfFiNGW4fR9454Zujwi5KD5GOz3eX5iNtggE=;
        b=PSjMwfiWnpeByaS7jUQd2ah231yQpIinZpFD0fjv/9oy4TEmM17nV+yZReFEO7QdJ4
         JGAye/RS5agSpfYkHmTiRg+JVFO8roJZYd7dr5IhsLYha2Ze7yQ20EWLyqFiTxoRRdi7
         uXdgkEnVKOqR/NKIowNi4uks9b5ToVoZWr7S5x2Ge5Tid2aOVI7MdCPWQbeusgHpD2aa
         JpOq9fgegO8tldUzndkO6mA9mU4DSnX13s2YLlMtKYl7qVFl4+86J4z+Lk1h4KBvqUmq
         bBSZWuw+aDa7Ludpel6gbiK/ovHpjrIxHiu7+CAz9ZHyTXDy7/eG1AVukHnQoyjSTF7Z
         f55A==
X-Gm-Message-State: AC+VfDxW/iPt4A8C2j84ATrBpeiqIOk8WOzfjC52NL7C6j0QF7ZN/+hD
	qA0FjqWewZ78YW9k2CB17LJrLdyZq1tdt8fCUC8=
X-Google-Smtp-Source: ACHHUZ79UE+G9edue1jTc3vDXAfW+5ILWnu2G1SYwGsP8C3+hfPeKg18WLCfx0BvQpEpruB0Z6HWQA==
X-Received: by 2002:a05:6a20:6a04:b0:ff:6979:ebc0 with SMTP id p4-20020a056a206a0400b000ff6979ebc0mr3311071pzk.50.1683386699775;
        Sat, 06 May 2023 08:24:59 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.24.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:24:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/15] freetype: fix CVE-2023-2004 integer overflowin in tt_hvadvance_adjust() in src/truetype/ttgxvar.c
Date: Sat,  6 May 2023 05:24:33 -1000
Message-Id: <6a07e1524746bd3cfa5aec090a882f4a7f954dad.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180986

From: Vivek Kumbhar <vkumbhar@mvista.com>

Fix An integer overflow vulnerability was discovered in Freetype in tt_hvadvance_adjust() function in src/truetype/ttgxvar.c

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../freetype/freetype/CVE-2023-2004.patch     | 41 +++++++++++++++++++
 .../freetype/freetype_2.11.1.bb               |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch b/meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch
new file mode 100644
index 0000000000..f600309d3e
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch
@@ -0,0 +1,41 @@
+From e6fda039ad638866b7a6a5d046f03278ba1b7611 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Mon, 14 Nov 2022 19:18:19 +0100
+Subject: [PATCH] * src/truetype/ttgxvar.c (tt_hvadvance_adjust): Integer
+ overflow.
+
+Reported as
+
+  https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=50462
+
+Upstream-Status: Backport [https://github.com/freetype/freetype/commit/e6fda039ad638866b7a6a5d046f03278ba1b7611]
+CVE: CVE-2023-2004
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/truetype/ttgxvar.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/truetype/ttgxvar.c b/src/truetype/ttgxvar.c
+index 7f2db0c..8968111 100644
+--- a/src/truetype/ttgxvar.c
++++ b/src/truetype/ttgxvar.c
+@@ -42,6 +42,7 @@
+ #include <ft2build.h>
+ #include <freetype/internal/ftdebug.h>
+ #include FT_CONFIG_CONFIG_H
++#include <freetype/internal/ftcalc.h>
+ #include <freetype/internal/ftstream.h>
+ #include <freetype/internal/sfnt.h>
+ #include <freetype/tttags.h>
+@@ -1147,7 +1148,7 @@
+                 delta == 1 ? "" : "s",
+                 vertical ? "VVAR" : "HVAR" ));
+ 
+-    *avalue += delta;
++    *avalue = ADD_INT( *avalue, delta );
+ 
+   Exit:
+     return error;
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
index d425e162bc..29f4d8dfb7 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://CVE-2022-27404.patch \
            file://CVE-2022-27405.patch \
            file://CVE-2022-27406.patch \
+           file://CVE-2023-2004.patch \
            "
 SRC_URI[sha256sum] = "3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8"
 
-- 
2.34.1


