Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.20705.1599740589721388258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TiTYXyKP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id t10so6497946wrv.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7yXOAFrogVKKyE9Xptu6DIF7fz/qNNREde02zYrRMFo=;
        b=TiTYXyKPVXi6pFk75N/7pgzGUkDpadj4H24Y95DimyUZAH9Ny4SFsfShIS8ZtUfsQn
         E/JWEoaairZt3695hmmnEVuasMUrJChGftcRpyJJbuuAmLgUJa2KQWOCse/4OqlgVOWO
         4GL9/VzWbHgu8xKnX3gDznG/z0hkGWwoYnNOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7yXOAFrogVKKyE9Xptu6DIF7fz/qNNREde02zYrRMFo=;
        b=YljyA+rUbNqvHL4WGl4PdEjyUhxFbg0CCQrcjVioBuq9jouO8e6whobFc4wUk283dW
         BfQ6DnSvdCMD9ZAbDgOrbINfWuV6WjOrYKcxjlQ6nB2qvCEvQZDG52qYYjwzOBn7Yxmj
         UC0tz8a0YmXRwryXGvvSKDH6W0JgMzOGGMkxx3J46N18qoPLYqH7k6GScRNh2C4L0Hfy
         Qu9ONZLTMMonwnYHJFkZnSwQ3nl2tlCmLijIK8bU2SysFmZ2RwWveiCGp2gLNPQZ1zps
         zwmIUcc+9+GVsN6O1vm8+gE7HhiDKDE3m/FzVZvee2uQrdX9wIQoyr2GUBqwacinAGel
         Akfw==
X-Gm-Message-State: AOAM530miRqsIGTpfrUWhtD1iyuDW8HOqJc9rG63n/HPH69Qb4KzrpZn
	iCuKkcakqMi5STe/yAw7RvdhMIRwqYyLLg==
X-Google-Smtp-Source: ABdhPJyARPQ1ryvvMBuC/hglbVmxq7seDPftT9J5sk65yepf6Is++QkkWnmAGfUHCi3jpbBHRWGnrA==
X-Received: by 2002:adf:eb04:: with SMTP id s4mr8568740wrn.81.1599740587614;
        Thu, 10 Sep 2020 05:23:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:06 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH][warrior 01/22] buildtools-extended-tarball: add recipe with build-essentials
Date: Thu, 10 Sep 2020 13:22:45 +0100
Message-Id: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
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

(From OE-Core rev: bb4979f0e8367b475cc9a5274933a61bb0eb64b3)

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

