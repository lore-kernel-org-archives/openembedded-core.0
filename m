Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.792.1589820560052741432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kZaDRgzx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.67, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f67.google.com with SMTP id a5so90168pjh.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=BYxVnOFJ3Xad1NYqqYepDKwQljbV2c+/HkgiJa9m8ZU=;
        b=kZaDRgzxYz4VHD1aOaj4SV08jcsH+y5XhKgelg3DXcoyTPrlt27bkjWSqJmdM/oYpj
         BG7o2p64gM90iPBfW6n6HSnzrtm2tltGqAwVY0dir+oOZplxzAPNUpEwP/ytEqKfbYkx
         zbwHvYfdG3ZgpIFwphkrOqOww2k3uEi1UCe2vj51UWKiJUH2+pjuAfKNRfGDoc9aGFMy
         nhtHWc/4Wms3eyazGn3EDaHVxYY270/GJPfEpBfx8c8ZIZN3mz8Jwqnt0ENcz3qkHOBD
         uBpEvJgSXm4bYOqlAzLdRRRSl3vIdPh5Ice4yr5bht24Tlu8/74m7g8/KF65QOq+HINI
         E7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=BYxVnOFJ3Xad1NYqqYepDKwQljbV2c+/HkgiJa9m8ZU=;
        b=uZIpat67pkChQfSOVg8D0CIIKbigEePDFAq8ukvq7K/vog6681j4k4/F1+l+dQlYjJ
         EOWL3pKI4YwP/7Q18evWcEd+VXkOLA47yZUo8IYyLHRpvksDzBQphCSvyMBFblnkAVld
         oXHSTwFsOVTsQ2B3A1y70QwARjxr0ZfkrrbCIgrWdX9qtXDoMeqLzaow2KlXVgVVIaWo
         sPY5Hc1q3diojBaOqDevEG7HRqESrgtkpeVpPEZN3fiTguEFlXB41XhLRUp1rDSd6rgU
         Rik7gckNFzbOhVznvlanVYiKllxX815u1lHUxvsZ8qbtAk0EfFJIz93rBHMtkmJl9yHe
         VYng==
X-Gm-Message-State: AOAM5321blfC7mNY3TU2Baw3vG8wxZ11odyL/20ms/yyCe65l0aiO0Dd
	tRwtcd7SaXUb8oOr56ehDtaw3WXNj/sT2g==
X-Google-Smtp-Source: ABdhPJx9AHH9IVsjO9zwAjo+NdT6OPVT61okTnGTaqWaPufkETw+FZbJKWl+UvhMPSoZWoshGjuiQA==
X-Received: by 2002:a17:902:bd07:: with SMTP id p7mr16444799pls.293.1589820559129;
        Mon, 18 May 2020 09:49:19 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:18 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/19] opkg-keyrings: check if opkg-key exists before run postinst
Date: Mon, 18 May 2020 06:48:26 -1000
Message-Id: <174c27e4edea0af92f60779cf3f63d21f6bce6fe.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Yi Zhao <yi.zhao@windriver.com>

By default, the opkg-key command is not included in pokg package because
it is only installed when gpg support is enabled. We'd better check if
it exists before run 'opkg-key populate' in pkg_postinst.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb b/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
index a20e316a3d..07e2402545 100644
--- a/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-keyrings_1.0.bb
@@ -36,5 +36,8 @@ FILES_${PN} = "${datadir}/opkg/keyrings"
 RDEPENDS_${PN} = "opkg"
 
 pkg_postinst_ontarget_${PN} () {
-opkg-key populate
+    if test -x ${bindir}/opkg-key
+    then
+        ${bindir}/opkg-key populate
+    fi
 }
-- 
2.17.1

