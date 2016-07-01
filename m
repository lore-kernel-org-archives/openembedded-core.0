Return-Path: <kergoth@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 079A76012C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 20:45:02 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f89so7738813qtd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 13:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3z3znYPD+NelVMF5Y1LpeDVLV9qgKGMgvOeAarcLxkk=;
	b=SBVNzh1R+PDX7u0iNUIGl2gDu3n+sw4QR/r6+QXu/t7QIrvHieDW6xd8QtE8bbCRFS
	Y40RdLksISjSrpNw0tBGSogie9lRdA9wtnx82mSGtNCUKX4vc3B9KD48CYgrvil83Le/
	pPzIt4luTzXDqxKscLWn32Pif2dQAfwlJy2TQjJ1dw7f3q5yiAE8Wo+a+xnbMSWYlJ3F
	Jr+rnyfUCL12zNymZKu/+RHNSM49x3ugOeqDA57RCjzS6FHIyGXz/BoZ5oIMgRFyGAAa
	kIJw43Acop4CroASiodHWkLYSu+t/bbQyDfqjF0pzlrSIsN2ei//EtY/aQeh/jPQDadB
	m00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3z3znYPD+NelVMF5Y1LpeDVLV9qgKGMgvOeAarcLxkk=;
	b=D7hpsE2LlDDUUTDHHoSOYjkvVoE7zUF40IXq32wS2+7bYTs/z0WSoKsIiiE2E55fgP
	z6YrsLHH3RIu0Pd/uMDe/yzyRVYTlxgy+aQNqhAFCLXiUzSFH2oF5kFg/+LxgNuwP6Yd
	L8ZQJjV435VKr3uofUU8uZJ/hXvUnQul4eK/Ef3driPvpSqeaiSeUsfCLa6+GlNACS+J
	irAvBb2WAgUdugNg2ki0xPunWz+8SCDpN9sI4yXNmSoMO/lJACyk+FdXrTzqq60sUIsw
	YVrUNntfSIIJNoG3LV0tTXzBLhdum+x75EMe3EmGkX2IgEqH1oq7ettrPcVBf1Wmj/bY
	vG0g==
X-Gm-Message-State: ALyK8tL013PBgWu5jfrzGUQIKHPTdsBeJqH/dPNTgIb8bn4YXZAL4ztl2xqlKkHvIXBhFA==
X-Received: by 10.237.40.99 with SMTP id r90mr423070qtd.0.1467405902880;
	Fri, 01 Jul 2016 13:45:02 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id 1sm1798407qtv.13.2016.07.01.13.45.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 13:45:01 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 13:44:57 -0700
Message-Id: <1467405897-14036-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2] gcc-cross: remove --with-linker-hash-style
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
X-List-Received-Date: Fri, 01 Jul 2016 20:45:03 -0000

From: Christopher Larson <chris_larson@mentor.com>

We explicitly set the hash style to gnu in our LDFLAGS. Setting the default to
this in the toolchain, while convenient, actually hides bugs, as a failure to
obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to how we
poison the sysroot -- rather than relying on the default, notice right away if
somoeone isn't obeying the needed flags.

This will result in a failure to obey LDFLAGS causing a GNU_HASH QA failure,
which is what's often seen with external toolchains. This brings us all on the
same page, and makes sure a failure to obey LDFLAGS is seen early.

This is limited to cross, to retain ease of use for SDKs.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc   | 3 ++-
 meta/recipes-devtools/gcc/gcc-5.3.inc   | 3 ++-
 meta/recipes-devtools/gcc/gcc-6.1.inc   | 3 ++-
 meta/recipes-devtools/gcc/gcc-cross.inc | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 64701c8..05e02d9 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -107,13 +107,14 @@ JAVA = ""
 
 LTO = "--enable-lto"
 
+OECONF_HASH_STYLE = "--with-linker-hash-style=${LINKER_HASH_STYLE}"
 EXTRA_OECONF_BASE = "\
     ${LTO} \
+    ${OECONF_HASH_STYLE} \
     --enable-libssp \
     --disable-bootstrap \
     --disable-libmudflap \
     --with-system-zlib \
-    --with-linker-hash-style=${LINKER_HASH_STYLE} \
     --enable-linker-build-id \
     --with-ppl=no \
     --with-cloog=no \
diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 8613a10..faa1292 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -113,14 +113,15 @@ JAVA = ""
 
 LTO = "--enable-lto"
 
+OECONF_HASH_STYLE = "--with-linker-hash-style=${LINKER_HASH_STYLE}"
 EXTRA_OECONF_BASE = "\
     ${LTO} \
+    ${OECONF_HASH_STYLE} \
     --enable-libssp \
     --enable-libitm \
     --disable-bootstrap \
     --disable-libmudflap \
     --with-system-zlib \
-    --with-linker-hash-style=${LINKER_HASH_STYLE} \
     --enable-linker-build-id \
     --with-ppl=no \
     --with-cloog=no \
diff --git a/meta/recipes-devtools/gcc/gcc-6.1.inc b/meta/recipes-devtools/gcc/gcc-6.1.inc
index 1a00f3f..e3ff9cb 100644
--- a/meta/recipes-devtools/gcc/gcc-6.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.1.inc
@@ -93,14 +93,15 @@ JAVA = ""
 
 LTO = "--enable-lto"
 
+OECONF_HASH_STYLE = "--with-linker-hash-style=${LINKER_HASH_STYLE}"
 EXTRA_OECONF_BASE = "\
     ${LTO} \
+    ${OECONF_HASH_STYLE} \
     --enable-libssp \
     --enable-libitm \
     --disable-bootstrap \
     --disable-libmudflap \
     --with-system-zlib \
-    --with-linker-hash-style=${LINKER_HASH_STYLE} \
     --enable-linker-build-id \
     --with-ppl=no \
     --with-cloog=no \
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index f479360..850c63a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -33,6 +33,7 @@ EXTRA_OECONF_PATHS = "\
     --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
+OECONF_HASH_STYLE = ""
 
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_DIR_TARGET}${target_includedir}"
 
-- 
2.8.0


