Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id A745F601B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 15:54:33 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 649957680; Wed, 02 Dec 2015 10:54:32 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1a49jb-0004QI-6T; Wed, 02 Dec 2015 15:54:23 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1a49jb-0000UW-5p; Wed, 02 Dec 2015 15:54:23 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 15:54:08 +0000
Message-Id: <1449071648-1641-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449053111-19775-2-git-send-email-mac@mcrowe.com>
References: <1449053111-19775-2-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] libav: Correctly handle prefix=""
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
X-List-Received-Date: Wed, 02 Dec 2015 15:54:36 -0000

libav's build system seems to think that prefix="" means that it should
use its default of /usr/local. Setting a prefix of "/" appears to be
sufficient to make it do the right thing.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-multimedia/libav/libav.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index e55038c..a7da107 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -57,13 +57,17 @@ PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
 # Check codecs that require --enable-nonfree
 USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes', '', d)}"
 
+# libav will install in /usr/local if prefix is empty. Luckily,
+# passing just "/" instead does the right thing.
+nonempty_prefix = "${@bb.data.getVar('prefix', d, True) or '/'}"
+
 EXTRA_OECONF = " \
     --enable-shared \
     --enable-pthreads \
     ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree', '', d)} \
     \
     --cross-prefix=${TARGET_PREFIX} \
-    --prefix=${prefix} \
+    --prefix=${nonempty_prefix} \
     \
     --ld="${CCLD}" \
     --arch=${TARGET_ARCH} \
-- 
2.1.4


