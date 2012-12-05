Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgLLp-00010X-P2
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 21:13:49 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3119047eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 11:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=P4egx/MDVL4oz7W2SC5av4NOpPqCgaq/VqfbUT8zvAg=;
	b=T9mDGOaL6FB8d9uXyhsBtudFL2UTbhoJYdj67nhGzHNIpupsStcpfFvFLHEZOpPiUi
	rzy/pPzZOmonFd45kT/ze2dcc0jd8BLBNRgaQ48zc/0nzXyJGy1HyYPWXnwBlmolyGKH
	C/fOQdlBzP0Il+xxp3CNyudQooXvT1oAX9Xreyft3E92UrigxWTEzGRffJO8xz98/74K
	9z80OLvEYfhdl7shl6rEkfxUhDLvDkxVOID3jmxii7pSjIFt80VXrxWxfDAY1jMHq1wg
	DiPLZIDY3SvMnOOICK1PhkvgKZfo2N0jyMCl4QFsP2mhdnac9piSuyQZMEqxBzwFcSEh
	aJhw==
Received: by 10.14.221.9 with SMTP id q9mr64753549eep.3.1354737565669;
	Wed, 05 Dec 2012 11:59:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm11169375eem.3.2012.12.05.11.59.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 11:59:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 20:59:21 +0100
Message-Id: <326e3c72501f2a4283e28f26bbca2aafe5e1bef3.1354737450.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <8184c008606ece423da0122a9fa6087509dfa0f5.1354731942.git.Martin.Jansa@gmail.com>
References: <8184c008606ece423da0122a9fa6087509dfa0f5.1354731942.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354737450.git.Martin.Jansa@gmail.com>
References: <cover.1354737450.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 3/5] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Wed, 05 Dec 2012 20:13:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---

v2: fixed WHITELIST for var/pseudo* as Enrico reported

 scripts/sstate-sysroot-cruft.sh | 78 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100755 scripts/sstate-sysroot-cruft.sh

diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
new file mode 100755
index 0000000..530b20d
--- /dev/null
+++ b/scripts/sstate-sysroot-cruft.sh
@@ -0,0 +1,78 @@
+#!/bin/sh
+
+# Used to find files installed in sysroot which are not tracked by sstate manifest
+
+# Global vars
+tmpdir=
+
+usage () {
+  cat << EOF
+Welcome to sysroot cruft finding utility.
+$0 <OPTION>
+
+Options:
+  -h, --help
+        Display this help and exit.
+
+  --tmpdir=<tmpdir>
+        Specify tmpdir, will use the environment variable TMPDIR if it is not specified.
+	Something like /OE/oe-core/tmp-eglibc (no / at the end).
+EOF
+}
+
+# Print error information and exit.
+echo_error () {
+  echo "ERROR: $1" >&2
+  exit 1
+}
+
+while [ -n "$1" ]; do
+  case $1 in
+    --tmpdir=*)
+      tmpdir=`echo $1 | sed -e 's#^--tmpdir=##' | xargs readlink -e`
+      [ -d "$tmpdir" ] || echo_error "Invalid argument to --tmpdir"
+      shift
+        ;;
+    --help|-h)
+      usage
+      exit 0
+        ;;
+    *)
+      echo "Invalid arguments $*"
+      echo_error "Try '$0 -h' for more information."
+        ;;
+  esac
+done
+
+# sstate cache directory, use environment variable TMPDIR
+# if it was not specified, otherwise, error.
+[ -n "$tmpdir" ] || tmpdir=$TMPDIR
+[ -n "$tmpdir" ] || echo_error "No tmpdir found!"
+[ -d "$tmpdir" ] || echo_error "Invalid tmpdir \"$tmpdir\""
+
+OUTPUT=${tmpdir}/sysroot.cruft.`date "+%s"`
+WHITELIST="\/var\/pseudo\($\|\/[^\/]*$\) \/shlibs$ \.pyc$ \.pyo$"
+
+mkdir ${OUTPUT}
+find ${tmpdir}/sstate-control -name \*.populate-sysroot\* -o -name \*.package\* | xargs cat | grep sysroots | \
+  sed 's#/$##g; s#///*#/#g' | \
+  # work around for paths ending with / for directories and multiplied // (e.g. paths to native sysroot)
+  sort > ${OUTPUT}/master.list.all
+sort -u ${OUTPUT}/master.list.all > ${OUTPUT}/master.list # -u because some directories are listed for more recipes
+find ${tmpdir}/sysroots/ | \
+  sort > ${OUTPUT}/sysroot.list
+
+diff ${OUTPUT}/master.list.all ${OUTPUT}/master.list > ${OUTPUT}/duplicates
+diff ${OUTPUT}/master.list ${OUTPUT}/sysroot.list > ${OUTPUT}/diff.all
+
+cp ${OUTPUT}/diff.all ${OUTPUT}/diff
+for item in ${WHITELIST}; do 
+  sed -i "/${item}/d" ${OUTPUT}/diff;
+done
+
+# too many false positives for directories
+# echo "Following files are installed in sysroot at least twice"
+# cat ${OUTPUT}/duplicates
+
+echo "Following files are installed in sysroot, but not tracked by sstate"
+cat ${OUTPUT}/diff
-- 
1.8.0



