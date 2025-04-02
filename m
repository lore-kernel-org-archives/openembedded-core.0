Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5A4C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:23:48 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2418.1743578622915277124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Okf3fw79;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22928d629faso85878655ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743578622; x=1744183422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E69m6QS7qyXHuzypuiGVZsM7L7mw/Yv/wHWFtNjq/u8=;
        b=Okf3fw79XTTAb8dHq04o4DfACYLAnCBZbpvzwhDnAGbk9Mbjo7dKHKGLljj5pLHGit
         OuHDmkdRfza1Fx7rHGc5EFWlM5ycNGKJN7c1keh4XCB1UM2TMNjzqec7VJ7OcM43fId4
         j9v9uGbdiHHw49g+XGCddHOKtygDYFCBC6RFVVl61l2TuwS640NKYxBauJrvbDW6Rpg+
         MngodJbX4/J+Fiduo62yAITA6mlUBnSRGjqviSxF4G3tEfuqdAkUzMqmsgEGZoKIwuO1
         u6IOM4QPkJXKuOwjubXHYY86EeTdU8oheDjRkcUMarhF7NPIB5oH8WvJ4ig2B95//eLa
         ynGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743578622; x=1744183422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E69m6QS7qyXHuzypuiGVZsM7L7mw/Yv/wHWFtNjq/u8=;
        b=pVTgsC64XBxQrYXgc7HC4zLwIUlI8tWYHPxuPc2dBnAAFxkeozSVco4/2c26BN0oPY
         1pl5sw+OKqfvkR2wvLybFEk6syAZcAMOJDEHpUlQkIJAnNkdk9o/zJXIC2kD21JsX8eG
         KESSaDho94YNTbwnRMjMAx4dKUyNuqE7Nd/FsleubWHAWuWVpcAbDY83fxUpN606DjWn
         uoh/i0z0jBLcxtHD1p7ECxQxIuZAEJVFfW6HusZZO7dWgvp8oFZd2sn0NWxH4yYv4e9g
         A7YoQn7M9wcVPjF5/+NKbovjxcpWiExB6thMKqk/7n3zYrk0vu/TYct216LriSbO+Bb/
         W42g==
X-Gm-Message-State: AOJu0YxEPI4wTLrDlYgTGCHbWSI/HXN+p35eqItCKIYd/cHkA9EFCX3l
	W6r/jwzxnq3oiTIbU6+Q8Qdo+of8mGREXo8Tj6gua6hoSRFkXhmqF5a28Sqt
X-Gm-Gg: ASbGncs0JAFXS1sKXxacbL3OsMDRaxT4l2fhh+MpHVTKeG7DltLiLNaDTJb9QHoOrHK
	/qaXIntXQuRQL2IaIFOvB6fUJ50/jvINrQ93TDJz4gPXZCPaqjve0l5v5JK5pCXjhPNG93HHBx8
	WsEdNEZ5SkIrVr6THZxzjsyc3P4QE6DxDrlnlIu/+ukH6rhVU6sdRxg5orduX24P/JCVFSkxyIx
	BdiwZDIMKbIxi+dn9UnfFG17xXurqlXFaxM5pfCQA0K/zbZfNXWK7GgD8UvrJZeoRJ+bg88qhw1
	tG8ykwmBY6a5vdAP+c3mk2McLRM1V80xXLOs
X-Google-Smtp-Source: AGHT+IF4xtUCVI1zGREQ50R+NzSU+2JVIRMY1pntSZZcfqb+/OFrQuappvu1kKVYms1jxNTLMjiFjw==
X-Received: by 2002:a05:6a00:228e:b0:736:3954:d78c with SMTP id d2e1a72fcca58-7398034f597mr20706228b3a.6.1743578621943;
        Wed, 02 Apr 2025 00:23:41 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a85b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e2a0e2sm10545520b3a.67.2025.04.02.00.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:23:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] llvm: upgrade 20.1.0 -> 20.1.1
Date: Wed,  2 Apr 2025 00:23:39 -0700
Message-ID: <20250402072339.1977120-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214226

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop PV from recipe

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
 

