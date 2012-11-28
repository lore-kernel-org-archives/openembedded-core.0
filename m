Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1Tdb5n-0007ZP-CA
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 07:25:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAS6BadP007878
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2012 22:11:36 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 27 Nov 2012 22:11:35 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Nov 2012 14:11:30 +0800
Message-ID: <7bdbae33fe568cd5e0c149d2f938c19ed79e004b.1354081123.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1354081123.git.jackie.huang@windriver.com>
References: <cover.1354081123.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com, saul.wold@intel.com
Subject: [PATCH 1/2] Revert "eglibc: always compile with optimization."
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 06:25:56 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

This reverts commit 9ca1c6120fad5dcae1694e8e37331c1b903f1fd0.
The fix is not version specific, so revert it and move the
fix code to the .inc in the following commit.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/eglibc/eglibc_2.16.bb |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 71bcc30..aa9256c 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -87,17 +87,6 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
-# eglibc can't be built without optimization, if someone tries to compile an
-# entire image as -O0, we override it with -O2 here and give a note about it.
-def get_optimization(d):
-    selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
-    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
-        bb.note("eglibc can't be built with -O0, -O2 will be used instead.")
-        return selected_optimization.replace("-O0", "-O2")
-    return selected_optimization
-
-SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
-
 do_unpack_append() {
     bb.build.exec_func('do_move_ports', d)
 }
-- 
1.7.4



