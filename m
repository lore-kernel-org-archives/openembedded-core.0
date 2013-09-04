Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 235656BEF8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 06:56:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r846ulUl007109
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2013 23:56:47 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 3 Sep 2013 23:56:46 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Sep 2013 14:56:41 +0800
Message-ID: <be19ea6551721c03fca8679acbf05053f3cebfd6.1378276893.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378276893.git.rongqing.li@windriver.com>
References: <cover.1378276893.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] systemd: link runlevel from systemctl
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
X-List-Received-Date: Wed, 04 Sep 2013 06:56:44 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

using update-alternatives to link runlevel from systemctl, as on Fedora 18

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd_206.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_206.bb
index 75bdc61..519d50f 100644
--- a/meta/recipes-core/systemd/systemd_206.bb
+++ b/meta/recipes-core/systemd/systemd_206.bb
@@ -253,7 +253,7 @@ python __anonymous() {
 # TODO:
 # u-a for runlevel and telinit
 
-ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff"
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
 
 ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
 ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
@@ -275,6 +275,10 @@ ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
 ALTERNATIVE_PRIORITY[poweroff] ?= "300"
 
+ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
+ALTERNATIVE_PRIORITY[runlevel] ?= "300"
+
 pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
 		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
-- 
1.7.10.4


