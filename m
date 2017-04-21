Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id CE42171DDD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 19:23:20 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id k87so33492982ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZhhoDZi1ozy6VSuoTA+9m6Gmi0DThpL85UN+vHYkz8g=;
	b=LeZqWcvVIqVXRep0BGFg9mboCq0diMG8l3KAvmjqp5p0KWroum3HYQS445qpnRYn1j
	8ttIkxsku8/V8POBWRLcEqeznEYyO81ltXaLYZfC2Ww/7lzNewnAwcINtO2kT5cciPax
	T7dFmrgAIkPQVSaxy7Mr9j/yE0RVZKg+QxKdu8WyNixaaLuP+UddTUhVhB7jZfEoyYto
	Ztoj1T+C7wj381mzI1+Auyk4wMtYHvq519cZQfzWdxWQ88inyOsuc2nj6o2XC9x504MK
	mJs1/II3j3gapsljzCFArUVMpap4U43DK3RjroMnJ2cQvAipwjIuSD9dYc9ED5FgjwM8
	qGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZhhoDZi1ozy6VSuoTA+9m6Gmi0DThpL85UN+vHYkz8g=;
	b=MOions2VJmZnRlQyW5TlFfRume/1YDMFASj0tZR2KNTrlkxzzIUNFuvFdNIXyy/w4W
	DULr544zO09I3oytryW3HY69den5WppiAbNSHRMLdqifoWlcm/1ssXX+Fa7xaeMqY5VF
	T3gvznXNLWBXFazPXeGZOgmUlArZRIlqvIZkjYx+waYaNXzdncKVeBVxZZjlAaT4lUHs
	FwpOhYs+Qdf0K23Rz7wAysyfqMhKuQFxZGy50E/7O1qU51QDVEiqNSlUWBMRCmDTYO6B
	e7kekrGvhSsz0zZYRsXeUOC2I4gpuorp2e/tIzP2t4F+g4qpoV48SLkFRVEcFxdcTCxu
	M5Rw==
X-Gm-Message-State: AN3rC/4IorXTH+rQcs5SXjoHOB/+9lkZcVKDBRvnKXik+JmNKqaFVjnK
	NbNfHELV61xO7Q==
X-Received: by 10.99.102.3 with SMTP id a3mr13968042pgc.129.1492802601591;
	Fri, 21 Apr 2017 12:23:21 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 29sm17499654pfo.9.2017.04.21.12.23.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Apr 2017 12:23:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 12:23:07 -0700
Message-Id: <20170421192308.22132-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH] puzzles: Add -Wno-error=format-overflow if compiler supports it
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
X-List-Received-Date: Fri, 21 Apr 2017 19:23:21 -0000

Fixes build with gcc7 in such a way that it keeps working
with older compilers who dont support -Wno-error=format-overflow=
option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...or-format-overflow-if-the-compiler-suppor.patch | 32 ++++++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_git.bb           |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/puzzles/files/0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch b/meta/recipes-sato/puzzles/files/0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch
new file mode 100644
index 00000000000..d40a3b1ef94
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch
@@ -0,0 +1,32 @@
+From 337799e40350b3db2441cc98f65ec36a74dfb356 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Apr 2017 12:18:08 -0700
+Subject: [PATCH] Use -Wno-error=format-overflow= if the compiler supports it
+
+we need this warning to be suppressed with gcc7+
+however older compilers dont support it so we need
+a way to disble it only if compiler supports it
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3a38c95..bb9035e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -42,7 +42,7 @@ fi
+ if test "x$GCC" = "xyes"; then
+   AC_MSG_CHECKING([for usable gcc warning flags])
+   gccwarningflags=
+-  for flag in -Wall -Werror -std=c89 -pedantic; do
++  for flag in -Wall -Werror -std=c89 -pedantic -Wno-error=format-overflow=; do
+     ac_save_CFLAGS="$CFLAGS"
+     ac_save_LIBS="$LIBS"
+     CFLAGS="$CFLAGS$gccwarningflags $flag $GTK_CFLAGS"
+-- 
+2.12.2
+
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index a25c00760a5..7b8495ff75d 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -14,7 +14,8 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://0001-Use-labs-instead-of-abs.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Clarify-conditions-to-avoid-compiler-errors.patch \
-"
+           file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
+           "
 SRCREV = "8dfe5cec31e784e4ece2955ecc8cc35ee7e8fbb3"
 PE = "1"
 PV = "0.0+git${SRCPV}"
-- 
2.12.2


