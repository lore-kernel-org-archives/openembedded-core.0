Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id ACD747D3B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 21:45:28 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id x15so4865961wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 14:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=w3THyD20HV4INWw2wtIFWbg2/z9AqfibHW+PgfSIWp8=;
	b=ms8Bb0crL/QNWIN56xHhZTVZS9R/s9QauGpGTMib4xx+QnafF9WAi5gGwZ4j6frJtH
	CWPUn9WT0mCrmauESe2+Z5vyM7rvQZLqns8VGIXksZaCymz526Fykgp6MaNRrRroV3HS
	+KzHOeWjfesO1K/iJXhTbVJXc6s7KMel20Du45xr1MAmUIwTUVR55GJL2Rqn2GaSwj2d
	3FQENecazwUU3GYhupTSJZY5xoOIsanW0beKn5vOG64cp5AJk14xHmfCKTBmbk78j2QJ
	g0GnqJewjCsaAsPun7RfIzzI1c3Plepf2bleRJjY9UUSWam6XjwNNhd72eKlCmazvXeY
	JKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=w3THyD20HV4INWw2wtIFWbg2/z9AqfibHW+PgfSIWp8=;
	b=skeJpOvMdzaqPQ8WDy2SUhflfd7UivwXv8x8g+EzhSC4TboWsCEFS6npYB7swJl3VZ
	H6LHersvbA+sDCzmyreLqaYtYm2hh5Gnpg6mi4cjeqUo3ZHJoSc13/zNXUYfqPP8Ne29
	2S4By8s/k/Xh77/lXuBixdMQevs+Kkb5jSzPk8TdxMubbp22dcMaIW6T09VTTrCH1WzP
	khJ6KwJUWwOJKIQgLi1oZ4jouZmt67pf7OFgDWTAZFaYpY1d7V2iHTATYC73aJtP4McO
	GHlA7sOhY/SY3BSMTv0Iuath8PRUXQkTRWgrlVBJq0OI/ge1iJ+csM2XKzBjzCnkdvkp
	m07Q==
X-Gm-Message-State: APjAAAUVhstalPrPYPl9dC2wqXbXlMpxufEsU8YKd/jcG6A5ZElemgc+
	rRIjH8YVixJMQm+rgvA7BPN3oI76
X-Google-Smtp-Source: APXvYqwjgBruPfJ7MXNCuxbCuX+xt9exi1gz79/1CQFQBGDeHoibtpyLXifDc5RGg6OP4RVsmpZfhg==
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr5451937wmf.60.1560894329298;
	Tue, 18 Jun 2019 14:45:29 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	l17sm21240338wrq.37.2019.06.18.14.45.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 18 Jun 2019 14:45:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 21:45:34 +0000
Message-Id: <20190618214534.14866-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQdcXs=oCRTQ-jycu6WTVWxmQOUVMdnJ9ihFLCMGvCHiUw@mail.gmail.com>
References: <CA+chaQdcXs=oCRTQ-jycu6WTVWxmQOUVMdnJ9ihFLCMGvCHiUw@mail.gmail.com>
Subject: [PATCHv2] serf: stop scons trying to create directories in hosts rootfs
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
X-List-Received-Date: Tue, 18 Jun 2019 21:45:30 -0000

* since 1522f09a4d serf: cleanup recipe
  serf.do_install fails in builds with multilib enabled (with
  libdir=/usr/lib64 on host where /usr/lib64 doesn't exist)

DEBUG: Executing shell function do_install
scons: Reading SConscript files ...
PermissionError: [Errno 13] Permission denied: '/usr/lib64':
  File "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct", line 158:
    ENV = os.environ,
  File "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Environment.py", line 965:
    variables.Update(self)
  File "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variables/__init__.py", line 227:
    option.validator(option.key, env.subst('${%s}'%option.key), env)
  File "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct", line 60:
    return PathVariable.PathIsDirCreate(key, val, env)
  File "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variables/PathVariable.py", line 101:
    os.makedirs(val)
  File "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/lib/python3.7/os.py", line 221:
    mkdir(name, mode)
ERROR: scons install execution failed.

* I don't know how exactly --install-sandbox is supposed to work but
  in this case it's trying to mkdir /usr/lib64 on the host rootfs
  which is clearly wrong and if I set LIBDIR together with
  --install-sandbox then the install paths are prefixed with $D twice
  in some cases (not for includedir and empty libdir at the end).
  So in the end I think it was an issue caused by the custom path
  validator in serf's SConstruct, removing that stops touching host
  and the installed paths (including the paths inside libserf*.pc)
  look correct

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ories.without.sandbox-install.prefix.patch | 71 +++++++++++++++++++
 meta/recipes-support/serf/serf_1.3.9.bb       |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch

diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
new file mode 100644
index 0000000000..91640d6044
--- /dev/null
+++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
@@ -0,0 +1,71 @@
+stop scons trying to create directories in hosts rootfs
+
+* since 1522f09a4d serf: cleanup recipe
+  serf.do_install fails in builds with multilib enabled (with
+  libdir=/usr/lib64 on host where /usr/lib64 doesn't exist)
+
+DEBUG: Executing shell function do_install
+scons: Reading SConscript files ...
+PermissionError: [Errno 13] Permission denied: '/usr/lib64':
+  File "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct", line 158:
+    ENV = os.environ,
+  File "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Environment.py", line 965:
+    variables.Update(self)
+  File "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variables/__init__.py", line 227:
+    option.validator(option.key, env.subst('${%s}'%option.key), env)
+  File "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/serf-1.3.9/SConstruct", line 60:
+    return PathVariable.PathIsDirCreate(key, val, env)
+  File "/TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/bin/../../usr/lib/python3.7/site-packages/SCons/Variables/PathVariable.py", line 101:
+    os.makedirs(val)
+  File "TOPDIR/BUILD/work/qemux86-signage-linux/serf/1.3.9-r0/recipe-sysroot-native/usr/lib/python3.7/os.py", line 221:
+    mkdir(name, mode)
+ERROR: scons install execution failed.
+
+* I don't know how exactly --install-sandbox is supposed to work but
+  in this case it's trying to mkdir /usr/lib64 on the host rootfs
+  which is clearly wrong and if I set LIBDIR together with
+  --install-sandbox then the install paths are prefixed with $D twice
+  in some cases (not for includedir and empty libdir at the end).
+  So in the end I think it was an issue caused by the custom path
+  validator in serf's SConstruct, removing that stops touching host
+  and the installed paths (including the paths inside libserf*.pc)
+  look correct
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+--- serf-1.3.9/SConstruct	2019-06-18 15:49:19.968961108 +0000
++++ serf-1.3.9b/SConstruct	2019-06-18 18:53:21.412337151 +0000
+@@ -51,17 +51,6 @@
+     """
+     return (key, '%s' % (help), default, None, lambda val: _converter(val))
+ 
+-# Custom path validator, creates directory when a specified option is set.
+-# To be used to ensure a PREFIX directory is only created when installing.
+-def createPathIsDirCreateWithTarget(target):
+-  def my_validator(key, val, env):
+-    build_targets = (map(str, BUILD_TARGETS))
+-    if target in build_targets:
+-      return PathVariable.PathIsDirCreate(key, val, env)
+-    else:
+-      return PathVariable.PathAccept(key, val, env)
+-  return my_validator
+-
+ # default directories
+ if sys.platform == 'win32':
+   default_incdir='..'
+@@ -77,11 +66,11 @@
+   PathVariable('PREFIX',
+                'Directory to install under',
+                default_prefix,
+-               createPathIsDirCreateWithTarget('install')),
++               PathVariable.PathAccept),
+   PathVariable('LIBDIR',
+                'Directory to install architecture dependent libraries under',
+                default_libdir,
+-               createPathIsDirCreateWithTarget('install')),
++               PathVariable.PathAccept),
+   PathVariable('APR',
+                "Path to apr-1-config, or to APR's install area",
+                default_incdir,
diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
index 92cd5ca061..dd4133a45c 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -6,6 +6,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patch \
            file://0003-gen_def.patch \
            file://0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch \
+           file://SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch \
            "
 
 SRC_URI[md5sum] = "370a6340ff20366ab088012cd13f2b57"
-- 
2.17.1


