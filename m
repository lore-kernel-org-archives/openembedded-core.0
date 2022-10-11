Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC79C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 03:02:27 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.3145.1665457340089959169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 20:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qi0UD4eV;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id 67so12294731pfz.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 20:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xZh5R3jNNf8TsLow3fbyqXD5n+jnKlEUeTJm3VNijs4=;
        b=qi0UD4eVibcXxuSAHzjEznL9uAlVra+Ye2/I/ATcOAbqECGHMjN3tSTcuC7wQ9cQRD
         QDimNTfRAbtGFS8aI8iQtJQjnVj+XkgcSMAb6tQ6yaCq9cBJHZtZGiZomyPSxlWKkEcI
         I8qRvonWMsP9rG3wp2y+grTAstzwDmUCjhPspFhPRgDG6rEJCggnlkiYh8k1gpv04CPL
         FGM021uu9b90xsTr3iE0Qzb09j7YFR0Zx+bQmLxwIkSzCRrF014V3u1jSJ0HD7L0fC0q
         gqur7iRk3/M6Lk9tDR1e/tjh0zFDgSxUGhT5rl0HURjNrVCWp7RwmqD0LXI+vS5nI2Tp
         SL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZh5R3jNNf8TsLow3fbyqXD5n+jnKlEUeTJm3VNijs4=;
        b=NR+hAzLbwwzpA0NTSpcc/rXjqhEm5ssbGXYozNLQHLH1117uFS/M1HRICAbKl4dZiw
         CGgFeNxz3U6/0QjwtElBjmhyGJ6LRwofITr4ZNoeslXz/430rtYNTsEuKCVp9GDdt3B8
         ZAQQP1QOEYiHkl0FjHbogEnBZOdIxKi8BDdsGwKcprQvq7zo0PZv4D3zHOgalIekTauV
         Vbdryx46tuLSHhMc0jvxi0z7YHYLlLHAX0ionzUKq0LQtyZbO+2gRKSxhJ8D+FUXjMKV
         +M1cJXcmeyy/40XBwOiEp1RBJS50FV/cXzmequBvVZB87FOwQnY77XxPSWW8DKs4kL2v
         ML4g==
X-Gm-Message-State: ACrzQf17OQi5gO7KC622ctQE1c7ZHgfnPT2ls/FPxsCK8EPTJXpGokEc
	sjxDXBvWlzD3H82H9QzyxGdX/BSyriJ56A==
X-Google-Smtp-Source: 
 AMsMyM4sOSILdB10T7F0S1iUmO2ajxCUv0VLkPHdcWfcIPIIYOp56+OKN6HColyYZplRqRneTp2ogQ==
X-Received: by 2002:a63:1b0e:0:b0:44b:97e8:1020 with SMTP id
 b14-20020a631b0e000000b0044b97e81020mr19024524pgb.519.1665457339203;
        Mon, 10 Oct 2022 20:02:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::32cd])
        by smtp.gmail.com with ESMTPSA id
 s8-20020a170902b18800b0017d7e5a9fa7sm7339802plr.92.2022.10.10.20.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 20:02:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH] perf: Depend on native setuptools3
Date: Mon, 10 Oct 2022 20:02:16 -0700
Message-Id: <20221011030216.3874881-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 03:02:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171591

perf has need for python setuptools when scripting is enabled
from 6.0.0 onwards it seems to throw an explicit error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 31bc04635d..c1b0bd22d8 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -13,7 +13,7 @@ PR = "r9"
 
 PACKAGECONFIG ??= "scripting tui libunwind"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
-PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3"
+PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3 python3-setuptools-native"
 # gui support was added with kernel 3.6.35
 # since 3.10 libnewt was replaced by slang
 # to cover a wide range of kernel we add both dependencies
-- 
2.38.0


