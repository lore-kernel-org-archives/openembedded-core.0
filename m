Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 492EF7F89A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 07:42:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xAF7g7t6002156
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Nov 2019 23:42:07 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 14 Nov 2019 23:42:06 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Nov 2019 15:42:02 +0800
Message-ID: <20191115074202.16526-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] systemd: remove ${PN}-xorg-xinitrc
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
X-List-Received-Date: Fri, 15 Nov 2019 07:42:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

In 50-systemd-user.sh which is packaged to sub-package
${PN}-xorg-xinitrc, it exports environment variables DISPLAY and
XAUTHORITY to systemd. It fails to start systemd services which require
these environment variables such as thunar.service:

root@qemux86-64:~# systemctl --user status thunar
● thunar.service - Thunar file manager
Loaded: loaded (/usr/lib/systemd/user/thunar.service; disabled; vendor preset: enabled)
Active: inactive (dead)
Docs: man:Thunar(1)

Nov 14 07:47:29 qemux86-64 systemd[352]: Starting Thunar file manager...
Nov 14 07:47:29 qemux86-64 Thunar[873]: cannot open display:
Nov 14 07:47:29 qemux86-64 systemd[352]: thunar.service: Main process exited, code=exited, status=1/FAILURE
Nov 14 07:47:29 qemux86-64 systemd[352]: thunar.service: Failed with result 'exit-code'.
Nov 14 07:47:29 qemux86-64 systemd[352]: Failed to start Thunar file manager.

It is not convenient to make all such kind of packages require package
${PN}-xorg-xinitrc, so remove the sub-package and merge the only file
provided by it to main package.

No recipe depends on ${PN}-xorg-xinitrc in oe-core and meta-openembedded
now, so no need to set rprovides for it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/systemd/systemd_243.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
index 54fcc6a5d1..b0fadb23ad 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -316,7 +316,6 @@ PACKAGES =+ "\
     ${PN}-rpm-macros \
     ${PN}-binfmt \
     ${PN}-zsh-completion \
-    ${PN}-xorg-xinitrc \
     ${PN}-container \
     ${PN}-journal-gatewayd \
     ${PN}-journal-upload \
@@ -378,8 +377,6 @@ FILES_${PN}-kernel-install = "${bindir}/kernel-install \
 FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
                          "
 
-FILES_${PN}-xorg-xinitrc = "${sysconfdir}/X11/xinit/xinitrc.d/*"
-
 FILES_${PN}-zsh-completion = "${datadir}/zsh/site-functions"
 
 FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
@@ -528,6 +525,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${sysconfdir}/xdg/ \
                 ${sysconfdir}/init.d/README \
                 ${sysconfdir}/resolv-conf.systemd \
+                ${sysconfdir}/X11/xinit/xinitrc.d/* \
                 ${rootlibexecdir}/systemd/* \
                 ${systemd_unitdir}/* \
                 ${base_libdir}/security/*.so \
-- 
2.17.1


