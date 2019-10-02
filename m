Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 964047DE74
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 05:02:54 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id CC5011C0002;
	Wed,  2 Oct 2019 18:02:53 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2019 18:02:46 +1300
Message-Id: <20191002050246.28151-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] icecc: Don't use icecc when INHIBIT_DEFAULT_DEPS is set
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
X-List-Received-Date: Wed, 02 Oct 2019 05:02:55 -0000

We don't have a compiler, so no icecc.
Silences a spew of warnings of the form:

    do_configure: Cannot use icecc: could not get ICECC_CC or ICECC_CXX

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/icecc.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index e74d798fd0..bc3d6f4cc8 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -138,6 +138,10 @@ def use_icecc(bb,d):
     if icecc_is_cross_canadian(bb, d):
         return "no"
 
+    if d.getVar('INHIBIT_DEFAULT_DEPS', False):
+        # We don't have a compiler, so no icecc
+        return "no"
+
     pn = d.getVar('PN')
     bpn = d.getVar('BPN')
 
-- 
2.17.1


