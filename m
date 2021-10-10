Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814A1C4332F
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 19:10:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.2155.1633893019653134447
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LIvR21gA;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id t2so48573625wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BO2ExVsGmjNfjozZgjkhFkZ2SRFn9BdY27+w1Ga0VZY=;
        b=LIvR21gAYmlWIf//t3ZcAkE5W9ZCPKIVATCqyDQ3EI6iNRdRlrpCnfOWJHv+iUFZa5
         r4RCVfWwYXyxCNp83c5cRqQ0Rqks69IVyJX6cRj+QqeD28gPVIIyO00A/jtgVJcccKEq
         XaLFMlLnFpmtqjFTb2XtLdeWiaebkFi7MIq/h5ZNhhWUY2yauQymxBqZ5uuElOd7s6aH
         QXpWXnkDIoBkoXQc/1x90jad9QQzLLf9F2n7vakm4pIuQUXb0+JongNuZQUR35nOBxsa
         pslNpBRIfRgmQ0QCZxe7KV27CJwPPJZzRiRSgN0UUbfnmW3WgE4b0pQbVZkOqzXkvuIc
         KIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BO2ExVsGmjNfjozZgjkhFkZ2SRFn9BdY27+w1Ga0VZY=;
        b=v+u4gYsEiPE5sTJS9A0Gp+Apy1H5wBg8Qv1E7TyQh4388aEC+29wUIhPDTWfFyLskL
         b2rotY9N87DMzEcXYcXY1SCFjY52yw9T4LeTTRQhi7JfeLsEw5f4fLZxccMfLkRJZHVM
         omvVGcZ0IxLYYSCA2TG8uAKuYoyrm/WMzIy5zzOf/vwdp52xZwiblkausHis9upunyaZ
         80mhfQgRReojWqk2eca9Tm7DEr7RFDgbjBCP/GMARaxNgAUoQj4Y5ZFPKuzbYIJCLJtY
         Tt5RNPzlyEmw5q+BsT6dK+zzrivsCwfG+QNwDAljnB21lgaRS7YAjMr24iv2JKLnMQqI
         F6qA==
X-Gm-Message-State: AOAM532HQB0U0H75tkSep2oEzy61xp6pdgatJqBdWYilepu3TI4hbHDr
	X+wt95MxJE3eh9jUabK5isUQimUnkW8=
X-Google-Smtp-Source: 
 ABdhPJwzK/mCgmDSEbM5GyfwawkHp+1BARst/+M3r4RbpFmFKmXYLCSc4MGHOhpwFgy/PEQDIhQCJA==
X-Received: by 2002:a05:6000:551:: with SMTP id
 b17mr19433601wrf.18.1633893018244;
        Sun, 10 Oct 2021 12:10:18 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id z6sm7962025wmp.1.2021.10.10.12.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 12:10:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/13] rust-common.bbclass: rewrite toolchain wrappers in
 (native) python
Date: Sun, 10 Oct 2021 21:10:06 +0200
Message-Id: <20211010191008.4122049-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010191008.4122049-1-alex@linutronix.de>
References: <20211010191008.4122049-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 19:10:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156804

librsvg on centos 7 and friends exhibits the same libtinfo leakage
problem, this time coming from the compiler and not the linker.
Simply covering the compiler by the existing C wrapper-of-wrapper
does not work, as rust-native builds put Important Stuff into
LD_LIBRARY_PATH and unsetting it breaks things badly.

Rather than try to figure out which combination of wrappers and
LD_LIBRARY_PATH settings works for which situation, or provide
some kind of sh-native, let's simply use python3-native for the
wrappers, which should insulate builds from the the host shell.
rust-native already depends on python3-native, so this does not
lengthen the builds.

This also reverts:
rust-common: Hack around LD_LIBRARY_PATH issues on centos7
(commit 63b1fd2226b5f146d6c853cc57417704df378438).

I'd also like to say boo to Red Hat (or GNU?) for breaking ABI
compatibility for stat() in glibc 2.33, we ended up sorting
this mess because of it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/rust-common.bbclass | 15 ++++++++-------
 meta/files/rust-ccld-wrapper.c   | 29 -----------------------------
 2 files changed, 8 insertions(+), 36 deletions(-)
 delete mode 100644 meta/files/rust-ccld-wrapper.c

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index f7f9cbbb2e0..98d65970e8c 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -1,3 +1,5 @@
+inherit python3native
+
 # Common variables used by all Rust builds
 export rustlibdir = "${libdir}/rust"
 FILES:${PN} += "${rustlibdir}/*.so"
@@ -133,8 +135,12 @@ create_wrapper () {
 	shift
 
 	cat <<- EOF > "${file}"
-	#!/bin/sh
-	exec $@ "\$@"
+	#!/usr/bin/env python3
+	import os, sys
+	orig_binary = "$@"
+	binary = orig_binary.split()[0]
+	args = orig_binary.split() + sys.argv[1:]
+	os.execvp(binary, args)
 	EOF
 	chmod +x "${file}"
 }
@@ -169,11 +175,6 @@ do_rust_create_wrappers () {
 	# Yocto Target / Rust Target archiver
 	create_wrapper "${RUST_TARGET_AR}" "${WRAPPER_TARGET_AR}"
 
-	# Need to filter out LD_LIBRARY_PATH from the linker without using shell
-	mv ${RUST_BUILD_CCLD} ${RUST_BUILD_CCLD}.real
-	${BUILD_CC} ${COREBASE}/meta/files/rust-ccld-wrapper.c -o ${RUST_BUILD_CCLD}
-	mv ${RUST_TARGET_CCLD} ${RUST_TARGET_CCLD}.real
-	${BUILD_CC} ${COREBASE}/meta/files/rust-ccld-wrapper.c -o ${RUST_TARGET_CCLD}
 }
 
 addtask rust_create_wrappers before do_configure after do_patch do_prepare_recipe_sysroot
diff --git a/meta/files/rust-ccld-wrapper.c b/meta/files/rust-ccld-wrapper.c
deleted file mode 100644
index 6bc9958b907..00000000000
--- a/meta/files/rust-ccld-wrapper.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * Copyright 2021 Richard Purdie
- *
- * SPDX-License-Identifier: GPL-2.0-only
- */
-
-#include <errno.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-
-/*
- * Run the original script (argv[0] + ".real") with LD_LIBRARY_PATH unset
- * This avoids issues where cargo is running a wrapper script using /bin/sh from the host
- * which links to something which has an incompatible version in in recipe-sysroot-native
- * such as libtinfo on centos 7.
- */
-
-int main(int argc, char* argv[]) {
-    char *real = malloc(strlen(argv[0] + 5));
-    strcpy(real, argv[0]);
-    strcpy(real + strlen(argv[0]), ".real");
-    putenv("LD_LIBRARY_PATH=");
-    if(execv(real, argv) == -1) {
-        printf("Wrapper failed to execute, error: %s\n", strerror(errno));
-        return -1;
-    }
-}
-- 
2.20.1


