Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id DAD047D119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 12:02:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z11so12425917wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 05:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=LaR0R/i5DpTsJfHjG395uvDlMqf4t4Kw7JgA2byAc4E=;
	b=JFVBJMDUTwsFkyYa2okXKEvLAaMKOuT3GReukGomPfYNZwp67WFdZQTpa8rg6WFI2C
	TxULVOw6NxqrR7LYO8OYyDjBRXpQecYPDYs/sy3kQwb52ig0gQ6HCkxburSpjlLqmyaT
	vnWwUIunyLOYV+anCBzpKAvwD75VEd00v1DHGSi8f+fPBPx4SUOMQCuvq02pgbEr8p8k
	qVZuV3m/58tWWrxiP3MQL/qf0f3hMtLpC27IkqW6VNAKqmCk9YhEf3oPtekQOaZyVood
	Q+LwfpcqX1mk+3bUq0w9I+b/qtcQoF69+akmWAKyx+fjSCq4AoeSe5BKnEEKMwJKrs9I
	BwHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=LaR0R/i5DpTsJfHjG395uvDlMqf4t4Kw7JgA2byAc4E=;
	b=Zu7ykb6wKDuAVVuaMFpgaXkZFLey6hXAM6CZu+GbYa1wEYxbngsAiYZDqEaEq7kwal
	faQ/LizeYR915r3fLvZFsJ/3S0Ldw8IRNWjP0O1Km+BXWWgKRr9ta4EkgnjmmxsOScCi
	P1oWtTsZM3VR5egLaQ10hiCq+wQ2Dqy9YjrCBgvfN7elQvoYAoRQxUmzMXHzk4V2QL1V
	KWEnRPRwaETusu2SJOtRuBu6jZpHbm+vhEozssaMYxpQ9ZRF8WH8uoef1jphd1r5zHVD
	L+9OoF/PK9IBH09Hpdc9wFJtmyuyPg7LxESVcR1kzo/eDGk0uh/llWUZGafFoxuK3qrj
	qnWQ==
X-Gm-Message-State: APjAAAXptXXQ7qQUmlUxrFhifptEL2RBHw8DDprcva5wTqlRJFJMgU7X
	mbSpK/N8feKkRPuWiiz67BG0Uvo97kE=
X-Google-Smtp-Source: APXvYqxFNUiJesCbAZcUlLcULn7ni2RTgpZkKpLTGkAablL3MSxrpRll9xpZgmmg1z9DEvXm/2ZqWA==
X-Received: by 2002:a1c:1f08:: with SMTP id f8mr9280303wmf.97.1553601750322;
	Tue, 26 Mar 2019 05:02:30 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z13sm16663501wrw.36.2019.03.26.05.02.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Mar 2019 05:02:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 12:02:27 +0000
Message-Id: <20190326120227.4499-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] zlib: clean up ptest
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
X-List-Received-Date: Tue, 26 Mar 2019 12:02:30 -0000

Instead of patching and sedding the makefile, just install test/example and
execute it in run-ptest.  example is the bulk of the test suite, as minimal as
it is.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-core/zlib/zlib/Makefile-runtests.patch | 38 ----------------------
 meta/recipes-core/zlib/zlib/run-ptest              |  7 +++-
 meta/recipes-core/zlib/zlib_1.2.11.bb              | 16 +--------
 3 files changed, 7 insertions(+), 54 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/zlib/Makefile-runtests.patch

diff --git a/meta/recipes-core/zlib/zlib/Makefile-runtests.patch b/meta/recipes-core/zlib/zlib/Makefile-runtests.patch
deleted file mode 100644
index 61eea8238a6..00000000000
--- a/meta/recipes-core/zlib/zlib/Makefile-runtests.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Add 'ptest' target to Makefile, to run tests without checking dependencies.
-
-Signed-off-by: Anders Roxell <anders.roxell@enea.com>
-Upstream-Status: Pending
----
-diff -uNr a/Makefile.in b/Makefile.in
---- a/Makefile.in	2013-06-10 13:48:14.321959162 +0200
-+++ b/Makefile.in	2013-06-10 13:49:36.686476448 +0200
-@@ -83,6 +83,9 @@
- test: all teststatic testshared
- 
- teststatic: static
-+	@make runteststatic
-+
-+runteststatic:
- 	@TMPST=tmpst_$$; \
- 	if echo hello world | ./minigzip | ./minigzip -d && ./example $$TMPST ; then \
- 	  echo '		*** zlib test OK ***'; \
-@@ -92,6 +95,9 @@
- 	rm -f $$TMPST
- 
- testshared: shared
-+	@make runtestshared
-+
-+runtestshared:
- 	@LD_LIBRARY_PATH=`pwd`:$(LD_LIBRARY_PATH) ; export LD_LIBRARY_PATH; \
- 	LD_LIBRARYN32_PATH=`pwd`:$(LD_LIBRARYN32_PATH) ; export LD_LIBRARYN32_PATH; \
- 	DYLD_LIBRARY_PATH=`pwd`:$(DYLD_LIBRARY_PATH) ; export DYLD_LIBRARY_PATH; \
-@@ -105,6 +111,9 @@
- 	rm -f $$TMPSH
- 
- test64: all64
-+	@make runtestall64
-+
-+runtestall64:
- 	@TMP64=tmp64_$$; \
- 	if echo hello world | ./minigzip64 | ./minigzip64 -d && ./example64 $$TMP64; then \
- 	  echo '		*** zlib 64-bit test OK ***'; \
diff --git a/meta/recipes-core/zlib/zlib/run-ptest b/meta/recipes-core/zlib/zlib/run-ptest
index 884d9dc6996..065863ef754 100644
--- a/meta/recipes-core/zlib/zlib/run-ptest
+++ b/meta/recipes-core/zlib/zlib/run-ptest
@@ -1,2 +1,7 @@
 #!/bin/sh
-make -k runteststatic runtestshared | sed -r -e 's/^(\s+\*+ (.+?) test OK \*+)/\1\nPASS: \2/' -e 's/^(\s+\*+ (.+?) test FAILED \*+)/\1\nFAIL: \2/'
+
+if ./examplesh ; then
+    echo "PASS: zlib"
+else
+    echo "FAIL: zlib"
+fi
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index 41ec29d95e8..ef9431ae475 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -7,7 +7,6 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef63bc555f7aa6c0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
-           file://Makefile-runtests.patch \
            file://ldflags-tests.patch \
            file://run-ptest \
            "
@@ -30,25 +29,12 @@ do_compile() {
 	oe_runmake shared
 }
 
-do_compile_ptest() {
-	oe_runmake test
-}
-
 do_install() {
 	oe_runmake DESTDIR=${D} install
 }
 
 do_install_ptest() {
-	install ${B}/Makefile   ${D}${PTEST_PATH}
-	install ${B}/example    ${D}${PTEST_PATH}
-	install ${B}/minigzip   ${D}${PTEST_PATH}
-	install ${B}/examplesh  ${D}${PTEST_PATH}
-	install ${B}/minigzipsh ${D}${PTEST_PATH}
-
-	# Remove buildhost references...
-	sed -i -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
-		-e 's|${DEBUG_PREFIX_MAP}||g' \
-	 ${D}${PTEST_PATH}/Makefile
+	install ${B}/examplesh ${D}${PTEST_PATH}
 }
 
 # Move zlib shared libraries for target builds to $base_libdir so the library
-- 
2.11.0


