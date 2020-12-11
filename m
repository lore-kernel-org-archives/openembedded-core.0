Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web11.7623.1607696903358006493
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 06:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TapJ4/1H;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id h19so13535923lfc.12
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Dec 2020 06:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbvIjnHddHFCyjZyo0ogU42WTOXhFYBhc10HJpP5hPw=;
        b=TapJ4/1H/Gu3DfOWCKaO2FtBXgqMWsbT2mJ/8wVtyI6HrfMLMxhfLlS5W16VfYNwdC
         1EdNrWX4Y/wJ3lgeUaig97jPEjqv/CzzbahOzCxVG6/4W3f1cgpNSBTjVkhH6NGhu2D/
         auaZUxf3MCJvWDSSD3dA3KhCQaXdXxeUySAjf2IuIoVxBcq2ZRoqmwuvQDwnwo70Fh+b
         7Dedvy/fBSVgq+tOCQ4akDaSgHbf40n5Dso3mChuW2s8hvQHXzl0YI1fNJUIY4GJ3zf7
         BwZ/h6r2P/7QGnVyAq52l6nq3FNCYWd5x47hxyxpCwQRFRf0X7fF/HJv3J9bttbCBztd
         0Iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dbvIjnHddHFCyjZyo0ogU42WTOXhFYBhc10HJpP5hPw=;
        b=nFE7SPxNaVkr7/Go+afAqKF2hhM5SlPC8q+zvLn19h9aRr7AZBlwQKdM9yx4EONzGv
         39TDoE3ZTCSydHZVp0bJ0ZZG61WDJjIoQeGtM+2/8KoACs8DYhGJQVleiQ1fRnYTXaSc
         JT3rbcXfoOk3RVQ6magv/cgAom9Rmdgb9pj9Qj/K3b5s6WF/ElW9kyJWgYGdAcm4EWc1
         8kg9bkCq69evWQw2lq2D3Djn0KK/QZq9AQbwZ2mx6F9mNwhS8piF2giqeur/66nbsEms
         UzL4UMagutGeeZJwjFLmJ54YN6mqBVA/gEZsfF4Kx5o+F+BLlvdC0MG2G863G+RrZBuG
         OvNw==
X-Gm-Message-State: AOAM533IJHYbGQH4r4pfqmlUFaBJ1mElINoqPvBpKuOQbfwzKY/E/5ZO
	YtNQwh+ZD+Q/+jBZ/zvo4ePxTGI/awI=
X-Google-Smtp-Source: ABdhPJx9dYwWliwaLjTBRVRtPHm1fTEB+t976zFdMvgB3mCrHkvikrUc19osmvuMV2aSJIm8y/U4NQ==
X-Received: by 2002:a05:6512:3054:: with SMTP id b20mr4554416lfb.45.1607696901107;
        Fri, 11 Dec 2020 06:28:21 -0800 (PST)
Return-Path: <dbaryshkov@gmail.com>
Received: from umbar.lan ([94.25.228.52])
        by smtp.gmail.com with ESMTPSA id l17sm898728lfg.205.2020.12.11.06.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 06:28:20 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] perl: fix installation failure because of shell issue
Date: Fri, 11 Dec 2020 17:28:18 +0300
Message-Id: <20201211142818.2755794-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On one of my buildservers I noticed perl do_install failing with the
following message:

| rm: cannot remove '<OEROOT>/tmp-rpb-glibc/work/armv8-2a-linaro-linux/perl/5.32.0-r0/image//usr/lib/perl5/5.32.0/*/CORE/libperl.so': No such file or directory

I tracked this down to shell being dash rather than bash not being able
to expand this glob in the middle of the filename. So replace the glob
expansion with the simpler one which works in all cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-devtools/perl/perl_5.32.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.32.0.bb b/meta/recipes-devtools/perl/perl_5.32.0.bb
index bba8263b90ad..3815dd44b161 100644
--- a/meta/recipes-devtools/perl/perl_5.32.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.0.bb
@@ -137,8 +137,9 @@ do_install() {
     install lib/ExtUtils/typemap ${D}${libdir}/perl5/${PV}/ExtUtils/
 
     # Fix up shared library
-    rm ${D}/${libdir}/perl5/${PV}/*/CORE/libperl.so
-    ln -sf ../../../../libperl.so.${PERL_LIB_VER} $(echo ${D}/${libdir}/perl5/${PV}/*/CORE)/libperl.so
+    dir=$(echo ${D}/${libdir}/perl5/${PV}/*/CORE)
+    rm $dir/libperl.so
+    ln -sf ../../../../libperl.so.${PERL_LIB_VER} $dir/libperl.so
 
     # Try to catch Bug #13946
     if [ -e ${D}/${libdir}/perl5/${PV}/Storable.pm ]; then
-- 
2.29.2

