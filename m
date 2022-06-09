Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431A2CCA481
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 11:37:42 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.12159.1654774658096656548
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 04:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Umok79cK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id p10so32004783wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 04:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uLurBpkY2hBuBz9IrRrw63N0se8Z72QUdN92LjRuWQo=;
        b=Umok79cKznOf5DtVtPxQ5NImX/u9QmCcDVkzpblcghXV4IqbeY96aWj4bhjMmkxKQK
         7zxGlupW3ZWMW2gkvgkTs38bEbLtzsjwR2H7k4gh1RW3nguB7IY4NHwWqv96vn15v3P+
         YXlu3rDSE5EVod5UXQbJj95yAsNy1I/HO3ahQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uLurBpkY2hBuBz9IrRrw63N0se8Z72QUdN92LjRuWQo=;
        b=nzS7jVvKvovLToDomMm8XnK1gCuvP64lXttN0umEqZiM2AY3ozS2V8CMTKH+IVABkN
         eL7KwR1bjc3w1qaXnDV64jgmHG01cKXt1eGiIaM2NVQgVTip0Tw8HwEKFHRAc1mj42Hf
         FnGgtLQ5kwzQg+cjoUD3zJWOyCTk4B8N5a7/r7RrJSQPS5VM7uSXxWBvw3BQPtkOZs6x
         XvBFtWgm/BDSUu2RPfM0qpGayvTOUitkU/LygV0kS1Tel6IKWYX2/DfQ9rSfyzvepfTB
         xW+dcWzRsKV0ObtydI8j4yK9K3QOO35Cmf+wsJCv7IfkIDp3k8PTy89c4QIuvNZdKH5g
         fRog==
X-Gm-Message-State: AOAM533U/rh1pC2BGOrnZWuFvhVotASAtnRrANVAKB0GY0gQre4pIQWa
	EE4vjeltQ/bVqwQw9OivV9wGLZpc0EfeGA==
X-Google-Smtp-Source: 
 ABdhPJwbGzEnerYgd8pkfpBFMEwFzujmgj9AezhcX/HLr6UgY8WXPVhINz9U+PAP35SBcX71x29Rdw==
X-Received: by 2002:a5d:6a92:0:b0:210:3387:23ec with SMTP id
 s18-20020a5d6a92000000b00210338723ecmr37674359wru.102.1654774656273;
        Thu, 09 Jun 2022 04:37:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2888:8172:672a:5175])
        by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c4fc500b0039c5a765388sm9843899wmq.28.2022.06.09.04.37.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:37:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] base/buildhistory/image-buildinfo: Use common buildcfg
 function
Date: Thu,  9 Jun 2022 12:37:31 +0100
Message-Id: <20220609113732.43566-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113732.43566-1-richard.purdie@linuxfoundation.org>
References: <20220609113732.43566-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 11:37:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166773

Reduce code duplication to a common function in oe.buildcfg.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass            |  7 ++-----
 meta/classes/buildhistory.bbclass    | 10 +++-------
 meta/classes/image-buildinfo.bbclass |  8 ++------
 meta/lib/oe/buildcfg.py              |  7 +++++++
 4 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index f59e95fef06..20968a50766 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -218,11 +218,8 @@ def get_source_date_epoch_value(d):
     return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
 
 def get_layers_branch_rev(d):
-    layers = (d.getVar("BBLAYERS") or "").split()
-    layers_branch_rev = ["%-20s = \"%s:%s\"" % (os.path.basename(i), \
-        oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
-        oe.buildcfg.get_metadata_git_revision(i, None)) \
-            for i in layers]
+    revisions = oe.buildcfg.get_layer_revisions(d)
+    layers_branch_rev = ["%-20s = \"%s:%s\"" % (r[1], r[2], r[3]) for r in revisions]
     i = len(layers_branch_rev)-1
     p1 = layers_branch_rev[i].find("=")
     s1 = layers_branch_rev[i][p1:]
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 6fffd471896..4ba9ec8f25d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -742,13 +742,9 @@ def buildhistory_get_build_id(d):
     return('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
 
 def buildhistory_get_metadata_revs(d):
-    # We want an easily machine-readable format here, so get_layers_branch_rev isn't quite what we want
-    layers = (d.getVar("BBLAYERS") or "").split()
-    medadata_revs = ["%-17s = %s:%s%s" % (os.path.basename(i), \
-        oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
-        oe.buildcfg.get_metadata_git_revision(i, None), \
-        oe.buildcfg.is_layer_modified(i)) \
-            for i in layers]
+    # We want an easily machine-readable format here
+    revisions = oe.buildcfg.get_layer_revisions(d)
+    medadata_revs = ["%-17s = %s:%s%s" % (r[1], r[2], r[3], r[4]) for r in revisions]
     return '\n'.join(medadata_revs)
 
 def outputvars(vars, listvars, d):
diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index c149660f31a..d4a12b5e102 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -28,12 +28,8 @@ def image_buildinfo_outputvars(vars, d):
 
 # Returns layer revisions along with their respective status
 def get_layer_revs(d):
-    layers = (d.getVar("BBLAYERS") or "").split()
-    medadata_revs = ["%-17s = %s:%s %s" % (os.path.basename(i), \
-        oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
-        oe.buildcfg.get_metadata_git_revision(i, None), \
-        oe.buildcfg.is_layer_modified(i)) \
-            for i in layers]
+    revisions = oe.buildcfg.get_layer_revisions(d)
+    medadata_revs = ["%-17s = %s:%s%s" % (r[1], r[2], r[3], r[4]) for r in revisions]
     return '\n'.join(medadata_revs)
 
 def buildinfo_target(d):
diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index 364c40a2f02..90f5e057153 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -40,3 +40,10 @@ def is_layer_modified(path):
         # (expected) return code 1 in a modified git repo. For example, we get
         # output and a 129 return code when a layer isn't a git repo at all.
         return " -- modified"
+
+def get_layer_revisions(d):
+    layers = (d.getVar("BBLAYERS") or "").split()
+    revisions = []
+    for i in layers:
+        revisions.append((i, os.path.basename(i), get_metadata_git_branch(i, None).strip(), get_metadata_git_revision(i, None), is_layer_modified(i)))
+    return revisions
-- 
2.34.1


