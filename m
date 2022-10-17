Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641E9C4167B
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 23:09:06 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.697.1666048140234676041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 16:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=UvuAKf/E;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id x31-20020a17090a38a200b0020d2afec803so12358262pjb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 16:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/BO04HmkRGwaghvLsuOHVMnEffZXBxES06DN9iH2/M=;
        b=UvuAKf/EmaFK488+fIWEVBST+dce9fPigkDzJYrPldI6LoRIzX+JiV8a1c6myWbCtY
         pcltxsL1pUZl5iQ2qfi+R7i2PAiZ/MRHm4TXV4nRovOo5TJjP96dr4y86xy7ev2KCCob
         f6EacAxuF2NHgtY3e0qgRo09dtOhqbw6QhWwpcYdFTIjzZN4/d8POg2nOiQCkZaLylgU
         6NnoyOroLZsICwPYSVrbkVvFNBzJhwnkqwX/pTYgPlKX/TDUoaRQyHmArJLUWsYSWFZe
         F94VpUpnN+lsi5lTd+r1d1q2yJXPFOwyTOboOEYVAugNnzEgm8/GHkE+FRiNw19GRS+o
         FYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/BO04HmkRGwaghvLsuOHVMnEffZXBxES06DN9iH2/M=;
        b=W5prLuP6Aq1AX731+8pPenrK+LNeXyYhoAwQsZCb8Q+zTVY2bo8p0Mrc3YAtTFJIaV
         HRWFMGjrJMO6eDw9OOMf0hVH7urHtgleJ2qsJeO08lX3ESyNryDeCBqgKHQvQ3ci0YK9
         0si+HoBbsU98L1OtfJSbzqE5z5NMSB7ixJYOD4xJsau+DC3by6m0NBRDXtpvynBZeDAz
         s7hYgH2P4HhNhtzi4B+6iGFrKvTx3pli7oTqpk+Eu0S0aI+lYUxkbDYE1BU1Q3HglysC
         9Hvn4IdRhZD2iCvYmFuqE4DYWmp30SArIzoV6vSVDD+Y4MgDUg66E81r+7jK0WOdqCq6
         nhwg==
X-Gm-Message-State: ACrzQf0Pw/s81xT0D94IAQ5OmlgBRsiYXqzCa6/bu60KnCvebgPc2OAW
	SIyW9gKt1ByCBbs1vsf/4fb94lrv5fR8r8A9
X-Google-Smtp-Source: AMsMyM6h8MMRm98BJDRsnVzdQjm07Vx+P55QhzuAAw2aNS4pC9TtRnWmH5PW4+/Djyq5guUsGzxZfA==
X-Received: by 2002:a17:90b:2686:b0:20a:d838:25d2 with SMTP id pl6-20020a17090b268600b0020ad83825d2mr158213pjb.35.1666048139128;
        Mon, 17 Oct 2022 16:08:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a694600b0020aacde1964sm10119479pjm.32.2022.10.17.16.08.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:08:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/13] python3: upgrade 3.10.4 -> 3.10.7
Date: Mon, 17 Oct 2022 13:08:23 -1000
Message-Id: <3efae85283b19fa1b30af7fed7fa89d7a50337db.1666047986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666047986.git.steve@sakoman.com>
References: <cover.1666047986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 23:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171925

From: Tim Orling <ticotimo@gmail.com>

Security and bug fixes.

Drop patch for gh-92036 which was merged in 3.10.5
Refresh 0017-setup.py-do-not-report-missing-dependencies-for-disa.pathc

Fixes:
* CVE-2020-10735
  https://nvd.nist.gov/vuln/detail/CVE-2020-10735
* CVE-2021-28861
  https://nvd.nist.gov/vuln/detail/CVE-2021-28861
* CVE-2018-25032
  https://nvd.nist.gov/vuln/detail/CVE-2018-25032

For a list of changes see:
https://docs.python.org/3.10/whatsnew/changelog.html#python-3-10-7-final
https://docs.python.org/3.10/whatsnew/changelog.html#python-3-10-6-final
https://docs.python.org/3.10/whatsnew/changelog.html#python-3-10-6-final

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...h-92036-Fix-gc_fini_untrack-GH-92037.patch | 54 -------------------
 ...report-missing-dependencies-for-disa.patch |  8 +--
 .../{python3_3.10.4.bb => python3_3.10.7.bb}  |  3 +-
 3 files changed, 6 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch
 rename meta/recipes-devtools/python/{python3_3.10.4.bb => python3_3.10.7.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch b/meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch
deleted file mode 100644
index 6a58c35cc6..0000000000
--- a/meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 178a238f25ab8aff7689d7a09d66dc1583ecd6cb Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Wed, 4 May 2022 03:23:29 -0700
-Subject: [PATCH 01/40] gh-92036: Fix gc_fini_untrack() (GH-92037)
-
-Fix a crash in subinterpreters related to the garbage collector. When
-a subinterpreter is deleted, untrack all objects tracked by its GC.
-To prevent a crash in deallocator functions expecting objects to be
-tracked by the GC, leak a strong reference to these objects on
-purpose, so they are never deleted and their deallocator functions
-are not called.
-(cherry picked from commit 14243369b5f80613628a565c224bba7fb3fcacd8)
-
-Co-authored-by: Victor Stinner <vstinner@python.org>
-
-Upstream-Status: Backport
----
- .../2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst           | 5 +++++
- Modules/gcmodule.c                                          | 6 ++++++
- 2 files changed, 11 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst
-
-diff --git a/Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst b/Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst
-new file mode 100644
-index 0000000000..78094c5e4f
---- /dev/null
-+++ b/Misc/NEWS.d/next/Core and Builtins/2022-04-28-23-37-30.gh-issue-92036.GZJAC9.rst	
-@@ -0,0 +1,5 @@
-+Fix a crash in subinterpreters related to the garbage collector. When a
-+subinterpreter is deleted, untrack all objects tracked by its GC. To prevent a
-+crash in deallocator functions expecting objects to be tracked by the GC, leak
-+a strong reference to these objects on purpose, so they are never deleted and
-+their deallocator functions are not called. Patch by Victor Stinner.
-diff --git a/Modules/gcmodule.c b/Modules/gcmodule.c
-index 805a159d53..43ae6fa98b 100644
---- a/Modules/gcmodule.c
-+++ b/Modules/gcmodule.c
-@@ -2170,6 +2170,12 @@ gc_fini_untrack(PyGC_Head *list)
-     for (gc = GC_NEXT(list); gc != list; gc = GC_NEXT(list)) {
-         PyObject *op = FROM_GC(gc);
-         _PyObject_GC_UNTRACK(op);
-+        // gh-92036: If a deallocator function expect the object to be tracked
-+        // by the GC (ex: func_dealloc()), it can crash if called on an object
-+        // which is no longer tracked by the GC. Leak one strong reference on
-+        // purpose so the object is never deleted and its deallocator is not
-+        // called.
-+        Py_INCREF(op);
-     }
- }
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
index 0ead57e465..8c554feb4b 100644
--- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
@@ -12,16 +12,18 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
+Refresh for 3.10.7:
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
 
 ---
  setup.py | 8 ++++++++
  1 file changed, 8 insertions(+)
 
 diff --git a/setup.py b/setup.py
-index 2be4738..62f0e18 100644
+index 85a2b26357..7605347bf5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -517,6 +517,14 @@ class PyBuildExt(build_ext):
+@@ -517,6 +517,14 @@ def print_three_column(lst):
                  print("%-*s   %-*s   %-*s" % (longest, e, longest, f,
                                                longest, g))
  
@@ -35,4 +37,4 @@ index 2be4738..62f0e18 100644
 +
          if self.missing:
              print()
-             print("Python build finished successfully!")
+             print("The necessary bits to build these optional modules were not "
diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.7.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.4.bb
rename to meta/recipes-devtools/python/python3_3.10.7.bb
index 34fd2895a3..404a582135 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.7.bb
@@ -35,7 +35,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
-           file://0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -44,7 +43,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "80bf925f571da436b35210886cf79f6eb5fa5d6c571316b73568343451f77a19"
+SRC_URI[sha256sum] = "6eed8415b7516fb2f260906db5d48dd4c06acc0cb24a7d6cc15296a604dcdc48"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1


