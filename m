Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.4535.1588176720411492638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EJ/Z30I8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.195, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f195.google.com with SMTP id d3so1226611pgj.6
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=nqDf93I6jPrrYGJ/r60E3vJ/rvS0CBgEMJWPdI1Lkwc=;
        b=EJ/Z30I8Qs3rfrGCJ18HdRBK2vkPLFJPwX0rE3Lz2fo7QLk8sqOa4TlZ3p043sX2FV
         NZGVqOmMbyzH9zoNkY1fcST9jjOhIm3oK13kcBsBB2EEFXqBg3wuDjZKnY7R3Q0oOZwf
         eI55Fkltu8J8ui/h21wOs//n7tgqSyHT1fLVegEBXVDOiT8RrMOLD1cFolKo9ws0PD74
         l96sTUP0LY+PXqdAiJwq5gDN4Bdu4VYVCIP02Q9IAmxvXBBW3nhY387hM/xiisDCWkWT
         Ch4amP2zNAFsErl+OgeCj1hBa2G1I8COHhIRh92FmVBTW3jUIwAjB9L+8sHrLHpulG77
         gWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=nqDf93I6jPrrYGJ/r60E3vJ/rvS0CBgEMJWPdI1Lkwc=;
        b=nF4++ytXMYDpWZWBVx6aqW8A04RAq1UVCS+E673KVIUibKNuFxx0Ajd3XrbwOOxBQq
         d7MHbaLQFuaZZMk0p0zKTOehIMUGpoNxN/SF0bHDe2p9f5Qg91q5HX8Fmfa0lv2J0602
         vKuTyQsy0/qRLyDMKlxVHh5kqDv75dQrIalGsAY6ZWi8dlofdckM6NUtJzlGjABWJeBq
         2rF5J+o50qWoilosSkUypn3E8/nsjB3V8nU+FvyauNHRL5M9AXGJoLrXcOxgYFYPBIZk
         ZwMIXs2fxtXS+R4l4Xz64tA8tON0qfFCrh7mUn9m60EGWUL2ROEMFEOu+5rGqK/zmSu5
         D57A==
X-Gm-Message-State: AGi0Puai/O630vwDsz/NH8p2SneVdmB6cjiHqbK73blfuxCoWEkWAhXA
	qmWbHbxy7p9V5wwqH/RgpNYvnRRngCoZfw==
X-Google-Smtp-Source: APiQypJi8uTW2N6apjUJgOuC/DzRjQjZN9FXIOfOT7aNke7A3rKfiB029/R8LNjh7NTP2ayS9IYB4A==
X-Received: by 2002:a63:ea4f:: with SMTP id l15mr32477906pgk.58.1588176719475;
        Wed, 29 Apr 2020 09:11:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/16] buildtools-tarball: add nativesdk-mtools for `wic ls'
Date: Wed, 29 Apr 2020 06:10:59 -1000
Message-Id: <3ad1f7742105cbbc1468b0d71e796d10770db189.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

From: hongxu <hongxu.jia@windriver.com>

On ubuntu 18.04.1, it does not provides `mdir' by default
which caused `wic ls **.wic' failed on fat partition

...
$ wic ls build/tmp-glibc/deploy/images/xilinx-zynqmp/wrlinux-image-std-xilinx-zynqmp.wic

ERROR: Can't find executable 'mdir'
...

Add nativesdk-mtools to buildtools-tarball and use buildtools
to provide mdir

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index aa55cde84a..977b6a5e1d 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -26,6 +26,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-libnss-nis \
     nativesdk-rpcsvc-proto \
     nativesdk-patch \
+    nativesdk-mtools \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-- 
2.17.1

