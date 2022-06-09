Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5813ECCA485
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 11:37:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.11844.1654774656878055903
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 04:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gdcs3ZpM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id q26so21638966wra.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 04:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EbaR370JcLEL0f79wM/LK3nmbFDAh2OoxOQp6sYTCeo=;
        b=gdcs3ZpMdiLEuW//KtPBUQhYd6zWh2isq7l7aOngLeSWXFxpImZrrrKTouQptlFJD5
         CzIfWQrVhFdPDAX71i/MyHtxKcefaNeBH2UjQCaebSLt+yIQQviBOTGrQzavfswcadvF
         tdXsJbCfHzwkDSMSeAHbkGSInxGk14k500Hdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EbaR370JcLEL0f79wM/LK3nmbFDAh2OoxOQp6sYTCeo=;
        b=dYwDc6ceQJaW9kPCaAwv+TDFRz8ovsPzOfN3IZu3F8X663g8jgal3eHT0/jIrm8a7Z
         YOSSAlnWnqqgB7IJ9GeOpNws/WnuMVuWr/KK0rfesDhzTi90dynFM669XXTkMFC0ATgm
         4WcCNcDZwluOWAbk6Z4XAmlaeqHM5QTwdQRGKxMd4aVoYzjJp0YYRg3UYg5sF0jIRRW7
         CH10SqLteTeZUMKLXtA22uepScc9wPFbrkTnGFUXL4blJ9z8N4ma/pjyJOCgKpBgzxv/
         VAPWquVxFavxoMOtASHm8nGMbQ82JQM9pK9YHgQysw/gbzQFM7BbSn0uVqf9RuyvlE65
         0Zmw==
X-Gm-Message-State: AOAM531qUndOj1YV1sedC8gKEoPrcN6LdkPfJ5aA+gokMf53PzJSIiZ5
	polV4BVKHHw+dMfnbeBGeZ+0wL0atMie9w==
X-Google-Smtp-Source: 
 ABdhPJwkMGpxNsmkGhYcYcI+TeVmYXT15beo91oRX8rSAZetzo4ZTl9y97v2Ir0fgFp39Z6Ofu2tLg==
X-Received: by 2002:adf:ea87:0:b0:211:68d:7c93 with SMTP id
 s7-20020adfea87000000b00211068d7c93mr37472582wrm.412.1654774654574;
        Thu, 09 Jun 2022 04:37:34 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2888:8172:672a:5175])
        by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c4fc500b0039c5a765388sm9843899wmq.28.2022.06.09.04.37.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:37:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] lib/buildcfg: Share common clean/dirty layer function
Date: Thu,  9 Jun 2022 12:37:29 +0100
Message-Id: <20220609113732.43566-2-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/166771

The comments even say this was copy/paste code. Move to a
shared library function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass    | 18 +-----------------
 meta/classes/image-buildinfo.bbclass | 18 +-----------------
 meta/lib/oe/buildcfg.py              | 15 ++++++++++++++-
 3 files changed, 16 insertions(+), 35 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index f2493b3765a..6fffd471896 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -741,29 +741,13 @@ def buildhistory_get_build_id(d):
     statusheader = d.getVar('BUILDCFG_HEADER')
     return('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
 
-def buildhistory_get_modified(path):
-    # copied from get_layer_git_status() in image-buildinfo.bbclass
-    import subprocess
-    try:
-        subprocess.check_output("""cd %s; export PSEUDO_UNLOAD=1; set -e;
-                                git diff --quiet --no-ext-diff
-                                git diff --quiet --no-ext-diff --cached""" % path,
-                                shell=True,
-                                stderr=subprocess.STDOUT)
-        return ""
-    except subprocess.CalledProcessError as ex:
-        # Silently treat errors as "modified", without checking for the
-        # (expected) return code 1 in a modified git repo. For example, we get
-        # output and a 129 return code when a layer isn't a git repo at all.
-        return " -- modified"
-
 def buildhistory_get_metadata_revs(d):
     # We want an easily machine-readable format here, so get_layers_branch_rev isn't quite what we want
     layers = (d.getVar("BBLAYERS") or "").split()
     medadata_revs = ["%-17s = %s:%s%s" % (os.path.basename(i), \
         oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
         oe.buildcfg.get_metadata_git_revision(i, None), \
-        buildhistory_get_modified(i)) \
+        oe.buildcfg.is_layer_modified(i)) \
             for i in layers]
     return '\n'.join(medadata_revs)
 
diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 25ca8d8fe6b..c149660f31a 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -26,29 +26,13 @@ def image_buildinfo_outputvars(vars, d):
         ret += "%s = %s\n" % (var, value)
     return ret.rstrip('\n')
 
-# Gets git branch's status (clean or dirty)
-def get_layer_git_status(path):
-    import subprocess
-    try:
-        subprocess.check_output("""cd %s; export PSEUDO_UNLOAD=1; set -e;
-                                git diff --quiet --no-ext-diff
-                                git diff --quiet --no-ext-diff --cached""" % path,
-                                shell=True,
-                                stderr=subprocess.STDOUT)
-        return ""
-    except subprocess.CalledProcessError as ex:
-        # Silently treat errors as "modified", without checking for the
-        # (expected) return code 1 in a modified git repo. For example, we get
-        # output and a 129 return code when a layer isn't a git repo at all.
-        return "-- modified"
-
 # Returns layer revisions along with their respective status
 def get_layer_revs(d):
     layers = (d.getVar("BBLAYERS") or "").split()
     medadata_revs = ["%-17s = %s:%s %s" % (os.path.basename(i), \
         oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
         oe.buildcfg.get_metadata_git_revision(i, None), \
-        get_layer_git_status(i)) \
+        oe.buildcfg.is_layer_modified(i)) \
             for i in layers]
     return '\n'.join(medadata_revs)
 
diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index a749fc53039..a7549f1e229 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -37,4 +37,17 @@ def get_metadata_git_revision(path, d):
     except bb.process.ExecutionError:
         rev = '<unknown>'
     return rev.strip()
-         
+
+def is_layer_modified(path):
+    try:
+        subprocess.check_output("""cd %s; export PSEUDO_UNLOAD=1; set -e;
+                                git diff --quiet --no-ext-diff
+                                git diff --quiet --no-ext-diff --cached""" % path,
+                                shell=True,
+                                stderr=subprocess.STDOUT)
+        return ""
+    except subprocess.CalledProcessError as ex:
+        # Silently treat errors as "modified", without checking for the
+        # (expected) return code 1 in a modified git repo. For example, we get
+        # output and a 129 return code when a layer isn't a git repo at all.
+        return " -- modified"
-- 
2.34.1


