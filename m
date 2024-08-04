Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6FCC52D73
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:08:31 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.30087.1722791305230620778
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NiCOMo2S;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d2b921c48so7550305b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791304; x=1723396104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSt/xZXaclGvnj+bx0cEoorEtvBzlmTQmjxYw7wTP6k=;
        b=NiCOMo2S5FFKDzM4x8GTOKiUl7gEdv6BfWG86L/SX9Zc8mBvGIbagYceVX9nmqvbHL
         yzHxYQozt0T04DiPBHj5ytuTVSjSZ2q4EuZ57s+gCr7IDXlp0bos98fkezEoJJjE4Tgm
         p/HYni5+GNIdKBadVAGbRVCRiTG7WYLUhfd/Hs+XI98P/Ot5UqsLlQDukuj7zildXYZj
         ritCWPy4yG/YmOSZvlBxDCqfYqk2sb79GZOWLtUEnCFLUV9MuQYNSWvUKhxtiuVqeVPp
         cjyloinRigDNTpPWcXyFlKs4/EKy0OpxgapFeHvCzdAhjt1nYP2r2Be4D73Gz1VYodhE
         N/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791304; x=1723396104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSt/xZXaclGvnj+bx0cEoorEtvBzlmTQmjxYw7wTP6k=;
        b=hE9rvEX2KKIgQRPL4dWsHpksaCasLxKsiH3Fl5GuWmG0hqJv333xhbfg+iBmkhISJw
         eS3fLvQwZyIi2M8n/BaQYvcso9NQO9X/c5prF7NG5OBQUnMHHuvu56WY76czTS++1js7
         8JIcC1D8uG0A2P2+04HyxztUDL84XpJX+5a5i4lCKaMyUXDKsUB5CGGtbuJsY5xsPVIj
         Q26bIsuu0JA0SxH0ieMSsLFvMH3c+sp2GAqwhJg4iM2KwwFDyLxEDEfuypY06snuBVKn
         i2Ode/e9AovGW6IgygtxQt/e5617tyrI2FXEBshdJV2TImYEAKMg8vTtov7QCsC8Pk8q
         sbcA==
X-Gm-Message-State: AOJu0Yy5xR8oRtjXL1QkKuZpNb0/RTKS0LLgh/K6Y9KF/o4WPr69zr6k
	SEeO2p3F5FM3UfL8L2b1fX4rC7g3tJesMuMiCtIaFh0nL2cZTSkeu0fGSndqO7WjUDYm5YZ+FO4
	iIDoh7w==
X-Google-Smtp-Source: AGHT+IGP+5sbR8jHrgjmyY/MQorE1/kHedgbNp3qWD33FtLpI8xwWKpt6XtZ2qmY5C8ouvgKYfkrtA==
X-Received: by 2002:a05:6a20:6f8a:b0:1c0:ee57:a9a3 with SMTP id adf61e73a8af0-1c699620fe4mr9165408637.35.1722791304370;
        Sun, 04 Aug 2024 10:08:24 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4e3c41sm8714415a91.48.2024.08.04.10.08.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:08:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/8] go: Fix CVE-2024-24789
Date: Sun,  4 Aug 2024 10:08:08 -0700
Message-Id: <f198fdc392c6e3b99431383ab6577749e83f1cb3.1722791084.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722791084.git.steve@sakoman.com>
References: <cover.1722791084.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202952

From: Soumya Sambu <soumya.sambu@windriver.com>

The archive/zip package's handling of certain types of invalid zip files
differs from the behavior of most zip implementations. This misalignment
could be exploited to create an zip file with contents that vary depending
on the implementation reading the file. The archive/zip package now rejects
files containing these errors.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-24789

Upstream-patch:
https://github.com/golang/go/commit/c8e40338cf00f3c1d86c8fb23863ad67a4c72bcc

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.21/CVE-2024-24789.patch           | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-24789.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 95fb572362..e83c4dfa80 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -56,6 +56,7 @@ SRC_URI += "\
     file://CVE-2024-24784.patch \
     file://CVE-2024-24785.patch \
     file://CVE-2023-45288.patch \
+    file://CVE-2024-24789.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2024-24789.patch b/meta/recipes-devtools/go/go-1.21/CVE-2024-24789.patch
new file mode 100644
index 0000000000..2679109a0e
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2024-24789.patch
@@ -0,0 +1,78 @@
+From c8e40338cf00f3c1d86c8fb23863ad67a4c72bcc Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 14 May 2024 14:39:10 -0700
+Subject: [PATCH] [release-branch.go1.21] archive/zip: treat truncated EOCDR
+ comment as an error
+
+When scanning for an end of central directory record,
+treat an EOCDR signature with a record containing a truncated
+comment as an error. Previously, we would skip over the invalid
+record and look for another one. Other implementations do not
+do this (they either consider this a hard error, or just ignore
+the truncated comment). This parser misalignment allowed
+presenting entirely different archive contents to Go programs
+and other zip decoders.
+
+For #66869
+Fixes #67553
+
+Change-Id: I94e5cb028534bb5704588b8af27f1e22ea49c7c6
+Reviewed-on: https://go-review.googlesource.com/c/go/+/585397
+Reviewed-by: Joseph Tsai <joetsai@digital-static.net>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+(cherry picked from commit 33d725e5758bf1fea62e6c77fc70b57a828a49f5)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/588795
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+
+CVE: CVE-2024-24789
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/c8e40338cf00f3c1d86c8fb23863ad67a4c72bcc]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/archive/zip/reader.go      | 8 ++++++--
+ src/archive/zip/reader_test.go | 8 ++++++++
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/src/archive/zip/reader.go b/src/archive/zip/reader.go
+index e40a2c6..987f543 100644
+--- a/src/archive/zip/reader.go
++++ b/src/archive/zip/reader.go
+@@ -644,9 +644,13 @@ func findSignatureInBlock(b []byte) int {
+		if b[i] == 'P' && b[i+1] == 'K' && b[i+2] == 0x05 && b[i+3] == 0x06 {
+			// n is length of comment
+			n := int(b[i+directoryEndLen-2]) | int(b[i+directoryEndLen-1])<<8
+-			if n+directoryEndLen+i <= len(b) {
+-				return i
++			if n+directoryEndLen+i > len(b) {
++				// Truncated comment.
++				// Some parsers (such as Info-ZIP) ignore the truncated comment
++				// rather than treating it as a hard error.
++				return -1
+			}
++			return i
+		}
+	}
+	return -1
+diff --git a/src/archive/zip/reader_test.go b/src/archive/zip/reader_test.go
+index a549153..7ac394d 100644
+--- a/src/archive/zip/reader_test.go
++++ b/src/archive/zip/reader_test.go
+@@ -487,6 +487,14 @@ var tests = []ZipTest{
+			},
+		},
+	},
++	// Issue 66869: Don't skip over an EOCDR with a truncated comment.
++	// The test file sneakily hides a second EOCDR before the first one;
++	// previously we would extract one file ("file") from this archive,
++	// while most other tools would reject the file or extract a different one ("FILE").
++	{
++		Name:  "comment-truncated.zip",
++		Error: ErrFormat,
++	},
+ }
+
+ func TestReader(t *testing.T) {
+--
+2.40.0
-- 
2.34.1


