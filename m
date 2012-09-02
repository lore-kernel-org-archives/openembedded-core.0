Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T88J3-0005TW-J5
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Sep 2012 13:25:33 +0200
Received: by wgbds1 with SMTP id ds1so1601190wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2012 04:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gTY+JqjeF5RPYEZ/cHEOvChJhZ73KgKKzUN7ARqR/48=;
	b=RAXmZe6L83D8BtTVysqRoXowcB57lBQ3I6QkfzOZSeRgH5/sJfjdJVG8TjVnWsrX3G
	qwP+5wZ5c9XP05g2CseBXq87Ixbc+q2jkHLDuCag0pNWyMktdeWVpDekMvHyU6HDd2H1
	ExWrDggDx6L2G/6und0pCc+H5J5t3kJzSZrZVY5TET94XGtAyAORX8A6mNDloDYTMvWH
	ks8ncrLE8nKMnkqjMcGhNu5/T/ldNbFBXwG7z0AeAHaFQQm6qISMY3S+1+BCSC1rZrIR
	VaVtyeL9aRZh2OsP0/tD1vuKe+ejByJxgBbjcBEEts0l1fBHl31fBof+L40OVn7VmfpN
	RHVw==
Received: by 10.180.93.8 with SMTP id cq8mr16278545wib.16.1346584394762;
	Sun, 02 Sep 2012 04:13:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q4sm12626172wix.9.2012.09.02.04.13.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Sep 2012 04:13:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Sep 2012 13:13:19 +0200
Message-Id: <39c8569839eace3fda2c7d0258830b3ede8a1864.1346584261.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346584261.git.Martin.Jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346584261.git.Martin.Jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/4] sstate-cache-management.sh: fix regexp in AVAILTUNES grep
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
X-List-Received-Date: Sun, 02 Sep 2012 11:25:33 -0000

* it was also picking line
  openembedded-core/meta/conf/machine/include/README:AVAILTUNES - This is a list of all of the tuning definitions currently
  filling all_archs with wrong entries

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-cache-management.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index 2b3100c..0f774a3 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -167,7 +167,7 @@ remove_duplicated () {
   topdir=$(dirname $(dirname $(readlink -e $0)))
   tunedirs="`find $topdir/meta* $layers -path '*/meta*/conf/machine/include'`"
   [ -n "$tunedirs" ] || echo_error "Can't find the tune directory"
-  all_archs=`grep -r -h "^AVAILTUNES " $tunedirs | sed -e 's/.*=//' -e 's/\"//g'`
+  all_archs=`grep -r -h "^AVAILTUNES .*=" $tunedirs | sed -e 's/.*=//' -e 's/\"//g'`
   # Add the qemu and native archs
   # Use the "_" to substitute "-", e.g., x86-64 to x86_64
   # Sort to remove the duplicated ones
-- 
1.7.12



