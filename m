Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.reilly@gmail.com>) id 1T0U83-0007lH-MT
	for openembedded-core@lists.linuxtogo.org;
	Sun, 12 Aug 2012 11:06:35 +0200
Received: by pbcwy7 with SMTP id wy7so5222576pbc.6
	for <openembedded-core@lists.linuxtogo.org>;
	Sun, 12 Aug 2012 01:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=OqkI+HZaY0acubSPGiwwmZbu1CaR/CVPMAS8g9SmJcw=;
	b=Jv4KYEQ11rO8B/Wz0uLXyTJy0q4xJCym1Xu+wXOsBzP0VB3iX6HsDKiQQX5rQqXjda
	Jm/1YRuinHfUkY6aXEkMWeDby3WynfixxHO/7R/BObnfVLc6mOM88MbdQ6eKVMsgUEVI
	JhSnd8BOXA0xMal+a3enOlVHHNlkGFCnjH31nro/qa9X/heRJLop6k//h+95jqt+15Rs
	GZqCVknkFKAh2Z17CLiYDbN1cdQOoMehbNExaSLzadQ6Nm0os0yQDLLuipRrxvy4iUse
	BBX0ktP67Jbw32ehhu1x7kOrWBcCH7ROx6GkqdFnlBUVVKVgCz3Cg3r+RDtyotlO96In
	JD1w==
Received: by 10.66.79.195 with SMTP id l3mr11219017pax.33.1344761682677;
	Sun, 12 Aug 2012 01:54:42 -0700 (PDT)
Received: from localhost.localdomain (220-244-174-13.static.tpgi.com.au.
	[220.244.174.13])
	by mx.google.com with ESMTPS id rz10sm2982531pbc.32.2012.08.12.01.54.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 12 Aug 2012 01:54:41 -0700 (PDT)
Sender: Marc Reilly <marc.reilly@gmail.com>
From: Marc Reilly <marc@cpdesign.com.au>
To: openembedded-core@lists.linuxtogo.org
Date: Sun, 12 Aug 2012 18:48:42 +1000
Message-Id: <1344761322-10816-1-git-send-email-marc@cpdesign.com.au>
X-Mailer: git-send-email 1.7.7
Subject: classes: populate_sdk_base: Refine search for SDK env setup file
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
X-List-Received-Date: Sun, 12 Aug 2012 09:06:35 -0000

This fixes a relocation failure when installing SDKs built with
meta-toolchain-qte.
SDKs build with meta-toolchain-qte have a file named "environment-setup"
in them as well as the environment-setup-MACH-WHATEVER-BLAH file.
This patch changes the find name pattern so that only the appropriate
file is matched.

Signed-off-by: Marc Reilly <marc@cpdesign.com.au>
---
 meta/classes/populate_sdk_base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 0d19741..60c67bd 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -154,7 +154,7 @@ echo "done"
 
 echo -n "Setting it up..."
 # fix environment paths
-env_setup_script=$(find $target_sdk_dir -name "environment-setup*")
+env_setup_script=$(find $target_sdk_dir -name "environment-setup-*")
 sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
 
 # fix dynamic loader paths in all ELF SDK binaries
-- 
1.7.7



