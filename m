Return-Path: <joelf@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id 43D8C60144
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 May 2014 20:35:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s44KZRoD007400
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 May 2014 15:35:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s44KZRYZ001036
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 May 2014 15:35:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 4 May 2014 15:35:27 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s44KZRfY005509;	Sun, 4 May 2014 15:35:27 -0500
Received: from joelboxx.am.dhcp.ti.com (joelboxx.am.dhcp.ti.com
	[128.247.71.22])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with
	ESMTP id s44KZRt08336;	Sun, 4 May 2014 15:35:27 -0500 (CDT)
From: Joel Fernandes <joelf@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 May 2014 16:46:11 -0400
Message-ID: <1399236371-3167-1-git-send-email-joelf@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v3] serial-getty service: Add linux as default TERM
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
X-List-Received-Date: Sun, 04 May 2014 20:35:27 -0000
Content-Type: text/plain

In poky with systemd enabled, vt102 is selected for getty
causing user to experience a very crappy terminal. Default
TERM to xterm.

Reviewed-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Joel Fernandes <joelf@ti.com>
---
v2: Removed PR bump.
v3: Changed TERM to xterm, pass -8 to getty.

 .../systemd-serialgetty/serial-getty@.service      |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 865de34..6dd335c 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -20,7 +20,8 @@ Before=getty.target
 IgnoreOnIsolate=yes
 
 [Service]
-ExecStart=-/sbin/agetty --keep-baud %I @BAUDRATE@ $TERM
+Environment="TERM=xterm"
+ExecStart=-/sbin/agetty -8 --keep-baud %I @BAUDRATE@ $TERM
 Type=idle
 Restart=always
 RestartSec=0
-- 
1.7.9.5


