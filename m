Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id B576765C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 10:28:31 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	sAKASP7x032314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 11:28:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1416479311;
	bh=ftEIoDWTCuAvCXkZDf3ICid00Jac6Tvzr8LN37XX7Zo=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=BDbFbIWzx4DVLj5RURczlJZeFwuvBYdxYWmMZUqyAoxBvl5w3MIQ1Egp4RLuSZa20
	tsijGdpPb+9z7bR7svh/MSipQqf/bF3NUfSsibAuTQoKdQVGkjvNqQ/XKLE7F8IVIF
	8jVRQ6LII98d1WPwktuGumdgby1Nzbj1ZgcdIHrc=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id sAKASHKK006971
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 20 Nov 2014 11:28:19 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1XrOyH-000789-Er; Thu, 20 Nov 2014 11:28:17 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Nov 2014 11:28:12 +0100
Message-Id: <1416479292-27377-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -3.9
X-Spam-Level: ---
X-Spam-Tests: AWL,DKIM_ADSP_ALL,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] serf: fix 'ccache' builds
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
X-List-Received-Date: Thu, 20 Nov 2014 10:28:37 -0000

'scons' cleans the environment which breaks ccache builds because
CCACHEDIR can point to an unexpected location:

| ccache arm-linux-gnueabi-gcc ... context.c
| ccache: failed to create .../serf/1.3.6-r0/.home/.ccache (No such file or directory)

Issue is described in

  http://www.scons.org/wiki/ImportingEnvironmentSettings

and because 'bitbake' cleans environment we can pass it completely
instead of trying to enumerate needed env.

With the 'env.patch' the FULLCC variable is not needed anymore (which
would break when CC is 'ccache arm-...-gcc' and host ccache is used)
because the correct $PATH is available during scons build.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-support/serf/serf/env.patch | 28 ++++++++++++++++++++++++++++
 meta/recipes-support/serf/serf_1.3.6.bb  |  8 +++-----
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
diff --git a/meta/recipes-support/serf/serf_1.3.6.bb b/meta/recipes-support/serf/serf_1.3.6.bb
index 08b04d3..cd9e47d 100644
--- a/meta/recipes-support/serf/serf_1.3.6.bb
+++ b/meta/recipes-support/serf/serf_1.3.6.bb
@@ -1,6 +1,7 @@
 
 SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-1.3.6.tar.bz2 \
-           file://norpath.patch"
+           file://norpath.patch \
+           file://env.patch"
 SRC_URI[md5sum] = "7fe38fa6eab078e0beabf291d8e4995d"
 SRC_URI[sha256sum] = "ca637beb0399797d4fc7ffa85e801733cd9c876997fac4a4fd12e9afe86563f2"
 
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
1.9.3


