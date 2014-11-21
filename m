Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id ED78460DD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 16:55:58 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sALGtnJZ019021
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Nov 2014 17:55:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1416588952;
	bh=u+BYKAJDICvRcfFAlJYi4G7PKzb7HP4ZcFXixJpxYDM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Sender;
	b=QlsqI2P8K8vfx4Kk+AYoz8eGGMXyuaWw1sFB/NTHajZ4VRJ12fhlKzPbI8WTW9F4c
	dLELm8yTpYtZzJUjE4rwzEbLuvzp1hUGLmqacDODRr0XIf+wLXz3jSJVPCAAq2zzMY
	HqHdnnKHm0yjC3jXw6koz3twlDFKaTjDToKKcQ8c=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sALGtcIv009617
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 21 Nov 2014 17:55:40 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1XrrUg-0000ni-8r; Fri, 21 Nov 2014 17:55:38 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2014 17:55:12 +0100
Message-Id: <1416588912-3046-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1416479292-27377-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1416479292-27377-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -3.9
X-Spam-Level: ---
X-Spam-Tests: AWL,DKIM_ADSP_ALL,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH v2] serf: fix 'ccache' builds
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
X-List-Received-Date: Fri, 21 Nov 2014 16:56:04 -0000

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
---
 meta/recipes-support/serf/serf/env.patch | 28 ++++++++++++++++++++++++++++
 meta/recipes-support/serf/serf_1.3.8.bb  |  9 +++------
 2 files changed, 31 insertions(+), 6 deletions(-)
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
diff --git a/meta/recipes-support/serf/serf_1.3.8.bb b/meta/recipes-support/serf/serf_1.3.8.bb
index 10db122..e818889 100644
--- a/meta/recipes-support/serf/serf_1.3.8.bb
+++ b/meta/recipes-support/serf/serf_1.3.8.bb
@@ -1,7 +1,7 @@
 
 SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-${PV}.tar.bz2 \
-           file://norpath.patch"
-SRC_URI[md5sum] = "2e4efe57ff28cb3202a112e90f0c2889"
+           file://norpath.patch \
+           file://env.patch"
 SRC_URI[sha256sum] = "e0500be065dbbce490449837bb2ab624e46d64fc0b090474d9acaa87c82b2590"
 
 LICENSE = "Apache-2.0"
@@ -9,12 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
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
1.9.3


