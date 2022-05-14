Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Khem Raj" <raj.khem@gmail.com>
Subject: [PATCH] elfutils: Disable stringop-overflow warning for build host
Date: Sat, 14 May 2022 08:15:50 -0700
Message-Id: <20220514151550.71772-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>

Some distributions shipping gcc12 end up with stringop-overflow warnings
e.g.
/usr/include/bits/unistd.h:74:10: error: ‘__pread_alias’ specified size between 9223372036854775813 and 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Werror=stringop-overflow=]
   74 |   return __glibc_fortify (pread, __nbytes, sizeof (char),
      |          ^~~~~~~~~~~~~~~

Until fixed, lets not treat this warning as hard error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.187.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.187.bb b/meta/recipes-devtools/elfutils/elfutils_0.187.bb
index d20220e4335..31983dfd6ba 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.187.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.187.bb
@@ -33,6 +33,8 @@ PTEST_ENABLED:libc-musl = "0"
 
 EXTRA_OECONF = "--program-prefix=eu-"
 
+BUILD_CFLAGS += "-Wno-error=stringop-overflow"
+
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2:class-target = "bzip2"
 
-- 
2.36.1

