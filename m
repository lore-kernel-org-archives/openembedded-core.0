Received: from mail-qa0-f42.google.com ([209.85.216.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UHXJc-00050G-6d
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 11:29:16 +0100
Received: by mail-qa0-f42.google.com with SMTP id cr7so1544067qab.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 03:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=aYjbRv6qwPcRoIT2Ed5lLYqovKfilxrG++CoLPXanuw=;
	b=BgOfKyIwCboojGD0qttprw5Aezg+HzGi0PEu/paezQbGB8PMoI1I574dMnk/guo9R7
	N2wBjBUL+65BYqDHE+soqH+xWBp2hZAoNDtFMfkeoL8hKwNTw3Hpd9jlxHlb36S/fqWj
	pexDIFWWaJ0l3N1iZfihKnP5khvsOWVDndbOiZuHvKPUXFHoaGW8DT5oMdhpoi7/YSTL
	Yr/rS0zGhJowm+ghcuqOwCM3t8lJQ/x7nIt2efIDhHFQiZkFCQmlpA/G7ddgDS5ccS8Q
	BO6Hlz2DH9eCJuvKRgHVMJoGd23CdKgj1IG2ioZQC7FgNvHRmGR3H3SQxAv20NeDSa3r
	ZTLw==
X-Received: by 10.49.50.1 with SMTP id y1mr21063721qen.36.1363601547270;
	Mon, 18 Mar 2013 03:12:27 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id dt10sm33722365qab.0.2013.03.18.03.12.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 03:12:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2013 11:10:08 +0100
Message-Id: <1363601408-5528-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [RFC] icecc: Allow to use this bbclass together with external toolchains
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
X-List-Received-Date: Mon, 18 Mar 2013 10:29:20 -0000

* original implementation by Antti Harju

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index f3e89a9..cf3f23d 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -47,6 +47,9 @@ def get_cross_kernel_cc(bb,d):
     kernel_cc = kernel_cc.strip()
     return kernel_cc
 
+def get_icecc(d):
+    return d.getVar('ICECC_PATH') or os.popen("which icecc").read()[:-1]
+
 def create_path(compilers, bb, d):
     """
     Create Symlinks for the icecc in the staging directory
@@ -56,7 +59,7 @@ def create_path(compilers, bb, d):
         staging += "-kernel"
 
     #check if the icecc path is set by the user
-    icecc   = d.getVar('ICECC_PATH') or os.popen("which icecc").read()[:-1]
+    icecc = get_icecc(d)
 
     # Create the dir if necessary
     try:
@@ -151,6 +154,11 @@ def icc_path(bb,d):
         prefix = d.expand('${HOST_PREFIX}')
         return create_path( [prefix+"gcc", prefix+"g++"], bb, d)      
 
+def icc_get_external_tool(bb, d, tool):
+    external_toolchain_bindir = d.expand('${EXTERNAL_TOOLCHAIN}${bindir_cross}')
+    target_prefix = d.expand('${TARGET_PREFIX}')
+    return os.path.join(external_toolchain_bindir, '%s%s' % (target_prefix, tool))
+
 def icc_get_tool(bb, d, tool):
     if icc_is_native(bb, d):
         return os.popen("which %s" % tool).read()[:-1]
@@ -159,7 +167,26 @@ def icc_get_tool(bb, d, tool):
     else:
         ice_dir = d.expand('${STAGING_BINDIR_TOOLCHAIN}')
         target_sys = d.expand('${TARGET_SYS}')
-        return os.path.join(ice_dir, "%s-%s" % (target_sys, tool))
+        tool_bin = os.path.join(ice_dir, "%s-%s" % (target_sys, tool))
+        if os.path.isfile(tool_bin):
+            return tool_bin
+        else:
+            external_tool_bin = icc_get_external_tool(bb, d, tool)
+            if os.path.isfile(external_tool_bin):
+                return external_tool_bin
+            else:
+                return ""
+
+def icc_get_and_check_tool(bb, d, tool):
+    # Check that g++ or gcc is not a symbolic link to icecc binary in
+    # PATH or icecc-create-env script will silently create an invalid
+    # compiler environment package.
+    t = icc_get_tool(bb, d, tool)
+    if t and os.popen("readlink -f %s" % t).read()[:-1] == get_icecc(d):
+        bb.error("%s is a symlink to %s in PATH and this prevents icecc from working" % (t, get_icecc(d)))
+        return ""
+    else:
+        return t
 
 set_icecc_env() {
     if [ "x${ICECC_DISABLED}" != "x" ]
@@ -178,8 +205,8 @@ set_icecc_env() {
         return
     fi
 
-    ICECC_CC="${@icc_get_tool(bb,d, "gcc")}"
-    ICECC_CXX="${@icc_get_tool(bb,d, "g++")}"
+    ICECC_CC="${@icc_get_and_check_tool(bb, d, "gcc")}"
+    ICECC_CXX="${@icc_get_and_check_tool(bb, d, "g++")}"
     if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
     then
         return
@@ -207,6 +234,8 @@ set_icecc_env() {
     export ICECC_VERSION ICECC_CC ICECC_CXX
     export PATH="$ICE_PATH:$PATH"
     export CCACHE_PATH="$PATH"
+
+    bbnote "Using icecc"
 }
 
 do_configure_prepend() {
-- 
1.8.1.5



