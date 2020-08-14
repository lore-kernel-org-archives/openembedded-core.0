Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.47.1597438006928690782
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 13:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=cFbJBOMU;
 spf=softfail (domain: sidebranch.com, ip: 209.85.218.66, mailfrom: leon@sidebranch.com)
Received: by mail-ej1-f66.google.com with SMTP id o18so11264299eje.7
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 13:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RIBK24+clRg/bIPMzMT5JnbcKkiyxkkXi6FA84mMX38=;
        b=cFbJBOMUp/It3ht28GJqQfBswdQZW0RgZpsX+mfTW4nNFpVrm5vIzWPrmtc65IkVa1
         4TsVH1rgWC2u+JqOqcZYqsTQrN1jRP1ppf1aX96VrORKBqOXGRCNl96KtWRbT/pZ9EpJ
         N0tUm55qjVNdG33m1SI76LsMDSKFFBOc17t8ZST+57wiCiYuHPNZfr/7kb1rqGej1E7V
         oz/rlPu7JShZo7PK9p/4D0a0S1w9QbqMYzLJXlSSTUsqnQmVltVm/XrtigGgcHkRf3nE
         a3XIWpYdHKsWBfMJsUHq1rRD3UYsdQHk17ZHQVUZqFLyZmcwFJGRGeXa4CQjLhbXNphy
         yyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RIBK24+clRg/bIPMzMT5JnbcKkiyxkkXi6FA84mMX38=;
        b=lbdpNeNJHuZTz+zkXx7eVeNfVH/zlHBj9Xi1g4I14Ha93CqbBIsw0W438rIIhlgASh
         B2ABQUH1/irwjdY3WyNJCHhMgHENawpRG45Q4n1yoKrMIaENgEfjd40IpRjYOmYkNIUZ
         Ab8nnNqb8SNIQ5Vq1Gva7szzJrcp1qikj7MTfMT8EtiZTduSezBTRK4M71oH0Z3+vN0e
         VtEF7wz+KJwHgsgyjT73JUFt+jnLLtMgX4BK+TKnH3VIzmbNsWkIcco3Qo5DOWhlHGBj
         FkcIQImXIXtPXGKnHsCA944B/h331lUfuUpo6mqvDk7fo7x8RI/hZh638pRrH4rc/R4R
         aWtA==
X-Gm-Message-State: AOAM530AwVnqdvKdGAbuPu9OWcwoFJaI4PehAtuOSKNShzDB/VYyGNv8
	cGFlowPnzXfhhRqwWrWtY9G7IIEz19FwLA==
X-Google-Smtp-Source: ABdhPJyFMOuyZw5U9uyHU9gj7ys2QLOwgTLOLMJo85dKrucNnGD3k5o9QOudiYM9LY+jq165lVHrHw==
X-Received: by 2002:a17:906:260f:: with SMTP id h15mr4118656ejc.48.1597438005019;
        Fri, 14 Aug 2020 13:46:45 -0700 (PDT)
Return-Path: <leon@sidebranch.com>
Received: from localhost.localdomain (145-130-96-189.fixed.kpn.net. [145.130.96.189])
        by smtp.gmail.com with ESMTPSA id lc10sm7426563ejb.22.2020.08.14.13.46.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2020 13:46:44 -0700 (PDT)
From: "Leon Woestenberg" <leon@sidebranch.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [OE-core] [dunfell] [PATCH] cmake-native: Use cmake-provided zstd library; supported host distro zstd may be too old.
Date: Fri, 14 Aug 2020 22:46:40 +0200
Message-Id: <1597438000-20251-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cmake-native uses the system provided libraries due to:

CMAKE_EXTRACONF = "<...> -DCMAKE_USE_SYSTEM_LIBRARIES=1 <...>"

Now, iff the libzstd(-dev) is installed but too old, which can happen on Ubuntu 16.04:

dpkg -l | grep zstd
ii  libzstd-dev  0.5.1-1
ii  libzstd0 0.5.1-1

cmake configure will use the zstd system library:

cat ./tmp/work/x86_64-linux/cmake-native/3.15.3-r0/temp/log.do_configure | grep -i ZSTD
-- Using system-installed ZSTD
-- Found ZSTD: /usr/lib/x86_64-linux-gnu/libzstd.so

but will fail to compile due to:

<...>/tmp/work/x86_64-linux/cmake-native/3.15.3-r0/cmake-3.15.3/Utilities/cmlibarchive/libarchive/archive_read_support_filter_zstd.c:59:2: error: unknown type name ‘ZSTD_DStream’
|   ZSTD_DStream *dstream;
|   ^

The library does not contain that datatype:

grep -rne ZSTD_DStream /usr/include/zstd.h
<no output>

Apparently the cmake-native library check is not checking the library version or features.

This fix is to not depend on the system library and use the zstd library provided with cmake.

CMAKE_EXTRACONF = "\
<...>
    -DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=0 \
<...>

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.16.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
index b2952ee..e0ac3f8 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
@@ -21,6 +21,7 @@ CMAKE_EXTRACONF = "\
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=0 \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
 "
-- 
2.7.4

