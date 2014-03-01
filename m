Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id A680E6F454
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 20:52:06 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id m10so3546605eaj.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Mar 2014 12:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ui3USd4zJgY6ZfADezaW0eXrIqq4QvB+tY9UTxswHrA=;
	b=frTCAGp0U2wymr6aOmztVWsfXnvvzdJPT02zD3ppm0BTKO5oNLnAh82rElZ7FmeYea
	si0HqRVILFqDq72+YtlFse4gX6gfpWoF0+lJCC8fDmMCkRKTON/16uckhB1nHDVr+85f
	ed31DXTBSbzREpyBk8JRKjJAWHG7F2e83pIFcfXBrXvQlDyxYunqJziAutDaHlN8eQW8
	FAC6Q97F1RJzNGFBQ6M6kMHD4MM4AjWbNurmnfJcpcl0JxsgpePbTBikB/UTg+JNswvj
	o3RIMXpuNHmTRFILwfY6UHUXnkrXrb2rhekc0NxT09xgpcSmlA3RimUjnAwYfI2oI0Kc
	y4jw==
X-Received: by 10.14.100.8 with SMTP id y8mr10841711eef.29.1393707126955;
	Sat, 01 Mar 2014 12:52:06 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m1sm27933871een.7.2014.03.01.12.52.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Mar 2014 12:52:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Mar 2014 21:52:02 +0100
Message-Id: <1393707122-695-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393707122-695-1-git-send-email-Martin.Jansa@gmail.com>
References: <1393707122-695-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] sstate-cache-management.sh: Don't use echo -n
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
X-List-Received-Date: Sat, 01 Mar 2014 20:52:09 -0000

* when debug is enabled it causes more confusion than what it's gaining
  without debug enabled

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index e55eb23..d741ec9 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -101,13 +101,13 @@ do_nothing () {
 
 # Read the input "y"
 read_confirm () {
-  echo -n "$total_deleted from $total_files files will be removed! "
+  echo "$total_deleted from $total_files files will be removed! "
   if [ "$confirm" != "y" ]; then
-      echo -n "Do you want to continue (y/n)? "
+      echo "Do you want to continue (y/n)? "
       while read confirm; do
           [ "$confirm" = "Y" -o "$confirm" = "y" -o "$confirm" = "n" \
             -o "$confirm" = "N" ] && break
-          echo -n "Invalid input \"$confirm\", please input 'y' or 'n': "
+          echo "Invalid input \"$confirm\", please input 'y' or 'n': "
       done
   else
       echo
@@ -178,7 +178,7 @@ remove_duplicated () {
 
   if [ -z "$extra_archs" ] ; then
     # Find out the archs in all the layers
-    echo -n "Figuring out the archs in the layers ... "
+    echo "Figuring out the archs in the layers ... "
     oe_core_dir=$(dirname $(dirname $(readlink -e $0)))
     topdir=$(dirname $oe_core_dir)
     tunedirs="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/include' 2>/dev/null`"
@@ -201,13 +201,13 @@ remove_duplicated () {
   sstate_files_list=`mktemp` || exit 1
   find $cache_dir -name 'sstate:*:*:*:*:*:*:*.tgz*' >$sstate_files_list
 
-  echo -n "Figuring out the suffixes in the sstate cache dir ... "
+  echo "Figuring out the suffixes in the sstate cache dir ... "
   sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g' $sstate_files_list | sort -u`"
   echo "Done"
   echo "The following suffixes have been found in the cache dir:"
   echo $sstate_suffixes
 
-  echo -n "Figuring out the archs in the sstate cache dir ... "
+  echo "Figuring out the archs in the sstate cache dir ... "
   # Using this SSTATE_PKGSPEC definition it's 6th colon separated field
   # SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
   for arch in $all_archs; do
@@ -296,7 +296,7 @@ remove_duplicated () {
       read_confirm
       if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
           for list in `ls $remove_listdir/`; do
-              echo -n "Removing $list.tgz (`cat $remove_listdir/$list | wc -w` files) ... "
+              echo "Removing $list.tgz (`cat $remove_listdir/$list | wc -w` files) ... "
               # Remove them one by one to avoid the argument list too long error
               for i in `cat $remove_listdir/$list`; do
                   rm -f $verbose $i
@@ -328,7 +328,7 @@ rm_by_stamps (){
             package_write_rpm package_write_deb package packagedata deploy"
 
   # Figure out all the md5sums in the stamps dir.
-  echo -n "Figuring out all the md5sums in stamps dir ... "
+  echo "Figuring out all the md5sums in stamps dir ... "
   for i in $suffixes; do
       # There is no "\.siginfo" but "_setcene" when it is mirrored
       # from the SSTATE_MIRRORS, use them to figure out the sum.
@@ -345,7 +345,7 @@ rm_by_stamps (){
   # Save all the state file list to a file
   find $cache_dir -name 'sstate*.tgz' | sort -u -o $cache_list
 
-  echo -n "Figuring out the files which will be removed ... "
+  echo "Figuring out the files which will be removed ... "
   for i in $all_sums; do
       grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:${i}_.*" $cache_list >>$keep_list
   done
-- 
1.9.0


