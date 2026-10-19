Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F601CCF2D3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 11:25:42 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32077.1792409133630081108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 04:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k/90IKPr;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so13117645e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792409132; x=1793013932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXYiSmtcX3fTpv8voodIhQD8KlUngesNiwVbEFaPmjE=;
        b=k/90IKPrb2EK5KVLfmXEle+CsA1ayNrZb2l6O46K6bRRJcDVjdJrXwSSTPHuthu4eG
         yvSfzCh4+zWi+vHX0YgY5cypettsgTTFmFBYnGNbO/bCMTWO0JAUlOyrD0wwwl/Z6iUn
         xw1lu6+r6di5mcqgET1nr3gMwADGZBw4NtdFXFZLidaxVYwyDmnF39MZ+pMCXeVC/Rin
         bU00DGjV3x6wzGyovCmiR30ykGKIeaZlPeSFaFaxviH9Bnar1qQdAgLTeMbdG1j49LOh
         yre65S6WJtC8utloUmICwHKIb7vKbx0fdgG0FiUuQoesLpu6MptR3ebwBhjGTOv5+vSD
         BiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409132; x=1793013932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXYiSmtcX3fTpv8voodIhQD8KlUngesNiwVbEFaPmjE=;
        b=SdU+9gHFPz9iJyZMtner8GFQXzKAYFADH5KFdj4TIZ7tDjLWZ1B8jZEhIxU/1wBCqF
         oDpW/4KIqWC5Pjf5iIr4A+0U8K/9OgrG7mG/cVQMKTWrXj6ZoKnTfXSD4BcewvFmYZ5N
         eVKVeoNMC5/KCHEYhm4P4WoA+MVjg6We0tgId93qlYBE5NkEYffDyO87StAe7GSb0FWi
         VkQ2anBOHbE3DMzMRlHk+gtO5vkTB4v+ERFIrlmiLCm1lEKWAdj2xGCl5blsPq/aXgNO
         2G8lI8sFlaQTp+D7GiCVKC/IKT3vDyXcniwVvFyaf9R4P7/IolmYIxO36hL7S4OIFEvo
         eIAA==
X-Gm-Message-State: AFq9FYLbBVt1TY+wUdyc4+r1fA6RvoCEtzbHoBkcuFnJO8UjG1qKmaWc
	maLhYIUgq6j9yr+j1HZNAjTtpmHsGr/eLeuHKaPzC1wD0J6FvRvh7LeGtslRCA==
X-Gm-Gg: AYBFou12u+GVOHNgxOveZSnffizMt09lGcvCjlm/KWXwTg6dx13//BMhrfYKAxvoGJm
	rr8X6vvy981sg2L3q8e/KB5Dv3VxRDuzwGqPNCZGsdnRO30XIxzFEsDZ4a0T4EAZQ8AvS0Vt3e5
	+ENX7f/dZAQ1tAXwXXsf+/qwtyXVDmhJWTvpyDT++bHMxW7Xjb/nK/DjlOfBOGMOUYk87wxHhk7
	VsA6QttC2kjyXofZ1GnjnIDAQZKdk/m0WbuCOBGGVuwKDlo8kPHqkPLGO9arUe902qR6GxBpEjk
	sVh6Z9VV5T8HPbqvhPvuzUKU6qvwruT7Ka1Iw5ZpygAhNzpLI8C4Hvh5RXb+e+pXOxhUxY0Wfem
	3y/R/0nARitONUvyYqNbC1x//bXukgTBSZLgTgYr0sBDlsvqurdPlsHUFCBsVKVEQwt9Q7cO6WA
	sLxjxNwCq1oPakafU7vnNIqq5JuzrEFbofZdVF5mLaCJJW2u9KvLXXaCVhz5XpZ/x2jZ+Caf0wV
	3ZVWV9/SKJJrXxqOOGTqrzBI9pq+isROaWh5mxafuX+1IhB617suNA=
X-Received: by 2002:a05:600c:4f42:b0:4a1:ddca:8b66 with SMTP id 5b1f17b1804b1-4a1ddca9066mr155256585e9.31.1792409131378;
        Mon, 19 Oct 2026 04:25:31 -0700 (PDT)
Received: from localhost ([109.238.212.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm25175733f8f.8.2026.10.19.04.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:30 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	mark.yang@lge.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] clang: use Release instead of MinSizeRel
Date: Mon, 19 Oct 2026 13:25:17 +0200
Message-ID: <20261019112517.1676091-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 11:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248158

From: Martin Jansa <martin.jansa@gmail.com>

It was changed in:
https://git.openembedded.org/openembedded-core/commit/?id=ea9b33f7c12f773830ec860ae817a3ed1368612b
to save the disk space, but the build time impact is significant.

Both llvm and clang recipes are now using MinSizeRel, but the build time
impact is significant mostly from clang recipes and also the disk space
is affected more by llvm, than clang. So change the default only for
clang recipe. In theory we could use Release only for clang-native and
leave MinSizeRel for target clang (assuming that most people don't do
many demanding builds on target, but that won't be true for something
like build appliance built with OE).

chromium-x11.do_compile time with 64 thread AMD Threadripper 3970x
increased by 80% from 6930s to 12300s, measured in wrynose release.

With current master chromium-x11.do_compile time is also around 80%
slower compared to both using Release or 66.6% slower compared to
clang using Release:

MinSizeRel in both clang and llvm:
20.09user 2.56system 3:05:09elapsed 0%CPU (0avgtext+0avgdata 58500maxresident)k

MinSizeRel in llvm, Release in clang:
18.82user 2.61system 1:51:40elapsed 0%CPU (0avgtext+0avgdata 58776maxresident)k

Release in both clang and llvm:
18.83user 2.59system 1:45:32elapsed 0%CPU (0avgtext+0avgdata 59424maxresident)k

sstate-cache size after building core-image-sato with
PREFERRED_TOOLCHAIN_TARGET = "clang"
and target clang included as well as chromium-x11 in the image:

increased by less than 2% (137MB):
8988    sstate-cache-MinSizeRel-both
9125    sstate-cache-Release-both

populate_sysroot:
llvm:         14M: 175M -> 189M
llvm-native:  29M:  98M -> 127M
clang:         4M:  82M ->  86M
clang-native: 30M: 102M -> 132M

llvm package: 26M: 314M -> 340M
llvm ipk:     27M: 353M -> 380M

clang package: 3M:  89M ->  92M
clang ipk:     4M: 100M -> 104M

ipk package sizes:
7.0M    tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-bin_23.1.3-r0.3_x86-64-v3.ipk
87M     tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-dbg_23.1.3-r0.3_x86-64-v3.ipk
6.5M    tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-dev_23.1.3-r0.3_x86-64-v3.ipk
66M     tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-src_23.1.3-r0.3_x86-64-v3.ipk
153M    tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm-staticdev_23.1.3-r0.3_x86-64-v3.ipk
35M     tmp-MinSizeRel/deploy/ipk/x86-64-v3/llvm_23.1.3-r0.3_x86-64-v3.ipk

8.3M    tmp-Release/deploy/ipk/x86-64-v3/llvm-bin_23.1.3-r0.2_x86-64-v3.ipk
98M     tmp-Release/deploy/ipk/x86-64-v3/llvm-dbg_23.1.3-r0.2_x86-64-v3.ipk
6.5M    tmp-Release/deploy/ipk/x86-64-v3/llvm-dev_23.1.3-r0.2_x86-64-v3.ipk
66M     tmp-Release/deploy/ipk/x86-64-v3/llvm-src_23.1.3-r0.2_x86-64-v3.ipk
164M    tmp-Release/deploy/ipk/x86-64-v3/llvm-staticdev_23.1.3-r0.2_x86-64-v3.ipk
41M     tmp-Release/deploy/ipk/x86-64-v3/llvm_23.1.3-r0.2_x86-64-v3.ipk

8.8M    tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-dbg_23.1.3-r0.3_x86-64-v3.ipk
4.3M    tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-dev_23.1.3-r0.3_x86-64-v3.ipk
20K     tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-doc_23.1.3-r0.3_x86-64-v3.ipk
48K     tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-format_23.1.3-r0.3_x86-64-v3.ipk
40K     tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-libclang-python_23.1.3-r0.3_x86-64-v3.ipk
48M     tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-staticdev_23.1.3-r0.3_x86-64-v3.ipk
2.9M    tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-tidy_23.1.3-r0.3_x86-64-v3.ipk
1.3M    tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang-tools_23.1.3-r0.3_x86-64-v3.ipk
6.1M    tmp-MinSizeRel/deploy/ipk/x86-64-v3/clang_23.1.3-r0.3_x86-64-v3.ipk
18M     tmp-MinSizeRel/deploy/ipk/x86-64-v3/libclang-cpp23.1_23.1.3-r0.3_x86-64-v3.ipk
11M     tmp-MinSizeRel/deploy/ipk/x86-64-v3/libclang23.1_23.1.3-r0.3_x86-64-v3.ipk

7.8M    tmp-Release/deploy/ipk/x86-64-v3/clang-dbg_23.1.3-r0.4_x86-64-v3.ipk
4.3M    tmp-Release/deploy/ipk/x86-64-v3/clang-dev_23.1.3-r0.4_x86-64-v3.ipk
20K     tmp-Release/deploy/ipk/x86-64-v3/clang-doc_23.1.3-r0.4_x86-64-v3.ipk
52K     tmp-Release/deploy/ipk/x86-64-v3/clang-format_23.1.3-r0.4_x86-64-v3.ipk
40K     tmp-Release/deploy/ipk/x86-64-v3/clang-libclang-python_23.1.3-r0.4_x86-64-v3.ipk
47M     tmp-Release/deploy/ipk/x86-64-v3/clang-staticdev_23.1.3-r0.4_x86-64-v3.ipk
3.3M    tmp-Release/deploy/ipk/x86-64-v3/clang-tidy_23.1.3-r0.4_x86-64-v3.ipk
1.4M    tmp-Release/deploy/ipk/x86-64-v3/clang-tools_23.1.3-r0.4_x86-64-v3.ipk
6.8M    tmp-Release/deploy/ipk/x86-64-v3/clang_23.1.3-r0.4_x86-64-v3.ipk
21M     tmp-Release/deploy/ipk/x86-64-v3/libclang-cpp23.1_23.1.3-r0.4_x86-64-v3.ipk
13M     tmp-Release/deploy/ipk/x86-64-v3/libclang23.1_23.1.3-r0.4_x86-64-v3.ipk

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 3b93f0d02c..90076f9d6d 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -60,7 +60,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
                   -DLLVM_BUILD_EXTERNAL_COMPILER_RT=ON \
                   -DCMAKE_SYSTEM_NAME=Linux \
-                  -DCMAKE_BUILD_TYPE=MinSizeRel \
+                  -DCMAKE_BUILD_TYPE=Release \
                   -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
                   -DLLVM_CMAKE_DIR=${STAGING_LIBDIR}/cmake/llvm \
                   -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \

