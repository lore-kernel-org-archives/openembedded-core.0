Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7CF61BC2
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:27 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 7so329179pgr.2
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jzYR3q3NnVlQT8bUvCpK0bVKgSZ3WjrG/fX9pqbDDQo=;
	b=cwV5Rq3oSkBfbYPfM8/rPCqrxs4KSanaf2vDmZ39YPNrrMX0wYT/zm7iogNIRTFn3W
	ED+3fh6mxGhYBeJZnF8ITjxjfpOOE62JlCZyPFzKDuWKYY0OgijffigD/da6LQptMKrM
	Ga1cbOpE/P0d0x24ynOJPk01TuD+Zs8UjHdPT8OF1EIJaTWkpJ5iutrMbfgAIyujfOmN
	V4Y/bwAvLHMjcQBE0itKmqKLxpktad9mAfvBV5TmJ5ALS8TP/QFkKUpAeeza34zLvNTI
	DuXnFy4vN/q2rJGr9Qcs0p3egQgOn9CE95Z5ufZqaY9gV7odLFetLBi7XWcSr1HP5Uya
	mq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jzYR3q3NnVlQT8bUvCpK0bVKgSZ3WjrG/fX9pqbDDQo=;
	b=FXCjgdIATrVDz1VvIj9DcbvlfYOHKYML5oacoDcWhJBlCHjEWRLQeqIusRvCkXHFE/
	LB6YDYE1zoiyBh2AlUXQVpQ84I6qpMOU0HX2UhIRGrd/BkB8eWA101UV8J2P3VZJDNZx
	2SNJaWZgtdUqsixdCdECdOEg0iIEIhZGT35AihJFGD8ikYdTm++YqoeNCG60jluwsFhi
	nK9EeGJAvtzrtZz3XtsFpjpQJYoNoP8pjfUqtNMz1u+Zxc8t1sqHERZ+ronPNsiHHmcH
	uCN5YQ6Ft6Hby98po/9RiOUc8YmO4GX2003sWo1HAEnF8PzKgRuhg5M2Jkrghng0YqS+
	OIwQ==
X-Gm-Message-State: ANhLgQ2mRYHfVmLPymzPLCm3JpnHFvNJ5VxsZkgRy7LmozkEalOhLMDC
	SQiWhh4Z9WjmuU87qMXOXJghWCzP
X-Google-Smtp-Source: ADFU+vummlHfJ9Vi3t24LTwJzTxqxJaIFlkQicme0WFiF2LsUJmOsdgMaDhgqBSd/dGdAE2DBUD9Gw==
X-Received: by 2002:a65:6841:: with SMTP id q1mr621246pgt.261.1583893588203;
	Tue, 10 Mar 2020 19:26:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.27
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:09 -0700
Message-Id: <102fe8f850f97c7a588ee342846b4c10b8603b0d.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:27 -0000

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


