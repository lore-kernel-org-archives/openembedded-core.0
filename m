Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 92DAF7FDE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 17:34:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j42so3998522wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 09:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MkWwWjaPsweGjd2geH8tEe9JhsKxD+3VDj3nwHk52AA=;
	b=qeoW13COA0BjMYbz1yR7z3Pge+ZqDan53Niv1+8VmsLjPYqmRUS8I8w32CrZYGz60w
	ceRt50fn+OAPYUSQddu14680lTjNJbAaALfEvAKpJU+iQKUiJabYRnAmEQjsEZ3N+ybW
	p/GKTbq/Qk9dAJH0jKNxoetZoB3OpqkneMEiHAbk9dmatg8G2nXKgUeOl3M/RvJ6yXw/
	3YU+eGIbYeaer1OvbwRi2aHnyc9mXGti4PKTIJ6AEMcOYrDFM20+3HyLyrRxPVFFpW4t
	w1tTd39axktwlbr+MbEIzBsdafl2I2sIiBS9EnHVEDogbJBziGCsdl73/mlIREPB1Tfb
	7t5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MkWwWjaPsweGjd2geH8tEe9JhsKxD+3VDj3nwHk52AA=;
	b=AnPp6rHLXEqdRTe8/JaR2ppjFM//UVxN05XEm/RSGle9iQFQWxMC0JsJaN6Lg3Ml9G
	V50FXE3KgREphB2cLIgPtzvq32NbrLlxmLmiek63Ar2UiLfnmBV/EZePGxsZB/XCjREc
	5s+6SvRHaczPoUV9FIUEjkqa/TKSpIIuGGK5QKC+6jQKTlg3+3xtSR5KRBoLDt6HkrLr
	IUJsFEStNs7uGImU5Dm0Ar5TfYOa2g/uakDFG1sJ8AGDovisTUo03VGNmQClzV7usg0m
	ysfykjt+jcwnMCpc9uhe8BPU5rJWMWu5Fm8nRvqZxI7628oOOAFydLIr8xdwBzQg5mTc
	Q9jQ==
X-Gm-Message-State: APjAAAVcxURM6Scobax2ByiJhn7aTl3HZAWF5Sg+pgNC3q5h+oG7y3BB
	x3TWa6kl02mqqlgfhCG8UpwVkYZb
X-Google-Smtp-Source: APXvYqyHxKSCYVjIH4LV9YIc3Imc44oP0Vom6h2waUrR8B8UN45wqZTFBD5YbMiKLTf/C32x61P7Hg==
X-Received: by 2002:adf:f604:: with SMTP id t4mr17407344wrp.33.1579800864215; 
	Thu, 23 Jan 2020 09:34:24 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	e18sm3774439wrr.95.2020.01.23.09.34.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 09:34:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 18:34:16 +0100
Message-Id: <20200123173416.112832-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123173416.112832-1-alex.kanavin@gmail.com>
References: <20200123173416.112832-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/5] elfutils: additional ptest fixes
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
X-List-Received-Date: Thu, 23 Jan 2020 17:34:24 -0000

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


