Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1BFEB64D9
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 02:45:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.19493.1688352347553735141
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 19:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=opaq+FKk;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b84c7a2716so18899015ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 19:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688352347; x=1690944347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a22FvSloQTmMSOQcxuAAOAKWTSCCdvUn6aI5v7hQQOU=;
        b=opaq+FKkShdlOE6/uj7UyL4ZjwaUgZNCu4Avj5DpQ0OP5y25eTBFbeFnVbGbwsaZ9d
         lB2uDxpNmXhwQzsR5Uay7/zIHuCzrqtrxWOyR9gVPkHQmCxqiZzcsb3tBDdlhzkZ1twl
         TEfW5xAkTVyQgUBwY4SMMdgRKJYctUomvpWclZ9Y3goH1ajlh4uvURkh+bny8GMx43ax
         d0kKjniQE+KhtEYWSId3xEvz2f0kFGgFOntTY3hAFFEEYJb88wTi7j4oq8y+TPPO2S6k
         3FUwhmmuivpPyghlWEa1aukk2mp/wHAyfGyjGJ1XwQJhbvKAQojSgO2Py4v3D93tWuTi
         tZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688352347; x=1690944347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a22FvSloQTmMSOQcxuAAOAKWTSCCdvUn6aI5v7hQQOU=;
        b=iBpMFiMtYZbyvi4Y5B5ftU6c9km9sVd6a4v9i2brLbsHT+WjtIn8gewkxZq21uUQIl
         KlD8fOUUNTi5/Ui/cNTeyeUc/ixCau5BJrjnhrHxs4rYXrxcKfiJROVI35y0Kyz7fPRd
         IOX09ZJFGqcITWdRMpVKuE5xkS7Tvqlv0foadiXALmUMGkcKpqxLPmia0Lx6n4PlZdQ5
         MqGrwMpxWDjJbYMNx6AEQxXYczirdv4ZcTp3A4sFPZvPL4HnOaPFn3JBGrKdBzPyimGS
         xCDedK7d2CdYcxAXlRBEWBQny+saeJUCuf0nJ3uUfuG+fmo6G99n/44rBCv0EwmaVo60
         ehhg==
X-Gm-Message-State: AC+VfDzpEpeCtPsjin9mF0hXXQf+ob7iMxWjan7hPr9BIQUMiHN6Bj0N
	RIB/1ZpgH3QoyVroDvlBVPIjb+on/AI=
X-Google-Smtp-Source: ACHHUZ7i69KHI4NQjcmgNV7D0EbSe95Y4/dMcF9ARldTkO94cJrHSXPTXOv+v/mfFVmUNRLWDhMjrA==
X-Received: by 2002:a05:6a20:b711:b0:12c:7528:d981 with SMTP id fg17-20020a056a20b71100b0012c7528d981mr7345195pzb.18.1688352346464;
        Sun, 02 Jul 2023 19:45:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::1fb3])
        by smtp.gmail.com with ESMTPSA id im16-20020a170902bb1000b001b564563f32sm3028302plb.186.2023.07.02.19.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 19:45:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ffmpeg: Fix build on riscv
Date: Sun,  2 Jul 2023 19:45:44 -0700
Message-ID: <20230703024544.3230136-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 02:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183785

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bswscale-riscv-Fix-syntax-of-vsetvli.patch | 35 +++++++++++++++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb  |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libswscale-riscv-Fix-syntax-of-vsetvli.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libswscale-riscv-Fix-syntax-of-vsetvli.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libswscale-riscv-Fix-syntax-of-vsetvli.patch
new file mode 100644
index 00000000000..94e0ba6d104
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-libswscale-riscv-Fix-syntax-of-vsetvli.patch
@@ -0,0 +1,35 @@
+From 85eefb65eb632d827e17a72518dd289dcd721084 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 2 Jul 2023 19:29:55 -0700
+Subject: [PATCH] libswscale/riscv: Fix syntax of vsetvli
+
+Add missing operand which clang complains about but gcc assumes it to be
+'m1' if not specifiied.
+
+Fixes building with clang
+| src/libswscale/riscv/rgb2rgb_rvv.S:88:25: error: operand must be e[8|16|32|64|128|256|512|1024],m[1|2|4|8|f2|f4|f8],[ta|tu],[ma|mu]
+|         vsetvli t4, t3, e8, ta, ma
+|                         ^
+
+Upstream-Status: Submitted [https://ffmpeg.org/pipermail/ffmpeg-devel/2023-July/311514.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libswscale/riscv/rgb2rgb_rvv.S | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libswscale/riscv/rgb2rgb_rvv.S b/libswscale/riscv/rgb2rgb_rvv.S
+index 5626d90..bbdfdbe 100644
+--- a/libswscale/riscv/rgb2rgb_rvv.S
++++ b/libswscale/riscv/rgb2rgb_rvv.S
+@@ -85,7 +85,7 @@ func ff_interleave_bytes_rvv, zve32x
+         mv      t3, a3
+         addi    a4, a4, -1
+ 2:
+-        vsetvli    t4, t3, e8, ta, ma
++        vsetvli    t4, t3, e8, m1, ta, ma
+         sub        t3, t3, t4
+         vle8.v     v8, (t0)
+         add        t0, t4, t0
+-- 
+2.41.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
index f84d9bb6d03..181c17d9d68 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
@@ -22,7 +22,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
+SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
+           file://0001-libswscale-riscv-Fix-syntax-of-vsetvli.patch"
 
 SRC_URI[sha256sum] = "57be87c22d9b49c112b6d24bc67d42508660e6b718b3db89c44e47e289137082"
 
-- 
2.41.0


