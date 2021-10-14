Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59918C433FE
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:10:30 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.8334.1634213429015372162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WVzI4M6e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id r18so18789168wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0HjUJhox9YGcae5i0sZi/Gq74+r9Z/03SvmXLvrFMNk=;
        b=WVzI4M6eF5tgFwmyY6D8HS0CX/L7UKfeQLs2o7Sw6bcNPRsABq5r2Eqklq3DMb9fJK
         j1YNf6Nim71toDV1X8TZaT4dHUScG//aCi6lHKtwmL5GzTf+AnIEWT8Xeo4G1KEnWaZU
         M8heTdODNLKwneywVT4BOTrGOdcSRHA2/iwbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0HjUJhox9YGcae5i0sZi/Gq74+r9Z/03SvmXLvrFMNk=;
        b=q6PZ4pvMehEW9Xog7+Rh9hBuxYEeL0o14GdWVlH1/ba+WaBZVUJCMycd2o0u180GGV
         lAZggf2Jjp4+YMAuwJsUL94KL1HxdeJL6dhtRNezyi4Bw6xoyHLbOQlyuuOVGUpgU3ce
         eQ1R6YabWTke9ssgXE2VaO31KJS3N0rN2DfdTkbeinqLZ+AeUMIN53RllqcWaNk21yky
         daI4O1mK8ESbOiorzf6lfUeGhqjtWL8mOLbbJFYiKaLMqSiug8ck7O0tWl8j1NHZV5+K
         Rn3H4NZ7VhOFq3FiKR9oC2WiPkZFW5sj7ScQpAewZzLQNmhybUTgWn1ME27y8d+bl1lr
         ZNUg==
X-Gm-Message-State: AOAM532PXqCJ96j1FWY4g1tBfpvjdvBDKpNOHzurn9rgtImQ8rvRY+A2
	Vqbgq+b2DTvc8xWFWSgvxT0Fuf7wd1dZyg==
X-Google-Smtp-Source: 
 ABdhPJxZx7zGay5PfPdkIanzTEXu+yNR170OOZ7nMTPvVfF5AkoIWpdrHR98MIG3B2EAkJeqb9pEPA==
X-Received: by 2002:adf:f1cd:: with SMTP id z13mr6318503wro.101.1634213427457;
        Thu, 14 Oct 2021 05:10:27 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 10sm4296152wme.27.2021.10.14.05.10.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:10:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] reproducible: Move class function code into library
Date: Thu, 14 Oct 2021 13:10:21 +0100
Message-Id: <20211014121025.2913401-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:10:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156938

To try and avoid parse/memory overhead of functions within bitbake,
move the bulk of the reproducibility functions to the function library.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass               |  2 +-
 meta/classes/reproducible_build.bbclass | 37 ++-----------------------
 meta/lib/oe/reproducible.py             | 33 ++++++++++++++++++++++
 3 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 59fd46e5d43..bca3944ae70 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -12,7 +12,7 @@ inherit logging
 
 OE_EXTRA_IMPORTS ?= ""
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa ${OE_EXTRA_IMPORTS}"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible ${OE_EXTRA_IMPORTS}"
 OE_IMPORTS[type] = "list"
 
 PACKAGECONFIG_CONFARGS ??= ""
diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 3f661794c61..0f45b782e5d 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -91,19 +91,8 @@ addtask do_deploy_source_date_epoch_setscene
 addtask do_deploy_source_date_epoch before do_configure after do_patch
 
 python create_source_date_epoch_stamp() {
-    import oe.reproducible
-
-    epochfile = d.getVar('SDE_FILE')
-    tmp_file = "%s.new" % epochfile
-
     source_date_epoch = oe.reproducible.get_source_date_epoch(d, d.getVar('S'))
-
-    bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
-    bb.utils.mkdirhier(d.getVar('SDE_DIR'))
-    with open(tmp_file, 'w') as f:
-        f.write(str(source_date_epoch))
-
-    os.rename(tmp_file, epochfile)
+    oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FILE'), d)
 }
 
 EPOCHTASK = "do_deploy_source_date_epoch"
@@ -112,29 +101,7 @@ EPOCHTASK = "do_deploy_source_date_epoch"
 do_unpack[postfuncs] += "create_source_date_epoch_stamp"
 
 def get_source_date_epoch_value(d):
-    epochfile = d.getVar('SDE_FILE')
-    cached, efile = d.getVar('__CACHED_SOURCE_DATE_EPOCH') or (None, None)
-    if cached and efile == epochfile:
-        return cached
-
-    if cached and epochfile != efile:
-        bb.debug(1, "Epoch file changed from %s to %s" % (efile, epochfile))
-
-    source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
-    try:
-        with open(epochfile, 'r') as f:
-            s = f.read()
-            try:
-                source_date_epoch = int(s)
-            except ValueError:
-                bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK" % s)
-                source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
-        bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
-    except FileNotFoundError:
-        bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d" % (epochfile, source_date_epoch))
-
-    d.setVar('__CACHED_SOURCE_DATE_EPOCH', (str(source_date_epoch), epochfile))
-    return str(source_date_epoch)
+    return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
 
 export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
 BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 204b9bd734a..a5000574cfa 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -106,3 +106,36 @@ def get_source_date_epoch(d, sourcedir):
         fixed_source_date_epoch(d)       # Last resort
     )
 
+def epochfile_read(epochfile, d):
+    cached, efile = d.getVar('__CACHED_SOURCE_DATE_EPOCH') or (None, None)
+    if cached and efile == epochfile:
+        return cached
+
+    if cached and epochfile != efile:
+        bb.debug(1, "Epoch file changed from %s to %s" % (efile, epochfile))
+
+    source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
+    try:
+        with open(epochfile, 'r') as f:
+            s = f.read()
+            try:
+                source_date_epoch = int(s)
+            except ValueError:
+                bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK" % s)
+                source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
+        bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
+    except FileNotFoundError:
+        bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d" % (epochfile, source_date_epoch))
+
+    d.setVar('__CACHED_SOURCE_DATE_EPOCH', (str(source_date_epoch), epochfile))
+    return str(source_date_epoch)
+
+def epochfile_write(source_date_epoch, epochfile, d):
+
+    bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
+    bb.utils.mkdirhier(os.path.dirname(epochfile))
+
+    tmp_file = "%s.new" % epochfile
+    with open(tmp_file, 'w') as f:
+        f.write(str(source_date_epoch))
+    os.rename(tmp_file, epochfile)
-- 
2.32.0


