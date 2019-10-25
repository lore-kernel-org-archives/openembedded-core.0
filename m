Return-Path: <alessio.bogani@elettra.eu>
Received: from spamalot.elettra.eu (spamalot.elettra.trieste.it
	[140.105.206.208])
	by mail.openembedded.org (Postfix) with ESMTP id E7FA37FAA8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 14:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with ESMTP id
	2ECD8440F5D_DB3005FB; Fri, 25 Oct 2019 14:02:07 +0000 (GMT)
Received: from unknown-host by spamalot.elettra.eu with queue id 788818;
	Fri, 25 Oct 2019 14:02:06 GMT
Received: from voltumna.elettra.trieste.it (voltumna.elettra.trieste.it
	[192.168.205.44])
	by spamalot.elettra.eu (Sophos Email Appliance) with ESMTP id
	BCBF443E386_DB3005EF; Fri, 25 Oct 2019 14:02:06 +0000 (GMT)
From: Alessio Igor Bogani <alessio.bogani@elettra.eu>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 16:01:57 +0200
X-Mailer: git-send-email 2.17.1
In-Reply-To: <2d2d7e60-d79e-5540-1378-88fda1fab4ec@kernel.crashing.org>
References: <2d2d7e60-d79e-5540-1378-88fda1fab4ec@kernel.crashing.org>
X-SASI-RCODE: 200
Message-Id: <20191025140207.2ECD8440F5D_DB3005FB@spamalot.elettra.eu>
Cc: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Subject: [PATCH v2] systemtap: support usrmerge
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
X-List-Received-Date: Fri, 25 Oct 2019 14:02:08 -0000

Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 6ee3e1c0f7..1c9f2aed16 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -51,10 +51,13 @@ do_install_append () {
       rm ${D}${libexecdir}/${PN}/stap-env
    fi
 
-   # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
-   install -d `dirname ${D}${systemd_unitdir}`
-   mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
-   rmdir ${D}${prefix}/lib --ignore-fail-on-non-empty
+   if [ ${D}${prefix}/lib != `dirname ${D}${systemd_unitdir}` ]; then
+      # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
+      # without usrmerge distro feature enabled
+      install -d `dirname ${D}${systemd_unitdir}`
+      mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
+      rmdir ${D}${prefix}/lib --ignore-fail-on-non-empty
+   fi
 
    # Ensure correct ownership for files copied in
    chown root:root ${D}${sysconfdir}/stap-exporter/* -R
-- 
2.17.1


