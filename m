Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84844C25B0C
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.6768.1659705176182557441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WhWrWn2J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id b6so1389924wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=hURljutyvnLW8LR0znv4/ymez9sYqd22RUfIm2r5rz4=;
        b=WhWrWn2JjXNmU33/lAmJ4cOyjNtYo2PzTYMPVQl1iXWxzaoWnX0F+/0fNE3YV6llbj
         jubEsvExkPsGpj49LKF/s9zsF3xtwoNmcBIEJJf0ELao9cn4MzzyGB2LQombi78OhBHp
         yi/Pec44OIoQ5q+DOH5HkKtD3pDtX8rVi+FbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=hURljutyvnLW8LR0znv4/ymez9sYqd22RUfIm2r5rz4=;
        b=TakmUJXllIHueeJgDz3qH1ynKZ2rBZ6JZMrUpKQmPJg/ag0xdg51B61s1pRcYhQhHa
         LI7DRmMougLSg3fyIMACcejHtIgqw+f8CKGzDTppUG3qFYT9NC7soGGmvTeJvhPinskA
         mJZVgJTmnKHfpfefmhuvM8lGRhEKGYKWfwP9kaOYtKR/wxm2Rr62sSSSyFTi5AHvnET6
         GIk/waB/QilbSYkZi7dWO8haotEXI0WnByozBrjB95X7SINpNdsHaPlRPthMjoaXxL5d
         kZ1QdvU4MZHz8S+KdMxLixA/hZNYGjjdIn+hDTU4tbEYXLMMnFgmvhIOj0Sk2igBfiZn
         +3gQ==
X-Gm-Message-State: ACgBeo0hq33ooMHUjG3x0odCb7Ywd+g0lHMbYjtx385LcuHL84Vc2NyH
	bCfo2vvVKzhg631g4kAgJ4AF5fM7kz8qEQ==
X-Google-Smtp-Source: 
 AA6agR6gQrr+64Nmu9jmuygC6wDNBq4yCe0Rlt3/82LxS/7wVaWHrL7sgeRYFAs6sge+ax5a2BZVaA==
X-Received: by 2002:a7b:cd0f:0:b0:3a5:1fed:ff86 with SMTP id
 f15-20020a7bcd0f000000b003a51fedff86mr1664029wmj.197.1659705182037;
        Fri, 05 Aug 2022 06:13:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/29] rust: Switch to use RUST_XXX_SYS consistently
Date: Fri,  5 Aug 2022 14:12:33 +0100
Message-Id: <20220805131252.3706794-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168944

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cargo.bbclass                   |  4 ++--
 meta/classes/cargo_common.bbclass            |  6 +++---
 meta/classes/python_pyo3.bbclass             |  2 +-
 meta/classes/rust-target-config.bbclass      |  2 +-
 meta/classes/rust.bbclass                    |  4 ++--
 meta/conf/bitbake.conf                       |  2 +-
 meta/recipes-devtools/rust/libstd-rs.inc     |  4 ++--
 meta/recipes-devtools/rust/rust.inc          | 10 +++++-----
 meta/recipes-gnome/librsvg/librsvg_2.54.4.bb |  4 ++--
 9 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/classes/cargo.bbclass b/meta/classes/cargo.bbclass
index 4a780a501ff..539ff03ec7d 100644
--- a/meta/classes/cargo.bbclass
+++ b/meta/classes/cargo.bbclass
@@ -32,12 +32,12 @@ MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
 RUSTFLAGS ??= ""
 BUILD_MODE = "${@['--release', ''][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_BUILD_FLAGS = "-v --target ${HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
+CARGO_BUILD_FLAGS = "-v --target ${RUST_HOST_SYS} ${BUILD_MODE} --manifest-path=${MANIFEST_PATH}"
 
 # This is based on the content of CARGO_BUILD_FLAGS and generally will need to
 # change if CARGO_BUILD_FLAGS changes.
 BUILD_DIR = "${@['release', 'debug'][d.getVar('DEBUG_BUILD') == '1']}"
-CARGO_TARGET_SUBDIR="${HOST_SYS}/${BUILD_DIR}"
+CARGO_TARGET_SUBDIR="${RUST_HOST_SYS}/${BUILD_DIR}"
 oe_cargo_build () {
 	export RUSTFLAGS="${RUSTFLAGS}"
 	export RUST_TARGET_PATH="${RUST_TARGET_PATH}"
diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_common.bbclass
index 39f32829fd4..dcd0afd9801 100644
--- a/meta/classes/cargo_common.bbclass
+++ b/meta/classes/cargo_common.bbclass
@@ -69,15 +69,15 @@ cargo_common_do_configure () {
 	cat <<- EOF >> ${CARGO_HOME}/config
 
 	# HOST_SYS
-	[target.${HOST_SYS}]
+	[target.${RUST_HOST_SYS}]
 	linker = "${CARGO_RUST_TARGET_CCLD}"
 	EOF
 
-	if [ "${HOST_SYS}" != "${BUILD_SYS}" ]; then
+	if [ "${RUST_HOST_SYS}" != "${RUST_BUILD_SYS}" ]; then
 		cat <<- EOF >> ${CARGO_HOME}/config
 
 		# BUILD_SYS
-		[target.${BUILD_SYS}]
+		[target.${RUST_BUILD_SYS}]
 		linker = "${RUST_BUILD_CCLD}"
 		EOF
 	fi
diff --git a/meta/classes/python_pyo3.bbclass b/meta/classes/python_pyo3.bbclass
index 10cc3a06457..b41e3ba0752 100644
--- a/meta/classes/python_pyo3.bbclass
+++ b/meta/classes/python_pyo3.bbclass
@@ -8,7 +8,7 @@ inherit cargo python3-dir siteinfo
 export PYO3_CROSS="1"
 export PYO3_CROSS_PYTHON_VERSION="${PYTHON_BASEVERSION}"
 export PYO3_CROSS_LIB_DIR="${STAGING_LIBDIR}"
-export CARGO_BUILD_TARGET="${HOST_SYS}"
+export CARGO_BUILD_TARGET="${RUST_HOST_SYS}"
 export RUSTFLAGS
 export PYO3_PYTHON="${PYTHON}"
 export PYO3_CONFIG_FILE="${WORKDIR}/pyo3.config"
diff --git a/meta/classes/rust-target-config.bbclass b/meta/classes/rust-target-config.bbclass
index 1721839922e..7fe039601af 100644
--- a/meta/classes/rust-target-config.bbclass
+++ b/meta/classes/rust-target-config.bbclass
@@ -360,7 +360,7 @@ def rust_gen_target(d, thing, wd, arch):
         json.dump(tspec, f, indent=4)
 
 # These are accounted for in tmpdir path names so don't need to be in the task sig
-rust_gen_target[vardepsexclude] += "RUST_HOST_SYS RUST_TARGET_SYS ABIEXTENSION llvm_cpu"
+rust_gen_target[vardepsexclude] += "ABIEXTENSION llvm_cpu"
 
 do_rust_gen_targets[vardeps] += "DATA_LAYOUT TARGET_ENDIAN TARGET_POINTER_WIDTH TARGET_C_INT_WIDTH MAX_ATOMIC_WIDTH FEATURES"
 
diff --git a/meta/classes/rust.bbclass b/meta/classes/rust.bbclass
index 5c8938d09fe..f20e063c5be 100644
--- a/meta/classes/rust.bbclass
+++ b/meta/classes/rust.bbclass
@@ -2,7 +2,7 @@ inherit rust-common
 
 RUSTC = "rustc"
 
-RUSTC_ARCHFLAGS += "--target=${HOST_SYS} ${RUSTFLAGS}"
+RUSTC_ARCHFLAGS += "--target=${RUST_HOST_SYS} ${RUSTFLAGS}"
 
 def rust_base_dep(d):
     # Taken from meta/classes/base.bbclass `base_dep_prepend` and modified to
@@ -37,7 +37,7 @@ HOST_CFLAGS   ?= "${CFLAGS}"
 HOST_CXXFLAGS ?= "${CXXFLAGS}"
 HOST_CPPFLAGS ?= "${CPPFLAGS}"
 
-rustlib_suffix="${TUNE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/rustlib/${HOST_SYS}/lib"
+rustlib_suffix="${TUNE_ARCH}${TARGET_VENDOR}-${TARGET_OS}/rustlib/${RUST_HOST_SYS}/lib"
 # Native sysroot standard library path
 rustlib_src="${prefix}/lib/${rustlib_suffix}"
 # Host sysroot standard library path
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1d36aae8b35..bdfb6784371 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -943,7 +943,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
     OMP_NUM_THREADS BB_CURRENTTASK"
 BB_BASEHASH_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR \
-    SSTATE_DIR SOURCE_DATE_EPOCH"
+    SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGET_SYS"
 BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_PASSTHROUGH_ADDITIONS DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
diff --git a/meta/recipes-devtools/rust/libstd-rs.inc b/meta/recipes-devtools/rust/libstd-rs.inc
index 987956344a2..d49383ced58 100644
--- a/meta/recipes-devtools/rust/libstd-rs.inc
+++ b/meta/recipes-devtools/rust/libstd-rs.inc
@@ -35,6 +35,6 @@ do_install () {
     # With the incremental build support added in 1.24, the libstd deps directory also includes dependency
     # files that get installed. Those are really only needed to incrementally rebuild the libstd library
     # itself and don't need to be installed.
-    rm -f ${B}/${TARGET_SYS}/${BUILD_DIR}/deps/*.d
-    cp ${B}/${TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir}
+    rm -f ${B}/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/*.d
+    cp ${B}/${RUST_TARGET_SYS}/${BUILD_DIR}/deps/* ${D}${rustlibdir}
 }
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index ecb057ad3b5..aa067932fdd 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -79,7 +79,7 @@ python do_configure() {
     config = configparser.RawConfigParser()
 
     # [target.ARCH-poky-linux]
-    target_section = "target.{}".format(d.getVar('TARGET_SYS', True))
+    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
     config.add_section(target_section)
 
     llvm_config = d.expand("${YOCTO_ALTERNATE_EXE_PATH}")
@@ -128,11 +128,11 @@ python do_configure() {
     config.set("build", "vendor", e(True))
 
     if not "targets" in locals():
-        targets = [d.getVar("TARGET_SYS", True)]
+        targets = [d.getVar("RUST_TARGET_SYS", True)]
     config.set("build", "target", e(targets))
 
     if not "hosts" in locals():
-        hosts = [d.getVar("HOST_SYS", True)]
+        hosts = [d.getVar("RUST_HOST_SYS", True)]
     config.set("build", "host", e(hosts))
 
     # We can't use BUILD_SYS since that is something the rust snapshot knows
@@ -181,10 +181,10 @@ do_compile () {
 
 rust_do_install () {
     mkdir -p ${D}${bindir}
-    cp build/${HOST_SYS}/stage2/bin/* ${D}${bindir}
+    cp build/${RUST_HOST_SYS}/stage2/bin/* ${D}${bindir}
 
     mkdir -p ${D}${libdir}/rustlib
-    cp -pRd build/${HOST_SYS}/stage2/lib/* ${D}${libdir}
+    cp -pRd build/${RUST_HOST_SYS}/stage2/lib/* ${D}${libdir}
     # Remove absolute symlink so bitbake doesn't complain
     rm -f ${D}${libdir}/rustlib/src/rust
 }
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
index cc7fb9bbdfe..f3bbeb74ebe 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.4.bb
@@ -31,7 +31,7 @@ export RUST_BACKTRACE = "full"
 export RUSTFLAGS
 export RUST_TARGET_PATH
 
-export RUST_TARGET = "${HOST_SYS}"
+export RUST_TARGET = "${RUST_HOST_SYS}"
 
 RUSTFLAGS:append:mips = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:mipsel = " --cfg crossbeam_no_atomic_64"
@@ -45,7 +45,7 @@ RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"
 do_compile:prepend() {
     cp ${STAGING_LIBDIR_NATIVE}/rustlib/${HOST_SYS}.json ${WORKDIR}
     cp ${STAGING_LIBDIR_NATIVE}/rustlib/${BUILD_SYS}.json ${WORKDIR}
-    sed -ie 's,"linker": ".*","linker": "${RUST_TARGET_CC}",g' ${WORKDIR}/${HOST_SYS}.json
+    sed -ie 's,"linker": ".*","linker": "${RUST_TARGET_CC}",g' ${WORKDIR}/${RUST_HOST_SYS}.json
     RUST_TARGET_PATH="${WORKDIR}"
     export RUST_TARGET_PATH
 }
-- 
2.34.1


