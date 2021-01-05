Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.5867.1609856787734926798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:26:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=alOPn9k8;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id v19so21345157pgj.12
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=PcOMmxvJgFiMxdoEUhY/XvW1sh5NB3w6pQTYYGq9yDo=;
        b=alOPn9k8Naf5HGJTDQEPIoiW/0F/NCjReV11ebRHIJDvt7PahBRG5QG4ddjKxjQEub
         aYikY92ixlfwBRnq6F//zOmyPXiO5EY1bijjgQItKqw9V9hEySKxcMG1bwwaTpMElJxi
         7rrDGd1kImpP7/2MiW1ruX/TyleshqkcSG+2C39z82fWruxlCv9KTfpLWkCiTy1waj61
         8BGdBbvkXeLvDBcfDbYFaNVLGjLJFiV1l6ZsXUi4wflAvDVrkFK3cnpzEfrovyr6xJVk
         G//y0cod6Wd8flwd7/6oN5ymd9fASecwAjeXDy1itcY8j7adKCORi/0O+6I/oXTa8T91
         NsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=PcOMmxvJgFiMxdoEUhY/XvW1sh5NB3w6pQTYYGq9yDo=;
        b=r6r8z56iBaKlb+zVt+gRPTNJk2Lfffm8xX6ORy0LK4vgJd+znF+lZUyC8lvvFQ9K/e
         aPCmidid9RLSDKBELM1nFJJ36H6Bf+mcEr54gZSP5PFE3XbW90BrLuhyIv5mc1+yHPVi
         /cn3qLZ10GYovXiR85M58oYjMOszXiGx6ULW+dQCgX60e0WeF1Ujibn17h8ld26fxeQj
         q1OgUPICtvh2wla8JVSCSkIcW/F3KLxf4aVcebBa0AH6YxY80Uw5ehjBXw4bL6OuNQMq
         6/72ZTajFg7LI73ZX6CkayFy2t6kXAVJfW4pTocB1nod+S75P9Vnv6jGaGzjPS7ryZKl
         LvoA==
X-Gm-Message-State: AOAM532PR0eCmA5u2h/Ph/8wlHKOIKXQph/d6XaGZXyqD7c5Y5sx7gOn
	Rlj2UIm22TBKCDlWtSI7OCcmHSLW/5KGB+MsIZw=
X-Google-Smtp-Source: ABdhPJwMGrt659S9pyhUnK3Vr1T+6lOyRIQ/9jlXAEKg6t2KmB5E4TjTqt+5Y5ntrR4OJiArfmchfA==
X-Received: by 2002:a05:6a00:15ca:b029:1aa:7d8f:3ca4 with SMTP id o10-20020a056a0015cab02901aa7d8f3ca4mr69490985pfu.79.1609856786941;
        Tue, 05 Jan 2021 06:26:26 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.26.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:26:26 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/30] man-db: Fix reproducibility issue
Date: Tue,  5 Jan 2021 04:23:51 -1000
Message-Id: <b8c71ab1bd8519dde77b38955473bc3b45976d48.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Executing a sequence like:

bitbake man-db
bitbake man-db -c clean
bitbake man-db -c package_write_deb -f

results in the ownership of files in the man-db package changing from "man/man"
to "6/12". This is due to base-passwd not being installed in the recipe
sysroot.

Add the missing dependency so even if a recipe "re-packages", the name
of the user/group is found and the packages are reproducible.

[YOCTO #14172]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 769f8be29a192fd4fa0c4752f851fa3728d71179)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/man-db/man-db_2.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.9.0.bb b/meta/recipes-extended/man-db/man-db_2.9.0.bb
index 493fe817e5..333fbfa76d 100644
--- a/meta/recipes-extended/man-db/man-db_2.9.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.9.0.bb
@@ -12,6 +12,7 @@ SRC_URI[sha256sum] = "5d4aacd9e8876d6a3203a889860c3524c293c38f04111a3350deab8a6c
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS_${PN} += "base-passwd"
+PACKAGE_WRITE_DEPS += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'
 USE_NLS_libc-musl = "no"
-- 
2.17.1

