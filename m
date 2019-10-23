Return-Path: <alessio.bogani@elettra.eu>
Received: from spamalot.elettra.eu (spamalot.elettra.trieste.it
	[140.105.206.208])
	by mail.openembedded.org (Postfix) with ESMTP id 3CAD17F876
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 20:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with ESMTP id
	DBC8D440DCF_DB0B727B for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 20:25:11 +0000 (GMT)
Received: from unknown-host by spamalot.elettra.eu with queue id 788366
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Oct 2019 20:25:11 GMT
Received: from pc-bogani.elettra.trieste.it (pc-bogani.elettra.trieste.it
	[192.168.205.85])
	by spamalot.elettra.eu (Sophos Email Appliance) with ESMTP id
	7A12A43E37D_DB0B727F; Wed, 23 Oct 2019 20:25:11 +0000 (GMT)
From: Alessio Igor Bogani <alessio.bogani@elettra.eu>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2019 22:25:04 +0200
X-Mailer: git-send-email 2.17.1
X-SASI-RCODE: 200
Message-Id: <20191023202511.DBC8D440DCF_DB0B727B@spamalot.elettra.eu>
Cc: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Subject: [PATCH] systemtap: support usrmerge
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
X-List-Received-Date: Wed, 23 Oct 2019 20:25:14 -0000

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 6ee3e1c0f7..2efba2e06f 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -52,10 +52,13 @@ do_install_append () {
    fi
 
    # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
-   install -d `dirname ${D}${systemd_unitdir}`
-   mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
+   if not ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
+      install -d `dirname ${D}${systemd_unitdir}`
+      mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
+   fi
    rmdir ${D}${prefix}/lib --ignore-fail-on-non-empty
 
+
    # Ensure correct ownership for files copied in
    chown root:root ${D}${sysconfdir}/stap-exporter/* -R
 }
-- 
2.17.1


