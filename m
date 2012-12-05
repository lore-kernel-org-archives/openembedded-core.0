Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJtv-0007Xo-DC
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 19:41:00 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3064617eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iHKowP8XdfFBzaPY5YwA/4ZdSiV6lKxatIbSMFA6SbM=;
	b=xZckQspMpRyD26biWBKmZElMDhEr508mhTe4O747+9niR49tTqKIUVUVqvNFoemJ+G
	qe6W03npmElKZ501/1N3zPnA6mnk/8Q4hJhAJ98OUn+ftcp45xfVMTochYaDWxX3pg6y
	lh2e8w59kZ0usCoeUJ5D5XqZziJ4KrkelMp0+gWoxoF0A4NxOD0OrTEdy/nRUEGLljK6
	VSMyeAsDh5Yd1e9cs8zewzhewUvDNV1V8YMBF1eKTyChnbTiE2mW7Fh9FZOnnJNO/Bxr
	hyE0KfNubV4DUyMzBCmT2ls78HHk1Nc0kiMOYy3/TvTLMbtN9eFPX5riawM3evEyDcRW
	ekfg==
Received: by 10.14.221.9 with SMTP id q9mr63917136eep.3.1354731991466;
	Wed, 05 Dec 2012 10:26:31 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm10647096eeo.13.2012.12.05.10.26.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:26:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:26:05 +0100
Message-Id: <8184c008606ece423da0122a9fa6087509dfa0f5.1354731942.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354731942.git.Martin.Jansa@gmail.com>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731942.git.Martin.Jansa@gmail.com>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Wed, 05 Dec 2012 18:41:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-sysroot-cruft.sh | 78 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100755 scripts/sstate-sysroot-cruft.sh

diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
new file mode 100755
index 0000000..6caa252
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
+WHITELIST="\/var\/pseudo\/*[^\/]*$ \/shlibs$ \.pyc$ \.pyo$"
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



