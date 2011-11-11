Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu7Z-0005YU-OI
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:38:29 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+O++d+I4bFkkQxoT05Oz61VsJGOy2smNmcHsTUTZG5Q=;
	b=JqQSWWyf/ZjppgfLXukCgLyiuGtDhcC+fjjWzwxde8d9BheAg+g00QvbJLi0Jd6Po9
	FunZDVSkcMzuuq88C9X9YiYVRu5Zx2c5ptWKrLhmolSuBe5/O/tjwQ/W9qEGIyv/a5fH
	oA6tl/s4UFrRJ5lCUVpnI3rkqnTMXlwwa+t0k=
Received: by 10.204.145.211 with SMTP id e19mr8901338bkv.55.1321029134110;
	Fri, 11 Nov 2011 08:32:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cc2sm9619855bkb.8.2011.11.11.08.32.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:32:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:58 +0100
Message-Id: <0dfbbc3f35ac424f970e74ff2d4eabf86aa0c76c.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
References: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 22/22] kbd: use u-a for chvt, deallocvt, fgconssole, openvt, conflicts with busybox
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Nov 2011 16:42:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/kbd/kbd_1.15.2.bb |   29 ++++++++++++++++++++++++++++-
 1 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
index 2e0406b..eea04a0 100644
--- a/meta/recipes-core/kbd/kbd_1.15.2.bb
+++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
@@ -10,7 +10,7 @@ RREPLACES_${PN} = "console-tools"
 RPROVIDES_${PN} = "console-tools"
 RCONFLICTS_${PN} = "console-tools"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
 SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
@@ -22,3 +22,30 @@ FILES_${PN}-consolefonts = "${datadir}/consolefonts"
 FILES_${PN}-consoletrans = "${datadir}/consoletrans"
 FILES_${PN}-keymaps = "${datadir}/keymaps"
 FILES_${PN}-unimaps = "${datadir}/unimaps"
+
+ALTERNATIVE_NAMES_USRBIN = "chvt deallocvt fgconsole openvt"
+
+do_install_append() {
+  usrbinprogs_a="${ALTERNATIVE_NAMES_USRBIN}"
+  for p in $usrbinprogs_a; do
+    if [ -f "${D}${bindir}/$p" ]; then
+      mv "${D}${bindir}/$p" "${D}${bindir}/$p.${PN}"
+    fi
+  done
+}
+
+pkg_postinst_${PN} () {
+  usrbinprogs_a="${ALTERNATIVE_NAMES_USRBIN}"
+  for p in $usrbinprogs_a; do
+    if [ -f "$D${bindir}/$p" ]; then
+      update-alternatives --install ${bindir}/$p $p $p.${PN} 100
+    fi
+  done
+}
+
+pkg_postrm_${PN} () {
+  usrbinprogs_a="${ALTERNATIVE_NAMES_USRBIN}"
+  for p in $usrbinprogs_a; do
+    update-alternatives --remove $p $p.${PN}
+  done
+}
-- 
1.7.8.rc1



