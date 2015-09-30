Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ADA6576F9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 13:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDrKaV007784 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:54:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uWrtUK4fGI42
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:54:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8UDrpbh007852
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 14:54:03 +0100
Message-ID: <1443621231.5162.94.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 14:53:51 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] gstreamer-omx: Improve variable expansion of ${S}
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
X-List-Received-Date: Wed, 30 Sep 2015 13:54:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The way ${S} is expanded into CFLAGS means the recipe is marked as depending
on the path within which its built. We can avoid this by avoiding the expansion
which then allows reuse of the recipe from sstate.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
index 8c273fc..6806455 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
@@ -20,11 +20,10 @@ EXTRA_OECONF += "--disable-valgrind --with-omx-target=${GSTREAMER_1_0_OMX_TARGET
 python __anonymous () {
     omx_target = d.getVar("GSTREAMER_1_0_OMX_TARGET", True)
     if omx_target in ['generic', 'bellagio']:
-        srcdir = d.getVar("S", True)
         # Bellagio headers are incomplete (they are missing the OMX_VERSION_MAJOR,#
         # OMX_VERSION_MINOR, OMX_VERSION_REVISION, and OMX_VERSION_STEP macros);
         # appending a directory path to gst-omx' internal OpenMAX IL headers fixes this
-        d.appendVar("CFLAGS", " -I%s/omx/openmax" % srcdir)
+        d.appendVar("CFLAGS", " -I${S}/omx/openmax")
     elif omx_target == "rpi":
         # Dedicated Raspberry Pi OpenMAX IL support makes this package machine specific
         d.setVar("PACKAGE_ARCH", d.getVar("MACHINE_ARCH", True))



