Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B1D2C72644
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 09:46:52 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y5Wua-0002Zj-IJ from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Dec 2014 01:46:52 -0800
Received: from awais-Precision-M4700.mgc.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Mon, 29 Dec 2014 09:46:51 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Dec 2014 14:46:48 +0500
Message-ID: <1419846408-31247-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-omx: use mulitple SCMs to fetch submodules
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
X-List-Received-Date: Mon, 29 Dec 2014 09:46:56 -0000
Content-Type: text/plain

The gstreamer omx package uses a submodule 'common' which
is fetched by the configure script. This approach fails
on non-network builds as the fetcher tries to look upstream
for the submodule.
We now use multiple SCMs, one for the main omx package and
the other for the 'common' submodule so it is available in
the downloads_dir for later use.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 .../gstreamer/gstreamer1.0-omx_git.bb              |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
index 931a7fc..99c84668 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
@@ -6,12 +6,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
 
 SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-omx;branch=master \
-    file://0001-omx-fixed-type-error-in-printf-call.patch \    
+    git://anongit.freedesktop.org/gstreamer/gst-omx;branch=master;name=gst-omx \
+    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;branch=master;name=common \
+    file://0001-omx-fixed-type-error-in-printf-call.patch \
     "
+
 S = "${WORKDIR}/git"
 
-SRCREV = "a2db76b048db278ef0aa798e106b7594264e06c0"
+SRCREV_gst-omx = "a2db76b048db278ef0aa798e106b7594264e06c0"
+SRCREV_common = "5edcd857b2107cd8b78c16232dd10877513ec157"
+
+SRCREV_FORMAT = "gst-omx"
 
 do_configure_prepend() {
 	cd ${S}
-- 
1.7.9.5


