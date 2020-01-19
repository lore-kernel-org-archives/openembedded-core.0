Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id 787BF7FC9F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 19:00:07 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id x1so31336031iop.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2020 11:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=s214BMBheMYHf53weE2N/OW/Of5z3U4zULWEfxpf7f8=;
	b=OAyKqQH5MdqY9VDP71K+pudTD7vmLIMdOArhDKEtbXwHLbCr2Ia4sVd7Nl9d3Uy0ip
	Ca5FUUmD2AAjzredfGbahAa84KRcwwl2s8v3JOYMGGVKl4Lgx5JmmCO6op3RQd4gS7Kd
	w0HDqlMp0/CJv/ldYG4pED2XngoTNrZICF8A1pg6FqKWRyHAFuKhLBuo6ZGx0vafXSAL
	hxkVapjvkn2rAPd+2XncUSO29zyZ6OIKd6A1qEr/vdraARTK5shdC2DReZ/iqrDX514M
	QyVbQY4nJAxdfC9QxjGvT2S7A4wFHhQrnkqOktHdnDpS+pf5+CKecC5zu/2/o5TRmkAd
	pb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=s214BMBheMYHf53weE2N/OW/Of5z3U4zULWEfxpf7f8=;
	b=qfsbSPo/aerByllLRvs1cN8n7h0/vzV64Qe7wR8L/JSo2Y0bJUffj9zkxcaJahPSPz
	WQcB7vB4XD34O+0CbMjcEiL+kXiSg5xf9kDXBUHz1GR1x2uN0A9BEtNQ85zFxkmx/RP+
	Dl7yXwZnKbxAQRTGEPlLuRGNa2KIGtF/SWWW/LCaIECj2mpxh761SU6kuhbkLPc3OF3m
	lcJPzNIe4dmRcRLYmvvPuqrEjNwvcrZHzMg+FP/faRwBTfkZlRB5Li5oU7e94nuelHDV
	gR3u1x/82WLUWI8cEbXd02obsNQHYtRr1evQ12hIpyeylv2AQph4sE6SSSBFASvnCMr0
	cfmg==
X-Gm-Message-State: APjAAAU3pLWguJPRUf/2KsZg537t8eLaHW5voXgS5SwM2Htq08Rwt0By
	NAAjcMjVuicPGj2QrXBnSy/yh9L7
X-Google-Smtp-Source: APXvYqyDzyQrvB8YKzSEwj81MpKDwEWVWuo1cPk89N82bK+ix9drO5HWulB0jWuUQHIi6FL1XpIj4w==
X-Received: by 2002:a6b:b504:: with SMTP id e4mr34329923iof.222.1579460408343; 
	Sun, 19 Jan 2020 11:00:08 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	x77sm10726714ilk.34.2020.01.19.11.00.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 11:00:07 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2020 12:59:57 -0600
Message-Id: <20200119185959.406212-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200119185959.406212-1-JPEWhacker@gmail.com>
References: <20200119185959.406212-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] oeqa: reproducible: Add flag for building from sstate
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
X-List-Received-Date: Sun, 19 Jan 2020 19:00:08 -0000
Content-Transfer-Encoding: 8bit

Adds a flag to control if the reproducible QA test should allow building
from sstate or not. Building from sstate may not be reproducible
depending on how the sstate is populated.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 66 +++++++++++---------
 1 file changed, 35 insertions(+), 31 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index db538a4f891..b7484f3e10e 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -80,6 +80,13 @@ class ReproducibleTests(OESelftestTestCase):
     package_classes = ['deb', 'ipk']
     images = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline']
     save_results = False
+    # This variable controls if one of the test builds is allowed to pull from
+    # an sstate cache/mirror. The other build is always done clean as a point of
+    # comparison.
+    # If you know that your sstate archives are reproducible, enabling this
+    # will test that and also make the test run faster. If your sstate is not
+    # reproducible, disable this in your derived test class
+    build_from_sstate = True
 
     def setUpLocal(self):
         super().setUpLocal()
@@ -127,7 +134,7 @@ class ReproducibleTests(OESelftestTestCase):
         bb.utils.mkdirhier(os.path.dirname(dest))
         shutil.copyfile(source, dest)
 
-    def test_reproducible_builds(self):
+    def do_test_build(self, name, use_sstate):
         capture_vars = ['DEPLOY_DIR_' + c.upper() for c in self.package_classes]
 
         if self.save_results:
@@ -135,41 +142,38 @@ class ReproducibleTests(OESelftestTestCase):
             os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
             self.logger.info('Non-reproducible packages will be copied to %s', save_dir)
 
-        # Build native utilities
-        self.write_config('')
-        bitbake("diffutils-native -c addto_recipe_sysroot")
-        diffutils_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffutils-native")
+        tmpdir = os.path.join(self.topdir, name, 'tmp')
+        if os.path.exists(tmpdir):
+            bb.utils.remove(tmpdir, recurse=True)
 
-        # Reproducible builds should not pull from sstate or mirrors, but
-        # sharing DL_DIR is fine
-        common_config = textwrap.dedent('''\
+        config = textwrap.dedent('''\
             INHERIT += "reproducible_build"
-            PACKAGE_CLASSES = "%s"
-            SSTATE_DIR = "${TMPDIR}/sstate"
-            ''') % (' '.join('package_%s' % c for c in self.package_classes))
-
-        # Perform a build.
-        reproducibleA_tmp = os.path.join(self.topdir, 'reproducibleA', 'tmp')
-        if os.path.exists(reproducibleA_tmp):
-            bb.utils.remove(reproducibleA_tmp, recurse=True)
-
-        self.write_config((textwrap.dedent('''\
-            TMPDIR = "%s"
-            ''') % reproducibleA_tmp) + common_config)
-        vars_A = get_bb_vars(capture_vars)
+            PACKAGE_CLASSES = "{package_classes}"
+            TMPDIR = "{tmpdir}"
+            ''').format(package_classes=' '.join('package_%s' % c for c in self.package_classes),
+                        tmpdir=tmpdir)
+
+        if not use_sstate:
+            # This config fragment will disable using shared and the sstate
+            # mirror, forcing a complete build from scratch
+            config += textwrap.dedent('''\
+                SSTATE_DIR = "${TMPDIR}/sstate"
+                SSTATE_MIRROR = ""
+                ''')
+
+        self.write_config(config)
+        d = get_bb_vars(capture_vars)
         bitbake(' '.join(self.images))
+        return d
 
-        # Perform another build.
-        reproducibleB_tmp = os.path.join(self.topdir, 'reproducibleB', 'tmp')
-        if os.path.exists(reproducibleB_tmp):
-            bb.utils.remove(reproducibleB_tmp, recurse=True)
+    def test_reproducible_builds(self):
+        # Build native utilities
+        self.write_config('')
+        bitbake("diffutils-native -c addto_recipe_sysroot")
+        diffutils_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffutils-native")
 
-        self.write_config((textwrap.dedent('''\
-            SSTATE_MIRROR = ""
-            TMPDIR = "%s"
-            ''') % reproducibleB_tmp) + common_config)
-        vars_B = get_bb_vars(capture_vars)
-        bitbake(' '.join(self.images))
+        vars_A = self.do_test_build('reproducibleA', self.build_from_sstate)
+        vars_B = self.do_test_build('reproducibleB', False)
 
         # NOTE: The temp directories from the reproducible build are purposely
         # kept after the build so it can be diffed for debugging.
-- 
2.24.1


