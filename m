Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 15DA57E241
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 13:16:31 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id flJGh77J46ogsflJHhmOWV; Tue, 25 Jun 2019 14:16:32 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Y62GTSWN c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=dq6fvYVFJ5YA:10 a=Q4-j1AaZAAAA:8 a=-An2I_7KAAAA:8
	a=kHqYklaOKeQ5XumObyMA:9
	a=p2BUFvbHEZkA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Sq34B_EcNBM9_nrAYB9S:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1hflJF-0003oT-K6; Tue, 25 Jun 2019 14:16:29 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 14:16:25 +0100
Message-Id: <20190625131625.15658-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNMcHBzwkdrdEsm6vHw9Ch6zRyKtCIS5wX3hjo3ClJkqQj/TeYDjgVNUCV69DnJQru0Gyn+2TG1L0BYD51bUkb3fH0KVPPeRx60xXwiaKvvQzU2PfUgb
	puuznnaeVWOfaTYMmvdl6GGpFa+WdYdXGcsm0aONXnhmWCKffo9TxlkJ
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] bitbake.conf: Stop exporting TARGET_ flags variables
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
X-List-Received-Date: Tue, 25 Jun 2019 13:16:32 -0000
Content-Transfer-Encoding: 8bit

Way back in
http://lists.openembedded.org/pipermail/openembedded-core/2014-April/210138.html
a few of us discussed not exporting TARGET_LDFLAGS. There seemed to be
support for this idea, and I modified our tree to not do so. I then seem to
have dropped the ball. :( We've been running like that for over five years,
and not observed any problems.

It seems sensible to stop exporting TARGET_CPPFLAGS, TARGET_CFLAGS and
TARGET_CXXFLAGS too.

I've successfully compile-tested core-image-minimal and core-image-sato for
x86_64 and qemuarm64 with these changes.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/conf/bitbake.conf | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4b907d6820..5e93f5c223 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -569,17 +569,17 @@ PATCHRESOLVE = "noop"
 export BUILD_CPPFLAGS = "-isystem${STAGING_INCDIR_NATIVE}"
 BUILDSDK_CPPFLAGS = ""
 export CPPFLAGS = "${TARGET_CPPFLAGS}"
-export TARGET_CPPFLAGS = ""
+TARGET_CPPFLAGS = ""
 
 export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION} ${DEBUG_PREFIX_MAP}"
 export CFLAGS = "${TARGET_CFLAGS}"
-export TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
+TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
 
 export BUILD_CXXFLAGS = "${BUILD_CFLAGS}"
 BUILDSDK_CXXFLAGS = "${BUILDSDK_CFLAGS}"
 export CXXFLAGS = "${TARGET_CXXFLAGS}"
-export TARGET_CXXFLAGS = "${TARGET_CFLAGS}"
+TARGET_CXXFLAGS = "${TARGET_CFLAGS}"
 
 export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -L${STAGING_BASE_LIBDIR_NATIVE} \
@@ -601,7 +601,7 @@ TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_
 ASNEEDED ?= "-Wl,--as-needed"
 
 export LDFLAGS = "${TARGET_LDFLAGS}"
-export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
+TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
 
 # Pass parallel make options to the compile task
 EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
-- 
2.20.1


