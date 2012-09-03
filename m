Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T8YOp-0007kH-BG
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 17:17:15 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2687502bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Vta81R3mAoOz7Vrr2Ig+epthgSOPr1TLUwB9fsEDvok=;
	b=KDSZ2b4fI/KRKubQHub8SEUsVpezL9NGuuZRgi63bzgyF+Zrp3YugnvmdFAxkmHEW/
	WlRzNTYdbq8wdYnfQDEXBdhcaoUWlpkkKAKsZg3ui2Ud95hqi8JsrIi9luf3eTE4ZI+s
	Jdv7ijL1MEtENsuP0JDLPcfBZCUbsN0PEOx7/B9z5mSwhfB5te3sbkMnvAno8shDQ7DH
	gnV6rk7+XpNEihI6nwz9/fNJ46mL7rtN9b89Qga5bA9ytUwSdHjz0CmwgEQD7npXe2Nm
	dE1W/ny807pJzv0xSpkvXz9F1qFYoLTnlC6DNoaNS50Fz3We7wC8qlqszNsVbiy1XTif
	JRtA==
Received: by 10.204.156.10 with SMTP id u10mr6961577bkw.11.1346684697051;
	Mon, 03 Sep 2012 08:04:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m9sm8278206bkm.10.2012.09.03.08.04.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 08:04:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 17:05:08 +0200
Message-Id: <8bc58ce5fd928ed38389895be18817b1c80b6ac0.1346684630.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <78656451c17d66cb405fd5d12248ce311d0bce8e.1346684630.git.Martin.Jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
	<78656451c17d66cb405fd5d12248ce311d0bce8e.1346684630.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346684630.git.Martin.Jansa@gmail.com>
References: <cover.1346684630.git.Martin.Jansa@gmail.com>
Subject: [PATCH 6/9] sstate-cache-management.sh: fix remove_duplicated when multiple archs were built
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
X-List-Received-Date: Mon, 03 Sep 2012 15:17:15 -0000

* The problem is that you're looking for duplicates across all available archs, so
  armv4t and armv7a populate_sysroot are considered duplicate and only last one is
  kept, but to rebuild from sstate-cache you need both!

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 52 ++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 0cfff77..f519555 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -217,33 +217,35 @@ remove_duplicated () {
       for fn in $file_names; do
           [ -z "$verbose" ] || echo "Analyzing $fn-xxx_$suffix.tgz"
           for arch in $ava_archs; do
-              grep -h "/$fn-$arch-" $list_suffix >>$fn_tmp
-          done
-          [ $debug -gt 1 ] && echo "Available files for $fn with suffix $suffix:" && cat $fn_tmp
-          # Use the modification time
-          to_del=$(ls -t $(cat $fn_tmp) | sed -n '1!p')
-          [ $debug -gt 2 ] && echo "Considering to delete: $to_del"
-          # The sstate file which is downloaded from the SSTATE_MIRROR is
-          # put in SSTATE_DIR, and there is a symlink in SSTATE_DIR/??/ to
-          # it, so filter it out from the remove list if it should not be
-          # removed.
-          to_keep=$(ls -t $(cat $fn_tmp) | sed -n '1p')
-          [ $debug -gt 2 ] && echo "Considering to keep: $to_keep"
-          for k in $to_keep; do
-              if [ -L "$k" ]; then
-                  # The symlink's destination
-                  k_dest="`readlink -e $k`"
-                  # Maybe it is the one in cache_dir
-                  k_maybe="$cache_dir/${k##/*/}"
-                  # Remove it from the remove list if they are the same.
-                  if [ "$k_dest" = "$k_maybe" ]; then
-                      to_del="`echo $to_del | sed 's#'\"$k_maybe\"'##g'`"
-                  fi
+              grep -h "/$fn-$arch-" $list_suffix >$fn_tmp
+              if [ -s $fn_tmp ] ; then
+                  [ $debug -gt 1 ] && echo "Available files for $fn-$arch- with suffix $suffix:" && cat $fn_tmp
+                  # Use the modification time
+                  to_del=$(ls -t $(cat $fn_tmp) | sed -n '1!p')
+                  [ $debug -gt 2 ] && echo "Considering to delete: $to_del"
+                  # The sstate file which is downloaded from the SSTATE_MIRROR is
+                  # put in SSTATE_DIR, and there is a symlink in SSTATE_DIR/??/ to
+                  # it, so filter it out from the remove list if it should not be
+                  # removed.
+                  to_keep=$(ls -t $(cat $fn_tmp) | sed -n '1p')
+                  [ $debug -gt 2 ] && echo "Considering to keep: $to_keep"
+                  for k in $to_keep; do
+                      if [ -L "$k" ]; then
+                          # The symlink's destination
+                          k_dest="`readlink -e $k`"
+                          # Maybe it is the one in cache_dir
+                          k_maybe="$cache_dir/${k##/*/}"
+                          # Remove it from the remove list if they are the same.
+                          if [ "$k_dest" = "$k_maybe" ]; then
+                              to_del="`echo $to_del | sed 's#'\"$k_maybe\"'##g'`"
+                          fi
+                      fi
+                  done
+                  rm -f $fn_tmp
+                  [ $debug -gt 2 ] && echo "Decided to delete: $to_del"
+                  gen_rmlist $rm_list "$to_del"
               fi
           done
-          rm -f $fn_tmp
-          [ $debug -gt 2 ] && echo "Decided to delete: $to_del"
-          gen_rmlist $rm_list "$to_del"
       done
       [ ! -s "$rm_list" ] || deleted=`cat $rm_list | wc -l`
       [ -s "$rm_list" -a $debug -gt 0 ] && cat $rm_list
-- 
1.7.12



