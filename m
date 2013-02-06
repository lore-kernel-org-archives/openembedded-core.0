Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U35H1-0008CG-Q9
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 14:42:53 +0100
Received: by mail-da0-f49.google.com with SMTP id t11so660217daj.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2013 05:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=z9dGYXp6GFEGIqWQk0XXQ/ZqLNmKHm/Agq0fsLFUPgY=;
	b=VTfonLHfjzsotSok6kaEGaLdAUlq/XKY532aeaTw0SlV/WYXqeUiHNnXt05yGaxypg
	5aoJT4+N/SX6im5YHyvB/q/eS1SBoFEgsB/ctZXkihZNkJjwO0iFO3+SkJXiVyN7NWNS
	ThpWiYpHrAdLVEgu0nDE2MZglw7PNAVdoFchrEeK+5bX1w9gpTzCsP3SUWTgJXlIs46w
	AXilf3gJYjjYWD1bGeqrNvb8VadRelHTkm7aIkkef2R+YbgkGsh8IG1wiw1vjlTBZvkl
	Oyj7Ov6D+9lNrAJZkQXhpTzf173Zf+p4fCIpG9U7RXXVEhubpgjOjF3Wh9zEO6E9innS
	LZ5g==
X-Received: by 10.66.82.67 with SMTP id g3mr75263880pay.58.1360157220103;
	Wed, 06 Feb 2013 05:27:00 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f9sm37758062paz.12.2013.02.06.05.26.57
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 05:26:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2013 14:26:49 +0100
Message-Id: <1360157209-19641-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1359984404.14071.160.camel@ted>
References: <1359984404.14071.160.camel@ted>
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
X-List-Received-Date: Wed, 06 Feb 2013 13:42:53 -0000

* as described in
  http://git.openembedded.org/openembedded-core/commit/?id=6107ee294afde395e39d084c33e8e94013c625a9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rm_work.bbclass | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 997dcd1..5aa5f24 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -17,15 +17,12 @@ do_rm_work () {
     cd ${WORKDIR}
     for dir in *
     do
-        if [ `basename ${S}` = $dir ]; then
-            rm -rf $dir
-        # The package and packages-split directories are retained by sstate for 
-        # do_package so we retain them here too. Anything in sstate 'plaindirs' 
-        # should be retained. Also retain logs and other files in temp.
-        elif [ $dir != 'temp' ] && [ $dir != 'package' ]  && [ $dir != 'packages-split' ]; then
+        # Retain only logs and other files in temp.
+        if [ $dir != 'temp' ]; then
             rm -rf $dir
         fi
     done
+
     # Need to add pseudo back or subsqeuent work in this workdir
     # might fail since setscene may not rerun to recreate it
     mkdir ${WORKDIR}/pseudo/
@@ -54,6 +51,15 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
+            # We remove do_package entirely, including any
+            # sstate version since otherwise we'd need to leave 'plaindirs' around
+            # such as 'packages' and 'packages-split' and these can be large. No end
+            # of chain tasks depend directly on do_package anymore.
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



