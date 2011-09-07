Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R1Ohc-0007zB-0V
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 22:26:32 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R1Ocl-0002iG-8H
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 22:21:31 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 07 Sep 2011 21:20:12 +0100
Message-ID: <1315426812.4368.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: [PATCH] useradd.bbclass: use correct value for $D in postinst functions
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
X-List-Received-Date: Wed, 07 Sep 2011 20:26:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This corrects the location of the password file used during package installation. 

See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/009183.html and subsequent discussion.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/classes/useradd.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 5f5b68d..1e03a04 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -15,8 +15,8 @@ SYSROOT=""
 
 if test "x$D" != "x"; then
 	# Installing into a sysroot
-	SYSROOT="${STAGING_DIR_TARGET}"
-	OPT="--root ${STAGING_DIR_TARGET}"
+	SYSROOT="$D"
+	OPT="--root $D"
 
 	# Add groups and users defined for all recipe packages
 	GROUPADD_PARAM="${@get_all_cmd_params(d, 'group')}"
@@ -79,7 +79,7 @@ useradd_sysroot () {
 
 	# Explicitly set $D since it isn't set to anything
 	# before do_install
-	D=${D}
+	D=${STAGING_DIR_TARGET}
 	useradd_preinst
 }
 
-- 
1.7.4.1





