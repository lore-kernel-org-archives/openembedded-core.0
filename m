Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.1788.1623200320097047375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 17:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ti17S7tJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id i34so11567276pgl.9
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 17:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hOSonup/B4TWVLSJj0og02S3OlXI6IzCUpreHvjFrtw=;
        b=ti17S7tJrcY/YhG3L1r38IBI3m0mwvblCo19kUKuYI1Qgav0UZxPpRhG3jyGZlXwKN
         LQnO95/LH+t7cmfpm1R2qB4oXZra5b177Do5PM/Yk47sWNv3gYUb4JjPIibB35mxrwSb
         rcRmrtA9H1UnslK636p4qg8k4e1EVBLZZIdEK/Lq5rRiIHNz4aUR8uxdJkNWN1n5VydN
         vZyMvqKpICtoJrm7NVvdaMJtmTsHre0ybaRKmEtyWNvfSbs59iL3jQ7XCYmbxAqyEDgA
         pRDil0L+TRCb6OqFveBjpq0bMdPz2tSgWoR3r3b67A9IX7Lb6zbOXQYCD8LZDDvp0p+I
         jBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hOSonup/B4TWVLSJj0og02S3OlXI6IzCUpreHvjFrtw=;
        b=ZAv/xJfbBA/D8CIBqYXki/GZAMru4GNf+2/bSObkXcL4doZVn9EzId/8/cDawmGbQb
         MVxphN0PRKaUNyxa7gbnVjJ8rwrKGzVAuRqJY3aK6IQE/eGKJcgFh/ta75VqK7oGtU9x
         je4A9w7RoU0xMHAzYAZPAzmTHSbwfCKBpsAjfGPEUL16yV5sivTzSLPOECwGMH87V1yW
         HlubHDmaMmxqYym5FO27Ovwn41gzjehX8pjmHeSYAf3+jAYatUUGMFCJT4kQJZUgFpqH
         hk93pEQtmMUGo9LxD7EIQRhNZh5UxvpPCIBMxNvIz0/LqWC+CtnGNpsur74FeBDZqScg
         efqA==
X-Gm-Message-State: AOAM531gl+0t+IL68UWeh1ZarL5/lFLZNbjg0WM+h304WWUQIEIRirni
	yNlsoexR5g6Yi9Hbb9N52RDwR6SSNufQog==
X-Google-Smtp-Source: ABdhPJzOIayLrwOXhZNPo0A1YyE4MNFkBt0tVFMnrCxXrrzY5sBuMEjo7sULtRQ4vwyriCf8gjoFLQ==
X-Received: by 2002:a63:4e50:: with SMTP id o16mr1057901pgl.140.1623200319372;
        Tue, 08 Jun 2021 17:58:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id j4sm3293997pjv.7.2021.06.08.17.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 17:58:39 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ffmpeg: Link in libatomic on riscv32
Date: Tue,  8 Jun 2021 17:58:36 -0700
Message-Id: <20210609005836.4176181-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It needs some functions from libatomic e.g.
libavformat/libavformat.so: undefined reference to `__atomic_fetch_sub_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
index 664fc6066a..3ed009bbb7 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -129,6 +129,7 @@ EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r2', '--disable-mi
 EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r6', '--disable-mips64r2 --disable-mips32r2', '', d)}"
 EXTRA_OECONF_append_mips = " --extra-libs=-latomic --disable-mips32r5 --disable-mipsdsp --disable-mipsdspr2 \
                              --disable-loongson2 --disable-loongson3 --disable-mmi --disable-msa --disable-msa2"
+EXTRA_OECONF_append_riscv32 = " --extra-libs=-latomic"
 
 # gold crashes on x86, another solution is to --disable-asm but thats more hacky
 # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
-- 
2.32.0

