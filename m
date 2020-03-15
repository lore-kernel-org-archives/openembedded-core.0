Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 366C761BAF
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:08 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id x7so8282366pgh.5
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jzYR3q3NnVlQT8bUvCpK0bVKgSZ3WjrG/fX9pqbDDQo=;
	b=lFHtSovta5H2mgyuWGhCOcNUBy/9ll+L7xdYrbT1dqoGSc/ndBdarFUAnFwbnZxHlu
	K8moTBjk16NIXywH07DYgtIwl53xrY7gXnokmBcZXeX3WxjwynMNcFdnxXbEg3rGmo9B
	RX5YclBV1NqG0MA5ffFkxez7He/L54iLNnJpWfLs54X5yeaT7pNL53eVLIxe0HRTq9x8
	LSV8A/w0hfwj5UgvfccLdOmmtWtGBtJ+beXMoZGDNgfQMjxjPNsiQ7YdPb1GCfPJipKO
	iTZoZMpURM9HLY/dadTOYL57Fr5MLtz4YlIAE6tluiv4bowpfCtg7UY01Qb+Uofo3q9I
	JWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jzYR3q3NnVlQT8bUvCpK0bVKgSZ3WjrG/fX9pqbDDQo=;
	b=bLWkqrIVFh40cT3wfe4nMuIzGsoit3NOnK5T8JNczN9kMX/EHdZVojy+aSk+VTSEW2
	tVq1k7FoVd3V47Txc00di2WY4tvDYRp5s4ciQ2ZahOIP0K21VFfjCISYB0guwCECftj0
	RabixfhKjdXaGip8w2/CkfEQkCMB+F/MqJxoC/1aja9SOGahap/MiGHP8C9cwlRlDIH0
	rf5KgZvbV7Ik7ADqoaeAPK0kCRj2TJS9Z/l4FMzGecpHP+yCclPCTFj0okcNHTlrcXXX
	UNDL8uMb4puD+s1FaPCu4WrSfUoApSj2lYOI/a6tXV540uowIOzt/Cb8DTtxFR/ma6Be
	QYyw==
X-Gm-Message-State: ANhLgQ2JjtR/fA6wIVmA4NkZqqovxgHkxNf0jycw0W3XSY6R+1RCBnF8
	EP/JaOdmEINmP0CBb/5k8O3jMn8T
X-Google-Smtp-Source: ADFU+vvIhzLDqw9by7QUft4jJ5xYtJzYc5XLVLbY5t316nVrGHwp1ArkBvHLBY6Ko2zq6tVzGxiNJg==
X-Received: by 2002:a65:5383:: with SMTP id x3mr23082545pgq.279.1584295929008; 
	Sun, 15 Mar 2020 11:12:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.08
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:50 -0700
Message-Id: <102fe8f850f97c7a588ee342846b4c10b8603b0d.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
Subject: [zeus 08/16] gcc-cross.inc: Prevent native sysroot from leaking into configargs.h
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Mar 2020 18:12:08 -0000

From: Nathan Rossi <nathan@nathanrossi.com>

Prevent the native(sdk) sysroot path from leaking into configargs.h. The
configargs.h header is intended to be static and unchanged as the
content is used as a means of determining that a gcc plugin is built for
the same gcc. This also effects the output of 'gcc --version'. Due to
per recipe sysroots and staging, the sysroot path would be replaced with
the sysroot local to the recipe thus changing the content of
configargs.h.

The sysroot path is replaced with a generic "/host" prefix which
represents the host sysroot (e.g. native or nativesdk).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 84a78f46d59447eeec3d69532a7506148f64c979)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc   | 7 +++++++
 meta/recipes-devtools/gcc/gcc-runtime.inc | 4 ----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 8855bb1f34..06ba3ccd15 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -61,6 +61,13 @@ do_compile () {
 	export CXXFLAGS_FOR_TARGET="${TARGET_CXXFLAGS}"
 	export LDFLAGS_FOR_TARGET="${TARGET_LDFLAGS}"
 
+	# Prevent native/host sysroot path from being used in configargs.h header,
+	# as it will be rewritten when used by other sysroots preventing support
+	# for gcc plugins
+	oe_runmake configure-gcc
+	sed -i 's@${STAGING_DIR_TARGET}@/host@g' ${B}/gcc/configargs.h
+	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/configargs.h
+
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
 	# now generate script to drive testing
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 2da3c02ef0..536b18d97f 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -302,10 +302,6 @@ do_check() {
 
     # HACK: this works around the configure setting CXX with -nostd* args
     sed -i 's/-nostdinc++ -nostdlib++//g' $(find ${B} -name testsuite_flags | head -1)
-    # HACK: this works around the de-stashing changes to configargs.h, as well as recipe-sysroot changing the content
-    sed -i '/static const char configuration_arguments/d' ${B}/gcc/configargs.h
-    ${CC} -v 2>&1 | grep "^Configured with:" | \
-        sed 's/Configured with: \(.*\)/static const char configuration_arguments[] = "\1";/g' >> ${B}/gcc/configargs.h
 
     if [ "${TOOLCHAIN_TEST_TARGET}" = "user" ]; then
         # qemu user has issues allocating large amounts of memory
-- 
2.17.1


