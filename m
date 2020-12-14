Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.31946.1607937051168273628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 01:10:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s9ugCZOR;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id x16so21499845ejj.7
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 01:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mfiwFC+VRyJLdOlSQm3dV6NiQyp34QySidz7f8YoTwg=;
        b=s9ugCZORW8d2WaWOTxIvqqHVr7v2XtD/jQ53m9AN3RtwI3F3rKGos2Wo6NGlMat4te
         HHpv9Sl3eFFGZzaVtCp38bAnWwzryxSUVDk7pguQOXgeNXzGdQW8pcRlohSaOM4LEUgS
         TqVFVVgY1zfk74k1WyG4tqUyW+ggemEEFQVu3PdoZJqE1B3AjeAOWLQS8VMPFzmFRAxK
         dXaf7Alb0nq+nBEpUS8tQW/qgyhw62e6S94E68fbPlmQoSIdhnQG+nN0ylZ44kEDdUns
         lpuHBf8nyH500lWNhcGY0kWlTzjcaIRxHHwTYFSmdy745qQGXqay1H3Jtu2OJQFCGEtn
         lVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mfiwFC+VRyJLdOlSQm3dV6NiQyp34QySidz7f8YoTwg=;
        b=acaHHPLHUA0Dt4qorbOfuNrdOuvgq9IXspZ10etZxi5fZBJUPlaNmtO+TJSZu672Z0
         QRNfaNTkPGWSXKrsZBaeSV3dyQjRsq95gCngz/USES4m2inSvzFZC9VRo/T6Z+0aNvzw
         AwWT+6haoC4q1FOFjSs7WxTEEZgxe7thuRzoOztWqsBQEn3qdXtLGR7QngPXq1xiWYMj
         FMzwJI7t0q36B1uWFKdENQSMJV3wmXH6FnhUYiI8JidnjeTFbhWyJJIyjWBxPZYbAYSp
         Y6rKVQ8aE4bVOW6423gs82t6dr9wlnWdWc/lVzdBaOjegDmoFUmVfBzajy2qXueB0e2N
         A2cQ==
X-Gm-Message-State: AOAM533GmqeNtUo9cJD3EHp7wtKNr+rKuw1XKCuEYwLYbRFoCsraEG6l
	Ut2sfQtjPWltc9Ta2Nch34z7E6QHOoTa9A==
X-Google-Smtp-Source: ABdhPJyhgKMT5Vzp1WFrNv8ZFzDDBrr+MyichwAtKx/ammAxETCZ8CeiTq0/0B5lkLPDZP8yTUvPSw==
X-Received: by 2002:a17:906:351a:: with SMTP id r26mr20882947eja.409.1607937049583;
        Mon, 14 Dec 2020 01:10:49 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d22sm13318425eja.72.2020.12.14.01.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 01:10:49 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/4] valgrind: exclude bar_bad/bar_bad_xml from ptests
Date: Mon, 14 Dec 2020 10:10:39 +0100
Message-Id: <20201214091042.10145-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214091042.10145-1-alex.kanavin@gmail.com>
References: <20201214091042.10145-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tests' output is non-deterministic and sometimes
doesn't match the sample output. This has been reported at
https://bugs.kde.org/show_bug.cgi?id=430321
(see also an earlier related bug https://bugs.kde.org/show_bug.cgi?id=358213)

Until upstream figures out how to fix this, let's not run the tests.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../valgrind/valgrind/remove-for-aarch64               |  2 --
 meta/recipes-devtools/valgrind/valgrind/remove-for-all |  2 ++
 meta/recipes-devtools/valgrind/valgrind/run-ptest      | 10 ++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.16.1.bb      |  2 ++
 4 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-for-all

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index a3a0c6e50f..93bfd45a4e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -31,8 +31,6 @@ drd/tests/annotate_static
 drd/tests/annotate_trace_memory
 drd/tests/annotate_trace_memory_xml
 drd/tests/atomic_var
-drd/tests/bar_bad
-drd/tests/bar_bad_xml
 drd/tests/bar_trivial
 drd/tests/bug-235681
 drd/tests/bug322621
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
new file mode 100644
index 0000000000..d6a85c4735
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -0,0 +1,2 @@
+drd/tests/bar_bad
+drd/tests/bar_bad_xml
diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index 97b0a85dbf..7217dfca5d 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -17,6 +17,12 @@ EXP_TOOLS="exp-bbv exp-dhat exp-sgcheck"
 GDB_BIN=@bindir@/gdb
 cd ${VALGRIND_LIB}/ptest && ./gdbserver_tests/make_local_links ${GDB_BIN}
 
+echo "Hide valgrind tests that are non-deterministic"
+echo "Reported at https://bugs.kde.org/show_bug.cgi?id=430321"
+for i in `cat remove-for-all`; do
+   mv $i.vgtest $i.IGNORE;
+done
+
 arch=`arch`
 if [ "$arch" = "aarch64" ]; then
    echo "Aarch64: Hide valgrind tests that result in defunct process and then out of memory"
@@ -44,6 +50,10 @@ if [ "$arch" = "aarch64" ]; then
    done
 fi
 
+echo "Restore valgrind tests that are non-deterministc"
+for i in `cat remove-for-all`; do
+   mv $i.IGNORE $i.vgtest;
+done
 
 passed=`grep PASS: ${LOG}|wc -l`
 failed=`grep FAIL: ${LOG}|wc -l`
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
index 5db181ac14..25fa58249c 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://run-ptest \
            file://remove-for-aarch64 \
+           file://remove-for-all \
            file://0004-Fix-out-of-tree-builds.patch \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
@@ -186,6 +187,7 @@ do_install_ptest() {
     # The scripts reference config.h so add it to the top ptest dir.
     cp ${B}/config.h ${D}${PTEST_PATH}
     install -D ${WORKDIR}/remove-for-aarch64 ${D}${PTEST_PATH}
+    install -D ${WORKDIR}/remove-for-all ${D}${PTEST_PATH}
 
     # Add an executable need by none/tests/bigcode
     mkdir ${D}${PTEST_PATH}/perf
-- 
2.29.2

