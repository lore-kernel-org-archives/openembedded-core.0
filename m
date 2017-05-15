Return-Path: <petter@technux.se>
X-Greylist: delayed 364 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 May 2017 04:23:27 UTC
Received: from bin-vsp-out-02.atm.binero.net (vsp-unauthed02.binero.net
	[195.74.38.227])
	by mail.openembedded.org (Postfix) with ESMTP id AC68C6011B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 04:23:26 +0000 (UTC)
X-Halon-ID: 61f4c48e-3925-11e7-b153-005056917f90
Authorized-sender: petter@technux.se
Received: from elxacs1nn72.localdomain (unknown [95.199.159.67])
	by bin-vsp-out-02.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 06:17:17 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 06:17:11 +0200
Message-Id: <7c0aa8330757a50d9a69a4c23be83e4cc045566c.1494796923.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1494796923.git.petter@technux.se>
References: <cover.1494796923.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH v2 1/1] multilib.bbclass: fix faulty redefinition of STAGING_KERNEL_DIR
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
X-List-Received-Date: Mon, 15 May 2017 04:23:28 -0000
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
index ab04597..816f54e 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -4,7 +4,9 @@ python multilib_virtclass_handler () {
     if cls != "multilib" or not variant:
         return
 
-    e.data.setVar('STAGING_KERNEL_DIR', e.data.getVar('STAGING_KERNEL_DIR'))
+    localdata = bb.data.createCopy(e.data)
+    localdata.delVar('TMPDIR')
+    e.data.setVar('STAGING_KERNEL_DIR', localdata.getVar('STAGING_KERNEL_DIR'))
 
     # There should only be one kernel in multilib configs
     # We also skip multilib setup for module packages.
-- 
1.9.1


