Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id ECA047FD42
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 14:19:14 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so11536464wru.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 06:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MkWwWjaPsweGjd2geH8tEe9JhsKxD+3VDj3nwHk52AA=;
	b=KiDK7Fa9i958TsMCzOeZdHO3SMiaQVEf49LDcUzDqlOOMFJBrtwQ8jCx9e3zmwns4W
	DLGxSI5OSF+bWnYucZxtvubiw7xzeAz1j/j2WuM1Ej5Gu+SOqwQyA5rK0Fu879zLgBxf
	mzHxGnZrQTCibxcJjxCVmJYQ7UmcHTYHjFRP4ixS7qSY0RRAgjCp13qXrhb9CxvRu7G1
	Js5jO9tPuzodtgcakESlvs2eoYwkquQEKABNj8IVafXvnUM2w3szxoqKGlIJ1x2h1B/c
	Xe9g3zc848gWHCo9oYIEVQ5QqMnX3OAF3CI2bhLvsbeDSosk1lybQ5yReeHBGSSvp7Jy
	Kcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MkWwWjaPsweGjd2geH8tEe9JhsKxD+3VDj3nwHk52AA=;
	b=ohdIBNLQrmvmpxkbEbNoLlSz48yHe13sUNerB7HGmBj8jUPu1u5e4r7oQGWKFA7oVn
	laSYDczkcOQNFS7V0TlC6OOT2BXRqf/sMpeYUcvIK0rm0NQhKuHMRDmI+wP2JSlS6qDi
	p/T+8n8hMqrUSxLVfi6WHVCV3G277EKjKZ4pxjYbMobcJJgQCgGEi41NFZWct39OQLDP
	mDrr2ETRRMQE0oIEeBGhIS8TnfC3eBZ8BApbfq7j8vnhVsOnaeCRP7drSj2nSDHkqhPJ
	KaBGhp7mU4zdRyEX1+bDuQWG39H1L91Vz/B0gm5GdQ1iKfwdfSnCpjJPrpprgJeCQLjR
	9c1A==
X-Gm-Message-State: APjAAAWhV45iYzdk+evskzqM7IdN9WUlt0Yw4rCZ3PupBCP/PFF0m/Nm
	dA7Bf5JEL8uLpwBB7O9oHT3ccKc5
X-Google-Smtp-Source: APXvYqxaXhH3AC3wNiITT0iH30zr5agjsJ3/FKwJhNRjHyb74YBa97qPkmIV+qiasrkqZKz1gqCTpA==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr21967130wrt.70.1580134755476; 
	Mon, 27 Jan 2020 06:19:15 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	n1sm20533930wrw.52.2020.01.27.06.19.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 06:19:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 15:19:03 +0100
Message-Id: <20200127141908.84922-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127141908.84922-1-alex.kanavin@gmail.com>
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/9] elfutils: additional ptest fixes
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
X-List-Received-Date: Mon, 27 Jan 2020 14:19:15 -0000

This should address ARM64 specific failures in particular.

eu-objdump is now installed on all architectures;
ptests fail in its absence and pass when it is present, so it's
useful at least in some scenarios in non-x86 architectures and
fails gracefully otherwise.

The original decision to exclude it was here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5283

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.178.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.178.bb b/meta/recipes-devtools/elfutils/elfutils_0.178.bb
index 9393628dd13..8f5deb2c62a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.178.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.178.bb
@@ -58,11 +58,7 @@ RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
 
 EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
 
-do_install_append() {
-	if [ "${TARGET_ARCH}" != "x86_64" ] && [ -z `echo "${TARGET_ARCH}"|grep 'i.86'` ];then
-		rm -f ${D}${bindir}/eu-objdump
-	fi
-}
+RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 
 do_compile_ptest() {
 	cd ${B}/tests
@@ -139,6 +135,7 @@ INHIBIT_PACKAGE_STRIP_FILES = "\
     ${PKGD}${PTEST_PATH}/tests/elfstrmerge \
     ${PKGD}${PTEST_PATH}/tests/backtrace-child \
     ${PKGD}${PTEST_PATH}/tests/backtrace-data \
+    ${PKGD}${PTEST_PATH}/tests/backtrace-dwarf \
     ${PKGD}${PTEST_PATH}/tests/deleted \
     ${PKGD}${PTEST_PATH}/src/strip \
     ${PKGD}${PTEST_PATH}/src/addr2line \
-- 
2.17.1


