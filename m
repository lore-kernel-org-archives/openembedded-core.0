Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 18532774E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 22:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29MHiCn030273; Thu, 9 Mar 2017 22:17:44 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AbISNl9LtTm9; Thu,  9 Mar 2017 22:17:44 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29MHd6m030268
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Mar 2017 22:17:40 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cm6NP-00055v-Hs; Thu, 09 Mar 2017 22:17:39 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 22:17:34 +0000
Message-Id: <1489097854-19523-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489097854-19523-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1489097854-19523-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/5] base/bitbake.conf: Filter contents of PATH to only allow whitelisted tools
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
X-List-Received-Date: Thu, 09 Mar 2017 22:17:45 -0000

We currently have a determinism problem in that the host tools present
in PATH can influence the build. In particular, the presence of pkg-config
on the build host can mask missing pkgconfig class dependencies.

This adds in a new HOSTTOOLS variable and then uses it to set up a directory
of symlinks to the whitelisted host tools. This directory is placed as PATH
instead of the usual /usr/bin:/bin and so on.

This should improve determinism of builds and avoid the issues which have
been particularly obvious since the introduction of recipe specific sysroots.

If users find there is a tool missing, they can extend HOSTTOOLS from a global
class or global conf file.

Right now the settings should be enough to build everything in OE-Core.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass | 22 ++++++++++++++++++++++
 meta/conf/bitbake.conf    | 18 ++++++++++++++++++
 meta/conf/layer.conf      |  1 +
 3 files changed, 41 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 14293f8..fec351a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -119,6 +119,25 @@ def get_lic_checksum_file_list(d):
             bb.fatal(d.getVar('PN') + ": LIC_FILES_CHKSUM contains an invalid URL: " + url)
     return " ".join(filelist)
 
+def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
+    tools = d.getVar(toolsvar).split()
+    origbbenv = d.getVar("BB_ORIGENV", False)
+    path = origbbenv.getVar("PATH")
+    bb.utils.mkdirhier(dest)
+    notfound = []
+    for tool in tools:
+        desttool = os.path.join(dest, tool)
+        if not os.path.exists(desttool):
+            srctool = bb.utils.which(path, tool)
+            if "ccache" in srctool:
+                srctool = bb.utils.which(path, tool, direction=1)
+            if srctool:
+                os.symlink(srctool, desttool)
+            else:
+                notfound.append(tool)
+    if notfound and fatal:
+        bb.fatal("These tools appear to be unavailable in PATH, please install them in order to proceed:\n%s" % " ".join(notfound))
+
 addtask fetch
 do_fetch[dirs] = "${DL_DIR}"
 do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
@@ -219,6 +238,9 @@ python base_eventhandler() {
         pkgarch_mapping(e.data)
         oe.utils.features_backfill("DISTRO_FEATURES", e.data)
         oe.utils.features_backfill("MACHINE_FEATURES", e.data)
+        # Works with the line in layer.conf which changes PATH to point here
+        setup_hosttools_dir(d.expand('${TMPDIR}/hosttools'), 'HOSTTOOLS', d)
+        setup_hosttools_dir(d.expand('${TMPDIR}/hosttools'), 'HOSTTOOLS_NONFATAL', d, fatal=False)
 
     if isinstance(e, bb.event.BuildStarted):
         localdata = bb.data.createCopy(e.data)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f9df7ca..3f6fed8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -453,6 +453,24 @@ export PATH
 # Build utility info.
 ##################################################################
 
+# Tools needed to run builds with OE-Core
+HOSTTOOLS += " \
+    bash sh cut sed gcc ld git rm install which find xargs cat true mktemp \
+    grep tar gzip touch cp mv basename dirname tr getopt sort awk head tail \
+    mkdir patch uniq perl python chmod python3 ar strip expr ls make as \
+    ranlib egrep echo chown cpio tee wc wget bzip2 stat date rmdir od diff \
+    md5sum dd chrpath file pod2man gunzip python2.7 ln g++ [ false true \
+    uname test hostname nm objdump objcopy cmp printf env readlink gawk fgrep \
+    expand pwd sleep diffstat chgrp flock ldd strings rpcgen du makeinfo \
+    getconf \
+"
+
+# Tools needed to run testimage runtime image testing
+HOSTTOOLS += "ps stty ip ssh scp ping vi"
+
+# Link to these if present
+HOSTTOOLS_NONFATAL += "ccache pip3 ld.bfd ld.gold"
+
 CCACHE ??= ""
 # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
 # of ccache some distributions (e.g., Fedora 17).
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 87c235f..a70f1e1 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -59,3 +59,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   oprofile->virtual/kernel \
 "
 
+PATH = "${TMPDIR}/hosttools"
-- 
2.7.4


