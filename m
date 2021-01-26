Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.13105.1611672212920646387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ArAlSDPM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id b21so4730740pgk.7
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9dq70oFyEcAF79DSCiwupaaq1TPHYhBtqj5NkDatZus=;
        b=ArAlSDPMHMR/7cDmVCYg0crxobUqs1F21C9Tukolx2RZ1JcTva3sowv5tJzVs2V4Tb
         op3ZPXvV+ZgcDvmFsw8coDj7N1LNu2IvA5GIoNgBs7MQdRLaj40QzpfWt0j52Ie48+uh
         XIrePA7uCjx49UsYzHHzEekgvXjr1r6v0rB9ttu68poIHsTSPFlOlIq3zNy7abMzGrLp
         8dgHeu1EyTwmW7/m3J4ycySDTxcCkrydKwzBktdyxcl4QhMk9AOdJpHnx0PS5qow5hnf
         vQgnyXP9L6X5UtRQugq+Tj5+hvi9yvdgfez9my49De1wLIKJzSJMtnpjlTahf4PpiZ1Q
         ehFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9dq70oFyEcAF79DSCiwupaaq1TPHYhBtqj5NkDatZus=;
        b=P4TuGCqg1cMTJF9cKLU4/CUdNjGsCbnV8sH+dlj383HEdqiE3glIhQD2fSQAIVCY78
         8IfR7xoaLcF6KJntGUZpJcCawjXJUrHhOc0pySIzvAwpPkxhLkf7PJhbb5F2PAuS6z+k
         Eh2zjX1URJXEKjont1iiFuNSp4D4h1hdWbmAEbek2nM7FME1x3a7rnImmk01yH8A+BJS
         hMmwrGUxyI3DrqVzHPf9H3NTTla83X0dDC9j0acrgMJP5of48AWEpbPr4TCSPEWXcoxO
         +h8HlxEJkfOZ4QumqGHjkplFl6qIIjWaDzhxRFFoTufaWYu40Fab74c+YI+bStOFJT04
         wblA==
X-Gm-Message-State: AOAM533D6Nt+FFqTMHQ09h1DdJjVaZsCmGPfrzUl54j02Lsvzqb2VujN
	tviperAH693dpa0tndu0zmsTYs6w86RF3JSVw8I=
X-Google-Smtp-Source: ABdhPJxKC5YQykjGbpqTfAU5prtwm8MJUGGhBmZU4q5WliDkcuSfvu3f8r7Yo6y+eY5i7gl7D2boJA==
X-Received: by 2002:a63:4a49:: with SMTP id j9mr6015832pgl.197.1611672211986;
        Tue, 26 Jan 2021 06:43:31 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:31 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 29/46] distutils3: allow setup.py to be run from a different directory to ${S}
Date: Tue, 26 Jan 2021 04:41:40 -1000
Message-Id: <441d2907a977fcfbbbf6243b5a219e64363caaf3.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jack Mitchell <ml@embed.me.uk>

Sometimes setup.py can be buried deep in a source tree. This has
traditionally been solved with setting S to the subdirectory in
the source. However with the new pseudo changes, some python modules
make changes to files beneath ${S}, for example:

S = "${WORKDIR}/git/python/pythonmodule"

then in setup.py it works with source code in a relative fashion, such
as:

../../src

This causes pseudo to abort as it isn't tracking the paths. Therefore
implement the variable DISTUTILS_SETUP_PATH so that recipes can use:

S = "${WORKDIR}/git"
DISTUTILS_SETUP_PATH = "${S}/python/pythonmodule"

inherit distutils3

This allows the full source tree to be monitored, while distutils
can run setup.py from a location other than ${S}.

Signed-off-by: Jack Mitchell <ml@embed.me.uk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ddcc349cede0c4fe1909df1ded7b0a7c509cd758)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/distutils3.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 7356b5245a..a916a8000c 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -12,28 +12,30 @@ DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
 DISTUTILS_PYTHON = "python3"
 DISTUTILS_PYTHON_class-native = "nativepython3"
 
+DISTUTILS_SETUP_PATH ?= "${S}"
+
 distutils3_do_configure() {
     :
 }
 
 distutils3_do_compile() {
-        cd ${S}
+        cd ${DISTUTILS_SETUP_PATH}
         NO_FETCH_BUILD=1 \
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
         build --build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
         bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
 }
 distutils3_do_compile[vardepsexclude] = "MACHINE"
 
 distutils3_do_install() {
-        cd ${S}
+        cd ${DISTUTILS_SETUP_PATH}
         install -d ${D}${PYTHON_SITEPACKAGES_DIR}
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
         build --build-base=${B} install --skip-build ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS}' execution failed."
 
-- 
2.25.1

