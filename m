Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1SsYSz-0007Je-Bv
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 14:07:25 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q6LBtu47007563
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 21 Jul 2012 13:55:58 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1SsYHp-0003rZ-2i; Sat, 21 Jul 2012 13:55:54 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jul 2012 13:55:46 +0200
Message-Id: <1342871746-14583-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.10.4
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.995
X-Spam-Score: -5.2
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] bitbake: do not set CCACHE_DISABLE=0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Jul 2012 12:07:25 -0000

ccache checks for existence of environment; not for its value:

  ---- ccache-3.1.7/ccache.c ---
        if (getenv("CCACHE_DISABLE")) {
                cc_log("ccache is disabled");

Hence, avoid setting of $CCACHE_DISABLE instead of assigning '0'.

Unfortunately, bitbake has a similar behavior when evaluating 'export'
and 'unexport' flags so that this variable must be set in a python
function instead of declaring it in bitbake.conf.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/base.bbclass |    8 ++++++++
 meta/conf/bitbake.conf    |    3 ---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1f76023..9f9c803 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -309,6 +309,14 @@ do_build () {
 python () {
     import exceptions, string, re
 
+    # Disable ccache explicitly if CCACHE is null since gcc may be a
+    # symlink of ccache some distributions (e.g., Fedora 17). Please
+    # note that only the existence of $CCACHE_DISABLE matters; the
+    # value is ignored.
+    if d.getVar('CCACHE', True) == '':
+        d.setVar('CCACHE_DISABLE', True)
+        d.setVarFlag('CCACHE_DISABLE', 'export', True)
+
     # Handle PACKAGECONFIG
     #
     # These take the form:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a8a1665..1bb66ad 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -420,9 +420,6 @@ export PATH
 ##################################################################
 
 CCACHE ??= ""
-# Disable ccache explicitly if CCACHE is null since gcc may be a symlink
-# of ccache some distributions (e.g., Fedora 17).
-export CCACHE_DISABLE ??= "${@[0,1][d.getVar('CCACHE', True) == '']}"
 # Assign CCACHE_DIR a default value to fix a bug of ccache 3.1.7,
 # since it would always create CCACHE_DIR/.ccache even if
 # CCACHE_DISABLE = 1.
-- 
1.7.10.4



