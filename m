Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B764BE67482
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:46 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68642.1766353063666197003
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XxhDmI3A;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7e2762ad850so3600833b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353063; x=1766957863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GG7UhHkbKvsa2wFUyFH0k7u7T2NF5nTysuDCsWCdhiI=;
        b=XxhDmI3AUWebX2ROojHb+7iJTwwgRCqOuUp0189UMvMp5YwdQRVw9TfMSQA85NmkCj
         M0Ux4oa8Xq1fL2apDZIA0zLR/PWLWUFFqwtETQI5xkc8Zy5yPQY1leDIbMbtSornn9w4
         aKj9YwiAhLXqjBs7/Z9ZvUalSdwX9kKczL1WreetYMMfyzfhnkfJW3sNSxXg4rx4dYRS
         eX8CjADh41Osj+ETfIx3WVCX91Wsw3ssgyGeae29kIfUuHhBKUt/lcaz9OWvXP6mUrro
         Witwi/jEB6nZOX8IokZPGU/nFq21uywJRHbvvCdXR5XCspxcoabF2At0+TK5cbQP+ZqW
         Mx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353063; x=1766957863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GG7UhHkbKvsa2wFUyFH0k7u7T2NF5nTysuDCsWCdhiI=;
        b=X9oI3muZCwFKhTS10rYW3PX9h5fJbPPa6EOklFdCi05B/Vy/cjwflSulQRvNl8Xgfm
         KVnfRLmRVTb0WcswLjXV1l3Dzc/9QBm2B8fVwLfMR/rJpvyxv3vVMPotAcWQny7jlBI3
         RQeLmFDkI2Ar/nK5vuKGFuRYGnc/B0usYQVDT8ggvWsUT/qnUHAVMDuoUjDzbEs2RxV3
         50tSgsN/q8Ik8AVzF9iNhSkVTkqBEWIPT+Wcy/TVYetlOU9iQQ3v/JcvRdsU9EbAklyP
         AK+gkCrIG/Uvmi/AUB0JSittLPr4E7HIsnu9W88PISE+rsqtK8FTlwlFB7/KvAMtj0qo
         5qSA==
X-Gm-Message-State: AOJu0Yys+OJEmBiIPpTS30KyNkU6kBsNgAP8Mm4C/Bo4Py312C/52fJ3
	czrCZYg8DpvC6tDHQG9PDIo3q7Q/81xV5ker3mUdavoNuXujRz2P6i02OPCAjNhHEhKY4XaH4vL
	8SavKGDgBHA==
X-Gm-Gg: AY/fxX5s1SPdSjfCSS5yC5XJMf1gEfNfpbOTa52CyKOH6O9UZUrBddgJS3+hOw1jYYs
	Bla6nvr7g6ewQ0DaAMp2KGE9T1Q5KvTu9CvwzCXAmJlWGCnLgIuEeiMQMKSB+LR6aFRebLH9xxu
	6ksXXhIHeiQB7iImJxjFvB0+zbfeTHfRKVN3DEJFzCllHHp9MxYZGK62L2jq00nBLE293OpvFVN
	pKUB4GebX+Hokkq/1S7gHIhSvAugJ9K9aL/UopKiXGNVC+tCYj6u36sxFhlPFha53MiMYPndXkD
	3GyoQ3rTiu0trVOXPmXt8M8aIgayYq/BHY6SyZC5Kj49w8bH6xTBxwPmpyqSlk86Mh0qhWE1CiE
	iM1jxhQnn7SKTXwL29yO/5NJObaW03XCZ/wAnwy+SoB+WuXfEsgwcYIQ2tRGVftPEQN9eS0LjRa
	bb
X-Google-Smtp-Source: AGHT+IEW56Mw9O8ePYjEMA1DEYiLhKyi3+4r7FYU7oXgZJdfHaTEtZ/YtOwY2wB9llxxtJq32cKPcg==
X-Received: by 2002:aa7:9311:0:b0:7aa:9ca5:da9c with SMTP id d2e1a72fcca58-7ff64ad9cd7mr8076627b3a.22.1766353062778;
        Sun, 21 Dec 2025 13:37:42 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 13/18] cross.bbclass: Propagate dependencies to outhash
Date: Sun, 21 Dec 2025 13:37:06 -0800
Message-ID: <ae7dceb0108ffade76559ca9d22976e470fb8a64.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228271

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 267b651e875d9381a23ffd5757d426714c029409)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


