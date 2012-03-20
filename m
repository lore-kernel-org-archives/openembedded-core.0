Received: from elite.brightsigndigital.co.uk ([81.142.160.137])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>) id 1SA2zF-0000Ly-Tt
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 18:36:46 +0100
Received: from [172.30.1.25] (helo=chuckie.brightsign)
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1SA2qg-0001SC-LO; Tue, 20 Mar 2012 17:27:54 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1SA2qg-0001CD-Ir; Tue, 20 Mar 2012 17:27:54 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 17:27:43 +0000
Message-Id: <1332264463-24439-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <20120319133731.GA4473@mcrowe.com>
References: <20120319133731.GA4473@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] libc-common: Apply Debian-naming to libc debug symbols too
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
X-List-Received-Date: Tue, 20 Mar 2012 17:36:46 -0000

Ensure that the eglibc-dbg package follows Debian naming too if
enabled. Retain backward compatibility with old libc-dbg naming.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/libc-common.bbclass        |    5 +++++
 meta/recipes-core/eglibc/eglibc_2.13.bb |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb |    1 +
 3 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
index 962f205..9b91f0a 100644
--- a/meta/classes/libc-common.bbclass
+++ b/meta/classes/libc-common.bbclass
@@ -27,4 +27,9 @@ python populate_packages_prepend () {
 		bpn = d.getVar('BPN', True)
 		d.setVar('PKG_'+bpn, 'libc6')
 		d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
+		d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
+		# For backward compatibility with old -dbg package
+		d.setVar('RPROVIDES_' + bpn + '-dbg', 'libc-dbg')
+		d.setVar('RCONFLICTS_' + bpn + '-dbg', 'libc-dbg')
+		d.setVar('RREPLACES_' + bpn + '-dbg', 'libc-dbg')
 }
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index e718a1f..a4f59b6 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r20"
+PR = "r21"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index b4c1ea5..3820f5a 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,6 +3,7 @@ require eglibc.inc
 SRCREV = "16540"
 
 DEPENDS += "gperf-native"
+PR = "r1"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
-- 
1.7.9



