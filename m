Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BFD63724B9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 07:45:49 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XyFUR-0004iB-OC from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Dec 2014 23:45:48 -0800
Received: from awais-Precision-M4700.mgc.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.181.6; Tue, 9 Dec 2014 07:45:46 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Dec 2014 12:45:42 +0500
Message-ID: <1418111142-4802-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-* fix configure for out of tree build on git recipes
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
X-List-Received-Date: Tue, 09 Dec 2014 07:45:51 -0000
Content-Type: text/plain

The autogen.sh script lies in the srcdir ($S) and is required to
be run on git based checkouts of gstreamer packages in order to
generate initial makefiles. So, we fix this by cd'ing to the
specific dir, run the required script and then come back to our
initial dir which is builddir ($B).
Additionally rather than overriding the whole do_configure step
we only _prepend to make it clear what we are doing here.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 .../gstreamer/gstreamer1.0-libav_git.bb            |    5 +++--
 .../gstreamer/gstreamer1.0-omx_git.bb              |    5 +++--
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |    5 +++--
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     |    5 +++--
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |    5 +++--
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     |    5 +++--
 .../gstreamer/gstreamer1.0_git.bb                  |    5 +++--
 7 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index 5ce28cc..b0e6b2e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -20,8 +20,9 @@ LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
   ${GSTREAMER_1_0_DEBUG}"
 
-do_configure() {
+do_configure_prepend() {
+	cd ${S}
 	./autogen.sh --noconfigure
-	oe_runconf
+	cd ${B}
 }
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
index a390205..931a7fc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
@@ -13,8 +13,9 @@ S = "${WORKDIR}/git"
 
 SRCREV = "a2db76b048db278ef0aa798e106b7594264e06c0"
 
-do_configure() {
+do_configure_prepend() {
+	cd ${S}
 	./autogen.sh --noconfigure
-	oe_runconf
+	cd ${B}
 }
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index e1a5904..75859f9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -19,8 +19,9 @@ EXTRA_OECONF += " \
     -disable-openjpeg \
     "
 
-do_configure() {
+do_configure_prepend() {
+	cd ${S}
 	./autogen.sh --noconfigure
-	oe_runconf
+	cd ${B}
 }
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index a894abe..fbe3a42 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -11,8 +11,9 @@ S = "${WORKDIR}/git"
 
 SRCREV = "8d4cb64a4b9d84b10076bf350f80a0d6ea68ec2d"
 
-do_configure() {
+do_configure_prepend() {
+	cd ${S}
 	./autogen.sh --noconfigure
-	oe_runconf
+	cd ${B}
 }
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index 8b11b20..2c0e0ef 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -10,8 +10,9 @@ S = "${WORKDIR}/git"
 
 SRCREV = "fd0123800c8c1cf1468c0fa5d592ad0d0d8b4140"
 
-do_configure() {
+do_configure_prepend() {
+	cd ${S}
 	./autogen.sh --noconfigure
-	oe_runconf
+	cd ${B}
 }
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
index 2f72497..dcf5ffc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_git.bb
@@ -9,8 +9,9 @@ S = "${WORKDIR}/git"
 
 SRCREV = "06b8ac10cee85c5c304ca320997aa8f44295a66f"
 
-do_configure() {
+do_configure_prepend() {
+	cd ${S}
 	./autogen.sh --noconfigure
-	oe_runconf
+	cd ${B}
 }
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index 424c90a..cb00d31 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -10,8 +10,9 @@ S = "${WORKDIR}/git"
 
 SRCREV = "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
 
-do_configure() {
+do_configure_prepend() {
+	cd ${S}
 	./autogen.sh --noconfigure
-	oe_runconf
+	cd ${B}
 }
 
-- 
1.7.9.5


