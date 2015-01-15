Return-Path: <petter@technux.se>
Received: from bin-vsp-out-01.atm.binero.net (vsp-authed01.binero.net
	[195.74.38.224])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABBA72BF8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 21:57:33 +0000 (UTC)
X-Halon-ID: 9470c94a-9d01-11e4-a1ae-005056917a89
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.localdomain (unknown [95.197.59.95])
	by bin-vsp-out-01.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 22:58:03 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jan 2015 22:57:20 +0100
Message-Id: <9aabd366181b0a13314d3e7be7f228476aa0fddc.1421358457.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421358457.git.petter@technux.se>
References: <cover.1421358457.git.petter@technux.se>
In-Reply-To: <cover.1421358457.git.petter@technux.se>
References: <cover.1421358457.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 3/5] lsof: handle S in a proper way
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
X-List-Received-Date: Thu, 15 Jan 2015 21:57:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since lsof are doing two unpacks and S should be set to match
the second unpack of an internal archive, we should let the build
system know that we are aware of this.

Solve this by temporarily set S like lsof are doing with SRC_URI.

[YOCTO #5627]

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/recipes-extended/lsof/lsof_4.88.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/lsof/lsof_4.88.bb b/meta/recipes-extended/lsof/lsof_4.88.bb
index a96b06e..0e49f92 100644
--- a/meta/recipes-extended/lsof/lsof_4.88.bb
+++ b/meta/recipes-extended/lsof/lsof_4.88.bb
@@ -15,9 +15,16 @@ S = "${WORKDIR}/lsof_${PV}_src"
 LIC_FILES_CHKSUM = "file://${S}/00README;beginline=645;endline=679;md5=964df275d26429ba3b39dbb9f205172a"
 
 python do_unpack () {
+    # temporarily change S for unpack
+    # of lsof_${PV}
+    s = d.getVar('S')
+    d.setVar('S', '${WORKDIR}/lsof_${PV}')
     bb.build.exec_func('base_do_unpack', d)
+    # temporarily change SRC_URI for unpack
+    # of lsof_${PV}_src
     src_uri = d.getVar('SRC_URI')
     d.setVar('SRC_URI', '${LOCALSRC}')
+    d.setVar('S', s)
     bb.build.exec_func('base_do_unpack', d)
     d.setVar('SRC_URI', src_uri)
 }
-- 
1.9.1


