Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.1439.1588197720195738703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 15:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eyzxtXaO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id i10so4394598wrv.10
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 15:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6p+E/ltIPxdT1uxmPjtYOOaKjPkFkx+zSUBdDYS5UI4=;
        b=eyzxtXaOzfQmnKbtbLHc4tTsS01OJr6YpeRmL1MVc8Uv0uVlsBJ9clLZ0dm5nnLchm
         EuTV6pakR8J0YFs+EHWT/3zUfJlXdbPdJwQDDtT7Rev5siZHLwrngr3DN0gwUkqQ9wkg
         4Ta2fj+bUmjbw7JdNsXePmj40nJ6OySO0Z+oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6p+E/ltIPxdT1uxmPjtYOOaKjPkFkx+zSUBdDYS5UI4=;
        b=DkG3G9fBXTe6BUlCQcldQT2I5PiJj+reaRWwosuEevrjUkT5LObww4SL17zwl5cNYS
         0zb8mgB0un75EQB05bO34rvAHRkLizn6d+cnTy00qc7LNDczCgsmSZQAn7b6bCIccgEB
         WK45ndT3YKGZQRZpFNnQNtMKLvX9oHxH6e+/gaErjU8eyEVuOIKTV5UYg4gVTem6Zy0b
         LORHPQc036eno2cLJxdWTI1gqpkze9lTTeqN1BnSzb9N+SqgA6bWcWJdDr0U3xo80eDX
         XETleoaFgBNDv/Zc4+wO3zn5NICepMEfMqWI/ktJ568Df/pBlfn0FBroe/Ce2z+3N9Hu
         sjgw==
X-Gm-Message-State: AGi0PuZk4nJt7vNWO3ml96Z/fYCl31K53HiKVM/sQybziP2Ve9ol63Be
	RZTd8LNdiNwQB/l9Y+gUJNeoFT77ga4=
X-Google-Smtp-Source: APiQypJH6Cbdl13oGy1MgZj/7B5bZxevxGUu0h43homUL12ryedskIVXehdmZ7hmRbWImkl3q7SO0Q==
X-Received: by 2002:adf:ca0e:: with SMTP id o14mr59419wrh.254.1588197717964;
        Wed, 29 Apr 2020 15:01:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id q10sm907073wrv.95.2020.04.29.15.01.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 15:01:57 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Require gcc 6 or later
Date: Wed, 29 Apr 2020 23:01:56 +0100
Message-Id: <20200429220156.1300336-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New versions of rpm have issues with the libgomp support in gcc 5.x
so raise the minimum to 6 or later. This mainly affects Ubuntu 16.04.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 9e871017389..292c5591dd3 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -527,7 +527,7 @@ def check_wsl(d):
             bb.warn("You are running bitbake under WSLv2, this works properly but you should optimize your VHDX file eventually to avoid running out of storage space")
     return None
 
-# Require at least gcc version 5.0.
+# Require at least gcc version 6.0.
 #
 # This can be fixed on CentOS-7 with devtoolset-6+
 # https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
@@ -541,8 +541,8 @@ def check_gcc_version(sanity_data):
     
     build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
     if build_cc.strip() == "gcc":
-        if LooseVersion(version) < LooseVersion("5.0"):
-            return "Your version of gcc is older than 5.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
+        if LooseVersion(version) < LooseVersion("6.0"):
+            return "Your version of gcc is older than 6.0 and will break builds. Please install a newer version of gcc (you could use the project's buildtools-extended-tarball or use scripts/install-buildtools).\n"
     return None
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
-- 
2.25.1

