Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.10744.1614596108762265708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 02:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z3TFV0po;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id n4so15634310wrx.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 02:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=V7je0ZqGQKf7dAcsmJ1KQYvL4Ouh02hhjNiHS6XTiY0=;
        b=Z3TFV0powBZyFXMiUPe79wfGMgV97mZs/hS1v7QPJuO5Iq35rMkFG+n4FcVLVCTwMP
         9gkC8WV2Nozi6CmCPxjODiUsAhtAkJAWadlaIml/aUaj3SlTj6XahzfGGjodiUYDkAJD
         pWetzQpQ+6+MwnTg2nBF38xfnXlo1HdjURwTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V7je0ZqGQKf7dAcsmJ1KQYvL4Ouh02hhjNiHS6XTiY0=;
        b=TtrGQgosnH/Jjz/J6GKwkfnzLQEOBMjPLSnqcv+ZYPrmng8cs6EyHMy4h5Gvk1ch3H
         70KIaHdCDEmr3UbKQE9Khh8NTtiogzApavHZ5LYdF0XrHxSHr4LVCg/288wlWJTlR6UF
         SsW02C5WcXZvX3VU3jnAyZc0oCZunbtUMMdYY0/RygJzVqi7Vjjxz1d9M8R+3qxCWe11
         UA3RJ1molUbB/Y4Dq9qv7zuVSPjbHhG/nNABEqkAfjqvLMThjEbQr4VFaZthA2EVJMPk
         ILOGjHThRa0lBuzU8nlq6xIcQQLqmAAO2qBRu/8YYZXuKStckcYNZwCGN6nOzJdH4TXi
         aFDQ==
X-Gm-Message-State: AOAM531MAlCrILY2Cuh1xQo9Ox4nP4vv6RxMzLJ4lQaB8yKucz/GXWk5
	pgsTBB7JGuSPHRrm7EPitzM7J03M33t6Iw==
X-Google-Smtp-Source: ABdhPJzVQrHXFhQEWo2OBcihXIrvBy2+KxZlxbGdA2hDIJYjcfZMup88ou7M2aWuSyBHrA/UlW+xYg==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr16369496wrp.112.1614596107062;
        Mon, 01 Mar 2021 02:55:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a])
        by smtp.gmail.com with ESMTPSA id a131sm22455807wmc.48.2021.03.01.02.55.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 02:55:06 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] swig: Fix reproducibility issue
Date: Mon,  1 Mar 2021 10:55:03 +0000
Message-Id: <20210301105505.2176093-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301105505.2176093-1-richard.purdie@linuxfoundation.org>
References: <20210301105505.2176093-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove hardcoding the build configuration into the help/version output
from swig to make the binaries reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  1 -
 .../swig/swig/determinism.patch               | 19 +++++++++++++++++++
 meta/recipes-devtools/swig/swig_3.0.12.bb     |  1 +
 3 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/swig/swig/determinism.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index a15601e5e5d..dd2230c149c 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -44,7 +44,6 @@ exclude_packages = [
 	'python3-cython',
 	'qemu',
 	'ruby-ri-docs',
-	'swig',
 	'systemd-bootchart'
 	]
 
diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
new file mode 100644
index 00000000000..8ffb4bce8ed
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
index 45026c9700b..090aaa81127 100644
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
2.27.0

