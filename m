Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9Xbf-0005dc-Lo
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:34:03 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1506871bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=IH/BfheSpubq7Y6xSTbmJ1PWmLGwMkc0ENt27kGiqlI=;
	b=sfEcmnnvm1shgdMbvDqFL8pMUBVOOE/3ckY1/HiDbbXy92Vp8d31OErbaDjzy0gxAv
	coZ5vPKinhtn+XJhiQ9H2NjmsOj0rWgNxuzN52KQ3gmVXsrTnYlDGrIsmw3kIakruv7M
	rfZIBpd++sTvytJzMwucaT2KO4JWZgWviKbuQ=
Received: by 10.204.142.200 with SMTP id r8mr7761257bku.213.1317367717170;
	Fri, 30 Sep 2011 00:28:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j16sm3941775bks.3.2011.09.30.00.28.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:28:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 09:27:20 +0200
Message-Id: <121b26267ee494182d88e07b7fe63761088b8bde.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
References: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/13] xserver-nodm-init: merge some changes from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Sep 2011 07:34:03 -0000

* /etc/X11/Xusername handling should be moved to x11-common so the same
  username and logic is used from initscript and when user starts it
  from terminal

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../x11-common/xserver-nodm-init/xserver-nodm      |   30 ++++++--------------
 1 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
index c707a4b..9cd7904 100755
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
@@ -8,10 +8,7 @@
 # Default-Stop:      0 1 6
 ### END INIT INFO
 
-killproc() {            # kill the named process(es)
-        pid=`/bin/pidof $1`
-        [ "$pid" != "" ] && kill $pid
-}
+. /etc/init.d/functions
 
 read CMDLINE < /proc/cmdline
 for x in $CMDLINE; do
@@ -25,25 +22,16 @@ done
 
 case "$1" in
   start)
+    # We don't want this script to block the rest of the boot process
+    if [ "$2" != "background" ]; then
+      $0 $1 background &
+    else
        . /etc/profile
-       username=root
+
        echo "Starting Xserver"
-       if [ -f /etc/X11/Xusername ]; then
-           username=`cat /etc/X11/Xusername`
-           # setting for rootless X
-           chmod o+w /var/log
-           chmod g+r /dev/tty[0-3]
-           chmod o+rw /dev/input/*
-           # hidraw device is probably needed
-           if [ -e /dev/hidraw0 ]; then
-               chmod o+rw /dev/hidraw*
-           fi
-       fi
-       # Using su rather than sudo as latest 1.8.1 cause failure [YOCTO #1211]
-       su -l -c '/etc/X11/Xserver&' $username 
-       # Wait for the desktop to say its finished loading
-       # before loading the rest of the system
-       # dbus-wait org.matchbox_project.desktop Loaded
+       . /etc/X11/xserver-common
+       xinit /etc/X11/Xsession -- `which $XSERVER` $ARGS >/var/log/Xsession.log 2>&1
+    fi 
   ;;
 
   stop)
-- 
1.7.6.1



