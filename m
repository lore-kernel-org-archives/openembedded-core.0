Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B408DC7EE25
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 21:28:28 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.8916.1683840504546694170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 14:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VZjZs93c;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-643b7b8f8ceso4834683b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 14:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683840504; x=1686432504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyrLcPucnBHBRaMkn04Nndgq/W3fTr7WwnbzQOFNfY8=;
        b=VZjZs93cKQA9mJBeOtUvXTcUBFNyXTWGnoBRv7DzraZLk4qndxCll/E23EEM7BbtVC
         6AUPVuQT36KHAP0KE6lqzkm28gDLoESNdXkue4ncTGXzU0DPIAlW+etUJ4GW8h9OhHE4
         Npdr9nmQCugqYL2JBZDhTOdzEzgwO2X80BBeHJtfualW7IMprcGaTIb/mbtBbZvyVI6z
         c+ELtBA7GEw+5lSc7LnfQLI7zUbYbWVumedd7JhmCJkm4jhcovw94NMK8gxL3SE7FaPj
         +LnYguIjRvoJ7p7S+IbjziEbsBdYSfi77GnRs50gG7giRvrrzoawn6veeJ1abWFa/dWA
         cTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683840504; x=1686432504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyrLcPucnBHBRaMkn04Nndgq/W3fTr7WwnbzQOFNfY8=;
        b=jJ5P8ibWft1t1Ke/j2unNIwL9XQ/NWZnbXQuRX0xZsLl0WxhAhcTzMM3BTNlq4lXDs
         nGI3vbN30+nKjxmNllmEzgr4Mlu0bcEGqda1uH9Oz5A+9n+K/Ha5Orz85OadTSrJDaL0
         0ngak+bSnasX88eoozOxHIVnr/irHFhCADWzNP69OGl6PvQvwMWoItTSU2aThuah7Io7
         hldmxQcIkFoKpSwlD5gAQSidOhHSUgCfDEVUD8RqeAHx9T2FcF5oxIZXoR3ERrJ8l4Sv
         Tdbc1dxScYMWtOTO6mbnRdg2UZujLOOXNT/nXJvUz/cfyaKscW8/AghLGG+sLfUs9H6I
         q57A==
X-Gm-Message-State: AC+VfDxMItb/y8rat1eb+gPk4BVjLK2W35x39AI07cBJYKNd8jvlSFbf
	7o0Dc79a43jBzJDeR/Ycp3NgCrpvrkW+yAJnoHY=
X-Google-Smtp-Source: ACHHUZ6+rgYxQA7+XO1WlQWce/SBU3froX/dxEPAAbCge2/sXD5FJeVp+i0OfdZ6VUysbAmrZHNb3A==
X-Received: by 2002:aa7:88c8:0:b0:64a:2dd6:4f18 with SMTP id k8-20020aa788c8000000b0064a2dd64f18mr2918506pff.13.1683840503624;
        Thu, 11 May 2023 14:28:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e5-20020aa78c45000000b00640defda6d2sm5671981pfd.207.2023.05.11.14.28.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 14:28:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] freetype: fix CVE-2023-2004 integer overflowin in tt_hvadvance_adjust() in src/truetype/ttgxvar.c
Date: Thu, 11 May 2023 11:28:06 -1000
Message-Id: <24c87e674db9c1d4a8922c3af78a0004c061e70f.1683840390.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683840390.git.steve@sakoman.com>
References: <cover.1683840390.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 21:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181148

From: Vivek Kumbhar <vkumbhar@mvista.com>

Fix An integer overflow vulnerability was discovered in Freetype in tt_hvadvance_adjust() function in src/truetype/ttgxvar.c

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../freetype/freetype/CVE-2023-2004.patch     | 40 +++++++++++++++++++
 .../freetype/freetype_2.10.1.bb               |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch b/meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch
new file mode 100644
index 0000000000..800d77579e
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2023-2004.patch
@@ -0,0 +1,40 @@
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
+index 78d87dc..258d701 100644
+--- a/src/truetype/ttgxvar.c
++++ b/src/truetype/ttgxvar.c
+@@ -43,6 +43,7 @@
+ #include FT_INTERNAL_DEBUG_H
+ #include FT_CONFIG_CONFIG_H
+ #include FT_INTERNAL_STREAM_H
++#include <freetype/internal/ftcalc.h>
+ #include FT_INTERNAL_SFNT_H
+ #include FT_TRUETYPE_TAGS_H
+ #include FT_TRUETYPE_IDS_H
+@@ -1065,7 +1066,7 @@
+                 delta == 1 ? "" : "s",
+                 vertical ? "VVAR" : "HVAR" ));
+
+-    *avalue += delta;
++    *avalue = ADD_INT( *avalue, delta );
+
+   Exit:
+     return error;
+--
+2.17.1
diff --git a/meta/recipes-graphics/freetype/freetype_2.10.1.bb b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
index 72001c529a..6af744b981 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://CVE-2022-27404.patch \
            file://CVE-2022-27405.patch \
            file://CVE-2022-27406.patch \
+           file://CVE-2023-2004.patch \
           "
 SRC_URI[md5sum] = "bd42e75127f8431923679480efb5ba8f"
 SRC_URI[sha256sum] = "16dbfa488a21fe827dc27eaf708f42f7aa3bb997d745d31a19781628c36ba26f"
-- 
2.34.1


