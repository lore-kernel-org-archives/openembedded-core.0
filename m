Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.35821.1607956696434629771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QkMTVSBL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id j13so6667468pjz.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HnuD7+i6eTTibW5mQGGGpBZujpyJRWpQxOkJi4++oxQ=;
        b=QkMTVSBL3sDpKV4U+l55AikhTeJ5co6lJmi1yRqrevKlVHWP8TuddFYupmYuLx+SKe
         N126YQE7UbTVAcwdnIYMf8qOMear30fIa2flynVQrCJ2BzD5XrIe1qZArtxnLceiKQch
         wKIJcs+Q3WAMQRH2dU9ECXhDLhkXZGP8ViijuOnh8nWOYc3XzwjYZ0Igv8F9XY7I9wjA
         vxk8nAxiwwzO2fe8dXPTk8Cc//V0m57OhjCKolm7d/N5nVcsTOlO2ni3IJrKa8wMEb5E
         GCA+MuvI8VXiERVVEYdOb/dPnSw3YGEyTzN0zJE3Ct3GxRd2kD8eGWHkxtW1dhgdEbHB
         TwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HnuD7+i6eTTibW5mQGGGpBZujpyJRWpQxOkJi4++oxQ=;
        b=acLUd/tO3F1uOAJihJ1pwIjariwM/4DA+kUYB+9R2uGZ6ZEjXttVl3Pygq5GjXBHGF
         Jfa04QrFCj4EthfGHjtnonMpAG/PZMpZ6T+qqwFnJIAvvppAYRjUjxDftsduMGwYAF6/
         8OoYWKkha1aGtTIqBM/yUYe5XJXrj0cIyKLGM3eu7+gQdUDj+3cAfQZ2cvlWc4M/aQxb
         in1lPhYjEN1r8BqScFDr3LmrLDSVNFwXwb3DKbdYz9IW7v7HHaDM/GEYlZLHw07xHNwL
         87Sx2beMRAbQEDMKdj/7a5T35dzXwJQ4zsIejeZzIvBPQlq7tBltFKlUeE9xpQ9WYkWh
         Gn6g==
X-Gm-Message-State: AOAM532kIie2PlvNewQb79p+zd4dz+2PG1Ojdnx9V/A17sQroyazBMjc
	k3c5N9Ogsril720+Md6veQMTqxKROv+xgIVk
X-Google-Smtp-Source: ABdhPJx9P71APQqiz+2gZLPd3DcO2dj5rhWFF1DtCapwglBVx6LkpBTwfrL4rtA2lYjziy2bBIGtmg==
X-Received: by 2002:a17:90a:a485:: with SMTP id z5mr25820234pjp.160.1607956695570;
        Mon, 14 Dec 2020 06:38:15 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.38.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:38:14 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/25] buildtools-tarball: add wic dependency into extended buildtools
Date: Mon, 14 Dec 2020 04:36:52 -1000
Message-Id: <0dc25d88658461b71bd62a14a809cedf16e072bc.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

fix below error:
wic ls ./core-image-minimal-intel-x86-64.wic

ERROR: Can't find executable parted

wic depend on some tools like parted/mtools/..., and we have those
tools in native_sysroot. so above problem can be avoided by
run command like wic ls imagename.wic --native-sysroot <path>

but this cannot cover condition that usr don't have build the
image, the image just copy from somewhere.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c0eda6ec09395f3a04cb80107a3ca33a063b21f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index c32d0107c3..0816486754 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -29,6 +29,9 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
     nativesdk-libxcrypt-dev \
+    nativesdk-parted \
+    nativesdk-dosfstools \
+    nativesdk-gptfdisk \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.17.1

