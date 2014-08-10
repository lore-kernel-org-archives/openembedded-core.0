Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id D692B60144
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 18:41:27 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so3208095wib.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 11:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ygaVUJNCtJNZy/BGQ4ptmB1s41tae2qO/iRS0zIIUso=;
	b=NiGa4miDhLmvWTGGrdh75I4I3rzK6IEkwpxkvVW9gRkt4bcIv4SkAt1YQr09ud9ZPV
	AwFvJlUsDih69XshQCSpwRjiOEqmBDPcTesa0OyUaz9SmOtQpTbw0P8vLMESsLhRVsWc
	IuA9gUf5rr7HRnx9M399GMMJM0DWDUYHdz2InEsbPbXRQB/28vn0F18lbgX2uMBW/vCP
	lv67atcAAMwLL72KuccUgHYU0wQdUrmniuJeckQiuAzu3oGn0SDQ7PgM1Kxhw8cW8p5Y
	OXtXrFrk4JrigYwaVnmObDu9XMIg0Lw7fVqZFpD9gEfz9Qxx83OkAgPhU6OkG5483Tk1
	+sTg==
X-Received: by 10.180.189.139 with SMTP id gi11mr19474538wic.51.1407696088088; 
	Sun, 10 Aug 2014 11:41:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ft7sm33996025wib.9.2014.08.10.11.41.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 11:41:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Aug 2014 20:41:53 +0200
Message-Id: <1407696113-32174-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] sstate-sysroot-cruft.sh: Improve to use it from CI
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
X-List-Received-Date: Sun, 10 Aug 2014 18:41:29 -0000

* strip tmpdir prefix, so that we have shorter paths which aren't
  builder specific
* use '#' for regexp delimiter so that we don't need to prefix
  forward slashes in paths
* extend default whitelist to cover typical cases
* add parameter for external whitelist file
* use number of found paths as return code, so that CI can easily
  report error when new untracked files are found
* use .txt suffix for all output files, so that they can be easily
  viewed in browser
* add populate_sysroot task, because somewhere between dora and daisy
  the populate-sysroot files in sstate-control were renamed to have
  underscore instead of dash
* only few entries not covered by this default whitelist were found
  in world build (but I'll leave these for people to whitelist, because
  they are not generated in most builds)
  * [^/]*/home/builder
    home directory from meta/recipes-graphics/builder/builder_0.1.bb
  * [^/]*/usr/src/kernel/patches
  * [^/]*/usr/lib/gdk-pixbuf-2.0/.*/loaders.cache
    3 places are using this, not sure which one creates it
    meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb:
      GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
    meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb:
      GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
    scripts/postinst-intercepts/update_pixbuf_cache:
      >$GDK_PIXBUF_MODULEDIR/../loaders.cache && \
      sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-sysroot-cruft.sh | 96 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 11 deletions(-)

diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
index ca2316c..f62485e 100755
--- a/scripts/sstate-sysroot-cruft.sh
+++ b/scripts/sstate-sysroot-cruft.sh
@@ -17,6 +17,15 @@ Options:
   --tmpdir=<tmpdir>
         Specify tmpdir, will use the environment variable TMPDIR if it is not specified.
 	Something like /OE/oe-core/tmp-eglibc (no / at the end).
+
+  --whitelist=<whitelist-file>
+        Text file, each line is regular expression for paths we want to ignore in resulting diff.
+        You can use diff file from the script output, if it contains only expected exceptions.
+        '#' is used as regexp delimiter, so you don't need to prefix forward slashes in paths.
+        ^ and $ is automatically added, so provide only the middle part.
+        Lines starting with '#' are ignored as comments.
+        All paths are relative to "sysroots" directory.
+        Directories don't end with forward slash.
 EOF
 }
 
@@ -33,6 +42,11 @@ while [ -n "$1" ]; do
       [ -d "$tmpdir" ] || echo_error "Invalid argument to --tmpdir"
       shift
         ;;
+    --whitelist=*)
+      fwhitelist=`echo $1 | sed -e 's#^--whitelist=##' | xargs readlink -e`
+      [ -f "$fwhitelist" ] || echo_error "Invalid argument to --whitelist"
+      shift
+        ;;
     --help|-h)
       usage
       exit 0
@@ -51,28 +65,88 @@ done
 [ -d "$tmpdir" ] || echo_error "Invalid tmpdir \"$tmpdir\""
 
 OUTPUT=${tmpdir}/sysroot.cruft.`date "+%s"`
-WHITELIST="\/var\/pseudo\($\|\/[^\/]*$\) \/shlibs$ \.pyc$ \.pyo$"
+
+# top level directories
+WHITELIST="[^/]*"
+
+# generated by base-passwd recipe
+WHITELIST="${WHITELIST} \
+  .*/etc/group-\? \
+  .*/etc/passwd-\? \
+"
+# generated by pseudo-native
+WHITELIST="${WHITELIST} \
+  .*/var/pseudo \
+  .*/var/pseudo/[^/]* \
+"
+
+# generated by package.bbclass:SHLIBSDIRS = "${PKGDATA_DIR}/${MLPREFIX}shlibs"
+WHITELIST="${WHITELIST} \
+  .*/shlibs \
+  .*/pkgdata \
+"
+
+# generated by python
+WHITELIST="${WHITELIST} \
+  .*\.pyc \
+  .*\.pyo \
+"
+
+# generated by sgml-common-native
+WHITELIST="${WHITELIST} \
+  .*/etc/sgml/sgml-docbook.bak \
+"
+
+# generated by toolchain
+WHITELIST="${WHITELIST} \
+  [^/]*-tcbootstrap/lib \
+"
+
+# generated by useradd.bbclass
+WHITELIST="${WHITELIST} \
+  [^/]*/home \
+  [^/]*/home/xuser \
+"
+
+SYSROOTS="`readlink -f ${tmpdir}`/sysroots/"
 
 mkdir ${OUTPUT}
-find ${tmpdir}/sstate-control -name \*.populate-sysroot\* -o -name \*.package\* | xargs cat | grep sysroots | \
+find ${tmpdir}/sstate-control -name \*.populate-sysroot\* -o -name \*.populate_sysroot\* -o -name \*.package\* | xargs cat | grep sysroots | \
   sed 's#/$##g; s#///*#/#g' | \
   # work around for paths ending with / for directories and multiplied // (e.g. paths to native sysroot)
-  sort > ${OUTPUT}/master.list.all
-sort -u ${OUTPUT}/master.list.all > ${OUTPUT}/master.list # -u because some directories are listed for more recipes
+  sort | sed "s#^${SYSROOTS}##g" > ${OUTPUT}/master.list.all.txt
+sort -u ${OUTPUT}/master.list.all.txt > ${OUTPUT}/master.list.txt # -u because some directories are listed for more recipes
 find ${tmpdir}/sysroots/ | \
-  sort > ${OUTPUT}/sysroot.list
+  sort | sed "s#^${SYSROOTS}##g" > ${OUTPUT}/sysroot.list.txt
 
-diff ${OUTPUT}/master.list.all ${OUTPUT}/master.list > ${OUTPUT}/duplicates
-diff ${OUTPUT}/master.list ${OUTPUT}/sysroot.list > ${OUTPUT}/diff.all
+diff ${OUTPUT}/master.list.all.txt ${OUTPUT}/master.list.txt > ${OUTPUT}/duplicates.txt
+diff ${OUTPUT}/master.list.txt ${OUTPUT}/sysroot.list.txt > ${OUTPUT}/diff.all.txt
 
-cp ${OUTPUT}/diff.all ${OUTPUT}/diff
+grep "^> ." ${OUTPUT}/diff.all.txt | sed 's/^> //g' > ${OUTPUT}/diff.txt
 for item in ${WHITELIST}; do
-  sed -i "/${item}/d" ${OUTPUT}/diff;
+  sed -i "\\#^${item}\$#d" ${OUTPUT}/diff.txt;
+  echo "${item}" >> ${OUTPUT}/used.whitelist.txt
 done
 
+if [ -s "$fwhitelist" ] ; then
+  cat $fwhitelist >> ${OUTPUT}/used.whitelist.txt
+  cat $fwhitelist | grep -v '^#' | while read item; do
+    sed -i "\\#^${item}\$#d" ${OUTPUT}/diff.txt;
+  done
+fi
 # too many false positives for directories
 # echo "Following files are installed in sysroot at least twice"
 # cat ${OUTPUT}/duplicates
 
-echo "Following files are installed in sysroot, but not tracked by sstate"
-cat ${OUTPUT}/diff
+RESULT=`cat ${OUTPUT}/diff.txt | wc -l`
+
+if [ "${RESULT}" != "0" ] ; then
+  echo "ERROR: ${RESULT} issues were found."
+  echo "ERROR: Following files are installed in sysroot, but not tracked by sstate:"
+  cat ${OUTPUT}/diff.txt
+else
+  echo "INFO: All files are tracked by sstate or were explicitly ignored by this script"
+fi
+
+echo "INFO: Output written in: ${OUTPUT}"
+exit ${RESULT}
-- 
2.0.4


