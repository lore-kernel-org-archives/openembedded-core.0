Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.16965.1605656933960777696
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HoZj4+yx;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.47, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f47.google.com with SMTP id l20so5196348oot.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 15:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+J+5IszVyKQANmn6Ur2uTgwGzoDsSjoQ2DtLcBPi/V8=;
        b=HoZj4+yxcNX3+0PtNZdv3vp6ZjfY2jNoKWUrddW+K8GAGinbd0cq4OHoZ268p9B+hr
         3onnQNMFWEOKelq1frORT9mZHQCiaR+CktoJHFL2OXC6Jw+CoIX+PhjSybcMUl4lA3DX
         TDOq/rAgNk+t32GxK+V0hSJIMqQofQlrx0jVn+eJzCLHRuqmsKpiYA9d9tEBZDG4IBZp
         wne5SNNkcc/RQhDjhsA9Sw17fRx6KJOQY8G5zo7BAb8gJeUFavSb6ZEMSd4BvfgdfDoD
         Od/6aND4qYDNXMD/Z1cxE+87Y1EamRNBGRJ3nP53d2q2o59uHLgwT6S6M/VcenWuzSpv
         N6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+J+5IszVyKQANmn6Ur2uTgwGzoDsSjoQ2DtLcBPi/V8=;
        b=WO4LDm1FsMMZwhEUG1/rgUVHhBAj3MW+8kFXS9j8GgKJl9QJECh1WhWlUOM++crn7v
         QQVBV5/ZFA4dYVxreArABj7i2d0WW1arkf1y/4NCC2NH6q1jZ7qjRKn4M6+qCjgSk906
         1ytbTmIZRonFggY2BigmFZiTesMyVMa+SjEy3297DE+bPWwt/f7Wrures/2b4sS2XETO
         iREeEGq4MmGc2Wcl74+N2ukYp3rH27o0hyBWLsnzPdIR2wA6f7gia83T4WBMotTo9pJ8
         Cmb3JgDnENVXsS/WR5SeI5VJaoI5hk0Gpovz4ycpQ2yBAXbH3TiJLeXgsqsnfKgVSISp
         xazA==
X-Gm-Message-State: AOAM530RhFCMSXsLNTiY9YonxzMT4RF5o0A6IIWkwqLZ4ElsAduTKq6O
	Ohs52TNBJEl9t4df0HH6W1NiRAeFlZTGRxf6
X-Google-Smtp-Source: ABdhPJyASuB8Tna6rc8ucTqQ9B/lGWwxzvJg+aHPBisiBxDvAP5y9y/JB/fPLkmeejHGA0kfAlXAyQ==
X-Received: by 2002:a4a:d9d7:: with SMTP id l23mr4611755oou.91.1605656932905;
        Tue, 17 Nov 2020 15:48:52 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id s131sm6715936oie.58.2020.11.17.15.48.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:48:52 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 9/9] python3: add ldconfig rdepends for python3-ctypes
Date: Tue, 17 Nov 2020 13:47:39 -1000
Message-Id: <84e1a32096db9deb98d282a652beec95dbfe80f1.1605656725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605656725.git.steve@sakoman.com>
References: <cover.1605656725.git.steve@sakoman.com>

From: Mingli Yu <mingli.yu@windriver.com>

The ctypes module needs to use "ldconfig -p" to find the
library path and it simply has below logic if no ldconfig
installed.
  except OSError:
      pass

Before the patch:
  >>> from ctypes.util import find_library
  >>> lib_path = find_library('archive')
  >>> print(lib_path)
  None

After the patch:
  >>> from ctypes.util import find_library
  >>> lib_path = find_library('archive')
  >>> print(lib_path)
  libarchive.so.13

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ddb96902a124a6e1f035f0fd868b0139989bc1bc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.8.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index 169bc87988..758ed87546 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -345,6 +345,7 @@ FILES_${PN}-man = "${datadir}/man"
 
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS_libpython3_append_libc-glibc = " libgcc"
+RDEPENDS_${PN}-ctypes_append_libc-glibc = " ${MLPREFIX}ldconfig"
 RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
-- 
2.17.1

