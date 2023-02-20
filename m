Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA25EC6379F
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:21:02 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.27681.1676931652644316702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0ViI/w8m;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id cp9so3856549pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXFcDD1ADQbZVykYmih4blxzVECTq2HWp8Ggwa5nAlU=;
        b=0ViI/w8m41MHc8D65ln0Lss7EtvSiuBNY1iOq+1YnTSze8rybmGVbzMhT4/SgOpKJ1
         ghdZtXyH7Qc36Ad4GkVMJNI78nFTOBjuK+cE4GsOBBnYEYNDgHRwREwNTNolgoXkE7WG
         kIL9SGMkb4Q3QFM/On2BpI32J70Ti96SvjljcwW+x6dpbQOEmNr8aPwbAN0KMFwIiKXK
         C6fXznouHon4lRFSVXH/4sIgiTHXffYCDATuAiZJiWQWuOE8HAC+DsiJ+oaM174QUVMY
         EbXfSdsgK6TLk27spwJJCOq8YHL9D3nFQoSnxhx3r4sQenc+s/JnHwn/HucmzAJAgjQr
         RN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXFcDD1ADQbZVykYmih4blxzVECTq2HWp8Ggwa5nAlU=;
        b=c1v7qE7TEkrz5cRf33XVR/HTXNRjWsJEUaTYnyrwXjh9v3m9xetsl57/TFqZF9PzKB
         hSfzq7i7roTLocjUFKpUk/vJQOOAcPXjS2rg9FmsXeJ4Ia+q0HaiTyibMcyl0ongcM4C
         Yrs9MY3jDMv0oXeP/3BNFnNDANWYgbc+KU5YfE/jcO+Q/Kgd3anl+yZebb6aJ/KhWF+L
         v07mBtYxSZdWb7t+aWbc1TKr1q8CRlvKqIKUetmQSgCvldKJjmZP2GJOg2lhGTJ89l5l
         XHAYQZoHhaReeROGwO835A6xB/dv2x5yQHCLy4SBcl1PkV1u+3kb5iu0/7sSYloT7Ot0
         YeYA==
X-Gm-Message-State: AO0yUKV/Ncf3RrlRCh5RNlON4dIKhNfomWZYaKpnnYGuhUhkzBd0HMn8
	7b1+EBZ6rD+hM90Q7dhmmfV3u7ebeeTTNIV2s/A=
X-Google-Smtp-Source: AK7set95neXCsVWFWgSb+E7zCszTGcyNDveIRRUcAi1s4RnOY4zfQD5QYSUn0umxVke4OSwESC9KPA==
X-Received: by 2002:a17:903:41d1:b0:19a:a2d8:f252 with SMTP id u17-20020a17090341d100b0019aa2d8f252mr4395726ple.27.1676931651564;
        Mon, 20 Feb 2023 14:20:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/16] meta: remove True option to getVar and getVarFlag calls (again)
Date: Mon, 20 Feb 2023 12:20:19 -1000
Message-Id: <4ec04d14899cb7725ce908e3ef6302838275f0a8.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177472

From: Martin Jansa <Martin.Jansa@gmail.com>

* True is default since 2016 and most layers were already updated
  not to pass this parameter where not necessary, e.g. oe-core was
  updated couple times, first in:
  https://git.openembedded.org/openembedded-core/commit/?id=7c552996597faaee2fbee185b250c0ee30ea3b5f

  Updated with the same regexp as later oe-core update:
  https://git.openembedded.org/openembedded-core/commit/?id=9f551d588693328e4d99d33be94f26684eafcaba

  with small modification to replace not only d.getVar, but also data.getVar as in e.g.:
  e.data.getVar('ERR_REPORT_USERNAME', True)

  and for getVarFlag:
  sed -e 's|\(d\.getVarFlag \?\)( \?\([^,()]*, \?[^,()]*\), \?True)|\1(\2)|g' \
      -i $(git grep -E 'getVarFlag ?\( ?([^,()]*), ?([^,()]*), ?True\)' \
          | cut -d':' -f1 \
          | sort -u)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 26c74fd10614582e177437608908eb43688ab510)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 24a86d0c55ee89ae0dc77975e1d0ee02898d2289)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit de7bf6689a19dc614ce4b39c84ffd825bee1b962)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass          | 2 +-
 meta/classes/license_image.bbclass  | 2 +-
 meta/recipes-devtools/go/go_1.14.bb | 4 ++--
 scripts/lib/devtool/menuconfig.py   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0d77d2f676..a241543ff2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -437,7 +437,7 @@ python () {
         localdata.delVar('DATETIME')
         localdata.delVar('DATE')
         localdata.delVar('TMPDIR')
-        vardepsexclude = (d.getVarFlag('IMAGE_CMD_' + realt, 'vardepsexclude', True) or '').split()
+        vardepsexclude = (d.getVarFlag('IMAGE_CMD_' + realt, 'vardepsexclude') or '').split()
         for dep in vardepsexclude:
             localdata.delVar(dep)
 
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index 9f3a0c3727..325b3cbba7 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -211,7 +211,7 @@ def get_deployed_dependencies(d):
     deploy = {}
     # Get all the dependencies for the current task (rootfs).
     taskdata = d.getVar("BB_TASKDEPDATA", False)
-    pn = d.getVar("PN", True)
+    pn = d.getVar("PN")
     depends = list(set([dep[0] for dep
                     in list(taskdata.values())
                     if not dep[0].endswith("-native") and not dep[0] == pn]))
diff --git a/meta/recipes-devtools/go/go_1.14.bb b/meta/recipes-devtools/go/go_1.14.bb
index c17527998b..76ff788238 100644
--- a/meta/recipes-devtools/go/go_1.14.bb
+++ b/meta/recipes-devtools/go/go_1.14.bb
@@ -7,8 +7,8 @@ export CGO_ENABLED_riscv64 = ""
 # windows/mips/riscv doesn't support -buildmode=pie, so skip the QA checking
 # for windows/mips/riscv and their variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in d.getVar('TARGET_ARCH',True) or 'windows' in d.getVar('TARGET_GOOS', True):
-        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN',True), " textrel")
+    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv' in d.getVar('TARGET_ARCH') or 'windows' in d.getVar('TARGET_GOOS'):
+        d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
     else:
         d.setVar('GOBUILDMODE', 'pie')
 }
diff --git a/scripts/lib/devtool/menuconfig.py b/scripts/lib/devtool/menuconfig.py
index 95384c5333..ff9227035d 100644
--- a/scripts/lib/devtool/menuconfig.py
+++ b/scripts/lib/devtool/menuconfig.py
@@ -43,7 +43,7 @@ def menuconfig(args, config, basepath, workspace):
             return 1
 
         check_workspace_recipe(workspace, args.component)
-        pn = rd.getVar('PN', True)
+        pn = rd.getVar('PN')
 
         if not rd.getVarFlag('do_menuconfig','task'):
             raise DevtoolError("This recipe does not support menuconfig option")
-- 
2.34.1


