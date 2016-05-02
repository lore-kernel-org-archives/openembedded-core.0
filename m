Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2DB731A3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 20:09:31 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id i5so18413020pag.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 13:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6SA6j+duC0K2+VN9GMzkQdoAyF/A6Wn869BcHBQSvJQ=;
	b=zr5dx37GvLH89y2hh4YNvLP0tBqp7jfDvPYmsT5MkLDm2eh1oLJWnQ8vSgkvCq5sH9
	NyFJJqjvldfJcyBbzJtUnb90HzbFRTqbfVmpR/LregbHyWJgBWYS1IPQRefVVYdlkCmE
	yAS0GzZE1pXMyM4QZMreKef62ZFMo7Xr0sCew8jUtEsVqNxpwSzEVC7Uj3UEYKlwf2m8
	XM2IjLaWqXCorXknoZwcIM07wspFmNoFWfmmelEgzVldFxmL6nKz2Z8mzR2FJXQ62Rpv
	ot7KbAPilXpZ3hd95t/KAZOvr2Ux4R/wt4VZWzEL6dq5KMZITxO1s3sOJVNmuNtJ7eZB
	9BNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6SA6j+duC0K2+VN9GMzkQdoAyF/A6Wn869BcHBQSvJQ=;
	b=LMROipsiOs6hkJ/PHr6ZH2JwMW9VwnR9oWLNMXq/WEmmziXPuQzLI1JkBNGGJe5Duu
	GgK0BRvivExmGGCKceXRgsHUZ7YvNW3xTNMBxKhulVtVnOK+hP/F0YIqt261OdKNuU1q
	utxYfwRSd8ZRzRSrs2qZoJCMW/UuQzSxKt+QAaFkIiT+0Bsqbbk9Nc3XhCsNavAiMyol
	et4DlL87+ErCWa5NHZTMKURME3Hs7d3P5Vx/QFtldnBQEasFRSpjt/6hVy006bOfs+rH
	4SMfgfrunv0NnjzWaCL7Hw8dXmZvVyRCPI8GJWRAucTLa3ReSVLsJpfSMRTExubZZOa7
	Pwlw==
X-Gm-Message-State: AOPr4FUXAZw/ZIhDlqN8id4/LRq1yEfU3kZ5ETq1QJxg0QwhQArangANmQHpEKRfCnpECw==
X-Received: by 10.66.172.165 with SMTP id bd5mr55203027pac.128.1462219772056; 
	Mon, 02 May 2016 13:09:32 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	lz5sm47795540pab.34.2016.05.02.13.09.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 May 2016 13:09:29 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 13:09:25 -0700
Message-Id: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 May 2016 20:09:33 -0000

From: Christopher Larson <chris_larson@mentor.com>

We explicitly set the hash style to gnu in our LDFLAGS. Setting the default to
this in the toolchain, while convenient, actually hides bugs, as a failure to
obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to how we
poison the sysroot -- rather than relying on the default, notice right away if
somoeone isn't obeying the needed flags.

This will result in a failure to obey LDFLAGS causing a GNU_HASH QA failure,
which is what's often seen with external toolchains. This brings us all on the
same page, and makes sure a failure to obey LDFLAGS is seen early.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc | 1 -
 meta/recipes-devtools/gcc/gcc-5.3.inc | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 7e03f31..c187918 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -111,7 +111,6 @@ EXTRA_OECONF_BASE = "\
     --disable-bootstrap \
     --disable-libmudflap \
     --with-system-zlib \
-    --with-linker-hash-style=${LINKER_HASH_STYLE} \
     --enable-linker-build-id \
     --with-ppl=no \
     --with-cloog=no \
diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 9808be1..f2eda18 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -112,7 +112,6 @@ EXTRA_OECONF_BASE = "\
     --disable-bootstrap \
     --disable-libmudflap \
     --with-system-zlib \
-    --with-linker-hash-style=${LINKER_HASH_STYLE} \
     --enable-linker-build-id \
     --with-ppl=no \
     --with-cloog=no \
-- 
2.8.0


