Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 110AD79C08
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 06:58:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9M6vnxi021668
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 23:57:59 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 21 Oct 2018 23:57:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2018 15:03:43 +0800
Message-ID: <a2bd44ad10ae076b40b11a1a2c8d0007817b17af.1540191752.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1540191752.git.Qi.Chen@windriver.com>
References: <cover.1540191752.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: add back alternatives for init utitilies
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
X-List-Received-Date: Mon, 22 Oct 2018 06:58:08 -0000
Content-Type: text/plain

Add back alternatives for init utilities to avoid regression.

These alternatives were removed when upgradeing systemd to 239.
They were removed out of the logic that init utitilies should be
bound to init manager. However, it turned out that two use cases
were not covered.

1) initramfs using commands like 'reboot' from busybox.
2) Users use customized busybox defconfig which enables init utilities.

The first use case caused a regression bug in yocto.
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=12914
Patches were sent to fix the reboot problem.

But this is not enough. As we may have the second use case. In such
situation, users will find themselves having regression error when
using 'busybox + systemd' (and busybox is installed after systemd,
overriding the systemd symlinks).

So in order to avoid regression, add back these alternatives.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_239.bb | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index bc16407..61159ad 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -438,7 +438,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${base_sbindir}/runlevel \
                 ${base_sbindir}/telinit \
                 ${base_sbindir}/resolvconf \
-                ${base_sbindir}/reboot.systemd \
+                ${base_sbindir}/reboot \
                 ${base_sbindir}/init \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
@@ -546,14 +546,31 @@ python __anonymous() {
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
-ALTERNATIVE_${PN} = "resolv-conf reboot"
+ALTERNATIVE_${PN} = "halt reboot shutdown poweroff runlevel resolv-conf"
 
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
 ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"
 
+ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
+ALTERNATIVE_PRIORITY[halt] ?= "300"
+
+ALTERNATIVE_TARGET[reboot] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
-ALTERNATIVE_PRIORITY[reboot] = "100"
+ALTERNATIVE_PRIORITY[reboot] ?= "300"
+
+ALTERNATIVE_TARGET[shutdown] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[shutdown] = "${base_sbindir}/shutdown"
+ALTERNATIVE_PRIORITY[shutdown] ?= "300"
+
+ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
+ALTERNATIVE_PRIORITY[poweroff] ?= "300"
+
+ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
+ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
 pkg_postinst_${PN} () {
 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
-- 
1.9.1


