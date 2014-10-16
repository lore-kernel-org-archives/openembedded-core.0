Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B6F5860DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:17:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9G9Hn9f012192
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 02:17:49 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 02:17:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Oct 2014 17:19:04 +0800
Message-ID: <222ef849d28064ba0786fb5bf929554d6389c9cc.1413451107.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413451107.git.Qi.Chen@windriver.com>
References: <cover.1413451107.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: fix runtime dependency
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
X-List-Received-Date: Thu, 16 Oct 2014 09:17:49 -0000
Content-Type: text/plain

Previously, if we set 'NO_RECOMMENDATIONS' to "1", we cannot reach login
in systemd systems. The problem is that several runtime dependencies are
coded as 'recommended' in our project.

This patch makes the following changes.
1. Add util-linux-agetty as a runtime dependency.
   Otherwise, getty services in systemd cannot start correctly.
2. Add systemd-serialgetty as a runtime dependency.
   Otherwise, serialgetty services cannot start correctly in systemd and
   we would have problem when using `runqemu qemux86 nographic'.
3. Remove 'systemd' from RDEPENDS of systemd-serialgetty.
   systemd-serialgetty justs ships systemd unit files, even if the init
   manager is 'sysvinit', these files do no harm.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 2 --
 meta/recipes-core/systemd/systemd_216.bb         | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 1c34d5c..f3acaad 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -36,8 +36,6 @@ do_install() {
 	fi
 }
 
-RDEPENDS_${PN} = "systemd"
-
 # This is a machine specific file
 FILES_${PN} = "${systemd_unitdir}/system/*.service ${sysconfdir}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index ebf9395..62fe5c7 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -267,11 +267,10 @@ FILES_${PN} = " ${base_bindir}/* \
 FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
+RDEPENDS_${PN} += "kmod dbus systemd-serialgetty util-linux-mount util-linux-agetty udev (= ${EXTENDPKGV})"
 RDEPENDS_${PN} += "volatile-binds"
 
-RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units udev-hwdb\
-                      util-linux-agetty \
+RRECOMMENDS_${PN} += "systemd-compat-units udev-hwdb\
                       util-linux-fsck e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 os-release \
 "
-- 
1.9.1


