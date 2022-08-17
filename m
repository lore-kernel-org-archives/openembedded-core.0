Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F97C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:16:35 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.30062.1660749387985526708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VUycmsdD;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id g18so3797044pju.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=UFVXjiSvHc/yUyYyuh5rrZbxonpDGgrYztvDGuSr/tE=;
        b=VUycmsdD/E9U6izcMFTlJOqNzBv80WCI4aHzILpkov1OIl4+S2TWFtDiUAawO2+fgB
         T370t55cXEwaT3XfY+E3hQc16cXVa1ugIgKzTbVuaQlGsXCT5IA97ik3bOG2k2MbGSSF
         mw3h264XSpUiTsCah3IZQi0t9IMGEC9kT6BEGEs2Ok390mqQoj/7vgmwLgrdCe6ae0df
         VS0uc6QmXF1jT0Y98+r9PvAprLNDPCD6QAaVKC/3/kqTrg8+6g/7ZAu3d5PoRCF4+29s
         UaQP4o3I8DCvVP+xA7MfoX9pyr3ZV3KomIzUdCMOQvWRrfBttvVmd9mlDcNF+Af7KjcQ
         +xmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=UFVXjiSvHc/yUyYyuh5rrZbxonpDGgrYztvDGuSr/tE=;
        b=z3ylYogVMbroObBwGQKgeEZ4tnrGlNxzHSf14+xML7HtcIQC9jGtXMbFsSrChDgNe5
         4upKesRjrMqNfpYxVrFviwHBb93p20fBg2TTyp83U+vSs4ML96ZD7ufDmw6goC27Uy07
         jTczhtUpqvKrS5KGHLcBPCVExX1YvTxSF6yTLGQ97NYJWuao/DPLa7PxFEFHaUMoplvC
         j24TBZ0ogOOd30CFrypoDBo2B9/fBDmgBeI/JIm6Vqf2dGspGt84w6eKB9QMlg2IW94k
         P21Kb+0Yy0hn5JYLeGHVJdrVYXOiTQNj4yiQMh3swE1aI3A06bCm6cWF3jOov3LWweER
         u7+g==
X-Gm-Message-State: ACgBeo1VMJun/Cn4+oeQ/2gHK970DoP6e6wkaWDZ5KG+WecP17dxsPSm
	aqzPhO/zKdoBxdGRlLyeuszvyfJamUuudQ==
X-Google-Smtp-Source: 
 AA6agR4HaXeyOu/u4WCTOoQWOjKvsSoEZOJ0ms5+V21ZT68/5OR1CgvTZtv5sQAVIMlfnCYGn3H0tw==
X-Received: by 2002:a17:90b:4a05:b0:1f5:62d5:4155 with SMTP id
 kk5-20020a17090b4a0500b001f562d54155mr4396521pjb.6.1660749386747;
        Wed, 17 Aug 2022 08:16:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 h29-20020aa79f5d000000b0052d981e7842sm10537583pfr.208.2022.08.17.08.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 08:16:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] rpm: Remove -Wimplicit-function-declaration warnings
Date: Wed, 17 Aug 2022 08:16:24 -0700
Message-Id: <20220817151624.3946330-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 15:16:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169491

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Squash the patch into another patch which introduced it
v3: Delete now unused patch from metadata

 ...lling-execute-package-scriptlets-wit.patch | 18 ++++++++-----
 ...ude-lib-rpmchroot.h-for-rpmChrootOut.patch | 26 -------------------
 meta/recipes-devtools/rpm/rpm_4.17.1.bb       |  1 -
 3 files changed, 11 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-rpmscript-Include-lib-rpmchroot.h-for-rpmChrootOut.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
index 4020a31092..2a0069cafe 100644
--- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
+++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
@@ -28,11 +28,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  lib/rpmscript.c | 11 ++++++++---
  1 file changed, 8 insertions(+), 3 deletions(-)
 
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index cc98c4885..f8bd3df04 100644
 --- a/lib/rpmscript.c
 +++ b/lib/rpmscript.c
-@@ -394,8 +394,7 @@ exit:
+@@ -17,7 +17,7 @@
+ #include "rpmio/rpmio_internal.h"
+ 
+ #include "lib/rpmplugins.h"     /* rpm plugins hooks */
+-
++#include "lib/rpmchroot.h"      /* rpmChrootOut */
+ #include "debug.h"
+ 
+ struct scriptNextFileFunc_s {
+@@ -391,8 +391,7 @@ exit:
  	Fclose(out);	/* XXX dup'd STDOUT_FILENO */
  
      if (fn) {
@@ -42,7 +49,7 @@ index cc98c4885..f8bd3df04 100644
  	free(fn);
      }
      free(mline);
-@@ -428,7 +427,13 @@ rpmRC rpmScriptRun(rpmScript script, int arg1, int arg2, FD_t scriptFd,
+@@ -426,7 +425,13 @@ rpmRC rpmScriptRun(rpmScript script, int
  
      if (rc != RPMRC_FAIL) {
  	if (script_type & RPMSCRIPTLET_EXEC) {
@@ -57,6 +64,3 @@ index cc98c4885..f8bd3df04 100644
  	} else {
  	    rc = runLuaScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
  	}
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/rpm/files/0001-rpmscript-Include-lib-rpmchroot.h-for-rpmChrootOut.patch b/meta/recipes-devtools/rpm/files/0001-rpmscript-Include-lib-rpmchroot.h-for-rpmChrootOut.patch
deleted file mode 100644
index 2e0665853b..0000000000
--- a/meta/recipes-devtools/rpm/files/0001-rpmscript-Include-lib-rpmchroot.h-for-rpmChrootOut.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From fee6dd39e7223700cc4f7e073924b18409b645b6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 15 Aug 2022 22:45:23 -0700
-Subject: [PATCH] rpmscript: Include lib/rpmchroot.h for rpmChrootOut()
-
-This fixes implicit function declarations warning
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/2152]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/rpmscript.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/rpmscript.c b/lib/rpmscript.c
-index 3e3a0027a..6d6d4c507 100644
---- a/lib/rpmscript.c
-+++ b/lib/rpmscript.c
-@@ -17,7 +17,7 @@
- #include "rpmio/rpmio_internal.h"
- 
- #include "lib/rpmplugins.h"     /* rpm plugins hooks */
--
-+#include "lib/rpmchroot.h" /* rpmChrootOut */
- #include "debug.h"
- 
- struct scriptNextFileFunc_s {
diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
index 66955ad98c..9b6446f265 100644
--- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.17.1.bb
@@ -40,7 +40,6 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protoc
            file://0001-docs-do-not-build-manpages-requires-pandoc.patch \
            file://0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch \
            file://0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch \
-           file://0001-rpmscript-Include-lib-rpmchroot.h-for-rpmChrootOut.patch \
            "
 
 PE = "1"
-- 
2.37.2


