Received: from mail-da0-f54.google.com ([209.85.210.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBaAC-0003Le-LO
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 01:19:05 +0100
Received: by mail-da0-f54.google.com with SMTP id p1so1630520dad.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 16:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=T0+BnNa1ds0uwjD8/1duUBvFKFYlIR5vFwwGlY32GPs=;
	b=BYXG0mNw/e51z53L1ZyocmZ30ed6u4iY9p/xbt3FEnkkbMBbC1IkTvlWUhyC0jp23Q
	Uaw981wZzUwjsXGG/3hStnXZ1s3Q0sclkKmcXpFgfv4Zcl3888Xa3dTuLMtg0HtjZYGB
	lhw4Z1+JW0TC5+YdDwhmXTi9/ioNrrx8E/AmKWQ/QpEUjdpIS9shQq9Xa7iR7ia/KaT2
	9/sg6ejeReMbdCuEoFO/M57j/VLtaQ66b1XCHMeJcRLFb8ijPGWMvonAgZIK8Zo49lCk
	0AeYV6btb/dRGuW0Bialu+/CfxBIQ3m8KG2JBc5N1Xb+kMLVH0Xm5gWz+rbmzYjANKeu
	1QHw==
X-Received: by 10.67.22.33 with SMTP id hp1mr20969862pad.3.1362182549471;
	Fri, 01 Mar 2013 16:02:29 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i6sm14640317paw.19.2013.03.01.16.02.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 16:02:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Mar 2013 01:02:17 +0100
Message-Id: <1362182537-16716-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1359984404.14071.160.camel@ted>
References: <1359984404.14071.160.camel@ted>
Subject: [PATCHv2] rm_work: remove package and packages-split dirs
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
X-List-Received-Date: Sat, 02 Mar 2013 00:19:09 -0000
X-List-Received-Date: Sat, 02 Mar 2013 00:19:09 -0000

* as described in
  http://git.openembedded.org/openembedded-core/commit/?id=6107ee294afde395e39d084c33e8e94013c625a9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/rm_work.bbclass | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 997dcd1..d3be0be 100644
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
+            *do_package|*do_package.*|*do_package_setscene.*)
+                rm -f $i;
+                i=dummy
+                break
+                ;;
             *_setscene*)
                 i=dummy
                 break
@@ -71,7 +77,7 @@ do_rm_work () {
 addtask rm_work after do_${RMWORK_ORIG_TASK}
 
 do_rm_work_all () {
-	:
+    :
 }
 do_rm_work_all[recrdeptask] = "do_rm_work"
 addtask rm_work_all after do_rm_work
-- 
1.8.1.4



