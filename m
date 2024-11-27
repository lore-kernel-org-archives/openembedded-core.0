Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A05AD6D23E
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 21:27:03 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.81988.1732742821340095309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 13:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mmyT9JNp;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b66ea49407so23887885a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 13:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732742820; x=1733347620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ikCt4NCAWwzrVlQcArMmIZXKZrGRKXrGuRCw1ObwBWs=;
        b=mmyT9JNpYH6GMEpKkI07lMu0iBS29UXNr0ATj7A9pMTJ2AQ6LV7dspfWnqPCFJpxwR
         ZlIt13ZpWrjOWU0bRvZmZnY5pnUEw2D3jYD8PG+df04aWCM/tHo7QWWBHqZUN04dxrp/
         Gs8P9Qg9dDXm7PdQkOyY+D1Don1amXc1YNM0+Ilk1gwDqVsqY+9eSUOOAV2ukc9hodAJ
         xuos3B1BOksIRPHNGs/byYadIHaz7n4mBxP2sei45AegGI4FPM8vf2LeHFWXjOCi+p47
         xdckLY/oOXqG4RZGXJ1zlBD7hlgFNj+riy0HnLSEbPhPx4q7MTUo9TEYMhDq66Ih3Ydv
         Facg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732742820; x=1733347620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikCt4NCAWwzrVlQcArMmIZXKZrGRKXrGuRCw1ObwBWs=;
        b=JQB5NAk16dWZXCT8kVIwtqyHqweowyg7C3sQygbel1lCs4bHOFlNUH1u4no5fWm4xu
         pQMQNBzZYqAZs3vFmWL0oSZ+5hJxJHqqfYH47I/ph+r3IYoxZaMnDKtGzrvHxTLb0o+S
         8aIHsHaqVjiiqn3bJKo1Gt7WLrAIOGw4gjupX0ZNRu8prE1MvYcbJQ1pGbfbHR2m+hFc
         YAhkbGAc1JeVEd3UIVWSHy0SMyRWxEDmRjJmBRMzGD0OmGsD/tE9OjAg9QupU0qBFnPn
         Ho6lIZNCBI7mkgCa8MBHCpzQX/cfvxLg6Sd02t2eEw+qRgJxqK8U8w/N5bBgGSlr5X2L
         YwzA==
X-Gm-Message-State: AOJu0YyduqAEaPwUyqS8/9Of0bdHyCxA9ng5rXEnoSIVTblYEunT0oiG
	DLn85ZhlzXESGI7tH9VRoS8z3Lh05PLY5GimlONSe+jxIVQZf9Wa5ZAANzvsBJ3I/8grGYD43nH
	/
X-Gm-Gg: ASbGnctubyrbGp+FbJhkMN2E85wDOwJTbJZYgfDULi5+AzctcHH+o0kW1Q7XS1KXYo7
	ICQG8JavVCVyJ0w3TBb1YA+bqOkaWmckfts7h7gRYWDsOLzgBXBOswwpx6QlPvJbFDbz4a+F08I
	OPD7kor2yMITSVVx5kgmRdfaf8MLwGb2gCEQwppazDBjyhoqfYeUQpc3JlWMQ/bsjtD7422G4h/
	irlj+CZGtVR1aTmhMrVOBgxM1DPcpYAMJLzC3HgW1FderkdH4FH+PDHFRaEhhoFgh95eI2ntvFU
	OVwTUYGwYlU0HBwovUCwTv9CcE/ALsY=
X-Google-Smtp-Source: AGHT+IHWUkqRaKUb7dbbl95/uw7EFvpfT3QZu9WvxwRNEdb/9fKRrRlJzAZvmH2l3jv8eiPiZphaVQ==
X-Received: by 2002:a05:620a:190f:b0:7a6:75e6:3c21 with SMTP id af79cd13be357-7b68396134dmr144865885a.1.1732742819509;
        Wed, 27 Nov 2024 13:26:59 -0800 (PST)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c3ed11dsm73972531cf.21.2024.11.27.13.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 13:26:59 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH v2] python3-numpy: inherit pkgconfig
Date: Wed, 27 Nov 2024 16:26:56 -0500
Message-Id: <20241127212656.1195916-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 21:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207966

This was supposed to be added in oe-core commit fd656aaf7fbe
("python3-numpy: upgrade 1.26.4 -> 2.1.3"), but it somehow got missed in
the final version of that patch. Add it now to fix possible do_compile
errors on some systems, due to host paths sneaking into the meson build
options, e.g.:

| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Program python3 found: YES (/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/python3-numpy/2.1.3/recipe-sysroot-native/usr/bin/nativepython3)
| Did not find pkg-config by name 'pkg-config'
| Found pkg-config: NO
| Run-time dependency python found: NO (tried pkgconfig, pkgconfig and sysconfig)
|
| ../numpy-2.1.3/meson.build:41:12: ERROR: Python dependency not found
|
| A full log can be found at /home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/python3-numpy/2.1.3/build/meson-logs/meson-log.txt

and notably (meson-log.txt snippet):

|x86_64-poky-linux-musl-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/media/build/poky/build/tmp/work/core2-64-poky-linux-musl/python3-numpy/2.1.3/recipe-sysroot -I/media/build/poky/build/tmp/work/core2-64-poky-linux-musl/python3-numpy/2.1.3/recipe-sysroot/usr/include/python3.13 -I/usr/include/python3.13

A bug has been filed about this and the related gcc issue: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15672

With pkgconfig on the inherit line, all include directives in
meson-log.txt end up looking something like:

|-I/home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/python3-numpy/2.1.3/recipe-sysroot/usr/include/python3.13

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3-numpy_2.1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.1.3.bb b/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
index da75dff1e04..0120bee4390 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "aa08e04e08aaf974d4458def539dece0d28146d866a39da5639596f492
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
-inherit ptest python_mesonpy github-releases cython
+inherit pkgconfig ptest python_mesonpy github-releases cython
 
 S = "${WORKDIR}/numpy-${PV}"
 
-- 
2.39.5


