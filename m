Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 051039146E
	for <openembedded-core@openembedded.org>;
	Wed, 22 Jan 2020 05:48:23 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9so2451330plo.11
	for <openembedded-core@openembedded.org>;
	Tue, 21 Jan 2020 21:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VKTwpnv4frnlofX5Da8rF+/n+OTwRkliYxLxtbolgCU=;
	b=oZEXPSaGP9a7/pX9PkE7k1dX8jnNnuzvywspe4ZJlSrd2vWlw+pK7qXF3HeHzSRsrr
	Dz7glyRh/xjqsZCG2WJfS9rsa2wxURLpcvO55gQZoeb8YqpjzX1pJgi9BspLQB9yyzVC
	D//4GDtVnsqsKiG0mX11yAcM0Vi6c6j3TiQt3l7qUH6FEOfpdFWIND5f+MQEu6RaBsZF
	9OgpjOLn23ZoDVvrLqT7evBE7S8FkriwS75JCQpVY5Itx7JKkdiZTOZ9fbFFdKE4pzor
	GdR3/LklZ2ku+6QrtPR4La+Z9fBrrxiXkAFN35mhkqug2oZ6AFgM/ynBUN7QO8vXyV52
	DQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VKTwpnv4frnlofX5Da8rF+/n+OTwRkliYxLxtbolgCU=;
	b=ENvD+D0htG/zi7LSDG990aO/mIC84un6L1qGH5AanUP+LTyZ3r5FjkwCOosQB7TfNb
	ZSiEs6m8YPCq6kOM4oFv1huu4GML2mqp36+K4Bt5EF/4L02hExTKQa+MkQXRFc6g8Hq8
	+HWwdcTeh0ogWXZYfb0XxJftxDWc7z2pMxFsUiIbOT4n0mEuua/t2d60wlrhNyz/f92f
	lWmj5IdR3fB5sEmDAm/H+zca3nl3bbpd4ijdKdT4l8kWJaBdXX2zGSrCTJptZvULQmFV
	KiFdP2W4EioC/roAhXM7k+epkjpC2K1l4GSUEtFxZ6UIW3lX4CK1ia+xbBQK0EjAmJ9K
	vzyg==
X-Gm-Message-State: APjAAAVhv6FqqXVmBQO30t3yQn6UMP9UiPwzV47XyJocoNbsGApJucQw
	N+xcWZ3gmfHzDhoSwAEttZlk+HFW
X-Google-Smtp-Source: APXvYqyEg5cTHD99MjV5JhGR0rRQ/ihCmATmSTlLu3kUymRBuUo9ckrX6rr4Xf1IQ2tt5l7fF9DwSw==
X-Received: by 2002:a17:90a:3aaf:: with SMTP id
	b44mr1149486pjc.9.1579672104822; 
	Tue, 21 Jan 2020 21:48:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id p18sm1413247pjo.3.2020.01.21.21.48.23
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 21:48:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 21 Jan 2020 21:48:12 -0800
Message-Id: <c3e957409bf68e7b310e27781ac91d24cf4452bf.1579672034.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579672034.git.akuster808@gmail.com>
References: <cover.1579672034.git.akuster808@gmail.com>
Subject: [zeus 07/11] multilib.conf: Ensure that RECIPE_SYSROOT is unchanged for native
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
X-List-Received-Date: Wed, 22 Jan 2020 05:48:24 -0000

From: Mike Crowe <mac@mcrowe.com>

Ensure that RECIPE_SYSROOT is the same for -native recipes whether
multilib.conf is included or not.

Without this change task signatures for -native recipes change when
switching between MACHINEs that require multilib.conf and those that
don't.

This fix was one of the ones suggested by Khem Raj in
http://lists.openembedded.org/pipermail/openembedded-core/2019-December/290303.html

Add test_sstate_multilib_or_not_native_samesigs test case to
sstatetests.py to ensure that this stays fixed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aa05f1ded71366b86eda7fce24d8b5395e85ada2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/multilib.conf                     |  1 +
 meta/lib/oeqa/selftest/cases/sstatetests.py | 40 +++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index cfed3fbbd0..58f2ac5c86 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -9,6 +9,7 @@ MULTILIBS ??= "multilib:lib32"
 STAGING_DIR_HOST = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
+RECIPE_SYSROOT_class-native = "${WORKDIR}/recipe-sysroot"
 
 INHERIT += "multilib_global"
 
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 6757a0ec68..9adb511960 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -446,6 +446,46 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
         self.assertCountEqual(files1, files2)
 
 
+    def test_sstate_multilib_or_not_native_samesigs(self):
+        """The sstate checksums of two native recipes (and their dependencies)
+        where the target is using multilib in one but not the other
+        should be the same. We use the qemux86copy machine to test
+        this.
+        """
+
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
+TCLIBCAPPEND = \"\"
+MACHINE = \"qemux86\"
+require conf/multilib.conf
+MULTILIBS = "multilib:lib32"
+DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
+""")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
+        bitbake("binutils-native  -S none")
+        self.write_config("""
+TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
+TCLIBCAPPEND = \"\"
+MACHINE = \"qemux86copy\"
+BB_SIGNATURE_HANDLER = "OEBasicHash"
+""")
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
+        bitbake("binutils-native -S none")
+
+        def get_files(d):
+            f = []
+            for root, dirs, files in os.walk(d):
+                for name in files:
+                    f.append(os.path.join(root, name))
+            return f
+        files1 = get_files(self.topdir + "/tmp-sstatesamehash/stamps")
+        files2 = get_files(self.topdir + "/tmp-sstatesamehash2/stamps")
+        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
+        self.maxDiff = None
+        self.assertCountEqual(files1, files2)
+
+
     def test_sstate_noop_samesigs(self):
         """
         The sstate checksums of two builds with these variables changed or
-- 
2.17.1


