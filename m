Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.5426.1619377714124350903
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 12:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I0nDyzzp;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id f29so1544581pgm.8
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 12:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0TN8F6xqG6lobm3CbQN1LQ0YXXuzI8As86MylZ9LPE=;
        b=I0nDyzzpDegh/LbhgL69vaTFZIlbHFNlJt8vZ/vzlXTShyu/gTNJN4KRmW3bGcO5Rj
         Cdyo4OZYjfb3nl5279jXs3Ib73L1CaHkuu1feCPc6zfNDqkKKgdCdrSKCsqs88bxuYsr
         F+HAXii159czKfmmXsOF014c5s4sWeClzhzrIuKeiXsfhaZLCfUnEeRl1YoU3jONCl3v
         xJXL90zb1nt67PucwNlxUwIzc+s3ge1sP14i5H62fpwGOkr9BMlj7TwUN8yJV5iScxAI
         f5zPtPAGg8WlJ8cX0v0XEKJFB0H0tDqVwIYwPvXo3wYyHlNn/i87tRbz7/NGXlvIOZoT
         JGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0TN8F6xqG6lobm3CbQN1LQ0YXXuzI8As86MylZ9LPE=;
        b=tUqRn2jCeaufzRsH0Mn9Y8MjoRnbJrYFnmOKC5SqhfEhUJ8Q/rmmBMKJlgO41U9ZV4
         SOL2sNdG2C8tDC+semLxlaTIrs/XOs7jhho1S1TXiVfAXvfUFml5JLNoVEzIGuSLrnHD
         9iyYzsU3kVLQVlMap9K3zIpSJLmc1Za86eRQQ6PaQ98VXhj7ATZzWWVNkYt19YWOKbdd
         vksUhS/La/dOY2PFtkZNbcHAn4EWySIyqDTe9woTiIrUUcDBxAiNlqHFApuDLsb7RCFo
         7GukYcpTjCpiFY6HbHrqQpXQ7yUVz754v6MEklGPbMl8PFKn0M5LJHXEYspEu+SEKyrB
         92wA==
X-Gm-Message-State: AOAM531qLXL4vfb+kAutJyQbpRgcTuGs2e3ddUsZJZAYDsyNMuGOA4YC
	zS3rCX8j6mKg9NzgRh7NdrxRdhzUTS6Mcg==
X-Google-Smtp-Source: ABdhPJwUZXRSjXDjgTsA4n6RqjKJesToOPojb4BEs4JTnScNffVwOOsusKiEzbIHqP3Xv8Dm3UOLzw==
X-Received: by 2002:a62:6481:0:b029:249:ecee:a05d with SMTP id y123-20020a6264810000b0290249eceea05dmr14079766pfb.9.1619377713304;
        Sun, 25 Apr 2021 12:08:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id g185sm9136349pfb.120.2021.04.25.12.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 12:08:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] bitbake.conf: Use gcc-nm as default NM
Date: Sun, 25 Apr 2021 12:08:27 -0700
Message-Id: <20210425190829.2056705-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210425190829.2056705-1-raj.khem@gmail.com>
References: <20210425190829.2056705-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This ensures linker LTO plugin is loaded correctly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 385fc7dd55..a0e0c77fe6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -527,7 +527,7 @@ export STRIP = "${HOST_PREFIX}strip"
 export OBJCOPY = "${HOST_PREFIX}objcopy"
 export OBJDUMP = "${HOST_PREFIX}objdump"
 export STRINGS = "${HOST_PREFIX}strings"
-export NM = "${HOST_PREFIX}nm"
+export NM = "${HOST_PREFIX}gcc-nm"
 export READELF = "${HOST_PREFIX}readelf"
 PYTHON = "${@sys.executable}"
 
-- 
2.31.1

