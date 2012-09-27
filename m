Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TH8qB-00030x-Bg
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 09:48:59 +0200
Received: by wibhj13 with SMTP id hj13so2603773wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 00:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qwSEYQVrXP0xKfNCxkLy9p5NgCTzttE96OAzaEi8AAE=;
	b=fXq/xXO+QzUkZVHNJx/7LUGYFqozoA7EU63koOQzEYmKe8eDb+acu/T8xw89bfe70T
	NVuRXs0IEXDA3KBlaUPEHL2OIo1v92r2zo8t6bq9FRh4Uw9erjsHYpkyfZNcUSvDkd7t
	YMkUbkw+G7FcwMc8XPVxN8TH0ZcN9kxUrWV/aXNUjBau2cScU+mzHgdl97234QqcHPS9
	yku6G9k9NnwvcLchpuAxNOFpcVK2QKP1ImbrC9gsG7p/bQ1FH3B3x9EHg+a5ydXkSQYD
	yYjA5zmpP/IcAlSsJRjCjT9ZC3I//E2Q0XJvTQ/MY9lBKliuAVmba7NZdK0CJt5orK5x
	LU9A==
Received: by 10.180.93.33 with SMTP id cr1mr34749459wib.8.1348731367665;
	Thu, 27 Sep 2012 00:36:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cn6sm2468580wib.9.2012.09.27.00.36.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 00:36:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 09:36:13 +0200
Message-Id: <1348731373-27278-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [PATCH] sstate-cache-management: hide error message when one of possible layer location doesn't exist
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
X-List-Received-Date: Thu, 27 Sep 2012 07:48:59 -0000

* fixes [YOCTO #3116]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index f519555..4c06fe8 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -174,7 +174,7 @@ remove_duplicated () {
   topdir=$(dirname $oe_core_dir)
   tunedirs="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/include'`"
   [ -n "$tunedirs" ] || echo_error "Can't find the tune directory"
-  all_machines="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/*' -name '*.conf' | sed -e 's/.*\///' -e 's/.conf$//'`"
+  all_machines="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/*' -name '*.conf' 2>/dev/null | sed -e 's/.*\///' -e 's/.conf$//'`"
   all_archs=`grep -r -h "^AVAILTUNES .*=" $tunedirs | sed -e 's/.*=//' -e 's/\"//g'`
   # Add the qemu and native archs
   # Use the "_" to substitute "-", e.g., x86-64 to x86_64
-- 
1.7.12



