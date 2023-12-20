Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05E6C46CD8
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 10:39:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.19058.1703068766439511007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 02:39:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ec9y2xc7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c3f68b69aso51433495e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 02:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703068764; x=1703673564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8soP2JmHT04Ia7QjaFf4O7DLL+HCvppZGFjxw8+8e0=;
        b=ec9y2xc7q6GQBFU+bzfKMC9LhS+iK0YtB/CMLLa3UmShYpR8RSwBE6pYt0lJuwWzHZ
         KK7r8qSXsE6OQa+eIiRBW+Fqm1UlIRStg7hmEs+GzMe6pGqJq86gayYdmDvDurXO4Kv7
         6X6nz3qvZ/nSeAaklPOpS6z8rX464mNva++Gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703068764; x=1703673564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8soP2JmHT04Ia7QjaFf4O7DLL+HCvppZGFjxw8+8e0=;
        b=q/ayUTelFz4DBWlh28GWspIXLjUPp0i0MG/cD0YF4B2E0BvKX0zuwjrQooOW5SqlB8
         gR4SIeS6rvSmmKvBOySo3QtLZrocGCt1BH1jaoDAVUAKElyS1H3o880L1yXX7rUF2g4j
         XsCktShY25Z3p1pnuKp5hhpbx8Xu2ym2Kk1f2gw8mR8HM9fPXDfhkJqml1AMEpXV1r1x
         ta92wg5VcYy96/V8/OIeYF1MG54r69t97U6qvRC6kABGRuRo5ypGO4AaUZY1akr4Bs+6
         082vcKzMQBgtkIk/dzaK5G8NMFMHyF1ApmqKn+Q8A0BiiBt74Hb4HlZGs4/Fbur91EbE
         +T+g==
X-Gm-Message-State: AOJu0Yxxq6vBd2ox2b2JQbaHyg8cAYvr0S/TQA9yT4IBFgHw5O0cp7TI
	sM1aVecFeQOUa+RoAh2axOy8IVx74uc2rl6MoHA=
X-Google-Smtp-Source: AGHT+IH4e1GmFVe8y07Au3NpvnvN9eP3N35OFl9YcuFaVGYUo7srd3BSbSnzsgUOTZEUtuKK396X/A==
X-Received: by 2002:a05:600c:4ed3:b0:40c:6e31:765d with SMTP id g19-20020a05600c4ed300b0040c6e31765dmr5038556wmq.122.1703068764351;
        Wed, 20 Dec 2023 02:39:24 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c])
        by smtp.gmail.com with ESMTPSA id n11-20020a05600c3b8b00b0040b3d8907fesm6054265wms.29.2023.12.20.02.39.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 02:39:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu: Clean up DEPENDS
Date: Wed, 20 Dec 2023 10:39:22 +0000
Message-Id: <20231220103923.3624311-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 10:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192787

Move the common dependencies to qemu.inc for cleaner entries in the
various recipes. Remove an unneeded inherit.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu-native_8.1.2.bb        | 2 +-
 meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb | 4 +---
 meta/recipes-devtools/qemu/qemu.inc                    | 2 ++
 meta/recipes-devtools/qemu/qemu_8.1.2.bb               | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb b/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb
index 73a0f63f2b2..a77953529b1 100644
--- a/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb
@@ -1,6 +1,6 @@
 BPN = "qemu"
 
-DEPENDS = "glib-2.0-native zlib-native ninja-native meson-native"
+DEPENDS += "glib-2.0-native zlib-native"
 
 require qemu-native.inc
 
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb
index 558a416f7b4..0634b342429 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_8.1.2.bb
@@ -1,13 +1,11 @@
 BPN = "qemu"
 
-inherit python3-dir
-
 require qemu-native.inc
 
 # As some of the files installed by qemu-native and qemu-system-native
 # are the same, we depend on qemu-native to get the full installation set
 # and avoid file clashes
-DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native meson-native ninja-native"
+DEPENDS += "glib-2.0-native zlib-native pixman-native qemu-native"
 
 EXTRA_OECONF:append = " --target-list=${@get_qemu_system_target_list(d)}"
 
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 58284ef9937..9e187a09958 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -6,6 +6,8 @@ a variety of guest operating systems"
 HOMEPAGE = "http://qemu.org"
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 
+DEPENDS += "bison-native meson-native ninja-native"
+
 RDEPENDS:${PN}-ptest = "bash"
 
 require qemu-targets.inc
diff --git a/meta/recipes-devtools/qemu/qemu_8.1.2.bb b/meta/recipes-devtools/qemu/qemu_8.1.2.bb
index 84ee0bcc492..6a264b445b5 100644
--- a/meta/recipes-devtools/qemu/qemu_8.1.2.bb
+++ b/meta/recipes-devtools/qemu/qemu_8.1.2.bb
@@ -2,7 +2,7 @@ BBCLASSEXTEND = "nativesdk"
 
 require qemu.inc
 
-DEPENDS = "glib-2.0 zlib pixman bison-native ninja-native meson-native"
+DEPENDS = "glib-2.0 zlib pixman"
 
 DEPENDS:append:libc-musl = " libucontext"
 
-- 
2.39.2


