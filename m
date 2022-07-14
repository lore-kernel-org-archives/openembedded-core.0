Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A431CCA47B
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:39 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.4058.1657773397297536616
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MPQspIE2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 t5-20020a17090a6a0500b001ef965b262eso1443018pjj.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lDWwCUacrYYwPuy/55s+wj7AkQPSe2+h/kwtD5+Yh4s=;
        b=MPQspIE2OpaaxcXoMmJFPI9+tpNLBXjoYvkT7OrRcWLYDqxCs8UuZjPicCYMtodhA5
         DTo/qvPK0Nn6GvAaQ47VU2qB99HGg2FuyFHO+HBLj30aHAtTSoUnNhc+RGCQq6DSyUX3
         Os4pspQkV/VGHZQfHVk9Zsy5Kk1DEDusTkmoVSzhjsFjrx1h6Ct+KyLj79OP4qPq51Ge
         knr3xZN6rv5F2pl/Vh6BQBy3uPlIZ7C5C1r2vCgkkOiG+Ld65fnYHmhAad2fKnwNy6L9
         +Lni4Ljzpkz3HvEW+ZS11JnnCsc9OqR3A6YMitu+pGNjPbqY5hmww9I6OF8yJTaUcYAL
         HgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lDWwCUacrYYwPuy/55s+wj7AkQPSe2+h/kwtD5+Yh4s=;
        b=0tNQB90rM298T/xE3DkeJHzSGiX3Lxok9vxM8MxGuzpcrMOsXyVkPXlS8H1vMcfATg
         NFhZMdBugIdENnu79hdtJFJE+L/Hn/aOP+JMrpPqwTsK2Jj6EolEmrW7zEudLpRwBN5+
         5YIbf5Aeenc+aFKk14VYe3lpzzBpYm6Sw3RItQN/djIzhjFq+GNqhUABk5inhfxRo72N
         RPVvb3ZFclUT+wQfM91RBiBHNzR2/tPlXyu72/tSV196Vzk69efOrwEHKUPFhWMG22Gl
         0L+ccfMD2HedgHUCcUgGkHP4qjQhyqWxZr4u1GYm+FreBZSZV30pvEY4ER7Y6cE5Cc0l
         jY4w==
X-Gm-Message-State: AJIora+ySWKIFfs21rF+i1+oLrdaLCGek0hFYfeUkiZMZFQFpslhD2Gw
	QSBpimKBTK9lUifsvA1UOfP+Nz+D2b+wJLoA
X-Google-Smtp-Source: 
 AGRyM1sDmWuLDWA52P09+qJXZrdmkIFPlW4XT1nGkg0aIETKREMHNdy6oSzjXFA1YJqctGjPt5ydVg==
X-Received: by 2002:a17:903:189:b0:16c:39b2:c217 with SMTP id
 z9-20020a170903018900b0016c39b2c217mr7050514plg.113.1657773396245;
        Wed, 13 Jul 2022 21:36:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/27] glibc-tests: Avoid reproducibility issues
Date: Wed, 13 Jul 2022 18:35:31 -1000
Message-Id: 
 <96f6badee73f35ededcb7d0172db07fcc305df0d.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168008

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently, there are hardcoded paths in the binaries installed by this
recipe, at least one some architectures. Change the compile definitions to
point to more appropriate paths. Ideally we'd rework this patch into a form
acceptable to upstream but I'm not entirely sure what that would look like
right now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ede7ab3bbf87cc7d7e713d435ea8a88035c2e46e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-tests_2.35.bb   |  3 +++
 .../glibc/glibc/reproducible-paths.patch      | 23 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/reproducible-paths.patch

diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
index 028e83e865..96d0569ff6 100644
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
index 0000000000..0754dca62b
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
2.25.1


