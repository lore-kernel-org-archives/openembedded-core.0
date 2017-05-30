Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B3C2780C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 10:08:38 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d127so23975362wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 03:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wxw9D4axCl8tGTBsYiDU75CjxHEiXfrI7R6JvM7n1vc=;
	b=AODvpM5qDsAIb1lEaV0GdSwtAiKaa0CsLQ089Vc+JvHDIUjHNLWd826l7Si6TkmVtL
	Sj/CkL+x7X4kzI9RQtMdtKKMwYDCV2vLdQVwEl9sk8T4vpXzzwM4t3mqgpAMV6b8tpe0
	DJMeo0eYtm2K0e1oWZAnumkwam9eHy5csyA+tbHiR6ygp1BEMZkPzGkN3J2PSyGg8j7C
	xMdx+K6bMR1egN0WCdWZbBlpKpzR1RwfhL2ZYwa9pic7XudUA4UK5MVnHnQGhxQfrC3T
	hVYQS9XPL+85dDxuK6yDZh6k1rAUI9cZiuhiMWQD/GrfgTakNEVfQsy38hO56OAw2VDk
	oJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wxw9D4axCl8tGTBsYiDU75CjxHEiXfrI7R6JvM7n1vc=;
	b=XD+E+3yL5mqH1u2dwpOuooCaOiKX9m3nmOfVf/9q3rRMhrRZoF2R2eE5tdZyBLHlXJ
	nhyW/bRuhlRB23IdM9SRzGsVO10V23zEWOeHt3NwcE279HPKf4AkmRXKZTgRRD1yDV4f
	uybqDehTcG6Md1o6V6Lx7v9nVBQswcDbJ0bjW+mjCIunjNxAy/8mquMuQQ7aDTZktOKw
	xWBa27pSWoSaO3IVTRoljr91/dVxo7Nx3mKbwnV1aT4zVtp9BoPbYpi356uHIOYwMFNS
	vIHkLjqn8r3+FR9j5r0uUhAwOjzOb9QgzYnSls2dlU6mgfZqi1dRygymnlY6y3bkOSdZ
	OnYw==
X-Gm-Message-State: AODbwcBmegSvuwJQjvNn63f0mtrrx70TK06FNPMLR/nKXX2WVpmJm0/5
	1FjVYbSmH4r4mC/7
X-Received: by 10.28.31.136 with SMTP id f130mr1025641wmf.117.1496138918988;
	Tue, 30 May 2017 03:08:38 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m191sm25186246wmg.30.2017.05.30.03.08.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 03:08:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 10:08:36 +0200
Message-Id: <20170530080836.25342-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode, links"
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
X-List-Received-Date: Tue, 30 May 2017 10:08:39 -0000

* Using "cp -a" leaks UID of user running the builds, causing
  many QA warnings.
* See this thread for details:
  http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112904.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_8.27.bb       | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb | 4 ++--
 meta/recipes-extended/mdadm/mdadm_4.0.bb            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.27.bb b/meta/recipes-core/coreutils/coreutils_8.27.bb
index 667e0af560..ea8740a2d1 100644
--- a/meta/recipes-core/coreutils/coreutils_8.27.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.27.bb
@@ -99,7 +99,7 @@ do_install_append() {
 	install -t ${D}/${mandir}/man1 ${S}/man/*.1
 	# prebuilt man pages don't do a separate man page for [ vs test.
 	# see comment above r.e. sed and update-alternatives
-	cp -a ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
+	cp -R --no-dereference --preserve=mode,links -v ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
 }
 
 inherit update-alternatives
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
index 5216c7027c..7c8809a41e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
@@ -106,7 +106,7 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
-	cp -a ${B}/tests ${D}${PTEST_PATH}/test
-	cp -a ${S}/tests/* ${D}${PTEST_PATH}/test
+	cp -R --no-dereference --preserve=mode,links -v ${B}/tests ${D}${PTEST_PATH}/test
+	cp -R --no-dereference --preserve=mode,links -v ${S}/tests/* ${D}${PTEST_PATH}/test
 	sed -e 's!../e2fsck/e2fsck!e2fsck!g' -i ${D}${PTEST_PATH}/test/*/expect*
 }
diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index 98a10a8b15..506b0bc315 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -55,7 +55,7 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
-	cp -a ${S}/tests ${D}${PTEST_PATH}/tests
+	cp -R --no-dereference --preserve=mode,links -v ${S}/tests ${D}${PTEST_PATH}/tests
 	cp ${S}/test ${D}${PTEST_PATH}
 	sed -e 's!sleep 0.*!sleep 1!g; s!/var/tmp!/!g' -i ${D}${PTEST_PATH}/test
 	ln -s ${base_sbindir}/mdadm ${D}${PTEST_PATH}/mdadm
-- 
2.13.0


