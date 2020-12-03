Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.9903.1607002666124414806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:37:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BRKLvSeB;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id x16so3485610ejj.7
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 05:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rp/pIsxe+wPZASGS/oyNGfOXWppCLc+QXuWeEQ1ID3Y=;
        b=BRKLvSeBsBC5U6sDYv9mMaND9Nl3x7gHYpIU79IUDJ0dzwpAOcacFJsvhNmEm4TiPX
         UcVmIWnGAJk6vHAU6bIA1XVJx3mjS2cHrUo3BG6dmGqLSuqjS6ynq8VIGPz1lh7L0/BK
         SxmUAWHPdDjiFPoN6tkZ6Gm+SqGobN/e3PitbOHgflnlaFQl2N7jNTy/x5cGJzYyl28w
         Qmb8TRgALnbRaCctgQBqahqO0OppdBDzS4mbLrSdiuGvAOmizok2q2w3i8H53eC+b0z/
         BWzHbdHhnkRgIIobLIcDbSDdBFPhp56svdNxTL/A22qG+YASWsgwMjioA5Uy10K/cB1x
         mc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rp/pIsxe+wPZASGS/oyNGfOXWppCLc+QXuWeEQ1ID3Y=;
        b=uoZdXc/6LSTBkF98zlkog27+hh9NHjglzhyR8fuu5MEkSyNXnQ3sUrnw1crv48PMZ/
         MTiOuDMcsr0Y2SAGJp+fgsKTx4snqK1GIE+mp3/nN+1aDMkEuy/TRuMca0/QC9BhfZqE
         c36UezJVjIWJpSnwcd0cviS1gPeNnzsszIAXMMzCqVlWq72Ki2nHhwXXa5TvFTskxAGd
         21HC8VaKheXBe+4ppR0iBpnAaPoNleqWH4Idy7w8dluKPUDL+JT3Ahvf/eyfSF3PQ5IC
         wY3cATi3leXt4BlD78R68kjgA5MSf3MkO5Smqf1IeQ3pQ/Ie4Yaz5olLiPdzuEyVzJJ1
         6rFQ==
X-Gm-Message-State: AOAM533dis8Akv8aW+6e3BAM99CNFCNtYA4VEE32/52cAzTcyIphM3B8
	84WKmplF6oD81FCEmu5FJOFuR9adJbGR8w==
X-Google-Smtp-Source: ABdhPJwLNzmGcgegMaCQVbO/cUDQrPHC7ZtWy226NNLNM9ukfipoBJoVAz45yswxcDaktKX5mrt5Dw==
X-Received: by 2002:a17:906:31d2:: with SMTP id f18mr2506781ejf.407.1607002664193;
        Thu, 03 Dec 2020 05:37:44 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id ng1sm77130ejb.112.2020.12.03.05.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:37:43 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/11] llvm: sort the lists in generated source reproducibibly
Date: Thu,  3 Dec 2020 14:37:25 +0100
Message-Id: <20201203133727.12936-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203133727.12936-1-alex.kanavin@gmail.com>
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...r-sort-ClassInfo-lists-by-name-as-we.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
new file mode 100644
index 0000000000..20eea060b1
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -0,0 +1,31 @@
+From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 27 Nov 2020 10:11:08 +0000
+Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
+
+Otherwise, there are instances which are identical in
+every other field and therefore sort non-reproducibly
+(which breaks binary and source reproducibiliy).
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
+index ccf0959389b..1f801e83b7d 100644
+--- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
++++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
+@@ -359,7 +359,10 @@ public:
+     // name of a class shouldn't be significant. However, some of the backends
+     // accidentally rely on this behaviour, so it will have to stay like this
+     // until they are fixed.
+-    return ValueName < RHS.ValueName;
++    if (ValueName != RHS.ValueName)
++        return ValueName < RHS.ValueName;
++    // All else being equal, we should sort by name, for source and binary reproducibility
++    return Name < RHS.Name;
+   }
+ };
+ 
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index b146d0e6e3..43395f8cfc 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -33,7 +33,8 @@ SRCREV = "ef32c611aa214dea855364efd7ba451ec5ec3f74"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-          "
+           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           "
 
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.29.2

