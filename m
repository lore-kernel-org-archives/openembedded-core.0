Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.10908.1614596109328512762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 02:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TfkmcDcr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id w11so15597627wrr.10
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 02:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Peq6330qe3jEImII1cl8ZhAkuTwxDt/HETpX/X4PloA=;
        b=TfkmcDcrDnEjbt0Z/cmlGGDarE1o3oaSlGEDvjWc1treO0v2rL2r31IGVHqwney+bM
         tRjHXhcEfTNSt/jyErRhidI4DfYmBhawbPvOqjOV/okH368IdUfSAtV0kkrlwU0l8QFx
         qn1rKvXmmueIAPp5sifUWH0BjQBGLclVdsTXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Peq6330qe3jEImII1cl8ZhAkuTwxDt/HETpX/X4PloA=;
        b=CbwFR2W0xJBWet1E3nSUDX8Xl/7GVmr7ocHgVAC2UAVJecGdcAI/80suZKSK6y3+uS
         O7ZKxX4BuvfR8RTCMlV7OJhFhWjegKfI95pwUx/wb+AqMiJLXphPuQuvYCdfS27rslyr
         tSwuBfvEY7/7SgHEiiKiPqlSwXLWViAH/ymb7Qb5Z8Rmnd2afjDvbT68FKVpfgkLZ9T6
         pxO6fI+KOb1D+/HRIYVmQ/2zJx82EegIxFrE0mlzuSxW9gxCgpqTX+sg88IcwqwNf0y7
         cxSPHqfsV61euICkCxDZQxHi0cwrbRJD8A6PML0RuxW/tHBWHiBXn+6n4xBKldlMbzZX
         yOKg==
X-Gm-Message-State: AOAM5339Dg0cne6ZQ34K0cb+sCUzQ0n98kYZ0KD0L6x2QL1jNzKAqESw
	LFilZmSnFuMdFN/+yZjoMVoXP6ZlQGV7qA==
X-Google-Smtp-Source: ABdhPJwnbDKu6y3zDR5EgDJFZbFHd5w2/QJshigpDbSPS6LHIATEP4C60sOYWm0dZatYmfTh/63sbw==
X-Received: by 2002:adf:b355:: with SMTP id k21mr16258274wrd.156.1614596107785;
        Mon, 01 Mar 2021 02:55:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a])
        by smtp.gmail.com with ESMTPSA id a131sm22455807wmc.48.2021.03.01.02.55.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 02:55:07 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] systemd-bootchart: Disable LTO to fix reproducibility
Date: Mon,  1 Mar 2021 10:55:05 +0000
Message-Id: <20210301105505.2176093-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210301105505.2176093-1-richard.purdie@linuxfoundation.org>
References: <20210301105505.2176093-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LTO likely doesn't buy us much here, disable it to allow the binaries
to be reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  3 +--
 .../systemd-bootchart/no_lto.patch            | 19 +++++++++++++++++++
 .../systemd-bootchart_234.bb                  |  1 +
 3 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/systemd-bootchart/systemd-bootchart/no_lto.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index d6c38cc7dea..bbc5c0d8a4f 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -42,8 +42,7 @@ exclude_packages = [
 	'perf',
 	'python3-cython',
 	'qemu',
-	'ruby-ri-docs',
-	'systemd-bootchart'
+	'ruby-ri-docs'
 	]
 
 def is_excluded(package):
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/no_lto.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/no_lto.patch
new file mode 100644
index 00000000000..1fdf8dbcc25
--- /dev/null
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/no_lto.patch
@@ -0,0 +1,19 @@
+LTO output is not reproducible. Until it is, disable this. Sadly
+there is no configuration option to do so at this time.
+
+Upstream-Status: Pending [may be accept addition of configuration option?]
+RP 2021/3/1
+
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -124,7 +124,7 @@ AS_CASE([$CC], [*clang*],
+ 
+ AS_CASE([$CFLAGS], [*-O[[12345sz\ ]]*],
+         [CC_CHECK_FLAGS_APPEND([with_cflags], [CFLAGS], [\
+-               -flto -ffat-lto-objects])],
++               ])],
+         [AC_MSG_RESULT([skipping -flto, optimization not enabled])])
+ AC_SUBST([OUR_CFLAGS], "$with_cflags $sanitizer_cflags")
+ 
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
index 58dd5995c85..905a0cbb72e 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c
 SRC_URI = "git://github.com/systemd/systemd-bootchart.git;protocol=https \
            file://0001-architecture-Recognise-RISCV-32-RISCV-64.patch \
            file://mips64.patch \
+           file://no_lto.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
2.27.0

