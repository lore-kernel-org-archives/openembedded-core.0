Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.8945.1632493006107600508
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=zK125aWz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id bj3-20020a17090b088300b0019e6603fe89so6155832pjb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jEPLp6WemLY5V1Bj+vy19+dJsj4j9RAoGvck4qZCz1Q=;
        b=zK125aWzoM6u+DNZp9C3AwdjfiGFdYarMZjTixK3OSkv1kLTMN/HfbmsFZyNeKJqvm
         hROe92cv/bRfGSX35TKLbcBPraPONN21+B2rx3pPbHwKO8XLZ+lAAs3Jo0DUCr16atzr
         3POy3dgSJ7+SE9GYs6j/pG+oGBPjcMpVYFjUgrGP59FUwIbe41tAZ8Vom4J1VlhhiNUh
         rR7Uh7hKBzLj3oVdHhvVspTKjYAiy3Ihgz38HQO5/ZM5/nhhQzR22mM0ZwP7CVoLDwuC
         hLFcag0C4uS8/+Ss3Eu0ckRHAJMKemEUMwnkeG7XV9O9FS+3NQfZCFn0AeclyN6pOLue
         YYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jEPLp6WemLY5V1Bj+vy19+dJsj4j9RAoGvck4qZCz1Q=;
        b=ganpLAyjfrkml9rgufUnNjGzhwuUkH29B+3Q/2rQb6xjLbh/hwdOb4bRh2CJM60h6J
         CB4NbJ15TEP8Nr/MUE1LvXC9NdtWr4jOrddNZLNsWhGo2qS6HQqZioblm1mK04y+ZvrR
         unCZ8/cOnbiZkogwDuK+2pt1mwA2S34AGHC0S+WZiICEG7LJZGVlek/4JFVWIlOi0F9j
         XkJbpRM2J6WX9auRrMc4NzZQ3IDN6RClSDG+T5/3BLNZrMuDTj1Bc8KgVsTsCVfGLre9
         yVXLRs6nSih3wXnKGUbTqFGyqSro7nilP0XkT9ar0sT07GTFntTOPffOahcAqxKqJ23U
         alyA==
X-Gm-Message-State: AOAM5327mTkY5rWYND6yW/okKOGO4A4k5wyyCvzsHIt0jx24lpB9/xvS
	IC5Ju4M8cM3GzPDDPRndUh9Sn8c+HTY60r6Ylxw=
X-Google-Smtp-Source: ABdhPJwoytBSs8/e94pAqBx41+InisgEawU+ql1TkFyz2RayHohQjkWIXQgkhy1R7zwaLogsuvbCjQ==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id oo15mr2547503pjb.87.1632493005206;
        Fri, 24 Sep 2021 07:16:45 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/25] core-image-sato: Fix runqemu error for qemuarmv5
Date: Fri, 24 Sep 2021 04:15:25 -1000
Message-Id: <c7a1ddab6ce16ee882fa14b179e6355412fd7272.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jon Mason <jdmason@kudzu.us>

When attempting to execute runqemu on qemuarmv5, the following error is
encountered:

runqemu - ERROR - Failed to run qemu: qemu-system-arm: versatilepb: memory size must not exceed 256MB

To work around this, limit the QB_MEM size for qemuarmv5, similar to
what is being done for qemumips.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6450138afebffcc55ab32afadd5fb979274fff2b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/images/core-image-sato.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index e50b24a476..300d8e0d43 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -13,4 +13,5 @@ TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool nativesdk-glib-2.0"
 TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
 
 QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
+QB_MEM_qemuarmv5 = "-m 256"
 QB_MEM_qemumips = "-m 256"
-- 
2.25.1

