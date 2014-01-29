Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 60B696EABF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 21:03:42 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so1191430eek.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=cV/tRg3mZzwRYt80IC8oxZGfjfaDw1wEJ56sUAoYywA=;
	b=l7zHiHeqbChsgJe9e4F/VFx8cx5hJssTRXehjWyQ8GpPoTQ3HLy5POxL0wClTfRvw2
	ag9GpZHAgWFKy4mP3QKKIUywoD39jNLudHlb3bGkmFkk+ISmMkqDVgDXLgRBdRByvooj
	FEJxSh/AX6CiNoOhFXLQ41jEX1p8onDHD5/0n6vIOXMltWjI9P8VtispDNRN8UwDymM9
	LbIGv90QsIl01N39OXOGunaKgMheZ/krWl0PaPxDBB3h22DHFvSrr4EAsWdxqYji+mZa
	8UO0Xtz0nBjBxvCwNM7IcwX1a9XRi7Y1+AGfmWbSBS4mdZWEvPKeWluDrONQhv/ww5xp
	rwOg==
X-Received: by 10.14.3.130 with SMTP id 2mr12087343eeh.36.1391029422974;
	Wed, 29 Jan 2014 13:03:42 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id w4sm13717114eef.20.2014.01.29.13.03.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jan 2014 13:03:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 22:03:42 +0100
Message-Id: <5fa6969a52e0df5e5c0b32ebbb4284ecf8af6900.1391027849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391027849.git.Martin.Jansa@gmail.com>
References: <cover.1391027849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391027849.git.Martin.Jansa@gmail.com>
References: <cover.1391027849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] sstate-cache-management.sh: Fix available architectures
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
X-List-Received-Date: Wed, 29 Jan 2014 21:03:42 -0000

* grep for AVAILTUNES isn't enough in cases where AVAILTUNE doesn't
  match exactly with TUNE_PKGARCH, e.g. AVAILTUNE "cortexa8thf-neon"
  and TUNE_PKGARCH "cortexa8t2hf-vfp-neon", instead of trying to find
  dynamically every available TUNE_PKGARCH (we have _a lot_ of them
  even with oe-core only), add parameter --extra-archs where user can
  define extra architectures he supports in given build
* Don't replace '-' with '_' for extra-archs, it does apply to MACHINE
  names and some AVAILTUNES, but e.g. cortexa8thf-neon shouldn't be
  converted to cortexa8thf_neon
* Add empty architecture for populate_lic sstate archives
* Add ${build_arch}_${arch} combinations for toolchain recipes (e.g.
  gcc-cross is using x86_64_i586

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 49 +++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 035bb25..0d71bfe 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -37,13 +37,19 @@ Options:
         Specify sstate cache directory, will use the environment
         variable SSTATE_CACHE_DIR if it is not specified.
 
+  --extra-archs=<arch1>,<arch2>...<archn>
+        Specify list of architectures which should be tested, this list
+        will be extended with native arch, allarch and empty arch. The
+        script won't be trying to generate list of available archs from
+        AVAILTUNES in tune files.
+
   --extra-layer=<layer1>,<layer2>...<layern>
         Specify the layer which will be used for searching the archs,
         it will search the meta and meta-* layers in the top dir by
         default, and will search meta, meta-*, <layer1>, <layer2>,
         ...<layern> when specified. Use "," as the separator.
 
-        This is useless for --stamps-dir.
+        This is useless for --stamps-dir or when --extra-archs is used.
 
   -d, --remove-duplicated
         Remove the duplicated sstate cache files of one package, only
@@ -170,20 +176,23 @@ remove_duplicated () {
   local fn_tmp
   local list_suffix=`mktemp` || exit 1
 
-  # Find out the archs in all the layers
-  echo -n "Figuring out the archs in the layers ... "
-  oe_core_dir=$(dirname $(dirname $(readlink -e $0)))
-  topdir=$(dirname $oe_core_dir)
-  tunedirs="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/include' 2>/dev/null`"
-  [ -n "$tunedirs" ] || echo_error "Can't find the tune directory"
-  all_machines="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/*' -name '*.conf' 2>/dev/null | sed -e 's/.*\///' -e 's/.conf$//'`"
-  all_archs=`grep -r -h "^AVAILTUNES .*=" $tunedirs | sed -e 's/.*=//' -e 's/\"//g'`
-  # Add the qemu and native archs
-  # Use the "_" to substitute "-", e.g., x86-64 to x86_64
+  if [ -z "$extra_archs" ] ; then
+    # Find out the archs in all the layers
+    echo -n "Figuring out the archs in the layers ... "
+    oe_core_dir=$(dirname $(dirname $(readlink -e $0)))
+    topdir=$(dirname $oe_core_dir)
+    tunedirs="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/include' 2>/dev/null`"
+    [ -n "$tunedirs" ] || echo_error "Can't find the tune directory"
+    all_machines="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/*' -name '*.conf' 2>/dev/null | sed -e 's/.*\///' -e 's/.conf$//'`"
+    all_archs=`grep -r -h "^AVAILTUNES .*=" $tunedirs | sed -e 's/.*=//' -e 's/\"//g'`
+  fi
+
+  # Use the "_" to substitute "-", e.g., x86-64 to x86_64, but not for extra_archs which can be something like cortexa9t2-vfp-neon
   # Sort to remove the duplicated ones
-  # Add allarch
-  all_archs=$(echo allarch $all_archs $all_machines $(uname -m) \
-          | sed -e 's/-/_/g' -e 's/ /\n/g' | sort -u)
+  # Add allarch and builder arch (native)
+  builder_arch=$(uname -m)
+  all_archs="$(echo allarch $all_archs $all_machines $builder_arch \
+          | sed -e 's/-/_/g' -e 's/ /\n/g' | sort -u) $extra_archs"
   echo "Done"
 
   # Total number of files including sstate-, sigdata and .done files
@@ -204,6 +213,9 @@ remove_duplicated () {
   for arch in $all_archs; do
       grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$" $sstate_list
       [ $? -eq 0 ] && ava_archs="$ava_archs $arch"
+      # ${builder_arch}_$arch used by toolchain sstate
+      grep -q ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:${builder_arch}_$arch:[^:]*:[^:]*\.tgz$" $sstate_list
+      [ $? -eq 0 ] && ava_archs="$ava_archs ${builder_arch}_$arch"
   done
   echo "Done"
   echo "The following archs have been found in the cache dir:"
@@ -229,7 +241,7 @@ remove_duplicated () {
       rm_list="$remove_listdir/sstate:xxx_$suffix"
       for fn in $file_names; do
           [ -z "$verbose" ] || echo "Analyzing sstate:$fn-xxx_$suffix.tgz"
-          for arch in $ava_archs; do
+          for arch in $ava_archs ""; do
               grep -h ".*/sstate:$fn:[^:]*:[^:]*:[^:]*:$arch:[^:]*:[^:]*\.tgz$" $list_suffix >$fn_tmp
               if [ -s $fn_tmp ] ; then
                   [ $debug -gt 1 ] && echo "Available files for $fn-$arch- with suffix $suffix:" && cat $fn_tmp
@@ -384,9 +396,14 @@ while [ -n "$1" ]; do
       fsym="y"
       shift
         ;;
+    --extra-archs=*)
+      extra_archs=`echo $1 | sed -e 's#^--extra-archs=##' -e 's#,# #g'`
+      [ -n "$extra_archs" ] || echo_error "Invalid extra arch parameter"
+      shift
+        ;;
     --extra-layer=*)
       extra_layers=`echo $1 | sed -e 's#^--extra-layer=##' -e 's#,# #g'`
-      [ -n "$extra_layers" ] || echo_error "Invalid extra layer $i"
+      [ -n "$extra_layers" ] || echo_error "Invalid extra layer parameter"
       for i in $extra_layers; do
           l=`readlink -e $i`
           if [ -d "$l" ]; then
-- 
1.8.5.3


