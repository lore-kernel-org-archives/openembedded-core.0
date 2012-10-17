Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOVhl-0004en-Lz
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 17:38:45 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so735577wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9LrmyjE0ihCtC+4SqhIGoKgRWr8z8xZvRgUtLYIdn9M=;
	b=MuijAZCNO2cv5trDHVEwn2A/O+C/RxCLf+PuSA8Zecood2DL61h9MDOD0b4xEFuW46
	lblxz4eFJXPcBjL8nOe7A0W8JB3XEv6q3zzBN34u202pejtqytg9i8bOowzUGoNf/5IB
	LyYKMiOaMHAJ7AWIBiBd5eBxJ+YFXQmCIX83rgqKP0ukw8A+VXwdJ/cVWQFnNmeFqlz2
	Z7t65iQtDrMGgEyewGy4HLI6cufDTD8vwonpgjaCN0iZlnjiciub+Ii7TH3gIi73A1NK
	v+lYXfuLdfIO2i9xkqv40pwERZSTL8Q6HgTFdta0K+lakayPWi+Vbkx9idN4redQoo+d
	pjtQ==
Received: by 10.216.210.11 with SMTP id t11mr11441271weo.92.1350487527689;
	Wed, 17 Oct 2012 08:25:27 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-94.unitymediagroup.de. [109.91.251.94])
	by mx.google.com with ESMTPS id v3sm28140562wiy.5.2012.10.17.08.25.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 08:25:17 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2012 17:24:57 +0200
Message-Id: <1350487497-13102-2-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1350487497-13102-1-git-send-email-s.stirtzel@googlemail.com>
References: <1350487497-13102-1-git-send-email-s.stirtzel@googlemail.com>
Subject: [PATCH v2 2/2] matchbox-keyboard: Use gtk-immodules-cache.bbclass
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
X-List-Received-Date: Wed, 17 Oct 2012 15:38:45 -0000

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   23 +++++---------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 430e343..c812f05 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN} = "formfactor dbus-wait"
 SECTION = "x11"
 SRCREV = "b38f24036cff3be6c2fbcf9ca9881803e69003ac"
 PV = "0.0+git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
            file://configure_fix.patch;maxrev=1819 \
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



