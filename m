Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BC0C7EE2F
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:24:14 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.39173.1683653048392299805
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mwoEWlea;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-965cc5170bdso875391066b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683653047; x=1686245047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HY9oPqfJnK5Qw7Cq1UP/Xnx+uB3AhOHWyi3glshysxs=;
        b=mwoEWleavv4V397AOgcmRJzuQgXU+9bMqmuL/A1c6n/FhPwrNrMiPqwoaNFooVJTzp
         TC1z6w6+0/9EdP+W0U2IVJUEMLePFRsE3rOgDU4dSKGrw9HkNZGLsghzyuab4ZN7XIYy
         JowzLzrk7Vy3eNjuFR6pdEaduYLURbYlearN9wiMaxUChwsye+NUtZd5n5223PYf2Zup
         4j5ku/N/nbXbexbO0LirKpUWjzaPXMoZIV1sjhgTvnD3UgTiOPWIdlQBJ+Ycnlp29xrs
         psjCtg43swtDjDIO7Af+apYeGicxGrL/dE6VsTT11i/7A/dg/xz3pyICmB/79tkYpFW6
         cppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683653047; x=1686245047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY9oPqfJnK5Qw7Cq1UP/Xnx+uB3AhOHWyi3glshysxs=;
        b=JPBgwB64fJ+mIKklxZVuZ9rDIeNHykMYib8+X5GNoXTj9BGotVoj4Tq2C39Fmgqobn
         pzHkZ1Sn/XUEevOfnsnbhp3WwhzHeLLWyBB4I5q37WkuOZ2oY/XoZCuqiVOmfKCM0mAW
         v6VUWZrFYYB2zHyXMUDC9Llisv3gjdoSVp/8DwlIqmnUcb/75uzgZXF0eenumBfpidBD
         MXmiHhteJQjxqke6fW8U5p7YnsgvT5Afy2KhzAn++lTh704PySc5mxXpEbR2Dve+zNmy
         As48SMkU627p37yQ5vtNF+SWfOL7kheC6ShbFYYn8Rl38c9ocMDBrbQjsEPBuiwPiXUQ
         eE5w==
X-Gm-Message-State: AC+VfDzN3dqHkDFQa3OXAymbIsVyHHjB6u0IQhZkUTyTiXpxprEG1dLa
	mn6dLrxzkT6gh0iBmVkvQczzMqWbA3A=
X-Google-Smtp-Source: ACHHUZ6296eFkbHlT9ciB9EEWNmkANo7S2QOVjg2rXrHvEud++ADmeYmITlbBwICZTcl4gz33nUu4w==
X-Received: by 2002:a17:907:a01:b0:94a:5d5c:fe6f with SMTP id bb1-20020a1709070a0100b0094a5d5cfe6fmr11868612ejc.47.1683653046784;
        Tue, 09 May 2023 10:24:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id jz24-20020a17090775f800b0096347ef816dsm1578252ejc.64.2023.05.09.10.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:24:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/27] createrepo-c: update 0.20.1 -> 0.21.1
Date: Tue,  9 May 2023 19:23:43 +0200
Message-Id: <20230509172344.1516743-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230509172344.1516743-1-alex@linutronix.de>
References: <20230509172344.1516743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181082

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-include-rpm-rpmstring.h.patch        |  9 +++--
 ...arser.c-add-a-missing-parameter-name.patch | 39 +++++++++++++++++++
 ...epo-c_0.20.1.bb => createrepo-c_0.21.1.bb} |  3 +-
 3 files changed, 47 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.20.1.bb => createrepo-c_0.21.1.bb} (92%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
index a249eaf5a19..b7e5710b391 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
@@ -1,7 +1,7 @@
-From 8defe6aaf91613c3fcb540df65a94cd56d377367 Mon Sep 17 00:00:00 2001
+From eb66326c3fc6e942282d01ddd56659c78ed7400b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 13 Jan 2023 13:21:51 -0800
-Subject: [PATCH 1/2] include rpm/rpmstring.h
+Subject: [PATCH] include rpm/rpmstring.h
 
 Its needed for rasprintf declaration
 
@@ -11,10 +11,13 @@ on 'rasprintf'; ISO C99 and later do not support implicit function declarations
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/340]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/xml_file.c | 1 +
  1 file changed, 1 insertion(+)
 
+diff --git a/src/xml_file.c b/src/xml_file.c
+index d2400b8..871109c 100644
 --- a/src/xml_file.c
 +++ b/src/xml_file.c
 @@ -19,6 +19,7 @@
@@ -23,5 +26,5 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <glib/gstdio.h>
 +#include <rpm/rpmstring.h>
  #include <assert.h>
+ #include <rpm/rpmstring.h>
  #include "xml_file.h"
- #include <errno.h>
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
new file mode 100644
index 00000000000..0d1c6b08fbc
--- /dev/null
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patch
@@ -0,0 +1,39 @@
+From 970b901e1999f415da8bac205f526c808ddad0ba Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 8 May 2023 10:40:43 +0200
+Subject: [PATCH] src/cmd_parser.c: add a missing parameter name
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This resolves the following error with older versions of gcc:
+| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-native/0.21.1-r0/git/src/cmd_parser.c: In function ‘duplicated_nevra_option_parser’:
+| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-native/0.21.1-r0/git/src/cmd_parser.c:76:32: error: parameter name omitted
+|    76 | duplicated_nevra_option_parser(const gchar *,
+|       |                                ^~~~~~~~~~~~~
+| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-native/0.21.1-r0/git/src/cmd_parser.c:78:32: error: parameter name omitted
+|    78 |                                gpointer,
+|       |                                ^~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/366]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/cmd_parser.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/cmd_parser.c b/src/cmd_parser.c
+index 97c9ea7..63af7ea 100644
+--- a/src/cmd_parser.c
++++ b/src/cmd_parser.c
+@@ -73,9 +73,9 @@ struct CmdOptions _cmd_options = {
+ 
+ 
+ gboolean
+-duplicated_nevra_option_parser(const gchar *,
++duplicated_nevra_option_parser(const gchar *option_name,
+                                const gchar *value,
+-                               gpointer,
++                               gpointer data,
+                                GError **error)
+ {
+     if (!g_strcmp0(value, "keep"))
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
similarity index 92%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
index 1c4cdd5e3c0..5080131dc1e 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0001-include-rpm-rpmstring.h.patch \
+           file://0001-src-cmd_parser.c-add-a-missing-parameter-name.patch \
            "
 
-SRCREV = "af14e164a3e4ab9dfaef1212e852b9ecebc326a2"
+SRCREV = "0652d7303ce236e596c83c29ccc9bee7868fce6e"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


