Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FD3C46CD4
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 12:28:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.20456.1703075282952392741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 04:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BFPGxHeK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33670b90013so419502f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 04:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703075281; x=1703680081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PYBV6dMji2TimKILX8ncH1wmK6Lq7rTMQ3jO98+IkIU=;
        b=BFPGxHeKhX3WHVBuCwJSsljoiYKoC8ygr1oBsduyToCf1OWVue2m5gdIwIvYNeQ2cd
         HIz564i5qagXiExpTG//4IXmCXVyNDHsV+p2hX/ai9DOBOxqz8Z8yRS/tnh/YSi6uOIn
         yoloIHfW3pUGRhGiJrrQxaNheyvbvSBJSgeys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703075281; x=1703680081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYBV6dMji2TimKILX8ncH1wmK6Lq7rTMQ3jO98+IkIU=;
        b=ngvUviSrFEBIk1Iez18lUQPE8ioP/WkKF64DtlU08D3CCMpPBKCKRFry63Q0y1cEgQ
         6nuHCRyNnYaoGCkQa2Zx14/bypeOCENvEgVRpKK5NL92B5CKVOd/DdKkZ3iVzRbG9chq
         Gz0kwukMtDCbIa252egkjxZk00voYPwcibed4X3dKHbaJ/uV/BNYybt9vnPJifSwRcxd
         cWSoUWc5NWW24iXPTkN/31w/pPgV70xiR27ynbsYmPObkxTlubCFCmI1nhAcj4DF8H3R
         jj9FHg5G4ekE7rfRI8kAbpBY5MdxGUgB3sXL3pYDaHlrrekzYjIIF/mBfgGth57TFIUw
         fUQA==
X-Gm-Message-State: AOJu0YwX0lf4/vdIpRUK/Az6d3aFLSdQuqCyKP90mJdariYfjeX+kv1B
	cW0mRaQS3pkWrHNDgkjogaIcPVl9U4boJarLx0Q=
X-Google-Smtp-Source: AGHT+IHqWkABEY03dbNyxCkjbKQdC3fcCmoyBAdWF3rCdY80pWLYq+RQYitzG7aZzgfiGKLO/3gxYw==
X-Received: by 2002:a5d:5957:0:b0:336:7f3d:5bb0 with SMTP id e23-20020a5d5957000000b003367f3d5bb0mr246384wri.34.1703075280951;
        Wed, 20 Dec 2023 04:28:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d4604000000b0033642a9a1eesm19170000wrq.21.2023.12.20.04.28.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 04:28:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu: Clean up DEPENDS
Date: Wed, 20 Dec 2023 12:27:58 +0000
Message-Id: <20231220122759.3639685-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 12:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192796

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
index 84ee0bcc492..dc1352232ef 100644
--- a/meta/recipes-devtools/qemu/qemu_8.1.2.bb
+++ b/meta/recipes-devtools/qemu/qemu_8.1.2.bb
@@ -2,7 +2,7 @@ BBCLASSEXTEND = "nativesdk"
 
 require qemu.inc
 
-DEPENDS = "glib-2.0 zlib pixman bison-native ninja-native meson-native"
+DEPENDS += "glib-2.0 zlib pixman"
 
 DEPENDS:append:libc-musl = " libucontext"
 
-- 
2.39.2


