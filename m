Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 7D69E6C4CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 05:38:48 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id B81101C067F;
	Tue, 12 Mar 2019 18:38:48 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2019 18:38:47 +1300
Message-Id: <20190312053847.11170-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190311055151.31185-1-douglas.royds@taitradio.com>
References: <20190311055151.31185-1-douglas.royds@taitradio.com>
Subject: [PATCH v3] cmake: Reduce verbosity for make invocation
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
X-List-Received-Date: Tue, 12 Mar 2019 05:38:48 -0000

New variable OECMAKE_VERBOSE_MAKEFILE defaults to True.

Since the dawn of time, we have set CMAKE_VERBOSE_MAKEFILE=1 (True) in cmake.bbclass.
Back in 2016, we also explicitly set VERBOSE=1 in cmake_do_compile(),
to ensure that make (and ninja) output were verbose in log.do_compile.

Setting OECMAKE_VERBOSE_MAKEFILE to False means that make (or ninja)
invocations from the command-line are non-verbose,
giving CMake's default human-readable output on the terminal instead.
The user can still invoke VERBOSE=1 make if they do want verbose output.
This has no effect on the verbose output that goes into the logs.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/cmake.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index fa7f68c99b..0d44a74046 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -62,6 +62,7 @@ EXTRA_OECMAKE_BUILD_prepend_task-install = "${PARALLEL_MAKEINST} "
 
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"
+OECMAKE_VERBOSE_MAKEFILE ?= "True"
 
 # CMake expects target architectures in the format of uname(2),
 # which do not always match TARGET_ARCH, so all the necessary
@@ -164,7 +165,7 @@ cmake_do_configure() {
 	  -DCMAKE_INSTALL_DATAROOTDIR:PATH=${@os.path.relpath(d.getVar('datadir'), d.getVar('prefix'))} \
 	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
 	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
-	  -DCMAKE_VERBOSE_MAKEFILE=1 \
+	  -DCMAKE_VERBOSE_MAKEFILE=${OECMAKE_VERBOSE_MAKEFILE} \
 	  -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
 	  ${EXTRA_OECMAKE} \
 	  -Wno-dev
-- 
2.17.1


