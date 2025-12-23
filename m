Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4BBE6FE51
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 21:26:36 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.109424.1766525186941643739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 13:26:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EmCifchW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.193, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a12ebe4b74so92962535ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 13:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766525186; x=1767129986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcKoXz9bZeIogmGavFcGUy7fkioFe1inmnnL1n36un4=;
        b=EmCifchWgGJjo6RnaWux9vp3SuiGWm3Hwo8N12K7ful24hL7DBYXwD5u0mVfwK7tVt
         J8mpfa43i8qU/hW9RlZvq0uRcLe+hVSISIyLFCeP/5UojERUH3TxNthg9qCOf3SBeooC
         76xtiKchy777ybzaEu3I0Ed1bbT0/+Kn5tr/ILpDyc5w2EgDgvLjGSdeqkeKtcGP2V2R
         oyDNrR8mPFEusSOPpn98Qbpc/g7+jYAlgfMCOCM15mqyZ9aziPUKxV1W8GCTpcS0ssmG
         9rdvAbATqr+l0GDEi5ln084p7igra+KbIuy8TQHv2Ihm/63LDKSg7zZ2j127KNnIYbN0
         aYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766525186; x=1767129986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vcKoXz9bZeIogmGavFcGUy7fkioFe1inmnnL1n36un4=;
        b=cLPX1TuMajkJw4+e1CWYpjMB0R+PrtlyGCMeWCUy4X3zCXXKdQTUpPgeKl5seKNETk
         bLFw91k7RmCXdnq9f+BmVSlYpwVXb/m53VfXm+aHEyVSYhwOO46KKLRTOrQxzu0a1xck
         Dlsp7FUf8hU7hJh5nbx3bt9rnC5sbePJlZq8f1p5+SegY8T8KwQwEiyMpFMa/MQqehDH
         MKDkTn1Y0cZWPLNNIXWm+y02Tu0C9wX/nq5HWVp2U6J2ux0pStLhyEU8Dkj1iS+OdnBa
         6ixOomhVzeysdDy2T8lIW/u504CLVYr//zq+8uJTfM6j0YjGz56SRin9XJbGuikBayV2
         irgQ==
X-Gm-Message-State: AOJu0Yx3cTjblRvQopTU4a6nsqlBhAtQYVUiPWCneZ0vDNrjtWDgXrQ4
	Es8hjmKpv/W7t0lMlFQLtYcKRYeTqU2NnE1AZm4o2zHhuCRvSukbqhGxioHdFfCYRLZUbffIA/5
	vwtIskho=
X-Gm-Gg: AY/fxX7Fwtstkw/JBsIdByIbRKDAtGEomCmdwWjsX8z0uple+fCY5DXJe6wOHKUfDa7
	UvQAYlpHjKxkHzmzP93jDcfKqcNaEF2Spo1yONim3ZVHKncVSOZuTheAcyXya1hEJccLIPRcSKL
	zjco4r/TV1gvy7TVC6WfyV0Bqf+caM5mXVdnJS8F7xqo+EQPw25K/Xt9aJ+IqcLTI1IkTGZXjQJ
	47iqBoof7Z4tEyecvu8MR3UFquUtHW+A/joQqu/wiX+jXn7SqbMlnmlAGt4sY4AE4wYO0kP6ApZ
	DLk6iQ1oy8dEnuWn+BAAzpIz0jasaDXX1CZVhkUn5+G7CRkIOb7wU8XPriqdFXuhFQD07m7lFIG
	3RL1AZGWUDJtfiZQ/jA4h2pDTqxdKK7eAn9rDfniDpSu5FaTTWHblrkvJSf1orwuNtS2W8ynfmX
	iJoQ==
X-Google-Smtp-Source: AGHT+IGRKjZ2J2PJ6opc/WzxNjbJ1JUSCP8gBExJIth8RBrHCmiQIBbzSmnU5M8+WwK2093stqk6lA==
X-Received: by 2002:a17:902:dac2:b0:2a2:b293:27d2 with SMTP id d9443c01a7336-2a2f2a400c0mr159159055ad.53.1766525186065;
        Tue, 23 Dec 2025 13:26:26 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:74b3:f61b:a7a7:fafc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm133756765ad.8.2025.12.23.13.26.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:26:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/10] cross.bbclass: Propagate dependencies to outhash
Date: Tue, 23 Dec 2025 13:26:01 -0800
Message-ID: <6c40ec0646735a125540d6a78550d4d1d4bece62.1766525021.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766525021.git.steve@sakoman.com>
References: <cover.1766525021.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228503

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
 meta/classes/cross.bbclass | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
index 9d951076a7..a292a98335 100644
--- a/meta/classes/cross.bbclass
+++ b/meta/classes/cross.bbclass
@@ -95,3 +95,39 @@ addtask addto_recipe_sysroot after do_populate_sysroot
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


