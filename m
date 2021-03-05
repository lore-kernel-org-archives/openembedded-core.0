Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.12884.1614955729983916696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=aSi3QAJx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id n10so1524065pgl.10
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AVdLX4DF5od4MAwONckZbHq72d0c5Szwj3ov7vyqRmU=;
        b=aSi3QAJxyTRlGUnaKuc+oq538FRsINjMHeAEnvZYK+a9EuRvdMm+19mgFbqTYgQghS
         bg8Fh58j01q5JWOmE3le039UfTAylEBzTMj8aIGyRHpUlFqbTfd2w3Azukq8i/cpqzA6
         RUvCfZ5q3UcIu9mG+mmylkbjv9QbVGJSxiMdYFco7MVFQ7fLge0Z9mpgPP7eIpVEgfK3
         wfp5p5sg2gaoS6+UthpPPbqozd/8k5PRmORo8sc6fCisx3hGfZJrjf55yTy4eRCkWqd6
         NtlXyLV5o5PYi1cC96RqC3ezB5dujNW/yA4tQNI6+Rx8UejxM1AyDvusNMPENrzmZjZ+
         BWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AVdLX4DF5od4MAwONckZbHq72d0c5Szwj3ov7vyqRmU=;
        b=WgWQv+aIxPPJCm/FQrS3Cbt2PbQRUiI4nqPcPRsubJgsTy1UpK6INFyWi4H9rYAaz2
         IN+yjdtXELalahr5z3pRINX6dOyfUD/mEMPvBlhz+/M40tgNsbM8XWAKbrO6aruLotyF
         Ep5QHTtbcac+3pIdMQEZAuHBMV/8V48/4VxanBpbasTdmDNCtzc0IDDeqdODHuD1iBsX
         Ni9xL5mqbR/0h7K0KoonUTQRu9MwwUQXslqkCA1GbrB+2OIR1os6DCD7+mityuGmVAML
         oiVqqHxBJX01sDoLbVvNS2VC0KC6JntvN3tnDaclRzhTyZYn9lZcFRzn9tcffNN1vUly
         BqhA==
X-Gm-Message-State: AOAM531MmhHS/+kMs2mNOUntfpAlBv9e2pfDnS3AQbf3lDF77/Iii5pS
	XqOxu74itK3XFzV/rZ86+dAnp7rngWeBy/So
X-Google-Smtp-Source: ABdhPJyDQwGPPjK4wa2GQYKLQBjvOflgJ4j3/mcXpxSnrqdU9ji7M8NHUrDBxY8K71NkUFIrUWqgaQ==
X-Received: by 2002:a62:7bc4:0:b029:1f1:58ea:4010 with SMTP id w187-20020a627bc40000b02901f158ea4010mr3159038pfc.70.1614955729033;
        Fri, 05 Mar 2021 06:48:49 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.48.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:48:48 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/27] reproducible: Improve SOURCE_DATE_EPOCH_FALLBACK handling
Date: Fri,  5 Mar 2021 04:46:29 -1000
Message-Id: <1f218351c2ef702c76b1d1e793a624e1a4f5079b.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Ensure the fallback value if used is written to the SDE file
and hence stored in sstate, reducing any confusion within the
code over '0' values.

Bump the HASHEQUIV_VERSION since we've had a ton of trouble
with ensuring this rolls out correctly on the autobuilder so
others may too, take a clean slate for it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 53ffffa32b76330835287dfc05d4e4796841af08)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/reproducible_build.bbclass               | 4 ----
 meta/conf/abi_version.conf                            | 2 +-
 meta/lib/oe/reproducible.py                           | 8 ++++++--
 meta/recipes-extended/groff/groff_1.22.4.bb           | 1 -
 meta/recipes-extended/watchdog/watchdog_5.15.bb       | 1 -
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb | 2 --
 6 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 9e806c0b75..f06e00d70d 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -84,10 +84,6 @@ python create_source_date_epoch_stamp() {
 
     source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('S'))
 
-    if source_date_epoch == 0 :
-        bb.debug(1, "source_date_epoch is 0, using SOURCE_DATE_EPOCH_FALLBACK instead.")
-        source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
-
     bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
     bb.utils.mkdirhier(d.getVar('SDE_DIR'))
     with open(epochfile, 'w') as f:
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 251d43bb21..35faef9a36 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "14"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "4"
+HASHEQUIV_HASH_VERSION  = "5"
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 0fb02ccdb0..204b9bd734 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -90,8 +90,12 @@ def get_source_date_epoch_from_youngest_file(d, sourcedir):
         bb.debug(1, "Newest file found: %s" % newest_file)
     return source_date_epoch
 
-def fixed_source_date_epoch():
+def fixed_source_date_epoch(d):
     bb.debug(1, "No tarball or git repo found to determine SOURCE_DATE_EPOCH")
+    source_date_epoch = d.getVar('SOURCE_DATE_EPOCH_FALLBACK')
+    if source_date_epoch:
+        bb.debug(1, "Using SOURCE_DATE_EPOCH_FALLBACK")
+        return int(source_date_epoch)
     return 0
 
 def get_source_date_epoch(d, sourcedir):
@@ -99,6 +103,6 @@ def get_source_date_epoch(d, sourcedir):
         get_source_date_epoch_from_git(d, sourcedir) or
         get_source_date_epoch_from_known_files(d, sourcedir) or
         get_source_date_epoch_from_youngest_file(d, sourcedir) or
-        fixed_source_date_epoch()       # Last resort
+        fixed_source_date_epoch(d)       # Last resort
     )
 
diff --git a/meta/recipes-extended/groff/groff_1.22.4.bb b/meta/recipes-extended/groff/groff_1.22.4.bb
index 7bb393e09c..983cb9aea6 100644
--- a/meta/recipes-extended/groff/groff_1.22.4.bb
+++ b/meta/recipes-extended/groff/groff_1.22.4.bb
@@ -20,7 +20,6 @@ SRC_URI[sha256sum] = "e78e7b4cb7dec310849004fa88847c44701e8d133b5d4c13057d876c1b
 
 # Remove at the next upgrade
 PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
 
 DEPENDS = "bison-native"
 RDEPENDS_${PN} += "perl sed"
diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index beebb5b004..0adf1fbb41 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -21,7 +21,6 @@ SRC_URI[sha256sum] = "ffdc865137ad5d8e53664bd22bad4de6ca136d1b4636720320cb52af0c
 # Can be dropped when the output next changes, avoids failures after
 # reproducibility issues
 PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index bf8385fe6d..6a91582068 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -14,8 +14,6 @@ SOURCE_DATE_EPOCH = "1613559011"
 
 PE = "1"
 PR = "r3"
-HASHEQUIV_HASH_VERSION .= ".1"
-
 
 inherit allarch features_check
 
-- 
2.25.1

