Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B34BC001B3
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 15:40:05 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.714.1687275600378988104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 08:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MlUkPiEg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-553a998bca3so2414145a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 08:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687275599; x=1689867599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzQTAkRd/07o6iN79uHaDbNyeUyP+1v3dWVpJ0BLBek=;
        b=MlUkPiEgJ3ps8owNGSOjtrXu+zyB2qQRSKygtCIIfZ/4e4kRPMbgYwKuLM/io8rdUI
         nAxysnQFXmb89K/asp8EvxSTqmT5Bz2vk/QJ6TbUFR+HpXyTPLU0mV3NzKGqv5UtmSt/
         e9KLXK/EY6Wov614fQMbOdNZC+3finDdVamq/Hjc8Blb5sLCdScrXq1Cqi3/bcFExjFG
         e3j3en0DaKD/fsdfxk4bjNU9aDN6LiaIqu2BXQG6qIz7zcZ4Ba+n1sXaa09xhKyndiyq
         b+AY2InwOQcHqyDZlw7XR2FjXifJm0mny7opTbyY1Wio9t5+093vZ0NBqZ336mXDukik
         eOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687275599; x=1689867599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzQTAkRd/07o6iN79uHaDbNyeUyP+1v3dWVpJ0BLBek=;
        b=USFmilSQkRk3TCjEkB5pI3ViLG0Iw26SoJvmIMaXXvpnsIBXLe+FWMxvXuP9EApbBI
         YvHPfAz5Tt0kgGpo1eCNkTAV4FAOcoJzr2tvHKzJ6abyiAEXEyfNp1HeOc08VPikJghr
         7BmRJOp0efPpZOXGLimqUz8Igyc3FMgcgOo2rPZujELOGFgnJE8jP41a0q4VgpLZURl9
         Ph/5gFEwl4QQDM2saZAyxUyASO8OgHb4nUwC4M5OHdtavv34RnQmti9HDcBqMvVSVMOi
         SLl5EFVtpQMkgv6q3jTF9JMzCLKQe3ltEJPFA/CnRIqUT6Fgm4Dk0hXurTUKZfLaAtze
         0mYw==
X-Gm-Message-State: AC+VfDyuyATPh+pE/oZYWy96MVQ4EDsikSJ1AoPTffcMjRoMmQhoy9dd
	eYq6X0JQRLkxryzuu6+kiNmbrv4nRfxC2UAKR6o=
X-Google-Smtp-Source: ACHHUZ4z2DQfdMtZzM+rqO9uCw2hJ+OZPEO3IV5ZjAYsxDeN7ZUSZn/AW4iO2+WGWaB5Vmt+3bQ/fA==
X-Received: by 2002:a17:902:e752:b0:1af:fbb6:23b7 with SMTP id p18-20020a170902e75200b001affbb623b7mr15578047plf.3.1687275599313;
        Tue, 20 Jun 2023 08:39:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c14-20020a170902b68e00b001ab2592ed33sm1792119pls.171.2023.06.20.08.39.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 08:39:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/9] nasm: fix CVE-2022-46457
Date: Tue, 20 Jun 2023 05:37:20 -1000
Message-Id: <6b82d998184112c42b4298aef6a0b9e314fc8ee4.1687274724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687274724.git.steve@sakoman.com>
References: <cover.1687274724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183144

From: Archana Polampalli <archana.polampalli@windriver.com>

NASM v2.16 was discovered to contain a segmentation violation
in the component ieee_write_file at /output/outieee.c.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-46457

Upstream patches:
https://github.com/netwide-assembler/nasm/commit/c8af73112027fad0ecbb277e9cba257678c405af

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../nasm/nasm/CVE-2022-46457.patch            | 50 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.15.05.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2022-46457.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2022-46457.patch b/meta/recipes-devtools/nasm/nasm/CVE-2022-46457.patch
new file mode 100644
index 0000000000..3502d572cd
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2022-46457.patch
@@ -0,0 +1,50 @@
+From c8af73112027fad0ecbb277e9cba257678c405af Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin" <hpa@zytor.com>
+Date: Wed, 7 Dec 2022 10:23:46 -0800
+Subject: [PATCH] outieee: fix segfault on empty input
+
+Fix the IEEE backend crashing if the input file is empty.
+
+Signed-off-by: H. Peter Anvin <hpa@zytor.com>
+
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/c8af73112027fad0ecbb277e9cba257678c405af]
+CVE: CVE-2022-46457
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ output/outieee.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/output/outieee.c b/output/outieee.c
+index cdb8333..8bc5eaa 100644
+--- a/output/outieee.c
++++ b/output/outieee.c
+@@ -919,7 +919,7 @@ static void ieee_write_file(void)
+      * Write the section headers
+      */
+     seg = seghead;
+-    if (!debuginfo && !strcmp(seg->name, "??LINE"))
++    if (!debuginfo && seg && !strcmp(seg->name, "??LINE"))
+         seg = seg->next;
+     while (seg) {
+         char buf[256];
+@@ -954,7 +954,7 @@ static void ieee_write_file(void)
+     /*
+      * write the start address if there is one
+      */
+-    if (ieee_entry_seg) {
++    if (ieee_entry_seg && seghead) {
+         for (seg = seghead; seg; seg = seg->next)
+             if (seg->index == ieee_entry_seg)
+                 break;
+@@ -1067,7 +1067,7 @@ static void ieee_write_file(void)
+      *  put out section data;
+      */
+     seg = seghead;
+-    if (!debuginfo && !strcmp(seg->name, "??LINE"))
++    if (!debuginfo && seg && !strcmp(seg->name, "??LINE"))
+         seg = seg->next;
+     while (seg) {
+         if (seg->currentpos) {
+--
+2.40.0
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.05.bb b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
index 59b1121bd4..bcb7e071d6 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.05.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
            file://CVE-2022-44370.patch \
+           file://CVE-2022-46457.patch \
            "
 
 SRC_URI[sha256sum] = "3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa6f35668bee2fd0"
-- 
2.34.1


