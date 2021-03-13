Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web12.2779.1615661513684299126
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CQuP7OCU;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id u198so25453085oia.4
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8/P7evvUL6I34Cm0w3iZERhCfpjs2VZi/W6CAbdfGBo=;
        b=CQuP7OCU7FdMeYSwcoZFu8lV/vb7hbjo3laLOj7hGC6prJh4hF3f8Cv7JOmyq0f+UE
         VE/Z2KiDZ39UXO+sRJ6EgFrKj+QK/aDwl1ABk3Xnjzq9kzXNqGHYBKEvth6N5NprTt1O
         AlKV6fUT9aAhUg6G6z8syCyznjjxNlVD6XFfkMQEeORP3jwwtYZG6OJYs/FhRmxgDxYk
         NB4PAhW/gfJr8x/fGiopHPVuc5D0Aig1ZZEqeHuMO42iCabLT45tUDfrJNcATe48IU0Y
         6A2m7xqhcu69+gnUOF/FVxji39/RkkKPagzkRIA5I/b7Bs234GET7TSkhHBMGdHWIZsU
         cyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8/P7evvUL6I34Cm0w3iZERhCfpjs2VZi/W6CAbdfGBo=;
        b=s0/1gMqsrxqaqpeFcN81vfMWPziZvct77BtiM2fLUqhKt0CkBVeE1BpKFxnT+X+fIe
         tllvArOtg9+kw5lk8PtJ6AcIAZGz6aWzjV3GQ79LU84UvfMg1XQdpmQO7KbXK0YaJ7yp
         PaH7SA8+CN9yvRmFloDqyZ0DtSuKJrVBCu24c3GRv1Ymp7vK8vmYO+EwUrnY14hK6D6n
         8hqecQ1v+GzwLal6rXL4TE2YUIWUqCkhQTlcCPR3ek1if4siwx9rUKWXu6+Bl3Jj2ymk
         AtdJZDNoquj6tGDX+E5PtTSgnXCh3O4WBvW4z3QubOZyox3Iyzv0dYY4m0K3L9vfmPpE
         QmvQ==
X-Gm-Message-State: AOAM530qsO6QHNlFoM+NNMz3IO5ON/FVOWDmCUiytnxWcz8iXvSBZ6E3
	3V4a/lZuXvMwVKjNIbd6yVPtvB0E+MEJZ5/3
X-Google-Smtp-Source: ABdhPJzEjlBM7IrFFmaKmJkBJ7cWQ0yOczKkDgefcL26i42lGmOOtgTUPwBMGra8PNP8V9k9FTmMOQ==
X-Received: by 2002:a05:6808:1448:: with SMTP id x8mr2940014oiv.99.1615661512458;
        Sat, 13 Mar 2021 10:51:52 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:52 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/38] swig: Fix reproducibility issue
Date: Sat, 13 Mar 2021 08:49:13 -1000
Message-Id: <6187dd2b21a9f42877e782810ef96738dbc668c1.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Remove hardcoding the build configuration into the help/version output
from swig to make the binaries reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ed28ae9717ea9dad4e131012186d5f08e8f0bec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../swig/swig/determinism.patch               | 19 +++++++++++++++++++
 meta/recipes-devtools/swig/swig_3.0.12.bb     |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/swig/swig/determinism.patch

diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
new file mode 100644
index 0000000000..8ffb4bce8e
--- /dev/null
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -0,0 +1,19 @@
+Remove the compiler commandline/platform from the compiled binary as this
+breaks reproducibilty.
+
+Upstream-Status: Inappropriate [OE reproducibiity fix upstream unlikely to take]
+RP 2021/3/1
+
+
+Index: swig-3.0.12/Source/Modules/main.cxx
+===================================================================
+--- swig-3.0.12.orig/Source/Modules/main.cxx
++++ swig-3.0.12/Source/Modules/main.cxx
+@@ -636,7 +636,6 @@ void SWIG_getoptions(int argc, char *arg
+ 	}
+       } else if (strcmp(argv[i], "-version") == 0) {
+ 	fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
+-	fprintf(stdout, "\nCompiled with %s [%s]\n", SWIG_CXX, SWIG_PLATFORM);
+ 	fprintf(stdout, "\nConfigured options: %cpcre\n",
+ #ifdef HAVE_PCRE
+ 		'+'
diff --git a/meta/recipes-devtools/swig/swig_3.0.12.bb b/meta/recipes-devtools/swig/swig_3.0.12.bb
index 45026c9700..090aaa8112 100644
--- a/meta/recipes-devtools/swig/swig_3.0.12.bb
+++ b/meta/recipes-devtools/swig/swig_3.0.12.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.pat
             file://swig-3.0.12-Coverity-fix-issue-reported-for-SWIG_Python_FixMetho.patch \
             file://Python-Fix-new-GCC8-warnings-in-generated-code.patch \
             file://0001-Fix-generated-code-for-constant-expressions-containi.patch \
+            file://determinism.patch \
            "
 SRC_URI[md5sum] = "82133dfa7bba75ff9ad98a7046be687c"
 SRC_URI[sha256sum] = "7cf9f447ae7ed1c51722efc45e7f14418d15d7a1e143ac9f09a668999f4fc94d"
-- 
2.25.1

