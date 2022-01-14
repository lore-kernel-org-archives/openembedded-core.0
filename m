Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B7BC433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 17:12:27 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web08.10252.1642180346381043384
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 09:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qzwwjzB+;
 spf=pass (domain: gmail.com, ip: 209.85.161.44,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id
 w15-20020a4a9d0f000000b002c5cfa80e84so2737635ooj.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 09:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LbxMn4CjavlUK/6wy45iAGDzen89r3nnr/BsKCuvdPM=;
        b=qzwwjzB+a5d8RF+W/Y1QmwZJUNyYkhpzs9Ukot0HuiwNf/xKNNdT3DU5/pqefXD7sL
         32llu6VHaYaKp5DmBbxMQndB+WNE1avdSJjlVvGEg1qL4X0DbptaixMCriMZis6YbvMW
         7Sj558O+l0oPSzI04sDyXysDI4VrepwPXTfjh1hGeaESt9TPIF6d8fcOCTfhDbxCASOG
         6vLMQAv6WkB4AK1uiYLal8y/u7VxsePluPBgrGU6V6TjfihQ9dIA2S+KbF3oyZio4Ozo
         zZHZmbSnpIQZWB4lxLlSeeTMl6qEJa/xGNG4xEmMmxKemgtrUiM9FnmGotcFOy5QjwSc
         nyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LbxMn4CjavlUK/6wy45iAGDzen89r3nnr/BsKCuvdPM=;
        b=ZTytbaQVLmLBxRhXW4W2It/cC8Hibfz3LjcAyCzkAPynKHjzmL5geEITa8iNzjl8kp
         hgJkef+CQX/c99qmz80rbaUOCGtX8vSlsg9r1dk50Aigst39+Lq25ktL6zR8r4UJ7mP4
         Y1Q1VsDC6jhqsdrRjQflzhJ/air/HsLW7otgP4OLKaeVzxQDFjsCvwPhHrhEhnwIyB16
         tT4Z9DFxvpUzrcwtjlxZk4Hn46p8Qt525VPmHktfH80BZwfkdjAmGcvDvSTbe6JqY24r
         PyjbMhe7kk7ym0ND+L1mb913bMwC6OHjfMg0N3QW1/wBvVe0WeZcgnvhU+jpiPOwvMez
         HB+w==
X-Gm-Message-State: AOAM532gPm4qfxJJyTYGjMkr1WOZ7avwxYjisXosiowc8o4uF8KYD0TY
	+qh63etgCUzulWQeHnmWnuEuBCj5Z1I=
X-Google-Smtp-Source: 
 ABdhPJx2Fe+i0rjJ5RoQE3eUtrkqFp7fMD5eOyS173N0DU4atuM2Ca0O4cpXVUhO6Q2OF03wSBh/CA==
X-Received: by 2002:a4a:5403:: with SMTP id t3mr7009564ooa.72.1642180345303;
        Fri, 14 Jan 2022 09:12:25 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 be11sm2261874oib.43.2022.01.14.09.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 09:12:24 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][RFC] classes/native: Propagate dependencies to outhash
Date: Fri, 14 Jan 2022 11:12:22 -0600
Message-Id: <20220114171222.1788462-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 17:12:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160571

Native task outputs are directly run on the target (host) system after
being built. Even if the output of a native recipe doesn't change, a
change in one of its dependencies may cause a change in the output it
generates (e.g. rpm output depends on the output of its dependent zstd
library).

This can cause poor interactions with hash equivalence, since this
recipes output-changing dependency is "hidden" and downstream task only
see that this recipe has the same outhash and therefore is equivalent.
This can result in different output in different cases.

To resolve this, unhide the output-changing dependency by adding it's
unihash to this tasks outhash calculation. Unfortunately, don't know
specifically know which dependencies are output-changing, so we have to
add all of them.

[YOCTO #14685]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/native.bbclass | 31 +++++++++++++++++++++++++++++++
 meta/lib/oe/sstatesig.py    | 10 +++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 76a599bc15..fc7422c5d7 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -195,3 +195,34 @@ USE_NLS = "no"
 
 RECIPERDEPTASK = "do_populate_sysroot"
 do_populate_sysroot[rdeptask] = "${RECIPERDEPTASK}"
+
+#
+# Native task outputs are directly run on the target (host) system after being
+# built. Even if the output of this recipe doesn't change, a change in one of
+# its dependencies may cause a change in the output it generates (e.g. rpm
+# output depends on the output of its dependent zstd library).
+#
+# This can cause poor interactions with hash equivalence, since this recipes
+# output-changing dependency is "hidden" and downstream task only see that this
+# recipe has the same outhash and therefore is equivalent. This can result in
+# different output in different cases.
+#
+# To resolve this, unhide the output-changing dependency by adding its unihash
+# to this tasks outhash calculation. Unfortunately, don't know specifically
+# know which dependencies are output-changing, so we have to add all of them.
+#
+python native_add_do_populate_sysroot_deps () {
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+    if current_task != "do_populate_sysroot":
+        return
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    pn = d.getVar("PN")
+    deps = {
+        dep[0]:dep[6] for dep in taskdepdata.values() if
+            dep[1] == current_task and dep[0] != pn
+    }
+
+    d.setVar("HASHEQUIV_EXTRA_SIGDATA", "\n".join("%s: %s" % (k, deps[k]) for k in sorted(deps.keys())))
+}
+SSTATECREATEFUNCS += "native_add_do_populate_sysroot_deps"
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 038404e377..abcd96231e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -491,7 +491,8 @@ def OEOuthashBasic(path, sigfile, task, d):
     if task == "package":
         include_timestamps = True
         include_root = False
-    extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
+    hash_version = d.getVar('HASHEQUIV_HASH_VERSION')
+    extra_sigdata = d.getVar("HASHEQUIV_EXTRA_SIGDATA")
 
     filemaps = {}
     for m in (d.getVar('SSTATE_HASHEQUIV_FILEMAP') or '').split():
@@ -506,8 +507,11 @@ def OEOuthashBasic(path, sigfile, task, d):
         basepath = os.path.normpath(path)
 
         update_hash("OEOuthashBasic\n")
-        if extra_content:
-            update_hash(extra_content + "\n")
+        if hash_version:
+            update_hash(hash_version + "\n")
+
+        if extra_sigdata:
+            update_hash(extra_sigdata + "\n")
 
         # It is only currently useful to get equivalent hashes for things that
         # can be restored from sstate. Since the sstate object is named using
-- 
2.33.0


