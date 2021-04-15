Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.4591.1618479301097073749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 02:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zw72jwpa;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d8so11726609plh.11
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 02:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OgGqoqrdhkUnkDZMCfG3Zpu1a08eqDO+r3kNQNBsgN0=;
        b=Zw72jwpadA5AizKHhv7r3Z+DYtqDFw0qAcJE2w3Ah9icjMS5NV8gaNCMWRDLpiRi4u
         qjzaSTRe34Nemb3/i7VfYOYIRp59AqyUc8a2xxB88j7GpxY+mI5V9kLP4lxwiYa+Iu5d
         X9Kz5YihGeliC0rrSHPoKgGrI0U/PesAaUjZGw5LgmMVUT93IXG1Ak7aoTNrqo2rwQYo
         3iq//MBjJphPU15hiVC+MyZ1eH0bxggsJxInOy1socACN1mwth0PHvPb0qNPg+Vgv4eG
         sLee0drZP8eDUFBnambNbi7VHYEJ/LkN22JepN4KDGVXlObnQ4mASmvmaUMLJ66ScVTd
         C1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OgGqoqrdhkUnkDZMCfG3Zpu1a08eqDO+r3kNQNBsgN0=;
        b=gB+eXgwtHEUN9uFDhPgjL1x3KL4vVUQA3C3/Df57FsmKxKZ00SuwCS+HqmXYWfW9em
         ++ZNLHBND9rCxDggnq9gxqmq3seOalBOd1eJ8mZcVzvoFtgeasuzA6vFe/X0bL+fHysu
         0POpgw0SY7Ida5Z9N1GpPYrHymGtQhIOPL5EFpZ5n8CHieeMukgnCm0766/XairptsnN
         GTWW7KKSCjAp0oxDPpeBm5rMJvPwrJQXggyhB1BYQRmpY3wzd5D9/MuKzkOYn/ogTBTG
         1DR3VkmJ2z5qu6yJ3azPEEMOYyvKnOZ/06YRdOkNDNO5TIAcC9HHIKOdWphCP05R+hBF
         sMAg==
X-Gm-Message-State: AOAM532wJzJRKJ4srUEioYE8GZBqAqJn/++O+/z7DHDoO8sJ5mB4sVtt
	VHEqJ0Gy5aqgOPvIetm0RURtg60nVUh+yfyG
X-Google-Smtp-Source: ABdhPJyAvWWV9fcHAzCKcszOAy6NH3lFMuoKx1MtSMUD1Ea+ObMw7dJHtAWJ5a6jAlngY0o1nMB76g==
X-Received: by 2002:a17:90b:515:: with SMTP id r21mr2878783pjz.42.1618479300368;
        Thu, 15 Apr 2021 02:35:00 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id ms9sm1994851pjb.32.2021.04.15.02.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:35:00 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH 8/8] In case of testing for "x86_64".
Date: Thu, 15 Apr 2021 02:32:27 -0700
Message-Id: <20210415093227.175608-8-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415093227.175608-1-vinay.m.engg@gmail.com>
References: <CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
 <20210415093227.175608-1-vinay.m.engg@gmail.com>

When the target and build section triplet are identical  getting below error.
====================
error: failed to run custom build command for `memchr v2.3.3`

Also, in poky building for x86_64 using "RUST_TARGET_SYS" we were getting below error,
====================
Exception: configparser.DuplicateSectionError: Section 'target.x86_64-unknown-linux-gnu' already exists

So, we are using x86_64-poky-linux as rust target as below,
====================
python3 src/bootstrap/bootstrap.py test --no-fail-fast --bless --target "x86_64-poky-linux"

By default, the rust does not support target option "x86_64-poky-linux",
by setting the path of "x86_64-poky-linux.json" to RUST_TARGET_PATH the rustc consider this for build.
The "x86_64-poky-linux.json" gets generated in "${STAGING_LIBDIR_NATIVE}/rustlib" so we changed
"RUST_TARGET_PATH" accordingly in rust-test.inc as below

Here, in case of x86_64 target we are using "TARGET_SYS" if both "RUST_TARGET_SYS" and
"SNAPSHOT_BUILD_SYS" are identical (x86_64-unknown-linux-gnu).

We were getting below warnings with x86_64 target and got fixed by "--bless" option.
====================
warning: Linking two modules of different data layouts: '' is 'e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128' whereas 'lto_unwind.7rcbfp3g-cgu.3' is 'e-m:e-i64:64-f80:128-n8:16:32:64-S128'

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust-test.inc | 37 ++++++++++++++++++------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-test.inc b/meta/recipes-devtools/rust/rust-test.inc
index 3a9b5b367c..1b12591421 100644
--- a/meta/recipes-devtools/rust/rust-test.inc
+++ b/meta/recipes-devtools/rust/rust-test.inc
@@ -10,8 +10,8 @@ DEPENDS += "file-native python3-native"
 DEPENDS_append_class-native = " rust-llvm-native"
 EXCLUDE_FROM_WORLD = "1"
 
-# We generate local targets, and need to be able to locate them
-export RUST_TARGET_PATH="${WORKDIR}/targets/"
+# In case of x86_64 target we setting this path to location of "x86_64-poky-linux.json".
+export RUST_TARGET_PATH="${STAGING_LIBDIR_NATIVE}/rustlib"
 
 export FORCE_CRATE_HASH="${BB_TASKHASH}"
 
@@ -410,8 +410,12 @@ python do_configure() {
 
     config = configparser.RawConfigParser()
 
-    # [target.ARCH-poky-linux]
-    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
+    # [target.ARCH-unknown-linux-gnu] in case of x86_64 [target.ARCH-poky-linux] 
+    if( d.getVar('RUST_TARGET_SYS', True) != d.getVar('SNAPSHOT_BUILD_SYS', True)):
+       target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
+    else :
+       target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
+
     config.add_section(target_section)
 
     # Points to wrapper files which contain target specific compiler and linker commands. 
@@ -456,8 +460,12 @@ python do_configure() {
 
     config.set("build", "vendor", e(True))
 
-    # Here we are adding "RUST_TARGET_SYS" instead of "TARGET_SYS" as we are using rust supported target.
-    targets = [d.getVar("RUST_TARGET_SYS", True)]
+    # Here we are using "RUST_TARGET_SYS" and incase of x86_64 "TARGET_SYS" as rust supported target.
+    if( d.getVar('RUST_TARGET_SYS', True) != d.getVar('SNAPSHOT_BUILD_SYS', True)):
+        targets = [d.getVar("RUST_TARGET_SYS", True)]
+    else:
+        targets = [d.getVar("TARGET_SYS", True)]
+
     config.set("build", "target", e(targets))
 
     hosts = [d.getVar("SNAPSHOT_BUILD_SYS", True)]
@@ -495,7 +503,13 @@ rust_runx[vardepsexclude] += "PARALLEL_MAKE"
 # We have to build target specific remote-test-server 
 # Reference link - https://rustc-dev-guide.rust-lang.org/tests/intro.html#running-tests-on-a-remote-machine
 do_compile () {
-    rust_runx build src/tools/remote-test-server --target "${RUST_TARGET_SYS}"
+    if [  "${SNAPSHOT_BUILD_SYS}" = "${RUST_TARGET_SYS}" ]
+    then
+       rust_runx build src/tools/remote-test-server --target "${TARGET_SYS}"
+    else
+       rust_runx build src/tools/remote-test-server --target "${RUST_TARGET_SYS}"
+    fi
+
 }
 
 # To test the rust
@@ -506,7 +520,12 @@ do_check () {
     scp -P 2222 -o StrictHostKeyChecking=no build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/
     ssh -p 2222 -o StrictHostKeyChecking=no -f root@127.0.0.1 "~/remote-test-server -v remote"
 
-    export TEST_DEVICE_ADDR="127.0.0.1:12345" 
-    rust_runx test --no-fail-fast --target "${RUST_TARGET_SYS}" > summary.txt 2> /dev/null
+    export TEST_DEVICE_ADDR="127.0.0.1:12345"
+    if [  "${SNAPSHOT_BUILD_SYS}" = "${RUST_TARGET_SYS}" ]
+    then
+       rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" > summary.txt 2> /dev/null
+    else
+       rust_runx test --no-fail-fast --target "${RUST_TARGET_SYS}" > summary.txt 2> /dev/null
+    fi
 }
 addtask do_check after do_compile
-- 
2.17.1

