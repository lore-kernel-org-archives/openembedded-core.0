Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2cQI-0004W7-OJ
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 06:49:58 +0100
Received: by ghbz2 with SMTP id z2so1527223ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 21:41:30 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.79.138 as permitted sender) client-ip=10.236.79.138; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.79.138 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.79.138])
	by 10.236.79.138 with SMTP id i10mr33661313yhe.12.1330494090373
	(num_hops = 1); Tue, 28 Feb 2012 21:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=/FQsRPjnEGldVIfn/A8C6Xn0T8aD6d2lbiw5Zy9UD8w=;
	b=hlHuJgRls3MISJQ7SVtbrE9tEqeNyr5i+xIG26LK4tuPTb+0brBbUuRBipUOqc1ltj
	t6pIX/x/7/edLvxEDQnIv2ivOINHi2h6wA6k2StJ2SMGba4DiRIXiBTpcW4wKvDHQt1N
	TsbzJigV94ZD7ozRtwhJ7pFLqo6n5xDa+T5YI=
Received: by 10.236.79.138 with SMTP id i10mr25515152yhe.12.1330494090312;
	Tue, 28 Feb 2012 21:41:30 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id b6sm32799257anc.3.2012.02.28.21.41.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 21:41:29 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 05:41:17 +0000
Message-Id: <515e5d34c437e37115e4005738a2b2c8055508cf.1330494042.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330494042.git.otavio@ossystems.com.br>
References: <cover.1330494042.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1330494042.git.otavio@ossystems.com.br>
References: <cover.1330494042.git.otavio@ossystems.com.br>
Subject: [PATCH 2/3] image_types.bbclass: properly support IMAGE_LINK_NAME as empty
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
X-List-Received-Date: Wed, 29 Feb 2012 05:49:59 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/image_types.bbclass |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 74071c1..f9ed49f 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -25,7 +25,9 @@ def get_imagecmds(d):
             types.append("ext3")
         types.remove("live")
 
-    cmds += "	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
+    if len(d.getVar('IMAGE_LINK_NAME', True)) > 0:
+        cmds += "	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
+
     for type in types:
         ccmd = []
         subimages = []
@@ -55,10 +57,12 @@ runimagecmd () {
 	# Now create the needed compressed versions
 	cd ${DEPLOY_DIR_IMAGE}/
         ${ccmd}
-	# And create the symlinks
-        for type in ${subimages}; do
-		ln -s ${IMAGE_NAME}.rootfs.$type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
-	done
+        # And create the symlinks
+        if [ -n "${IMAGE_LINK_NAME}" ]; then
+            for type in ${subimages}; do
+                ln -s ${IMAGE_NAME}.rootfs.$type ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.$type
+            done
+        fi
 }
 
 def imagetypes_getdepends(d):
-- 
1.7.2.5



