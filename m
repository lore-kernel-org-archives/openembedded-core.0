Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8C3C43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 16:12:55 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.62272.1656864772826337824
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 09:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bWS1ueDe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id o4so10107447wrh.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 09:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a68Ragjd1/sUQrrkhfnZkOEgizvRgvhtid3Th8Cge8I=;
        b=bWS1ueDe0YWWswkw3bSXfzSRiXu7md3oI80eJO33Xm9YlHsQ8yQoIWF7k34QqPQV9Q
         hPnNC1AiWXlB1I2Ic0PjfCF6TvzvVxXSFjg1yoarJnCi3k+2QY8OdTewrMwGspn3dykU
         Yc9EPaOqW8O3X+Rn75s/U6Z4fbeD4x3HhAi0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a68Ragjd1/sUQrrkhfnZkOEgizvRgvhtid3Th8Cge8I=;
        b=Vs4YLpcbdc1/wwp7bwE/QqEZDz1gB2rjdePu8fuXMAoOBT5IMbKzCBCibEU9UHLQ2T
         aGi1hRz/ioPbNf4HXi6hDUb0++be2TVVwnSGTflL5Q++t7t+HqNO7y5TUXQcvwTGDsfE
         ZyBqlixiQMhrZUp/u8ki3uStNCf9jhIArY1LFrq3VEjHr7Qrct5cOi8P+d0jbjGN93IT
         YFzSJU/up6UgS/1A9mT3Tb9DJRDxvf01eWAaOYlB7oKjCDlLwpIhiUlhG/nK2hg9GWEA
         +2Ji5CKd0o+6arcq51a3z115dii1ckKscrfwEDyv3bF3x60j6ZZS9kRWSTBSxhjJJqhm
         dveg==
X-Gm-Message-State: AJIora9utPkNvUqaMxd+LrHYKsPF8yyy0CmWkWsNGoR/7WkUN4XOG9Q7
	tx9mTiNgT+3yHsgQku4MjUcUI7tQQIZObQ==
X-Google-Smtp-Source: 
 AGRyM1t/xbwFtMoxtW/wpYC/vVsp1EXKtw9CS5+P9ZYndJz2nrw/QCKnXSjihuPuxbWyy4iHNVm2Ag==
X-Received: by 2002:a5d:66cc:0:b0:21b:8f5e:875b with SMTP id
 k12-20020a5d66cc000000b0021b8f5e875bmr23872195wrw.51.1656864770884;
        Sun, 03 Jul 2022 09:12:50 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8d2b:65dd:c9f1:4624])
        by smtp.gmail.com with ESMTPSA id
 c16-20020adfe750000000b002103a7c5c91sm27476106wrn.43.2022.07.03.09.12.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 09:12:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc-tests: Avoid reproducibility issues
Date: Sun,  3 Jul 2022 17:12:49 +0100
Message-Id: <20220703161249.869834-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 16:12:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167559

Currently, there are hardcoded paths in the binaries installed by this
recipe, at least one some architectures. Change the compile definitions to
point to more appropriate paths. Ideally we'd rework this patch into a form
acceptable to upstream but I'm not entirely sure what that would look like
right now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-tests_2.35.bb   |  3 +++
 .../glibc/glibc/reproducible-paths.patch      | 23 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/reproducible-paths.patch

diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
index 028e83e865b..96d0569ff67 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
@@ -5,6 +5,7 @@ inherit ptest features_check
 REQUIRED_DISTRO_FEATURES = "ptest"
 
 SRC_URI:append = " \
+	file://reproducible-paths.patch \
 	file://run-ptest \
 "
 
@@ -31,6 +32,8 @@ RRECOMMENDS:${PN} = ""
 RDEPENDS:${PN} = " glibc sed"
 DEPENDS:append = " sed"
 
+export oe_srcdir="${exec_prefix}/src/debug/glibc/${PV}/"
+
 # Just build tests for target - do not run them
 do_check:append () {
 	oe_runmake -i check run-built-tests=no
diff --git a/meta/recipes-core/glibc/glibc/reproducible-paths.patch b/meta/recipes-core/glibc/glibc/reproducible-paths.patch
new file mode 100644
index 00000000000..0754dca62b0
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/reproducible-paths.patch
@@ -0,0 +1,23 @@
+Avoid hardcoded build time paths in the output binaries by replacing the compile
+definitions with the output locations.
+
+Upstream-Status: Inappropriate [would need reworking somehow to be acceptable upstream]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/support/Makefile
+===================================================================
+--- git.orig/support/Makefile
++++ git/support/Makefile
+@@ -216,9 +216,9 @@ libsupport-inhibit-o += .o
+ endif
+ 
+ CFLAGS-support_paths.c = \
+-		-DSRCDIR_PATH=\"`cd .. ; pwd`\" \
+-		-DOBJDIR_PATH=\"`cd $(objpfx)/..; pwd`\" \
+-		-DOBJDIR_ELF_LDSO_PATH=\"`cd $(objpfx)/..; pwd`/elf/$(rtld-installed-name)\" \
++		-DSRCDIR_PATH=\"$(oe_srcdir)\" \
++		-DOBJDIR_PATH=\"$(libdir)/glibc-tests/ptest/tests/glibc-ptest\" \
++		-DOBJDIR_ELF_LDSO_PATH=\"$(slibdir)/$(rtld-installed-name)\" \
+ 		-DINSTDIR_PATH=\"$(prefix)\" \
+ 		-DLIBDIR_PATH=\"$(libdir)\" \
+ 		-DBINDIR_PATH=\"$(bindir)\" \
-- 
2.34.1


