Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95698CC6B05
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:14 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9228.1775107333230897178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0hRZ2vfW;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483487335c2so3565095e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107331; x=1775712131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xt1R++WZ028ka1Bgjte2oMZposZFQvB416HLI0CFI2A=;
        b=0hRZ2vfWTdz4Kdg7sYoaLXamkrVSF/MdJIUeZRcXNPxMB9CGYqVmnQT3Fga4nqE+Ts
         zSjY0HBudrsYfZFeQeBmXsfHVcs9kO84JscpMS99FutId01OF3I/6mIKhTBUVE/UMELd
         HbHwLzCQb3d6ygNJscL01lB5vvItRX60qltu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107331; x=1775712131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xt1R++WZ028ka1Bgjte2oMZposZFQvB416HLI0CFI2A=;
        b=iuavleJOaRRt0uznM6u0fDmdIKCc9yj5NyvNdNlDaNyhcu7fAUwTZ10OEf0avHJOW1
         K3FVcM5OxHAT5upFqiHUsVFLEKvnZrIiudwmCml47A6iaHq+gHTVq96T0htV+ni2bITp
         wXwytyX46v0Ef6xQwuerfsdizJjRJrTYbXCpFZnAqik8CX/0Bo+FOrlZDXdBiN/r9YeM
         K6HBaoCSsnGMXKhgBFEgDnLULjEI4v/mPFuzUHOGiKUjc/eESH2KGmMmOyg8lXUIrJUu
         RjJMnpCNYqWMzth67wPYql4D7OhYvbG0PejxVa2MfMrcHQZXHqhQD2SBEJfH+BaTntxl
         ibhw==
X-Gm-Message-State: AOJu0YwxeLM9SAV3jKRthXj/x4+PwBUwyfsX7OSogB0OBjEgtLKFh1Cq
	8SWSuw7h8PbtnXeQYcghCnt3M5GFM5zU0mTReZ/P7KLOxdKfCs123HTWVQSfG3VT2EsjeKozOGi
	wb8MrNrM=
X-Gm-Gg: ATEYQzwL6qZj15NtztSYakdRt1C3My2oEBle90AlEE0te6R0WOhX0r939e80Ctbkh0d
	g+TOcjDRx/URP8Vq0PvHHWvWn29m8tQOD0+A84/vcFIKUOrKFFaWd0xGkklhY5RnZbOPd9KKD+E
	WG7hhWJw7V4cMN8jUF58uxN+4cjUPLZWUP0MH611qW+mFyUHvbsfiGF1jGRCakYlnCJ4MXe1lNI
	JbDmRa76nAbS5U6/yhCiHGfiGE1aaNHK8L0jIESCRJfbX84O4IkJjGNTa6jpdnOfV80q751uZDw
	HpfZAG0E2y52R5sU9FME6/KP3FGm9ZhRATygg9KDg7XGg6W78Bkhf7ed+JY6xwHFH2UOpbeWmfS
	dpEeNIEjOpsKdeBRhnCcfHHzIHKLboQLkrN9mwvAh2QUOv2BFXkQjItdSekC8b2PDw7Ludru+ps
	ze7RfxVZAZ1MPFqbC8vAOLVHl53qzdV1V+zuHqhOHMYgLVCf1TMKd6hYrle2SQbXBuYRYu4S41q
	OgSKbFN3+Ynu/HOteS50s1LovCIt0EJJpyA0g==
X-Received: by 2002:a05:600c:3e14:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-488835b79d1mr111623575e9.30.1775107331206;
        Wed, 01 Apr 2026 22:22:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 03/15] ccache: upgrade 4.12.2 -> 4.12.3
Date: Thu,  2 Apr 2026 07:21:20 +0200
Message-ID: <0b1c97e64d90ed295f1167d7194750c1475cceb6.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775106968.git.yoann.congal@smile.fr>
References: <cover.1775106968.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234475

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 76a5917034080a87c02f79bb925edf0746bf8baf)

Bug fix release:
https://ccache.dev/releasenotes.html#_ccache_4_12_3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ccache/{ccache_4.12.2.bb => ccache_4.12.3.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.2.bb => ccache_4.12.3.bb} (88%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.2.bb b/meta/recipes-devtools/ccache/ccache_4.12.3.bb
similarity index 88%
rename from meta/recipes-devtools/ccache/ccache_4.12.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.3.bb
index 28f36e5ed78..0cd9a43a1bc 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=5633f18ca110f0d4cb907eba07c920ef \
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22ef4326c8a14ac937fc2b76ef0fd233 \
                     file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=663aca6f84e7d67ade228aad32afc0ea \
                     file://src/third_party/nonstd-span/nonstd/span.hpp;endline=9;md5=b4af92a7f068b38c5b3410dceb30c186 \
                     file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "2a087efb66b62d4c66d4eb276748bbfa797ff3bde20adf44c53e5a8b9f3679af"
+SRC_URI[sha256sum] = "d683d5964a395f00c1c812ea1d1d523179f1097cbff7e7e54e714fa3f99711b1"
 
 inherit cmake github-releases
 

