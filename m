Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T3PMu-0000E2-JE
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 12:38:00 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 20 Aug 2012 03:25:56 -0700
Received: by wibhr14 with SMTP id hr14so2847518wib.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 03:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=x0/Ez2lFwoGnLbxt98MeZE4UEQMY90ODA66XL1KLGWE=;
	b=ZES5jP/Uh0JSamttljiphpsyz1+oYSD/J5NnPlZvT/LiWF/kngM4cC/oKPlZl0GbXY
	1Wl5L96iQZNBeKS2JO8dRN3sT3OhygjnUkLnXNNdLzKY5kG/WLsF42fFbQpHltBT68T8
	b7Cfk+73gqJ1m1dd6aIhzXIskckrq9Li0zW9XW5hgeqxINzUCg5z0RwRruI7NrIVqjpK
	xOHaRWH5mAK0LrEsCaBU4BfQaCrH+uSvrDPXJKre1XY4TGOdK7StB1Wt+gIT4U1W/7En
	IEccnazPsC6qUte1OimFpFqxUhylcbTsH0cchdmmDpUCh7NOj0pbXZIpXQ1NGESPtfDv
	IBxA==
Received: by 10.180.78.99 with SMTP id a3mr26660669wix.15.1345458355009;
	Mon, 20 Aug 2012 03:25:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k20sm27396522wiv.11.2012.08.20.03.25.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 03:25:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 11:25:18 +0100
Message-Id: <1345458318-22072-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQk0aimojPDNjVZVz8BrXqiplZljDVWlRnbf5nRel+jewUMtJiViD582h6oCWNzBF8awvlty
Subject: [PATCH] mesa: clean up PACKAGECONFIG
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
X-List-Received-Date: Mon, 20 Aug 2012 10:38:00 -0000

Use machine overrides instead of machine features.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index de171f0..cfe4a37 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r2"
+INC_PR = "r3"
 PE = "2"
 
 DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
@@ -29,9 +29,8 @@ EXTRA_OECONF = "--enable-glu \
                 --disable-glut \
                 --enable-shared-glapi"
 
-PACKAGECONFIG ??= "${@base_contains('MACHINE_FEATURES', 'x86', 'gles', '', d)} \
-                   ${@base_contains('MACHINE_FEATURES', 'x86', 'egl', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG_append_x86 = " gles egl"
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
-- 
1.7.10



