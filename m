Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TKE9u-0000e9-7E
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 22:06:06 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 56CE52FE86
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2012 15:52:58 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2012 12:52:44 -0700
Message-Id: <a9600e68e64a111be4cb934e14b914fa553b5654.1349466569.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349466569.git.scott.a.garman@intel.com>
References: <cover.1349466569.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1349466569.git.scott.a.garman@intel.com>
References: <cover.1349466569.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 56CE52FE86.2C0EF
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/6] classes/cml1: ensure -c menuconfig forces a rebuild next time
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
X-List-Received-Date: Fri, 05 Oct 2012 20:06:06 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Ensure the following results in the kernel being rebuilt, repackaged and
re-deployed in the final step:

bitbake virtual/kernel
bitbake -c menuconfig virtual/kernel
[ make changes to the kernel configuration and save ]
bitbake virtual/kernel

If there are no changes to the configuration saved, the rebuild will not
be triggered.

Note that this relies on a function recently added to BitBake and
requires full hashing (i.e. BB_SIGNATURE_HANDLER must be set to a
signature handler that inherits from BasicHash) - if this is not the
case or the function is not available in the version of BitBake being
used this change will do nothing.

Fixes [YOCTO #2256].

(From OE-Core rev: 9bf6b60e1599cf5dd87089d42584583cdfd6807a)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cml1.bbclass |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index d429188..678d23c 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -10,7 +10,23 @@ addtask configure after do_unpack do_patch before do_compile
 inherit terminal
 
 python do_menuconfig() {
+        try:
+            mtime = os.path.getmtime(".config")
+        except OSError:
+            mtime = 0
+
         oe_terminal("make menuconfig", '${PN} Configuration', d)
+
+        # FIXME this check can be removed when the minimum bitbake version has been bumped
+        if hasattr(bb.build, 'write_taint'):
+            try:
+                newmtime = os.path.getmtime(".config")
+            except OSError:
+                newmtime = 0
+
+            if newmtime > mtime:
+                bb.note("Configuration changed, recompile will be forced")
+                bb.build.write_taint('do_compile', d)
 }
 do_menuconfig[nostamp] = "1"
 addtask menuconfig after do_configure
-- 
1.7.9.5



