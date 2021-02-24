Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.8891.1614181843240558535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 07:50:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nIdrjeN1;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id s6so2565492otk.4
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 07:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HNjjGHBCbrXJ1cfflrmBSfI7CZoSLgqmITQK53jQ5ik=;
        b=nIdrjeN1EZQ0n4wIUrrO43Szl0YqSB1d6WkUd3RTVeyiU/0/35H/tJSuPtHM8SViXC
         9M1C3algV+hTLnpFzIr+RvCPy+D0YYNuWbn4vxgEKK1FDRWefSKvCoIXlBXrdsWvafNa
         qKwXvo6yUU/Y3cy8xStKQ2+taMksF7eyzRsjZlHCp5Ucfwj2ViGC/QX/qzxT5LFipZmC
         yZ41N8EhkDbCZpfp1pPwnHiXjlxJmak1wX5mWmeKAnTgysvZEYp7WIdDS6lsL61/kfw5
         8CRoLlxEaf9NWP8/eSema4wQSv36Q5JLCfUqRBGagIc2/oFFSVjs+zex2wcpm9vsfnOp
         q4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HNjjGHBCbrXJ1cfflrmBSfI7CZoSLgqmITQK53jQ5ik=;
        b=sNJndtMXa+oDxnNI/TlTc9hKtwoQ5LzTFBOZeyNjvqVUH2seopHjmCzMBzahBQvBhz
         06+Y4lez8hwg1FoQRPM+1mZyitX2XtvjozOnRu3dsZa1yWVXRGCoGO6Xb5rRg4aF8pSM
         j5D4kRX7WPrJlquz8B8Agi/coxbTSLEB6rOuRHadS5MPTVEZFUBKXGYSo2FkxJhvcuB4
         VgYaXj5bP0ZAHUcqDfqHNDR/5XZObBbhkCdyweVTpVx+Q4WFPSRF2F2TwxiTCKTedLwm
         D+DrlugzIHrmDYS0NKAWARSlvGx1VfS+2+C4btW/Ix6e1YBvTY7IRHF+kJsVcnrbxDs8
         skwg==
X-Gm-Message-State: AOAM5332kXGvVd36ZX0hTJqc8RSOFgJWn+vXojQ2DGuHcTtvsQP+zlCU
	WNiYiYk7QLyXhOmSdsm36rZJQU5IX/4=
X-Google-Smtp-Source: ABdhPJwm2Fwo101YDr1WWvpe/2mOO06ixQta0/8GR29R+0dSL2ea9Vzy7K05wXKGR0TacKkT1Dj2VQ==
X-Received: by 2002:a05:6830:18d9:: with SMTP id v25mr24829382ote.189.1614181842305;
        Wed, 24 Feb 2021 07:50:42 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id 11sm415097oir.40.2021.02.24.07.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 07:50:41 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	jsmoeller@linuxfoundation.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][RFC] reproducible: Switch to last chance SDE fallback
Date: Wed, 24 Feb 2021 09:50:32 -0600
Message-Id: <20210224155032.21220-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of trying to shove a non-zero SDE into the deployed sstate
files which has bad interactions, let it naturally resolve to 0 and do a
"last chance" correction to the fallback SOURCE_DATE_EPOCH.

Also, stop exporting the fallback source date epoch since we don't want
to invalidate *all* tasks when it changes. Instead, make do_unpack
depend on the fallback value to invalidate all the downstream tasks when
it changes.

Finally, we need to make sure that do_deploy_source_date_epoch() gets
rerun when the actual SDE value changes. Introduce a new variable
(SOURCE_DATE_EPOCH_DEP) that this task (and others like it) can depend
on when they need to be invalidated by a change in the source date epoch
value.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/reproducible_build.bbclass | 23 ++++++++++++++---------
 meta/lib/oe/reproducible.py             |  8 ++------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index f06e00d70d..74ef8da3c9 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -42,7 +42,13 @@ SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
 SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
 
 # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
-export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
+SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
+
+# Some tasks do actually depend on the value of the source date epoch, even
+# though it is generally excluded from task signatures. For those tasks, they
+# can add a vardep on this variable
+SOURCE_DATE_EPOCH_DEP = "${SOURCE_DATE_EPOCH}"
+SOURCE_DATE_EPOCH_DEP[vardepvalue] = "${SOURCE_DATE_EPOCH_DEP}"
 
 SSTATETASKS += "do_deploy_source_date_epoch"
 
@@ -55,6 +61,7 @@ do_deploy_source_date_epoch () {
         echo "${SDE_FILE} not found!"
     fi
 }
+do_deploy_source_date_epoch[vardeps] += "SOURCE_DATE_EPOCH_DEP"
 
 python do_deploy_source_date_epoch_setscene () {
     sstate_setscene(d)
@@ -96,19 +103,15 @@ def get_source_date_epoch_value(d):
         return cached
 
     epochfile = d.getVar('SDE_FILE')
-    source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
+    source_date_epoch = 0
     if os.path.isfile(epochfile):
         with open(epochfile, 'r') as f:
             s = f.read()
             try:
                 source_date_epoch = int(s)
-                # workaround for old sstate with SDE_FILE content being 0 - use SOURCE_DATE_EPOCH_FALLBACK
-                if source_date_epoch == 0 :
-                    source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
-                    bb.warn("SOURCE_DATE_EPOCH value from sstate '%s' is deprecated/invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK '%s'" % (s, source_date_epoch))
             except ValueError:
-                bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to SOURCE_DATE_EPOCH_FALLBACK" % s)
-                source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
+                bb.warn("SOURCE_DATE_EPOCH value '%s' is invalid. Reverting to default" % s)
+                source_date_epoch = 0
         bb.debug(1, "SOURCE_DATE_EPOCH: %d" % source_date_epoch)
     else:
         bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d" % (epochfile, source_date_epoch))
@@ -116,10 +119,12 @@ def get_source_date_epoch_value(d):
     d.setVar('__CACHED_SOURCE_DATE_EPOCH', str(source_date_epoch))
     return str(source_date_epoch)
 
-export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
+export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d) or d.getVar('SOURCE_DATE_EPOCH_FALLBACK')}"
 BB_HASHBASE_WHITELIST += "SOURCE_DATE_EPOCH"
 
 python () {
     if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1':
         d.appendVarFlag("do_unpack", "postfuncs", " create_source_date_epoch_stamp")
+        # Make sure to invalidate all downstream tasks is the SOURCE_DATE_EPOCH_FALLBACK value changes
+        d.appendVarFlag("do_unpack", "vardeps", "SOURCE_DATE_EPOCH_FALLBACK")
 }
diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 204b9bd734..0fb02ccdb0 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -90,12 +90,8 @@ def get_source_date_epoch_from_youngest_file(d, sourcedir):
         bb.debug(1, "Newest file found: %s" % newest_file)
     return source_date_epoch
 
-def fixed_source_date_epoch(d):
+def fixed_source_date_epoch():
     bb.debug(1, "No tarball or git repo found to determine SOURCE_DATE_EPOCH")
-    source_date_epoch = d.getVar('SOURCE_DATE_EPOCH_FALLBACK')
-    if source_date_epoch:
-        bb.debug(1, "Using SOURCE_DATE_EPOCH_FALLBACK")
-        return int(source_date_epoch)
     return 0
 
 def get_source_date_epoch(d, sourcedir):
@@ -103,6 +99,6 @@ def get_source_date_epoch(d, sourcedir):
         get_source_date_epoch_from_git(d, sourcedir) or
         get_source_date_epoch_from_known_files(d, sourcedir) or
         get_source_date_epoch_from_youngest_file(d, sourcedir) or
-        fixed_source_date_epoch(d)       # Last resort
+        fixed_source_date_epoch()       # Last resort
     )
 
-- 
2.30.0

