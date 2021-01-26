Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.12882.1611672194463557750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YBUM7HP1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id w14so10535780pfi.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TtumOSJ9i/2uUjXHdWAGoz81J974N3hbXNq7TOtNPKw=;
        b=YBUM7HP1XR5hd4ilgIKQVFvhlT4pbUemxNnUdcyRl0ZRmJEXBWU43fXjpUwNMp15EY
         SDVdrR6O1wQEXF+qzWLkoxwnwu0fpl68hj/MoF5MipjQHEy+XAxg3bFVkEPgPchOyUQo
         cLS50UEbfhK+wnjMKM41Rq1IVw6YLqnkXDtyqDe64cfMvI8Y3+VjR4I+yctDy+t917bR
         XZEdSkQZS6huec984WJMTzSTWL4SoUHKkqQdzOkgviOVSzGhHhtUnClXPzvz7tUhqtb0
         cXV0acWIkjUYsDEjdAs7r7zTiYso/LBlog9DwAE46fnR6x9McniIGmbhOpKdmFYWDXkx
         yc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TtumOSJ9i/2uUjXHdWAGoz81J974N3hbXNq7TOtNPKw=;
        b=la7TFQJyL35S15qNdIpgK3o80qY00plBZw04oBP0JBsqJCl380kv6eUPkniWK8UxCU
         U9eWthAG7nGQuKhwou5rFPhK6OHJTL9B5PNMocxzcXl6dsuwkCPxN3+UPSPS3cEE6BWs
         Uaooch4RAUFqZrXU3ChrUPRSqPeGABJYKuIvBXovWYgiHvPKVXNCfz5NLy0Tw9k8JlWH
         wpsnmxYvJFCpE9f22I9rkwUyDCRy96VxCJPHTaSyzrdUiUd/YpMe92EFUjbf1ryOqbdu
         pk//XhLbkSp1MFzslEHmsBb0no8gO63h3IlHEZOzP3EqRS834soolmeo86FD4aNftvSs
         2sjQ==
X-Gm-Message-State: AOAM530O9dTJBdvH94zxkiaVjwFv+PMxalIarMoJ3Z8SjLLAm2SOAmg1
	6IlzGL8zV471MlXjhF4KFlIlOV5Opmm4Hh05vNI=
X-Google-Smtp-Source: ABdhPJwrQ04/GTiCZ81v5P1MNWZuPBhKgNikJ7SY+rJD5QFSyXBB3PfcwVrXg4IX8UyZH7jABTfURg==
X-Received: by 2002:a65:5349:: with SMTP id w9mr5867800pgr.250.1611672193560;
        Tue, 26 Jan 2021 06:43:13 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:12 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 22/46] base.bbclass: use os.path.normpath instead of just comparing WORKDIR and S as strings
Date: Tue, 26 Jan 2021 04:41:33 -1000
Message-Id: <6df6b19712580a7ae1d2d6a1e15dd39e704d23bd.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <Martin.Jansa@gmail.com>

* cannot use os.path.samefile, because S/B might not exist at this time yet

* there is issue with PSEUDO_IGNORE_PATHS when some recipe sets e.g.
  S = "${WORKDIR}/"
  whole WORKDIR gets added to PSEUDO_IGNORE_PATHS and then the build
  can fail with various strange errors, in my case do_package was
  failing when do_package calls:
  fix_perms(.../1.0-r0/package/etc, 755, 0, 0, /etc)
  and fails with "[Errno 1] Operation not permitted:"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50b11a61ab29acb8ec990668353e0b7305114628)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a710abdbd7..65b9d954c7 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -388,9 +388,9 @@ python () {
     oe.utils.features_backfill("DISTRO_FEATURES", d)
     oe.utils.features_backfill("MACHINE_FEATURES", d)
 
-    if d.getVar("WORKDIR") != d.getVar("S"):
+    if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("S")):
         d.appendVar("PSEUDO_IGNORE_PATHS", ",${S}")
-    if d.getVar("WORKDIR") != d.getVar("B"):
+    if os.path.normpath(d.getVar("WORKDIR")) != os.path.normpath(d.getVar("B")):
         d.appendVar("PSEUDO_IGNORE_PATHS", ",${B}")
 
     # Handle PACKAGECONFIG
-- 
2.25.1

