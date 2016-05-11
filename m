Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id D95C66FFD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:04 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yl2so4046367pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=SMedKlufJuO1jvgLingoUorb90/lvEyXRR36ATqKEl4=;
	b=MzpZvsHJ4Dn3pyaFsxZf7qeJrVfW6Z82M2W1jc2ipRzmgCZr2OxjyRUGouoPJ7ijJ6
	vUTBfNZB6n5+0nIGK33qFhRsHFjVMW+I70haVxPso8ZMGnvOiiFNwFoXAueVQNXq+Zvs
	seNWWENjPM9CsdMn/dq33bn3oYGbNGrVEgS2VM2/QHZ4XCYVzKi0drMwGM9Se9CsmeC7
	OeK3BvNmDSwsuM+kyPQhx2h6MsY1SGG13c6IXyDCxBlgJxI6KqhJ30m1l0NmgXAiJTiu
	R0+F2GiwkLb/S7owKhqbw9g7AziMHDxztw/vh7pt90Qz/XoQoaFid++WU0IOkGB+7yLP
	4kuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=SMedKlufJuO1jvgLingoUorb90/lvEyXRR36ATqKEl4=;
	b=PsfEPx25VHzaBtYGg3apMeN5G4zLFwKod49+q3KYNc9zQxCFx9PIpHKuOL6sqpVPqr
	C50KyQ7KtAyIj4+xcU5Qk29c0dD7RE4Yi45P+t7sTBb5qYNfK4Xk/9dsCbtBR5/bzSR0
	Tj7VBsiBd8OnS8AvlLk2N4TuJDV8i3j9etGsMYyTMXKEz6kEtAKVTjMMo/nfBDo60ESe
	rmVFwL+GMOuGHHoN6QmmkodUqBF0xYVY7bECy5BLUmjObvXZ47UFP3Bg8BbjkNxDGeDK
	yhpBKrz8MxF7BmNV/LRZXdyjUhLLPE+pp43RF0r28EhagU4qBomIhO3t9PLigcnIyYPZ
	TkLg==
X-Gm-Message-State: AOPr4FWjTVO4krSCNjJp14Tg0UQUfS7xU7LyIZSofvg20a0yPkqlLDT+dzFzuIMdOlXoVA==
X-Received: by 10.66.151.104 with SMTP id up8mr5071625pab.134.1462988165345;
	Wed, 11 May 2016 10:36:05 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:14 -0700
Message-Id: <5a5984ba5790598d92f9db507b5a74d8284d8e86.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 11/42] nss: Upgrade to 3.23
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
X-List-Received-Date: Wed, 11 May 2016 17:36:05 -0000

Disable Werror on native builds. This helps
in building nss-native on build hosts which have
gcc < 4.9 eg. ubuntu 14.04

The real issue is that we use headers from native
staging sysroot and it has the updated glibc headers
which then ends up with errors e.g.

| In function 'memset',
|     inlined from 'sec_PKCS7Encrypt' at p7local.c:715:14:
| /usr/include/x86_64-linux-gnu/bits/string3.h:81:30: error: call to '__warn_memset_zero_len' declared with attribute warning: memset used with constant zero length parameter; this could be due to transposed parameters [-Werror]
|        __warn_memset_zero_len ();
|                               ^
| cc1: all warnings being treated as errors
| make[2]: *** [Linux3.4_x86_64_glibc_PTH_64_OPT.OBJ/p7local.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/nss/{nss_3.21.bb => nss_3.23.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/nss/{nss_3.21.bb => nss_3.23.bb} (97%)

diff --git a/meta/recipes-support/nss/nss_3.21.bb b/meta/recipes-support/nss/nss_3.23.bb
similarity index 97%
rename from meta/recipes-support/nss/nss_3.21.bb
rename to meta/recipes-support/nss/nss_3.23.bb
index d2e2411..2663ff7 100644
--- a/meta/recipes-support/nss/nss_3.21.bb
+++ b/meta/recipes-support/nss/nss_3.23.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
 SRC_URI = "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_21_RTM/src/${BP}.tar.gz \
+    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_23_RTM/src/${BP}.tar.gz \
     file://nss-fix-support-cross-compiling.patch \
     file://nss-no-rpath-for-cross-compiling.patch \
     file://nss-fix-incorrect-shebang-of-perl.patch \
@@ -24,9 +24,8 @@ SRC_URI = "\
     file://nss.pc.in \
     file://signlibs.sh \
 "
-
-SRC_URI[md5sum] = "3c8b2ed880dd3a8d86c9e0151afe6eba"
-SRC_URI[sha256sum] = "3f7a5b027d7cdd5c0e4ff7544da33fdc6f56c2f8c27fff02938fd4a6fbe87239"
+SRC_URI[md5sum] = "21c3fed84441b2ab4c50ac626f6517e7"
+SRC_URI[sha256sum] = "94b383e31c9671e9dfcca81084a8a813817e8f05a57f54533509b318d26e11cf"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
@@ -49,6 +48,7 @@ do_configure_prepend_libc-musl () {
 do_compile_prepend_class-native() {
     export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}
     export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
+    export NSS_ENABLE_WERROR=0
 }
 
 do_compile_prepend_class-nativesdk() {
-- 
2.8.2


