Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6KB4-0001fa-3D
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 12:37:18 +0200
Received: by fxi1 with SMTP id 1so1502245fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 03:31:59 -0700 (PDT)
Received: by 10.223.48.211 with SMTP id s19mr849312faf.33.1316601075261;
	Wed, 21 Sep 2011 03:31:15 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n12sm3882931fan.9.2011.09.21.03.31.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 03:31:14 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 12:31:06 +0200
Message-Id: <1316601066-1445-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Tasslehoff Kjappfot <tasskjapp@gmail.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] bitbake wrapper: Make sure grep runs without colorized output
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
X-List-Received-Date: Wed, 21 Sep 2011 10:37:18 -0000

From: Tasslehoff Kjappfot <tasskjapp@gmail.com>

My .bashrc contained "export GREP_OPTIONS='--color=always'", and that caused the path in my pseudodone file to  be prefixed by "^[[m^[[K". Override by calling grep with --color=never.

Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 scripts/bitbake |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 587428c..9330d71 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -65,7 +65,7 @@ if [ $buildpseudo = "1" ]; then
     if [ "$ret" != "0" ]; then
         exit 1
     fi
-    PSEUDOBINDIR=`bitbake -e | grep STAGING_BINDIR_NATIVE=\" | cut -d '=' -f2 | cut -d '"' -f2`
+    PSEUDOBINDIR=`bitbake -e | grep --color=never STAGING_BINDIR_NATIVE=\" | cut -d '=' -f2 | cut -d '"' -f2`
     ret=$?
     if [ "$ret" != "0" ]; then
         exit 1
-- 
1.6.6.1



