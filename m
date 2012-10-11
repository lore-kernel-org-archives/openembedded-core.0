Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TMKl9-0006jo-8K
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 17:33:15 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 11 Oct 2012 08:19:41 -0700
Received: by mail-we0-f175.google.com with SMTP id t44so1124414wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 08:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=2MpQoQDq+TFqnJRBhWCirlW9dGrxq1AY26cFIUq0OvY=;
	b=fAUsA0t7yBRDinSTRh5+CLD46oNLvWMwoX79xP33LXwnGUJGUmUhWBgxaXBM5X0j7j
	atn00pH/5WQTINlV3MZzSi/x5QW9TooU92zYoiWt9NkxvDlOHCuW4XESb0pOLZCcwoFY
	AAB/FJ6J1zagoYpXRlZ584oBy56+kQnBljvkGOOFXkWG77rZ7Os7CGHemRHQK6monsCU
	VaQuiXrUHCib2iS2e//OErCFXwpScuOZmdFfIqoZKOi5oOp7hcp9XZsDJMUsynuf4qd+
	5KkH/Al8SmnC/LLiPNEtXlba2hu8mIQwt4nlUs1hzzxpI/MIQXS7WlKiOlKZEeCG9Zvq
	h/Zw==
Received: by 10.180.104.97 with SMTP id gd1mr3076583wib.4.1349968801103;
	Thu, 11 Oct 2012 08:20:01 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cn6sm9170844wib.9.2012.10.11.08.19.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 08:19:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2012 16:18:50 +0100
Message-Id: <1349968730-24071-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlJeCF2bktFnhLNwUn6wx5ZemdVs6a8fOu83/AKu9DXwzMo6D3mgllG1ybiiLXXWNw1HIII
Subject: [PATCH] pulseaudio: add missing switch-on-port-available dependency to the server
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
X-List-Received-Date: Thu, 11 Oct 2012 15:33:15 -0000

The PulseAudio server recently added a dependency by default on the
switch-if-port-available module, but this was not enforced by the package
dependencies so the server won't start.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |    3 ++-
 meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 3003eaa..46e84c3 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -137,7 +137,8 @@ RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-always-sink \
     pulseaudio-module-suspend-on-idle \
     pulseaudio-module-position-event-sounds \
-    pulseaudio-module-role-cork "
+    pulseaudio-module-role-cork \
+    pulseaudio-module-switch-on-port-available"
 
 RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
 RDEPENDS_pulseaudio-server += "\
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
index 1c2c9f7..a10b953 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r6"
+PR = "r7"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.10



