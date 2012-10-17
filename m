Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOUqd-00080p-2b
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 16:43:52 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so5602381wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 07:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=SR/iiRR9z2eSSQGKmBMiGJB1DlL9zXbuw6zq8DuJBdM=;
	b=M+f/bHxza77n3+ZtXCy3kOlsjYUOdii4cpkoPVolfZ7qHwz+SAVI6fKpSGIuybilTo
	mWQ06byUSCIy34sNfy3PxpqTCndB23fASK3A8xXZuyAfm8TlZLuWSEBYw8i5SJmG3Rzu
	OIRorJvcygpCJdCjT8RU0as0O1yATbvvoCtpt1ij59kE4qbZtCTWcgMfLOrfbGUTMTnZ
	v65wBxNlAm8Mf+thHOMRDebkYGbEZ4pufrx/6R06vHU3UBofjtxLCcMI2thQwh78LIe5
	1C70vnmIw2sqoOcwsjzUBEUMDP9IRCZgbvvwJIPhBhOy4u5rmaOXDp3J7PSX2NKSvQR4
	9pkA==
Received: by 10.216.194.38 with SMTP id l38mr11041560wen.80.1350484220810;
	Wed, 17 Oct 2012 07:30:20 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-94.unitymediagroup.de. [109.91.251.94])
	by mx.google.com with ESMTPS id fp6sm4508834wib.0.2012.10.17.07.30.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 07:30:19 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2012 16:29:32 +0200
Message-Id: <1350484172-9188-3-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1350484172-9188-1-git-send-email-s.stirtzel@googlemail.com>
References: <1350484172-9188-1-git-send-email-s.stirtzel@googlemail.com>
Subject: [PATCH 2/2] matchbox-keyboard: Use gtk-immodules-cache.bbclass
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
X-List-Received-Date: Wed, 17 Oct 2012 14:43:53 -0000

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   21 ++++----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 430e343..e426a5b 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -21,13 +21,16 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext gtk-immodules-cache
 
 EXTRA_OECONF = "--disable-cairo --enable-gtk-im --enable-applet"
 
 PACKAGES += "matchbox-keyboard-im matchbox-keyboard-im-dbg \
              matchbox-keyboard-applet matchbox-keyboard-applet-dbg"
 
+#Updates the inputmethod module cache in postinst / postrm
+GTKIMMODULES_PACKAGES = "matchbox-keyboard-im"
+
 FILES_${PN} = "${bindir}/* \
 	       ${sysconfdir} \
 	       ${datadir}/applications \
@@ -47,19 +50,3 @@ do_install_append () {
 	rm -f ${D}${libdir}/gtk-2.0/*/immodules/*.la
 	rm -f ${D}${libdir}/matchbox-panel/*.la
 }
-
-pkg_postinst_matchbox-keyboard-im () {
-if [ "x$D" != "x" ]; then
-  exit 1
-fi
-
-gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
-}
-
-pkg_postrm_matchbox-keyboard-im () {
-if [ "x$D" != "x" ]; then
-  exit 1
-fi
-
-gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
-}
-- 
1.7.9.5



