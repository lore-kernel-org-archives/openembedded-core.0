Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E02CC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 11:37:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.12049.1654774656113064442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 04:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gah3dQU3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 o37-20020a05600c512500b0039c4ba4c64dso6783275wms.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 04:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+FsQcseWrPaKQOrRIBUVhdgV4WY+aHfyl7ckcm5EOI=;
        b=gah3dQU3P/LEPHd4TsSo3AfGuIHiA28pYYN+dRLVzIuEVrxNVL6Yv6SDR3PpAUKNhE
         WBxfqO9zosMgaJvp8v+e0rQqH2UYA85ZTs8r/RwZQTPcDVI04CEGc+zm99Lbv+UpOqBZ
         mHag3aEbe+wINtCTSprw3ig+CdvC+D6VrV6NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w+FsQcseWrPaKQOrRIBUVhdgV4WY+aHfyl7ckcm5EOI=;
        b=i8P7xz3ahWRljVmgE9z3jvxeoxhRGbbgmZxeAe8uVKacJ/yarPxQoLsi52ASX8xeXq
         N/hLe3JqgehoVuS0OJmvm5GaSTzYwHq//LhQIw/SU6VPhBW5y1btJ5TrP2JBMMCL91je
         gEWN+9PiQFiZDB6Okhf68VC8omThFa+FGA4T1c3C4kiwROwBM/00ASQjayYN/HaSDAov
         YD3O1yknWmOkB58V7dODKpdFh+Om2QrJU8wADlsUeeTj4dwdvLcuEIhMMHIQOOgUDMQg
         lcXmfvAYASzzUwCvAdB2wyKpBczSgeRIygLR7QJ+DxmciFw4mBJtOw0vQbR/G8+dr2Xk
         cHoA==
X-Gm-Message-State: AOAM530bWtntG8Q/o6AFfBhSDafRQEW/jo0nDzn24LIvGIdT7slfDqKa
	4BSyAWgxewlED/Uz7ZbALGiiPswJCYQ0pw==
X-Google-Smtp-Source: 
 ABdhPJyEZlR/ZhqUtChnVu89tVQhd9Z5489Aj9/OtNfceGbt3wq+Z+lo0zdn3b4c3WlVaSBVFYTnjg==
X-Received: by 2002:a05:600c:1d12:b0:39c:4307:8b10 with SMTP id
 l18-20020a05600c1d1200b0039c43078b10mr2836220wms.103.1654774653804;
        Thu, 09 Jun 2022 04:37:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2888:8172:672a:5175])
        by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c4fc500b0039c5a765388sm9843899wmq.28.2022.06.09.04.37.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:37:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] classes/buildcfg: Move git/layer revision code into new
 OE module buildcfg
Date: Thu,  9 Jun 2022 12:37:28 +0100
Message-Id: <20220609113732.43566-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 11:37:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166770

There is a load of duplicated git/layer/revision code which makes
most sesne as a python library, not bbclass code. Start to refactor as such.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass            |  9 +++---
 meta/classes/buildhistory.bbclass    |  4 +--
 meta/classes/image-buildinfo.bbclass |  4 +--
 meta/classes/metadata_scm.bbclass    | 43 ++--------------------------
 meta/lib/oe/buildcfg.py              | 40 ++++++++++++++++++++++++++
 5 files changed, 51 insertions(+), 49 deletions(-)
 create mode 100644 meta/lib/oe/buildcfg.py

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index bdb3ac33c67..f59e95fef06 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -7,12 +7,11 @@ inherit staging
 inherit mirrors
 inherit utils
 inherit utility-tasks
-inherit metadata_scm
 inherit logging
 
 OE_EXTRA_IMPORTS ?= ""
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible oe.rust ${OE_EXTRA_IMPORTS}"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible oe.rust oe.buildcfg ${OE_EXTRA_IMPORTS}"
 OE_IMPORTS[type] = "list"
 
 PACKAGECONFIG_CONFARGS ??= ""
@@ -35,6 +34,8 @@ def oe_import(d):
 # We need the oe module name space early (before INHERITs get added)
 OE_IMPORTED := "${@oe_import(d)}"
 
+inherit metadata_scm
+
 def lsb_distro_identifier(d):
     adjust = d.getVar('LSB_DISTRO_ADJUST')
     adjust_func = None
@@ -219,8 +220,8 @@ def get_source_date_epoch_value(d):
 def get_layers_branch_rev(d):
     layers = (d.getVar("BBLAYERS") or "").split()
     layers_branch_rev = ["%-20s = \"%s:%s\"" % (os.path.basename(i), \
-        base_get_metadata_git_branch(i, None).strip(), \
-        base_get_metadata_git_revision(i, None)) \
+        oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
+        oe.buildcfg.get_metadata_git_revision(i, None)) \
             for i in layers]
     i = len(layers_branch_rev)-1
     p1 = layers_branch_rev[i].find("=")
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 4345ffc6939..f2493b3765a 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -761,8 +761,8 @@ def buildhistory_get_metadata_revs(d):
     # We want an easily machine-readable format here, so get_layers_branch_rev isn't quite what we want
     layers = (d.getVar("BBLAYERS") or "").split()
     medadata_revs = ["%-17s = %s:%s%s" % (os.path.basename(i), \
-        base_get_metadata_git_branch(i, None).strip(), \
-        base_get_metadata_git_revision(i, None), \
+        oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
+        oe.buildcfg.get_metadata_git_revision(i, None), \
         buildhistory_get_modified(i)) \
             for i in layers]
     return '\n'.join(medadata_revs)
diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 94c585d4cd9..25ca8d8fe6b 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -46,8 +46,8 @@ def get_layer_git_status(path):
 def get_layer_revs(d):
     layers = (d.getVar("BBLAYERS") or "").split()
     medadata_revs = ["%-17s = %s:%s %s" % (os.path.basename(i), \
-        base_get_metadata_git_branch(i, None).strip(), \
-        base_get_metadata_git_revision(i, None), \
+        oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
+        oe.buildcfg.get_metadata_git_revision(i, None), \
         get_layer_git_status(i)) \
             for i in layers]
     return '\n'.join(medadata_revs)
diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 47cb969b8d8..f646b3159a4 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -1,44 +1,5 @@
-def base_detect_revision(d):
-    path = base_get_scmbasepath(d)
-    return base_get_metadata_git_revision(path, d)
 
-def base_detect_branch(d):
-    path = base_get_scmbasepath(d)
-    return base_get_metadata_git_branch(path, d)
-
-def base_get_scmbasepath(d):
-    return os.path.join(d.getVar('COREBASE'), 'meta')
-
-def base_get_metadata_svn_revision(path, d):
-    # This only works with older subversion. For newer versions 
-    # this function will need to be fixed by someone interested
-    revision = "<unknown>"
-    try:
-        with open("%s/.svn/entries" % path) as f:
-            revision = f.readlines()[3].strip()
-    except (IOError, IndexError):
-        pass
-    return revision
-
-def base_get_metadata_git_branch(path, d):
-    import bb.process
-
-    try:
-        rev, _ = bb.process.run('git rev-parse --abbrev-ref HEAD', cwd=path)
-    except bb.process.ExecutionError:
-        rev = '<unknown>'
-    return rev.strip()
-
-def base_get_metadata_git_revision(path, d):
-    import bb.process
-
-    try:
-        rev, _ = bb.process.run('git rev-parse HEAD', cwd=path)
-    except bb.process.ExecutionError:
-        rev = '<unknown>'
-    return rev.strip()
-
-METADATA_BRANCH := "${@base_detect_branch(d)}"
+METADATA_BRANCH := "${@oe.buildcfg.detect_branch(d)}"
 METADATA_BRANCH[vardepvalue] = "${METADATA_BRANCH}"
-METADATA_REVISION := "${@base_detect_revision(d)}"
+METADATA_REVISION := "${@oe.buildcfg.detect_revision(d)}"
 METADATA_REVISION[vardepvalue] = "${METADATA_REVISION}"
diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
new file mode 100644
index 00000000000..a749fc53039
--- /dev/null
+++ b/meta/lib/oe/buildcfg.py
@@ -0,0 +1,40 @@
+
+import subprocess
+import bb.process
+
+def detect_revision(d):
+    path = get_scmbasepath(d)
+    return get_metadata_git_revision(path, d)
+
+def detect_branch(d):
+    path = get_scmbasepath(d)
+    return get_metadata_git_branch(path, d)
+
+def get_scmbasepath(d):
+    return os.path.join(d.getVar('COREBASE'), 'meta')
+
+def get_metadata_svn_revision(path, d):
+    # This only works with older subversion. For newer versions 
+    # this function will need to be fixed by someone interested
+    revision = "<unknown>"
+    try:
+        with open("%s/.svn/entries" % path) as f:
+            revision = f.readlines()[3].strip()
+    except (IOError, IndexError):
+        pass
+    return revision
+
+def get_metadata_git_branch(path, d):
+    try:
+        rev, _ = bb.process.run('git rev-parse --abbrev-ref HEAD', cwd=path)
+    except bb.process.ExecutionError:
+        rev = '<unknown>'
+    return rev.strip()
+
+def get_metadata_git_revision(path, d):
+    try:
+        rev, _ = bb.process.run('git rev-parse HEAD', cwd=path)
+    except bb.process.ExecutionError:
+        rev = '<unknown>'
+    return rev.strip()
+         
-- 
2.34.1


