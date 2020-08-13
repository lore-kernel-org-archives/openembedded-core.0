Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web10.8244.1597319545061649108
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 04:52:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=GsoBS+9M;
 spf=softfail (domain: sidebranch.com, ip: 209.85.218.67, mailfrom: leon@sidebranch.com)
Received: by mail-ej1-f67.google.com with SMTP id o18so5840662eje.7
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 04:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G+AC3aoZyGMKG9mA2i7HxHWxD3Ts0oeKgkTPgeQ1gWE=;
        b=GsoBS+9M6tXsPtgaN04pH1LewBx5GqVlpKIwOSnf1jn6O/i4Tz5eVrlITZTkyL5kjv
         A/lOpnyApNy2qXq/IA4I+OARcEiHZ10I+eqX9W1pjt5gcTbyTaXCm4Cgcd68RoISZOho
         yX53P4gmBYAi21FCcy3PQPJzOL4ZCRExdBgTTLVP/GHBZIjPO/DSUbcLfqBasYMV3lb9
         FzRpK4h8sdTGwIEkqjxa+rnAiEGnNX5QK3B0nEy09iEBbQq31nn830aTKy6N698CB6nf
         2ezD1KpFHzCRFAhgSJU7Ffz2+Gqd9GsMHl1zJjkpgAiexFAN8Go9rVk4KsI6Ntpr2YQW
         ArtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G+AC3aoZyGMKG9mA2i7HxHWxD3Ts0oeKgkTPgeQ1gWE=;
        b=sqADLqbHuFnVpEqiGO/0igAjsuA2mSCG14RlYuAEyTu70+rQdSk1F0ng0bAzxkWqmE
         p16PtvvXIs/GRA46m3UTO0htntpxhphBpBBdTOKQPuThUqIbHbjT3h2n8dbsR6OuJZM9
         DjyvCbzk80wqu/8cNhPB7xRklIknLzZs3VyARcSo/160yg/29bncMhrJfiTUDhRL3230
         oRUOMMxecMePlpF1AGxUjPIS8ZaK+d9WL7MVF6FoqaptLut6CE2tZTomtP6hLeq7wJLn
         uoUgQGZ4PW9h8fMpW7elAAv42BRVOJXaZaSAuSEjJAkFOYBDN0zTu3vVi3AUaf01rqwA
         CrTA==
X-Gm-Message-State: AOAM532TSNPVO1q2sHzTq8Hab2La3Zkq5ZrbAuJTuY0hV4grRDHehc8x
	PiCAaen3wetIIhF9hZVgw074o0j6reU=
X-Google-Smtp-Source: ABdhPJxVYG9LzAUeAcRbMzAcpRnRAS70/8PWjSnBnNYbzz1feuwV+ukZvu3iCLcuuUITkykaJrnwvg==
X-Received: by 2002:a17:906:ca4f:: with SMTP id jx15mr3555119ejb.449.1597319543056;
        Thu, 13 Aug 2020 04:52:23 -0700 (PDT)
Return-Path: <leon@sidebranch.com>
Received: from localhost.localdomain (145-130-96-189.fixed.kpn.net. [145.130.96.189])
        by smtp.gmail.com with ESMTPSA id v7sm3893146edd.48.2020.08.13.04.52.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2020 04:52:22 -0700 (PDT)
From: "Leon Woestenberg" <leon@sidebranch.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [oe-core][zeus][PATCH] cmake-native: Use cmake-provided zstd library; system library might be too old.
Date: Thu, 13 Aug 2020 13:52:15 +0200
Message-Id: <1597319535-5254-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mint 19.2 (based on Ubuntu 18.04.2), if the system library zstd is present,
the compile fails as follows:

<...>/tmp/work/x86_64-linux/cmake-native/3.15.3-r0/cmake-3.15.3/Utilities/cmlibarchive/libarchive/archive_read_support_filter_zstd.c:59:2:
error: unknown type name ‘ZSTD_DStream’
|   ZSTD_DStream *dstream;
|   ^

cat ./tmp/work/x86_64-linux/cmake-native/3.15.3-r0/temp/log.do_configure | grep -i ZSTD
-- Using system-installed ZSTD
-- Found ZSTD: /usr/lib/x86_64-linux-gnu/libzstd.so

grep -rne ZSTD_DStream /usr/include/zstd.h
<no output>

The fix in this commit is to use the cmake provided zstd library:

    -DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=0 \

so that on supported distributions, we do not depend on the system zstd library (version).

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.15.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb
index b2952ee..e0ac3f8 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.15.3.bb
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

