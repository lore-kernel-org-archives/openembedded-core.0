Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCEFCD4F2A
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:25:12 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.16025.1695367503064271998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jlBE2N7a;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-532addba879so4399772a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367501; x=1695972301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikEYmQzmJt+hlZnAwmi7NxcQsQZnrnLKV9+fSm5aNvc=;
        b=jlBE2N7aONppS24EBbtaQdR6Rxp7aOkbD6/39xIffBUO+A/g05VPARQS2F8XAS4KL3
         0nwFG5ZgfRegiEXiTqH61bZuyRS6ChDGtd5R7HAigyhbJtgKEDq894ZlGFlNIrOt0iZY
         mXcTtjGORGlXuftjvmwAbYdoo886mFdpbQ7yBJMcKR9tBMeFZ3u2AhfG1qu0OoM09vwE
         F23ILEVbZjS8tYFV0ozSRb123xgyCjPTUidA7EmrFAK65E9gMz9DwlvzoGX9/d4M1sUn
         Bx/ST0KiUO2N8HV/6NP3g8prIJLUfx4DWXvekImeHnduQz59Krl2QZ2ih2GTsVbje1L/
         SvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367501; x=1695972301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikEYmQzmJt+hlZnAwmi7NxcQsQZnrnLKV9+fSm5aNvc=;
        b=R5gJWAyuQ7iOCl80V3m0pUvz3L6L+Dy3JOIA6NfSn3voTtSXI/L/xA68414oIkKnGq
         xio45zmEWbdISpSgLKrWtulab6Q3+oTeEjVwwst2c+Mq+IU2iSzFSiy76fJN+vhKwfKT
         HrWZXG+kD7MV6CI49nEFCzKGrFbTAn4rMa9e7gIZ74VrCuX0S2/zUEpYOWZMhOUVeQAq
         MC9iADU2nK3YDhYNyFHc35BxIbgO/54fs1/DsWBK6dQdyJkE/in3ha/Sitaj9wRGwN+o
         Lymu3HgzsRr356Qda3fNy8m+T2Z+Z77dCUvkPpmpxfpFeBFmu7uD9HPn8zbMgBhex/lB
         I80A==
X-Gm-Message-State: AOJu0YzGPMnp68Y4GESk0Yd1T80fDGH0C6k+CLhkXf1deShxWaL0Js1C
	+PaNa0UN7xB/9flA6K8FvgzM7yzvygA=
X-Google-Smtp-Source: AGHT+IHbNGdYOatP0czQjzzajhV4aOpCuzUlY4VTQMpn9p8RNNN/yBZEU3aslcQuilQ/lkLJDYUOvw==
X-Received: by 2002:a17:906:4789:b0:9ad:93c8:c483 with SMTP id cw9-20020a170906478900b009ad93c8c483mr2995358ejc.2.1695367481331;
        Fri, 22 Sep 2023 00:24:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/40] createrepo-c: upgrade 0.21.1 -> 1.0.0
Date: Fri, 22 Sep 2023 09:24:02 +0200
Message-Id: <20230922072431.1481743-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188083

Enable zstd in libsolv, as new createrepo_c is using that instead of
zlib for repo metadata compression.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...arser.c-add-a-missing-parameter-name.patch | 39 -------------------
 ...repo-c_0.21.1.bb => createrepo-c_1.0.0.bb} |  3 +-
 .../libsolv/libsolv_0.7.24.bb                 |  4 +-
 3 files changed, 3 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.21.1.bb => createrepo-c_1.0.0.bb} (92%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
deleted file mode 100644
index 0d1c6b08fbc..00000000000
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 970b901e1999f415da8bac205f526c808ddad0ba Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 8 May 2023 10:40:43 +0200
-Subject: [PATCH] src/cmd_parser.c: add a missing parameter name
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This resolves the following error with older versions of gcc:
-| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-native/0.21.1-r0/git/src/cmd_parser.c: In function ‘duplicated_nevra_option_parser’:
-| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-native/0.21.1-r0/git/src/cmd_parser.c:76:32: error: parameter name omitted
-|    76 | duplicated_nevra_option_parser(const gchar *,
-|       |                                ^~~~~~~~~~~~~
-| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-native/0.21.1-r0/git/src/cmd_parser.c:78:32: error: parameter name omitted
-|    78 |                                gpointer,
-|       |                                ^~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/366]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/cmd_parser.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/cmd_parser.c b/src/cmd_parser.c
-index 97c9ea7..63af7ea 100644
---- a/src/cmd_parser.c
-+++ b/src/cmd_parser.c
-@@ -73,9 +73,9 @@ struct CmdOptions _cmd_options = {
- 
- 
- gboolean
--duplicated_nevra_option_parser(const gchar *,
-+duplicated_nevra_option_parser(const gchar *option_name,
-                                const gchar *value,
--                               gpointer,
-+                               gpointer data,
-                                GError **error)
- {
-     if (!g_strcmp0(value, "keep"))
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
similarity index 92%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
index 57f23b8dfdb..9b109327c8f 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-include-rpm-rpmstring.h.patch \
-           file://0001-src-cmd_parser.c-add-a-missing-parameter-name.patch \
            file://time64fix.patch \
            "
 
-SRCREV = "0652d7303ce236e596c83c29ccc9bee7868fce6e"
+SRCREV = "0cc13920991b2fb8f87fb9d352bd3394c2983289"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.24.bb b/meta/recipes-extended/libsolv/libsolv_0.7.24.bb
index 7c8f1fd372d..11825270147 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.24.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.24.bb
@@ -6,7 +6,7 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
-DEPENDS = "expat zlib"
+DEPENDS = "expat zlib zstd"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
@@ -23,7 +23,7 @@ inherit cmake
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm','rpm','',d)}"
 PACKAGECONFIG[rpm] = "-DENABLE_RPMMD=ON -DENABLE_RPMDB=ON,,rpm"
 
-EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON"
+EXTRA_OECMAKE = "-DMULTI_SEMANTICS=ON -DENABLE_COMPLEX_DEPS=ON -DENABLE_ZSTD_COMPRESSION=ON"
 
 PACKAGES =+ "${PN}-tools ${PN}ext"
 
-- 
2.30.2


