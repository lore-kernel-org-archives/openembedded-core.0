Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494CDD65525
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:41:55 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10653.1765964505394658988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 01:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gqHEQefL;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-64951939e1eso9669147a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 01:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765964504; x=1766569304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rkcjH+5q3ht4HeTX7rvQZEg5b9XBMZCAi0IcMv6v2Ew=;
        b=gqHEQefL7HkGt6h8J5hTp/5PKSY/poLvxkmEsHVC5TREDChXUNitUAcVK7P022g2op
         ApUZC4F7ibWr+NPQe77idiYUSiitDi71IOaYNu9NgLTO1tviE6VhqYsUV7BcLYTJOSzO
         ndLWdfaBT3CBsBhOEPxZHnv3noZNv450SQD1crxpLaWLAcUsMg7aPFFJgy72G5L7x/li
         hey1j0flgUQ9mP97xEgYF0wmhJ9WeU16hflaLM0DeTgP7BkMMgwh926cCh2nJI0UnXMF
         kklaZYar623qTz73zTv/woQdwp0OyE63pW1SQodsYeD/cjOlQj7diFSKa0UcG1Py85AY
         ubyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765964504; x=1766569304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkcjH+5q3ht4HeTX7rvQZEg5b9XBMZCAi0IcMv6v2Ew=;
        b=LsA4F4zbe4VWE17551OuEx10VHAmlUJKsz8ERai9KErIgHQdICXLExnaQkIWYRod3p
         VGoXh/pGhcJZEL5MEWgNE/4gNJp1Cpm7Z4ak5r2ZNovEWob92BgIfBWwGH8EkRKgBeiO
         iLjBq+2x5BpfubQymYuQWVQhObxARjBUOZhDh/YcQLK+Q6J9/cL5l3/gaeFaceQN9n9k
         nFgMcMlIzsfS0Fvi9uQMCO7LmKS7O4HKOluNYE3JQy6Hrwi5gcyKyJ85sU+0EZL+7xwC
         T4r2RRItSZYGkmkY+CWNHkCeU3gF9B7NYHWqhezrt9xs1JFWJRGURBWe6HxKFsIXqu7M
         oLTA==
X-Gm-Message-State: AOJu0YzuFmR7xwIZ2ePB7EoPRVOUS18c2XX3LsuRW5isi3XmxPHis918
	9sYoF+wtYvaCOYwp0WrzA/pFLcNrtR645ElNYnufHiOXfN8Em4FL7AWE5NbjVhEq
X-Gm-Gg: AY/fxX52pgnFyZ3Wuywi1zTRSZEYQnG7M/7rCCYbYliVbenE/vHqAJsNXgwZpCM2xta
	y2JIStzq3y+MJTnTbrmenNkknhRy3pbQYMeidYEXeFlc6xDD+2ob/UD95ul+AiP90/mW+gM8+0N
	s2+/Hks7/hnVliV75Z87wDUp0uVCQ+qrlSR4t5YyE3EYhyRCFf+2wlrQYlQZMlLJqIr4UCmIBcz
	LhA90x0BXxOShgdWMg85T6yM5LnarO0NdFazdG5/5XoCSvZ+kJvvGcVaDbxmJMxLxJKdIVouLuu
	+L/7EhYYmLylpizGbpiG/7uljIv4wh0DTkpujkkux0NQBxZZybMXV7zoiNrFfgQpkMQbbC6tH7Z
	iW5i0DI0jRYNaEyzq/AG+IyoLt6H3T091HZj9x3ZcrpZAVtf1ARjjaYe4QKYifoVBRdgJ2WfSbo
	Um6uvONpf4mhdg9A==
X-Google-Smtp-Source: AGHT+IG8N0omXwXJvgwrjJzEIKIMn5ruT5kP74+8hfcbWq/pb2IXBqeqJtov4VMOWTQqKyk48PgkqA==
X-Received: by 2002:a05:6402:3551:b0:647:a24f:dcff with SMTP id 4fb4d7f45d1cf-6499b11801amr17791211a12.5.1765964503355;
        Wed, 17 Dec 2025 01:41:43 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f563bb6sm1875732a12.20.2025.12.17.01.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:41:42 -0800 (PST)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [whinlatter][PATCH] cross.bbclass: Propagate dependencies to outhash
Date: Wed, 17 Dec 2025 10:41:39 +0100
Message-ID: <20251217094139.852096-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:41:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228014

From: Martin Jansa <martin.jansa@gmail.com>

Similar to what native and staging is doing since:
https://git.openembedded.org/openembedded-core/commit/meta/classes/native.bbclass?id=d6c7b9f4f0e61fa6546d3644e27abe3e96f597e2
https://git.openembedded.org/openembedded-core/commit/meta/classes/staging.bbclass?id=1cf62882bbac543960e4815d117ffce0e53bda07

Cross task outputs can call native dependencies and even when cross
recipe output doesn't change it might produce different results when
the called native dependency is changed, e.g. clang-cross-${TARGET_ARCH}
contains symlink to clang binary from clang-native, but when clang-native
outhash is changed, clang-cross-${TARGET_ARCH} will still be considered
equivalent and target recipes aren't rebuilt with new clang binary, see
work around in https://github.com/kraj/meta-clang/pull/1140 to make target
recipes to depend directly not only on clang-cross-${TARGET_ARCH} but
clang-native as well.

I have added a small testcase in meta-selftest which demostrates this issue.
Not included in this change, but will send it if useful.

openembedded-core $ ls -1 meta-selftest/recipes-devtools/hashequiv-test/
print-datetime-link-cross.bb
print-datetime-link-native.bb
print-datetime-native.bb
print-datetime-usecross.bb
print-datetime-usenative.bb

print-datetime-native provides script which prints defined PRINT_DATETIME variable.

print-datetime-link-native and print-datetime-link-cross both provide a symlink to
the script from print-datetime-native.

print-datetime-usenative and print-datetime-usecross are target recipes using the
native and cross versions of print-datetime-link-* recipe.

  # clean build all is rebuilt:
  $ bitbake -k print-datetime-usenative print-datetime-usecross
  WARNING: print-datetime-native-1.0-r0 do_install: print-datetime-native current DATETIME in script is 2025-11-13_20_05
  WARNING: print-datetime-link-native-1.0-r0 do_install: print-datetime-link-native current DATETIME in symlink is 2025-11-13_20_05
  WARNING: print-datetime-link-cross-x86_64-1.0-r0 do_install: print-datetime-link-cross-x86_64 current DATETIME in symlink is 2025-11-13_20_05
  WARNING: print-datetime-usenative-1.0-r0 do_install: print-datetime-usenative current DATETIME from print-datetime-link is 2025-11-13_20_05
  WARNING: print-datetime-usecross-1.0-r0 do_install: print-datetime-usecross current DATETIME from print-datetime-link is 2025-11-13_20_05

  # keep sstate-cache and hashserv.db:
  # print-datetime-usenative is correctly rebuilt, because print-datetime-link-native has different hash (because print-datetime-native hash changed)
  # print-datetime-usecross wasn't rebuilt, because print-datetime-link-cross-x86_64 doesn't include the changed hash of print-datetime-native
  $ bitbake -k print-datetime-usenative print-datetime-usecross
  WARNING: print-datetime-native-1.0-r0 do_install: print-datetime-native current DATETIME in script is 2025-11-13_20_07
  WARNING: print-datetime-link-native-1.0-r0 do_install: print-datetime-link-native current DATETIME in symlink is 2025-11-13_20_07
  WARNING: print-datetime-link-cross-x86_64-1.0-r0 do_install: print-datetime-link-cross-x86_64 current DATETIME in symlink is 2025-11-13_20_07
  WARNING: print-datetime-usenative-1.0-r0 do_install: print-datetime-usenative current DATETIME from print-datetime-link is 2025-11-13_20_07

It's because print-datetime-link-cross-x86_64 depsig doesn't include print-datetime-native signature:

$ cat tmp/work/x86_64-linux/print-datetime-link-cross-x86_64/1.0/temp/depsig.do_populate_sysroot
OEOuthashBasic
18
SSTATE_PKGSPEC=sstate:print-datetime-link-cross-x86_64:x86_64-oe-linux:1.0:r0:x86_64:14:
task=populate_sysroot
drwx                                                                                       .
drwx                                                                                       ./recipe-sysroot-native
drwx                                                                                       ./recipe-sysroot-native/sysroot-providers
-rw-                   32 19fbeb373f781c2504453c1ca04dab018a7bc8388c87f4bbc59589df31523d07 ./recipe-sysroot-native/sysroot-providers/print-datetime-link-cross-x86_64
drwx                                                                                       ./recipe-sysroot-native/usr
drwx                                                                                       ./recipe-sysroot-native/usr/bin
drwx                                                                                       ./recipe-sysroot-native/usr/bin/x86_64-oe-linux
lrwx                                                                                       ./recipe-sysroot-native/usr/bin/x86_64-oe-linux/print-datetime-link -> ../print-datetime

While print-datetime-link-native doesn't have this issue, because print-datetime-native signature is there:

$ cat tmp/work/x86_64-linux/print-datetime-link-native/1.0/temp/depsig.do_populate_sysroot
OEOuthashBasic
18
print-datetime-native: 60f2734a63d708489570ca719413b4662f8368abc9f4760a279a0a5481e4a17b
quilt-native: 65d78a7a5b5cbbf0969798efe558ca28e7ef058f4232fcff266912d16f67a8b8
SSTATE_PKGSPEC=sstate:print-datetime-link-native:x86_64-linux:1.0:r0:x86_64:14:
task=populate_sysroot
drwx                                                                                       .
drwx                                                                                       ./recipe-sysroot-native
drwx                                                                                       ./recipe-sysroot-native/sysroot-providers
-rw-                   26 3d5458be834b2d0e4c65466b9b877d6028ae2210a56399284a23144818666f10 ./recipe-sysroot-native/sysroot-providers/print-datetime-link-native
drwx                                                                                       ./recipe-sysroot-native/usr
drwx                                                                                       ./recipe-sysroot-native/usr/bin
lrwx                                                                                       ./recipe-sysroot-native/usr/bin/print-datetime-link -> print-datetime

With the cross.bbclass fix the link-cross recipe has a checksum from native recipe as well:

$ cat tmp/work/x86_64-linux/print-datetime-link-cross-x86_64/1.0/temp/depsig.do_populate_sysroot
OEOuthashBasic
18
print-datetime-native: 9ceb6c27342eae6b8da86c84685af38fb8927ccc19979aae75b8b1e444b11c5c
quilt-native: 65d78a7a5b5cbbf0969798efe558ca28e7ef058f4232fcff266912d16f67a8b8
SSTATE_PKGSPEC=sstate:print-datetime-link-cross-x86_64:x86_64-oe-linux:1.0:r0:x86_64:14:
task=populate_sysroot
drwx                                                                                       .
drwx                                                                                       ./recipe-sysroot-native
drwx                                                                                       ./recipe-sysroot-native/sysroot-providers
-rw-                   32 19fbeb373f781c2504453c1ca04dab018a7bc8388c87f4bbc59589df31523d07 ./recipe-sysroot-native/sysroot-providers/print-datetime-link-cross-x86_64
drwx                                                                                       ./recipe-sysroot-native/usr
drwx                                                                                       ./recipe-sysroot-native/usr/bin
drwx                                                                                       ./recipe-sysroot-native/usr/bin/x86_64-oe-linux
lrwx                                                                                       ./recipe-sysroot-native/usr/bin/x86_64-oe-linux/print-datetime-link -> ../print-datetime

And print-datetime-usecross is correctly rebuilt whenever print-datetime-native output is different.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/cross.bbclass | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index 9abf166e50..c3eeade67b 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -101,3 +101,39 @@ addtask addto_recipe_sysroot after do_populate_sysroot
 do_addto_recipe_sysroot[deptask] = "do_populate_sysroot"
 
 PATH:prepend = "${COREBASE}/scripts/cross-intercept:"
+
+#
+# Cross task outputs can call native dependencies and even when cross
+# recipe output doesn't change it might produce different results when
+# the called native dependency is changed, e.g. clang-cross-${TARGET_ARCH}
+# contains symlink to clang binary from clang-native, but when clang-native
+# outhash is changed, clang-cross-${TARGET_ARCH} will still be considered
+# equivalent and target recipes aren't rebuilt with new clang binary, see
+# work around in https://github.com/kraj/meta-clang/pull/1140 to make target
+# recipes to depend directly not only on clang-cross-${TARGET_ARCH} but
+# clang-native as well.
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
+python cross_add_do_populate_sysroot_deps () {
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
+SSTATECREATEFUNCS += "cross_add_do_populate_sysroot_deps"

