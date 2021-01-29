Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.7752.1611915869956538193
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZAhBM+SI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f48.google.com with SMTP id s11so9962826edd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xTSU3fMJrN/FhBh3qieeKdNi0YM0e5rbzKqqc9+vknU=;
        b=ZAhBM+SIUIHKOwsqjI+fi7BAcNGDxOGla9QIj3EjYey14xLgKaTThobS7F629gojWI
         zlArUzgeeGlFv95+wpKJDBzEHIaiX95vJ7f023BjDhWB7dHN0jXdwiNDN3t6OjIvRELI
         7BdNCdTYP8DQN31NqL7NY5RNa69kHgrFNhZ/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xTSU3fMJrN/FhBh3qieeKdNi0YM0e5rbzKqqc9+vknU=;
        b=mrFvybNg5tDCYKVXc+Xlb+Llh/aAlQ0PHjYIZZIQfTIx4QsVmxTN8FH0RDgV7Kr8IU
         RQglgtMbMNLcYgHi2LzyOiwzNqev6HOCmPX4XsDQE9dNA0XYo+ZqTaLmQBec/8mMgSLy
         5pw/w2Ttg6DrPWKedrV0oSBeldNc5/CYunEmbBcko0/3xEjOPGKQtCQzDX/GqrmiBz7w
         BlxkjyH4MOtuZDWQ+QxIjNa+v6nuGPr2sY2fuz0VxJpF4jKF8OqpqZPouPszbZoAfeqB
         1Ris088hV4VxQtKcEe9sh+c0YiXZ7nV1Od1z2TZHtWMEkj2L1h3yCnIA0G4PU4l0u0AK
         LTtw==
X-Gm-Message-State: AOAM532kuYTKOTmhH0FWpiEI3pl6BpuNkgXir1eRD8zVmXw4yVSojXPG
	wvrtQQ+YsgANGP1cki+ZPwV2BulqW7TqKw==
X-Google-Smtp-Source: ABdhPJwZIXvjTe1rizB20p3J/Wv1jREOKJFPGDgFLip2yVEZSc4kdDc2aJzS6JjAp6gqRLRyoM/TVw==
X-Received: by 2002:a50:a086:: with SMTP id 6mr4230136edo.70.1611915868393;
        Fri, 29 Jan 2021 02:24:28 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:27 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/13] ruby: Fix to work with autoconf 2.70
Date: Fri, 29 Jan 2021 10:24:19 +0000
Message-Id: <20210129102419.1360572-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop a macro we don't need which was breaking with autoconf 2.70.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ruby/ruby/autoconf270.patch               | 34 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.7.2.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/autoconf270.patch

diff --git a/meta/recipes-devtools/ruby/ruby/autoconf270.patch b/meta/recipes-devtools/ruby/ruby/autoconf270.patch
new file mode 100644
index 00000000000..8d205bde431
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/autoconf270.patch
@@ -0,0 +1,34 @@
+This macro breaks under autoconf 2.70. Since we don't worry abot darwin or
+openbsd builds, simply remove it.
+
+Upstream-Status: Pending
+RP - 2021/1/28
+
+Index: ruby-2.7.2/configure.ac
+===================================================================
+--- ruby-2.7.2.orig/configure.ac
++++ ruby-2.7.2/configure.ac
+@@ -170,23 +170,6 @@ dnl     orig_cxxflags="$cxxflags"
+ dnl     cxxflags="$cxxflags "'${optflags} ${debugflags} ${warnflags}'
+ dnl ])
+ 
+-AS_CASE(["$host_os:$build_os"],
+-[darwin*:darwin*], [
+-    AC_CHECK_TOOLS(CC, [clang gcc cc])
+-    # Following Apple deployed clang are broken
+-    # clang version 1.0 (http://llvm.org/svn/llvm-project/cfe/tags/Apple/clang-23 exported)
+-    # Apple clang version 2.0 (tags/Apple/clang-137) (based on LLVM 2.9svn)
+-    # Apple clang version 2.1 (tags/Apple/clang-163.7.1) (based on LLVM 3.0svn)
+-    AS_IF([! $CC -E -xc - <<SRC >/dev/null], [
+-	@%:@if defined __APPLE_CC__ && defined __clang_major__ && __clang_major__ < 3
+-	@%:@error premature clang
+-	@%:@endif
+-SRC
+-	AC_MSG_ERROR([clang version 3.0 or later is required])
+-    ])],
+-[openbsd*:openbsd*], [
+-    AC_CHECK_TOOLS(CC, [cc])
+-])
+ AS_IF([test x"${build}" != x"${host}"], [
+   AC_CHECK_TOOL(CC, gcc)
+ ])
diff --git a/meta/recipes-devtools/ruby/ruby_2.7.2.bb b/meta/recipes-devtools/ruby/ruby_2.7.2.bb
index db6d6729859..8c338ebecfa 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.2.bb
@@ -7,6 +7,7 @@ SRC_URI += " \
            file://run-ptest \
            file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
+           file://autoconf270.patch \
            "
 
 SRC_URI[md5sum] = "2d4a28dcfa38352a627a597f6057c465"
-- 
2.27.0

