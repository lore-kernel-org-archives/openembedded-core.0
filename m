Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.213.1630773111338902334
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Sep 2021 09:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z9kfRMGb;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so1598552pjw.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Sep 2021 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2mFFFyRwiIf04ypjBVS+e3Pjf+kaT0g//aA3bhs3gSI=;
        b=Z9kfRMGb+ZGNY+UGY8wps05D8bAVxwg/Tmo1EM575I9zbVpvrzfpQfqHXR4vN3kT+u
         CYrXs6lV0hSTsRjGYLZTlHm5pnz+DxV64srj24Bx5GhDFJduGbnCrOBBKrQ8m6VJqi2E
         YO+ev7aLTHjlqw6jIJrGhAe/5DbqPe5bFUPFD56B8Zv7o8ra9bJIzA5dsavgppyXsxEG
         BuzIJmgo4oAY/wx+P8TxlnPLyLsTY0KpQeOos9KkVJA2Kp1UZEb8PCNZZePjqT9WIayo
         hoTrgjb5lvjZBR7KCp1jDS/teCTSPYnIHBNJS5h2AQW6bfmzD/jQl7QrNDY77zNxkmmo
         7s3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2mFFFyRwiIf04ypjBVS+e3Pjf+kaT0g//aA3bhs3gSI=;
        b=BWKM0YRobjupO7M4YSgMXPKbZfV+jl60Z8jJ+mZR0eyqSNLlJC3F/yx84X7Ni64Yd4
         oiYt8m/ANK8sihnK+2Qxt8tazJXPbo8Mb70GFact7XnHW0v4yDc+AsZ/JjcMii0FUWRp
         2CUFzT5GmXIEfCsQFncjM/VJ6k7DEwFfmjpFreknC/lUOAlZSXSipstx6KOVoKKJpcLL
         L+189KlqjpjR5b2rnEoeipBRwLQdLUhe0FHCcO0iCnMnlbBN+y8SIXE+Ay31pP2CXloi
         WxsdV+ukqY7qWzbwcXGdauW7uxp+wcQmGazIEzwvFX/yRvYd8ZAWwF3st/Dm449JhU5R
         dnvQ==
X-Gm-Message-State: AOAM532XR8D5DxexzvJhsteyHHXLGybUCQVaXpqH9XSpuK3Aolm9IUdu
	XMYv8ds327MFoJYvwZuLieUUSsZw1OjA9w==
X-Google-Smtp-Source: ABdhPJzgR396yFeu4IQ/FZo0eYZEAzJCmZOGg1DzPxtTbNcGWbhdQmxjNrQWKCXd2ZZeN0u5SPFOcw==
X-Received: by 2002:a17:902:82c6:b0:136:59b0:ed17 with SMTP id u6-20020a17090282c600b0013659b0ed17mr3878040plz.61.1630773110378;
        Sat, 04 Sep 2021 09:31:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id t13sm2791724pjg.25.2021.09.04.09.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 09:31:50 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] vim: Add packageconfig for sound notification support
Date: Sat,  4 Sep 2021 09:31:46 -0700
Message-Id: <20210904163146.747932-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vim uses libcanberra to implement sound, currently its ok for target
since we have captured dependencies in recipe sysroot but things go a
bit out of control when building vim-native, where configure starts to
poke at host system and if it find libcanberra then silently enables it
lets make it consistent

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/vim/vim.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 860fd24863..17322885dc 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -69,6 +69,7 @@ PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
 PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
 PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
+PACKAGECONFIG[sound] = "--enable-canberra,--disable-canberra,canberra,"
 
 EXTRA_OECONF = " \
     --disable-gpm \
-- 
2.33.0

