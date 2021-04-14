Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.19359.1618431085244259284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 13:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YeywGBgR;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id h20so10779425plr.4
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 13:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fGmnhQyjjmOzdsnCWcrjkkRY/hxaQ8ElYMfk/PeyocI=;
        b=YeywGBgRTaGk0xEMp2K5wEWNmofqbWK3jBKcxiG3v0tlY0dEVBBe635d0ZrJ/BNHpC
         xhJpz28yw0GJek/K4xkQfXNwK1gFMiS0XW9piLU188GTRvefK0DmqLyYmw6Ya5K8bbvm
         PPKJgvEZUqek60MvmZxH7uH++sklhaG+dm2ys4ihiFra4PCOGbG5VuEuohjK8irvXQY/
         HsTQboI7uEd4pQJiXM/MDW0mB5r4MEsXaN+W8AJsmBnjOlVFiGeA2sGDTSuOb0Oiqzy1
         OoKYiMnc5YDXoCL2onqPbIAB20osk5ZYvjOD6erpPrOxZpdUOrQw3g+YWUwQok3ENzE5
         9cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fGmnhQyjjmOzdsnCWcrjkkRY/hxaQ8ElYMfk/PeyocI=;
        b=WjgYNtxD+HTUYCkv/7a3RbaVYMV3iojuAmXlVpY5PAyBSXG+F6SbJqMaY/6Frmcbnd
         VuAKQtyvukjArkMt6VQsNg0C8c6EHrWpzThG1MqzP9lAOiuqw5V1Zv2j7r9kAn9mfKCU
         NjNX/DP7PY2cF/G35dxjjBMcSk00GmmhfyxpaAw68K8JVf/OHezv5K5x9yDGdXGd9vnD
         IafYOR6tgUis+pUKKjB0DUrewb8nGRUHD05pye0+MzOR3JRCZ1Ub+149n8M0yR68jPny
         J7r8N3IAa1lmg/cgxLOcP02GR+Hal2ojA3rmAbYSP5306N+XTrD1rJN+FUXw/JzRt8Sh
         cr6w==
X-Gm-Message-State: AOAM531MShEdFFOro64+BMfBac6eCsHsJK4xE4USq4QdoI7tQYmnVqbX
	rdh54FyeDhSYtnql1/+pftOxSgMNCa8V0w==
X-Google-Smtp-Source: ABdhPJzJhOkucNFyQb5ZK1yC+iG9bzjKZrnHC79Hqpxm+HDuB2NQRdbUBMfHuK0lazMRZTAZIEmMZg==
X-Received: by 2002:a17:90a:fc92:: with SMTP id ci18mr5219981pjb.130.1618431084549;
        Wed, 14 Apr 2021 13:11:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id m9sm314521pgt.65.2021.04.14.13.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 13:11:24 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Rename glibc src package
Date: Wed, 14 Apr 2021 13:11:22 -0700
Message-Id: <20210414201122.2263673-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since glibc uses custom PACKAGES, it misses using ${PN}-src and as a
result it uses libc-src for name which means creating rdep on glibc src
package becomes difficult since bitbake can not resolve rdep = glibc-src
back to glibc recipe and bails out on builds

Missing or unbuildable dependency chain was: ['glibc-src']
ERROR: Required build target 'valgrind' has no buildable providers.
Missing or unbuildable dependency chain was: ['valgrind', 'glibc-src']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 8d0cc8047f..c3d0d9152a 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -1,6 +1,6 @@
 INHIBIT_SYSROOT_STRIP = "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
+PACKAGES = "${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-src"
 
 # The ld.so in this glibc supports the GNU_HASH
 RPROVIDES_${PN} = "eglibc rtld(GNU_HASH)"
-- 
2.31.1

