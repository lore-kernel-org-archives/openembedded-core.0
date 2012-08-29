Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T6ecq-0005sn-5W
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 11:31:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7T9Jb0V022662
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 02:19:37 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 29 Aug 2012 02:19:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2012 17:24:59 +0800
Message-ID: <c238c31c55c60ffb823f7158dc7eb3922bd02ed3.1346230461.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1346230461.git.liezhi.yang@windriver.com>
References: <cover.1346230461.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] sstate-cache-management.sh: fix it for downloaded file
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
X-List-Received-Date: Wed, 29 Aug 2012 09:31:52 -0000
Content-Type: text/plain

Fix it for the downloaded sstate cache file
* The downloaded sstate cache file is in SSTATE_DIR, and there is a
  symlink points to it, the sstate cache file should not be removed if
  the corresponding symlink is kept, it would be removed when the
  symlink is removed (with -L option).

* Fix a comment line.

[YOCTO #2897]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/sstate-cache-management.sh | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 3a5980c..a1f7c89 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -211,8 +211,25 @@ remove_duplicated () {
           for arch in $ava_archs; do
               grep -h "/$fn-$arch-" $list_suffix >>$fn_tmp
           done
-          # Use the access time, also delete the .siginfo file
+          # Use the modification time
           to_del=$(ls -t $(cat $fn_tmp) | sed -n '1!p')
+          # The sstate file which is downloaded from the SSTATE_MIRROR is
+          # put in SSTATE_DIR, and there is a symlink in SSTATE_DIR/??/ to
+          # it, so filter it out from the remove list if it should not be
+          # removed.
+          to_keep=$(ls -t $(cat $fn_tmp) | sed -n '1p')
+          for k in $to_keep; do
+              if [ -L "$k" ]; then
+                  # The symlink's destination
+                  k_dest="`readlink -e $k`"
+                  # Maybe it is the one in cache_dir
+                  k_maybe="$cache_dir/${k##/*/}"
+                  # Remove it from the remove list if they are the same.
+                  if [ "$k_dest" = "$k_maybe" ]; then
+                      to_del="`echo $to_del | sed 's#'\"$k_maybe\"'##g'`"
+                  fi
+              fi
+          done
           rm -f $fn_tmp
           gen_rmlist $rm_list "$to_del"
       done
@@ -221,6 +238,7 @@ remove_duplicated () {
       let total_deleted=$total_deleted+$deleted
   done
   rm -f $list_suffix
+  rm -f $sstate_list
   if [ $total_deleted -gt 0 ]; then
       read_confirm
       if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
-- 
1.7.11.2



