Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.14929.1602253161630411933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=x6PJeQ/U;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id n14so7005559pff.6
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rD2fQvmQ7Cy1ylFmIuBn5fhWfmpVd7T/cML5e0JC30c=;
        b=x6PJeQ/U5r5G6EHUjiWS3eJHNcK9x0AHajRgep8oFUqFiWOJF+0K7grJWQbwmpO9cY
         ioVmD/SNWL1zHAg7RI6jh+BQIbYhZdvJ9yUSGua3HbZj61b/EszRcwrn7gJkRYmyv1z5
         zHagJ+l+bT/oTtRIX6cZiR9VrDxlomNbXCvS77SlYCZhIiYYZnczbxwDLas8gRr0pDoV
         pyDEK+9oCqPuwN1hy50E9SzI0WBhu7l7WmWB2WByNAn8vTKC7SnA5G3mFqo9JNfFftga
         cCazwVzrUslQiUOzIxldBs6J+KYUYEwHL1GSsgXVdYSgPY6UOhEb9aRhxv3J4nKr51oA
         oJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rD2fQvmQ7Cy1ylFmIuBn5fhWfmpVd7T/cML5e0JC30c=;
        b=loS4TRzvJGajpGS6gHJTWtizmxlYg44iEta/F3iIUmafWmL5Jbtua/f33oxTIHao27
         poa52pFQjfd8kXuTqFBeT4da6PVsAoDXNO0EDiy0m3hCysSg1VTuTk2fwgDi9QdkxzAh
         y5uFTusDt3vfl0TGiXvR9Y+LFL7SQDYGu9XEQgofT4eKEBDHC2fw9BVYM5/YKoV0ZsrS
         qJP8qP8d7YVxNYFWzgWTiYwVp7sswTgqrr5Dvp/EZY3zOSxjk1rJNDDRvzN3eI5UZW0p
         CyRWeyDzk5OtLcGutjJKAoplcRvPe0BmQVWyoFwHLaEd5GLhCXI1z7Fb3mSDHoHah6jl
         6+uQ==
X-Gm-Message-State: AOAM530W+0Qy0xOpedr5ZXGVWCrqRgB7ipj8qfAIEripJ5yxfSiR62D5
	rM3gVFUdVQXt01afxTtTND6gV4iENWRFFYE7
X-Google-Smtp-Source: ABdhPJzJP2EBrmdy1cXvMECV5Zw/b+DysbF7/w9mEBssKyQXbv4zEPJHR4bf1WYkPySqR2Hc9Q1sBA==
X-Received: by 2002:a17:90a:d596:: with SMTP id v22mr5080175pju.146.1602253160727;
        Fri, 09 Oct 2020 07:19:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n127sm10736116pfn.155.2020.10.09.07.19.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:19:20 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/14] glibc: do_stash_locale must not delete files from ${D}
Date: Fri,  9 Oct 2020 04:18:41 -1000
Message-Id: <7325222ce0dc8a75bc2d3eb7b6049f0d995ce17f.1602253014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602253014.git.steve@sakoman.com>
References: <cover.1602253014.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

do_stash_locale doesn't run in fakeroot context, do_install does. We therefore
shouldn't delete files that do_install has added or it leaves potentially
problemtic entries in the fakeroot database. Leaving the files around
doesn't change or break anything else.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f18817f5340d06f7b4bb846a83b48731a1b9c4bc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 285a9aa2f5..7854f2a156 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -192,7 +192,6 @@ do_stash_locale () {
 	fi
 
 	cp -fpPR ${D}${datadir}/* $dest${datadir}
-	rm -rf ${D}${datadir}/locale/
 	cp -fpPR ${WORKDIR}/SUPPORTED $dest
 
 	target=$dest/scripts
-- 
2.17.1

