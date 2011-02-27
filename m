Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Ptcy3-0007Da-G8
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:31:07 +0100
Received: by mail-wy0-f175.google.com with SMTP id 38so2800543wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:29:46 -0800 (PST)
Received: by 10.216.186.142 with SMTP id w14mr4293249wem.18.1298798986221;
	Sun, 27 Feb 2011 01:29:46 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h39sm1286629wes.5.2011.02.27.01.29.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:29:45 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:29:20 +0100
Message-Id: <0b8097d56ab693fee680bc5171e4d1defe27f94e.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 14/50] Suppress useless warnings during udev startup
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
X-List-Received-Date: Sun, 27 Feb 2011 09:31:07 -0000

From: Gary Thomas <gary@mlbassoc.com>

I have a number of platforms which have no realtime clock
(i.e. no sense of what day/time it is).  On these platforms,
poky dutifully tries to keep somewhat sane with stored
time stamps that are saved on reboot and restored early
on during initialization.  A fair compromise.

However, before that code runs, the udev script tries to
restore well known devices using tar.  This will often
lead to messages such as these since the kernel has no
way to set the time:
   tar: dev/pts: implausibly old time stamp 1970-01-01 00:00:00
   tar: dev/char/3:134: time stamp 1970-01-01 00:00:09 is 0.435041705 s in the future

The attached patch filters these messages out as they don't
convey anything useful and indeed are worrisome to more naive
users.

--
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

From a6773d3e00dbd168817730fff1c3fc7e1b6950f5 Mon Sep 17 00:00:00 2001
From: Gary Thomas <gary@mlbassoc.com>
Date: Thu, 17 Feb 2011 11:30:18 -0700
Subject: [PATCH] Suppress messages about bad time stamps during initial device setup

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/udev/udev-164/init |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev-164/init b/meta/recipes-core/udev/udev-164/init
index eb5e507..1a8fca5 100644
--- a/meta/recipes-core/udev/udev-164/init
+++ b/meta/recipes-core/udev/udev-164/init
@@ -35,7 +35,7 @@ LANG=C awk "\$2 == \"/dev\" && \$4 == \"tmpfs\" { exit 1 }" /proc/mounts && {
 }
 
 if [ -e /etc/dev.tar ]; then
-	(cd /; tar xf /etc/dev.tar)
+	(cd /; tar xf /etc/dev.tar 2>&1 | grep -v 'time stamp')
 	not_first_boot=1
 fi
 
-- 
1.6.6.1



