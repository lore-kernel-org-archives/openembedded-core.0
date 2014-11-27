Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C52C865CAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 00:49:57 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1XtnHS-0006wQ-5l from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Nov 2014 16:49:58 -0800
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) with Microsoft SMTP
	Server id 14.3.181.6; Wed, 26 Nov 2014 16:49:57 -0800
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Nov 2014 19:49:55 -0500
Message-ID: <1417049395-15437-2-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1417049395-15437-1-git-send-email-drew_moseley@mentor.com>
References: <1417049395-15437-1-git-send-email-drew_moseley@mentor.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mesa-demos: Move util to the front of the SUBDIRS variable.
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
X-List-Received-Date: Thu, 27 Nov 2014 00:49:57 -0000
Content-Type: text/plain

This forces it to be built first since many of the demos
require it.  Resolves build failures such as the following
when certain demos are enabled (notably when PACKAGECONFIG
contains glut):

    make[2]: *** No rule to make target `../util/libutil.la', needed by `copypix'.  Stop.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 ...-configure-Allow-to-disable-demos-which-require-GLEW-.patch | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
index e02f1ab..4b07193 100644
--- a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
+++ b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
@@ -95,11 +95,16 @@ diff --git a/src/Makefile.am b/src/Makefile.am
 index 1647d64..754c47c 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -23,14 +23,13 @@
+@@ -23,14 +23,18 @@
  #    Eric Anholt <eric@anholt.net>
  
++if HAVE_GLEW
++UTIL = util
++endif
++
  SUBDIRS = \
 -	util \
++	$(UTIL) \
  	data \
  	demos \
  	egl \
@@ -111,7 +116,7 @@ index 1647d64..754c47c 100644
  	objviewer \
  	osdemos \
  	perf \
-@@ -40,8 +39,13 @@ SUBDIRS = \
+@@ -40,8 +39,12 @@ SUBDIRS = \
  	slang \
  	tests \
  	tools \
@@ -125,7 +130,6 @@ index 1647d64..754c47c 100644
 +SUBDIRS += \
 +	vp \
 +	vpglsl \
-+	util \
 +	trivial
 +endif
 diff --git a/src/demos/Makefile.am b/src/demos/Makefile.am
-- 
1.9.1


