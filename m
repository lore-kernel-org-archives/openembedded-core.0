Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id A361E610CD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 10:34:19 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so4892475eei.19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=FN6NRD8JodW/iFjdYhNw3eT2/lEKZVI6/hxcrpZv60g=;
	b=Y2TVnl/UM2xyuiM0rh6mlI/zTMQT3CJGtUPhNucPjfNuWfvK4OAoOEpRKO+XDbJx68
	UtCsQkSAUsak74zmbmjkMdt1up2/+Akqc8NWV39r3Ij/INokGICRLeriANCwjh3cX0p1
	YCEzda6gO9w+7uyH2jA+N5UvPJj6b/cBObyJZIAxRjRcP1PQjREMipYHXZk0O4YuNHie
	hPyo0yuKCHbe58rQyoHGycSohoJPrlBt3s+qWuMh2xxfA6bS9uAQk+dygQ5YGPyXot3X
	b+gJdVrLz+QpApra4bVTjXuuaPIokr2xhq2Ne+gS3LX3H+M+e65lBC2XJY45SKvAYPgJ
	ZAAw==
X-Received: by 10.15.64.75 with SMTP id n51mr16927171eex.33.1396089260112;
	Sat, 29 Mar 2014 03:34:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s46sm17852116ees.3.2014.03.29.03.34.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Mar 2014 03:34:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Mar 2014 11:34:13 +0100
Message-Id: <380c7d44597e301374f71b93ad12edb38f43088b.1396089115.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1396089115.git.Martin.Jansa@gmail.com>
References: <cover.1396089115.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1396089115.git.Martin.Jansa@gmail.com>
References: <cover.1396089115.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] sstate-cache-management: rm_by_stamps - discover all suffixes like remove_duplicated does
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
X-List-Received-Date: Sat, 29 Mar 2014 10:34:23 -0000

* instead of hard coding list of sstate enabled task use
  the same function as remove_duplicated to find them in
  sstate-cache directory

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 77afd68..e5c57d3 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -324,16 +324,23 @@ rm_by_stamps (){
   local cache_list=`mktemp` || exit 1
   local keep_list=`mktemp` || exit 1
   local rm_list=`mktemp` || exit 1
-  local suffixes
   local sums
   local all_sums
 
-  suffixes="populate_sysroot populate_lic package_write_ipk \
-            package_write_rpm package_write_deb package packagedata deploy"
+  # Total number of files including sstate-, .siginfo and .done files
+  total_files=`find $cache_dir -type f -name 'sstate*' | wc -l`
+  # Save all the state file list to a file
+  find $cache_dir -type f -name 'sstate*' | sort -u -o $cache_list
+
+  echo "Figuring out the suffixes in the sstate cache dir ... "
+  local sstate_suffixes="`sed 's%.*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^_]*_\([^:]*\)\.tgz.*%\1%g' $cache_list | sort -u`"
+  echo "Done"
+  echo "The following suffixes have been found in the cache dir:"
+  echo $sstate_suffixes
 
   # Figure out all the md5sums in the stamps dir.
   echo "Figuring out all the md5sums in stamps dir ... "
-  for i in $suffixes; do
+  for i in $sstate_suffixes; do
       # There is no "\.sigdata" but "_setcene" when it is mirrored
       # from the SSTATE_MIRRORS, use them to figure out the sum.
       sums=`find $stamps -maxdepth 3 -name "*.do_$i.*" \
@@ -344,11 +351,6 @@ rm_by_stamps (){
   done
   echo "Done"
 
-  # Total number of files including sstate-, .siginfo and .done files
-  total_files=`find $cache_dir -type f -name 'sstate*' | wc -l`
-  # Save all the state file list to a file
-  find $cache_dir -type f -name 'sstate*' | sort -u -o $cache_list
-
   echo "Figuring out the files which will be removed ... "
   for i in $all_sums; do
       grep ".*/sstate:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:[^:]*:${i}_.*" $cache_list >>$keep_list
-- 
1.9.1


