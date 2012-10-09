Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TLWLP-0002dI-9m
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 11:43:19 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so3912269wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2012 02:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8foO9cYfPUZ/I2io+cjO9Uw9s+wuyBaq4yJNm5zQWK0=;
	b=R2QyeHlg3xrt51jRDk+tBhfhI0hhmQfLUYQQ3DkdviHYRQ0SG1hiRWA3uxVComCn0U
	sd/Aln+Fd3hOJfjLNJSKIxIy6MhqkE2ZikpWFf86F5bwkEKLrpQJYZ0vYEXvRmkvLOeP
	UKS4+kU7aDUlLeNiraKvTW+EtCiRw/g+oivmFOHst1qYzEX563x3f80IPn2e3ThcpQ4j
	P5d+S+RzTZ6Mwc0ubWCIErioHEN1w1yuE/ZP1mQQd6yNkYZzIGZMzxpgEThMTikTff1C
	zwwfpO2BfhHH8/UZLnZvNlMRTHhgGYJf2Pz5uGt6/DUl7yvw/tvLxYSLh3QHrO//H4ke
	2eJg==
Received: by 10.216.217.38 with SMTP id h38mr10273406wep.82.1349775012135;
	Tue, 09 Oct 2012 02:30:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j8sm24093342wiy.9.2012.10.09.02.30.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 02:30:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2012 11:30:16 +0200
Message-Id: <1349775016-8300-1-git-send-email-Martin.Jansa@gmail.com>
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
X-List-Received-Date: Tue, 09 Oct 2012 09:43:19 -0000

* fixes [YOCTO #3116]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 4c06fe8..551d2f2 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -172,7 +172,7 @@ remove_duplicated () {
   echo -n "Figuring out the archs in the layers ... "
   oe_core_dir=$(dirname $(dirname $(readlink -e $0)))
   topdir=$(dirname $oe_core_dir)
-  tunedirs="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/include'`"
+  tunedirs="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/include' 2>/dev/null`"
   [ -n "$tunedirs" ] || echo_error "Can't find the tune directory"
   all_machines="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/*' -name '*.conf' 2>/dev/null | sed -e 's/.*\///' -e 's/.conf$//'`"
   all_archs=`grep -r -h "^AVAILTUNES .*=" $tunedirs | sed -e 's/.*=//' -e 's/\"//g'`
-- 
1.7.12



