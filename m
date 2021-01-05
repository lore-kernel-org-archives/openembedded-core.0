Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.5983.1609856690552577326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:24:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0l1y2Hcw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id e2so21384773pgi.5
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5aDszFJuTBCbgFshCQ1SXgedWBT8CQU3ciX3lvoFgtA=;
        b=0l1y2HcwJgXumT9QnCn8Fg69mGkBzFif4PgVCHzjTo6WP3jIRbD4oGpfCdxVLC8bvK
         yuCzV+4ZRmHChv+X8EgKx9f9jBfwaVsRYFCQ0VeHGpq6jBv++7VLy0p0CT6ZJ+QjSxBR
         5i9C8XpMtQqCpGLIEJfQhIB/NuqHMHUUhzVW4xpJhbE5WwYirWBCUC6l49ajzTQBSEcx
         Uof4PB5vew4mqD4QzYGgDhZmKByxOBfAuZHy8mrZBkbtYvms4X7CTnSmn1keMCpEDP1s
         XuUglLR4LaZzYTI55SQoJ5dwix9rZ7rJG8MOC1EwliJ6ynrYeF23cNXhbf6884Sp3dSZ
         KCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5aDszFJuTBCbgFshCQ1SXgedWBT8CQU3ciX3lvoFgtA=;
        b=KUaOy+sqNwY0qiYyLLl5RSUD6/SiEIQ2sOe6Uy3Ya2kJJ49ZvhA3+81nCAj7ew5ifN
         ql1dLti4TNK810avhemCdk70GUV4jWXs0dvmaT0XO1SzoHsOiqo3Ra/r0uwu6dX4KKBr
         RdL2tzZD9u7vyqzQJ74Lt/ZybZ7C1xWlupJ3NWmiHgPDKsx6MxgOneh3J2lCKnfT4mQU
         gcZAbIEBYNtEogCj0ziIGE03nuCioLR7+dPjQ38LN++PwKKS1HbMxNL6Oma0HubPzrHV
         P7+q/4JUvrOCCu6oy9z1ag/T6NQAG/bIlMR6cQXEO9zl0MNAbFw5sWgtGCqjLexwHf/F
         EMgA==
X-Gm-Message-State: AOAM531gY838awNfJA9WBCDE/7TP0Vhg/wSulmiViyThjDw3cXZq1w/t
	kurhkepZIgbnwxs7N1tijIgixZJQiYIgcW4n5Fc=
X-Google-Smtp-Source: ABdhPJzo4bHyCdTP/3zTfIjUFq1ZayBNAk+7BCIBAZVQp8Z4fMi7mkjpRgl6+GroAN9ZEmvCH1H+jw==
X-Received: by 2002:a65:6645:: with SMTP id z5mr29077728pgv.23.1609856689611;
        Tue, 05 Jan 2021 06:24:49 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.24.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:24:48 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/30] perl: fix installation failure because of shell issue
Date: Tue,  5 Jan 2021 04:23:33 -1000
Message-Id: <92cd97616f68dfd2fea2ad039c892d3faf1a0f32.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On one of my buildservers I noticed perl do_install failing with the
following message:

| rm: cannot remove '<OEROOT>/tmp-rpb-glibc/work/armv8-2a-linaro-linux/perl/5.32.0-r0/image//usr/lib/perl5/5.32.0/*/CORE/libperl.so': No such file or directory

I tracked this down to shell being dash rather than bash not being able
to expand this glob in the middle of the filename. So replace the glob
expansion with the simpler one which works in all cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1ea1b5c12120abdd085dc4eb69120af9258a99b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index b53aff1216..ee6eb6ef0f 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -146,8 +146,9 @@ do_install() {
     install lib/ExtUtils/typemap ${D}${libdir}/perl5/${PV}/ExtUtils/
 
     # Fix up shared library
-    rm ${D}/${libdir}/perl5/${PV}/*/CORE/libperl.so
-    ln -sf ../../../../libperl.so.${PERL_LIB_VER} $(echo ${D}/${libdir}/perl5/${PV}/*/CORE)/libperl.so
+    dir=$(echo ${D}/${libdir}/perl5/${PV}/*/CORE)
+    rm $dir/libperl.so
+    ln -sf ../../../../libperl.so.${PERL_LIB_VER} $dir/libperl.so
 }
 
 do_install_append_class-target() {
-- 
2.17.1

