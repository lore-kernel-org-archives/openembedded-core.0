Return-Path: <petter@technux.se>
Received: from bin-vsp-out-04.atm.binero.net (vsp-unauthed02.binero.net
	[195.74.38.227])
	by mail.openembedded.org (Postfix) with ESMTP id D786B601A5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 09:14:00 +0000 (UTC)
X-Halon-ID: 4ce2a56a-bf81-11e6-856a-005056917c0c
Authorized-sender: petter@technux.se
Received: from localhost.localdomain (unknown [85.195.55.167])
	by bin-vsp-out-04.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 10:07:54 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2016 10:07:39 +0100
Message-Id: <35015c2d5a18b79b0166537ac832f32795d295d5.1481411836.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1481411836.git.petter@technux.se>
References: <cover.1481411836.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 1/1] multilib.bbclass: fix faulty redefinition of STAGING_KERNEL_DIR
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
X-List-Received-Date: Sun, 11 Dec 2016 09:14:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Due to the problem fixed in
'56c677a multilib: Move redefinition of STAGING_DIR_KERNEL'
STAGING_KERNEL_DIR must be redefined for lib32 in multilib.bbclass.
However this redefinition expanded STAGING_KERNEL_DIR to an absolute
path. This unconsciously added the TMPDIR path in the sstate object,
causing packages depended on STAGING_KERNEL_DIR being rebuild if the
TMPDIR was changed.

Solve this by forcing the unexpanded TMPDIR variable to remain in the
beginning of STAGING_DIR_KERNEL (as default). Since TMPDIR is included in
BB_HASHBASE_WHITELIST, the sstate object will not be depended on the
expanded path anymore.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/classes/multilib.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index d5a3128..eba666d 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -4,7 +4,9 @@ python multilib_virtclass_handler () {
     if cls != "multilib" or not variant:
         return
 
-    e.data.setVar('STAGING_KERNEL_DIR', e.data.getVar('STAGING_KERNEL_DIR', True))
+    localdata = bb.data.createCopy(e.data)
+    localdata.delVar('TMPDIR')
+    e.data.setVar('STAGING_KERNEL_DIR', localdata.getVar('STAGING_KERNEL_DIR', True))
 
     # There should only be one kernel in multilib configs
     # We also skip multilib setup for module packages.
-- 
1.9.1


