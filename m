Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T88J8-0005P9-VG
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 13:25:38 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so2557607wey.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2012 04:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=dIlureN+mUGoHnwWJxprsamtpsHGAAUcVDA4LsAR0Ww=;
	b=Fo/NV5ec6BytgrGcLzHFDE3nyLcCgm/CU8FmestEGrHqOIxWFiIClxPYDjB1umfvYY
	Qs8uMuGZmDyrl7c7PZctPrXq+kYEmNIEGsxlS9NTopfkKRUU3E4qi7CAepsDCbZcl6I4
	8V6s0ORm5+iFQe9NYeH0Hej/uldR/kJojfNodOE3z2LzuB3oqCePknRRARaVdoqyubjJ
	aW4KPVY+BW3V45nr2ascGlMUwRvTPryggV+askJOLVNbgvLQbbnyyM50KPXfRqvYiq7j
	MZ74laGFHY59+hhMjMM/AtuX0t7Ai7Bam/jzgxHYRU64lU+rS2cO8oaXrEq3YanIRevU
	tDZw==
Received: by 10.216.241.198 with SMTP id g48mr272019wer.156.1346584402217;
	Sun, 02 Sep 2012 04:13:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm12651634wiz.0.2012.09.02.04.13.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Sep 2012 04:13:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Sep 2012 13:13:20 +0200
Message-Id: <bc9cba103446ace4d9158470cdccd58801a66978.1346584261.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346584261.git.Martin.Jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346584261.git.Martin.Jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/4] sstate-cache-management.sh: look in meta* above oe-core dir when looking for available tunes
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
X-List-Received-Date: Sun, 02 Sep 2012 11:25:39 -0000

* many layouts have other layers on the same level as oe-core checkout

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 0f774a3..e569487 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -153,6 +153,7 @@ gen_rmlist (){
 remove_duplicated () {
 
   local topdir
+  local oe_core_dir
   local tunedirs
   local all_archs
   local ava_archs
@@ -164,8 +165,9 @@ remove_duplicated () {
 
   # Find out the archs in all the layers
   echo -n "Figuring out the archs in the layers ... "
-  topdir=$(dirname $(dirname $(readlink -e $0)))
-  tunedirs="`find $topdir/meta* $layers -path '*/meta*/conf/machine/include'`"
+  oe_core_dir=$(dirname $(dirname $(readlink -e $0)))
+  topdir=$(dirname $oe_core_dir)
+  tunedirs="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/include'`"
   [ -n "$tunedirs" ] || echo_error "Can't find the tune directory"
   all_archs=`grep -r -h "^AVAILTUNES .*=" $tunedirs | sed -e 's/.*=//' -e 's/\"//g'`
   # Add the qemu and native archs
-- 
1.7.12



