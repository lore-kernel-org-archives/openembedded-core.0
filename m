Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T88JM-0005Xl-UC
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 13:25:52 +0200
Received: by wibhq4 with SMTP id hq4so2642337wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2012 04:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2X7fcQBjYkL0jTCV9rnDXswNgjbdSgoMdsuuAwad9S4=;
	b=kyDPAoqajUGeBnu69NnSWdneZXEAon6G/6hXbepOFsain8Tf1wf0PQGO084S4M2Krc
	l/R2RUv5hFJbpCI/UGBYwRWZwqPcLT9IXeNWxVqefRslK1QOIlkCqjK6yDEW4TQqWxer
	Y4l41tSqA86evoPuj1xhhb6nJx2CkIJXjWOoazCFp7BOxFEYsXJI0gHtEjMQkXKpn4Gv
	rd8ycKfYs5pNM8nZYFeq7vN8V2z1ql8qgHm2Mw2kKUAiJEZvmAruOJyk+GVYIf1GqPcS
	fO9Hm19mIaa9+FKeOjgyKhG3gY7S42Wxr2v91YQA6SKSWV+Edt3nY08BbLbVV0TVvOUt
	047w==
Received: by 10.180.78.5 with SMTP id x5mr16283520wiw.13.1346584414121;
	Sun, 02 Sep 2012 04:13:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm12633163wiy.3.2012.09.02.04.13.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Sep 2012 04:13:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Sep 2012 13:13:21 +0200
Message-Id: <976987ed5639a121067262dfdc8b756bb496e7a0.1346584261.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346584261.git.Martin.Jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346584261.git.Martin.Jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] sstate-cache-management.sh: don't hardcode available machines only to qemu*
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
X-List-Received-Date: Sun, 02 Sep 2012 11:25:53 -0000

* find them dynamically in layers like AVAILTUNES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index e569487..491df5f 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -156,6 +156,7 @@ remove_duplicated () {
   local oe_core_dir
   local tunedirs
   local all_archs
+  local all_machines
   local ava_archs
   local arch
   local file_names
@@ -169,11 +170,12 @@ remove_duplicated () {
   topdir=$(dirname $oe_core_dir)
   tunedirs="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/include'`"
   [ -n "$tunedirs" ] || echo_error "Can't find the tune directory"
+  all_machines="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/*' -name '*.conf' | sed -e 's/.*\///' -e 's/.conf$//'`"
   all_archs=`grep -r -h "^AVAILTUNES .*=" $tunedirs | sed -e 's/.*=//' -e 's/\"//g'`
   # Add the qemu and native archs
   # Use the "_" to substitute "-", e.g., x86-64 to x86_64
   # Sort to remove the duplicated ones
-  all_archs=$(echo $all_archs qemuarm qemux86 qemumips qemuppc qemux86_64 $(uname -m) \
+  all_archs=$(echo $all_archs $all_machines $(uname -m) \
           | sed -e 's/-/_/g' -e 's/ /\n/g' | sort -u)
   echo "Done"
 
-- 
1.7.12



