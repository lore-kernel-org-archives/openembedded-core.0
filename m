Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6FF8B731BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 21:41:26 +0000 (UTC)
Received: from linuxdev.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 2A4465C047E;
	Mon, 19 Sep 2016 23:35:54 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 23:41:20 +0200
Message-Id: <1474321280-3913-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1474320954; bh=EJnl8j+TB/E7VLCJ8KS4nkAvn5TyRRYhe/A9bx5zECM=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=ETEMPqYJcRk5g9XPVgShaTXirnKc8Y229Egl9zoyczokRT0NxW6c4BSk8dE+O+nsZgB6pY2hIR+yutvCGfUILfU3xTl+J5yWy5CHxCJ4+9yY5DJWGLJbN9zH2VTxy7bnqqxyCdHdnL1kDkoExv7vjL77rkQLQmJC1Gh2P7mZkoM=
Subject: [meta-oe][PATCH] packagegroup-basic: make avahi depending on distro features
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
X-List-Received-Date: Mon, 19 Sep 2016 21:41:28 -0000

Depend on zeroconf distro feature whether to install avahi packages
as it is done in packagegroup-base.

While at it also get rid of some comment cruft.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index 4f2992c..28e1f33 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -27,11 +27,9 @@ TASK_BASIC_SSHDAEMON ?= "dropbear openssh-sftp openssh-sftp-server"
 # It also avoids the choice between connman/networkmanager/ifupdown since that is an image feature, not a
 # distro feature.
 #
-# Util-linux (u)mount is included because the busybox one can't handle /etc/mtab being symlinked to /proc/mounts
-#
 RDEPENDS_${PN} = "\
     ${TASK_BASIC_SSHDAEMON} \
-    avahi-daemon avahi-utils \
+    ${@bb.utils.contains("DISTRO_FEATURES", "zeroconf", "avahi-daemon avahi-utils", "", d)} \
 "
 
 #
-- 
2.5.5


