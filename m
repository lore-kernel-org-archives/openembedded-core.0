Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TZ2bd-0002iI-CC
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 17:47:57 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so781077bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 08:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=sHw0ffEPgT7AYGbE8r79iqK1YEdysmDRfSx7LBIdYV0=;
	b=I2zZhXZICekSo8hMuczrHNoz5wwFMHfady51hFABRr1odWspuOyWT7MhJMaBwxcp/3
	Fp7gafnJxLCeNCnOyGf4v3mbAOs8gcSYGxgnNcC/v8pgdw6mggpd9lkl9EcfuOjeWgJV
	an55CWB2+Pj2mbk/UO9kpzlV6pcWXVgdYPNzRiLfPdMPotdfOSUzKUkdXiAJ1KCu8aLH
	4SA6nEpmLcwaVgLJyXmnlKJlTHgkiv8Agb/lvWB7rRokctMvkayiaSSYLVWTyA8qIomh
	wgF0OZsMjzm7cqidkae03+BHtSexFCj0PKkYhw8X8J1DSBD+6+IgFj48MHEAxCWTFZVQ
	3QxQ==
Received: by 10.204.147.78 with SMTP id k14mr668904bkv.7.1352997240499;
	Thu, 15 Nov 2012 08:34:00 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z22sm10808371bkw.2.2012.11.15.08.33.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 08:33:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2012 17:34:11 +0100
Message-Id: <1352997251-27377-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1352964649-31187-1-git-send-email-Martin.Jansa@gmail.com>
References: <1352964649-31187-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCHv5] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Thu, 15 Nov 2012 16:47:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 V2: added .pyo to WHITELIST                                                                                                                                  
     shorter filenames                                                                                                                                        
     TMPDIR                                                                                                                                                   
     added duplicates but not shown                                                                                                                           
                                                                                                                                                              
 V3: use also populate-sysroot.MACHINE, manifest name for populate-sysroot                                                                                    
     was changed in febeaf3d1b8917b660c7279b008d8b03337568e9                                                                                                  
                                                                                                                                                              
 V4: dropped eglibc-initial work around, it was fixed in oe-core                                                                                              

 V5: set tmpdir from param or env variable and show usage

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



