Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5127F738E4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 23:03:23 +0000 (UTC)
Received: by wesw55 with SMTP id w55so2688463wes.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 15:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aEE9Mr7a+/8rOUVFDqqlHumOH7boP8WsauAepKcVyFc=;
	b=K/SQOK3KvS03oDNN1UUdb/d+JMmT6Bs4Yv0d+VF0dYji/dGhdad62bKuMK/qS+8eMs
	B7mn9IpqK+QiuWkp/M6dtvLdzKDmZB14K3za0wTgsvsBco9zkXRHmXb3U9JecZlnRJbV
	U0omU+++imACWYJzjrOHa4laCgbxE1RNvN98Du/KRPeXccWTDxj0YaC+WmeVAEpRrgZF
	1b4MqStl6QAC4BYKy6rd9GWTbL4i4JhgKSo/5TH7dZ8jh3luxqPqtTbwasvw4/gM4bm4
	0CZBxr32wIDIjRIWmXmsyCXoEeptA2j9Ew1jtegVKr8IKGL43HoeseKiMFttiHUKh6ER
	tPpw==
X-Received: by 10.180.86.35 with SMTP id m3mr27362417wiz.83.1425596604894;
	Thu, 05 Mar 2015 15:03:24 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kr5sm12454153wjc.1.2015.03.05.15.03.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 15:03:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Mar 2015 00:03:28 +0100
Message-Id: <1425596608-24197-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [dizzy][PATCH] serf: fix 'ccache' builds
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
X-List-Received-Date: Thu, 05 Mar 2015 23:03:26 -0000

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

'scons' cleans the environment which breaks ccache builds because
CCACHEDIR can point to an unexpected location:

| ccache arm-linux-gnueabi-gcc ... context.c
| ccache: failed to create .../serf/1.3.8-r0/.home/.ccache (No such file or directory)

Issue is described in

  http://www.scons.org/wiki/ImportingEnvironmentSettings

and because 'bitbake' cleans environment we can pass it completely
instead of trying to enumerate needed env.

With the 'env.patch' the FULLCC variable is not needed anymore (which
would break when CC is 'ccache arm-...-gcc' and host ccache is used)
because the correct $PATH is available during scons build:

| sh: .../sysroots/x86_64-oe-linux/usr/bin/arm-linux-gnueabi/ccache: No such file or directory
| scons: *** [context.o] Error 127

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/serf/serf/env.patch | 28 ++++++++++++++++++++++++++++
 meta/recipes-support/serf/serf_1.3.7.bb  |  8 +++-----
 2 files changed, 31 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/serf/serf/env.patch

diff --git a/meta/recipes-support/serf/serf/env.patch b/meta/recipes-support/serf/serf/env.patch
new file mode 100644
index 0000000..9d073e9
--- /dev/null
+++ b/meta/recipes-support/serf/serf/env.patch
@@ -0,0 +1,28 @@
+'scons' cleans the environment which breaks ccache builds because
+CCACHEDIR can point to an unexpected location:
+
+| ccache arm-linux-gnueabi-gcc ... context.c
+| ccache: failed to create .../serf/1.3.6-r0/.home/.ccache (No such file or directory)
+
+Issue is described in
+
+  http://www.scons.org/wiki/ImportingEnvironmentSettings
+
+and because 'bitbake' cleans environment we can pass it completely
+instead of trying to enumerate needed env.
+
+Upstream-Status: Inappropriate
+
+
+Index: serf-1.3.6/SConstruct
+===================================================================
+--- serf-1.3.6.orig/SConstruct
++++ serf-1.3.6/SConstruct
+@@ -149,6 +149,7 @@ if sys.platform == 'win32':
+ env = Environment(variables=opts,
+                   tools=('default', 'textfile',),
+                   CPPPATH=['.', ],
++                  ENV = os.environ,
+                   )
+
+ env.Append(BUILDERS = {
diff --git a/meta/recipes-support/serf/serf_1.3.7.bb b/meta/recipes-support/serf/serf_1.3.7.bb
index 5230ef7..b87a04a 100644
--- a/meta/recipes-support/serf/serf_1.3.7.bb
+++ b/meta/recipes-support/serf/serf_1.3.7.bb
@@ -1,6 +1,7 @@
 
 SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-1.3.7.tar.bz2 \
-           file://norpath.patch"
+           file://norpath.patch \
+           file://env.patch"
 SRC_URI[md5sum] = "0a6fa745df4517dd8f79c75c538919bc"
 SRC_URI[sha256sum] = "ecccb74e665e6ea7539271e126a21d0f7eeddfeaa8ce090adb3aec6682f9f0ae"
 
@@ -9,12 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 DEPENDS = "python-scons-native openssl apr apr-util util-linux expat"
 
-FULLCC = "${STAGING_BINDIR_TOOLCHAIN}/${CC}"
-FULLCC_class-native = "${CC}"
-
 do_compile() {
 	${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} \
-		CC="${FULLCC}" \
+		CC="${CC}" \
 		APR=`which apr-1-config` APU=`which apu-1-config` \
 		CFLAGS="${CFLAGS}" LINKFLAGS="${LDFLAGS}" \
 		OPENSSL="${STAGING_EXECPREFIXDIR}"
-- 
2.3.1


