Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJB7R-0004YF-FE for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 00:39:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92MQFkf021835
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 23:26:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21323-06 for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2012 23:26:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92MQ6wf021829
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Oct 2012 23:26:07 +0100
Message-ID: <1349216769.18301.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Oct 2012 23:26:09 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] qt4: Avoid circular dependencies with multilib
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
X-List-Received-Date: Tue, 02 Oct 2012 22:39:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this, circular dependencies are found when attempting to build
multilib versions of qt4 (or bitbake world in a multilib enabled build).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
index 05c24ef..de2a68d 100644
--- a/meta/classes/qt4e.bbclass
+++ b/meta/classes/qt4e.bbclass
@@ -1,4 +1,5 @@
-DEPENDS_prepend = "${@["qt4-embedded ", ""][(d.getVar('PN', True)[:12] == 'qt4-embedded')]}"
+QT4EDEPENDS ?= "qt4-embedded "
+DEPENDS_prepend = "${QT4EDEPENDS}"
 
 inherit qmake2
 
diff --git a/meta/classes/qt4x11.bbclass b/meta/classes/qt4x11.bbclass
index 52190f4..b06e15d 100644
--- a/meta/classes/qt4x11.bbclass
+++ b/meta/classes/qt4x11.bbclass
@@ -1,4 +1,5 @@
-DEPENDS_prepend = "${@base_contains("PROVIDES", "qt4-x11", "", "qt4-x11 ", d)}"
+QT4DEPENDS ?= "qt4-x11 "
+DEPENDS_prepend = "${QT4DEPENDS}"
 
 inherit qmake2
 
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index 53eb652..965c66e 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -4,6 +4,7 @@ HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
 INC_PR = "r48"
 
+QT4EDEPENDS = ""
 QT_BASE_LIB  ?= "libqt-embedded"
 
 # Set necessary variables in the profile
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 0ae74f7..70ee9b0 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,6 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 PROVIDES += "qt4-x11"
+QT4DEPENDS = ""
 
 INC_PR = "r46"
 




