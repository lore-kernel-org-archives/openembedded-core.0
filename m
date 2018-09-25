Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 319BF7949B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 13:43:56 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id j25-v6so12688420wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 06:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3qeLWcjUpFcTs+8KKEieh4t5W4d+smo6gAt5XT+hf1c=;
	b=uFalI6DnZQX7puMmZ8DTMHoFKHSr0SxKxtqaaE5enZihuzhKzuh6RZv6qtm8xSvh8H
	p3LXxprrIaJY/2KAtRuS8Yd7nDuskqgSISisKIq8zQfOCFKMEw87BOYhQO96mUPIK/a0
	iudA6HA1qGX5uzwzgERR+bXMZ63h4GFxZ3wV6lqU3/wCJz7AXXaoW44324ay7GRW6133
	V+iMZx5rM0ls+SEO6Avli/3hZ3rmBe9kJOVoVVuRQ9WB3U+0TCZvwnltU5apKKr+mYQV
	dlmsbCU98Ch0VfqKo9LlL+u86oD487NdNIRrzDycYxmBeJQGbwByBiPOmKocJ1e1mwce
	eq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3qeLWcjUpFcTs+8KKEieh4t5W4d+smo6gAt5XT+hf1c=;
	b=VEu9lsT4z8UxI2IMXyJt9yNYjuK3Zou1no+rLMEBCDmUmNst1HLnwQUOZ2ZmHw5pZt
	H0dvL7j1HhOAntssgHft2Oop4d37+0X/yNMluVI2+a78qoW8FFQwbFFMAMjSlWIVR+qM
	zYHPK+Qtm4rgHSADlKTx50VhM6v8fu9LMWmhpASQzDbNp1o5ALNI4AQjCj0+AqS567OO
	Mmb46NquITdcyRB4vTTlfISdGsO9HG457tFjX1Fbh3nH+BQuVyQI+XLRlC2I7UO0pVjn
	J6BWe2tHl/KwGSWmFGy0HSTFaawn7jqOQRY9637B42Ugr3z7mbc5BsWXvIfz+XkM6Y/l
	vRBg==
X-Gm-Message-State: ABuFfoj59cpaNGunxOoFxMNMVAZGv+HcDDs0OMnKyuvZyimjVhlDlcIr
	EvKWor1wu8pFgm7LzaSwoiav8deQpyQ=
X-Google-Smtp-Source: ACcGV62ZMT688wTWMcBe5UOWt2A//H5zA71svteTbFrffmcQZec5U9nRlmjm5YcIDTMsxFdsVdcCoQ==
X-Received: by 2002:a1c:f516:: with SMTP id
	t22-v6mr755747wmh.103.1537883037375; 
	Tue, 25 Sep 2018 06:43:57 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b21-v6sm1852340wmj.28.2018.09.25.06.43.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 06:43:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 14:43:46 +0100
Message-Id: <20180925134348.5562-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180925134348.5562-1-ross.burton@intel.com>
References: <20180925134348.5562-1-ross.burton@intel.com>
Subject: [PATCH 4/6] meson: stop Meson using target CFLAGS in native builds
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
X-List-Received-Date: Tue, 25 Sep 2018 13:43:57 -0000

With the goal of autoconf-compatibility Meson respects $CFLAGS et al in builds.
In cross-compiled build the cross file is the one true source of flags and the
environment isn't used, but in a native build the environment will still be
respected.

As this can lead to target flags being used in the build for native binaries
(including a single native binary inside a target recipe), export
CFLAGS=${BUILD_CFLAGS) et al.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 07322cf7865..ed08a4058cb 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -24,7 +24,11 @@ MESONOPTS = " --prefix ${prefix} \
               --infodir ${@noprefix('infodir', d)} \
               --sysconfdir ${sysconfdir} \
               --localstatedir ${localstatedir} \
-              --sharedstatedir ${sharedstatedir}"
+              --sharedstatedir ${sharedstatedir} \
+              -Dc_args='${BUILD_CPPFLAGS} ${BUILD_CFLAGS}' \
+              -Dc_link_args='${BUILD_LDFLAGS}' \
+              -Dcpp_args='${BUILD_CPPFLAGS} ${BUILD_CXXFLAGS}' \
+              -Dcpp_link_args='${BUILD_LDFLAGS}'"
 
 MESON_TOOLCHAIN_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 MESON_C_ARGS = "${MESON_TOOLCHAIN_ARGS} ${CFLAGS}"
@@ -114,14 +118,15 @@ meson_do_configure() {
 override_native_tools() {
     # Set these so that meson uses the native tools for its build sanity tests,
     # which require executables to be runnable. The cross file will still
-    # override these for the target build. Note that we do *not* set CFLAGS,
-    # LDFLAGS, etc. as they will be slurped in by meson and applied to the
-    # target build, causing errors.
+    # override these for the target build.
     export CC="${BUILD_CC}"
     export CXX="${BUILD_CXX}"
     export LD="${BUILD_LD}"
     export AR="${BUILD_AR}"
-
+    # These contain *target* flags but will be used as *native* flags.  The
+    # correct native flags will be passed via -Dc_args and so on, unset them so
+    # they don't interfere with tools invoked by Meson (such as g-ir-scanner)
+    unset CPPFLAGS CFLAGS CXXFLAGS LDFLAGS
 }
 
 meson_do_configure_prepend_class-target() {
-- 
2.11.0


