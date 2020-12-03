Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.9901.1607002663875669859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IAfdeviC;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id m19so3463633ejj.11
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 05:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=acEOfNXbwChXeVxv68XlPvEDHjr34+trur+gxIBk5FM=;
        b=IAfdeviCI6fXeIKlf6VCwKPzYO88dK0dZtr8CttHrJXn0euNGuxJ37299fiN8ceOiB
         dcezv9TKv9FKI2DIsh9hsxpyXzzvQiJOLQpaRku/rxWCxR/+pNkbKNQA9QP+zYbbwYLL
         xQp+6gH6A5HIbx2uo+UaC+EJZ1em+WWqGdsQPUPfM3vrPXpSzWAlT/nn3GMN6ZWupOup
         rKGzTLVGQEuEEyGYvgEAVFjX9Q6i/3CBivXo0q+maOmdWEAX1o5bP8jWpAL2OcgKgRrG
         Y+c8GHTAyAV/5Max1TbCpXhoLDuUKGbLlTcLmHaUWUPaKVfbCV59ekUzgr+mVFx7EKIH
         B98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=acEOfNXbwChXeVxv68XlPvEDHjr34+trur+gxIBk5FM=;
        b=gOZr1GeYQd/yXGWdlvWaCiL0OQLERlHzpKfB3K1mP+t2bN5gRdNrTLBcwh7J1IUgQ2
         t8HP8nSWGK/CXEs0NMtN6OkAqPxyIa3Losx+5SW9/afroSHuIRUDinlJigqAbU6vj6m2
         7BNHmztlp2Y8xCefw6nbWHefCw3KWthII1IaTuoX79HvQInmnBIUswcnEq6M/rFw01PO
         olmUqSUUE7quQOjyKgzJmV908f+Bt57H1F2ziKCWuHVcjLhUImYCzK1CGT8OS1AUD7PA
         n5deolNMdII2mxdb7uz2vAtJHThE8mmPv3bP5M7WIzqGbMeMD4ciFP56GJ+tJ31w91gz
         KhIQ==
X-Gm-Message-State: AOAM530VIULouVAhogQLintbo2RnGxd5IYaDaj5J3rWLtcPWD1Q924Yx
	cy6JCh8vC6vqbJjfWiz9IBrbashW4e/4hw==
X-Google-Smtp-Source: ABdhPJzNbcNNHESCeGESNDhh/AMTryy+JkEZLK2IzkTE/c17DB0MZwGFLRcnvx+wlX11yHH+f8TPtA==
X-Received: by 2002:a17:906:3153:: with SMTP id e19mr2668773eje.17.1607002661973;
        Thu, 03 Dec 2020 05:37:41 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id ng1sm77130ejb.112.2020.12.03.05.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:37:41 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/11] piglit: fix reproducibility
Date: Thu,  3 Dec 2020 14:37:23 +0100
Message-Id: <20201203133727.12936-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203133727.12936-1-alex.kanavin@gmail.com>
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...file.py-make-test-lists-reproducible.patch | 31 +++++++++++++
 ...gen_tcs-tes_input_tests.py-do-not-ha.patch | 44 +++++++++++++++++++
 ...lizer.py-make-.gz-files-reproducible.patch | 30 +++++++++++++
 ...sort-the-file-list-before-working-on.patch | 28 ++++++++++++
 ...t-shader.c-do-not-hardcode-build-pat.patch | 30 +++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  6 +++
 6 files changed, 169 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch b/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
new file mode 100644
index 0000000000..cc9482c047
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
@@ -0,0 +1,31 @@
+From 9086d42df1f3134bafcfe33ff16db7bbb9d9a0fd Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 30 Nov 2020 23:08:22 +0000
+Subject: [PATCH] framework/profile.py: make test lists reproducible
+
+These are created with os.walk, which yields different
+order depending on where it's run.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ framework/profile.py | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/framework/profile.py b/framework/profile.py
+index c210e535e..9b5d51d68 100644
+--- a/framework/profile.py
++++ b/framework/profile.py
+@@ -528,7 +528,11 @@ class TestProfile(object):
+                 else:
+                     opts[n] = self.test_list[n]
+         else:
+-            opts = self.test_list  # pylint: disable=redefined-variable-type
++            opts = collections.OrderedDict()
++            test_keys = list(self.test_list.keys())
++            test_keys.sort()
++            for k in test_keys:
++                opts[k] = self.test_list[k]
+ 
+         for k, v in self.filters.run(opts.items()):
+             yield k, v
diff --git a/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
new file mode 100644
index 0000000000..8704f98500
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
@@ -0,0 +1,44 @@
+From 1b23539aece156f6fe0789cb988f22e5915228f6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Nov 2020 17:12:32 +0000
+Subject: [PATCH 1/2] generated_tests/gen_tcs/tes_input_tests.py: do not
+ hardcode the full binary path
+
+This helps reproducibility.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ generated_tests/gen_tcs_input_tests.py | 2 +-
+ generated_tests/gen_tes_input_tests.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/generated_tests/gen_tcs_input_tests.py b/generated_tests/gen_tcs_input_tests.py
+index face4f19a..e36671af4 100644
+--- a/generated_tests/gen_tcs_input_tests.py
++++ b/generated_tests/gen_tcs_input_tests.py
+@@ -272,7 +272,7 @@ class Test(object):
+             relative probe rgb (0.75, 0.75) (0.0, 1.0, 0.0)
+             """)
+ 
+-        test = test.format(self=self, generator_command=" ".join(sys.argv))
++        test = test.format(self=self, generator_command="generated_tests/gen_tcs_input_tests.py")
+ 
+         filename = self.filename()
+         dirname = os.path.dirname(filename)
+diff --git a/generated_tests/gen_tes_input_tests.py b/generated_tests/gen_tes_input_tests.py
+index 3d847b5cc..954840b20 100644
+--- a/generated_tests/gen_tes_input_tests.py
++++ b/generated_tests/gen_tes_input_tests.py
+@@ -301,7 +301,7 @@ class Test(object):
+             relative probe rgb (0.75, 0.75) (0.0, 1.0, 0.0)
+             """)
+ 
+-        test = test.format(self=self, generator_command=" ".join(sys.argv))
++        test = test.format(self=self, generator_command="generated_tests/gen_tes_input_tests.py")
+ 
+         filename = self.filename()
+         dirname = os.path.dirname(filename)
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch b/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
new file mode 100644
index 0000000000..2efba6f866
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
@@ -0,0 +1,30 @@
+From 1919bb7f4072d73dcbb64d0e06eff5b04529c3db Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 16 Nov 2020 18:01:02 +0000
+Subject: [PATCH] serializer.py: make .gz files reproducible
+
+.gz format contains mtime of the compressed data, and
+SOURCE_DATE_EPOCH is the standard way to make it reproducuble.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/serializer.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tests/serializer.py b/tests/serializer.py
+index bd14bc3db..bc5b45d7f 100644
+--- a/tests/serializer.py
++++ b/tests/serializer.py
+@@ -138,7 +138,10 @@ def serializer(name, profile, outfile):
+                 et.SubElement(env, 'env', name=k, value=v)
+ 
+     tree = et.ElementTree(root)
+-    with gzip.open(outfile, 'wb') as f:
++    reproducible_mtime = None
++    if 'SOURCE_DATE_EPOCH' in os.environ:
++        reproducible_mtime=os.environ['SOURCE_DATE_EPOCH']
++    with gzip.GzipFile(outfile, 'wb', mtime=reproducible_mtime) as f:
+         tree.write(f, encoding='utf-8', xml_declaration=True)
+ 
+ 
diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
new file mode 100644
index 0000000000..8321be8490
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
@@ -0,0 +1,28 @@
+From 5bf89c6a314952313b2b762fff0d5501fe57ac53 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 2 Dec 2020 21:21:52 +0000
+Subject: [PATCH] tests/shader.py: sort the file list before working on it
+
+This allows later xml output to be reproducible.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/shader.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/shader.py b/tests/shader.py
+index 849273660..e6e65d1ba 100644
+--- a/tests/shader.py
++++ b/tests/shader.py
+@@ -52,7 +52,9 @@ for basedir in [TESTS_DIR, GENERATED_TESTS_DIR]:
+ for group, files in shader_tests.items():
+     assert group not in profile.test_list, 'duplicate group: {}'.format(group)
+ 
+-    # We'll end up with a list of tuples, split that into two lists
++    # This makes the xml output reproducible, as os.walk() order is random
++    files.sort()
++    # We'll end up with a list of tuples, split that into two list
+     files, installedfiles = list(zip(*files))
+     files = list(files)
+     installedfiles = list(installedfiles)
diff --git a/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
new file mode 100644
index 0000000000..16c7c5c803
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
@@ -0,0 +1,30 @@
+From 1c67250308a92d4991ed05d9d240090ab84accae Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 10 Nov 2020 17:13:50 +0000
+Subject: [PATCH 2/2] tests/util/piglit-shader.c: do not hardcode build path
+ into target binary
+
+This helps reproducibilty.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ tests/util/piglit-shader.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/util/piglit-shader.c b/tests/util/piglit-shader.c
+index 4fd68d21e..c9ea8295e 100644
+--- a/tests/util/piglit-shader.c
++++ b/tests/util/piglit-shader.c
+@@ -73,7 +73,7 @@ piglit_compile_shader(GLenum target, const char *filename)
+ 
+ 	source_dir = getenv("PIGLIT_SOURCE_DIR");
+ 	if (source_dir == NULL) {
+-		source_dir = SOURCE_DIR;
++		source_dir = ".";
+ 	}
+ 
+ 	snprintf(filename_with_path, FILENAME_MAX - 1,
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index a9d1d39dfe..a441699800 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -8,6 +8,11 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0001-Add-a-missing-include-for-htobe32-definition.patch \
+           file://0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch \
+           file://0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
+           file://0001-serializer.py-make-.gz-files-reproducible.patch \
+           file://0001-framework-profile.py-make-test-lists-reproducible.patch \
+           file://0001-tests-shader.py-sort-the-file-list-before-working-on.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
@@ -37,6 +42,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
 
+export PIGLIT_BUILD_DIR = "../../../../git"
 
 do_configure_prepend() {
    if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', d)}" = "no" ]; then
-- 
2.29.2

