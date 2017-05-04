Return-Path: <dev@codyps.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id B362077C3C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 17:50:51 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id x86so5340521ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 May 2017 10:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EwGVcolRP+cYWuVzqAd/sCCwe4ib7vsrdYX1bdysIcQ=;
	b=JozK6BcNjjeZTd5p301Xm1IPULDj8lk14kAX12Rr5xsyc7pvY4GDJnXm3qFVN7c1MM
	F5cP0i1x3gvBQc7KnW4+kAbE82qubqaf7pO6nuhIvhyWciEEueOPyuGDxQnaA0v2z8xX
	G+mWimsqbkhzITNAjWJruHBbX8C+lfSHMKLAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EwGVcolRP+cYWuVzqAd/sCCwe4ib7vsrdYX1bdysIcQ=;
	b=BYCBVmsb4/JTXouMQOCYu9Vexgg571TnOkQGPUENJhh8qW+p33qQMzpg/if1KT7lL4
	w0wiHRMr9P2Ez6+t3ZeCyRkTnQri/sssPCoIDzf5vJXaUvx7s81FxrCzZ1CbtjOMP/Uj
	8zLKldNLX65xXg/EQXZ2qQBMUcozpfOz9dolUTyrtRc0hK+s/POOlVyp3wJbLhtKb66Z
	3D+EZEYZZv+J7mkNUr5Y7JkpE6cIRwASbTmBXdyCwsjvgGI5jgpMHcqfwXYIgcDY8jX0
	sVxMo9rk4LUylH+IFECxUSc73fidTea77G5/nzsxPklEqGXq4ogM3rl0JgilQIlBYRle
	/7xg==
X-Gm-Message-State: AN3rC/57qRUI9B9QoORQifLxIwC4FFlK+ZK5TNqgQ0rT70EVvNt7zA7P
	sNdzumG3qG1Vjw==
X-Received: by 10.107.59.20 with SMTP id i20mr39244411ioa.75.1493920252575;
	Thu, 04 May 2017 10:50:52 -0700 (PDT)
Received: from localhost (static-72-74-84-52.bstnma.fios.verizon.net.
	[72.74.84.52]) by smtp.gmail.com with ESMTPSA id
	v130sm777776itv.19.2017.05.04.10.50.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 May 2017 10:50:52 -0700 (PDT)
From: Cody P Schafer <dev@codyps.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 May 2017 13:50:42 -0400
Message-Id: <20170504175042.3164-2-dev@codyps.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170504175042.3164-1-dev@codyps.com>
References: <20170504175042.3164-1-dev@codyps.com>
Subject: [PATCH v2 2/2] cmake.bbclass: use `cmake --build` to build & install
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
X-List-Received-Date: Thu, 04 May 2017 17:50:51 -0000

Rather than presuming `make` is the generator, use cmake's generic
`cmake --build` feature (which knows to call the appropriate generator).

Both DESTDIR and VERBOSE still behave as intended when used as
environment variables instead of make variable-arguments.

As cmake-based builds don't do any configuration with `make`
invocations, we only pass `PARALLEL_MAKE{,INST}` (via a
EXTRA_OECMAKE_BUILD variable) to the underlying build tool. Make &
ninja support the same `-j N` option (and a few others), so this does
happen to work for both.

This makes it more straight forward for others to select other cmake
generators (many folks have been reaching for `ninja` lately).

CC: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Cody P Schafer <dev@codyps.com>
---
 meta/classes/cmake.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 8b5f18d8e0..ac2c1519b0 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -31,6 +31,9 @@ OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
 
 EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
 
+EXTRA_OECMAKE_BUILD_prepend_task-compile = "${PARALLEL_MAKE} "
+EXTRA_OECMAKE_BUILD_prepend_task-install = "${PARALLEL_MAKEINST} "
+
 # CMake expects target architectures in the format of uname(2),
 # which do not always match TARGET_ARCH, so all the necessary
 # conversions should happen here.
@@ -135,11 +138,13 @@ cmake_do_configure() {
 
 do_compile[progress] = "percent"
 cmake_do_compile()  {
-	base_do_compile VERBOSE=1
+	bbnote VERBOSE=1 cmake --build '${B}' -- ${EXTRA_OECMAKE_BUILD}
+	VERBOSE=1 cmake --build '${B}' -- ${EXTRA_OECMAKE_BUILD}
 }
 
 cmake_do_install() {
-	oe_runmake 'DESTDIR=${D}' install
+	bbnote DESTDIR='${D}' cmake --build '${B}' --target install -- ${EXTRA_OECMAKE_BUILD}
+	DESTDIR='${D}' cmake --build '${B}' --target install -- ${EXTRA_OECMAKE_BUILD}
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install do_generate_toolchain_file
-- 
2.12.2


