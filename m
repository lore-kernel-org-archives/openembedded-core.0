Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F87EE14C1
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 16:56:52 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.4182.1694019407418160418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 09:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hRHjeYnP;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so2491065a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694019406; x=1694624206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUGZcHpcZig3P2Ip4Z+EF8pFwkIhKA+ltLsC1VIAk9E=;
        b=hRHjeYnPHjLn5VyqXL2N7AbeHO+Mxj5S/XbumqVOCDgmhDnE6jcHR6AByFqyMLoQL6
         c78dIlHdD3IgcbZhrRDzhJxbCvzoTj8owB+xnIhwMPNs0kfXfpPHIc1wTusrDDpTGXyD
         8VotZBMy78PGtz5qXlHuj2QUTDXVlH/Qs8xZCjLEUNSw8tFeEj7aR/9PCr3syhVhOXkm
         LUHv3clXN11K/vssOyL5/uiq3dNLyzLKyvtugZ5Ssl9av8zi/0Zlmx9a+mH3QcLdWXqa
         Wen4QUB0BQh+RPF0N1GhtvBK/9G7kSjXPGW5hgw7wW7r5KYDkU3xqukq5R4HFgPQnq/0
         cU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694019406; x=1694624206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUGZcHpcZig3P2Ip4Z+EF8pFwkIhKA+ltLsC1VIAk9E=;
        b=IFnuorVW/k27yUrj0S562OTWX5RIUO2TqKARTwL2le6qfLQUNd7C11Z9A7tBR0Asni
         ZczH6zttYxNUzwUZVor8hwgUH+Ty7918blSZammvTMuceMNYgtfnQHzY4NbFAvP1PASF
         ZmSGrBOEhc/qoYJ7TQ6KCDk+PfmCLx64KNilccUAEZlCamYqoISWhoyE5ee97eVUbSjm
         DCLbYADbDI9UOFU0hvmlkLqMWwPNpQkGHcwS/1MEIpggJSL8atvHhiUziTj0N10NB2iT
         lD8e4NS4seu2RkLG7Q5eA9DI3PYrJl2yufwSq2xULGX0CiN2O2P2r79+YP/F9ikDxlHE
         3IUg==
X-Gm-Message-State: AOJu0YyRuafPTZKSHqdIuGo4bY7JaIH7Cy60ypuLYyITfU3eL+/KckBk
	kq7O783hKLapNr6RP0kCYqSmYASvlIg=
X-Google-Smtp-Source: AGHT+IGg9s7ohWgZu7FDvP2/pa5A6v/XzH2fgTi8g2saWvjjaZBfCjYTJ0VFei0uLOZZvTJKn/rlRQ==
X-Received: by 2002:a17:906:d3:b0:9a3:7148:5041 with SMTP id 19-20020a17090600d300b009a371485041mr218576eji.16.1694019405904;
        Wed, 06 Sep 2023 09:56:45 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lh7-20020a170906f8c700b0098e34446464sm9284848ejb.25.2023.09.06.09.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 09:56:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/17] gpgme: upgrade 1.20.0 -> 1.22.0
Date: Wed,  6 Sep 2023 18:56:26 +0200
Message-Id: <20230906165633.2382629-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230906165633.2382629-1-alex@linutronix.de>
References: <20230906165633.2382629-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 16:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187332

Drop patch and --disable-lang-python-test option (upstream fixed the issue).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0007-python-Add-variables-to-tests.patch  | 52 -------------------
 .../{gpgme_1.20.0.bb => gpgme_1.22.0.bb}      |  4 +-
 2 files changed, 1 insertion(+), 55 deletions(-)
 delete mode 100644 meta/recipes-support/gpgme/gpgme/0007-python-Add-variables-to-tests.patch
 rename meta/recipes-support/gpgme/{gpgme_1.20.0.bb => gpgme_1.22.0.bb} (94%)

diff --git a/meta/recipes-support/gpgme/gpgme/0007-python-Add-variables-to-tests.patch b/meta/recipes-support/gpgme/gpgme/0007-python-Add-variables-to-tests.patch
deleted file mode 100644
index 4c97f63cc21..00000000000
--- a/meta/recipes-support/gpgme/gpgme/0007-python-Add-variables-to-tests.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 093c88817397425ee4c2333c469467229a46c9e1 Mon Sep 17 00:00:00 2001
-From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
-Date: Mon, 5 Aug 2019 01:00:58 +0900
-Subject: [PATCH 7/7] python: Add variables to tests
-
-* configure.ac, lang/python/Makefile.am:
-  New variable to `lang/python', set to `lang/python' if RUN_LANG_PYTHON_TESTS
-
-Upstream-Status: Submitted [gnupg-devel@gnupg.org]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
----
- configure.ac            | 5 +++++
- lang/python/Makefile.am | 3 +++
- 2 files changed, 8 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index bd85886..b5ae42e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -533,6 +533,11 @@ AC_ARG_ENABLE(g13-test,
-          run_g13_test=$enableval)
- AM_CONDITIONAL(RUN_G13_TESTS, test "$run_g13_test" = "yes")
- 
-+run_lang_python_test="yes"
-+AC_ARG_ENABLE(lang-python-test,
-+  AC_HELP_STRING([--disable-lang-python-test], [disable Python regression test]),
-+         run_lang_python_test=$enableval)
-+AM_CONDITIONAL(RUN_LANG_PYTHON_TESTS, test "$run_lang_python_test" = "yes")
- 
- # Checks for header files.
- AC_CHECK_HEADERS_ONCE([locale.h sys/select.h sys/uio.h argp.h stdint.h
-diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index 551deee..0fd555e 100644
---- a/lang/python/Makefile.am
-+++ b/lang/python/Makefile.am
-@@ -23,7 +23,10 @@ EXTRA_DIST = \
- 	gpgme.i \
- 	helpers.c helpers.h private.h
- 
-+SUBDIRS = . examples doc src
-+if RUN_LANG_PYTHON_TESTS
- SUBDIRS = . tests examples doc src
-+endif
- 
- .PHONY: prepare
- prepare: copystamp
--- 
-2.7.4
-
diff --git a/meta/recipes-support/gpgme/gpgme_1.20.0.bb b/meta/recipes-support/gpgme/gpgme_1.22.0.bb
similarity index 94%
rename from meta/recipes-support/gpgme/gpgme_1.20.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.22.0.bb
index dc5b58d7c33..84c8fa9f8a5 100644
--- a/meta/recipes-support/gpgme/gpgme_1.20.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.22.0.bb
@@ -18,14 +18,13 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0004-python-import.patch \
            file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch \
            file://0006-fix-build-path-issue.patch \
-           file://0007-python-Add-variables-to-tests.patch \
            file://0008-do-not-auto-check-var-PYTHON.patch \
            file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
            file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "25a5785a5da356689001440926b94e967d02e13c49eb7743e35ef0cf22e42750"
+SRC_URI[sha256sum] = "9551e37081ad3bde81018a0d24f245c3f8206990549598fb31a97a68380a7b71"
 
 PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
 
@@ -53,7 +52,6 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpg-test \
                  --disable-gpgsm-test \
                  --disable-g13-test \
-                 --disable-lang-python-test \
 '
 
 inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_INHERIT} python3native multilib_header
-- 
2.30.2


