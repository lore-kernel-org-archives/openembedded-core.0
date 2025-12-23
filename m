Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7525FE6FE43
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:23:16 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109358.1766524991711259203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dywQwWuz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.193, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a110548cdeso75306515ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766524991; x=1767129791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/osPGFLgdeKgfXNjZMo8YPTnozBVb0LabLtYDG1Y3Q=;
        b=dywQwWuzrrH9LvZYYqap60J+Q28HSiHBwxjPEl6tyoLsVwtFzqR7uTuSkbOWGWp/3O
         WjUsKOxcau6H0ZKS2hPZ6krgnch27mEwEvyWsiLjZOChD7nrPJzBF/wLgwKe1PUkzVOl
         J9SBzPaUo4YzqGT2BZ8TtXdqNQAMb1z5VJ7Nfjk5X6CjoANsTSsYy5C/SZDhh3vc9K/e
         jkwUpTjDBV9fSBaoCNvwyvWRW6HIYM/fFSO2KqQu9Akjo3vvcJFSYyYeW2GsARHnXU+z
         ZO3u/q3maaVZQ+7XWulUgFZaICrToD8rO5cd2IVkmy1397C9Yp4l4+DnrjlSuRH2xs33
         s1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766524991; x=1767129791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P/osPGFLgdeKgfXNjZMo8YPTnozBVb0LabLtYDG1Y3Q=;
        b=EzpHWcgCxZDHJ42iOM4+JHUaFDYqsIOr9bcBx+l2/ka4lW6abhzbG70IBanL/NmAG8
         lB5Zc0dGUdKZL5QYfEAUNnznzqhqdb3ufLRNADBBDErVsSpRyNrkKEPXtVWy0o5eN3sQ
         DspC6+SVerjFjyUXP+zIrSPB0IDy6IiSCDeyCYyuk3X37X31J/kxSR55ZFbakrqehHbQ
         Su+oigeDK3na8RcM6nTZAYEjMmCUqSh0ITBtK1VBSKQ5/yF4QIpQ4Wh1qtzn7XD78a9I
         JLxRUM6AAe4aquDONFFuFBrr54PJC6ruczLxwsVSKCdxYkPR4pYYGOqdS0d/eoAOXgS0
         EgUA==
X-Gm-Message-State: AOJu0YwdxkB90cVu0LeK4On5cOZl/0CC8g86ZiO+9grBvo5daHG6ne6V
	PnakTBoDivPbmdGKtXo3cgnEUTGcYILtFXOjJcRPn5086V35Bdri5kmEWWzP3KuaAIU4kDLDFTI
	02dkgLwY=
X-Gm-Gg: AY/fxX7uVQ+OhHL8h8LcArRv0bIxa9SDe9otwdnpCQi0yM+HOR7HdEij0zB5q1rwt12
	UCd1hEPIAGO09RqmgyKjm9hetuHBes4YR43UpGKZSRMg0NhkZkmNo9VVm07P+3SGdkpS99MlHwx
	OqM4FcFbi5VAl+P8yQ+YzbWn7bvxWzUbR53I5e1+9h/EV9ubMEqix0j7DgoDse3yXh8+2R73U4X
	hq/fOY83qwpbo6dgPtmvmCUQOmq7elcFbaLC11CD/YafrSBGqZNeHA4uvh0Y3J2aRrO9vAlLts2
	q3xNAH2ZtrzXQ+qLAEJo70mlaTuUAt++jX9PVvOBzrDlj+tF0NKLW4j+E+fXI5nCtCGpfm75rHo
	PP7BNCiAWDyTds0206bnN+Op4TAhBRkoSBIvhcpAc1XO8p10fP6xzzEHwxV0gHXXPgqjesdL0dx
	3cuw==
X-Google-Smtp-Source: AGHT+IGXTEFUMiPXAkiQ6tOAHJ1fOPKtLdvQUI8WBJcb0aswJVbrkJlzKPxE6NlObQoKsFjXb8ACaQ==
X-Received: by 2002:a17:902:c94f:b0:29e:9387:f2b0 with SMTP id d9443c01a7336-2a2f2830fe5mr158199695ad.39.1766524990692;
        Tue, 23 Dec 2025 13:23:10 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbe5sm137258785ad.60.2025.12.23.13.23.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:23:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/18] cross.bbclass: Propagate dependencies to outhash
Date: Tue, 23 Dec 2025 13:22:24 -0800
Message-ID: <dccb7a185fe58a97f33e219b4db283ff4a2071d7.1766524798.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766524798.git.steve@sakoman.com>
References: <cover.1766524798.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228492

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cross.bbclass | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index 93de9a5274..da3c4e7eab 100644
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
-- 
2.43.0


