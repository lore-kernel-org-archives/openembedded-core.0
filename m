Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.6535.1599512005127239605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BGP5cOHC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id a9so15229906wmm.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aiFrxQSj0zfDH1YR5WjOavirPVp1eyOVdvCPaf7D+6Y=;
        b=BGP5cOHCtoWqbAjVvSagEyL9GPexXVCmUswrgnmGuOoqiOkNmS0HxRqoMnMe7TNzeu
         66D2ty22e4+da1+sAq7xtPxcMOZvetSRCzksQgec1tVB4P6sxOQqBIJt1kK2o3Q6MI6N
         2YdqNqo5n5QWyQ8SFM8PfK701PKhYmwZ79JrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aiFrxQSj0zfDH1YR5WjOavirPVp1eyOVdvCPaf7D+6Y=;
        b=VTC3mXi7vvVHPhPEtLfdi3IsBLtsw+XQA/4kt9DvAGTwDxjrQwD6GZjYWNz3KOSmrD
         68GCCMU+0UaQaN5ouXfspEJBYKZdI6KIBTdI2dPkdrYa2RMqa04B3ZDhbwg3S6cudfQj
         j073pjwL4SiNReIJhpssHmLdJtWXO3Y2uXoIFjHtLs7b8CtpOZID50/MX6Ca7wwSqDtt
         v2TWr0sp9e33mtHYAUkWfaMYGUYZ4yr4pBKAt+DGUWsjt1kt8KQKhGg6/qQiQxAj4Txl
         pk4AUXKRoFfLPQOWW9pTiMe+8C4Lsrc04xcNkfeHjMcEu9YJ1naPPvtclcwEIIljsG4q
         X6hg==
X-Gm-Message-State: AOAM530yQNLAOoe4xT4/95EyYreilxb14vHvjuqcHGp+GXf+v9J2zB5Z
	iuU7QZ5hmuPwALxm2bj5P1wFo5RIN7NmIQ==
X-Google-Smtp-Source: ABdhPJwBwAkuo/jeDO/MJc9QBE/R3rjUTTe1oyZsMAYfyIgWEs0okJ4pY+3Vy6zU95kqT1Cv3AEaiQ==
X-Received: by 2002:a1c:e256:: with SMTP id z83mr1084099wmg.137.1599512002962;
        Mon, 07 Sep 2020 13:53:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:22 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH][zeus 01/19] buildtools-extended-tarball: add recipe with build-essentials
Date: Mon,  7 Sep 2020 21:53:03 +0100
Message-Id: <20200907205321.1941682-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

* For some aging distros, such as CentOS 7, the native version
  of gcc is simply too ancient and is a constant source of
  headaches for moving forward.

* Add an extended version of buildtools-tarball which adds all
  of build-essential, so that the host is now modernized and
  capable of compiling the latest versions of components.

Fixes [YOCTO #13714]

(From OE-Core rev: f0377af2325613b63716b0bb4db1ab253d79f388)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../meta/buildtools-extended-tarball.bb       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/meta/buildtools-extended-tarball.bb

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
new file mode 100644
index 00000000000..d756036373e
--- /dev/null
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -0,0 +1,32 @@
+require recipes-core/meta/buildtools-tarball.bb
+
+DESCRIPTION = "SDK type target for building a standalone tarball containing build-essentials, python3, chrpath, \
+               make, git and tar. The tarball can be used to run bitbake builds on systems which don't meet the \
+               usual version requirements and have ancient compilers."
+SUMMARY = "Standalone tarball for running builds on systems with inadequate software and ancient compilers"
+LICENSE = "MIT"
+
+# Add nativesdk equivalent of build-essentials
+TOOLCHAIN_HOST_TASK += "\
+    nativesdk-automake \
+    nativesdk-autoconf \
+    nativesdk-binutils \
+    nativesdk-binutils-symlinks \
+    nativesdk-cpp \
+    nativesdk-cpp-symlinks \
+    nativesdk-gcc \
+    nativesdk-gcc-symlinks \
+    nativesdk-g++ \
+    nativesdk-g++-symlinks \
+    nativesdk-gettext \
+    nativesdk-libatomic \
+    nativesdk-libgcc \
+    nativesdk-libstdc++ \
+    nativesdk-libstdc++-dev \
+    nativesdk-libtool \
+    nativesdk-pkgconfig \
+    "
+
+TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
+
+SDK_TITLE = "Extended Build tools"
-- 
2.25.1

