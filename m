Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B9B6979A9C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 05:13:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9J5Dt4c015793
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 22:13:55 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 18 Oct 2018 22:13:55 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Oct 2018 13:19:53 +0800
Message-ID: <aa81e6d3c24822a91432cac5af20378a65301254.1539926193.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1539926193.git.Qi.Chen@windriver.com>
References: <cover.1539926193.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Fri, 19 Oct 2018 05:13:54 -0000
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
 meta/recipes-core/systemd/systemd_239.bb | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 7ed9321..0e84531 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -447,7 +447,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${base_sbindir}/runlevel \
                 ${base_sbindir}/telinit \
                 ${base_sbindir}/resolvconf \
-                ${base_sbindir}/reboot.systemd \
+                ${base_sbindir}/reboot \
                 ${base_sbindir}/init \
                 ${datadir}/dbus-1/services \
                 ${datadir}/dbus-1/system-services \
@@ -556,14 +556,35 @@ python __anonymous() {
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
 
-ALTERNATIVE_${PN} = "resolv-conf reboot"
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel resolv-conf"
 
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
 ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"
 
+ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
+ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
+ALTERNATIVE_PRIORITY[init] ?= "300"
+
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


