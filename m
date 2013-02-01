Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U1L98-0002k6-Qu
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 19:15:31 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so2236623pbc.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 09:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=q7ITbCCSenbbByg9mJL8+AjsLnJ1BJ1pEC1PFfXY5Qo=;
	b=exMchaKgSInsbmuzi28VbHtLQG5wsbKRG93it4fQsb5RVJooTJZgKZl6UJrLipt0mk
	RLHKRQn7W0ioyZ7qpPWnd0FKEsRvR5Ok+EDOKl5kXcJf5vyuasJjKobuLPslwTmGdrgH
	d8w7uxyFYqnG/B8qsBhPxgh6RYFQ24enLEwNIwDOP/JF0pNoc6BkCS5n299ncAlsM5QI
	HgZa6fOS2Rbta4YQ0mFMezhGUZ2r4eo4Xo4TnOa4IZbsw+oPneC5cDWT2m0gtBIfTAAc
	uNjdlgNhCNjXtn6Xv9gXMMGRu8ZMZiPD+puQ3UiwzvM1bCPxOsLLMYxkZpsxoETyxFdV
	/xWA==
X-Received: by 10.66.76.198 with SMTP id m6mr31884115paw.32.1359741585801;
	Fri, 01 Feb 2013 09:59:45 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ix9sm9091289pbc.7.2013.02.01.09.59.42
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Feb 2013 09:59:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 18:59:41 +0100
Message-Id: <1359741581-16500-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] rm_work: remove package and packages-split dirs
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
X-List-Received-Date: Fri, 01 Feb 2013 18:15:33 -0000

* as described in
  http://git.openembedded.org/openembedded-core/commit/?id=6107ee294afde395e39d084c33e8e94013c625a9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rm_work.bbclass | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 997dcd1..24d0679 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -19,13 +19,13 @@ do_rm_work () {
     do
         if [ `basename ${S}` = $dir ]; then
             rm -rf $dir
-        # The package and packages-split directories are retained by sstate for 
-        # do_package so we retain them here too. Anything in sstate 'plaindirs' 
-        # should be retained. Also retain logs and other files in temp.
-        elif [ $dir != 'temp' ] && [ $dir != 'package' ]  && [ $dir != 'packages-split' ]; then
+        # Anything in sstate 'plaindirs' should be retained. 
+        # Also retain logs and other files in temp.
+        elif [ $dir != 'temp' ]; then
             rm -rf $dir
         fi
     done
+
     # Need to add pseudo back or subsqeuent work in this workdir
     # might fail since setscene may not rerun to recreate it
     mkdir ${WORKDIR}/pseudo/
@@ -54,6 +54,11 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
+            *do_package|*do_package_setscene)
+                i=dummy
+                rm -f $i;
+                break
+                ;;
             *_setscene*)
                 i=dummy
                 break
-- 
1.8.1.2



