Return-Path: <jatedev@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 63A526AC79
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 21:01:15 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id m1so5449342oag.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 14:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1i27pmsa1BZOd7ze7KVuXnXc+u2tHcXkf0IIsQcQtlo=;
	b=zmt5SuJ4VMEzbA6FsBWqI/AcAtX3W+CeQO6IkHj+nTRJZCp6mTGeUv/YOImfgSjUgj
	+XFn/buwk6x52sNCLSGbixm4XFcXoreP+jUZ5tMxc52uQRcsO80v3iXBS2WBK56JREpQ
	HsrGTco0BpJTZ9N3e0ABM7ceyHCjhYhZ++/tvuQqqfGFFg/XyuWPSbHEDW/Q+mXnyQ16
	HRL8DLk+6XqU//pkjkUzSisdUhX2WGl3WratzYt2non1aHdbHarAsbnbVryg8vp5DXqC
	y42dLwe9D077UkwEb5FjKoOQpAB0Vbr9j8DQypP7HHxDJU49NMcopqgQBtmsOUpBmFle
	pCVA==
X-Received: by 10.60.44.65 with SMTP id c1mr4437418oem.83.1407704476174;
	Sun, 10 Aug 2014 14:01:16 -0700 (PDT)
Received: from STSPYoctoBuild.syntech.org (exchsrvr.syntech-fuelmaster.com.
	[199.44.250.2])
	by mx.google.com with ESMTPSA id a9sm19888270oex.4.2014.08.10.14.01.15
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 10 Aug 2014 14:01:15 -0700 (PDT)
From: Jate Sujjavanich <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Aug 2014 17:00:41 -0400
Message-Id: <1407704441-29326-1-git-send-email-jatedev@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] useradd: Add setscene dep on pseudo-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Aug 2014 21:01:17 -0000

A recipe will sometimes be rebuilt unnecessarily if it adds users via
useradd and the pseudo-native task has not been populated.

This patch adds the correct dependency.

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 meta/classes/useradd.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index ea15dab..3b70e80 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -126,7 +126,7 @@ SYSROOTPOSTFUNC_class-cross = ""
 SYSROOTPOSTFUNC_class-native = ""
 SYSROOTPOSTFUNC_class-nativesdk = ""
 
-USERADDSETSCENEDEPS = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
+USERADDSETSCENEDEPS = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
 USERADDSETSCENEDEPS_class-cross = ""
 USERADDSETSCENEDEPS_class-native = ""
 USERADDSETSCENEDEPS_class-nativesdk = ""
-- 
1.7.9.5


