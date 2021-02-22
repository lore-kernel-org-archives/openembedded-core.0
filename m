Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.33857.1613997400718414704
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 04:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iXF3rRHV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id x16so13373307wmk.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 04:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JMCSai6NJqNPGf9Q3aiYuMJsR3YTayVAx/MxATYaq/w=;
        b=iXF3rRHVH6QuKhkUp/6RGwMzYnB481rUbSpHTMjREp6BU0LVgmXYH0gP65yjgj6TEU
         QFLx8q4QHADW5ZCoYY4M1BLYHj1eYagb4Z/Y5N4tLgn5nT9L+9qE3ge09loWFfMLNPRA
         //b1B7HHjSopOgExiJ8xforsPLlqaheFfr8Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JMCSai6NJqNPGf9Q3aiYuMJsR3YTayVAx/MxATYaq/w=;
        b=qyI52kd/f4nBbtN+IrIcQqwqe4zfDj8P1gC9acX5wxux2ivBqlHHZtqVy29e4raowH
         4mHwblnYIAhHKJ/ch3hgrGpEaXd+nncCvXzNQ6Kl86G6tNa+20jdDOcqZUyOlpFPPd0J
         A5/Dhr89zRDjoo/Vsbkr5Qmko1O98Rm11DV5BObGb2tr6EnLqPZ0cP1z47QQrGIY3OUc
         ZUGkgQIsyZxunBYIp4xwkxMa0L392Mxpzne40JOcWAWlbMWM5l7+F547Lm8Eqj7FKDZ1
         2/qdJv2WgPm7U9FRmXg7b6BYQWnOekqf0J369k45VV7nNPAh7YGHsnP4PBOzDGf3+RTE
         XpLA==
X-Gm-Message-State: AOAM533CLDIH6Vxq665kKykzC57LnM0jfWOVG0qyyBBVByDPXvj7Tl6B
	g2Z/jisoBOsLRu3oYlfveCZROH1A1QhChw==
X-Google-Smtp-Source: ABdhPJwmZkDI3yZ6pOsZgVBRo6TzcKu9OPUFn1X1cekxfsZ8ollZF7P7gOYzc+HFCgmlbBF2e3hr9Q==
X-Received: by 2002:a05:600c:1554:: with SMTP id f20mr19843951wmg.77.1613997399066;
        Mon, 22 Feb 2021 04:36:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id c12sm17432526wru.71.2021.02.22.04.36.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 04:36:38 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] rsync: Fix group name determinism issue
Date: Mon, 22 Feb 2021 12:36:33 +0000
Message-Id: <20210222123638.3754068-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

configure falls back to inspecting the host#s /etc/group for the
nobody/nogroup naming. Pass the correct value to configure to
ensure host differences don't sneak in.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rsync/rsync_3.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
index c08f93884f5..eebd15ec8f5 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -39,7 +39,7 @@ PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
 CACHED_CONFIGUREVARS += "rsync_cv_can_hardlink_special=yes rsync_cv_can_hardlink_symlink=yes"
 
 EXTRA_OEMAKE = 'STRIP=""'
-EXTRA_OECONF = "--disable-simd --disable-md2man --disable-asm"
+EXTRA_OECONF = "--disable-simd --disable-md2man --disable-asm --with-nobody-group=nogroup"
 
 # rsync 3.0 uses configure.sh instead of configure, and
 # makefile checks the existence of configure.sh
-- 
2.27.0

