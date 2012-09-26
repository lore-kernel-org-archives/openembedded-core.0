Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TGw9J-0000TK-FN
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 20:15:53 +0200
Received: from localhost (unknown [64.122.245.103])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 7B1AB304D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 14:02:54 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2012 11:02:27 -0700
Message-Id: <c309642f35ca27d1ecdcf7abb27b032264a8a98b.1348682342.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348682342.git.scott.a.garman@intel.com>
References: <cover.1348682342.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1348682342.git.scott.a.garman@intel.com>
References: <cover.1348682342.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 7B1AB304D4.E9F29
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/2] runqemu-internal: don't append an empty element to PATH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 18:15:53 -0000

Bitbake fails to run when an empty element exists in $PATH. Avoid
creating this situation when $CROSSPATH is not set.

This fixes bug [YOCTO #3101]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu-internal |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 6b8bb65..0f07bad 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -472,7 +472,11 @@ if [ "x$QEMUOPTIONS" = "x" ]; then
     return
 fi
 
-PATH=$CROSSPATH:$OECORE_NATIVE_SYSROOT/usr/bin:$PATH
+if [ "x$CROSSPATH" = "x" ]; then
+    PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$PATH
+else
+    PATH=$CROSSPATH:$OECORE_NATIVE_SYSROOT/usr/bin:$PATH
+fi
 
 QEMUBIN=`which $QEMU 2> /dev/null`
 if [ ! -x "$QEMUBIN" ]; then
-- 
1.7.9.5



