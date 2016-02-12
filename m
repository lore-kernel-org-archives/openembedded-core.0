Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7AB2D76A51
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 11:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CBsNu8017983; Fri, 12 Feb 2016 11:54:23 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id f_1HMTF84vZw; Fri, 12 Feb 2016 11:54:23 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CBsLin017977
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 12 Feb 2016 11:54:22 GMT
Message-ID: <1455278061.16142.278.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Fri, 12 Feb 2016 11:54:21 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] gstreamer1.0-meta-base: Don't use COMBINED_FEATURES
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
X-List-Received-Date: Fri, 12 Feb 2016 11:54:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

http://git.openembedded.org/openembedded-core/commit/?id=948165dce7475b815a344fd3c3d58165e6865d48
makes gstreamer1.0-plugins-base-alsa depend on COMBINED_FEATURES.

This is an allarch recipe so this only works if all your machines
have the same MACHINE_FEATURES and not all do.

Instead make this an unconditional RRECOMMEND, its a PACKAGES_DYNAMIC so
this should all work out for everyone's use cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
index ecfd082..9d1b9dc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
@@ -26,7 +26,6 @@ RDEPENDS_gstreamer1.0-meta-base = "\
     gstreamer1.0 \
     gstreamer1.0-plugins-base-playback \
     gstreamer1.0-plugins-base-gio \
-    ${@bb.utils.contains('COMBINED_FEATURES', 'alsa', 'gstreamer1.0-plugins-base-alsa', '',d)} \
     gstreamer1.0-plugins-base-volume \
     gstreamer1.0-plugins-base-audioconvert \
     gstreamer1.0-plugins-base-audioresample \
@@ -36,6 +35,10 @@ RDEPENDS_gstreamer1.0-meta-base = "\
     gstreamer1.0-plugins-good-autodetect \
     gstreamer1.0-plugins-good-souphttpsrc"
 
+RRECOMMENDS_gstreamer1.0-meta-base = "\
+    gstreamer1.0-plugins-base-alsa \
+"
+
 RRECOMMENDS_gstreamer1.0-meta-x11-base = "\
     gstreamer1.0-plugins-base-ximagesink \
     gstreamer1.0-plugins-base-xvimagesink"



