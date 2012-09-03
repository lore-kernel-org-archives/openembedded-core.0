Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8YOj-0007kH-F1
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 17:17:09 +0200
Received: by bkcik5 with SMTP id ik5so2687502bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=HPhfgNDB5HUx/cPMVLbjndetM3K01E8Izt1s/f67uyE=;
	b=iNLFYC8SjLBgprCXZc6rd5oQ8id6E4+G/QQUF5MXEPoe5n3ddH1GETkHFU3HYIOkUt
	iTD4+pnYtvEquyqd6XuYXY/qKgdxDH8D8Fq/gjk++flBT7NFUHPToQltS3jJvrLVugmp
	KOWgXA8eebtHBFDr2ntBQ91I7iXwk/s5QG+8mXtGesAObFLGpHa47EmdRsjzDm7DNF+O
	VROo/SMhtgFqAOv1CLKZ0GSwIIb7yw6APt9B4Nqg6unPJSgOJrdaMICYFLIO1FlMADPJ
	1wsvLJcgegnpwszanLjkHaa7KKWZP9cUbNQ0B1V1taHyTSgORgMGzn3/8aNVMDezMaHS
	9Yww==
Received: by 10.204.130.151 with SMTP id t23mr7215752bks.94.1346684688855;
	Mon, 03 Sep 2012 08:04:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 25sm8277864bkx.9.2012.09.03.08.04.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 08:04:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 17:05:07 +0200
Message-Id: <78656451c17d66cb405fd5d12248ce311d0bce8e.1346684630.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346584261.git.Martin.Jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346684630.git.Martin.Jansa@gmail.com>
References: <cover.1346684630.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/9] sstate-cache-management.sh: add option to enable debug output
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
X-List-Received-Date: Mon, 03 Sep 2012 15:17:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 491df5f..0cfff77 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -22,6 +22,7 @@ confirm=
 fsym=
 total_deleted=0
 verbose=
+debug=0
 
 usage () {
   cat << EOF
@@ -69,6 +70,9 @@ Options:
   -v, --verbose
         explain what is being done
 
+  -d, --debug
+        show debug info, repeat for more debug info
+
 EOF
 }
 
@@ -215,13 +219,16 @@ remove_duplicated () {
           for arch in $ava_archs; do
               grep -h "/$fn-$arch-" $list_suffix >>$fn_tmp
           done
+          [ $debug -gt 1 ] && echo "Available files for $fn with suffix $suffix:" && cat $fn_tmp
           # Use the modification time
           to_del=$(ls -t $(cat $fn_tmp) | sed -n '1!p')
+          [ $debug -gt 2 ] && echo "Considering to delete: $to_del"
           # The sstate file which is downloaded from the SSTATE_MIRROR is
           # put in SSTATE_DIR, and there is a symlink in SSTATE_DIR/??/ to
           # it, so filter it out from the remove list if it should not be
           # removed.
           to_keep=$(ls -t $(cat $fn_tmp) | sed -n '1p')
+          [ $debug -gt 2 ] && echo "Considering to keep: $to_keep"
           for k in $to_keep; do
               if [ -L "$k" ]; then
                   # The symlink's destination
@@ -235,9 +242,11 @@ remove_duplicated () {
               fi
           done
           rm -f $fn_tmp
+          [ $debug -gt 2 ] && echo "Decided to delete: $to_del"
           gen_rmlist $rm_list "$to_del"
       done
       [ ! -s "$rm_list" ] || deleted=`cat $rm_list | wc -l`
+      [ -s "$rm_list" -a $debug -gt 0 ] && cat $rm_list
       echo "($deleted files will be removed)"
       let total_deleted=$total_deleted+$deleted
   done
@@ -306,6 +315,7 @@ rm_by_stamps (){
       gen_rmlist $rm_list "$to_del"
       let total_deleted=(`cat $rm_list | wc -w`)
       if [ $total_deleted -gt 0 ]; then
+          [ $debug -gt 0 ] && cat $rm_list
           read_confirm
           if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
               echo "Removing sstate cache files ... ($total_deleted files)"
@@ -374,6 +384,11 @@ while [ -n "$1" ]; do
       verbose="-v"
       shift
         ;;
+    --debug)
+      debug=`expr $debug + 1`
+      echo "Debug level $debug"
+      shift
+        ;;
     --help|-h)
       usage
       exit 0
-- 
1.7.12



